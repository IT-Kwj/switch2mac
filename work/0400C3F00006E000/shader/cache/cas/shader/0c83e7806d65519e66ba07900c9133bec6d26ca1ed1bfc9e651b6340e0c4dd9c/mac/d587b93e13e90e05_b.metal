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
    constant _16* vp_c3 [[id(0)]];
    texture2d<float> vp_t_tcb_8 [[id(1)]];
    sampler vp_t_tcb_8Smplr [[id(2)]];
    sampler vp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_27 [[attribute(0)]];
    float4 m_29 [[attribute(1)]];
    float4 m_31 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = in.m_27.x;
    float _50 = in.m_29.x;
    float _52 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _54 = in.m_31.x;
    float _56 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _52);
    float _58 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _56);
    float _60 = _48 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _62 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _48);
    float _64 = abs(_48);
    float _66 = log2(_64);
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _48);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _48);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _48);
    float _74 = abs(_60);
    float _76 = log2(_74);
    float _78 = abs(_62);
    float _80 = log2(_78);
    float _82 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _84 = _66 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _86 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _82);
    float _88 = abs(_68);
    float _90 = log2(_88);
    float _92 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _94 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _86);
    float _96 = _58 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _98 = _76 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _100 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _92);
    float _102 = _96 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _104 = exp2(_84);
    float _106 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _100);
    float _108 = _94 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _110 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _48);
    float _112 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _48);
    float _114 = _106 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _116 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[13].x, _102);
    float _118 = _96 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _120 = abs(_112);
    float _122 = log2(_120);
    float _124 = _90 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _126 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[13].z, _116);
    float _128 = _80 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _130 = _126 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _132 = abs(_70);
    float _134 = log2(_132);
    float _136 = _96 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _138 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[10].x, _118);
    float _140 = _50 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _142 = _104 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _144 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[11].x, _136);
    float _146 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[10].z, _138);
    float _148 = -_140;
    float _150 = fma(_54, (*spvDescriptorSet0.vp_c3)._m0[15].z, _148);
    float _152 = 1.0 / _130;
    float _154 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[11].z, _144);
    float _156 = _146 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _158 = _154 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _160 = exp2(_98);
    float _162 = _50 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _164 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _166 = fma(_54, (*spvDescriptorSet0.vp_c3)._m0[15].y, _162);
    float _168 = _156 * _152;
    float _170 = _158 * _152;
    float _172 = _166 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _174 = exp2(_124);
    float _176 = fma(_168, 0.5, 0.5);
    float _178 = fma(_170, -0.5, 0.5);
    float _180 = _166 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _182 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[15].y, _172);
    float _184 = _166 * _142;
    float _186 = fma(_150, _142, _176);
    float _188 = -_180;
    float _190 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[15].z, _188);
    float _192 = abs(_72);
    float _194 = log2(_192);
    float _196 = _182 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _198 = _182 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _200 = _160 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _202 = fma(_190, (*spvDescriptorSet0.vp_c3)._m0[15].y, _196);
    float _204 = _182 * _200;
    float _206 = abs(_110);
    float _208 = log2(_206);
    float _210 = _202 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _212 = exp2(_128);
    float _214 = _194 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _216 = fma(_190, _200, _176);
    float _218 = exp2(_164);
    float _220 = -_198;
    float _222 = fma(_190, (*spvDescriptorSet0.vp_c3)._m0[15].z, _220);
    float _224 = _202 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c3)._m0[15].y, _210);
    float _228 = -_224;
    float _230 = fma(_222, (*spvDescriptorSet0.vp_c3)._m0[15].z, _228);
    float _232 = exp2(_214);
    float _234 = _174 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _236 = _208 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _238 = _226 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _240 = _212 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _242 = _202 * _234;
    float _244 = _226 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _246 = _122 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _248 = fma(_222, _234, _176);
    float _250 = -_238;
    float _252 = fma(_230, (*spvDescriptorSet0.vp_c3)._m0[15].z, _250);
    float _254 = fma(_230, (*spvDescriptorSet0.vp_c3)._m0[15].y, _244);
    float _256 = exp2(_236);
    float _258 = _226 * _240;
    float _260 = _218 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _262 = _254 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _264 = _254 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _266 = _232 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _268 = fma(_230, _240, _176);
    float _270 = fma(_252, (*spvDescriptorSet0.vp_c3)._m0[15].y, _262);
    float _272 = exp2(_246);
    float _274 = -_264;
    float _276 = fma(_252, (*spvDescriptorSet0.vp_c3)._m0[15].z, _274);
    float _278 = _254 * _260;
    float _280 = _270 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _282 = _270 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _284 = fma(_276, _266, _176);
    float _286 = fma(_252, _260, _176);
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c3)._m0[15].y, _280);
    float _290 = -_282;
    float _292 = fma(_276, (*spvDescriptorSet0.vp_c3)._m0[15].z, _290);
    float _294 = _270 * _266;
    float _296 = _256 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _298 = _288 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _300 = _288 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _302 = fma(_258, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _304 = _288 * _296;
    float _306 = -_298;
    float _308 = fma(_292, (*spvDescriptorSet0.vp_c3)._m0[15].z, _306);
    float _310 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _312 = _272 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _314 = fma(_292, (*spvDescriptorSet0.vp_c3)._m0[15].y, _300);
    float _316 = fma(_292, _296, _176);
    float _318 = fma(_278, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _320 = fma(_308, _312, _176);
    float _322 = fma(_204, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float2 _1049 = float2(_186, _310);
    float _324 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1049, float2(0.0), isnan(_1049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1049, float2(0.0), isnan(_1049)), level(0.0)).x;
    float _326 = _314 * _312;
    float _328 = fma(_242, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _330 = fma(_294, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _332 = fma(_304, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float2 _1077 = float2(_216, _322);
    float _334 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1077, float2(0.0), isnan(_1077)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1077, float2(0.0), isnan(_1077)), level(0.0)).x;
    float _336 = fma(_326, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float2 _1090 = float2(_248, _328);
    float _338 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1090, float2(0.0), isnan(_1090)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1090, float2(0.0), isnan(_1090)), level(0.0)).x;
    float2 _1098 = float2(_268, _302);
    float _340 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1098, float2(0.0), isnan(_1098)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1098, float2(0.0), isnan(_1098)), level(0.0)).x;
    float2 _1106 = float2(_286, _318);
    float _342 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1106, float2(0.0), isnan(_1106)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1106, float2(0.0), isnan(_1106)), level(0.0)).x;
    float2 _1114 = float2(_284, _330);
    float _344 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1114, float2(0.0), isnan(_1114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1114, float2(0.0), isnan(_1114)), level(0.0)).x;
    float2 _1122 = float2(_316, _332);
    float _346 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1122, float2(0.0), isnan(_1122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1122, float2(0.0), isnan(_1122)), level(0.0)).x;
    float2 _1130 = float2(_320, _336);
    float _348 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1130, float2(0.0), isnan(_1130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1130, float2(0.0), isnan(_1130)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _350 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _352 = 1.0 / _350;
    float _354 = -_352;
    float _356 = fma(_354, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _358 = -_324;
    float _360 = fma(_358, _356, 1.0);
    float _362 = -_334;
    float _364 = fma(_356, _362, 1.0);
    float _366 = 1.0 / _360;
    float _368 = -_338;
    float _370 = fma(_356, _368, 1.0);
    float _372 = -_340;
    float _374 = fma(_356, _372, 1.0);
    float _376 = 1.0 / _364;
    float _378 = 1.0 / _370;
    float _380 = _366 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _382 = -_342;
    float _384 = fma(_356, _382, 1.0);
    float _386 = -_114;
    bool _390 = _380 > _386;
    float _392 = 1.0 / _374;
    float _394 = _376 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _396 = -_114;
    bool _398 = _394 > _396;
    float _400 = _378 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _402 = 1.0 / _384;
    float _404 = -_344;
    float _406 = fma(_356, _404, 1.0);
    float _408 = -_346;
    float _410 = fma(_356, _408, 1.0);
    if (_390)
    {
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
    }
    float _412 = -_114;
    bool _414 = _400 > _412;
    float _416 = _392 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _418 = 1.0 / _406;
    float _420 = -_114;
    bool _422 = _416 > _420;
    float _424 = _416;
    if (!_390)
    {
        _424 = 0.0;
    }
    float _426 = _424;
    float _428 = _426;
    if (_390)
    {
        _428 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
    }
    float _430 = _428;
    float _432 = _402 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _434 = 1.0 / _410;
    int _437 = as_type<int>(_430);
    if (_398)
    {
        float _439 = _430 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _437 = as_type<int>(_439);
    }
    int _441 = _437;
    float _443 = -_348;
    float _445 = fma(_356, _443, 1.0);
    float _447 = -_114;
    bool _449 = _432 > _447;
    float _451 = _418 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    int _453 = _441;
    if (_398)
    {
        out.m_34.x = as_type<float>(_441);
    }
    float _455 = 1.0 / _445;
    if (_414)
    {
        float _457 = as_type<float>(_441) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _453 = as_type<int>(_457);
    }
    int _459 = _453;
    float _461 = _434 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    int _463 = _459;
    if (_414)
    {
        out.m_34.x = as_type<float>(_459);
    }
    float _465 = -_114;
    bool _467 = _451 > _465;
    if (_422)
    {
        float _469 = as_type<float>(_459) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _463 = as_type<int>(_469);
    }
    int _471 = _463;
    int _473 = _471;
    if (_422)
    {
        out.m_34.x = as_type<float>(_471);
    }
    float _475 = -_114;
    bool _477 = _461 > _475;
    float _479 = _455 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    if (_449)
    {
        float _481 = as_type<float>(_471) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _473 = as_type<int>(_481);
    }
    int _483 = _473;
    int _485 = _483;
    if (_449)
    {
        out.m_34.x = as_type<float>(_483);
    }
    float _487 = -_114;
    bool _489 = _479 > _487;
    if (_467)
    {
        float _491 = as_type<float>(_483) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _485 = as_type<int>(_491);
    }
    int _493 = _485;
    out.gl_Position.z = 1.0;
    int _495 = _493;
    if (_467)
    {
        out.m_34.x = as_type<float>(_493);
    }
    if (_477)
    {
        float _497 = as_type<float>(_493) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _495 = as_type<int>(_497);
    }
    int _499 = _495;
    if (_477)
    {
        out.m_34.x = as_type<float>(_499);
    }
    if (!_489)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _501 = as_type<float>(_499) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    out.m_34.x = _501;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = in.m_27.x;
    float _50 = in.m_29.x;
    float _52 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _54 = in.m_31.x;
    float _56 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _52);
    float _58 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _56);
    float _60 = _48 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _62 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _48);
    float _64 = abs(_48);
    float _66 = log2(_64);
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _48);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _48);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _48);
    float _74 = abs(_60);
    float _76 = log2(_74);
    float _78 = abs(_62);
    float _80 = log2(_78);
    float _82 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _84 = _66 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _86 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _82);
    float _88 = abs(_68);
    float _90 = log2(_88);
    float _92 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _94 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _86);
    float _96 = _58 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _98 = _76 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _100 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _92);
    float _102 = _96 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _104 = exp2(_84);
    float _106 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _100);
    float _108 = _94 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _110 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _48);
    float _112 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _48);
    float _114 = _106 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _116 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[13].x, _102);
    float _118 = _96 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _120 = abs(_112);
    float _122 = log2(_120);
    float _124 = _90 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _126 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[13].z, _116);
    float _128 = _80 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _130 = _126 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _132 = abs(_70);
    float _134 = log2(_132);
    float _136 = _96 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _138 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[10].x, _118);
    float _140 = _50 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _142 = _104 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _144 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[11].x, _136);
    float _146 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[10].z, _138);
    float _148 = -_140;
    float _150 = fma(_54, (*spvDescriptorSet0.vp_c3)._m0[15].z, _148);
    float _152 = 1.0 / _130;
    float _154 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[11].z, _144);
    float _156 = _146 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _158 = _154 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _160 = exp2(_98);
    float _162 = _50 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _164 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _166 = fma(_54, (*spvDescriptorSet0.vp_c3)._m0[15].y, _162);
    float _168 = _156 * _152;
    float _170 = _158 * _152;
    float _172 = _166 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _174 = exp2(_124);
    float _176 = fma(_168, 0.5, 0.5);
    float _178 = fma(_170, -0.5, 0.5);
    float _180 = _166 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _182 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[15].y, _172);
    float _184 = _166 * _142;
    float _186 = fma(_150, _142, _176);
    float _188 = -_180;
    float _190 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[15].z, _188);
    float _192 = abs(_72);
    float _194 = log2(_192);
    float _196 = _182 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _198 = _182 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _200 = _160 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _202 = fma(_190, (*spvDescriptorSet0.vp_c3)._m0[15].y, _196);
    float _204 = _182 * _200;
    float _206 = abs(_110);
    float _208 = log2(_206);
    float _210 = _202 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _212 = exp2(_128);
    float _214 = _194 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _216 = fma(_190, _200, _176);
    float _218 = exp2(_164);
    float _220 = -_198;
    float _222 = fma(_190, (*spvDescriptorSet0.vp_c3)._m0[15].z, _220);
    float _224 = _202 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c3)._m0[15].y, _210);
    float _228 = -_224;
    float _230 = fma(_222, (*spvDescriptorSet0.vp_c3)._m0[15].z, _228);
    float _232 = exp2(_214);
    float _234 = _174 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _236 = _208 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _238 = _226 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _240 = _212 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _242 = _202 * _234;
    float _244 = _226 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _246 = _122 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _248 = fma(_222, _234, _176);
    float _250 = -_238;
    float _252 = fma(_230, (*spvDescriptorSet0.vp_c3)._m0[15].z, _250);
    float _254 = fma(_230, (*spvDescriptorSet0.vp_c3)._m0[15].y, _244);
    float _256 = exp2(_236);
    float _258 = _226 * _240;
    float _260 = _218 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _262 = _254 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _264 = _254 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _266 = _232 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _268 = fma(_230, _240, _176);
    float _270 = fma(_252, (*spvDescriptorSet0.vp_c3)._m0[15].y, _262);
    float _272 = exp2(_246);
    float _274 = -_264;
    float _276 = fma(_252, (*spvDescriptorSet0.vp_c3)._m0[15].z, _274);
    float _278 = _254 * _260;
    float _280 = _270 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _282 = _270 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _284 = fma(_276, _266, _176);
    float _286 = fma(_252, _260, _176);
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c3)._m0[15].y, _280);
    float _290 = -_282;
    float _292 = fma(_276, (*spvDescriptorSet0.vp_c3)._m0[15].z, _290);
    float _294 = _270 * _266;
    float _296 = _256 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _298 = _288 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _300 = _288 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _302 = fma(_258, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _304 = _288 * _296;
    float _306 = -_298;
    float _308 = fma(_292, (*spvDescriptorSet0.vp_c3)._m0[15].z, _306);
    float _310 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _312 = _272 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _314 = fma(_292, (*spvDescriptorSet0.vp_c3)._m0[15].y, _300);
    float _316 = fma(_292, _296, _176);
    float _318 = fma(_278, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _320 = fma(_308, _312, _176);
    float _322 = fma(_204, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float2 _1049 = float2(_186, _310);
    float _324 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1049, float2(0.0), isnan(_1049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1049, float2(0.0), isnan(_1049)), level(0.0)).x;
    float _326 = _314 * _312;
    float _328 = fma(_242, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _330 = fma(_294, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _332 = fma(_304, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float2 _1077 = float2(_216, _322);
    float _334 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1077, float2(0.0), isnan(_1077)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1077, float2(0.0), isnan(_1077)), level(0.0)).x;
    float _336 = fma(_326, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float2 _1090 = float2(_248, _328);
    float _338 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1090, float2(0.0), isnan(_1090)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1090, float2(0.0), isnan(_1090)), level(0.0)).x;
    float2 _1098 = float2(_268, _302);
    float _340 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1098, float2(0.0), isnan(_1098)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1098, float2(0.0), isnan(_1098)), level(0.0)).x;
    float2 _1106 = float2(_286, _318);
    float _342 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1106, float2(0.0), isnan(_1106)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1106, float2(0.0), isnan(_1106)), level(0.0)).x;
    float2 _1114 = float2(_284, _330);
    float _344 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1114, float2(0.0), isnan(_1114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1114, float2(0.0), isnan(_1114)), level(0.0)).x;
    float2 _1122 = float2(_316, _332);
    float _346 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1122, float2(0.0), isnan(_1122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1122, float2(0.0), isnan(_1122)), level(0.0)).x;
    float2 _1130 = float2(_320, _336);
    float _348 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1130, float2(0.0), isnan(_1130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1130, float2(0.0), isnan(_1130)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _350 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _352 = 1.0 / _350;
    float _354 = -_352;
    float _356 = fma(_354, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _358 = -_324;
    float _360 = fma(_358, _356, 1.0);
    float _362 = -_334;
    float _364 = fma(_356, _362, 1.0);
    float _366 = 1.0 / _360;
    float _368 = -_338;
    float _370 = fma(_356, _368, 1.0);
    float _372 = -_340;
    float _374 = fma(_356, _372, 1.0);
    float _376 = 1.0 / _364;
    float _378 = 1.0 / _370;
    float _380 = _366 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _382 = -_342;
    float _384 = fma(_356, _382, 1.0);
    float _386 = -_114;
    bool _390 = _380 > _386;
    float _392 = 1.0 / _374;
    float _394 = _376 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _396 = -_114;
    bool _398 = _394 > _396;
    float _400 = _378 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _402 = 1.0 / _384;
    float _404 = -_344;
    float _406 = fma(_356, _404, 1.0);
    float _408 = -_346;
    float _410 = fma(_356, _408, 1.0);
    if (_390)
    {
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
    }
    float _412 = -_114;
    bool _414 = _400 > _412;
    float _416 = _392 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _418 = 1.0 / _406;
    float _420 = -_114;
    bool _422 = _416 > _420;
    float _424 = _416;
    if (!_390)
    {
        _424 = 0.0;
    }
    float _426 = _424;
    float _428 = _426;
    if (_390)
    {
        _428 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
    }
    float _430 = _428;
    float _432 = _402 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _434 = 1.0 / _410;
    int _437 = as_type<int>(_430);
    if (_398)
    {
        float _439 = _430 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _437 = as_type<int>(_439);
    }
    int _441 = _437;
    float _443 = -_348;
    float _445 = fma(_356, _443, 1.0);
    float _447 = -_114;
    bool _449 = _432 > _447;
    float _451 = _418 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    int _453 = _441;
    if (_398)
    {
        out.m_34.x = as_type<float>(_441);
    }
    float _455 = 1.0 / _445;
    if (_414)
    {
        float _457 = as_type<float>(_441) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _453 = as_type<int>(_457);
    }
    int _459 = _453;
    float _461 = _434 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    int _463 = _459;
    if (_414)
    {
        out.m_34.x = as_type<float>(_459);
    }
    float _465 = -_114;
    bool _467 = _451 > _465;
    if (_422)
    {
        float _469 = as_type<float>(_459) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _463 = as_type<int>(_469);
    }
    int _471 = _463;
    int _473 = _471;
    if (_422)
    {
        out.m_34.x = as_type<float>(_471);
    }
    float _475 = -_114;
    bool _477 = _461 > _475;
    float _479 = _455 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    if (_449)
    {
        float _481 = as_type<float>(_471) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _473 = as_type<int>(_481);
    }
    int _483 = _473;
    int _485 = _483;
    if (_449)
    {
        out.m_34.x = as_type<float>(_483);
    }
    float _487 = -_114;
    bool _489 = _479 > _487;
    if (_467)
    {
        float _491 = as_type<float>(_483) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _485 = as_type<int>(_491);
    }
    int _493 = _485;
    out.gl_Position.z = 1.0;
    int _495 = _493;
    if (_467)
    {
        out.m_34.x = as_type<float>(_493);
    }
    if (_477)
    {
        float _497 = as_type<float>(_493) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _495 = as_type<int>(_497);
    }
    int _499 = _495;
    if (_477)
    {
        out.m_34.x = as_type<float>(_499);
    }
    if (!_489)
    {
        return out;
    }
    float _501 = as_type<float>(_499) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    out.m_34.x = _501;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = in.m_27.x;
    float _50 = in.m_29.x;
    float _52 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _54 = in.m_31.x;
    float _56 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _52);
    float _58 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _56);
    float _60 = _48 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _62 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _48);
    float _64 = abs(_48);
    float _66 = log2(_64);
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _48);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _48);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _48);
    float _74 = abs(_60);
    float _76 = log2(_74);
    float _78 = abs(_62);
    float _80 = log2(_78);
    float _82 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _84 = _66 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _86 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _82);
    float _88 = abs(_68);
    float _90 = log2(_88);
    float _92 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _94 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _86);
    float _96 = _58 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _98 = _76 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _100 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _92);
    float _102 = _96 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _104 = exp2(_84);
    float _106 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _100);
    float _108 = _94 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _110 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _48);
    float _112 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _48);
    float _114 = _106 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _116 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[13].x, _102);
    float _118 = _96 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _120 = abs(_112);
    float _122 = log2(_120);
    float _124 = _90 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _126 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[13].z, _116);
    float _128 = _80 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _130 = _126 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _132 = abs(_70);
    float _134 = log2(_132);
    float _136 = _96 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _138 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[10].x, _118);
    float _140 = _50 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _142 = _104 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _144 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[11].x, _136);
    float _146 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[10].z, _138);
    float _148 = -_140;
    float _150 = fma(_54, (*spvDescriptorSet0.vp_c3)._m0[15].z, _148);
    float _152 = 1.0 / _130;
    float _154 = fma(_114, (*spvDescriptorSet0.vp_c3)._m0[11].z, _144);
    float _156 = _146 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _158 = _154 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _160 = exp2(_98);
    float _162 = _50 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _164 = _134 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _166 = fma(_54, (*spvDescriptorSet0.vp_c3)._m0[15].y, _162);
    float _168 = _156 * _152;
    float _170 = _158 * _152;
    float _172 = _166 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _174 = exp2(_124);
    float _176 = fma(_168, 0.5, 0.5);
    float _178 = fma(_170, -0.5, 0.5);
    float _180 = _166 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _182 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[15].y, _172);
    float _184 = _166 * _142;
    float _186 = fma(_150, _142, _176);
    float _188 = -_180;
    float _190 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[15].z, _188);
    float _192 = abs(_72);
    float _194 = log2(_192);
    float _196 = _182 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _198 = _182 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _200 = _160 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _202 = fma(_190, (*spvDescriptorSet0.vp_c3)._m0[15].y, _196);
    float _204 = _182 * _200;
    float _206 = abs(_110);
    float _208 = log2(_206);
    float _210 = _202 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _212 = exp2(_128);
    float _214 = _194 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _216 = fma(_190, _200, _176);
    float _218 = exp2(_164);
    float _220 = -_198;
    float _222 = fma(_190, (*spvDescriptorSet0.vp_c3)._m0[15].z, _220);
    float _224 = _202 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c3)._m0[15].y, _210);
    float _228 = -_224;
    float _230 = fma(_222, (*spvDescriptorSet0.vp_c3)._m0[15].z, _228);
    float _232 = exp2(_214);
    float _234 = _174 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _236 = _208 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _238 = _226 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _240 = _212 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _242 = _202 * _234;
    float _244 = _226 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _246 = _122 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _248 = fma(_222, _234, _176);
    float _250 = -_238;
    float _252 = fma(_230, (*spvDescriptorSet0.vp_c3)._m0[15].z, _250);
    float _254 = fma(_230, (*spvDescriptorSet0.vp_c3)._m0[15].y, _244);
    float _256 = exp2(_236);
    float _258 = _226 * _240;
    float _260 = _218 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _262 = _254 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _264 = _254 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _266 = _232 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _268 = fma(_230, _240, _176);
    float _270 = fma(_252, (*spvDescriptorSet0.vp_c3)._m0[15].y, _262);
    float _272 = exp2(_246);
    float _274 = -_264;
    float _276 = fma(_252, (*spvDescriptorSet0.vp_c3)._m0[15].z, _274);
    float _278 = _254 * _260;
    float _280 = _270 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _282 = _270 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _284 = fma(_276, _266, _176);
    float _286 = fma(_252, _260, _176);
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c3)._m0[15].y, _280);
    float _290 = -_282;
    float _292 = fma(_276, (*spvDescriptorSet0.vp_c3)._m0[15].z, _290);
    float _294 = _270 * _266;
    float _296 = _256 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _298 = _288 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _300 = _288 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _302 = fma(_258, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _304 = _288 * _296;
    float _306 = -_298;
    float _308 = fma(_292, (*spvDescriptorSet0.vp_c3)._m0[15].z, _306);
    float _310 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _312 = _272 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _314 = fma(_292, (*spvDescriptorSet0.vp_c3)._m0[15].y, _300);
    float _316 = fma(_292, _296, _176);
    float _318 = fma(_278, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _320 = fma(_308, _312, _176);
    float _322 = fma(_204, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float2 _1049 = float2(_186, _310);
    float _324 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1049, float2(0.0), isnan(_1049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1049, float2(0.0), isnan(_1049)), level(0.0)).x;
    float _326 = _314 * _312;
    float _328 = fma(_242, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _330 = fma(_294, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float _332 = fma(_304, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float2 _1077 = float2(_216, _322);
    float _334 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1077, float2(0.0), isnan(_1077)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1077, float2(0.0), isnan(_1077)), level(0.0)).x;
    float _336 = fma(_326, (*spvDescriptorSet0.vp_c3)._m0[14].z, _178);
    float2 _1090 = float2(_248, _328);
    float _338 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1090, float2(0.0), isnan(_1090)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1090, float2(0.0), isnan(_1090)), level(0.0)).x;
    float2 _1098 = float2(_268, _302);
    float _340 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1098, float2(0.0), isnan(_1098)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1098, float2(0.0), isnan(_1098)), level(0.0)).x;
    float2 _1106 = float2(_286, _318);
    float _342 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1106, float2(0.0), isnan(_1106)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1106, float2(0.0), isnan(_1106)), level(0.0)).x;
    float2 _1114 = float2(_284, _330);
    float _344 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1114, float2(0.0), isnan(_1114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1114, float2(0.0), isnan(_1114)), level(0.0)).x;
    float2 _1122 = float2(_316, _332);
    float _346 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1122, float2(0.0), isnan(_1122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1122, float2(0.0), isnan(_1122)), level(0.0)).x;
    float2 _1130 = float2(_320, _336);
    float _348 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1130, float2(0.0), isnan(_1130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1130, float2(0.0), isnan(_1130)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _350 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    float _352 = 1.0 / _350;
    float _354 = -_352;
    float _356 = fma(_354, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _358 = -_324;
    float _360 = fma(_358, _356, 1.0);
    float _362 = -_334;
    float _364 = fma(_356, _362, 1.0);
    float _366 = 1.0 / _360;
    float _368 = -_338;
    float _370 = fma(_356, _368, 1.0);
    float _372 = -_340;
    float _374 = fma(_356, _372, 1.0);
    float _376 = 1.0 / _364;
    float _378 = 1.0 / _370;
    float _380 = _366 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _382 = -_342;
    float _384 = fma(_356, _382, 1.0);
    float _386 = -_114;
    bool _390 = _380 > _386;
    float _392 = 1.0 / _374;
    float _394 = _376 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _396 = -_114;
    bool _398 = _394 > _396;
    float _400 = _378 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _402 = 1.0 / _384;
    float _404 = -_344;
    float _406 = fma(_356, _404, 1.0);
    float _408 = -_346;
    float _410 = fma(_356, _408, 1.0);
    if (_390)
    {
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
    }
    float _412 = -_114;
    bool _414 = _400 > _412;
    float _416 = _392 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _418 = 1.0 / _406;
    float _420 = -_114;
    bool _422 = _416 > _420;
    float _424 = _416;
    if (!_390)
    {
        _424 = 0.0;
    }
    float _426 = _424;
    float _428 = _426;
    if (_390)
    {
        _428 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
    }
    float _430 = _428;
    float _432 = _402 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _434 = 1.0 / _410;
    int _437 = as_type<int>(_430);
    if (_398)
    {
        float _439 = _430 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _437 = as_type<int>(_439);
    }
    int _441 = _437;
    float _443 = -_348;
    float _445 = fma(_356, _443, 1.0);
    float _447 = -_114;
    bool _449 = _432 > _447;
    float _451 = _418 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    int _453 = _441;
    if (_398)
    {
        out.m_34.x = as_type<float>(_441);
    }
    float _455 = 1.0 / _445;
    if (_414)
    {
        float _457 = as_type<float>(_441) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _453 = as_type<int>(_457);
    }
    int _459 = _453;
    float _461 = _434 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    int _463 = _459;
    if (_414)
    {
        out.m_34.x = as_type<float>(_459);
    }
    float _465 = -_114;
    bool _467 = _451 > _465;
    if (_422)
    {
        float _469 = as_type<float>(_459) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _463 = as_type<int>(_469);
    }
    int _471 = _463;
    int _473 = _471;
    if (_422)
    {
        out.m_34.x = as_type<float>(_471);
    }
    float _475 = -_114;
    bool _477 = _461 > _475;
    float _479 = _455 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    if (_449)
    {
        float _481 = as_type<float>(_471) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _473 = as_type<int>(_481);
    }
    int _483 = _473;
    int _485 = _483;
    if (_449)
    {
        out.m_34.x = as_type<float>(_483);
    }
    float _487 = -_114;
    bool _489 = _479 > _487;
    if (_467)
    {
        float _491 = as_type<float>(_483) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _485 = as_type<int>(_491);
    }
    int _493 = _485;
    out.gl_Position.z = 1.0;
    int _495 = _493;
    if (_467)
    {
        out.m_34.x = as_type<float>(_493);
    }
    if (_477)
    {
        float _497 = as_type<float>(_493) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _495 = as_type<int>(_497);
    }
    int _499 = _495;
    if (_477)
    {
        out.m_34.x = as_type<float>(_499);
    }
    if (!_489)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _501 = as_type<float>(_499) + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    out.m_34.x = _501;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

