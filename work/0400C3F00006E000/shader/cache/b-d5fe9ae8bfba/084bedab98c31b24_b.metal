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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_42 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _62 = gl_FragCoord.w;
    float _64 = in.m_40.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _72 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _70;
    float _74 = in.m_40.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _82 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _72 * _72;
    float _92 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _94 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _92;
    float _96 = in.m_40.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = fma(_82, _82, _90);
    float _104 = fma(_94, _94, _102);
    float _106 = sqrt(_104);
    float _108 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _110 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _108;
    float _112 = 1.0 / _110;
    float _114 = precise::max(_106, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _116 = 1.0 / _62;
    float _118 = precise::min(_114, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _120 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _122 = _118 + _120;
    float _124 = _122 * _112;
    float _126 = _124 * 3.0;
    float _128 = _116 * _68;
    float _130 = _116 * _78;
    float _132 = _116 * _88;
    float _134 = _116 * _100;
    float _136 = floor(_126);
    float2 _640 = float2(_128, _132);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_640, float2(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_640, float2(0.0), isnan(_640))).w;
    float _140 = rint(_136);
    float _142 = precise::max(_140, 0.0);
    uint _145 = uint(_142);
    uint _147 = clamp(_145, 0u, 65535u);
    float3 _665 = float3(_134, _130, float(int(_147)));
    float3 _669 = select(_665, float3(0.0), isnan(_665));
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _669.xy, uint(rint(_669.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _669.xy, uint(rint(_669.z))).w;
    float _151 = in.m_42.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_42.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_42.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_44.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = (*spvDescriptorSet0.fp_c10)._m0[10].x * (*spvDescriptorSet0.fp_c10)._m0[10].x;
    float _177 = fma((*spvDescriptorSet0.fp_c10)._m0[8].x, (*spvDescriptorSet0.fp_c10)._m0[8].x, _175);
    float _179 = rsqrt(_177);
    float _181 = _116 * _155;
    float _183 = _116 * _161;
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _187 = _185 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _191 = (*spvDescriptorSet0.fp_c10)._m0[8].w + _189;
    float _193 = -_181;
    float _195 = _193 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _197 = -_183;
    float _199 = _197 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _201 = _187 * _187;
    float _203 = _179 * (*spvDescriptorSet0.fp_c10)._m0[10].x;
    float _205 = _195 * _195;
    float _207 = _116 * _167;
    float _209 = fma(_191, _191, _201);
    float _211 = in.m_46.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = fma(_199, _199, _205);
    float _219 = -_207;
    float _221 = _219 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _223 = _179 * (*spvDescriptorSet0.fp_c10)._m0[8].x;
    float _225 = rsqrt(_209);
    float _227 = fma(_221, _221, _217);
    float _229 = sqrt(_227);
    float _231 = _187 * _225;
    float _233 = _191 * _225;
    float _235 = _231 * _203;
    float _237 = precise::max(_229, 10.0);
    float _239 = fma(_233, _223, _235);
    float _241 = precise::min(_237, 18.0);
    bool _245 = _106 >= (*spvDescriptorSet0.fp_c9)._m0[191].x;
    bool _247 = isnan(_106);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.fp_c9)._m0[191].x);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    bool _257 = _106 < (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _259 = float(_257);
    float _261 = fma(_241, 0.125, -1.25);
    float _263 = precise::max(_239, -0.20000000298023223876953125);
    float _265 = precise::min(_263, 0.20000000298023223876953125);
    float _267 = -_181;
    float _269 = _267 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _271 = -_183;
    float _273 = _271 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _275 = _269 * _269;
    float _277 = -_207;
    float _279 = _277 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _281 = fma(_273, _273, _275);
    float _283 = in.m_48.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = fma(_279, _279, _281);
    float _291 = in.m_46.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = sqrt(_289);
    float _299 = precise::max(0.0, _297);
    float _301 = precise::min(_299, 15.0);
    float _303 = fma(_149, _255, _138);
    float _305 = _303 * _261;
    float _307 = _305 * _259;
    float _309 = _116 * _215;
    float _311 = fma(_265, 2.5, 0.5);
    float _313 = _309 * _307;
    float _315 = _313 * _311;
    float _317 = _116 * _173;
    float _319 = 0.0 + _315;
    float _321 = precise::clamp(_319, 0.0, 1.0);
    float _323 = _321 * _317;
    bool _325 = _323 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _327 = isnan(_323);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _333 = _329 || _331;
    if (!_333)
    {
        discard_fragment();
    }
    float _335 = _116 * _295;
    float _337 = _116 * _287;
    float _339 = _301 * 0.066666670143604278564453125;
    float _341 = in.m_48.y;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = precise::max(_229, 50.0);
    float _349 = -_335;
    float _351 = _349 + _337;
    float _353 = precise::min(_347, 120.0);
    float _355 = fma(_339, _351, _335);
    float _357 = in.m_46.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = _116 * _361;
    float _365 = _116 * _345;
    float _367 = in.m_48.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = -_363;
    float _375 = _373 + _365;
    float _377 = fma(_339, _375, _363);
    float _379 = in.m_46.z;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = _116 * _383;
    float _387 = _116 * _371;
    float _389 = -_385;
    float _391 = _389 + _387;
    float _393 = fma(_339, _391, _385);
    float _395 = fma(_353, 0.014285714365541934967041015625, -0.71428573131561279296875);
    float _397 = _355 * _395;
    float _399 = _377 * _395;
    float _401 = _393 * _395;
    if (!_333)
    {
        out.m_51.x = _397;
        out.m_51.y = _399;
        out.m_51.z = _401;
        out.m_51.w = _315;
        return out;
    }
    float _403 = _399 * 0.715200006961822509765625;
    float _405 = in.m_53.w;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_53.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_53.x;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = fma(_397, 0.2125999927520751953125, _403);
    float _425 = in.m_53.y;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = 0.0 + _323;
    float _433 = precise::clamp(_431, 0.0, 1.0);
    float _435 = fma(_401, 0.072200000286102294921875, _423);
    bool _437 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _439 = 1.0 / _435;
    float _441 = _439 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    float _445 = fma(_443, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _447 = _116 * _409;
    float _449 = _116 * _415;
    float _451 = _445 * _447;
    float _453 = _116 * _421;
    float _455 = _116 * _429;
    float _457 = fma(_401, _451, _449);
    float _459 = fma(_397, _451, _453);
    float _461 = fma(_399, _451, _455);
    float _463 = _449;
    if (!_437)
    {
        _463 = _433;
    }
    float _465 = _463;
    bool _467 = !_437;
    float _469 = _465;
    if (!_467)
    {
        float _471 = in.m_55.w;
        float _473 = gl_FragCoord.w;
        float _475 = _471 * _473;
        float _477 = in.m_55.z;
        float _479 = gl_FragCoord.w;
        float _481 = _477 * _479;
        float _483 = _116 * _475;
        float _485 = _116 * _481;
        float _487 = 1.0 / _483;
        float _489 = _485 * _487;
        float _491 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _493 = fma(_489, (*spvDescriptorSet0.fp_c8)._m0[30].w, _491);
        float _495 = 1.0 / _493;
        float _497 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _499 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _501 = fma(_495, _497, _499);
        float _503 = _501 * 8.0;
        float _505 = precise::clamp(_503, 0.0, 1.0);
        float _507 = _433 * _505;
        _469 = _507;
    }
    float _509 = _469;
    float _511 = 0.0 + _509;
    float _513 = precise::clamp(_511, 0.0, 1.0);
    out.m_51.x = _459;
    out.m_51.y = _461;
    out.m_51.z = _457;
    out.m_51.w = _513;
    return out;
}

