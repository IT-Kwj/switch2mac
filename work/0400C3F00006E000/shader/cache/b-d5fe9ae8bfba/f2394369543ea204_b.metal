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
    float4 m_43 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
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
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _57;
    float _79 = _77 * _63;
    float _81 = _77 * _69;
    float _83 = _77 * _75;
    float _85 = 1.0 / _79;
    float _87 = _81 * _85;
    float _89 = _83 * _85;
    float2 _505 = float2(_89, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_505, float2(0.0), isnan(_505))).x;
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
    float _129 = in.m_39.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_33.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _77 * _97;
    float _143 = _77 * _103;
    float _145 = _77 * _109;
    float _147 = _77 * _115;
    float _149 = _141 * _141;
    float _151 = fma(_143, _143, _149);
    float _153 = fma(_145, _145, _151);
    float _155 = _77 * _121;
    float _157 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _159 = _147 + _157;
    float _161 = _77 * _127;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _165 = _155 + _163;
    float _167 = rsqrt(_153);
    float _169 = _159 * _159;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _173 = _161 + _171;
    float _175 = in.m_41.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = fma(_165, _165, _169);
    float _183 = fma(_173, _173, _181);
    float _185 = rsqrt(_183);
    float _187 = _141 * _167;
    float _189 = _143 * _167;
    float _191 = _145 * _167;
    float _193 = _187 * _187;
    float _195 = in.m_43.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = fma(_189, _189, _193);
    float _203 = fma(_191, _191, _201);
    float _205 = _159 * _185;
    float _207 = _165 * _185;
    float _209 = _173 * _185;
    float _211 = rsqrt(_203);
    float _213 = _187 * _211;
    float _215 = _191 * _211;
    float _217 = _77 * _139;
    float _219 = _205 * _213;
    float _221 = _189 * _211;
    float _223 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _225 = fma(_207, _221, _219);
    float _227 = _77 * _133;
    float _229 = in.m_45.x;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = fma(_209, _215, _225);
    float _237 = _227 * _227;
    float _239 = _217 * _85;
    float _241 = _235 * _235;
    float _243 = _77 * _179;
    float _245 = _77 * _199;
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _249 = fma(_239, (*spvDescriptorSet0.fp_c8)._m0[30].w, _247);
    float _251 = _241 * _237;
    float _253 = _243 * _251;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = 1.0 / _249;
    float _259 = _245 * _255;
    float _261 = 0.0 + _259;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _267 = _257 * _265;
    float _269 = in.m_41.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_41.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_41.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _77 * _273;
    float _289 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _291 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[30].w, _289);
    float _293 = 1.0 / _291;
    float _295 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _297 = -_267;
    float _299 = fma(_293, _295, _297);
    float _301 = _299 * _223;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = _77 * _233;
    float _307 = _263 * _303;
    float _309 = _307 * _305;
    bool _313 = _309 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _315 = isnan(_309);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _321 = _317 || _319;
    float _323 = in.m_43.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_43.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_43.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = _267;
    float _343 = _309;
    if (!_321)
    {
        discard_fragment();
    }
    float _345 = _77 * _279;
    float _347 = _77 * _285;
    float _349 = _77 * _327;
    float _351 = _77 * _333;
    float _353 = _77 * _339;
    float _355 = -_349;
    float _357 = _355 + _287;
    float _359 = -_351;
    float _361 = _359 + _345;
    float _363 = -_353;
    float _365 = _363 + _347;
    float _367 = fma(_251, _357, _349);
    float _369 = fma(_251, _361, _351);
    float _371 = fma(_251, _365, _353);
    if (!_321)
    {
        out.m_48.x = _367;
        out.m_48.y = _369;
        out.m_48.z = _371;
        out.m_48.w = _259;
        return out;
    }
    float _373 = _369 * 0.715200006961822509765625;
    float _375 = in.m_50.w;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_50.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_50.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = fma(_367, 0.2125999927520751953125, _373);
    float _395 = in.m_50.z;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = fma(_371, 0.072200000286102294921875, _393);
    bool _403 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _405 = 1.0 / _401;
    if (_403)
    {
        float _407 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _409 = _267 + _407;
        _341 = _409;
    }
    float _411 = _341;
    float _413 = _405 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = fma(_415, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _419 = _77 * _379;
    float _421 = _77 * _385;
    float _423 = _417 * _419;
    float _425 = 0.0 + _309;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = _427;
    if (_403)
    {
        float _431 = _411 * 8.0;
        float _433 = precise::clamp(_431, 0.0, 1.0);
        _343 = _433;
    }
    float _435 = _343;
    float _437 = _77 * _391;
    float _439 = _77 * _399;
    float _441 = fma(_367, _423, _421);
    if (_403)
    {
        float _443 = _427 * _435;
        _429 = _443;
    }
    float _445 = _429;
    float _447 = fma(_369, _423, _437);
    float _449 = fma(_371, _423, _439);
    float _451 = 0.0 + _445;
    float _453 = precise::clamp(_451, 0.0, 1.0);
    out.m_48.x = _441;
    out.m_48.y = _447;
    out.m_48.z = _449;
    out.m_48.w = _453;
    return out;
}

