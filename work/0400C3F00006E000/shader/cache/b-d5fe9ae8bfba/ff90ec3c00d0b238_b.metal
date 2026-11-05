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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _59;
    float _93 = _91 * _65;
    float _95 = _91 * _71;
    float _97 = _91 * _77;
    float _99 = 1.0 / _93;
    float _101 = _95 * _99;
    float _103 = _97 * _99;
    float _105 = _91 * _83;
    float _107 = _91 * _89;
    float2 _513 = float2(_101, _103);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_513, float2(0.0), isnan(_513))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_513, float2(0.0), isnan(_513))).x;
    float2 _524 = float2(_105, _107);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_524, float2(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_524, float2(0.0), isnan(_524))).w;
    float _113 = in.m_39.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_39.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_39.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_41.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_43.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _91 * _117;
    float _145 = _91 * _123;
    float _147 = in.m_35.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = _143 * _143;
    float _155 = fma(_145, _145, _153);
    float _157 = _91 * _129;
    float _159 = fma(_157, _157, _155);
    float _161 = sqrt(_159);
    float _163 = _91 * _151;
    float _165 = 0.0 + _161;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = in.m_45.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _163 * _99;
    float _177 = _167 * 2.0;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _181 = fma(_175, (*spvDescriptorSet0.fp_c8)._m0[30].w, _179);
    float _183 = precise::max(_177, 0.60000002384185791015625);
    float _185 = precise::max(_177, 0.300000011920928955078125);
    float _187 = precise::min(_183, 0.800000011920928955078125);
    float _189 = 1.0 / _181;
    float _191 = precise::min(_185, 0.800000011920928955078125);
    float _193 = fma(_187, 5.000000476837158203125, -3.000000476837158203125);
    float _195 = fma(_191, 2.0, -0.60000002384185791015625);
    float _197 = _195 * _195;
    float _199 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _201 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[30].w, _199);
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _205 = _189 * _203;
    float _207 = in.m_47.w;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = 1.0 / _201;
    float _215 = fma(_111, _197, _205);
    float _217 = _193 + _111;
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _221 = -_215;
    float _223 = fma(_213, _219, _221);
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _91 * _173;
    float _229 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _231 = fma(_225, -2.0, 1.0);
    float _233 = _227 * _217;
    float _235 = _91 * _135;
    float _237 = abs(_231);
    float _239 = -_237;
    float _241 = _239 + 1.0;
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _245 = -_205;
    float _247 = fma(_213, _243, _245);
    float _249 = _235 * _233;
    float _251 = _241 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _253 = _91 * _211;
    float _255 = fma(_197, _249, _251);
    float _257 = _253 * _253;
    float _259 = _247 * _229;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = _91 * _141;
    float _265 = _257 * _255;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = _267 * _261;
    float _271 = _269 * _263;
    bool _275 = _271 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _277 = isnan(_271);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _283 = _279 || _281;
    float _285 = in.m_41.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = _205;
    if (!_283)
    {
        discard_fragment();
    }
    float _293 = _193 * _257;
    float _295 = in.m_41.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_41.y;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = -_293;
    float _309 = _307 + 1.0;
    float _311 = _91 * _289;
    float _313 = _311 * _309;
    float _315 = in.m_45.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = _91 * _299;
    float _323 = _91 * _305;
    float _325 = _323 * _309;
    float _327 = _321 * _309;
    float _329 = _91 * _319;
    float _331 = fma(_293, _329, _313);
    float _333 = in.m_45.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = _91 * _337;
    float _341 = fma(_293, _339, _325);
    float _343 = in.m_45.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = _91 * _347;
    float _351 = fma(_293, _349, _327);
    float _353 = fma(_331, _251, _331);
    float _355 = fma(_341, _251, _341);
    float _357 = fma(_351, _251, _351);
    if (!_283)
    {
        out.m_50.x = _353;
        out.m_50.y = _355;
        out.m_50.z = _357;
        out.m_50.w = _267;
        return out;
    }
    float _359 = _355 * 0.715200006961822509765625;
    float _361 = in.m_52.w;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_52.x;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_52.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = fma(_353, 0.2125999927520751953125, _359);
    float _381 = in.m_52.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = fma(_357, 0.072200000286102294921875, _379);
    bool _389 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _391 = 1.0 / _387;
    float _393 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_389)
    {
        float _395 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _397 = _205 + _395;
        _291 = _397;
    }
    float _399 = _291;
    float _401 = _391 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = fma(_403, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _407 = _91 * _365;
    if (_389)
    {
        float _409 = _399 * 8.0;
        float _411 = precise::clamp(_409, 0.0, 1.0);
        _393 = _411;
    }
    float _413 = _393;
    float _415 = _91 * _377;
    float _417 = _405 * _407;
    float _419 = 0.0 + _271;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = _91 * _371;
    float _425 = _91 * _385;
    float _427 = fma(_355, _417, _415);
    float _429 = _421;
    if (_389)
    {
        float _431 = _421 * _413;
        _429 = _431;
    }
    float _433 = _429;
    float _435 = fma(_353, _417, _423);
    float _437 = fma(_357, _417, _425);
    float _439 = 0.0 + _433;
    float _441 = precise::clamp(_439, 0.0, 1.0);
    out.m_50.x = _435;
    out.m_50.y = _427;
    out.m_50.z = _437;
    out.m_50.w = _441;
    return out;
}

