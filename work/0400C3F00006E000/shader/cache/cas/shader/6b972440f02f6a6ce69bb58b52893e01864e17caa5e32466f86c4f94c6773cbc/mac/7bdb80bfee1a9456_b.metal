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
    float4 m_36 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
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
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _50 = in.m_27.x;
    float _52 = in.m_29.x;
    float _54 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _56 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _58 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _60 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _54);
    float _62 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _56);
    float _64 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _58);
    float _66 = in.m_31.x;
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _60);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _62);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _64);
    float _74 = _68 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _76 = _70 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _78 = _72 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _80 = _74 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _82 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _50);
    float _84 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _50);
    float _86 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _50);
    float _88 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _50);
    float _90 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _50);
    float _92 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _50);
    float _94 = _74 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _96 = _50 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _98 = abs(_50);
    float _100 = log2(_98);
    float _102 = _74 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _104 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[13].x, _94);
    float _106 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[10].x, _80);
    float _108 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[11].x, _102);
    float _110 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].z, _104);
    float _112 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].z, _106);
    float _114 = abs(_96);
    float _116 = log2(_114);
    float _118 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].z, _108);
    float _120 = _110 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _122 = _112 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _124 = _118 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _126 = abs(_82);
    float _128 = log2(_126);
    float _130 = _100 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _132 = 1.0 / _120;
    float _134 = _116 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _136 = exp2(_130);
    float _138 = _52 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _140 = _128 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _142 = abs(_84);
    float _144 = log2(_142);
    float _146 = _52 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _148 = _122 * _132;
    float _150 = _124 * _132;
    float _152 = -_146;
    float _154 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[15].z, _152);
    float _156 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[15].y, _138);
    float _158 = fma(_148, 0.5, 0.5);
    float _160 = exp2(_134);
    float _162 = _136 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _164 = _156 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _166 = _156 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _168 = fma(_150, -0.5, 0.5);
    float _170 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[15].y, _164);
    float _172 = -_166;
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[15].z, _172);
    float _176 = abs(_86);
    float _178 = log2(_176);
    float _180 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _182 = _156 * _162;
    float _184 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _186 = abs(_88);
    float _188 = log2(_186);
    float _190 = _160 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _192 = _170 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _194 = exp2(_140);
    float _196 = _178 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _198 = fma(_154, _162, _158);
    float _200 = -_192;
    float _202 = fma(_174, (*spvDescriptorSet0.vp_c3)._m0[15].z, _200);
    float _204 = abs(_90);
    float _206 = log2(_204);
    float _208 = _170 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _210 = _188 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _212 = _170 * _190;
    float _214 = fma(_174, _190, _158);
    float _216 = fma(_174, (*spvDescriptorSet0.vp_c3)._m0[15].y, _208);
    float _218 = exp2(_180);
    float _220 = _216 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _222 = _194 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _224 = abs(_92);
    float _226 = log2(_224);
    float _228 = _216 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float2 _1113 = float2(_198, _184);
    float _230 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1113, float2(0.0), isnan(_1113)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1113, float2(0.0), isnan(_1113)), level(0.0)).x;
    float _232 = _206 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _234 = fma(_202, _222, _158);
    float _236 = -_228;
    float _238 = fma(_202, (*spvDescriptorSet0.vp_c3)._m0[15].z, _236);
    float _240 = exp2(_196);
    float _242 = _218 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _244 = exp2(_210);
    float _246 = fma(_202, (*spvDescriptorSet0.vp_c3)._m0[15].y, _220);
    float _248 = _216 * _222;
    float _250 = _226 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _252 = _246 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _254 = _246 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _256 = exp2(_232);
    float _258 = fma(_238, (*spvDescriptorSet0.vp_c3)._m0[15].y, _252);
    float _260 = -_254;
    float _262 = fma(_238, (*spvDescriptorSet0.vp_c3)._m0[15].z, _260);
    float _264 = _246 * _242;
    float _266 = fma(_238, _242, _158);
    float _268 = _258 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _270 = _258 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _272 = fma(_264, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _274 = exp2(_250);
    float _276 = fma(_262, (*spvDescriptorSet0.vp_c3)._m0[15].y, _268);
    float _278 = -_270;
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c3)._m0[15].z, _278);
    float _282 = _240 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _284 = _244 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _286 = _276 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _288 = _276 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _290 = _258 * _282;
    float _292 = fma(_262, _282, _158);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c3)._m0[15].y, _286);
    float _296 = fma(_280, _284, _158);
    float _298 = -_288;
    float _300 = fma(_280, (*spvDescriptorSet0.vp_c3)._m0[15].z, _298);
    float _302 = _256 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _304 = _294 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _306 = _294 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _308 = fma(_248, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _310 = _274 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _312 = -_304;
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[15].z, _312);
    float _316 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[15].y, _306);
    float _318 = _294 * _302;
    float _320 = fma(_300, _302, _158);
    float _322 = fma(_314, _310, _158);
    float _324 = _276 * _284;
    float _326 = fma(_212, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _328 = _316 * _310;
    float _330 = fma(_290, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float2 _1323 = float2(_214, _326);
    float _336 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1323, float2(0.0), isnan(_1323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1323, float2(0.0), isnan(_1323)), level(0.0)).x;
    float2 _1331 = float2(_234, _308);
    float _338 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1331, float2(0.0), isnan(_1331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1331, float2(0.0), isnan(_1331)), level(0.0)).x;
    float2 _1339 = float2(_266, _272);
    float _340 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1339, float2(0.0), isnan(_1339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1339, float2(0.0), isnan(_1339)), level(0.0)).x;
    float2 _1347 = float2(_292, _330);
    float _342 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1347, float2(0.0), isnan(_1347)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1347, float2(0.0), isnan(_1347)), level(0.0)).x;
    float2 _1355 = float2(_296, _334);
    float _344 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1355, float2(0.0), isnan(_1355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1355, float2(0.0), isnan(_1355)), level(0.0)).x;
    float2 _1363 = float2(_320, _332);
    float _346 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1363, float2(0.0), isnan(_1363)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1363, float2(0.0), isnan(_1363)), level(0.0)).x;
    float _348 = fma(_328, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float2 _1376 = float2(_322, _348);
    float _350 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1376, float2(0.0), isnan(_1376)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1376, float2(0.0), isnan(_1376)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _352 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_36.x = 0.0;
    float _354 = 1.0 / _352;
    float _356 = -_354;
    float _358 = fma(_356, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _360 = -_230;
    float _362 = fma(_360, _358, 1.0);
    float _364 = 1.0 / _362;
    float _366 = _364 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _368 = -_78;
    bool _372 = _366 > _368;
    float _374 = _326;
    float _376 = _366;
    int _379 = as_type<int>(_214);
    float _381 = _50;
    if (!_372)
    {
        _374 = 0.0;
    }
    float _383 = _374;
    float _385 = _383;
    float _387 = _383;
    if (!_372)
    {
        _376 = 0.0;
    }
    float _389 = _376;
    bool _391 = !_372;
    float _393 = _389;
    float _395 = _389;
    if (!_391)
    {
        bool _397 = _50 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _399 = isnan(_50);
        bool _401 = _397 || _399;
        bool _403 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _405 = _401 || _403;
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _381 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        if (!_405)
        {
            _379 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[16].z);
        }
        int _407 = _379;
        if (_405)
        {
            _385 = 0.0;
        }
        float _409 = _385;
        float _411 = _409;
        if (_405)
        {
            _393 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
        float _413 = _393;
        _395 = _413;
        if (!_405)
        {
            out.m_36.x = as_type<float>(_407);
        }
        if (!_405)
        {
            _411 = (*spvDescriptorSet0.vp_c3)._m0[16].z;
        }
        float _415 = _411;
        _387 = _415;
        if (!_405)
        {
            _395 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
    }
    float _417 = _395;
    float _419 = _387;
    float _421 = _381;
    float _423 = -_336;
    float _425 = fma(_358, _423, 1.0);
    float _427 = 1.0 / _425;
    float _429 = _427 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _431 = -_78;
    bool _433 = _429 > _431;
    bool _435 = !_433;
    int _437 = as_type<int>(_419);
    float _439 = _417;
    float _441 = _417;
    float _443 = _419;
    float _445 = _421;
    if (!_435)
    {
        bool _447 = _96 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _449 = isnan(_96);
        bool _451 = _447 || _449;
        bool _453 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _455 = _451 || _453;
        float _457 = _417 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _457;
        _445 = _457;
        if (!_455)
        {
            float _459 = _419 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _437 = as_type<int>(_459);
        }
        int _461 = _437;
        _443 = as_type<float>(_461);
        if (_455)
        {
            _439 = _457;
        }
        float _463 = _439;
        float _465 = _463;
        if (!_455)
        {
            _465 = _457;
        }
        float _467 = _465;
        _441 = _467;
        if (!_455)
        {
            out.m_36.x = as_type<float>(_461);
        }
    }
    float _469 = _441;
    float _471 = _443;
    float _473 = _445;
    float _475 = -_338;
    float _477 = fma(_358, _475, 1.0);
    float _479 = 1.0 / _477;
    float _481 = _479 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _483 = -_78;
    bool _485 = _481 > _483;
    bool _487 = !_485;
    int _489 = as_type<int>(_471);
    float _491 = _469;
    float _493 = _469;
    float _495 = _471;
    float _497 = _473;
    if (!_487)
    {
        bool _499 = _82 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _501 = isnan(_82);
        bool _503 = _499 || _501;
        bool _505 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _507 = _503 || _505;
        float _509 = _469 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _509;
        _497 = _509;
        if (!_507)
        {
            float _511 = _471 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _489 = as_type<int>(_511);
        }
        int _513 = _489;
        _495 = as_type<float>(_513);
        if (_507)
        {
            _491 = _509;
        }
        float _515 = _491;
        float _517 = _515;
        if (!_507)
        {
            _517 = _509;
        }
        float _519 = _517;
        _493 = _519;
        if (!_507)
        {
            out.m_36.x = as_type<float>(_513);
        }
    }
    float _521 = _493;
    float _523 = _495;
    float _525 = _497;
    float _527 = -_340;
    float _529 = fma(_358, _527, 1.0);
    float _531 = 1.0 / _529;
    float _533 = _531 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _535 = -_78;
    bool _537 = _533 > _535;
    float _539 = _525;
    int _541 = as_type<int>(_523);
    float _543 = _523;
    if (!_537)
    {
        _539 = _521;
    }
    float _545 = _539;
    bool _547 = !_537;
    float _549 = _545;
    float _551 = _545;
    if (!_547)
    {
        bool _553 = _84 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _555 = isnan(_84);
        bool _557 = _553 || _555;
        bool _559 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _561 = _557 || _559;
        float _563 = _521 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _563;
        if (!_561)
        {
            float _565 = _523 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _541 = as_type<int>(_565);
        }
        int _567 = _541;
        _543 = as_type<float>(_567);
        if (_561)
        {
            _549 = _563;
        }
        float _569 = _549;
        float _571 = _569;
        if (!_561)
        {
            _571 = _563;
        }
        float _573 = _571;
        _551 = _573;
        if (!_561)
        {
            out.m_36.x = as_type<float>(_567);
        }
    }
    float _575 = _551;
    float _577 = _543;
    float _579 = -_342;
    float _581 = fma(_358, _579, 1.0);
    float _583 = -_344;
    float _585 = fma(_358, _583, 1.0);
    float _587 = -_346;
    float _589 = fma(_358, _587, 1.0);
    float _591 = -_350;
    float _593 = fma(_358, _591, 1.0);
    float _595 = 1.0 / _581;
    out.gl_Position.z = 1.0;
    float _597 = 1.0 / _585;
    float _599 = 1.0 / _589;
    float _601 = _595 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _603 = -_78;
    bool _605 = _601 > _603;
    float _607 = 1.0 / _593;
    float _609 = _597 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _611 = -_78;
    bool _613 = _609 > _611;
    float _615 = _599 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _617 = -_78;
    bool _619 = _615 > _617;
    float _621 = _607 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _623 = -_78;
    bool _625 = _621 > _623;
    bool _627 = !_605;
    int _629 = as_type<int>(_577);
    float _631 = _575;
    float _633 = _575;
    float _635 = _577;
    if (!_627)
    {
        bool _637 = _86 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _639 = isnan(_86);
        bool _641 = _637 || _639;
        bool _643 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _645 = _641 || _643;
        float _647 = _575 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _647;
        if (!_645)
        {
            float _649 = _577 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _629 = as_type<int>(_649);
        }
        int _651 = _629;
        _635 = as_type<float>(_651);
        if (_645)
        {
            _631 = _647;
        }
        float _653 = _631;
        float _655 = _653;
        if (!_645)
        {
            _655 = _647;
        }
        float _657 = _655;
        _633 = _657;
        if (!_645)
        {
            out.m_36.x = as_type<float>(_651);
        }
    }
    float _659 = _633;
    float _661 = _635;
    bool _663 = !_613;
    int _665 = as_type<int>(_661);
    float _667 = _659;
    float _669 = _659;
    float _671 = _661;
    if (!_663)
    {
        bool _673 = _88 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _675 = isnan(_88);
        bool _677 = _673 || _675;
        bool _679 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _681 = _677 || _679;
        float _683 = _659 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _683;
        if (!_681)
        {
            float _685 = _661 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _665 = as_type<int>(_685);
        }
        int _687 = _665;
        _671 = as_type<float>(_687);
        if (_681)
        {
            _667 = _683;
        }
        float _689 = _667;
        float _691 = _689;
        if (!_681)
        {
            _691 = _683;
        }
        float _693 = _691;
        _669 = _693;
        if (!_681)
        {
            out.m_36.x = as_type<float>(_687);
        }
    }
    float _695 = _669;
    float _697 = _671;
    bool _699 = !_619;
    int _701 = as_type<int>(_697);
    float _703 = _695;
    float _705 = _695;
    float _707 = _697;
    if (!_699)
    {
        bool _709 = _90 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _711 = isnan(_90);
        bool _713 = _709 || _711;
        bool _715 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _717 = _713 || _715;
        float _719 = _695 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _719;
        if (!_717)
        {
            float _721 = _697 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _701 = as_type<int>(_721);
        }
        int _723 = _701;
        _707 = as_type<float>(_723);
        if (_717)
        {
            _703 = _719;
        }
        float _725 = _703;
        float _727 = _725;
        if (!_717)
        {
            _727 = _719;
        }
        float _729 = _727;
        _705 = _729;
        if (!_717)
        {
            out.m_36.x = as_type<float>(_723);
        }
    }
    float _731 = _705;
    float _733 = _707;
    if (!_625)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _735 = _92 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
    bool _737 = isnan(_92);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
    bool _743 = _739 || _741;
    float _745 = _731 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    out.m_34.x = _745;
    if (_743)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _747 = _733 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
    out.m_36.x = _747;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _50 = in.m_27.x;
    float _52 = in.m_29.x;
    float _54 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _56 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _58 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _60 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _54);
    float _62 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _56);
    float _64 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _58);
    float _66 = in.m_31.x;
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _60);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _62);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _64);
    float _74 = _68 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _76 = _70 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _78 = _72 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _80 = _74 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _82 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _50);
    float _84 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _50);
    float _86 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _50);
    float _88 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _50);
    float _90 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _50);
    float _92 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _50);
    float _94 = _74 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _96 = _50 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _98 = abs(_50);
    float _100 = log2(_98);
    float _102 = _74 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _104 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[13].x, _94);
    float _106 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[10].x, _80);
    float _108 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[11].x, _102);
    float _110 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].z, _104);
    float _112 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].z, _106);
    float _114 = abs(_96);
    float _116 = log2(_114);
    float _118 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].z, _108);
    float _120 = _110 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _122 = _112 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _124 = _118 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _126 = abs(_82);
    float _128 = log2(_126);
    float _130 = _100 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _132 = 1.0 / _120;
    float _134 = _116 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _136 = exp2(_130);
    float _138 = _52 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _140 = _128 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _142 = abs(_84);
    float _144 = log2(_142);
    float _146 = _52 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _148 = _122 * _132;
    float _150 = _124 * _132;
    float _152 = -_146;
    float _154 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[15].z, _152);
    float _156 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[15].y, _138);
    float _158 = fma(_148, 0.5, 0.5);
    float _160 = exp2(_134);
    float _162 = _136 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _164 = _156 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _166 = _156 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _168 = fma(_150, -0.5, 0.5);
    float _170 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[15].y, _164);
    float _172 = -_166;
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[15].z, _172);
    float _176 = abs(_86);
    float _178 = log2(_176);
    float _180 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _182 = _156 * _162;
    float _184 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _186 = abs(_88);
    float _188 = log2(_186);
    float _190 = _160 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _192 = _170 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _194 = exp2(_140);
    float _196 = _178 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _198 = fma(_154, _162, _158);
    float _200 = -_192;
    float _202 = fma(_174, (*spvDescriptorSet0.vp_c3)._m0[15].z, _200);
    float _204 = abs(_90);
    float _206 = log2(_204);
    float _208 = _170 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _210 = _188 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _212 = _170 * _190;
    float _214 = fma(_174, _190, _158);
    float _216 = fma(_174, (*spvDescriptorSet0.vp_c3)._m0[15].y, _208);
    float _218 = exp2(_180);
    float _220 = _216 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _222 = _194 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _224 = abs(_92);
    float _226 = log2(_224);
    float _228 = _216 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float2 _1113 = float2(_198, _184);
    float _230 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1113, float2(0.0), isnan(_1113)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1113, float2(0.0), isnan(_1113)), level(0.0)).x;
    float _232 = _206 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _234 = fma(_202, _222, _158);
    float _236 = -_228;
    float _238 = fma(_202, (*spvDescriptorSet0.vp_c3)._m0[15].z, _236);
    float _240 = exp2(_196);
    float _242 = _218 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _244 = exp2(_210);
    float _246 = fma(_202, (*spvDescriptorSet0.vp_c3)._m0[15].y, _220);
    float _248 = _216 * _222;
    float _250 = _226 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _252 = _246 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _254 = _246 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _256 = exp2(_232);
    float _258 = fma(_238, (*spvDescriptorSet0.vp_c3)._m0[15].y, _252);
    float _260 = -_254;
    float _262 = fma(_238, (*spvDescriptorSet0.vp_c3)._m0[15].z, _260);
    float _264 = _246 * _242;
    float _266 = fma(_238, _242, _158);
    float _268 = _258 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _270 = _258 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _272 = fma(_264, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _274 = exp2(_250);
    float _276 = fma(_262, (*spvDescriptorSet0.vp_c3)._m0[15].y, _268);
    float _278 = -_270;
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c3)._m0[15].z, _278);
    float _282 = _240 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _284 = _244 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _286 = _276 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _288 = _276 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _290 = _258 * _282;
    float _292 = fma(_262, _282, _158);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c3)._m0[15].y, _286);
    float _296 = fma(_280, _284, _158);
    float _298 = -_288;
    float _300 = fma(_280, (*spvDescriptorSet0.vp_c3)._m0[15].z, _298);
    float _302 = _256 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _304 = _294 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _306 = _294 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _308 = fma(_248, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _310 = _274 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _312 = -_304;
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[15].z, _312);
    float _316 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[15].y, _306);
    float _318 = _294 * _302;
    float _320 = fma(_300, _302, _158);
    float _322 = fma(_314, _310, _158);
    float _324 = _276 * _284;
    float _326 = fma(_212, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _328 = _316 * _310;
    float _330 = fma(_290, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float2 _1323 = float2(_214, _326);
    float _336 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1323, float2(0.0), isnan(_1323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1323, float2(0.0), isnan(_1323)), level(0.0)).x;
    float2 _1331 = float2(_234, _308);
    float _338 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1331, float2(0.0), isnan(_1331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1331, float2(0.0), isnan(_1331)), level(0.0)).x;
    float2 _1339 = float2(_266, _272);
    float _340 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1339, float2(0.0), isnan(_1339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1339, float2(0.0), isnan(_1339)), level(0.0)).x;
    float2 _1347 = float2(_292, _330);
    float _342 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1347, float2(0.0), isnan(_1347)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1347, float2(0.0), isnan(_1347)), level(0.0)).x;
    float2 _1355 = float2(_296, _334);
    float _344 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1355, float2(0.0), isnan(_1355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1355, float2(0.0), isnan(_1355)), level(0.0)).x;
    float2 _1363 = float2(_320, _332);
    float _346 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1363, float2(0.0), isnan(_1363)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1363, float2(0.0), isnan(_1363)), level(0.0)).x;
    float _348 = fma(_328, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float2 _1376 = float2(_322, _348);
    float _350 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1376, float2(0.0), isnan(_1376)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1376, float2(0.0), isnan(_1376)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _352 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_36.x = 0.0;
    float _354 = 1.0 / _352;
    float _356 = -_354;
    float _358 = fma(_356, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _360 = -_230;
    float _362 = fma(_360, _358, 1.0);
    float _364 = 1.0 / _362;
    float _366 = _364 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _368 = -_78;
    bool _372 = _366 > _368;
    float _374 = _326;
    float _376 = _366;
    int _379 = as_type<int>(_214);
    float _381 = _50;
    if (!_372)
    {
        _374 = 0.0;
    }
    float _383 = _374;
    float _385 = _383;
    float _387 = _383;
    if (!_372)
    {
        _376 = 0.0;
    }
    float _389 = _376;
    bool _391 = !_372;
    float _393 = _389;
    float _395 = _389;
    if (!_391)
    {
        bool _397 = _50 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _399 = isnan(_50);
        bool _401 = _397 || _399;
        bool _403 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _405 = _401 || _403;
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _381 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        if (!_405)
        {
            _379 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[16].z);
        }
        int _407 = _379;
        if (_405)
        {
            _385 = 0.0;
        }
        float _409 = _385;
        float _411 = _409;
        if (_405)
        {
            _393 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
        float _413 = _393;
        _395 = _413;
        if (!_405)
        {
            out.m_36.x = as_type<float>(_407);
        }
        if (!_405)
        {
            _411 = (*spvDescriptorSet0.vp_c3)._m0[16].z;
        }
        float _415 = _411;
        _387 = _415;
        if (!_405)
        {
            _395 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
    }
    float _417 = _395;
    float _419 = _387;
    float _421 = _381;
    float _423 = -_336;
    float _425 = fma(_358, _423, 1.0);
    float _427 = 1.0 / _425;
    float _429 = _427 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _431 = -_78;
    bool _433 = _429 > _431;
    bool _435 = !_433;
    int _437 = as_type<int>(_419);
    float _439 = _417;
    float _441 = _417;
    float _443 = _419;
    float _445 = _421;
    if (!_435)
    {
        bool _447 = _96 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _449 = isnan(_96);
        bool _451 = _447 || _449;
        bool _453 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _455 = _451 || _453;
        float _457 = _417 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _457;
        _445 = _457;
        if (!_455)
        {
            float _459 = _419 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _437 = as_type<int>(_459);
        }
        int _461 = _437;
        _443 = as_type<float>(_461);
        if (_455)
        {
            _439 = _457;
        }
        float _463 = _439;
        float _465 = _463;
        if (!_455)
        {
            _465 = _457;
        }
        float _467 = _465;
        _441 = _467;
        if (!_455)
        {
            out.m_36.x = as_type<float>(_461);
        }
    }
    float _469 = _441;
    float _471 = _443;
    float _473 = _445;
    float _475 = -_338;
    float _477 = fma(_358, _475, 1.0);
    float _479 = 1.0 / _477;
    float _481 = _479 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _483 = -_78;
    bool _485 = _481 > _483;
    bool _487 = !_485;
    int _489 = as_type<int>(_471);
    float _491 = _469;
    float _493 = _469;
    float _495 = _471;
    float _497 = _473;
    if (!_487)
    {
        bool _499 = _82 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _501 = isnan(_82);
        bool _503 = _499 || _501;
        bool _505 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _507 = _503 || _505;
        float _509 = _469 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _509;
        _497 = _509;
        if (!_507)
        {
            float _511 = _471 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _489 = as_type<int>(_511);
        }
        int _513 = _489;
        _495 = as_type<float>(_513);
        if (_507)
        {
            _491 = _509;
        }
        float _515 = _491;
        float _517 = _515;
        if (!_507)
        {
            _517 = _509;
        }
        float _519 = _517;
        _493 = _519;
        if (!_507)
        {
            out.m_36.x = as_type<float>(_513);
        }
    }
    float _521 = _493;
    float _523 = _495;
    float _525 = _497;
    float _527 = -_340;
    float _529 = fma(_358, _527, 1.0);
    float _531 = 1.0 / _529;
    float _533 = _531 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _535 = -_78;
    bool _537 = _533 > _535;
    float _539 = _525;
    int _541 = as_type<int>(_523);
    float _543 = _523;
    if (!_537)
    {
        _539 = _521;
    }
    float _545 = _539;
    bool _547 = !_537;
    float _549 = _545;
    float _551 = _545;
    if (!_547)
    {
        bool _553 = _84 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _555 = isnan(_84);
        bool _557 = _553 || _555;
        bool _559 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _561 = _557 || _559;
        float _563 = _521 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _563;
        if (!_561)
        {
            float _565 = _523 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _541 = as_type<int>(_565);
        }
        int _567 = _541;
        _543 = as_type<float>(_567);
        if (_561)
        {
            _549 = _563;
        }
        float _569 = _549;
        float _571 = _569;
        if (!_561)
        {
            _571 = _563;
        }
        float _573 = _571;
        _551 = _573;
        if (!_561)
        {
            out.m_36.x = as_type<float>(_567);
        }
    }
    float _575 = _551;
    float _577 = _543;
    float _579 = -_342;
    float _581 = fma(_358, _579, 1.0);
    float _583 = -_344;
    float _585 = fma(_358, _583, 1.0);
    float _587 = -_346;
    float _589 = fma(_358, _587, 1.0);
    float _591 = -_350;
    float _593 = fma(_358, _591, 1.0);
    float _595 = 1.0 / _581;
    out.gl_Position.z = 1.0;
    float _597 = 1.0 / _585;
    float _599 = 1.0 / _589;
    float _601 = _595 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _603 = -_78;
    bool _605 = _601 > _603;
    float _607 = 1.0 / _593;
    float _609 = _597 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _611 = -_78;
    bool _613 = _609 > _611;
    float _615 = _599 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _617 = -_78;
    bool _619 = _615 > _617;
    float _621 = _607 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _623 = -_78;
    bool _625 = _621 > _623;
    bool _627 = !_605;
    int _629 = as_type<int>(_577);
    float _631 = _575;
    float _633 = _575;
    float _635 = _577;
    if (!_627)
    {
        bool _637 = _86 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _639 = isnan(_86);
        bool _641 = _637 || _639;
        bool _643 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _645 = _641 || _643;
        float _647 = _575 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _647;
        if (!_645)
        {
            float _649 = _577 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _629 = as_type<int>(_649);
        }
        int _651 = _629;
        _635 = as_type<float>(_651);
        if (_645)
        {
            _631 = _647;
        }
        float _653 = _631;
        float _655 = _653;
        if (!_645)
        {
            _655 = _647;
        }
        float _657 = _655;
        _633 = _657;
        if (!_645)
        {
            out.m_36.x = as_type<float>(_651);
        }
    }
    float _659 = _633;
    float _661 = _635;
    bool _663 = !_613;
    int _665 = as_type<int>(_661);
    float _667 = _659;
    float _669 = _659;
    float _671 = _661;
    if (!_663)
    {
        bool _673 = _88 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _675 = isnan(_88);
        bool _677 = _673 || _675;
        bool _679 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _681 = _677 || _679;
        float _683 = _659 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _683;
        if (!_681)
        {
            float _685 = _661 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _665 = as_type<int>(_685);
        }
        int _687 = _665;
        _671 = as_type<float>(_687);
        if (_681)
        {
            _667 = _683;
        }
        float _689 = _667;
        float _691 = _689;
        if (!_681)
        {
            _691 = _683;
        }
        float _693 = _691;
        _669 = _693;
        if (!_681)
        {
            out.m_36.x = as_type<float>(_687);
        }
    }
    float _695 = _669;
    float _697 = _671;
    bool _699 = !_619;
    int _701 = as_type<int>(_697);
    float _703 = _695;
    float _705 = _695;
    float _707 = _697;
    if (!_699)
    {
        bool _709 = _90 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _711 = isnan(_90);
        bool _713 = _709 || _711;
        bool _715 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _717 = _713 || _715;
        float _719 = _695 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _719;
        if (!_717)
        {
            float _721 = _697 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _701 = as_type<int>(_721);
        }
        int _723 = _701;
        _707 = as_type<float>(_723);
        if (_717)
        {
            _703 = _719;
        }
        float _725 = _703;
        float _727 = _725;
        if (!_717)
        {
            _727 = _719;
        }
        float _729 = _727;
        _705 = _729;
        if (!_717)
        {
            out.m_36.x = as_type<float>(_723);
        }
    }
    float _731 = _705;
    float _733 = _707;
    if (!_625)
    {
        return out;
    }
    bool _735 = _92 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
    bool _737 = isnan(_92);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
    bool _743 = _739 || _741;
    float _745 = _731 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    out.m_34.x = _745;
    if (_743)
    {
        return out;
    }
    float _747 = _733 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
    out.m_36.x = _747;
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
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _50 = in.m_27.x;
    float _52 = in.m_29.x;
    float _54 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _56 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _58 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _60 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _54);
    float _62 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _56);
    float _64 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _58);
    float _66 = in.m_31.x;
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _60);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _62);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _64);
    float _74 = _68 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _76 = _70 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _78 = _72 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _80 = _74 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _82 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _50);
    float _84 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _50);
    float _86 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _50);
    float _88 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _50);
    float _90 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _50);
    float _92 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _50);
    float _94 = _74 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _96 = _50 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _98 = abs(_50);
    float _100 = log2(_98);
    float _102 = _74 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _104 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[13].x, _94);
    float _106 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[10].x, _80);
    float _108 = fma(_76, (*spvDescriptorSet0.vp_c3)._m0[11].x, _102);
    float _110 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].z, _104);
    float _112 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].z, _106);
    float _114 = abs(_96);
    float _116 = log2(_114);
    float _118 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].z, _108);
    float _120 = _110 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _122 = _112 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _124 = _118 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _126 = abs(_82);
    float _128 = log2(_126);
    float _130 = _100 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _132 = 1.0 / _120;
    float _134 = _116 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _136 = exp2(_130);
    float _138 = _52 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _140 = _128 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _142 = abs(_84);
    float _144 = log2(_142);
    float _146 = _52 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _148 = _122 * _132;
    float _150 = _124 * _132;
    float _152 = -_146;
    float _154 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[15].z, _152);
    float _156 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[15].y, _138);
    float _158 = fma(_148, 0.5, 0.5);
    float _160 = exp2(_134);
    float _162 = _136 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _164 = _156 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _166 = _156 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _168 = fma(_150, -0.5, 0.5);
    float _170 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[15].y, _164);
    float _172 = -_166;
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c3)._m0[15].z, _172);
    float _176 = abs(_86);
    float _178 = log2(_176);
    float _180 = _144 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _182 = _156 * _162;
    float _184 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _186 = abs(_88);
    float _188 = log2(_186);
    float _190 = _160 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _192 = _170 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _194 = exp2(_140);
    float _196 = _178 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _198 = fma(_154, _162, _158);
    float _200 = -_192;
    float _202 = fma(_174, (*spvDescriptorSet0.vp_c3)._m0[15].z, _200);
    float _204 = abs(_90);
    float _206 = log2(_204);
    float _208 = _170 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _210 = _188 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _212 = _170 * _190;
    float _214 = fma(_174, _190, _158);
    float _216 = fma(_174, (*spvDescriptorSet0.vp_c3)._m0[15].y, _208);
    float _218 = exp2(_180);
    float _220 = _216 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _222 = _194 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _224 = abs(_92);
    float _226 = log2(_224);
    float _228 = _216 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float2 _1113 = float2(_198, _184);
    float _230 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1113, float2(0.0), isnan(_1113)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1113, float2(0.0), isnan(_1113)), level(0.0)).x;
    float _232 = _206 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _234 = fma(_202, _222, _158);
    float _236 = -_228;
    float _238 = fma(_202, (*spvDescriptorSet0.vp_c3)._m0[15].z, _236);
    float _240 = exp2(_196);
    float _242 = _218 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _244 = exp2(_210);
    float _246 = fma(_202, (*spvDescriptorSet0.vp_c3)._m0[15].y, _220);
    float _248 = _216 * _222;
    float _250 = _226 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _252 = _246 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _254 = _246 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _256 = exp2(_232);
    float _258 = fma(_238, (*spvDescriptorSet0.vp_c3)._m0[15].y, _252);
    float _260 = -_254;
    float _262 = fma(_238, (*spvDescriptorSet0.vp_c3)._m0[15].z, _260);
    float _264 = _246 * _242;
    float _266 = fma(_238, _242, _158);
    float _268 = _258 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _270 = _258 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _272 = fma(_264, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _274 = exp2(_250);
    float _276 = fma(_262, (*spvDescriptorSet0.vp_c3)._m0[15].y, _268);
    float _278 = -_270;
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c3)._m0[15].z, _278);
    float _282 = _240 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _284 = _244 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _286 = _276 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _288 = _276 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _290 = _258 * _282;
    float _292 = fma(_262, _282, _158);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c3)._m0[15].y, _286);
    float _296 = fma(_280, _284, _158);
    float _298 = -_288;
    float _300 = fma(_280, (*spvDescriptorSet0.vp_c3)._m0[15].z, _298);
    float _302 = _256 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _304 = _294 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _306 = _294 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _308 = fma(_248, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _310 = _274 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _312 = -_304;
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[15].z, _312);
    float _316 = fma(_300, (*spvDescriptorSet0.vp_c3)._m0[15].y, _306);
    float _318 = _294 * _302;
    float _320 = fma(_300, _302, _158);
    float _322 = fma(_314, _310, _158);
    float _324 = _276 * _284;
    float _326 = fma(_212, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _328 = _316 * _310;
    float _330 = fma(_290, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float2 _1323 = float2(_214, _326);
    float _336 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1323, float2(0.0), isnan(_1323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1323, float2(0.0), isnan(_1323)), level(0.0)).x;
    float2 _1331 = float2(_234, _308);
    float _338 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1331, float2(0.0), isnan(_1331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1331, float2(0.0), isnan(_1331)), level(0.0)).x;
    float2 _1339 = float2(_266, _272);
    float _340 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1339, float2(0.0), isnan(_1339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1339, float2(0.0), isnan(_1339)), level(0.0)).x;
    float2 _1347 = float2(_292, _330);
    float _342 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1347, float2(0.0), isnan(_1347)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1347, float2(0.0), isnan(_1347)), level(0.0)).x;
    float2 _1355 = float2(_296, _334);
    float _344 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1355, float2(0.0), isnan(_1355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1355, float2(0.0), isnan(_1355)), level(0.0)).x;
    float2 _1363 = float2(_320, _332);
    float _346 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1363, float2(0.0), isnan(_1363)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1363, float2(0.0), isnan(_1363)), level(0.0)).x;
    float _348 = fma(_328, (*spvDescriptorSet0.vp_c3)._m0[14].z, _168);
    float2 _1376 = float2(_322, _348);
    float _350 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1376, float2(0.0), isnan(_1376)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1376, float2(0.0), isnan(_1376)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _352 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_36.x = 0.0;
    float _354 = 1.0 / _352;
    float _356 = -_354;
    float _358 = fma(_356, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _360 = -_230;
    float _362 = fma(_360, _358, 1.0);
    float _364 = 1.0 / _362;
    float _366 = _364 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _368 = -_78;
    bool _372 = _366 > _368;
    float _374 = _326;
    float _376 = _366;
    int _379 = as_type<int>(_214);
    float _381 = _50;
    if (!_372)
    {
        _374 = 0.0;
    }
    float _383 = _374;
    float _385 = _383;
    float _387 = _383;
    if (!_372)
    {
        _376 = 0.0;
    }
    float _389 = _376;
    bool _391 = !_372;
    float _393 = _389;
    float _395 = _389;
    if (!_391)
    {
        bool _397 = _50 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _399 = isnan(_50);
        bool _401 = _397 || _399;
        bool _403 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _405 = _401 || _403;
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _381 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        if (!_405)
        {
            _379 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[16].z);
        }
        int _407 = _379;
        if (_405)
        {
            _385 = 0.0;
        }
        float _409 = _385;
        float _411 = _409;
        if (_405)
        {
            _393 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
        float _413 = _393;
        _395 = _413;
        if (!_405)
        {
            out.m_36.x = as_type<float>(_407);
        }
        if (!_405)
        {
            _411 = (*spvDescriptorSet0.vp_c3)._m0[16].z;
        }
        float _415 = _411;
        _387 = _415;
        if (!_405)
        {
            _395 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
    }
    float _417 = _395;
    float _419 = _387;
    float _421 = _381;
    float _423 = -_336;
    float _425 = fma(_358, _423, 1.0);
    float _427 = 1.0 / _425;
    float _429 = _427 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _431 = -_78;
    bool _433 = _429 > _431;
    bool _435 = !_433;
    int _437 = as_type<int>(_419);
    float _439 = _417;
    float _441 = _417;
    float _443 = _419;
    float _445 = _421;
    if (!_435)
    {
        bool _447 = _96 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _449 = isnan(_96);
        bool _451 = _447 || _449;
        bool _453 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _455 = _451 || _453;
        float _457 = _417 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _457;
        _445 = _457;
        if (!_455)
        {
            float _459 = _419 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _437 = as_type<int>(_459);
        }
        int _461 = _437;
        _443 = as_type<float>(_461);
        if (_455)
        {
            _439 = _457;
        }
        float _463 = _439;
        float _465 = _463;
        if (!_455)
        {
            _465 = _457;
        }
        float _467 = _465;
        _441 = _467;
        if (!_455)
        {
            out.m_36.x = as_type<float>(_461);
        }
    }
    float _469 = _441;
    float _471 = _443;
    float _473 = _445;
    float _475 = -_338;
    float _477 = fma(_358, _475, 1.0);
    float _479 = 1.0 / _477;
    float _481 = _479 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _483 = -_78;
    bool _485 = _481 > _483;
    bool _487 = !_485;
    int _489 = as_type<int>(_471);
    float _491 = _469;
    float _493 = _469;
    float _495 = _471;
    float _497 = _473;
    if (!_487)
    {
        bool _499 = _82 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _501 = isnan(_82);
        bool _503 = _499 || _501;
        bool _505 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _507 = _503 || _505;
        float _509 = _469 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _509;
        _497 = _509;
        if (!_507)
        {
            float _511 = _471 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _489 = as_type<int>(_511);
        }
        int _513 = _489;
        _495 = as_type<float>(_513);
        if (_507)
        {
            _491 = _509;
        }
        float _515 = _491;
        float _517 = _515;
        if (!_507)
        {
            _517 = _509;
        }
        float _519 = _517;
        _493 = _519;
        if (!_507)
        {
            out.m_36.x = as_type<float>(_513);
        }
    }
    float _521 = _493;
    float _523 = _495;
    float _525 = _497;
    float _527 = -_340;
    float _529 = fma(_358, _527, 1.0);
    float _531 = 1.0 / _529;
    float _533 = _531 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _535 = -_78;
    bool _537 = _533 > _535;
    float _539 = _525;
    int _541 = as_type<int>(_523);
    float _543 = _523;
    if (!_537)
    {
        _539 = _521;
    }
    float _545 = _539;
    bool _547 = !_537;
    float _549 = _545;
    float _551 = _545;
    if (!_547)
    {
        bool _553 = _84 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _555 = isnan(_84);
        bool _557 = _553 || _555;
        bool _559 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _561 = _557 || _559;
        float _563 = _521 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _563;
        if (!_561)
        {
            float _565 = _523 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _541 = as_type<int>(_565);
        }
        int _567 = _541;
        _543 = as_type<float>(_567);
        if (_561)
        {
            _549 = _563;
        }
        float _569 = _549;
        float _571 = _569;
        if (!_561)
        {
            _571 = _563;
        }
        float _573 = _571;
        _551 = _573;
        if (!_561)
        {
            out.m_36.x = as_type<float>(_567);
        }
    }
    float _575 = _551;
    float _577 = _543;
    float _579 = -_342;
    float _581 = fma(_358, _579, 1.0);
    float _583 = -_344;
    float _585 = fma(_358, _583, 1.0);
    float _587 = -_346;
    float _589 = fma(_358, _587, 1.0);
    float _591 = -_350;
    float _593 = fma(_358, _591, 1.0);
    float _595 = 1.0 / _581;
    out.gl_Position.z = 1.0;
    float _597 = 1.0 / _585;
    float _599 = 1.0 / _589;
    float _601 = _595 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _603 = -_78;
    bool _605 = _601 > _603;
    float _607 = 1.0 / _593;
    float _609 = _597 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _611 = -_78;
    bool _613 = _609 > _611;
    float _615 = _599 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _617 = -_78;
    bool _619 = _615 > _617;
    float _621 = _607 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _623 = -_78;
    bool _625 = _621 > _623;
    bool _627 = !_605;
    int _629 = as_type<int>(_577);
    float _631 = _575;
    float _633 = _575;
    float _635 = _577;
    if (!_627)
    {
        bool _637 = _86 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _639 = isnan(_86);
        bool _641 = _637 || _639;
        bool _643 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _645 = _641 || _643;
        float _647 = _575 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _647;
        if (!_645)
        {
            float _649 = _577 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _629 = as_type<int>(_649);
        }
        int _651 = _629;
        _635 = as_type<float>(_651);
        if (_645)
        {
            _631 = _647;
        }
        float _653 = _631;
        float _655 = _653;
        if (!_645)
        {
            _655 = _647;
        }
        float _657 = _655;
        _633 = _657;
        if (!_645)
        {
            out.m_36.x = as_type<float>(_651);
        }
    }
    float _659 = _633;
    float _661 = _635;
    bool _663 = !_613;
    int _665 = as_type<int>(_661);
    float _667 = _659;
    float _669 = _659;
    float _671 = _661;
    if (!_663)
    {
        bool _673 = _88 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _675 = isnan(_88);
        bool _677 = _673 || _675;
        bool _679 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _681 = _677 || _679;
        float _683 = _659 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _683;
        if (!_681)
        {
            float _685 = _661 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _665 = as_type<int>(_685);
        }
        int _687 = _665;
        _671 = as_type<float>(_687);
        if (_681)
        {
            _667 = _683;
        }
        float _689 = _667;
        float _691 = _689;
        if (!_681)
        {
            _691 = _683;
        }
        float _693 = _691;
        _669 = _693;
        if (!_681)
        {
            out.m_36.x = as_type<float>(_687);
        }
    }
    float _695 = _669;
    float _697 = _671;
    bool _699 = !_619;
    int _701 = as_type<int>(_697);
    float _703 = _695;
    float _705 = _695;
    float _707 = _697;
    if (!_699)
    {
        bool _709 = _90 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _711 = isnan(_90);
        bool _713 = _709 || _711;
        bool _715 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _717 = _713 || _715;
        float _719 = _695 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        out.m_34.x = _719;
        if (!_717)
        {
            float _721 = _697 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _701 = as_type<int>(_721);
        }
        int _723 = _701;
        _707 = as_type<float>(_723);
        if (_717)
        {
            _703 = _719;
        }
        float _725 = _703;
        float _727 = _725;
        if (!_717)
        {
            _727 = _719;
        }
        float _729 = _727;
        _705 = _729;
        if (!_717)
        {
            out.m_36.x = as_type<float>(_723);
        }
    }
    float _731 = _705;
    float _733 = _707;
    if (!_625)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _735 = _92 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
    bool _737 = isnan(_92);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
    bool _743 = _739 || _741;
    float _745 = _731 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    out.m_34.x = _745;
    if (_743)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _747 = _733 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
    out.m_36.x = _747;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

