#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    sampler fp_t_tcb_10Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _57;
    float _79 = _77 * _63;
    float _81 = _77 * _69;
    float _83 = _77 * _75;
    float _85 = 1.0 / _79;
    float _87 = _81 * _85;
    float _89 = _83 * _85;
    float2 _491 = float2(_87, _89);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_491, float2(0.0), isnan(_491))).x;
    float _93 = in.m_35.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_35.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_37.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_37.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_37.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _77 * _97;
    float _131 = _77 * _103;
    float _133 = _77 * _109;
    float _135 = _129 * _129;
    float _137 = _77 * _121;
    float _139 = in.m_33.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = fma(_131, _131, _135);
    float _147 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _149 = _137 + _147;
    float _151 = fma(_133, _133, _145);
    float _153 = _77 * _115;
    float _155 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _157 = _153 + _155;
    float _159 = rsqrt(_151);
    float _161 = _77 * _127;
    float _163 = _157 * _157;
    float _165 = in.m_39.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _173 = _161 + _171;
    float _175 = fma(_149, _149, _163);
    float _177 = fma(_173, _173, _175);
    float _179 = rsqrt(_177);
    float _181 = _129 * _159;
    float _183 = _131 * _159;
    float _185 = _133 * _159;
    float _187 = _181 * _181;
    float _189 = fma(_183, _183, _187);
    float _191 = in.m_41.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = fma(_185, _185, _189);
    float _199 = _157 * _179;
    float _201 = _149 * _179;
    float _203 = _173 * _179;
    float _205 = rsqrt(_197);
    float _207 = _77 * _143;
    float _209 = _207 * _85;
    float _211 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _213 = _181 * _205;
    float _215 = _185 * _205;
    float _217 = _199 * _213;
    float _219 = _183 * _205;
    float _221 = _77 * _169;
    float _223 = in.m_43.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = fma(_201, _219, _217);
    float _231 = fma(_203, _215, _229);
    float _233 = _221 * _221;
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _237 = fma(_209, (*spvDescriptorSet0.fp_c8)._m0[30].w, _235);
    float _239 = _231 * _231;
    float _241 = 1.0 / _237;
    float _243 = _239 * _233;
    float _245 = _77 * _195;
    float _247 = _245 * _243;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _253 = _241 * _251;
    float _255 = in.m_41.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_45.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_41.y;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_41.z;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = _77 * _265;
    float _281 = _77 * _277;
    float _283 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _285 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[30].w, _283);
    float _287 = 1.0 / _285;
    float _289 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _291 = -_253;
    float _293 = fma(_287, _289, _291);
    float _295 = _293 * _211;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _77 * _227;
    float _301 = _249 * _297;
    float _303 = _301 * _299;
    bool _307 = _303 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _309 = isnan(_303);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _315 = _311 || _313;
    float _317 = in.m_45.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_45.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = _253;
    if (!_315)
    {
        discard_fragment();
    }
    float _331 = _77 * _259;
    float _333 = _77 * _271;
    float _335 = -_279;
    float _337 = _335 + _331;
    float _339 = fma(_243, _337, _279);
    float _341 = _77 * _321;
    float _343 = _77 * _327;
    float _345 = -_341;
    float _347 = _345 + _333;
    float _349 = -_343;
    float _351 = _349 + _281;
    float _353 = fma(_243, _347, _341);
    float _355 = fma(_243, _351, _343);
    if (!_315)
    {
        out.m_48.x = _339;
        out.m_48.y = _353;
        out.m_48.z = _355;
        out.m_48.w = _249;
        return out;
    }
    float _357 = _353 * 0.715200006961822509765625;
    float _359 = in.m_50.w;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_50.x;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_50.y;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = fma(_339, 0.2125999927520751953125, _357);
    float _379 = in.m_50.z;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = fma(_355, 0.072200000286102294921875, _377);
    bool _387 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _389 = 1.0 / _385;
    float _391 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_387)
    {
        float _393 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _395 = _253 + _393;
        _329 = _395;
    }
    float _397 = _329;
    float _399 = _389 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = fma(_401, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _405 = _77 * _363;
    if (_387)
    {
        float _407 = _397 * 8.0;
        float _409 = precise::clamp(_407, 0.0, 1.0);
        _391 = _409;
    }
    float _411 = _391;
    float _413 = _77 * _375;
    float _415 = _403 * _405;
    float _417 = 0.0 + _303;
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = _77 * _369;
    float _423 = _77 * _383;
    float _425 = fma(_353, _415, _413);
    float _427 = _419;
    if (_387)
    {
        float _429 = _419 * _411;
        _427 = _429;
    }
    float _431 = _427;
    float _433 = fma(_339, _415, _421);
    float _435 = fma(_355, _415, _423);
    float _437 = 0.0 + _431;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    out.m_48.x = _433;
    out.m_48.y = _425;
    out.m_48.z = _435;
    out.m_48.w = _439;
    return out;
}

