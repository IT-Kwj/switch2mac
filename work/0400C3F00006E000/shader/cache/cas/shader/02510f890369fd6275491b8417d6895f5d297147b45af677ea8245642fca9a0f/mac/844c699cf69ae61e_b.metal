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
    float2 _494 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_494, float2(0.0), isnan(_494))).x;
    float2 _505 = float2(_65, _67);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_505, float2(0.0), isnan(_505))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float2 _521 = float2(_65, _67);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_521, float2(0.0), isnan(_521)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_37.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_37.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_37.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_39.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _63 * _96;
    float _130 = _63 * _102;
    float _132 = _63 * _108;
    float _134 = _63 * _114;
    float _136 = _63 * _120;
    float _138 = _63 * _126;
    float _140 = -_69;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _144 = _140 + _142;
    float _146 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _148 = _138 * _146;
    float _150 = _134 * _146;
    float _152 = _136 * _146;
    float _154 = fma(_130, _144, _148);
    float _156 = fma(_128, _144, _150);
    float _158 = fma(_132, _144, _152);
    float _160 = 1.0 / _154;
    float _162 = _156 * _160;
    float _164 = _158 * _160;
    float2 _644 = float2(_162, _164);
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_644, float2(0.0), isnan(_644))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_644, float2(0.0), isnan(_644))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float _176 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _178 = precise::min(_84, _90);
    float _180 = precise::min(_86, _88);
    float _182 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _176);
    float _184 = precise::max(_84, _90);
    float _186 = precise::max(_86, _88);
    float _188 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, _182);
    float _190 = precise::min(_178, _180);
    float _192 = precise::max(_184, _186);
    float _194 = precise::min(_188, _190);
    float _196 = precise::max(_188, _192);
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _200 = -_194;
    float _202 = _200 + _196;
    float _204 = precise::max(_198, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _206 = -_67;
    float _208 = _206 + _164;
    float _210 = -_65;
    float _212 = _210 + _162;
    bool _216 = _202 > _204;
    float _218 = _208 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _220 = _212 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _222 = _218 * _218;
    float _224 = fma(_220, _220, _222);
    float _226 = _220;
    float _228 = _222;
    float _230 = _196;
    float _232 = _202;
    if (!_216)
    {
        _226 = _74;
    }
    float _234 = _226;
    float _236 = _234;
    if (!_216)
    {
        _228 = _76;
    }
    float _238 = _228;
    float _240 = _238;
    if (!_216)
    {
        _230 = _78;
    }
    float _242 = _230;
    float _244 = _242;
    if (!_216)
    {
        _232 = _80;
    }
    float _246 = _232;
    bool _248 = !_216;
    float _250 = _246;
    if (!_248)
    {
        float _252 = _88 + _90;
        float _254 = -_88;
        float _256 = _84 + _254;
        float _258 = -_90;
        float _260 = _86 + _258;
        float _262 = _84 + _252;
        float _264 = _256 + _260;
        float _266 = -_260;
        float _268 = _256 + _266;
        float _270 = _86 + _262;
        float _272 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _274 = abs(_264);
        float _276 = abs(_268);
        float _278 = precise::min(_274, _276);
        float _280 = fma(_270, _272, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _282 = precise::max(_280, _278);
        float _284 = 1.0 / _282;
        float _286 = _264 * _284;
        float _288 = _268 * _284;
        float _290 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _292 = precise::max(_286, _290);
        float _294 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _296 = precise::max(_288, _294);
        float _298 = precise::min(_292, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _300 = precise::min(_296, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _302 = -_298;
        float _304 = fma(_302, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _306 = -_298;
        float _308 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[1].z, _65);
        float _310 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[1].z, _65);
        float _312 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[1].x, _65);
        float _314 = -_300;
        float _316 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float _318 = -_300;
        float _320 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[1].w, _67);
        float _322 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[1].w, _67);
        float _324 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[1].y, _67);
        float2 _900 = float2(_304, _316);
        float4 _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_900, float2(0.0), isnan(_900))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_900, float2(0.0), isnan(_900))).xyzw;
        float _328 = _326.x;
        float _330 = _326.y;
        float _332 = _326.z;
        float _334 = _326.w;
        float2 _916 = float2(_308, _320);
        float4 _336 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_916, float2(0.0), isnan(_916))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_916, float2(0.0), isnan(_916))).xyzw;
        float _338 = _336.x;
        float _340 = _336.y;
        float _342 = _336.z;
        float _344 = _336.w;
        float2 _932 = float2(_310, _322);
        float4 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_932, float2(0.0), isnan(_932))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_932, float2(0.0), isnan(_932))).xyzw;
        float _348 = _346.x;
        float _350 = _346.y;
        float _352 = _346.z;
        float _354 = _346.w;
        float2 _948 = float2(_312, _324);
        float4 _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_948, float2(0.0), isnan(_948))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_948, float2(0.0), isnan(_948))).xyzw;
        float _358 = _356.x;
        float _360 = _356.y;
        float _362 = _356.z;
        float _364 = _356.w;
        float _366 = _330 + _340;
        float _368 = _332 + _342;
        float _370 = _328 + _338;
        float _372 = _334 + _344;
        float _374 = _350 + _366;
        float _376 = _352 + _368;
        float _378 = _348 + _370;
        float _380 = _354 + _372;
        float _382 = _360 + _374;
        float _384 = _362 + _376;
        float _386 = _358 + _378;
        float _388 = _364 + _380;
        float _390 = _382 * 0.25;
        float _392 = _384 * 0.25;
        float _394 = _386 * 0.25;
        float _396 = _388 * 0.25;
        float _398 = -_390;
        float _400 = _76 + _398;
        float _402 = -_392;
        float _404 = _78 + _402;
        float _406 = -_394;
        float _408 = _74 + _406;
        float _410 = -_396;
        float _412 = _80 + _410;
        float _414 = fma(_400, (*spvDescriptorSet0.fp_c3)._m0[5].x, _390);
        float _416 = fma(_404, (*spvDescriptorSet0.fp_c3)._m0[5].x, _392);
        float _418 = fma(_408, (*spvDescriptorSet0.fp_c3)._m0[5].x, _394);
        float _420 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[5].x, _396);
        _236 = _418;
        _244 = _416;
        _250 = _420;
        _240 = _414;
    }
    float _422 = _236;
    float _424 = _244;
    float _426 = _250;
    float _428 = _240;
    float _430 = sqrt(_224);
    float _432 = -_422;
    float _434 = _168 + _432;
    float _436 = -_424;
    float _438 = _172 + _436;
    float _440 = -_426;
    float _442 = _174 + _440;
    float _444 = 0.0 + _430;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    float _448 = fma(_446, -0.5, 0.5);
    float _450 = -_428;
    float _452 = _170 + _450;
    float _454 = fma(_448, _434, _422);
    float _456 = fma(_448, _452, _428);
    float _458 = fma(_448, _438, _424);
    float _460 = fma(_448, _442, _426);
    out.m_42.x = _454;
    out.m_42.y = _456;
    out.m_42.z = _458;
    out.m_42.w = _460;
    return out;
}

