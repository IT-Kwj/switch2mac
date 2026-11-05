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
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_49 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_39.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_41.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_41.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _61;
    float _107 = _105 * _67;
    float _109 = _105 * _73;
    float _111 = _105 * _79;
    float _113 = _105 * _85;
    float _115 = _105 * _91;
    float _117 = _105 * _97;
    float _119 = 1.0 / _107;
    float _121 = _105 * _103;
    float _123 = _109 * _119;
    float _125 = _111 * _119;
    float2 _518 = float2(_123, _125);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_518, float2(0.0), isnan(_518))).x;
    float2 _529 = float2(_113, _117);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_529, float2(0.0), isnan(_529))).w;
    float2 _537 = float2(_121, _115);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_537, float2(0.0), isnan(_537))).w;
    float _133 = in.m_39.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_43.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_45.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _105 * _137;
    float _153 = in.m_47.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _151 * _119;
    float _161 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _165 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _163);
    float _167 = 1.0 / _165;
    float _169 = _105 * _149;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _173 = _167 * _171;
    float _175 = in.m_45.y;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _183 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[30].w, _181);
    float _185 = _129 * _131;
    float _187 = _105 * _143;
    float _189 = 1.0 / _183;
    float _191 = _187 * _185;
    float _193 = _169 * _191;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _199 = -_173;
    float _201 = fma(_189, _197, _199);
    float _203 = _201 * _161;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = _105 * _157;
    float _209 = _195 * _205;
    float _211 = _209 * _207;
    bool _215 = _211 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _217 = isnan(_211);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _223 = _219 || _221;
    float _225 = in.m_49.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_49.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _173;
    if (!_223)
    {
        discard_fragment();
    }
    float _239 = _105 * _229;
    float _241 = _105 * _235;
    float _243 = in.m_45.x;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = -_239;
    float _251 = _249 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _253 = -_241;
    float _255 = _253 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _257 = _251 * _251;
    float _259 = fma(_255, _255, _257);
    float _261 = in.m_49.z;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = _105 * _265;
    float _269 = -_267;
    float _271 = _269 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _273 = fma(_271, _271, _259);
    float _275 = _105 * _247;
    float _277 = in.m_43.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_43.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = sqrt(_273);
    bool _291 = _289 >= (*spvDescriptorSet0.fp_c9)._m0[194].w;
    bool _293 = isnan(_289);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.fp_c9)._m0[194].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = in.m_45.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = _105 * _281;
    float _311 = -_309;
    float _313 = _311 + _275;
    float _315 = fma(_301, _313, _309);
    float _317 = _105 * _287;
    float _319 = _105 * _179;
    float _321 = -_317;
    float _323 = _321 + _319;
    float _325 = fma(_301, _323, _317);
    float _327 = in.m_43.z;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = _105 * _307;
    float _335 = _105 * _331;
    float _337 = -_335;
    float _339 = _337 + _333;
    float _341 = fma(_301, _339, _335);
    if (!_223)
    {
        out.m_52.x = _315;
        out.m_52.y = _325;
        out.m_52.z = _341;
        out.m_52.w = _195;
        return out;
    }
    float _343 = _325 * 0.715200006961822509765625;
    float _345 = in.m_54.w;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_54.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_54.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = fma(_315, 0.2125999927520751953125, _343);
    float _365 = in.m_54.z;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = fma(_341, 0.072200000286102294921875, _363);
    bool _373 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _375 = 1.0 / _371;
    float _377 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_373)
    {
        float _379 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _381 = _173 + _379;
        _237 = _381;
    }
    float _383 = _237;
    float _385 = _375 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = fma(_387, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _391 = _105 * _349;
    if (_373)
    {
        float _393 = _383 * 8.0;
        float _395 = precise::clamp(_393, 0.0, 1.0);
        _377 = _395;
    }
    float _397 = _377;
    float _399 = _105 * _361;
    float _401 = _389 * _391;
    float _403 = 0.0 + _211;
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = _105 * _355;
    float _409 = _105 * _369;
    float _411 = fma(_325, _401, _399);
    float _413 = _405;
    if (_373)
    {
        float _415 = _405 * _397;
        _413 = _415;
    }
    float _417 = _413;
    float _419 = fma(_315, _401, _407);
    float _421 = fma(_341, _401, _409);
    float _423 = 0.0 + _417;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    out.m_52.x = _419;
    out.m_52.y = _411;
    out.m_52.z = _421;
    out.m_52.w = _425;
    return out;
}

