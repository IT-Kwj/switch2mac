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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_58 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_39.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_41.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_43.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_43.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _65;
    float _111 = _109 * _71;
    float _113 = _109 * _77;
    float _115 = _109 * _83;
    float _117 = _109 * _89;
    float _119 = _109 * _95;
    float _121 = _109 * _101;
    float _123 = 1.0 / _111;
    float _125 = _109 * _107;
    float _127 = _115 * _123;
    float _129 = _121 * _123;
    float2 _556 = float2(_113, _117);
    float2 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).xw;
    float _135 = _133.x;
    float _137 = _133.y;
    float2 _571 = float2(_127, _129);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_571, float2(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_571, float2(0.0), isnan(_571))).x;
    float2 _579 = float2(_125, _119);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_579, float2(0.0), isnan(_579))).w;
    float _143 = in.m_41.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_41.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _109 * _147;
    float _157 = _109 * _153;
    float _159 = fma(_135, 1.39999997615814208984375, _119);
    float2 _613 = float2(_125, _159);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_613, float2(0.0), isnan(_613))).w;
    float2 _621 = float2(_155, _157);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_621, float2(0.0), isnan(_621))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_621, float2(0.0), isnan(_621))).w;
    float _165 = in.m_45.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_45.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_45.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_47.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_47.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_47.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = _109 * _169;
    float _203 = _109 * _175;
    float _205 = _109 * _181;
    float _207 = _201 * _201;
    float _209 = in.m_39.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = fma(_203, _203, _207);
    float _217 = fma(_205, _205, _215);
    float _219 = rsqrt(_217);
    float _221 = _109 * _187;
    float _223 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _225 = _223 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _227 = 1.0 / _225;
    float _229 = _201 * _219;
    float _231 = _205 * _219;
    float _233 = in.m_49.w;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _221 * _229;
    float _241 = _109 * _193;
    float _243 = _203 * _219;
    float _245 = _109 * _199;
    float _247 = fma(_241, _243, _239);
    float _249 = _109 * _213;
    float _251 = in.m_51.w;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = fma(_245, _231, _247);
    float _259 = _249 * _123;
    float _261 = abs(_257);
    float _263 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _265 = _261 + _263;
    float _267 = _137 * _137;
    float _269 = _265 * _227;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _275 = fma(_259, (*spvDescriptorSet0.fp_c8)._m0[30].w, _273);
    float _277 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _279 = fma(_139, (*spvDescriptorSet0.fp_c8)._m0[30].w, _277);
    float _281 = fma(_141, _141, _267);
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = fma(_271, -2.0, 3.0);
    float _287 = _271 * _271;
    float _289 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _291 = _285 * _287;
    float _293 = in.m_53.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = 1.0 / _275;
    float _301 = 1.0 / _279;
    float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _305 = _299 * _303;
    float _307 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _309 = -_305;
    float _311 = fma(_301, _307, _309);
    float _313 = _311 * _289;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = in.m_49.z;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_49.y;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = -_283;
    float _331 = _329 + _161;
    float _333 = fma(_331, -0.60000002384185791015625, _283);
    float _335 = _109 * _237;
    float _337 = -_335;
    float _339 = fma(_333, _163, _337);
    float _341 = _109 * _255;
    float _343 = _339 * _341;
    float _345 = 0.0 + _343;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = _347 * _315;
    float _351 = _109 * _297;
    float _353 = _349 * _291;
    float _355 = _353 * _351;
    bool _359 = _355 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _361 = isnan(_355);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _367 = _363 || _365;
    float _369 = in.m_49.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = _305;
    if (!_367)
    {
        discard_fragment();
    }
    float _377 = _109 * _327;
    float _379 = _109 * _321;
    float _381 = _109 * _373;
    if (!_367)
    {
        out.m_56.x = _381;
        out.m_56.y = _377;
        out.m_56.z = _379;
        out.m_56.w = _343;
        return out;
    }
    float _383 = _377 * 0.715200006961822509765625;
    float _385 = in.m_58.w;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_58.x;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_58.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = fma(_381, 0.2125999927520751953125, _383);
    float _405 = in.m_58.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = fma(_379, 0.072200000286102294921875, _403);
    bool _413 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _415 = 1.0 / _411;
    float _417 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_413)
    {
        float _419 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _421 = _305 + _419;
        _375 = _421;
    }
    float _423 = _375;
    float _425 = _415 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = fma(_427, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _431 = _109 * _389;
    if (_413)
    {
        float _433 = _423 * 8.0;
        float _435 = precise::clamp(_433, 0.0, 1.0);
        _417 = _435;
    }
    float _437 = _417;
    float _439 = _109 * _401;
    float _441 = _429 * _431;
    float _443 = 0.0 + _355;
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = _109 * _395;
    float _449 = _109 * _409;
    float _451 = fma(_377, _441, _439);
    float _453 = _445;
    if (_413)
    {
        float _455 = _445 * _437;
        _453 = _455;
    }
    float _457 = _453;
    float _459 = fma(_381, _441, _447);
    float _461 = fma(_379, _441, _449);
    float _463 = 0.0 + _457;
    float _465 = precise::clamp(_463, 0.0, 1.0);
    out.m_56.x = _459;
    out.m_56.y = _451;
    out.m_56.z = _461;
    out.m_56.w = _465;
    return out;
}

