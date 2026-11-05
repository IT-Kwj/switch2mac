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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _452 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_452, float2(0.0), isnan(_452))).x;
    float2 _463 = float2(_65, _67);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_463, float2(0.0), isnan(_463))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float2 _479 = float2(_65, _67);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_479, float2(0.0), isnan(_479)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_37.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_37.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_37.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _63 * _96;
    float _130 = _63 * _102;
    float _132 = _63 * _108;
    float _134 = _63 * _114;
    float _136 = _63 * _120;
    float _138 = _63 * _126;
    float _140 = fma(_130, _69, _128);
    float _142 = fma(_136, _69, _132);
    float _144 = fma(_138, _69, _134);
    float _146 = 1.0 / _140;
    float _148 = _142 * _146;
    float _150 = _144 * _146;
    float2 _576 = float2(_148, _150);
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_576, float2(0.0), isnan(_576))).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float _162 = -_67;
    float _164 = _162 + _150;
    float _166 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _168 = -_65;
    float _170 = _168 + _148;
    float _172 = _164 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _174 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _166);
    float _176 = precise::min(_84, _90);
    float _178 = _170 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _180 = precise::min(_86, _88);
    float _182 = _172 * _172;
    float _184 = precise::max(_84, _90);
    float _186 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, _174);
    float _188 = precise::max(_86, _88);
    float _190 = fma(_178, _178, _182);
    float _192 = precise::min(_176, _180);
    float _194 = precise::max(_184, _188);
    float _196 = precise::min(_186, _192);
    float _198 = sqrt(_190);
    float _200 = precise::max(_186, _194);
    float _202 = _194 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _204 = -_196;
    float _206 = _204 + _200;
    float _208 = precise::max(_202, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _212 = _206 > _208;
    float _214 = 0.0 + _198;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = fma(_216, -0.5, 0.5);
    float _220 = 0.5;
    float _222 = _206;
    float _224 = _78;
    float _226 = _74;
    if (!_212)
    {
        _220 = _78;
    }
    float _228 = _220;
    float _230 = _228;
    if (!_212)
    {
        _222 = _76;
    }
    float _232 = _222;
    float _234 = _232;
    if (!_212)
    {
        _224 = _80;
    }
    float _236 = _224;
    bool _238 = !_212;
    float _240 = _236;
    if (!_238)
    {
        float _242 = _88 + _90;
        float _244 = -_88;
        float _246 = _84 + _244;
        float _248 = -_90;
        float _250 = _86 + _248;
        float _252 = _84 + _242;
        float _254 = _246 + _250;
        float _256 = -_250;
        float _258 = _246 + _256;
        float _260 = _86 + _252;
        float _262 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _264 = abs(_254);
        float _266 = abs(_258);
        float _268 = precise::min(_264, _266);
        float _270 = fma(_260, _262, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _272 = precise::max(_270, _268);
        float _274 = 1.0 / _272;
        float _276 = _258 * _274;
        float _278 = _254 * _274;
        float _280 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _282 = precise::max(_276, _280);
        float _284 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _286 = precise::max(_278, _284);
        float _288 = precise::min(_282, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _290 = precise::min(_286, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _292 = -_288;
        float _294 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float _296 = -_288;
        float _298 = fma(_296, (*spvDescriptorSet0.fp_c3)._m0[1].w, _67);
        float _300 = -_290;
        float _302 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[1].z, _65);
        float _304 = -_290;
        float _306 = fma(_304, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _308 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[1].z, _65);
        float _310 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _312 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].w, _67);
        float _314 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float2 _836 = float2(_306, _294);
        float4 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_836, float2(0.0), isnan(_836))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_836, float2(0.0), isnan(_836))).xyzw;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float _324 = _316.w;
        float2 _852 = float2(_302, _298);
        float4 _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_852, float2(0.0), isnan(_852))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_852, float2(0.0), isnan(_852))).xyzw;
        float _328 = _326.x;
        float _330 = _326.y;
        float _332 = _326.z;
        float _334 = _326.w;
        float2 _868 = float2(_308, _312);
        float4 _336 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_868, float2(0.0), isnan(_868))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_868, float2(0.0), isnan(_868))).xyzw;
        float _338 = _336.x;
        float _340 = _336.y;
        float _342 = _336.z;
        float _344 = _336.w;
        float2 _884 = float2(_310, _314);
        float4 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_884, float2(0.0), isnan(_884))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_884, float2(0.0), isnan(_884))).xyzw;
        float _348 = _346.x;
        float _350 = _346.y;
        float _352 = _346.z;
        float _354 = _346.w;
        float _356 = _318 + _328;
        float _358 = _320 + _330;
        float _360 = _322 + _332;
        float _362 = _324 + _334;
        float _364 = _338 + _356;
        float _366 = _340 + _358;
        float _368 = _342 + _360;
        float _370 = _344 + _362;
        float _372 = _348 + _364;
        float _374 = _350 + _366;
        float _376 = _352 + _368;
        float _378 = _354 + _370;
        float _380 = _372 * 0.25;
        float _382 = _374 * 0.25;
        float _384 = _376 * 0.25;
        float _386 = _378 * 0.25;
        _226 = _380;
        _234 = _382;
        _230 = _384;
        _240 = _386;
    }
    float _388 = _226;
    float _390 = _234;
    float _392 = _230;
    float _394 = _240;
    float _396 = -_388;
    float _398 = _154 + _396;
    float _400 = -_390;
    float _402 = _156 + _400;
    float _404 = -_392;
    float _406 = _158 + _404;
    float _408 = -_394;
    float _410 = _160 + _408;
    float _412 = fma(_218, _398, _388);
    float _414 = fma(_218, _402, _390);
    float _416 = fma(_218, _406, _392);
    float _418 = fma(_218, _410, _394);
    out.m_42.x = _412;
    out.m_42.y = _414;
    out.m_42.z = _416;
    out.m_42.w = _418;
    return out;
}

