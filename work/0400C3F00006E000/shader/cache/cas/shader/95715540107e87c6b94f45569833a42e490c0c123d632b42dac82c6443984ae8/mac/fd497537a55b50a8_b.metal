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
    float2 _480 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_480, float2(0.0), isnan(_480))).x;
    float2 _491 = float2(_65, _67);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float2 _507 = float2(_65, _67);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_507, float2(0.0), isnan(_507)), int2(0), component::x).xyzw;
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
    float2 _604 = float2(_148, _150);
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_604, float2(0.0), isnan(_604))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_604, float2(0.0), isnan(_604))).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float _162 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _164 = precise::min(_84, _90);
    float _166 = precise::min(_86, _88);
    float _168 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _162);
    float _170 = precise::max(_84, _90);
    float _172 = precise::max(_86, _88);
    float _174 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, _168);
    float _176 = precise::min(_164, _166);
    float _178 = precise::max(_170, _172);
    float _180 = precise::min(_174, _176);
    float _182 = precise::max(_174, _178);
    float _184 = _178 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _186 = -_180;
    float _188 = _186 + _182;
    float _190 = precise::max(_184, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _192 = -_67;
    float _194 = _192 + _150;
    float _196 = -_65;
    float _198 = _196 + _148;
    bool _202 = _188 > _190;
    float _204 = _194 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _206 = _198 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _208 = _204 * _204;
    float _210 = fma(_206, _206, _208);
    float _212 = _206;
    float _214 = _208;
    float _216 = _182;
    float _218 = _188;
    if (!_202)
    {
        _212 = _74;
    }
    float _220 = _212;
    float _222 = _220;
    if (!_202)
    {
        _214 = _76;
    }
    float _224 = _214;
    float _226 = _224;
    if (!_202)
    {
        _216 = _78;
    }
    float _228 = _216;
    float _230 = _228;
    if (!_202)
    {
        _218 = _80;
    }
    float _232 = _218;
    bool _234 = !_202;
    float _236 = _232;
    if (!_234)
    {
        float _238 = _88 + _90;
        float _240 = -_88;
        float _242 = _84 + _240;
        float _244 = -_90;
        float _246 = _86 + _244;
        float _248 = _84 + _238;
        float _250 = _242 + _246;
        float _252 = -_246;
        float _254 = _242 + _252;
        float _256 = _86 + _248;
        float _258 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _260 = abs(_250);
        float _262 = abs(_254);
        float _264 = precise::min(_260, _262);
        float _266 = fma(_256, _258, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _268 = precise::max(_266, _264);
        float _270 = 1.0 / _268;
        float _272 = _250 * _270;
        float _274 = _254 * _270;
        float _276 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _278 = precise::max(_272, _276);
        float _280 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _282 = precise::max(_274, _280);
        float _284 = precise::min(_278, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _286 = precise::min(_282, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _288 = -_284;
        float _290 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _292 = -_284;
        float _294 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[1].z, _65);
        float _296 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[1].z, _65);
        float _298 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _300 = -_286;
        float _302 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float _304 = -_286;
        float _306 = fma(_304, (*spvDescriptorSet0.fp_c3)._m0[1].w, _67);
        float _308 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].w, _67);
        float _310 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float2 _862 = float2(_290, _302);
        float4 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_862, float2(0.0), isnan(_862))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_862, float2(0.0), isnan(_862))).xyzw;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float _320 = _312.w;
        float2 _878 = float2(_294, _306);
        float4 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_878, float2(0.0), isnan(_878))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_878, float2(0.0), isnan(_878))).xyzw;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = _322.w;
        float2 _894 = float2(_296, _308);
        float4 _332 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_894, float2(0.0), isnan(_894))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_894, float2(0.0), isnan(_894))).xyzw;
        float _334 = _332.x;
        float _336 = _332.y;
        float _338 = _332.z;
        float _340 = _332.w;
        float2 _910 = float2(_298, _310);
        float4 _342 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_910, float2(0.0), isnan(_910))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_910, float2(0.0), isnan(_910))).xyzw;
        float _344 = _342.x;
        float _346 = _342.y;
        float _348 = _342.z;
        float _350 = _342.w;
        float _352 = _316 + _326;
        float _354 = _318 + _328;
        float _356 = _314 + _324;
        float _358 = _320 + _330;
        float _360 = _336 + _352;
        float _362 = _338 + _354;
        float _364 = _334 + _356;
        float _366 = _340 + _358;
        float _368 = _346 + _360;
        float _370 = _348 + _362;
        float _372 = _344 + _364;
        float _374 = _350 + _366;
        float _376 = _368 * 0.25;
        float _378 = _370 * 0.25;
        float _380 = _372 * 0.25;
        float _382 = _374 * 0.25;
        float _384 = -_376;
        float _386 = _76 + _384;
        float _388 = -_378;
        float _390 = _78 + _388;
        float _392 = -_380;
        float _394 = _74 + _392;
        float _396 = -_382;
        float _398 = _80 + _396;
        float _400 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[5].x, _376);
        float _402 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[5].x, _378);
        float _404 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[5].x, _380);
        float _406 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[5].x, _382);
        _222 = _404;
        _230 = _402;
        _236 = _406;
        _226 = _400;
    }
    float _408 = _222;
    float _410 = _230;
    float _412 = _236;
    float _414 = _226;
    float _416 = sqrt(_210);
    float _418 = -_408;
    float _420 = _154 + _418;
    float _422 = -_410;
    float _424 = _158 + _422;
    float _426 = -_412;
    float _428 = _160 + _426;
    float _430 = 0.0 + _416;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = fma(_432, -0.5, 0.5);
    float _436 = -_414;
    float _438 = _156 + _436;
    float _440 = fma(_434, _420, _408);
    float _442 = fma(_434, _438, _414);
    float _444 = fma(_434, _424, _410);
    float _446 = fma(_434, _428, _412);
    out.m_42.x = _440;
    out.m_42.y = _442;
    out.m_42.z = _444;
    out.m_42.w = _446;
    return out;
}

