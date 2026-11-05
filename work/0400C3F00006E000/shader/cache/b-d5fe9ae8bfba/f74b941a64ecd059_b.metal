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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _459 = float2(_75, _77);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_459, float2(0.0), isnan(_459))).x;
    float _81 = in.m_39.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_39.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = _73 * _85;
    float _113 = _73 * _91;
    float _115 = 1.0 / _111;
    float _117 = _73 * _103;
    float _119 = _117 * _115;
    float _121 = fma(_79, 2.0, -1.0);
    float _123 = _73 * _97;
    float _125 = _73 * _109;
    float _127 = fma(_121, (*spvDescriptorSet0.fp_c9)._m0[191].y, _113);
    float _129 = fma(_121, (*spvDescriptorSet0.fp_c9)._m0[191].y, _123);
    float _131 = _125 * _115;
    float2 _547 = float2(_127, _129);
    float2 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).xw;
    float _137 = _135.x;
    float _139 = _135.y;
    float2 _559 = float2(_119, _131);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_559, float2(0.0), isnan(_559))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_559, float2(0.0), isnan(_559))).x;
    float _143 = in.m_41.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_39.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_43.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_41.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_45.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _73 * _147;
    float _175 = _73 * _153;
    float _177 = _173 * 1.66666662693023681640625;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _175 * _115;
    float _183 = _73 * _159;
    float _185 = fma(_179, -2.0, 3.0);
    float _187 = _179 * _179;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _191 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[30].w, _189);
    float _193 = _73 * _165;
    float _195 = in.m_47.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = _185 * _187;
    float _203 = _183 + (-1.0);
    float _205 = 1.0 / _191;
    float _207 = in.m_43.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = -_201;
    float _215 = _213 + 1.0;
    float _217 = _139 * _193;
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _221 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[30].w, _219);
    float _223 = fma(_201, _217, _203);
    float _225 = 1.0 / _221;
    float _227 = _223 * 2.0;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_229, -2.0, 3.0);
    float _233 = _229 * _229;
    float _235 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _237 = _231 * _233;
    float _239 = _193 * _237;
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _243 = _205 * _241;
    float _245 = _73 * _171;
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _249 = -_243;
    float _251 = fma(_225, _247, _249);
    float _253 = _245 * _239;
    float _255 = _251 * _235;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = 0.0 + _253;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = _73 * _199;
    float _265 = _261 * _257;
    float _267 = _265 * _263;
    bool _271 = _267 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _273 = isnan(_267);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _279 = _275 || _277;
    float _281 = in.m_45.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_43.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_45.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_43.y;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_45.z;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = _243;
    if (!_279)
    {
        discard_fragment();
    }
    float _313 = _73 * _211;
    float _315 = _137 * _215;
    float _317 = _73 * _285;
    float _319 = _73 * _291;
    float _321 = _73 * _297;
    float _323 = _73 * _303;
    float _325 = _73 * _309;
    float _327 = -_317;
    float _329 = _327 + _319;
    float _331 = -_321;
    float _333 = _331 + _323;
    float _335 = -_325;
    float _337 = _335 + _313;
    float _339 = fma(_315, _329, _317);
    float _341 = fma(_315, _333, _321);
    float _343 = fma(_315, _337, _325);
    if (!_279)
    {
        out.m_50.x = _339;
        out.m_50.y = _341;
        out.m_50.z = _343;
        out.m_50.w = _253;
        return out;
    }
    float _345 = _341 * 0.715200006961822509765625;
    float _347 = in.m_52.w;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_52.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_52.y;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = fma(_339, 0.2125999927520751953125, _345);
    float _367 = in.m_52.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = fma(_343, 0.072200000286102294921875, _365);
    bool _375 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _377 = 1.0 / _373;
    float _379 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_375)
    {
        float _381 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _383 = _243 + _381;
        _311 = _383;
    }
    float _385 = _311;
    float _387 = _377 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = fma(_389, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _393 = _73 * _351;
    if (_375)
    {
        float _395 = _385 * 8.0;
        float _397 = precise::clamp(_395, 0.0, 1.0);
        _379 = _397;
    }
    float _399 = _379;
    float _401 = _73 * _363;
    float _403 = _391 * _393;
    float _405 = 0.0 + _267;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    float _409 = _73 * _357;
    float _411 = _73 * _371;
    float _413 = fma(_341, _403, _401);
    float _415 = _407;
    if (_375)
    {
        float _417 = _407 * _399;
        _415 = _417;
    }
    float _419 = _415;
    float _421 = fma(_339, _403, _409);
    float _423 = fma(_343, _403, _411);
    float _425 = 0.0 + _419;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    out.m_50.x = _421;
    out.m_50.y = _413;
    out.m_50.z = _423;
    out.m_50.w = _427;
    return out;
}

