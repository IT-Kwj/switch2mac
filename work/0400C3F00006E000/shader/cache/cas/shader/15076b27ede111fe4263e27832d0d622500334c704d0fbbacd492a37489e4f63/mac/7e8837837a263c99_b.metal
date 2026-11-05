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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_39 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _477 = float2(_81, _79);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477))).x;
    float _85 = in.m_35.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = _77 * _89;
    float _99 = _77 * _95;
    float _101 = fma(_83, 0.300000011920928955078125, _97);
    float2 _514 = float2(_99, _101);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_514, float2(0.0), isnan(_514))).w;
    float _105 = in.m_37.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_37.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_37.z;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_39.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_39.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_39.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_41.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_43.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _155 = _153 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _157 = _77 * _109;
    float _159 = _77 * _115;
    float _161 = _77 * _121;
    float _163 = _157 * _157;
    float _165 = _77 * _127;
    float _167 = 1.0 / _155;
    float _169 = in.m_45.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = fma(_159, _159, _163);
    float _177 = fma(_161, _161, _175);
    float _179 = rsqrt(_177);
    float _181 = _157 * _179;
    float _183 = _161 * _179;
    float _185 = _165 * _181;
    float _187 = _77 * _133;
    float _189 = _159 * _179;
    float _191 = _77 * _139;
    float _193 = fma(_187, _189, _185);
    float _195 = in.m_47.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = fma(_191, _183, _193);
    float _203 = abs(_201);
    float _205 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _207 = _203 + _205;
    float _209 = _207 * _167;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _77 * _145;
    float _215 = fma(_211, -2.0, 3.0);
    float _217 = _211 * _211;
    float _219 = _77 * _151;
    float _221 = _215 * _217;
    float _223 = _77 * _173;
    float _225 = in.m_49.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_41.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_45.y;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_41.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_45.z;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_41.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _77 * _229;
    float _263 = _77 * _253;
    float _265 = -_213;
    float _267 = fma(_103, _219, _265);
    float _269 = _77 * _199;
    float _271 = _223 * _267;
    float _273 = 0.0 + _271;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = _275 * _221;
    float _279 = _277 * _269;
    bool _283 = _279 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _285 = isnan(_279);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _291 = _287 || _289;
    float _293 = in.m_45.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    if (!_291)
    {
        discard_fragment();
    }
    float _299 = _77 * _241;
    float _301 = _77 * _259;
    float _303 = -_263;
    float _305 = _303 + _301;
    float _307 = _77 * _297;
    float _309 = _77 * _235;
    float _311 = -_261;
    float _313 = _311 + _103;
    float _315 = _77 * _247;
    float _317 = -_307;
    float _319 = _317 + _309;
    float _321 = fma(_313, 0.5, _261);
    float _323 = -_299;
    float _325 = _323 + _315;
    float _327 = fma(_321, _319, _307);
    float _329 = fma(_321, _325, _299);
    float _331 = fma(_321, _305, _263);
    if (!_291)
    {
        out.m_52.x = _327;
        out.m_52.y = _329;
        out.m_52.z = _331;
        out.m_52.w = _271;
        return out;
    }
    float _333 = _329 * 0.715200006961822509765625;
    float _335 = in.m_54.w;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_54.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_54.x;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = fma(_327, 0.2125999927520751953125, _333);
    float _355 = in.m_54.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = fma(_331, 0.072200000286102294921875, _353);
    bool _363 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _365 = 1.0 / _361;
    float _367 = _365 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = _77 * _339;
    float _373 = fma(_369, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _375 = _77 * _345;
    float _377 = _373 * _371;
    float _379 = 0.0 + _279;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = _77 * _351;
    float _385 = _77 * _359;
    float _387 = fma(_331, _377, _375);
    float _389 = fma(_327, _377, _383);
    float _391 = fma(_329, _377, _385);
    float _393 = _375;
    if (!_363)
    {
        _393 = _381;
    }
    float _395 = _393;
    bool _397 = !_363;
    float _399 = _395;
    if (!_397)
    {
        float _401 = in.m_56.w;
        float _403 = gl_FragCoord.w;
        float _405 = _401 * _403;
        float _407 = in.m_56.z;
        float _409 = gl_FragCoord.w;
        float _411 = _407 * _409;
        float _413 = _77 * _405;
        float _415 = _77 * _411;
        float _417 = 1.0 / _413;
        float _419 = _415 * _417;
        float _421 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _423 = fma(_419, (*spvDescriptorSet0.fp_c8)._m0[30].w, _421);
        float _425 = 1.0 / _423;
        float _427 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _429 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _431 = fma(_425, _427, _429);
        float _433 = _431 * 8.0;
        float _435 = precise::clamp(_433, 0.0, 1.0);
        float _437 = _381 * _435;
        _399 = _437;
    }
    float _439 = _399;
    float _441 = 0.0 + _439;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    out.m_52.x = _389;
    out.m_52.y = _391;
    out.m_52.z = _387;
    out.m_52.w = _443;
    return out;
}

