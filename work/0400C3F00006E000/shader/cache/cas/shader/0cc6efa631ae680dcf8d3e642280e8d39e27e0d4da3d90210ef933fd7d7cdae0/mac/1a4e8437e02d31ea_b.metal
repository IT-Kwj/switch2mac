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
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_34 [[id(9)]];
    sampler fp_t_tcb_34Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_34Smplr_w [[id(16)]];
    sampler fp_t_tcb_CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_48 [[user(locn5), flat]];
    float4 m_60 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
    float4 m_50 [[user(locn8), flat]];
    float4 m_65 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_44.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_44.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _520 = float2(_88, _90);
    float2 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_520, float2(0.0), isnan(_520))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_520, float2(0.0), isnan(_520))).xy;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = in.m_46.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_46.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_46.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_48.x;
    float _120 = in.m_44.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_50.y;
    float _128 = in.m_44.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _86 * _104;
    float _136 = _86 * _110;
    float _138 = _86 * _116;
    float _140 = _118 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _142 = _118 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _144 = _86 * _124;
    float _146 = 1.0 / _134;
    float _148 = _86 * _132;
    float _150 = _136 * _146;
    float _152 = _138 * _146;
    float _154 = rint(_126);
    float _156 = precise::max(_154, 0.0);
    uint _159 = uint(_156);
    uint _161 = clamp(_159, 0u, 65535u);
    float _163 = fma(_142, _98, _144);
    float _165 = fma(_140, _96, _148);
    float2 _627 = float2(_150, _152);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_627, float2(0.0), isnan(_627))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_627, float2(0.0), isnan(_627))).x;
    float3 _638 = float3(_165, _163, float(int(_161)));
    float3 _642 = select(_638, float3(0.0), isnan(_638));
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _642.xy, uint(rint(_642.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _642.xy, uint(rint(_642.z))).w;
    float _171 = in.m_46.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_52.w;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_54.w;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _191 = _86 * _175;
    float _193 = _191 * _146;
    float _195 = in.m_56.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_193, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = 1.0 / _203;
    float _207 = in.m_58.x;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_60.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = _86 * _211;
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _223 = fma(_167, (*spvDescriptorSet0.fp_c8)._m0[30].w, _221);
    float _225 = _86 * _181;
    float _227 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _229 = _205 * _227;
    float _231 = 1.0 / _223;
    float _233 = -_225;
    float _235 = _169 + _233;
    float _237 = _86 * _187;
    float _239 = _237 * _235;
    float _241 = 0.0 + _239;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _247 = -_229;
    float _249 = fma(_231, _245, _247);
    float _251 = _249 * _189;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _86 * _199;
    float _257 = _243 * _253;
    float _259 = _257 * _255;
    bool _263 = _259 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _265 = isnan(_259);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _271 = _267 || _269;
    float _273 = in.m_50.w;
    float _275 = in.m_58.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _229;
    if (!_271)
    {
        discard_fragment();
    }
    float _283 = in.m_60.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = rint(_273);
    float _291 = precise::max(_289, 0.0);
    uint _293 = uint(_291);
    uint _295 = clamp(_293, 0u, 65535u);
    float _297 = _86 * _279;
    float _299 = _86 * _287;
    float _301 = _86 * _217;
    float3 _828 = float3(_219, _297, float(int(_295)));
    float3 _830 = select(_828, float3(0.0), isnan(_828));
    float3 _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, _830.xy, uint(rint(_830.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, _830.xy, uint(rint(_830.z))).xyz;
    float _307 = _305.x;
    float _309 = _305.y;
    float _311 = _305.z;
    float2 _842 = float2(_299, _301);
    float3 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_842, float2(0.0), isnan(_842))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_842, float2(0.0), isnan(_842))).xyz;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = in.m_52.x;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_52.y;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_54.x;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_54.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_52.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_54.z;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = -_307;
    float _359 = fma(_357, _307, 1.0);
    float _361 = -_309;
    float _363 = fma(_361, _309, 1.0);
    float _365 = -_311;
    float _367 = fma(_365, _311, 1.0);
    float _369 = _86 * _349;
    float _371 = fma(_315, _315, _359);
    float _373 = fma(_317, _317, _363);
    float _375 = _86 * _325;
    float _377 = _86 * _331;
    float _379 = _86 * _337;
    float _381 = _86 * _343;
    float _383 = _86 * _355;
    float _385 = fma(_319, _319, _367);
    float _387 = -_379;
    float _389 = _375 + _387;
    float _391 = -_381;
    float _393 = _377 + _391;
    float _395 = -_383;
    float _397 = _369 + _395;
    float _399 = fma(_371, _389, _379);
    float _401 = fma(_373, _393, _381);
    float _403 = fma(_385, _397, _383);
    if (!_271)
    {
        out.m_63.x = _399;
        out.m_63.y = _401;
        out.m_63.z = _403;
        out.m_63.w = _239;
        return out;
    }
    float _405 = _401 * 0.715200006961822509765625;
    float _407 = in.m_65.w;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_65.x;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_65.y;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = fma(_399, 0.2125999927520751953125, _405);
    float _427 = in.m_65.z;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = fma(_403, 0.072200000286102294921875, _425);
    bool _435 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _437 = 1.0 / _433;
    float _439 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_435)
    {
        float _441 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _443 = _229 + _441;
        _281 = _443;
    }
    float _445 = _281;
    float _447 = _437 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = fma(_449, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _453 = _86 * _411;
    if (_435)
    {
        float _455 = _445 * 8.0;
        float _457 = precise::clamp(_455, 0.0, 1.0);
        _439 = _457;
    }
    float _459 = _439;
    float _461 = _86 * _423;
    float _463 = _451 * _453;
    float _465 = 0.0 + _259;
    float _467 = precise::clamp(_465, 0.0, 1.0);
    float _469 = _86 * _417;
    float _471 = _86 * _431;
    float _473 = fma(_401, _463, _461);
    float _475 = _467;
    if (_435)
    {
        float _477 = _467 * _459;
        _475 = _477;
    }
    float _479 = _475;
    float _481 = fma(_399, _463, _469);
    float _483 = fma(_403, _463, _471);
    float _485 = 0.0 + _479;
    float _487 = precise::clamp(_485, 0.0, 1.0);
    out.m_63.x = _481;
    out.m_63.y = _473;
    out.m_63.z = _483;
    out.m_63.w = _487;
    return out;
}

