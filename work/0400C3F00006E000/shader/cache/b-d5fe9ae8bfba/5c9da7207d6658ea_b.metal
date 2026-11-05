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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1242 = false;
    bool _1100 = false;
    bool _812 = false;
    bool _560 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3200 = as_type<float>(_112);
        out.gl_Position.z = _3200;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = _130;
    if (_126)
    {
        float _136 = float(_96);
        _132 = _136;
    }
    float _138 = _132;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    if (_144)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _106;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3269 = as_type<float>(_150);
        out.gl_Position.z = _3269;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_47.x;
    float _154 = in.m_47.y;
    float _156 = in.m_47.z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _172 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _170);
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _174);
    float _178 = _174;
    float _180 = _158;
    if (!_168)
    {
        float _182 = _158 * _158;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _172);
    float _190 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _176);
    float _192 = _186;
    if (!_168)
    {
        float _194 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    float _236 = _232;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _158 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _180 = _256;
    }
    float _258 = _180;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = _264;
    if (!_168)
    {
        float _268 = _130 * _130;
        float _270 = _268 * 0.5;
        _236 = _270;
    }
    float _272 = _236;
    float _274 = fma(_258, _152, _260);
    float _276 = fma(_258, _154, _262);
    float _278 = fma(_258, _156, _264);
    float _280 = _272;
    if (!_168)
    {
        float _282 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _282;
    }
    float _284 = _280;
    bool _286 = !_168;
    float _288 = _284;
    if (!_286)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _130 * _292;
        float _302 = exp2(_300);
        float _304 = _298 * 0.693147182464599609375;
        float _306 = 1.0 / _304;
        float _308 = 1.0 / _296;
        float _310 = _302 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _306, _130);
        float _316 = _314 * _308;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _318;
        _266 = _302;
    }
    float _320 = _288;
    float _322 = _266;
    float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = _322;
    if (!_168)
    {
        _326 = _130;
    }
    float _328 = _326;
    bool _330 = !_168;
    float _332 = _328;
    if (!_330)
    {
        float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _336 = log2(_334);
        float _338 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _340 = _338 + 1.0;
        float _342 = 1.0 / _340;
        float _344 = _130 * _336;
        float _346 = exp2(_344);
        float _348 = -_346;
        float _350 = _348 + 1.0;
        float _352 = _350 * _342;
        _332 = _352;
    }
    float _354 = _332;
    float _356 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _358 = fma(_354, _154, _324);
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _362 = fma(_354, _152, _356);
    float _364 = -_358;
    float _366 = _276 + _364;
    float _368 = fma(_354, _156, _360);
    float _370 = -_362;
    float _372 = _274 + _370;
    float _374 = _366 * _366;
    float _376 = -_368;
    float _378 = _278 + _376;
    float _380 = sqrt(_190);
    float _382 = fma(_372, _372, _374);
    float _384 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _386 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _388 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _390 = fma(_378, _378, _382);
    float _392 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _384);
    float _394 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].y, _386);
    float _396 = sqrt(_188);
    float _398 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _400 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _392);
    float _402 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _404 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].x, _388);
    float _406 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].y, _394);
    float _408 = in.m_49.w;
    float _410 = sqrt(_390);
    float _412 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].x, _404);
    float _414 = in.m_42.x;
    float _416 = in.m_42.y;
    float _418 = in.m_42.z;
    float _420 = _380 * _406;
    float _422 = _420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _424 = sqrt(_400);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].z, _398);
    float _428 = _396 * _412;
    float _430 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].w, _402);
    float _432 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].z, _426);
    float _434 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _422);
    float _436 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].w, _430);
    bool _438 = _410 >= 9.9999999747524270787835121154785e-07;
    bool _440 = isnan(_410);
    bool _442 = _438 || _440;
    bool _444 = isnan(9.9999999747524270787835121154785e-07);
    bool _446 = _442 || _444;
    float _448 = _420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _450 = _420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _452 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _448);
    float _454 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _450);
    float _456 = _424 * _432;
    float _458 = fma(_274, _408, _414);
    float _460 = fma(_276, _408, _416);
    float _462 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[24].z, _434);
    float _464 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[25].z, _452);
    float _466 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[26].z, _454);
    float _468 = fma(_278, _408, _418);
    float _470 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[24].w, _462);
    float _472 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[25].w, _464);
    float _474 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[26].w, _466);
    float _476 = _436;
    float _478 = _472;
    float _480 = _474;
    if (_446)
    {
        _476 = _470;
    }
    float _482 = _476;
    float _484 = _482;
    if (!_446)
    {
        bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _488 = !_486;
        if (!_488)
        {
            float _490 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _492 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _496 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _490);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _492);
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _494);
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _496);
            float _506 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _498);
            float _508 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _500);
            float _510 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _504);
            float _512 = _380 * _506;
            float _514 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _502);
            float _516 = _396 * _508;
            float _518 = _512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _520 = _424 * _514;
            float _522 = _512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _524 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[25].x, _518);
            float _526 = _512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _528 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[24].x, _522);
            float _530 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].z, _524);
            float _532 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[26].x, _526);
            float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].z, _528);
            float _536 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[25].w, _530);
            float _538 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].z, _532);
            float _540 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[24].w, _534);
            float _542 = _536 * _536;
            float _544 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[26].w, _538);
            float _546 = fma(_540, _540, _542);
            float _548 = fma(_544, _544, _546);
            float _550 = rsqrt(_548);
            float _552 = _550 * 9.9999999747524270787835121154785e-07;
            float _554 = _540 * _552;
            float _556 = _536 * _552;
            float _558 = _544 * _552;
            _478 = _556;
            _484 = _554;
            _480 = _558;
            _560 = true;
        }
        else
        {
            float _562 = _154 * _154;
            float _564 = fma(_152, _152, _562);
            float _566 = fma(_156, _156, _564);
            float _568 = sqrt(_566);
            bool _570 = _568 >= 9.9999999747524270787835121154785e-07;
            bool _572 = isnan(_568);
            bool _574 = _570 || _572;
            bool _576 = isnan(9.9999999747524270787835121154785e-07);
            bool _578 = _574 || _576;
            if (!_578)
            {
                float _580 = _416 * _416;
                float _582 = fma(_414, _414, _580);
                float _584 = fma(_418, _418, _582);
                float _586 = sqrt(_584);
                bool _588 = _586 >= 9.9999999747524270787835121154785e-07;
                bool _590 = isnan(_586);
                bool _592 = _588 || _590;
                bool _594 = isnan(9.9999999747524270787835121154785e-07);
                bool _596 = _592 || _594;
                if (!_596)
                {
                    float _598 = _380 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _600 = _396 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _602 = _424 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _604 = _598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _606 = _598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _608 = _598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _610 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[25].x, _604);
                    float _612 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[24].x, _606);
                    float _614 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[26].x, _608);
                    float _616 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _610);
                    float _618 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _612);
                    float _620 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _614);
                    float _622 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _616);
                    float _624 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _618);
                    float _626 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _620);
                    float _628 = _622 * _622;
                    float _630 = fma(_624, _624, _628);
                    float _632 = fma(_626, _626, _630);
                    float _634 = rsqrt(_632);
                    float _636 = _634 * 9.9999999747524270787835121154785e-07;
                    float _638 = _622 * _636;
                    float _640 = _624 * _636;
                    float _642 = _626 * _636;
                    _478 = _638;
                    _484 = _640;
                    _480 = _642;
                    _560 = true;
                }
                else
                {
                    float _644 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _646 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _648 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _650 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _652 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].y, _644);
                    float _654 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].x, _646);
                    float _656 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].z, _648);
                    float _658 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].w, _650);
                    float _660 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].y, _652);
                    float _662 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].x, _654);
                    float _664 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].z, _656);
                    float _666 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].w, _658);
                    float _668 = _380 * _660;
                    float _670 = _396 * _662;
                    float _672 = _424 * _664;
                    float _674 = _668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _676 = _668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _678 = _668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _680 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _674);
                    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _676);
                    float _684 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _678);
                    float _686 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _680);
                    float _688 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _682);
                    float _690 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _684);
                    float _692 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].w, _686);
                    float _694 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].w, _688);
                    float _696 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].w, _690);
                    float _698 = _692 * _692;
                    float _700 = fma(_694, _694, _698);
                    float _702 = fma(_696, _696, _700);
                    float _704 = rsqrt(_702);
                    float _706 = _704 * 9.9999999747524270787835121154785e-07;
                    float _708 = _694 * _706;
                    float _710 = _692 * _706;
                    float _712 = _696 * _706;
                    _478 = _710;
                    _484 = _708;
                    _480 = _712;
                    _560 = true;
                }
            }
            else
            {
                float _714 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _716 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _718 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _720 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _722 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].y, _714);
                float _724 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].x, _716);
                float _726 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].z, _718);
                float _728 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].w, _720);
                float _730 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].y, _722);
                float _732 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].x, _724);
                float _734 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].z, _726);
                float _736 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].w, _728);
                float _738 = _380 * _730;
                float _740 = _396 * _732;
                float _742 = _424 * _734;
                float _744 = _738 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _746 = _738 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _748 = _738 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _750 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[25].x, _744);
                float _752 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[24].x, _746);
                float _754 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[26].x, _748);
                float _756 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].z, _750);
                float _758 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].z, _752);
                float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].z, _754);
                float _762 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].w, _756);
                float _764 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].w, _758);
                float _766 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].w, _760);
                float _768 = _762 * _762;
                float _770 = fma(_764, _764, _768);
                float _772 = fma(_766, _766, _770);
                float _774 = rsqrt(_772);
                float _776 = _774 * 9.9999999747524270787835121154785e-07;
                float _778 = _764 * _776;
                float _780 = _762 * _776;
                float _782 = _766 * _776;
                _478 = _780;
                _484 = _778;
                _480 = _782;
            }
        }
    }
    _560 = false;
    float _784 = _478;
    float _786 = _484;
    float _788 = _480;
    bool _790 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _792 = !_790;
    float _810;
    if (!_792)
    {
        float _794 = in.m_51.x;
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _798 = _794 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _802 = _800 * _796;
        float _804 = floor(_802);
        float _806 = -_804;
        float _808 = _802 + _806;
        _810 = _808;
        _812 = true;
    }
    else
    {
        float _814 = float(_96);
        float _816 = 1.0 / _814;
        float _818 = _130 * _816;
        _810 = _818;
    }
    _812 = false;
    float _820 = _810;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _824 = _820 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _828 = _820 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _832 = _820 + _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _850 = 1.0 / _836;
    bool _852 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _854 = isnan(_820);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    bool _864 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _866 = isnan(_820);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = 1.0 / _840;
    float _878 = -_874;
    float _880 = _878 + 1.0;
    bool _882 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _884 = 1.0 / _844;
    float _886 = _824 * _850;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _890 = _820 + _888;
    float _892 = 1.0 / _848;
    float _894 = _828 * _876;
    bool _896 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _898 = isnan(_820);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -_906;
    float _910 = _908 + 1.0;
    float _912 = _832 * _884;
    float _914 = _890 * _892;
    bool _916 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _918 = isnan(_820);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _928;
    float _932 = _926 * _910;
    float _934 = -_926;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _942;
    float _946 = fma(_930, _886, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _948 = _862 * _936;
    float _950 = -_862;
    float _952 = _950 + 1.0;
    float _954 = fma(_940, _886, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _956 = fma(_944, _886, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _958 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _960 = isnan(_820);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _874 * _952;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _984 = _968 * _880;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _986;
    float _990 = fma(_978, _894, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _992 = fma(_982, _894, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _994 = _954 * _984;
    float _996 = _956 * _984;
    float _998 = _946 * _984;
    float _1000 = -_968;
    float _1002 = _1000 + 1.0;
    float _1004 = in.m_49.x;
    float _1006 = in.m_49.y;
    float _1008 = in.m_49.z;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1014;
    float _1018 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[143].x, _994);
    float _1020 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[143].y, _996);
    float _1022 = fma(_974, _894, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[143].z, _998);
    float _1026 = fma(_1012, _912, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1028 = fma(_988, _912, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1030 = fma(_1016, _912, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1032 = fma(_990, _970, _1018);
    float _1034 = fma(_992, _970, _1020);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1048 = fma(_1022, _970, _1024);
    float _1050 = fma(_1038, _914, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1052 = fma(_1042, _914, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1054 = fma(_1046, _914, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _1056 = fma(_1026, _948, _1032);
    float _1058 = fma(_1028, _948, _1034);
    float _1060 = fma(_1030, _948, _1048);
    float _1062 = fma(_1050, _932, _1056);
    float _1064 = fma(_1052, _932, _1058);
    float _1066 = fma(_1054, _932, _1060);
    float _1068 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1062);
    float _1070 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1064);
    float _1072 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1066);
    float _1074 = _1068 * _1004;
    float _1076 = _1070 * _1006;
    float _1078 = _1072 * _1008;
    bool _1080 = !_882;
    float _1098;
    if (!_1080)
    {
        float _1082 = in.m_51.x;
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1086 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _1090 = _1088 * _1084;
        float _1092 = floor(_1090);
        float _1094 = -_1092;
        float _1096 = _1090 + _1094;
        _1098 = _1096;
        _1100 = true;
    }
    else
    {
        float _1102 = float(_96);
        float _1104 = 1.0 / _1102;
        float _1106 = _130 * _1104;
        _1098 = _1106;
    }
    _1100 = false;
    float _1108 = _1098;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1112 = _1108 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1118 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1120 = isnan(_1108);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1134 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1136 = isnan(_1108);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1146;
    bool _1150 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1152 = isnan(_1108);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = 1.0 / _1116;
    float _1164 = -_1128;
    float _1166 = _1164 + 1.0;
    bool _1168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1170 = -_1160;
    float _1172 = _1170 + 1.0;
    float _1174 = 1.0 / _1132;
    float _1176 = _1128 * _1172;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1180 = _1148 * _1162;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1188 = fma(_1180, _1112, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1190 = _1144 * _1166;
    float _1192 = -_1144;
    float _1194 = _1192 + 1.0;
    float _1196 = _1184 * _1174;
    float _1198 = _1188 * _1190;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1202 = _1108 + _1200;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1198);
    float _1206 = fma(_1196, _1202, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1208 = fma(_1206, _1176, _1204);
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1214 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1208);
    float _1216 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1216;
    out.m_53.y = _1186;
    out.m_53.z = _1218;
    out.m_53.w = _1220;
    bool _1222 = !_1168;
    float _1240;
    if (!_1222)
    {
        float _1224 = in.m_51.x;
        float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1228 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _1232 = _1230 * _1226;
        float _1234 = floor(_1232);
        float _1236 = -_1234;
        float _1238 = _1232 + _1236;
        _1240 = _1238;
        _1242 = true;
    }
    else
    {
        float _1244 = float(_96);
        float _1246 = 1.0 / _1244;
        float _1248 = _130 * _1246;
        _1240 = _1248;
    }
    _1242 = false;
    float _1250 = _1240;
    float _1252 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1254 = log2(_1252);
    float _1256 = in.m_51.x;
    float _1258 = in.m_51.y;
    float _1260 = _784 * _784;
    float _1262 = in.m_51.z;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1268 = 1.0 + _1266;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1280 = _1278 != 0;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1284 = _1282 != 0;
    float _1286 = fma(_786, _786, _1260);
    float _1288 = _1254 * _130;
    float _1290 = fma(_788, _788, _1286);
    float _1292 = 1.0 / _1268;
    float _1294 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1296 = exp2(_1288);
    float _1298 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1300 = _1256 * 2.0;
    float _1302 = _1262 * 2.0;
    float _1304 = fma(_1294, -2.0, _1264);
    float _1306 = -_1272;
    float _1308 = fma(_1298, 2.0, _1306);
    bool _1310 = !_1276;
    int _1312 = _1310 ? 0 : 1;
    float _1314 = floor(_1302);
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _1326 = _1324 != 0;
    float _1328 = _1258 * 2.0;
    float _1330 = -_130;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1308);
    float _1334 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1304);
    bool _1336 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1338 = isnan(1.0);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1344 = _1340 || _1342;
    float _1346 = -_1296;
    float _1348 = _1346 + 1.0;
    bool _1350 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1352 = isnan(0.0);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1358 = _1354 || _1356;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1364 = floor(_1300);
    float _1366 = _1358 ? _1348 : 0.0;
    float _1368 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1360);
    float _1370 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1362);
    float _1372 = _1258 + _1256;
    bool _1374 = _1314 >= 0.0;
    bool _1376 = isnan(_1314);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1368);
    float _1386 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1370);
    float _1388 = floor(_1328);
    if (_1344)
    {
        float _1390 = _1366 * _1292;
        _134 = _1390;
    }
    float _1392 = _134;
    bool _1394 = _1314 > 0.0;
    float _1396 = _1258 + _1262;
    float _1398 = _1372 + (-1.0);
    float _1400 = _1396 + (-1.0);
    float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _1404 = _1382 ? 0 : 1;
    float _1406 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1408 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1410 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _1412 = ~_1404;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    float _1418 = rsqrt(_1290);
    int _1420 = _1416;
    if (!_1394)
    {
        int _1422 = ~_1404;
        int _1424 = _1422 + 1;
        _1420 = _1424;
    }
    int _1426 = _1420;
    float _1428 = _1410 * _1270;
    bool _1430 = _1364 > 0.0;
    float _1432 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _1434 = _1388 > 0.0;
    float _1436 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1428);
    bool _1438 = !_1284;
    int _1440 = _1438 ? 0 : 1;
    float _1442 = _1432 * _1402;
    bool _1444 = !_1280;
    int _1446 = _1444 ? 0 : 1;
    float _1448 = _1436 + 0.25;
    bool _1450 = _1364 >= 0.0;
    bool _1452 = isnan(_1364);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.0);
    bool _1458 = _1454 || _1456;
    float _1460 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1442);
    bool _1462 = _1388 >= 0.0;
    bool _1464 = isnan(_1388);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan(0.0);
    bool _1470 = _1466 || _1468;
    float _1472 = floor(_1436);
    float _1474 = _1418 * _786;
    int _1476 = _1458 ? 0 : 1;
    float _1478 = _1418 * _784;
    int _1480 = _1470 ? 0 : 1;
    float _1482 = _1418 * _788;
    bool _1484 = !_1326;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = floor(_1460);
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1492 = _1490 != 0;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1496 = _1494 != 0;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1500 = _1498 != 0;
    int _1502 = ~_1476;
    int _1504 = _1502 + 1;
    int _1506 = _1504 + 1;
    int _1508 = ~_1480;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    int _1514 = _1506;
    int _1516 = _1512;
    if (!_1430)
    {
        int _1518 = ~_1476;
        int _1520 = _1518 + 1;
        _1514 = _1520;
    }
    int _1522 = _1514;
    if (!_1434)
    {
        int _1524 = ~_1480;
        int _1526 = _1524 + 1;
        _1516 = _1526;
    }
    int _1528 = _1516;
    bool _1530 = !_1496;
    int _1532 = _1530 ? 0 : 1;
    float _1534 = in.m_55.x;
    float _1536 = in.m_55.y;
    float _1538 = in.m_55.z;
    bool _1540 = !_1500;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = abs(_1532);
    float _1546 = -_1488;
    float _1548 = _1460 + _1546;
    int _1550 = abs(_1542);
    float _1552 = _1460 + 0.25;
    float _1554 = float(_1426);
    float _1556 = _1460 * 6.283185482025146484375;
    float _1558 = float(_1522);
    float _1560 = floor(_1448);
    float _1562 = float(_1544);
    bool _1564 = !_1492;
    int _1566 = _1564 ? 0 : 1;
    float _1568 = float(_1528);
    float _1570 = _1562 * _1558;
    int _1572 = abs(_1566);
    float _1574 = floor(_1552);
    float _1576 = float(_1550);
    float _1578 = -_1472;
    float _1580 = _1436 + _1578;
    float _1582 = _1570 * (-2.0);
    float _1584 = float(_1572);
    float _1586 = _1436 * 6.283185482025146484375;
    bool _1588 = _1548 >= 0.5;
    bool _1590 = isnan(_1548);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(0.5);
    bool _1596 = _1592 || _1594;
    float _1598 = _1258 + (-0.5);
    bool _1600 = _1580 >= 0.5;
    bool _1602 = isnan(_1580);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan(0.5);
    bool _1608 = _1604 || _1606;
    float _1610 = -_1560;
    float _1612 = _1448 + _1610;
    float _1614 = fma(_1582, _1536, _1536);
    float _1616 = _1584 * _1554;
    float _1618 = _1576 * _1568;
    float _1620 = _1586 * 0.15915493667125701904296875;
    float _1622 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1614);
    bool _1624 = !_1322;
    int _1626 = _1624 ? 0 : 1;
    float _1628 = -_1574;
    float _1630 = _1552 + _1628;
    float _1632 = fma(_1406, _1582, _1406);
    float _1634 = _1556 * 0.15915493667125701904296875;
    int _1636 = abs(_1446);
    float _1638 = _1618 * (-2.0);
    float _1640 = _1620 * 6.283185482025146484375;
    float _1642 = sin(_1640);
    bool _1644 = !_1608;
    float _1646 = _1644 ? 0.5 : (-0.5);
    bool _1648 = _1612 > 0.5;
    int _1650 = abs(_1626);
    bool _1652 = !_1596;
    float _1654 = _1652 ? 0.5 : (-0.5);
    float _1656 = _1634 * 6.283185482025146484375;
    float _1658 = sin(_1656);
    float _1660 = float(_1636);
    float _1662 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1664 = _1662 * 2.0;
    float _1666 = float(_1650);
    float _1668 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1670 = _1668 * 2.0;
    bool _1672 = !_1318;
    int _1674 = _1672 ? 0 : 1;
    float _1676 = _1660 * _1664;
    int _1678 = abs(_1312);
    float _1680 = _1666 * _1670;
    int _1682 = abs(_1674);
    float _1684 = _1612;
    float _1686 = _1630;
    if (_1648)
    {
        float _1688 = -_1612;
        float _1690 = _1688 + 1.0;
        _1684 = _1690;
    }
    float _1692 = _1684;
    bool _1694 = _1630 > 0.5;
    float _1696 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1698 = abs(_1440);
    float _1700 = fma(_1692, 4.0, -1.0);
    float _1702 = float(_1678);
    float _1704 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1706 = float(_1682);
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1710 = fma(_1702, _1696, _1676);
    int _1712 = abs(_1486);
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1716 = _1482 * _1714;
    float _1718 = float(_1698);
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1722 = _1478 * _1720;
    if (_1694)
    {
        float _1724 = -_1630;
        float _1726 = _1724 + 1.0;
        _1686 = _1726;
    }
    float _1728 = _1686;
    float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1732 = -_1716;
    float _1734 = fma(_1474, _1730, _1732);
    float _1736 = fma(_1706, _1704, _1680);
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1740 = -_1722;
    float _1742 = fma(_1482, _1738, _1740);
    float _1744 = fma(_1718, _1708, _1710);
    float _1746 = _1734 * _1734;
    float _1748 = fma(_1728, 4.0, -1.0);
    float _1750 = _1616 * (-2.0);
    float _1752 = fma(_1744, 3.1415927410125732421875, _1534);
    float _1754 = fma(_1742, _1742, _1746);
    float _1756 = fma(_1632, _1392, _1622);
    float _1758 = float(_1712);
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1762 = fma(_1408, _1750, _1408);
    float _1764 = fma(_1752, _1750, _1752);
    float _1766 = _1262 + _1256;
    float _1768 = _1756 * 0.15915493667125701904296875;
    float _1770 = fma(_1758, _1760, _1736);
    float _1772 = _1256 + (-0.5);
    float _1774 = _1766 + (-1.0);
    float _1776 = fma(_1770, 3.1415927410125732421875, _1538);
    float _1778 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1764);
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1782 = _1474 * _1780;
    float _1784 = in.m_57.x;
    float _1786 = in.m_57.y;
    float _1788 = in.m_57.z;
    float _1790 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1792 = _1262 + (-0.5);
    float _1794 = fma(_1776, _1638, _1776);
    float _1796 = fma(_1762, _1392, _1778);
    float _1798 = fma(_1790, _1638, _1790);
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1802 = -_1782;
    float _1804 = fma(_1478, _1800, _1802);
    float _1806 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1794);
    float _1808 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1810 = _1796 * 0.15915493667125701904296875;
    float _1812 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1814 = fma(_1798, _1392, _1806);
    float _1816 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1818 = fma(_1804, _1804, _1754);
    float _1820 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1822 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1808);
    float _1824 = _1814 * 0.15915493667125701904296875;
    float _1826 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1812);
    float _1828 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1816);
    float _1830 = rsqrt(_1818);
    float _1832 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1820);
    float _1834 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1822);
    float _1836 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1826);
    float _1838 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1828);
    float _1840 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1832);
    float _1842 = _1834 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1844 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1846 = _1768 * 6.283185482025146484375;
    float _1848 = cos(_1846);
    float _1850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1784);
    float _1852 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1854 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1788);
    float _1858 = _1844 * _1850;
    float _1860 = _1836 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1862 = _396 * _1842;
    float _1864 = _1810 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1786);
    float _1870 = _380 * _1860;
    float _1872 = _1742 * _1830;
    float _1874 = _1854 * _1856;
    float _1876 = _1852 * _1868;
    float _1878 = _1804 * _1830;
    float _1880 = _1734 * _1830;
    float _1882 = _1810 * 6.283185482025146484375;
    float _1884 = cos(_1882);
    float _1886 = _1840 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1888 = _1824 * 6.283185482025146484375;
    float _1890 = cos(_1888);
    float _1892 = _1866 * _1848;
    float _1894 = _1768 * 6.283185482025146484375;
    float _1896 = sin(_1894);
    float _1898 = _1884 * _1848;
    float _1900 = _1824 * 6.283185482025146484375;
    float _1902 = sin(_1900);
    float _1904 = _1848 * _1890;
    float _1906 = _1884 * _1890;
    float _1908 = _1884 * _1896;
    float _1910 = _1866 * _1896;
    float _1912 = _1866 * _1890;
    float _1914 = _1896 * _1890;
    float _1916 = _1906 * _1474;
    float _1918 = -_1908;
    float _1920 = fma(_1902, _1892, _1918);
    float _1922 = fma(_1902, _1898, _1910);
    float _1924 = -_1892;
    float _1926 = fma(_1902, _1908, _1924);
    float _1928 = fma(_1902, _1910, _1898);
    float _1930 = _1478 * _1878;
    float _1932 = _1922 * _1474;
    float _1934 = _1926 * _1474;
    float _1936 = _1838 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1938 = -_1930;
    float _1940 = fma(_1482, _1880, _1938);
    float _1942 = -_1902;
    float _1944 = fma(_1942, _1872, _1916);
    float _1946 = fma(_1904, _1872, _1932);
    float _1948 = fma(_1914, _1872, _1934);
    float _1950 = _1474 * _1880;
    float _1952 = fma(_1912, _1940, _1944);
    float _1954 = fma(_1920, _1940, _1946);
    float _1956 = fma(_1928, _1940, _1948);
    float _1958 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1960 = _1906 * _1482;
    float _1962 = _424 * _1936;
    float _1964 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1966 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1958);
    float _1968 = -_1950;
    float _1970 = fma(_1478, _1872, _1968);
    float _1972 = _1922 * _1482;
    float _1974 = -_1902;
    float _1976 = fma(_1974, _1878, _1960);
    float _1978 = _1926 * _1482;
    float _1980 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1964);
    float _1982 = fma(_1904, _1878, _1972);
    float _1984 = fma(_1912, _1970, _1976);
    float _1986 = fma(_1914, _1878, _1978);
    float _1988 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1980);
    float _1990 = fma(_1920, _1970, _1982);
    float _1992 = _1876 * _1984;
    float _1994 = fma(_1928, _1970, _1986);
    float _1996 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1966);
    float _1998 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1988);
    float _2000 = _1876 * _1952;
    float _2002 = fma(_1858, _1990, _1992);
    float _2004 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1996);
    float _2006 = _1998 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _2008 = fma(_1858, _1954, _2000);
    float _2010 = fma(_1874, _1994, _2002);
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _2014 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2016 = fma(_1874, _1956, _2008);
    float _2018 = _2006 + _2010;
    float _2020 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2014);
    float _2022 = _2012 + _2016;
    float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2026 = _2018 + _2024;
    float _2028 = _1482 * _1872;
    float _2030 = _1906 * _1478;
    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2034 = _2022 + _2032;
    float _2036 = _2026 * _2026;
    float _2038 = -_2028;
    float _2040 = fma(_1474, _1878, _2038);
    float _2042 = _1922 * _1478;
    float _2044 = -_1902;
    float _2046 = fma(_2044, _1880, _2030);
    float _2048 = fma(_2034, _2034, _2036);
    float _2050 = _1926 * _1478;
    float _2052 = fma(_1904, _1880, _2042);
    float _2054 = fma(_1912, _2040, _2046);
    float _2056 = sqrt(_2048);
    float _2058 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2020);
    float _2060 = fma(_1914, _1880, _2050);
    float _2062 = fma(_1920, _2040, _2052);
    float _2064 = _1876 * _2054;
    float _2066 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2058);
    float _2068 = fma(_1928, _2040, _2060);
    float _2070 = fma(_1858, _2062, _2064);
    float _2072 = _2066 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2074 = fma(_1874, _2068, _2070);
    bool _2076 = _2056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2078 = _2072 + _2074;
    float _2080 = _1874;
    float _2082 = _1858;
    float _2084 = _2014;
    float _2086 = _1886;
    float _2088 = _2052;
    float _2090 = _1902;
    float _2092 = _1784;
    if (!_2076)
    {
        _2080 = _2022;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (!_2076)
    {
        _2082 = _2018;
    }
    float _2098 = _2082;
    float _2100 = _2098;
    if (!_2076)
    {
        _2084 = _2078;
    }
    float _2102 = _2084;
    bool _2104 = !_2076;
    float _2106 = _2102;
    if (!_2104)
    {
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2112 = _2056 + _2110;
        float _2114 = rsqrt(_2048);
        float _2116 = _2112 * _2108;
        float _2118 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2120 = _2116 * 0.15915493667125701904296875;
        float _2122 = _2120 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        float _2126 = _2120 * 6.283185482025146484375;
        float _2128 = cos(_2126);
        float _2130 = fma(_2124, _2118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2132 = _2114 * _2130;
        float _2134 = _2128 + (-1.0);
        float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2138 = fma(_2034, _2132, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2140 = fma(_2026, _2132, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2142 = fma(_2078, _2128, _2136);
        _2106 = _2142;
        _2096 = _2138;
        _2100 = _2140;
    }
    float _2144 = _2106;
    float _2146 = _2096;
    float _2148 = _2100;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2152 = _2144 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2156 = _2146 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2160 = _2148 + _2158;
    float _2162 = _2152 * _2152;
    float _2164 = fma(_2156, _2156, _2162);
    float _2166 = fma(_2160, _2160, _2164);
    float _2168 = rsqrt(_2166);
    float _2170 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2172 = _2156 * _2170;
    float _2174 = _2160 * _2170;
    float _2176 = _2172 * _2172;
    float _2178 = _2174 * _2174;
    float _2180 = _2176 + _2178;
    float _2182 = sqrt(_2180);
    bool _2184 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2188 = _2182 + _2186;
    float _2190 = _2060;
    float _2192 = _2180;
    float _2194 = _2188;
    if (_2184)
    {
        float _2196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2190 = _2196;
    }
    float _2198 = _2190;
    if (_2184)
    {
        float _2200 = rsqrt(_2180);
        _2192 = _2200;
    }
    float _2202 = _2192;
    if (_2184)
    {
        float _2204 = _2188 * _2198;
        _2194 = _2204;
    }
    float _2206 = _2194;
    if (_2184)
    {
        float _2208 = _2206 * 0.15915493667125701904296875;
        _2086 = _2208;
    }
    float _2210 = _2086;
    float _2212 = _2046;
    float _2214 = _2210;
    if (_2184)
    {
        float _2216 = _2210 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        _2212 = _2218;
    }
    float _2220 = _2212;
    float _2222 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2224 = precise::max(0.0, _2222);
    float _2226 = _2020;
    float _2228 = _2224;
    float _2230 = _2222;
    if (_2184)
    {
        float _2232 = _2210 * 6.283185482025146484375;
        float _2234 = cos(_2232);
        _2226 = _2234;
    }
    float _2236 = _2226;
    float _2238 = -_2170;
    float _2240 = -_2224;
    float _2242 = fma(_2152, _2238, _2240);
    if (_2184)
    {
        float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2228 = _2244;
    }
    float _2246 = _2228;
    float _2248 = _2246;
    float _2250 = _2220;
    if (_2184)
    {
        float _2252 = fma(_2220, _2246, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2088 = _2252;
    }
    float _2254 = _2088;
    if (!_2184)
    {
        _2248 = _2172;
    }
    float _2256 = _2248;
    float _2258 = _2256;
    if (!_2184)
    {
        _2250 = _2242;
    }
    float _2260 = _2250;
    float _2262 = _2260;
    float _2264 = _2236;
    if (_2184)
    {
        float _2266 = _2236 + (-1.0);
        _2230 = _2266;
    }
    float _2268 = _2230;
    float _2270 = _2268;
    if (_2184)
    {
        float _2272 = _2202 * _2254;
        _2214 = _2272;
    }
    float _2274 = _2214;
    float _2276 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2278 = sqrt(_2166);
    if (_2184)
    {
        float _2280 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2090 = _2280;
    }
    float _2282 = _2090;
    float _2284 = _2282;
    if (_2184)
    {
        float _2286 = _2172 * _2274;
        _2258 = _2286;
    }
    float _2288 = _2258;
    if (!_2184)
    {
        _2270 = _2174;
    }
    float _2290 = _2270;
    float _2292 = _2290;
    if (_2184)
    {
        float _2294 = _2174 * _2274;
        _2292 = _2294;
    }
    float _2296 = _2292;
    if (_2184)
    {
        float _2298 = fma(_2242, _2236, _2282);
        _2262 = _2298;
    }
    float _2300 = _2262;
    if (!_2184)
    {
        _2284 = _2176;
    }
    float _2302 = _2284;
    float _2304 = _2302;
    if (_2184)
    {
        float _2306 = _2288 * _2288;
        _2304 = _2306;
    }
    float _2308 = _2304;
    if (!_2184)
    {
        _2264 = _2178;
    }
    float _2310 = _2264;
    float _2312 = _2310;
    if (_2184)
    {
        float _2314 = _2296 * _2296;
        _2312 = _2314;
    }
    float _2316 = _2312;
    float _2318 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2320 = fma(_2300, _2300, _2308);
    float _2322 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2324 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2326 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2276);
    float _2328 = _2320 + _2316;
    float _2330 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2318);
    float _2332 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2322);
    float _2334 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2324);
    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2338 = fma(_2278, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2336);
    float _2340 = precise::clamp(_2338, 0.0, 1.0);
    float _2342 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2330);
    float _2344 = rsqrt(_2328);
    float _2346 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2332);
    float _2348 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2326);
    float _2350 = _2342 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2352 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2354 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2356 = _2348 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2360 = -_2340;
    float _2362 = _2360 + 1.0;
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2366 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2334);
    float _2368 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2358);
    float _2370 = -_2364;
    float _2372 = fma(_2370, _2352, 1.0);
    float _2374 = abs(_2362);
    float _2376 = log2(_2374);
    float _2378 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2368);
    float _2380 = _2344 * _2288;
    float _2382 = _2344 * _2300;
    float _2384 = _2344 * _2296;
    float _2386 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2390 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2392 = log2(_2372);
    float _2394 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2378);
    float _2396 = -_2388;
    float _2398 = fma(_2382, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2396);
    float _2400 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2390);
    float _2402 = _2382 + 1.0;
    float _2404 = -_2384;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2398);
    float _2408 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2410 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2412 = 1.0 / _2394;
    float _2414 = fma(_2406, -0.5, 0.5);
    float _2416 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2408);
    float _2418 = fma(_2406, 0.5, 0.5);
    float _2420 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2416);
    float _2422 = fma(_2418, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2424 = exp2(_2410);
    float _2426 = _2392 * 0.693147182464599609375;
    float _2428 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2420);
    float _2430 = fma(_2418, _2422, -0.212114393711090087890625);
    float _2432 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2434 = fma(_2418, _2430, 1.570728778839111328125);
    float _2436 = sqrt(_2414);
    float _2438 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2400);
    float _2440 = _2428 * _2412;
    float _2442 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2438);
    float _2444 = fma(_2440, 0.5, 0.5);
    float _2446 = -_2382;
    float _2448 = fma(_2424, _2402, _2446);
    float _2450 = _2442 * _2412;
    float _2452 = fma(_2448, 0.5, 0.5);
    float _2454 = fma(_2450, -0.5, 0.5);
    float _2456 = _2436 * 0.636619746685028076171875;
    float _2458 = -_2434;
    float _2460 = fma(_2456, _2458, 1.0);
    float3 _7086 = float3(_2444, _2454, _2432);
    float _2462 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7086, float3(0.0), isnan(_7086)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7086, float3(0.0), isnan(_7086)), level(0.0)).x;
    float3 _7097 = float3(_2444, _2454, _2432);
    float4 _2465 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7097, float3(0.0), isnan(_7097)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7097, float3(0.0), isnan(_7097)), level(0.0)).xyzw;
    float _2467 = _2465.x;
    float _2469 = _2465.y;
    float _2471 = _2465.z;
    float _2473 = _2465.w;
    float2 _7114 = float2(_2460, _2452);
    float3 _2477 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7114, float2(0.0), isnan(_7114)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7114, float2(0.0), isnan(_7114)), level(0.0)).xyz;
    float _2479 = _2477.x;
    float _2481 = _2477.y;
    float _2483 = _2477.z;
    float _2485 = in.m_59.y;
    float _2487 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2489 = _1250 + _2487;
    bool _2491 = _1258 > 0.5;
    float _2493 = in.m_61.x;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2495;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2501 = _2499 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2503;
    float _2507 = 1.0 / _2497;
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2511 = _1250 + _2509;
    float _2513 = in.m_61.w;
    float _2515 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2517 = _1250 + _2515;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2521 = _2519 != 0;
    float _2523 = in.m_61.z;
    float _2525 = 1.0 / _2501;
    float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _2531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2533 = _2531 != 0;
    float _2535 = in.m_61.y;
    float _2537 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2539 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _2541 = isnan(_1250);
    bool _2543 = _2539 || _2541;
    bool _2545 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _2547 = _2543 || _2545;
    float _2549 = float(_2547);
    float _2551 = -_2485;
    float _2553 = _2551 + 1.0;
    float _2555 = 1.0 / _2505;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _2557;
    float _2561 = _2511 * _2507;
    out.m_63.x = _2493;
    float _2563 = _2485;
    if (_2521)
    {
        float _2565 = _2491 ? _2553 : _2485;
        _2563 = _2565;
    }
    float _2567 = _2563;
    float _2569 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _2571 = _1250 + _2569;
    float _2573 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2575 = _1250 + _2573;
    float _2577 = 0.0;
    if (_2533)
    {
        float _2579 = in.m_51.x;
        _2577 = _2579;
    }
    float _2581 = _2577;
    float _2583 = 1.0 / _2529;
    float _2585 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _2587 = _2585 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _2589 = _2489 * _2525;
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2593 = _1250 + _2591;
    out.m_63.w = _2513;
    float _2595 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2537);
    float _2597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2599 = _2517 * _2555;
    out.m_63.z = _2523;
    bool _2601 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2603 = isnan(_1250);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2609 = _2605 || _2607;
    float _2611 = float(_2609);
    float _2613 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2595);
    bool _2615 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2617 = isnan(_1250);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    out.m_63.y = _2535;
    float _2627 = 1.0 / _2587;
    float _2629 = _2593 * _2583;
    bool _2631 = _1786 != 0.0;
    bool _2633 = isnan(_1786);
    bool _2635 = _2631 || _2633;
    bool _2637 = isnan(0.0);
    bool _2639 = _2635 || _2637;
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2643 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2641;
    float _2645 = _2597 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2647 = 1.0 / _2559;
    float _2649 = fma(_2643, _2561, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2651 = fma(_2645, _2567, -0.5);
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2655 = _2653 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2657 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2659 = _2657 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _2661 = _2581 > 0.5;
    bool _2663 = _2661 && _2533;
    float _2665 = _2571 * _2627;
    float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2669 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2667;
    float _2671 = -_1334;
    float _2673 = fma(_1386, _2651, _2671);
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2675;
    float _2679 = fma(_2669, _2561, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2681 = fma(_2677, _2561, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2685 = _2683 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2687 = fma(_2655, _2589, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2689 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2689;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2697 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2699 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2697;
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2701;
    float _2705 = fma(_2685, _2589, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2707 = fma(_2659, _2589, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2709 = fma(_2691, _2599, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2711 = fma(_2699, _2599, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2713 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2717 = fma(_2703, _2599, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _2723 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _2725 = isnan(_1250);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _2731 = _2727 || _2729;
    float _2733 = float(_2731);
    float _2735 = _2575 * _2647;
    float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _2737;
    float _2741 = fma(_2695, _2629, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2743 = fma(_2715, _2629, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2745 = -_2733;
    float _2747 = _2745 + 1.0;
    float _2749 = fma(_2739, _2735, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _2751 = -_2549;
    float _2753 = _2751 + 1.0;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2757 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _2755;
    float _2759 = fma(_2721, _2629, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _2761 = _2549 * _2747;
    bool _2763 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2765 = isnan(_1250);
    bool _2767 = _2763 || _2765;
    bool _2769 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2771 = _2767 || _2769;
    float _2773 = float(_2771);
    float _2775 = _2625 * _2753;
    float _2777 = -_2625;
    float _2779 = _2777 + 1.0;
    float _2781 = fma(_2757, _2735, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _2783 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2785 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _2783;
    float _2787 = in.m_65.x;
    float _2789 = in.m_65.y;
    float _2791 = in.m_65.z;
    float _2793 = _2773 * _2779;
    float _2795 = -_2773;
    float _2797 = _2795 + 1.0;
    float _2799 = fma(_2785, _2735, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _2801 = _1784 == 0.0;
    bool _2803 = !_2639;
    bool _2805 = _2801 && _2803;
    float _2807 = in.m_59.x;
    bool _2809 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2811 = isnan(_1250);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2817 = _2813 || _2815;
    float _2819 = float(_2817);
    float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _2825 = _2611 * _2797;
    float _2827 = -_2611;
    float _2829 = _2827 + 1.0;
    bool _2831 = _1788 == 0.0;
    bool _2833 = _2831 && _2805;
    float _2835 = fma(_2823, _2665, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    bool _2837 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2839 = isnan(_1250);
    bool _2841 = _2837 || _2839;
    bool _2843 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2845 = _2841 || _2843;
    float _2847 = float(_2845);
    float _2849 = _2819 * _2829;
    float _2851 = -_2819;
    float _2853 = _2851 + 1.0;
    float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _2857 = _2855 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _2859 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _2861 = _2859 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _2863 = _2847 * _2853;
    float _2865 = -_2847;
    float _2867 = _2865 + 1.0;
    float _2869 = fma(_2857, _2665, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _2871 = fma(_2861, _2665, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _2873 = _2649 * _2863;
    float _2875 = _2681 * _2863;
    float _2877 = _2679 * _2863;
    float _2879 = _2791;
    float _2881 = _2789;
    float _2883 = _2787;
    if (!_2833)
    {
        float _2885 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2791);
        _2879 = _2885;
    }
    float _2887 = _2879;
    if (!_2833)
    {
        float _2889 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2789);
        _2881 = _2889;
    }
    float _2891 = _2881;
    float _2893 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2873);
    float _2895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2897 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2875);
    float _2899 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2877);
    if (!_2833)
    {
        float _2901 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2787);
        _2883 = _2901;
    }
    float _2903 = _2883;
    float _2905 = _2807;
    if (_2533)
    {
        _2092 = _2807;
    }
    float _2907 = _2092;
    float _2909 = fma(_2687, _2849, _2893);
    float _2911 = fma(_2705, _2849, _2897);
    float _2913 = fma(_2707, _2849, _2899);
    float _2915 = _2054 * _2891;
    float _2917 = fma(_2709, _2825, _2909);
    float _2919 = fma(_2711, _2825, _2911);
    float _2921 = fma(_2717, _2825, _2913);
    float _2923 = _2907;
    if (_2663)
    {
        float _2925 = -_2907;
        float _2927 = _2925 + 1.0;
        _2923 = _2927;
    }
    float _2929 = _2923;
    float _2931 = fma(_2741, _2793, _2917);
    float _2933 = fma(_2743, _2793, _2919);
    float _2935 = fma(_2759, _2793, _2921);
    float _2937 = fma(_2062, _2903, _2915);
    if (_2533)
    {
        _2905 = _2929;
    }
    float _2939 = _2905;
    float _2941 = _2895 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2943 = fma(_2781, _2775, _2931);
    float _2945 = fma(_2749, _2775, _2933);
    float _2947 = fma(_2799, _2775, _2935);
    float _2949 = fma(_2941, _2939, -0.5);
    float _2951 = fma(_2835, _2761, _2943);
    float _2953 = fma(_2869, _2761, _2945);
    float _2955 = fma(_2871, _2761, _2947);
    float _2957 = fma(_1384, _2949, _1332);
    float _2959 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2961 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[129].x, _2951);
    float _2963 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[129].y, _2953);
    float _2965 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[129].z, _2955);
    float _2967 = _1952 * _2891;
    float _2969 = _1984 * _2891;
    float _2971 = fma(_2068, _2887, _2937);
    float _2973 = _2957 + 0.5;
    float _2975 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2959);
    float _2977 = _2961 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2979 = _2963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2981 = _2965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2983 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2985 = _2673 + 0.5;
    float _2987 = _2977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2989 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2991 = _2981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2993 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2975);
    float _2995 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2983);
    out.m_67.x = _2973;
    out.m_67.y = _2985;
    bool _2997 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2999 = isnan(0.5);
    bool _3001 = _2997 || _2999;
    bool _3003 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3005 = _3001 || _3003;
    float _3007 = _2993 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3009 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2995);
    out.m_69.x = _2987;
    out.m_69.y = _2989;
    out.m_69.z = _2991;
    float _3011 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3013 = 1.0 / _3007;
    float _3015 = fma(_1954, _2903, _2967);
    float _3017 = fma(_1990, _2903, _2969);
    float _3019 = _3009 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3021 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2613);
    float _3023 = fma(_1956, _2887, _3015);
    float _3025 = fma(_1994, _2887, _3017);
    float _3027 = _3019 + _3007;
    float _3029 = exp2(_3011);
    out.m_71.x = _3023;
    out.m_71.y = _2971;
    out.m_71.z = _3025;
    float _3031 = _3027 * _3013;
    float _3033 = _3031 * 0.5;
    float _3035 = _3023;
    if (_3005)
    {
        _3035 = 1.0;
    }
    float _3037 = _3035;
    float _3039 = _3037;
    if (!_3005)
    {
        float _3041 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3043 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3045 = _3041 * 0.15915493667125701904296875;
        float _3047 = _3043 * 0.15915493667125701904296875;
        float _3049 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3051 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3049);
        float _3053 = _3045 * 6.283185482025146484375;
        float _3055 = cos(_3053);
        float _3057 = _3045 * 6.283185482025146484375;
        float _3059 = sin(_3057);
        float _3061 = 1.0 / _3055;
        float _3063 = _3047 * 6.283185482025146484375;
        float _3065 = cos(_3063);
        float _3067 = _3059 * _3061;
        float _3069 = _3047 * 6.283185482025146484375;
        float _3071 = sin(_3069);
        float _3073 = _3065 * _3067;
        float _3075 = 1.0 / _3051;
        float _3077 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3079 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3077;
        float _3081 = 1.0 / _3073;
        float _3083 = 1.0 / _3079;
        float _3085 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3087 = _3075 * _3085;
        float _3089 = _3071 * _3081;
        float _3091 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3093 = fma(_3089, _3087, _3091);
        float _3095 = _3093 * _3083;
        float _3097 = precise::clamp(_3095, 0.0, 1.0);
        _3039 = _3097;
    }
    float _3099 = _3039;
    float _3101 = -_3029;
    float _3103 = _3101 + 1.0;
    float _3105 = _3021 + _2394;
    float _3107 = _3099 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3109 = _3099 > 0.0;
    bool _3111 = isnan(_3099);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan(0.0);
    bool _3117 = _3113 || _3115;
    float _3119 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3121 = _3105 * 0.5;
    float _3123 = _3107 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2428;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _3021;
    out.gl_Position.w = _2394;
    float _3125 = _3119 * _2462;
    float _3127 = -_3119;
    float _3129 = _3127 + 1.0;
    out.m_73.x = _2156;
    out.m_73.y = _2152;
    out.m_73.z = _2160;
    float _3131 = _2473 * _3125;
    float _3133 = _2483 * _3125;
    float _3135 = _2473 * _3129;
    out.m_75.z = _3121;
    out.m_75.w = _2394;
    float _3137 = fma(_2479, _3131, _2467);
    float _3139 = fma(_2481, _3131, _2469);
    float _3141 = fma(_2473, _3133, _2471);
    out.m_45.x = _3123;
    out.m_77.x = _3137;
    out.m_77.y = _3139;
    out.m_77.z = _3141;
    out.m_77.w = _3135;
    if (_3117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3143 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3143;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1242 = false;
    bool _1100 = false;
    bool _812 = false;
    bool _560 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3200 = as_type<float>(_112);
        out.gl_Position.z = _3200;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = _130;
    if (_126)
    {
        float _136 = float(_96);
        _132 = _136;
    }
    float _138 = _132;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    if (_144)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _106;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3269 = as_type<float>(_150);
        out.gl_Position.z = _3269;
    }
    if (_144)
    {
        return out;
    }
    float _152 = in.m_47.x;
    float _154 = in.m_47.y;
    float _156 = in.m_47.z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _172 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _170);
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _174);
    float _178 = _174;
    float _180 = _158;
    if (!_168)
    {
        float _182 = _158 * _158;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _172);
    float _190 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _176);
    float _192 = _186;
    if (!_168)
    {
        float _194 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    float _236 = _232;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _158 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _180 = _256;
    }
    float _258 = _180;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = _264;
    if (!_168)
    {
        float _268 = _130 * _130;
        float _270 = _268 * 0.5;
        _236 = _270;
    }
    float _272 = _236;
    float _274 = fma(_258, _152, _260);
    float _276 = fma(_258, _154, _262);
    float _278 = fma(_258, _156, _264);
    float _280 = _272;
    if (!_168)
    {
        float _282 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _282;
    }
    float _284 = _280;
    bool _286 = !_168;
    float _288 = _284;
    if (!_286)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _130 * _292;
        float _302 = exp2(_300);
        float _304 = _298 * 0.693147182464599609375;
        float _306 = 1.0 / _304;
        float _308 = 1.0 / _296;
        float _310 = _302 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _306, _130);
        float _316 = _314 * _308;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _318;
        _266 = _302;
    }
    float _320 = _288;
    float _322 = _266;
    float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = _322;
    if (!_168)
    {
        _326 = _130;
    }
    float _328 = _326;
    bool _330 = !_168;
    float _332 = _328;
    if (!_330)
    {
        float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _336 = log2(_334);
        float _338 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _340 = _338 + 1.0;
        float _342 = 1.0 / _340;
        float _344 = _130 * _336;
        float _346 = exp2(_344);
        float _348 = -_346;
        float _350 = _348 + 1.0;
        float _352 = _350 * _342;
        _332 = _352;
    }
    float _354 = _332;
    float _356 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _358 = fma(_354, _154, _324);
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _362 = fma(_354, _152, _356);
    float _364 = -_358;
    float _366 = _276 + _364;
    float _368 = fma(_354, _156, _360);
    float _370 = -_362;
    float _372 = _274 + _370;
    float _374 = _366 * _366;
    float _376 = -_368;
    float _378 = _278 + _376;
    float _380 = sqrt(_190);
    float _382 = fma(_372, _372, _374);
    float _384 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _386 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _388 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _390 = fma(_378, _378, _382);
    float _392 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _384);
    float _394 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].y, _386);
    float _396 = sqrt(_188);
    float _398 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _400 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _392);
    float _402 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _404 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].x, _388);
    float _406 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].y, _394);
    float _408 = in.m_49.w;
    float _410 = sqrt(_390);
    float _412 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].x, _404);
    float _414 = in.m_42.x;
    float _416 = in.m_42.y;
    float _418 = in.m_42.z;
    float _420 = _380 * _406;
    float _422 = _420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _424 = sqrt(_400);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].z, _398);
    float _428 = _396 * _412;
    float _430 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].w, _402);
    float _432 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].z, _426);
    float _434 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _422);
    float _436 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].w, _430);
    bool _438 = _410 >= 9.9999999747524270787835121154785e-07;
    bool _440 = isnan(_410);
    bool _442 = _438 || _440;
    bool _444 = isnan(9.9999999747524270787835121154785e-07);
    bool _446 = _442 || _444;
    float _448 = _420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _450 = _420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _452 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _448);
    float _454 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _450);
    float _456 = _424 * _432;
    float _458 = fma(_274, _408, _414);
    float _460 = fma(_276, _408, _416);
    float _462 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[24].z, _434);
    float _464 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[25].z, _452);
    float _466 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[26].z, _454);
    float _468 = fma(_278, _408, _418);
    float _470 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[24].w, _462);
    float _472 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[25].w, _464);
    float _474 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[26].w, _466);
    float _476 = _436;
    float _478 = _472;
    float _480 = _474;
    if (_446)
    {
        _476 = _470;
    }
    float _482 = _476;
    float _484 = _482;
    if (!_446)
    {
        bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _488 = !_486;
        if (!_488)
        {
            float _490 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _492 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _496 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _490);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _492);
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _494);
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _496);
            float _506 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _498);
            float _508 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _500);
            float _510 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _504);
            float _512 = _380 * _506;
            float _514 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _502);
            float _516 = _396 * _508;
            float _518 = _512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _520 = _424 * _514;
            float _522 = _512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _524 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[25].x, _518);
            float _526 = _512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _528 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[24].x, _522);
            float _530 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].z, _524);
            float _532 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[26].x, _526);
            float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].z, _528);
            float _536 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[25].w, _530);
            float _538 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].z, _532);
            float _540 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[24].w, _534);
            float _542 = _536 * _536;
            float _544 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[26].w, _538);
            float _546 = fma(_540, _540, _542);
            float _548 = fma(_544, _544, _546);
            float _550 = rsqrt(_548);
            float _552 = _550 * 9.9999999747524270787835121154785e-07;
            float _554 = _540 * _552;
            float _556 = _536 * _552;
            float _558 = _544 * _552;
            _478 = _556;
            _484 = _554;
            _480 = _558;
            _560 = true;
        }
        else
        {
            float _562 = _154 * _154;
            float _564 = fma(_152, _152, _562);
            float _566 = fma(_156, _156, _564);
            float _568 = sqrt(_566);
            bool _570 = _568 >= 9.9999999747524270787835121154785e-07;
            bool _572 = isnan(_568);
            bool _574 = _570 || _572;
            bool _576 = isnan(9.9999999747524270787835121154785e-07);
            bool _578 = _574 || _576;
            if (!_578)
            {
                float _580 = _416 * _416;
                float _582 = fma(_414, _414, _580);
                float _584 = fma(_418, _418, _582);
                float _586 = sqrt(_584);
                bool _588 = _586 >= 9.9999999747524270787835121154785e-07;
                bool _590 = isnan(_586);
                bool _592 = _588 || _590;
                bool _594 = isnan(9.9999999747524270787835121154785e-07);
                bool _596 = _592 || _594;
                if (!_596)
                {
                    float _598 = _380 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _600 = _396 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _602 = _424 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _604 = _598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _606 = _598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _608 = _598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _610 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[25].x, _604);
                    float _612 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[24].x, _606);
                    float _614 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[26].x, _608);
                    float _616 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _610);
                    float _618 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _612);
                    float _620 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _614);
                    float _622 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _616);
                    float _624 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _618);
                    float _626 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _620);
                    float _628 = _622 * _622;
                    float _630 = fma(_624, _624, _628);
                    float _632 = fma(_626, _626, _630);
                    float _634 = rsqrt(_632);
                    float _636 = _634 * 9.9999999747524270787835121154785e-07;
                    float _638 = _622 * _636;
                    float _640 = _624 * _636;
                    float _642 = _626 * _636;
                    _478 = _638;
                    _484 = _640;
                    _480 = _642;
                    _560 = true;
                }
                else
                {
                    float _644 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _646 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _648 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _650 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _652 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].y, _644);
                    float _654 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].x, _646);
                    float _656 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].z, _648);
                    float _658 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].w, _650);
                    float _660 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].y, _652);
                    float _662 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].x, _654);
                    float _664 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].z, _656);
                    float _666 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].w, _658);
                    float _668 = _380 * _660;
                    float _670 = _396 * _662;
                    float _672 = _424 * _664;
                    float _674 = _668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _676 = _668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _678 = _668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _680 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _674);
                    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _676);
                    float _684 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _678);
                    float _686 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _680);
                    float _688 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _682);
                    float _690 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _684);
                    float _692 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].w, _686);
                    float _694 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].w, _688);
                    float _696 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].w, _690);
                    float _698 = _692 * _692;
                    float _700 = fma(_694, _694, _698);
                    float _702 = fma(_696, _696, _700);
                    float _704 = rsqrt(_702);
                    float _706 = _704 * 9.9999999747524270787835121154785e-07;
                    float _708 = _694 * _706;
                    float _710 = _692 * _706;
                    float _712 = _696 * _706;
                    _478 = _710;
                    _484 = _708;
                    _480 = _712;
                    _560 = true;
                }
            }
            else
            {
                float _714 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _716 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _718 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _720 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _722 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].y, _714);
                float _724 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].x, _716);
                float _726 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].z, _718);
                float _728 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].w, _720);
                float _730 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].y, _722);
                float _732 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].x, _724);
                float _734 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].z, _726);
                float _736 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].w, _728);
                float _738 = _380 * _730;
                float _740 = _396 * _732;
                float _742 = _424 * _734;
                float _744 = _738 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _746 = _738 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _748 = _738 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _750 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[25].x, _744);
                float _752 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[24].x, _746);
                float _754 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[26].x, _748);
                float _756 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].z, _750);
                float _758 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].z, _752);
                float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].z, _754);
                float _762 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].w, _756);
                float _764 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].w, _758);
                float _766 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].w, _760);
                float _768 = _762 * _762;
                float _770 = fma(_764, _764, _768);
                float _772 = fma(_766, _766, _770);
                float _774 = rsqrt(_772);
                float _776 = _774 * 9.9999999747524270787835121154785e-07;
                float _778 = _764 * _776;
                float _780 = _762 * _776;
                float _782 = _766 * _776;
                _478 = _780;
                _484 = _778;
                _480 = _782;
            }
        }
    }
    _560 = false;
    float _784 = _478;
    float _786 = _484;
    float _788 = _480;
    bool _790 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _792 = !_790;
    float _810;
    if (!_792)
    {
        float _794 = in.m_51.x;
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _798 = _794 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _802 = _800 * _796;
        float _804 = floor(_802);
        float _806 = -_804;
        float _808 = _802 + _806;
        _810 = _808;
        _812 = true;
    }
    else
    {
        float _814 = float(_96);
        float _816 = 1.0 / _814;
        float _818 = _130 * _816;
        _810 = _818;
    }
    _812 = false;
    float _820 = _810;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _824 = _820 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _828 = _820 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _832 = _820 + _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _850 = 1.0 / _836;
    bool _852 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _854 = isnan(_820);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    bool _864 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _866 = isnan(_820);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = 1.0 / _840;
    float _878 = -_874;
    float _880 = _878 + 1.0;
    bool _882 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _884 = 1.0 / _844;
    float _886 = _824 * _850;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _890 = _820 + _888;
    float _892 = 1.0 / _848;
    float _894 = _828 * _876;
    bool _896 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _898 = isnan(_820);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -_906;
    float _910 = _908 + 1.0;
    float _912 = _832 * _884;
    float _914 = _890 * _892;
    bool _916 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _918 = isnan(_820);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _928;
    float _932 = _926 * _910;
    float _934 = -_926;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _942;
    float _946 = fma(_930, _886, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _948 = _862 * _936;
    float _950 = -_862;
    float _952 = _950 + 1.0;
    float _954 = fma(_940, _886, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _956 = fma(_944, _886, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _958 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _960 = isnan(_820);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _874 * _952;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _984 = _968 * _880;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _986;
    float _990 = fma(_978, _894, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _992 = fma(_982, _894, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _994 = _954 * _984;
    float _996 = _956 * _984;
    float _998 = _946 * _984;
    float _1000 = -_968;
    float _1002 = _1000 + 1.0;
    float _1004 = in.m_49.x;
    float _1006 = in.m_49.y;
    float _1008 = in.m_49.z;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1014;
    float _1018 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[143].x, _994);
    float _1020 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[143].y, _996);
    float _1022 = fma(_974, _894, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[143].z, _998);
    float _1026 = fma(_1012, _912, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1028 = fma(_988, _912, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1030 = fma(_1016, _912, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1032 = fma(_990, _970, _1018);
    float _1034 = fma(_992, _970, _1020);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1048 = fma(_1022, _970, _1024);
    float _1050 = fma(_1038, _914, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1052 = fma(_1042, _914, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1054 = fma(_1046, _914, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _1056 = fma(_1026, _948, _1032);
    float _1058 = fma(_1028, _948, _1034);
    float _1060 = fma(_1030, _948, _1048);
    float _1062 = fma(_1050, _932, _1056);
    float _1064 = fma(_1052, _932, _1058);
    float _1066 = fma(_1054, _932, _1060);
    float _1068 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1062);
    float _1070 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1064);
    float _1072 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1066);
    float _1074 = _1068 * _1004;
    float _1076 = _1070 * _1006;
    float _1078 = _1072 * _1008;
    bool _1080 = !_882;
    float _1098;
    if (!_1080)
    {
        float _1082 = in.m_51.x;
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1086 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _1090 = _1088 * _1084;
        float _1092 = floor(_1090);
        float _1094 = -_1092;
        float _1096 = _1090 + _1094;
        _1098 = _1096;
        _1100 = true;
    }
    else
    {
        float _1102 = float(_96);
        float _1104 = 1.0 / _1102;
        float _1106 = _130 * _1104;
        _1098 = _1106;
    }
    _1100 = false;
    float _1108 = _1098;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1112 = _1108 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1118 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1120 = isnan(_1108);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1134 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1136 = isnan(_1108);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1146;
    bool _1150 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1152 = isnan(_1108);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = 1.0 / _1116;
    float _1164 = -_1128;
    float _1166 = _1164 + 1.0;
    bool _1168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1170 = -_1160;
    float _1172 = _1170 + 1.0;
    float _1174 = 1.0 / _1132;
    float _1176 = _1128 * _1172;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1180 = _1148 * _1162;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1188 = fma(_1180, _1112, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1190 = _1144 * _1166;
    float _1192 = -_1144;
    float _1194 = _1192 + 1.0;
    float _1196 = _1184 * _1174;
    float _1198 = _1188 * _1190;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1202 = _1108 + _1200;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1198);
    float _1206 = fma(_1196, _1202, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1208 = fma(_1206, _1176, _1204);
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1214 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1208);
    float _1216 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1216;
    out.m_53.y = _1186;
    out.m_53.z = _1218;
    out.m_53.w = _1220;
    bool _1222 = !_1168;
    float _1240;
    if (!_1222)
    {
        float _1224 = in.m_51.x;
        float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1228 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _1232 = _1230 * _1226;
        float _1234 = floor(_1232);
        float _1236 = -_1234;
        float _1238 = _1232 + _1236;
        _1240 = _1238;
        _1242 = true;
    }
    else
    {
        float _1244 = float(_96);
        float _1246 = 1.0 / _1244;
        float _1248 = _130 * _1246;
        _1240 = _1248;
    }
    _1242 = false;
    float _1250 = _1240;
    float _1252 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1254 = log2(_1252);
    float _1256 = in.m_51.x;
    float _1258 = in.m_51.y;
    float _1260 = _784 * _784;
    float _1262 = in.m_51.z;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1268 = 1.0 + _1266;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1280 = _1278 != 0;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1284 = _1282 != 0;
    float _1286 = fma(_786, _786, _1260);
    float _1288 = _1254 * _130;
    float _1290 = fma(_788, _788, _1286);
    float _1292 = 1.0 / _1268;
    float _1294 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1296 = exp2(_1288);
    float _1298 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1300 = _1256 * 2.0;
    float _1302 = _1262 * 2.0;
    float _1304 = fma(_1294, -2.0, _1264);
    float _1306 = -_1272;
    float _1308 = fma(_1298, 2.0, _1306);
    bool _1310 = !_1276;
    int _1312 = _1310 ? 0 : 1;
    float _1314 = floor(_1302);
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _1326 = _1324 != 0;
    float _1328 = _1258 * 2.0;
    float _1330 = -_130;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1308);
    float _1334 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1304);
    bool _1336 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1338 = isnan(1.0);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1344 = _1340 || _1342;
    float _1346 = -_1296;
    float _1348 = _1346 + 1.0;
    bool _1350 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1352 = isnan(0.0);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1358 = _1354 || _1356;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1364 = floor(_1300);
    float _1366 = _1358 ? _1348 : 0.0;
    float _1368 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1360);
    float _1370 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1362);
    float _1372 = _1258 + _1256;
    bool _1374 = _1314 >= 0.0;
    bool _1376 = isnan(_1314);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1368);
    float _1386 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1370);
    float _1388 = floor(_1328);
    if (_1344)
    {
        float _1390 = _1366 * _1292;
        _134 = _1390;
    }
    float _1392 = _134;
    bool _1394 = _1314 > 0.0;
    float _1396 = _1258 + _1262;
    float _1398 = _1372 + (-1.0);
    float _1400 = _1396 + (-1.0);
    float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _1404 = _1382 ? 0 : 1;
    float _1406 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1408 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1410 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _1412 = ~_1404;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    float _1418 = rsqrt(_1290);
    int _1420 = _1416;
    if (!_1394)
    {
        int _1422 = ~_1404;
        int _1424 = _1422 + 1;
        _1420 = _1424;
    }
    int _1426 = _1420;
    float _1428 = _1410 * _1270;
    bool _1430 = _1364 > 0.0;
    float _1432 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _1434 = _1388 > 0.0;
    float _1436 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1428);
    bool _1438 = !_1284;
    int _1440 = _1438 ? 0 : 1;
    float _1442 = _1432 * _1402;
    bool _1444 = !_1280;
    int _1446 = _1444 ? 0 : 1;
    float _1448 = _1436 + 0.25;
    bool _1450 = _1364 >= 0.0;
    bool _1452 = isnan(_1364);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.0);
    bool _1458 = _1454 || _1456;
    float _1460 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1442);
    bool _1462 = _1388 >= 0.0;
    bool _1464 = isnan(_1388);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan(0.0);
    bool _1470 = _1466 || _1468;
    float _1472 = floor(_1436);
    float _1474 = _1418 * _786;
    int _1476 = _1458 ? 0 : 1;
    float _1478 = _1418 * _784;
    int _1480 = _1470 ? 0 : 1;
    float _1482 = _1418 * _788;
    bool _1484 = !_1326;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = floor(_1460);
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1492 = _1490 != 0;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1496 = _1494 != 0;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1500 = _1498 != 0;
    int _1502 = ~_1476;
    int _1504 = _1502 + 1;
    int _1506 = _1504 + 1;
    int _1508 = ~_1480;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    int _1514 = _1506;
    int _1516 = _1512;
    if (!_1430)
    {
        int _1518 = ~_1476;
        int _1520 = _1518 + 1;
        _1514 = _1520;
    }
    int _1522 = _1514;
    if (!_1434)
    {
        int _1524 = ~_1480;
        int _1526 = _1524 + 1;
        _1516 = _1526;
    }
    int _1528 = _1516;
    bool _1530 = !_1496;
    int _1532 = _1530 ? 0 : 1;
    float _1534 = in.m_55.x;
    float _1536 = in.m_55.y;
    float _1538 = in.m_55.z;
    bool _1540 = !_1500;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = abs(_1532);
    float _1546 = -_1488;
    float _1548 = _1460 + _1546;
    int _1550 = abs(_1542);
    float _1552 = _1460 + 0.25;
    float _1554 = float(_1426);
    float _1556 = _1460 * 6.283185482025146484375;
    float _1558 = float(_1522);
    float _1560 = floor(_1448);
    float _1562 = float(_1544);
    bool _1564 = !_1492;
    int _1566 = _1564 ? 0 : 1;
    float _1568 = float(_1528);
    float _1570 = _1562 * _1558;
    int _1572 = abs(_1566);
    float _1574 = floor(_1552);
    float _1576 = float(_1550);
    float _1578 = -_1472;
    float _1580 = _1436 + _1578;
    float _1582 = _1570 * (-2.0);
    float _1584 = float(_1572);
    float _1586 = _1436 * 6.283185482025146484375;
    bool _1588 = _1548 >= 0.5;
    bool _1590 = isnan(_1548);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(0.5);
    bool _1596 = _1592 || _1594;
    float _1598 = _1258 + (-0.5);
    bool _1600 = _1580 >= 0.5;
    bool _1602 = isnan(_1580);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan(0.5);
    bool _1608 = _1604 || _1606;
    float _1610 = -_1560;
    float _1612 = _1448 + _1610;
    float _1614 = fma(_1582, _1536, _1536);
    float _1616 = _1584 * _1554;
    float _1618 = _1576 * _1568;
    float _1620 = _1586 * 0.15915493667125701904296875;
    float _1622 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1614);
    bool _1624 = !_1322;
    int _1626 = _1624 ? 0 : 1;
    float _1628 = -_1574;
    float _1630 = _1552 + _1628;
    float _1632 = fma(_1406, _1582, _1406);
    float _1634 = _1556 * 0.15915493667125701904296875;
    int _1636 = abs(_1446);
    float _1638 = _1618 * (-2.0);
    float _1640 = _1620 * 6.283185482025146484375;
    float _1642 = sin(_1640);
    bool _1644 = !_1608;
    float _1646 = _1644 ? 0.5 : (-0.5);
    bool _1648 = _1612 > 0.5;
    int _1650 = abs(_1626);
    bool _1652 = !_1596;
    float _1654 = _1652 ? 0.5 : (-0.5);
    float _1656 = _1634 * 6.283185482025146484375;
    float _1658 = sin(_1656);
    float _1660 = float(_1636);
    float _1662 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1664 = _1662 * 2.0;
    float _1666 = float(_1650);
    float _1668 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1670 = _1668 * 2.0;
    bool _1672 = !_1318;
    int _1674 = _1672 ? 0 : 1;
    float _1676 = _1660 * _1664;
    int _1678 = abs(_1312);
    float _1680 = _1666 * _1670;
    int _1682 = abs(_1674);
    float _1684 = _1612;
    float _1686 = _1630;
    if (_1648)
    {
        float _1688 = -_1612;
        float _1690 = _1688 + 1.0;
        _1684 = _1690;
    }
    float _1692 = _1684;
    bool _1694 = _1630 > 0.5;
    float _1696 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1698 = abs(_1440);
    float _1700 = fma(_1692, 4.0, -1.0);
    float _1702 = float(_1678);
    float _1704 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1706 = float(_1682);
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1710 = fma(_1702, _1696, _1676);
    int _1712 = abs(_1486);
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1716 = _1482 * _1714;
    float _1718 = float(_1698);
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1722 = _1478 * _1720;
    if (_1694)
    {
        float _1724 = -_1630;
        float _1726 = _1724 + 1.0;
        _1686 = _1726;
    }
    float _1728 = _1686;
    float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1732 = -_1716;
    float _1734 = fma(_1474, _1730, _1732);
    float _1736 = fma(_1706, _1704, _1680);
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1740 = -_1722;
    float _1742 = fma(_1482, _1738, _1740);
    float _1744 = fma(_1718, _1708, _1710);
    float _1746 = _1734 * _1734;
    float _1748 = fma(_1728, 4.0, -1.0);
    float _1750 = _1616 * (-2.0);
    float _1752 = fma(_1744, 3.1415927410125732421875, _1534);
    float _1754 = fma(_1742, _1742, _1746);
    float _1756 = fma(_1632, _1392, _1622);
    float _1758 = float(_1712);
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1762 = fma(_1408, _1750, _1408);
    float _1764 = fma(_1752, _1750, _1752);
    float _1766 = _1262 + _1256;
    float _1768 = _1756 * 0.15915493667125701904296875;
    float _1770 = fma(_1758, _1760, _1736);
    float _1772 = _1256 + (-0.5);
    float _1774 = _1766 + (-1.0);
    float _1776 = fma(_1770, 3.1415927410125732421875, _1538);
    float _1778 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1764);
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1782 = _1474 * _1780;
    float _1784 = in.m_57.x;
    float _1786 = in.m_57.y;
    float _1788 = in.m_57.z;
    float _1790 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1792 = _1262 + (-0.5);
    float _1794 = fma(_1776, _1638, _1776);
    float _1796 = fma(_1762, _1392, _1778);
    float _1798 = fma(_1790, _1638, _1790);
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1802 = -_1782;
    float _1804 = fma(_1478, _1800, _1802);
    float _1806 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1794);
    float _1808 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1810 = _1796 * 0.15915493667125701904296875;
    float _1812 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1814 = fma(_1798, _1392, _1806);
    float _1816 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1818 = fma(_1804, _1804, _1754);
    float _1820 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1822 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1808);
    float _1824 = _1814 * 0.15915493667125701904296875;
    float _1826 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1812);
    float _1828 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1816);
    float _1830 = rsqrt(_1818);
    float _1832 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1820);
    float _1834 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1822);
    float _1836 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1826);
    float _1838 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1828);
    float _1840 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1832);
    float _1842 = _1834 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1844 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1846 = _1768 * 6.283185482025146484375;
    float _1848 = cos(_1846);
    float _1850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1784);
    float _1852 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1854 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1788);
    float _1858 = _1844 * _1850;
    float _1860 = _1836 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1862 = _396 * _1842;
    float _1864 = _1810 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1786);
    float _1870 = _380 * _1860;
    float _1872 = _1742 * _1830;
    float _1874 = _1854 * _1856;
    float _1876 = _1852 * _1868;
    float _1878 = _1804 * _1830;
    float _1880 = _1734 * _1830;
    float _1882 = _1810 * 6.283185482025146484375;
    float _1884 = cos(_1882);
    float _1886 = _1840 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1888 = _1824 * 6.283185482025146484375;
    float _1890 = cos(_1888);
    float _1892 = _1866 * _1848;
    float _1894 = _1768 * 6.283185482025146484375;
    float _1896 = sin(_1894);
    float _1898 = _1884 * _1848;
    float _1900 = _1824 * 6.283185482025146484375;
    float _1902 = sin(_1900);
    float _1904 = _1848 * _1890;
    float _1906 = _1884 * _1890;
    float _1908 = _1884 * _1896;
    float _1910 = _1866 * _1896;
    float _1912 = _1866 * _1890;
    float _1914 = _1896 * _1890;
    float _1916 = _1906 * _1474;
    float _1918 = -_1908;
    float _1920 = fma(_1902, _1892, _1918);
    float _1922 = fma(_1902, _1898, _1910);
    float _1924 = -_1892;
    float _1926 = fma(_1902, _1908, _1924);
    float _1928 = fma(_1902, _1910, _1898);
    float _1930 = _1478 * _1878;
    float _1932 = _1922 * _1474;
    float _1934 = _1926 * _1474;
    float _1936 = _1838 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1938 = -_1930;
    float _1940 = fma(_1482, _1880, _1938);
    float _1942 = -_1902;
    float _1944 = fma(_1942, _1872, _1916);
    float _1946 = fma(_1904, _1872, _1932);
    float _1948 = fma(_1914, _1872, _1934);
    float _1950 = _1474 * _1880;
    float _1952 = fma(_1912, _1940, _1944);
    float _1954 = fma(_1920, _1940, _1946);
    float _1956 = fma(_1928, _1940, _1948);
    float _1958 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1960 = _1906 * _1482;
    float _1962 = _424 * _1936;
    float _1964 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1966 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1958);
    float _1968 = -_1950;
    float _1970 = fma(_1478, _1872, _1968);
    float _1972 = _1922 * _1482;
    float _1974 = -_1902;
    float _1976 = fma(_1974, _1878, _1960);
    float _1978 = _1926 * _1482;
    float _1980 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1964);
    float _1982 = fma(_1904, _1878, _1972);
    float _1984 = fma(_1912, _1970, _1976);
    float _1986 = fma(_1914, _1878, _1978);
    float _1988 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1980);
    float _1990 = fma(_1920, _1970, _1982);
    float _1992 = _1876 * _1984;
    float _1994 = fma(_1928, _1970, _1986);
    float _1996 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1966);
    float _1998 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1988);
    float _2000 = _1876 * _1952;
    float _2002 = fma(_1858, _1990, _1992);
    float _2004 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1996);
    float _2006 = _1998 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _2008 = fma(_1858, _1954, _2000);
    float _2010 = fma(_1874, _1994, _2002);
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _2014 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2016 = fma(_1874, _1956, _2008);
    float _2018 = _2006 + _2010;
    float _2020 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2014);
    float _2022 = _2012 + _2016;
    float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2026 = _2018 + _2024;
    float _2028 = _1482 * _1872;
    float _2030 = _1906 * _1478;
    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2034 = _2022 + _2032;
    float _2036 = _2026 * _2026;
    float _2038 = -_2028;
    float _2040 = fma(_1474, _1878, _2038);
    float _2042 = _1922 * _1478;
    float _2044 = -_1902;
    float _2046 = fma(_2044, _1880, _2030);
    float _2048 = fma(_2034, _2034, _2036);
    float _2050 = _1926 * _1478;
    float _2052 = fma(_1904, _1880, _2042);
    float _2054 = fma(_1912, _2040, _2046);
    float _2056 = sqrt(_2048);
    float _2058 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2020);
    float _2060 = fma(_1914, _1880, _2050);
    float _2062 = fma(_1920, _2040, _2052);
    float _2064 = _1876 * _2054;
    float _2066 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2058);
    float _2068 = fma(_1928, _2040, _2060);
    float _2070 = fma(_1858, _2062, _2064);
    float _2072 = _2066 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2074 = fma(_1874, _2068, _2070);
    bool _2076 = _2056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2078 = _2072 + _2074;
    float _2080 = _1874;
    float _2082 = _1858;
    float _2084 = _2014;
    float _2086 = _1886;
    float _2088 = _2052;
    float _2090 = _1902;
    float _2092 = _1784;
    if (!_2076)
    {
        _2080 = _2022;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (!_2076)
    {
        _2082 = _2018;
    }
    float _2098 = _2082;
    float _2100 = _2098;
    if (!_2076)
    {
        _2084 = _2078;
    }
    float _2102 = _2084;
    bool _2104 = !_2076;
    float _2106 = _2102;
    if (!_2104)
    {
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2112 = _2056 + _2110;
        float _2114 = rsqrt(_2048);
        float _2116 = _2112 * _2108;
        float _2118 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2120 = _2116 * 0.15915493667125701904296875;
        float _2122 = _2120 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        float _2126 = _2120 * 6.283185482025146484375;
        float _2128 = cos(_2126);
        float _2130 = fma(_2124, _2118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2132 = _2114 * _2130;
        float _2134 = _2128 + (-1.0);
        float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2138 = fma(_2034, _2132, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2140 = fma(_2026, _2132, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2142 = fma(_2078, _2128, _2136);
        _2106 = _2142;
        _2096 = _2138;
        _2100 = _2140;
    }
    float _2144 = _2106;
    float _2146 = _2096;
    float _2148 = _2100;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2152 = _2144 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2156 = _2146 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2160 = _2148 + _2158;
    float _2162 = _2152 * _2152;
    float _2164 = fma(_2156, _2156, _2162);
    float _2166 = fma(_2160, _2160, _2164);
    float _2168 = rsqrt(_2166);
    float _2170 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2172 = _2156 * _2170;
    float _2174 = _2160 * _2170;
    float _2176 = _2172 * _2172;
    float _2178 = _2174 * _2174;
    float _2180 = _2176 + _2178;
    float _2182 = sqrt(_2180);
    bool _2184 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2188 = _2182 + _2186;
    float _2190 = _2060;
    float _2192 = _2180;
    float _2194 = _2188;
    if (_2184)
    {
        float _2196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2190 = _2196;
    }
    float _2198 = _2190;
    if (_2184)
    {
        float _2200 = rsqrt(_2180);
        _2192 = _2200;
    }
    float _2202 = _2192;
    if (_2184)
    {
        float _2204 = _2188 * _2198;
        _2194 = _2204;
    }
    float _2206 = _2194;
    if (_2184)
    {
        float _2208 = _2206 * 0.15915493667125701904296875;
        _2086 = _2208;
    }
    float _2210 = _2086;
    float _2212 = _2046;
    float _2214 = _2210;
    if (_2184)
    {
        float _2216 = _2210 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        _2212 = _2218;
    }
    float _2220 = _2212;
    float _2222 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2224 = precise::max(0.0, _2222);
    float _2226 = _2020;
    float _2228 = _2224;
    float _2230 = _2222;
    if (_2184)
    {
        float _2232 = _2210 * 6.283185482025146484375;
        float _2234 = cos(_2232);
        _2226 = _2234;
    }
    float _2236 = _2226;
    float _2238 = -_2170;
    float _2240 = -_2224;
    float _2242 = fma(_2152, _2238, _2240);
    if (_2184)
    {
        float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2228 = _2244;
    }
    float _2246 = _2228;
    float _2248 = _2246;
    float _2250 = _2220;
    if (_2184)
    {
        float _2252 = fma(_2220, _2246, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2088 = _2252;
    }
    float _2254 = _2088;
    if (!_2184)
    {
        _2248 = _2172;
    }
    float _2256 = _2248;
    float _2258 = _2256;
    if (!_2184)
    {
        _2250 = _2242;
    }
    float _2260 = _2250;
    float _2262 = _2260;
    float _2264 = _2236;
    if (_2184)
    {
        float _2266 = _2236 + (-1.0);
        _2230 = _2266;
    }
    float _2268 = _2230;
    float _2270 = _2268;
    if (_2184)
    {
        float _2272 = _2202 * _2254;
        _2214 = _2272;
    }
    float _2274 = _2214;
    float _2276 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2278 = sqrt(_2166);
    if (_2184)
    {
        float _2280 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2090 = _2280;
    }
    float _2282 = _2090;
    float _2284 = _2282;
    if (_2184)
    {
        float _2286 = _2172 * _2274;
        _2258 = _2286;
    }
    float _2288 = _2258;
    if (!_2184)
    {
        _2270 = _2174;
    }
    float _2290 = _2270;
    float _2292 = _2290;
    if (_2184)
    {
        float _2294 = _2174 * _2274;
        _2292 = _2294;
    }
    float _2296 = _2292;
    if (_2184)
    {
        float _2298 = fma(_2242, _2236, _2282);
        _2262 = _2298;
    }
    float _2300 = _2262;
    if (!_2184)
    {
        _2284 = _2176;
    }
    float _2302 = _2284;
    float _2304 = _2302;
    if (_2184)
    {
        float _2306 = _2288 * _2288;
        _2304 = _2306;
    }
    float _2308 = _2304;
    if (!_2184)
    {
        _2264 = _2178;
    }
    float _2310 = _2264;
    float _2312 = _2310;
    if (_2184)
    {
        float _2314 = _2296 * _2296;
        _2312 = _2314;
    }
    float _2316 = _2312;
    float _2318 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2320 = fma(_2300, _2300, _2308);
    float _2322 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2324 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2326 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2276);
    float _2328 = _2320 + _2316;
    float _2330 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2318);
    float _2332 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2322);
    float _2334 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2324);
    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2338 = fma(_2278, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2336);
    float _2340 = precise::clamp(_2338, 0.0, 1.0);
    float _2342 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2330);
    float _2344 = rsqrt(_2328);
    float _2346 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2332);
    float _2348 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2326);
    float _2350 = _2342 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2352 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2354 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2356 = _2348 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2360 = -_2340;
    float _2362 = _2360 + 1.0;
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2366 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2334);
    float _2368 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2358);
    float _2370 = -_2364;
    float _2372 = fma(_2370, _2352, 1.0);
    float _2374 = abs(_2362);
    float _2376 = log2(_2374);
    float _2378 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2368);
    float _2380 = _2344 * _2288;
    float _2382 = _2344 * _2300;
    float _2384 = _2344 * _2296;
    float _2386 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2390 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2392 = log2(_2372);
    float _2394 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2378);
    float _2396 = -_2388;
    float _2398 = fma(_2382, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2396);
    float _2400 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2390);
    float _2402 = _2382 + 1.0;
    float _2404 = -_2384;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2398);
    float _2408 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2410 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2412 = 1.0 / _2394;
    float _2414 = fma(_2406, -0.5, 0.5);
    float _2416 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2408);
    float _2418 = fma(_2406, 0.5, 0.5);
    float _2420 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2416);
    float _2422 = fma(_2418, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2424 = exp2(_2410);
    float _2426 = _2392 * 0.693147182464599609375;
    float _2428 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2420);
    float _2430 = fma(_2418, _2422, -0.212114393711090087890625);
    float _2432 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2434 = fma(_2418, _2430, 1.570728778839111328125);
    float _2436 = sqrt(_2414);
    float _2438 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2400);
    float _2440 = _2428 * _2412;
    float _2442 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2438);
    float _2444 = fma(_2440, 0.5, 0.5);
    float _2446 = -_2382;
    float _2448 = fma(_2424, _2402, _2446);
    float _2450 = _2442 * _2412;
    float _2452 = fma(_2448, 0.5, 0.5);
    float _2454 = fma(_2450, -0.5, 0.5);
    float _2456 = _2436 * 0.636619746685028076171875;
    float _2458 = -_2434;
    float _2460 = fma(_2456, _2458, 1.0);
    float3 _7086 = float3(_2444, _2454, _2432);
    float _2462 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7086, float3(0.0), isnan(_7086)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7086, float3(0.0), isnan(_7086)), level(0.0)).x;
    float3 _7097 = float3(_2444, _2454, _2432);
    float4 _2465 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7097, float3(0.0), isnan(_7097)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7097, float3(0.0), isnan(_7097)), level(0.0)).xyzw;
    float _2467 = _2465.x;
    float _2469 = _2465.y;
    float _2471 = _2465.z;
    float _2473 = _2465.w;
    float2 _7114 = float2(_2460, _2452);
    float3 _2477 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7114, float2(0.0), isnan(_7114)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7114, float2(0.0), isnan(_7114)), level(0.0)).xyz;
    float _2479 = _2477.x;
    float _2481 = _2477.y;
    float _2483 = _2477.z;
    float _2485 = in.m_59.y;
    float _2487 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2489 = _1250 + _2487;
    bool _2491 = _1258 > 0.5;
    float _2493 = in.m_61.x;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2495;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2501 = _2499 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2503;
    float _2507 = 1.0 / _2497;
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2511 = _1250 + _2509;
    float _2513 = in.m_61.w;
    float _2515 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2517 = _1250 + _2515;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2521 = _2519 != 0;
    float _2523 = in.m_61.z;
    float _2525 = 1.0 / _2501;
    float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _2531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2533 = _2531 != 0;
    float _2535 = in.m_61.y;
    float _2537 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2539 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _2541 = isnan(_1250);
    bool _2543 = _2539 || _2541;
    bool _2545 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _2547 = _2543 || _2545;
    float _2549 = float(_2547);
    float _2551 = -_2485;
    float _2553 = _2551 + 1.0;
    float _2555 = 1.0 / _2505;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _2557;
    float _2561 = _2511 * _2507;
    out.m_63.x = _2493;
    float _2563 = _2485;
    if (_2521)
    {
        float _2565 = _2491 ? _2553 : _2485;
        _2563 = _2565;
    }
    float _2567 = _2563;
    float _2569 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _2571 = _1250 + _2569;
    float _2573 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2575 = _1250 + _2573;
    float _2577 = 0.0;
    if (_2533)
    {
        float _2579 = in.m_51.x;
        _2577 = _2579;
    }
    float _2581 = _2577;
    float _2583 = 1.0 / _2529;
    float _2585 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _2587 = _2585 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _2589 = _2489 * _2525;
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2593 = _1250 + _2591;
    out.m_63.w = _2513;
    float _2595 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2537);
    float _2597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2599 = _2517 * _2555;
    out.m_63.z = _2523;
    bool _2601 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2603 = isnan(_1250);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2609 = _2605 || _2607;
    float _2611 = float(_2609);
    float _2613 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2595);
    bool _2615 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2617 = isnan(_1250);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    out.m_63.y = _2535;
    float _2627 = 1.0 / _2587;
    float _2629 = _2593 * _2583;
    bool _2631 = _1786 != 0.0;
    bool _2633 = isnan(_1786);
    bool _2635 = _2631 || _2633;
    bool _2637 = isnan(0.0);
    bool _2639 = _2635 || _2637;
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2643 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2641;
    float _2645 = _2597 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2647 = 1.0 / _2559;
    float _2649 = fma(_2643, _2561, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2651 = fma(_2645, _2567, -0.5);
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2655 = _2653 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2657 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2659 = _2657 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _2661 = _2581 > 0.5;
    bool _2663 = _2661 && _2533;
    float _2665 = _2571 * _2627;
    float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2669 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2667;
    float _2671 = -_1334;
    float _2673 = fma(_1386, _2651, _2671);
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2675;
    float _2679 = fma(_2669, _2561, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2681 = fma(_2677, _2561, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2685 = _2683 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2687 = fma(_2655, _2589, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2689 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2689;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2697 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2699 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2697;
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2701;
    float _2705 = fma(_2685, _2589, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2707 = fma(_2659, _2589, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2709 = fma(_2691, _2599, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2711 = fma(_2699, _2599, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2713 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2717 = fma(_2703, _2599, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _2723 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _2725 = isnan(_1250);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _2731 = _2727 || _2729;
    float _2733 = float(_2731);
    float _2735 = _2575 * _2647;
    float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _2737;
    float _2741 = fma(_2695, _2629, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2743 = fma(_2715, _2629, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2745 = -_2733;
    float _2747 = _2745 + 1.0;
    float _2749 = fma(_2739, _2735, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _2751 = -_2549;
    float _2753 = _2751 + 1.0;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2757 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _2755;
    float _2759 = fma(_2721, _2629, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _2761 = _2549 * _2747;
    bool _2763 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2765 = isnan(_1250);
    bool _2767 = _2763 || _2765;
    bool _2769 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2771 = _2767 || _2769;
    float _2773 = float(_2771);
    float _2775 = _2625 * _2753;
    float _2777 = -_2625;
    float _2779 = _2777 + 1.0;
    float _2781 = fma(_2757, _2735, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _2783 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2785 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _2783;
    float _2787 = in.m_65.x;
    float _2789 = in.m_65.y;
    float _2791 = in.m_65.z;
    float _2793 = _2773 * _2779;
    float _2795 = -_2773;
    float _2797 = _2795 + 1.0;
    float _2799 = fma(_2785, _2735, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _2801 = _1784 == 0.0;
    bool _2803 = !_2639;
    bool _2805 = _2801 && _2803;
    float _2807 = in.m_59.x;
    bool _2809 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2811 = isnan(_1250);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2817 = _2813 || _2815;
    float _2819 = float(_2817);
    float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _2825 = _2611 * _2797;
    float _2827 = -_2611;
    float _2829 = _2827 + 1.0;
    bool _2831 = _1788 == 0.0;
    bool _2833 = _2831 && _2805;
    float _2835 = fma(_2823, _2665, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    bool _2837 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2839 = isnan(_1250);
    bool _2841 = _2837 || _2839;
    bool _2843 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2845 = _2841 || _2843;
    float _2847 = float(_2845);
    float _2849 = _2819 * _2829;
    float _2851 = -_2819;
    float _2853 = _2851 + 1.0;
    float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _2857 = _2855 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _2859 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _2861 = _2859 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _2863 = _2847 * _2853;
    float _2865 = -_2847;
    float _2867 = _2865 + 1.0;
    float _2869 = fma(_2857, _2665, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _2871 = fma(_2861, _2665, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _2873 = _2649 * _2863;
    float _2875 = _2681 * _2863;
    float _2877 = _2679 * _2863;
    float _2879 = _2791;
    float _2881 = _2789;
    float _2883 = _2787;
    if (!_2833)
    {
        float _2885 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2791);
        _2879 = _2885;
    }
    float _2887 = _2879;
    if (!_2833)
    {
        float _2889 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2789);
        _2881 = _2889;
    }
    float _2891 = _2881;
    float _2893 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2873);
    float _2895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2897 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2875);
    float _2899 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2877);
    if (!_2833)
    {
        float _2901 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2787);
        _2883 = _2901;
    }
    float _2903 = _2883;
    float _2905 = _2807;
    if (_2533)
    {
        _2092 = _2807;
    }
    float _2907 = _2092;
    float _2909 = fma(_2687, _2849, _2893);
    float _2911 = fma(_2705, _2849, _2897);
    float _2913 = fma(_2707, _2849, _2899);
    float _2915 = _2054 * _2891;
    float _2917 = fma(_2709, _2825, _2909);
    float _2919 = fma(_2711, _2825, _2911);
    float _2921 = fma(_2717, _2825, _2913);
    float _2923 = _2907;
    if (_2663)
    {
        float _2925 = -_2907;
        float _2927 = _2925 + 1.0;
        _2923 = _2927;
    }
    float _2929 = _2923;
    float _2931 = fma(_2741, _2793, _2917);
    float _2933 = fma(_2743, _2793, _2919);
    float _2935 = fma(_2759, _2793, _2921);
    float _2937 = fma(_2062, _2903, _2915);
    if (_2533)
    {
        _2905 = _2929;
    }
    float _2939 = _2905;
    float _2941 = _2895 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2943 = fma(_2781, _2775, _2931);
    float _2945 = fma(_2749, _2775, _2933);
    float _2947 = fma(_2799, _2775, _2935);
    float _2949 = fma(_2941, _2939, -0.5);
    float _2951 = fma(_2835, _2761, _2943);
    float _2953 = fma(_2869, _2761, _2945);
    float _2955 = fma(_2871, _2761, _2947);
    float _2957 = fma(_1384, _2949, _1332);
    float _2959 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2961 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[129].x, _2951);
    float _2963 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[129].y, _2953);
    float _2965 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[129].z, _2955);
    float _2967 = _1952 * _2891;
    float _2969 = _1984 * _2891;
    float _2971 = fma(_2068, _2887, _2937);
    float _2973 = _2957 + 0.5;
    float _2975 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2959);
    float _2977 = _2961 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2979 = _2963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2981 = _2965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2983 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2985 = _2673 + 0.5;
    float _2987 = _2977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2989 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2991 = _2981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2993 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2975);
    float _2995 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2983);
    out.m_67.x = _2973;
    out.m_67.y = _2985;
    bool _2997 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2999 = isnan(0.5);
    bool _3001 = _2997 || _2999;
    bool _3003 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3005 = _3001 || _3003;
    float _3007 = _2993 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3009 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2995);
    out.m_69.x = _2987;
    out.m_69.y = _2989;
    out.m_69.z = _2991;
    float _3011 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3013 = 1.0 / _3007;
    float _3015 = fma(_1954, _2903, _2967);
    float _3017 = fma(_1990, _2903, _2969);
    float _3019 = _3009 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3021 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2613);
    float _3023 = fma(_1956, _2887, _3015);
    float _3025 = fma(_1994, _2887, _3017);
    float _3027 = _3019 + _3007;
    float _3029 = exp2(_3011);
    out.m_71.x = _3023;
    out.m_71.y = _2971;
    out.m_71.z = _3025;
    float _3031 = _3027 * _3013;
    float _3033 = _3031 * 0.5;
    float _3035 = _3023;
    if (_3005)
    {
        _3035 = 1.0;
    }
    float _3037 = _3035;
    float _3039 = _3037;
    if (!_3005)
    {
        float _3041 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3043 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3045 = _3041 * 0.15915493667125701904296875;
        float _3047 = _3043 * 0.15915493667125701904296875;
        float _3049 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3051 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3049);
        float _3053 = _3045 * 6.283185482025146484375;
        float _3055 = cos(_3053);
        float _3057 = _3045 * 6.283185482025146484375;
        float _3059 = sin(_3057);
        float _3061 = 1.0 / _3055;
        float _3063 = _3047 * 6.283185482025146484375;
        float _3065 = cos(_3063);
        float _3067 = _3059 * _3061;
        float _3069 = _3047 * 6.283185482025146484375;
        float _3071 = sin(_3069);
        float _3073 = _3065 * _3067;
        float _3075 = 1.0 / _3051;
        float _3077 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3079 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3077;
        float _3081 = 1.0 / _3073;
        float _3083 = 1.0 / _3079;
        float _3085 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3087 = _3075 * _3085;
        float _3089 = _3071 * _3081;
        float _3091 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3093 = fma(_3089, _3087, _3091);
        float _3095 = _3093 * _3083;
        float _3097 = precise::clamp(_3095, 0.0, 1.0);
        _3039 = _3097;
    }
    float _3099 = _3039;
    float _3101 = -_3029;
    float _3103 = _3101 + 1.0;
    float _3105 = _3021 + _2394;
    float _3107 = _3099 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3109 = _3099 > 0.0;
    bool _3111 = isnan(_3099);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan(0.0);
    bool _3117 = _3113 || _3115;
    float _3119 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3121 = _3105 * 0.5;
    float _3123 = _3107 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2428;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _3021;
    out.gl_Position.w = _2394;
    float _3125 = _3119 * _2462;
    float _3127 = -_3119;
    float _3129 = _3127 + 1.0;
    out.m_73.x = _2156;
    out.m_73.y = _2152;
    out.m_73.z = _2160;
    float _3131 = _2473 * _3125;
    float _3133 = _2483 * _3125;
    float _3135 = _2473 * _3129;
    out.m_75.z = _3121;
    out.m_75.w = _2394;
    float _3137 = fma(_2479, _3131, _2467);
    float _3139 = fma(_2481, _3131, _2469);
    float _3141 = fma(_2473, _3133, _2471);
    out.m_45.x = _3123;
    out.m_77.x = _3137;
    out.m_77.y = _3139;
    out.m_77.z = _3141;
    out.m_77.w = _3135;
    if (_3117)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3143 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3143;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1242 = false;
    bool _1100 = false;
    bool _812 = false;
    bool _560 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3200 = as_type<float>(_112);
        out.gl_Position.z = _3200;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    float _134 = _130;
    if (_126)
    {
        float _136 = float(_96);
        _132 = _136;
    }
    float _138 = _132;
    bool _140 = _130 >= _138;
    bool _142 = !_126;
    bool _144 = _140 || _142;
    if (_144)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _106;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3269 = as_type<float>(_150);
        out.gl_Position.z = _3269;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_47.x;
    float _154 = in.m_47.y;
    float _156 = in.m_47.z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _172 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _170);
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _174);
    float _178 = _174;
    float _180 = _158;
    if (!_168)
    {
        float _182 = _158 * _158;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _172);
    float _190 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _176);
    float _192 = _186;
    if (!_168)
    {
        float _194 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    float _236 = _232;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _158 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _180 = _256;
    }
    float _258 = _180;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = _264;
    if (!_168)
    {
        float _268 = _130 * _130;
        float _270 = _268 * 0.5;
        _236 = _270;
    }
    float _272 = _236;
    float _274 = fma(_258, _152, _260);
    float _276 = fma(_258, _154, _262);
    float _278 = fma(_258, _156, _264);
    float _280 = _272;
    if (!_168)
    {
        float _282 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _282;
    }
    float _284 = _280;
    bool _286 = !_168;
    float _288 = _284;
    if (!_286)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _130 * _292;
        float _302 = exp2(_300);
        float _304 = _298 * 0.693147182464599609375;
        float _306 = 1.0 / _304;
        float _308 = 1.0 / _296;
        float _310 = _302 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _306, _130);
        float _316 = _314 * _308;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _318;
        _266 = _302;
    }
    float _320 = _288;
    float _322 = _266;
    float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = _322;
    if (!_168)
    {
        _326 = _130;
    }
    float _328 = _326;
    bool _330 = !_168;
    float _332 = _328;
    if (!_330)
    {
        float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _336 = log2(_334);
        float _338 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _340 = _338 + 1.0;
        float _342 = 1.0 / _340;
        float _344 = _130 * _336;
        float _346 = exp2(_344);
        float _348 = -_346;
        float _350 = _348 + 1.0;
        float _352 = _350 * _342;
        _332 = _352;
    }
    float _354 = _332;
    float _356 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _358 = fma(_354, _154, _324);
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _362 = fma(_354, _152, _356);
    float _364 = -_358;
    float _366 = _276 + _364;
    float _368 = fma(_354, _156, _360);
    float _370 = -_362;
    float _372 = _274 + _370;
    float _374 = _366 * _366;
    float _376 = -_368;
    float _378 = _278 + _376;
    float _380 = sqrt(_190);
    float _382 = fma(_372, _372, _374);
    float _384 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _386 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _388 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _390 = fma(_378, _378, _382);
    float _392 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _384);
    float _394 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].y, _386);
    float _396 = sqrt(_188);
    float _398 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _400 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _392);
    float _402 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _404 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].x, _388);
    float _406 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].y, _394);
    float _408 = in.m_49.w;
    float _410 = sqrt(_390);
    float _412 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].x, _404);
    float _414 = in.m_42.x;
    float _416 = in.m_42.y;
    float _418 = in.m_42.z;
    float _420 = _380 * _406;
    float _422 = _420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _424 = sqrt(_400);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].z, _398);
    float _428 = _396 * _412;
    float _430 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].w, _402);
    float _432 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].z, _426);
    float _434 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _422);
    float _436 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].w, _430);
    bool _438 = _410 >= 9.9999999747524270787835121154785e-07;
    bool _440 = isnan(_410);
    bool _442 = _438 || _440;
    bool _444 = isnan(9.9999999747524270787835121154785e-07);
    bool _446 = _442 || _444;
    float _448 = _420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _450 = _420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _452 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _448);
    float _454 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _450);
    float _456 = _424 * _432;
    float _458 = fma(_274, _408, _414);
    float _460 = fma(_276, _408, _416);
    float _462 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[24].z, _434);
    float _464 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[25].z, _452);
    float _466 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[26].z, _454);
    float _468 = fma(_278, _408, _418);
    float _470 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[24].w, _462);
    float _472 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[25].w, _464);
    float _474 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[26].w, _466);
    float _476 = _436;
    float _478 = _472;
    float _480 = _474;
    if (_446)
    {
        _476 = _470;
    }
    float _482 = _476;
    float _484 = _482;
    if (!_446)
    {
        bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _488 = !_486;
        if (!_488)
        {
            float _490 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _492 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _494 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _496 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _490);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _492);
            float _502 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _494);
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _496);
            float _506 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _498);
            float _508 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _500);
            float _510 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _504);
            float _512 = _380 * _506;
            float _514 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _502);
            float _516 = _396 * _508;
            float _518 = _512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _520 = _424 * _514;
            float _522 = _512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _524 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[25].x, _518);
            float _526 = _512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _528 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[24].x, _522);
            float _530 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].z, _524);
            float _532 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[26].x, _526);
            float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].z, _528);
            float _536 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[25].w, _530);
            float _538 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].z, _532);
            float _540 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[24].w, _534);
            float _542 = _536 * _536;
            float _544 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[26].w, _538);
            float _546 = fma(_540, _540, _542);
            float _548 = fma(_544, _544, _546);
            float _550 = rsqrt(_548);
            float _552 = _550 * 9.9999999747524270787835121154785e-07;
            float _554 = _540 * _552;
            float _556 = _536 * _552;
            float _558 = _544 * _552;
            _478 = _556;
            _484 = _554;
            _480 = _558;
            _560 = true;
        }
        else
        {
            float _562 = _154 * _154;
            float _564 = fma(_152, _152, _562);
            float _566 = fma(_156, _156, _564);
            float _568 = sqrt(_566);
            bool _570 = _568 >= 9.9999999747524270787835121154785e-07;
            bool _572 = isnan(_568);
            bool _574 = _570 || _572;
            bool _576 = isnan(9.9999999747524270787835121154785e-07);
            bool _578 = _574 || _576;
            if (!_578)
            {
                float _580 = _416 * _416;
                float _582 = fma(_414, _414, _580);
                float _584 = fma(_418, _418, _582);
                float _586 = sqrt(_584);
                bool _588 = _586 >= 9.9999999747524270787835121154785e-07;
                bool _590 = isnan(_586);
                bool _592 = _588 || _590;
                bool _594 = isnan(9.9999999747524270787835121154785e-07);
                bool _596 = _592 || _594;
                if (!_596)
                {
                    float _598 = _380 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _600 = _396 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _602 = _424 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _604 = _598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _606 = _598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _608 = _598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _610 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[25].x, _604);
                    float _612 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[24].x, _606);
                    float _614 = fma(_600, (*spvDescriptorSet0.vp_c8)._m0[26].x, _608);
                    float _616 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _610);
                    float _618 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _612);
                    float _620 = fma(_602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _614);
                    float _622 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _616);
                    float _624 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _618);
                    float _626 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _620);
                    float _628 = _622 * _622;
                    float _630 = fma(_624, _624, _628);
                    float _632 = fma(_626, _626, _630);
                    float _634 = rsqrt(_632);
                    float _636 = _634 * 9.9999999747524270787835121154785e-07;
                    float _638 = _622 * _636;
                    float _640 = _624 * _636;
                    float _642 = _626 * _636;
                    _478 = _638;
                    _484 = _640;
                    _480 = _642;
                    _560 = true;
                }
                else
                {
                    float _644 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _646 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _648 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _650 = _416 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _652 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].y, _644);
                    float _654 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].x, _646);
                    float _656 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].z, _648);
                    float _658 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[14].w, _650);
                    float _660 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].y, _652);
                    float _662 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].x, _654);
                    float _664 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].z, _656);
                    float _666 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[16].w, _658);
                    float _668 = _380 * _660;
                    float _670 = _396 * _662;
                    float _672 = _424 * _664;
                    float _674 = _668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _676 = _668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _678 = _668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _680 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _674);
                    float _682 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _676);
                    float _684 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _678);
                    float _686 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].z, _680);
                    float _688 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].z, _682);
                    float _690 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].z, _684);
                    float _692 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].w, _686);
                    float _694 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].w, _688);
                    float _696 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].w, _690);
                    float _698 = _692 * _692;
                    float _700 = fma(_694, _694, _698);
                    float _702 = fma(_696, _696, _700);
                    float _704 = rsqrt(_702);
                    float _706 = _704 * 9.9999999747524270787835121154785e-07;
                    float _708 = _694 * _706;
                    float _710 = _692 * _706;
                    float _712 = _696 * _706;
                    _478 = _710;
                    _484 = _708;
                    _480 = _712;
                    _560 = true;
                }
            }
            else
            {
                float _714 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _716 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _718 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _720 = _154 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _722 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].y, _714);
                float _724 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].x, _716);
                float _726 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].z, _718);
                float _728 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[14].w, _720);
                float _730 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].y, _722);
                float _732 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].x, _724);
                float _734 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].z, _726);
                float _736 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[16].w, _728);
                float _738 = _380 * _730;
                float _740 = _396 * _732;
                float _742 = _424 * _734;
                float _744 = _738 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _746 = _738 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _748 = _738 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _750 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[25].x, _744);
                float _752 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[24].x, _746);
                float _754 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[26].x, _748);
                float _756 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].z, _750);
                float _758 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].z, _752);
                float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].z, _754);
                float _762 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].w, _756);
                float _764 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].w, _758);
                float _766 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].w, _760);
                float _768 = _762 * _762;
                float _770 = fma(_764, _764, _768);
                float _772 = fma(_766, _766, _770);
                float _774 = rsqrt(_772);
                float _776 = _774 * 9.9999999747524270787835121154785e-07;
                float _778 = _764 * _776;
                float _780 = _762 * _776;
                float _782 = _766 * _776;
                _478 = _780;
                _484 = _778;
                _480 = _782;
            }
        }
    }
    _560 = false;
    float _784 = _478;
    float _786 = _484;
    float _788 = _480;
    bool _790 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _792 = !_790;
    float _810;
    if (!_792)
    {
        float _794 = in.m_51.x;
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _798 = _794 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _802 = _800 * _796;
        float _804 = floor(_802);
        float _806 = -_804;
        float _808 = _802 + _806;
        _810 = _808;
        _812 = true;
    }
    else
    {
        float _814 = float(_96);
        float _816 = 1.0 / _814;
        float _818 = _130 * _816;
        _810 = _818;
    }
    _812 = false;
    float _820 = _810;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _824 = _820 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _828 = _820 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _832 = _820 + _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _850 = 1.0 / _836;
    bool _852 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _854 = isnan(_820);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    bool _864 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _866 = isnan(_820);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = 1.0 / _840;
    float _878 = -_874;
    float _880 = _878 + 1.0;
    bool _882 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _884 = 1.0 / _844;
    float _886 = _824 * _850;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _890 = _820 + _888;
    float _892 = 1.0 / _848;
    float _894 = _828 * _876;
    bool _896 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _898 = isnan(_820);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -_906;
    float _910 = _908 + 1.0;
    float _912 = _832 * _884;
    float _914 = _890 * _892;
    bool _916 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _918 = isnan(_820);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _928;
    float _932 = _926 * _910;
    float _934 = -_926;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _942;
    float _946 = fma(_930, _886, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _948 = _862 * _936;
    float _950 = -_862;
    float _952 = _950 + 1.0;
    float _954 = fma(_940, _886, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _956 = fma(_944, _886, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _958 = _820 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _960 = isnan(_820);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _874 * _952;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _974 = _972 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _984 = _968 * _880;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _986;
    float _990 = fma(_978, _894, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _992 = fma(_982, _894, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _994 = _954 * _984;
    float _996 = _956 * _984;
    float _998 = _946 * _984;
    float _1000 = -_968;
    float _1002 = _1000 + 1.0;
    float _1004 = in.m_49.x;
    float _1006 = in.m_49.y;
    float _1008 = in.m_49.z;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1014;
    float _1018 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[143].x, _994);
    float _1020 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[143].y, _996);
    float _1022 = fma(_974, _894, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[143].z, _998);
    float _1026 = fma(_1012, _912, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1028 = fma(_988, _912, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1030 = fma(_1016, _912, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1032 = fma(_990, _970, _1018);
    float _1034 = fma(_992, _970, _1020);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1048 = fma(_1022, _970, _1024);
    float _1050 = fma(_1038, _914, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1052 = fma(_1042, _914, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1054 = fma(_1046, _914, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _1056 = fma(_1026, _948, _1032);
    float _1058 = fma(_1028, _948, _1034);
    float _1060 = fma(_1030, _948, _1048);
    float _1062 = fma(_1050, _932, _1056);
    float _1064 = fma(_1052, _932, _1058);
    float _1066 = fma(_1054, _932, _1060);
    float _1068 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1062);
    float _1070 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1064);
    float _1072 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1066);
    float _1074 = _1068 * _1004;
    float _1076 = _1070 * _1006;
    float _1078 = _1072 * _1008;
    bool _1080 = !_882;
    float _1098;
    if (!_1080)
    {
        float _1082 = in.m_51.x;
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1086 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _1090 = _1088 * _1084;
        float _1092 = floor(_1090);
        float _1094 = -_1092;
        float _1096 = _1090 + _1094;
        _1098 = _1096;
        _1100 = true;
    }
    else
    {
        float _1102 = float(_96);
        float _1104 = 1.0 / _1102;
        float _1106 = _130 * _1104;
        _1098 = _1106;
    }
    _1100 = false;
    float _1108 = _1098;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1112 = _1108 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1118 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1120 = isnan(_1108);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1134 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1136 = isnan(_1108);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1146;
    bool _1150 = _1108 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1152 = isnan(_1108);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = 1.0 / _1116;
    float _1164 = -_1128;
    float _1166 = _1164 + 1.0;
    bool _1168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1170 = -_1160;
    float _1172 = _1170 + 1.0;
    float _1174 = 1.0 / _1132;
    float _1176 = _1128 * _1172;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1180 = _1148 * _1162;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1188 = fma(_1180, _1112, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1190 = _1144 * _1166;
    float _1192 = -_1144;
    float _1194 = _1192 + 1.0;
    float _1196 = _1184 * _1174;
    float _1198 = _1188 * _1190;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1202 = _1108 + _1200;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1198);
    float _1206 = fma(_1196, _1202, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1208 = fma(_1206, _1176, _1204);
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1214 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1208);
    float _1216 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1216;
    out.m_53.y = _1186;
    out.m_53.z = _1218;
    out.m_53.w = _1220;
    bool _1222 = !_1168;
    float _1240;
    if (!_1222)
    {
        float _1224 = in.m_51.x;
        float _1226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1228 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _1232 = _1230 * _1226;
        float _1234 = floor(_1232);
        float _1236 = -_1234;
        float _1238 = _1232 + _1236;
        _1240 = _1238;
        _1242 = true;
    }
    else
    {
        float _1244 = float(_96);
        float _1246 = 1.0 / _1244;
        float _1248 = _130 * _1246;
        _1240 = _1248;
    }
    _1242 = false;
    float _1250 = _1240;
    float _1252 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1254 = log2(_1252);
    float _1256 = in.m_51.x;
    float _1258 = in.m_51.y;
    float _1260 = _784 * _784;
    float _1262 = in.m_51.z;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1268 = 1.0 + _1266;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1280 = _1278 != 0;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1284 = _1282 != 0;
    float _1286 = fma(_786, _786, _1260);
    float _1288 = _1254 * _130;
    float _1290 = fma(_788, _788, _1286);
    float _1292 = 1.0 / _1268;
    float _1294 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1296 = exp2(_1288);
    float _1298 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1300 = _1256 * 2.0;
    float _1302 = _1262 * 2.0;
    float _1304 = fma(_1294, -2.0, _1264);
    float _1306 = -_1272;
    float _1308 = fma(_1298, 2.0, _1306);
    bool _1310 = !_1276;
    int _1312 = _1310 ? 0 : 1;
    float _1314 = floor(_1302);
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _1326 = _1324 != 0;
    float _1328 = _1258 * 2.0;
    float _1330 = -_130;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1308);
    float _1334 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1304);
    bool _1336 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1338 = isnan(1.0);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1344 = _1340 || _1342;
    float _1346 = -_1296;
    float _1348 = _1346 + 1.0;
    bool _1350 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1352 = isnan(0.0);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1358 = _1354 || _1356;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1364 = floor(_1300);
    float _1366 = _1358 ? _1348 : 0.0;
    float _1368 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1360);
    float _1370 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1362);
    float _1372 = _1258 + _1256;
    bool _1374 = _1314 >= 0.0;
    bool _1376 = isnan(_1314);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1368);
    float _1386 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1370);
    float _1388 = floor(_1328);
    if (_1344)
    {
        float _1390 = _1366 * _1292;
        _134 = _1390;
    }
    float _1392 = _134;
    bool _1394 = _1314 > 0.0;
    float _1396 = _1258 + _1262;
    float _1398 = _1372 + (-1.0);
    float _1400 = _1396 + (-1.0);
    float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _1404 = _1382 ? 0 : 1;
    float _1406 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1408 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1410 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _1412 = ~_1404;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    float _1418 = rsqrt(_1290);
    int _1420 = _1416;
    if (!_1394)
    {
        int _1422 = ~_1404;
        int _1424 = _1422 + 1;
        _1420 = _1424;
    }
    int _1426 = _1420;
    float _1428 = _1410 * _1270;
    bool _1430 = _1364 > 0.0;
    float _1432 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _1434 = _1388 > 0.0;
    float _1436 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1428);
    bool _1438 = !_1284;
    int _1440 = _1438 ? 0 : 1;
    float _1442 = _1432 * _1402;
    bool _1444 = !_1280;
    int _1446 = _1444 ? 0 : 1;
    float _1448 = _1436 + 0.25;
    bool _1450 = _1364 >= 0.0;
    bool _1452 = isnan(_1364);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(0.0);
    bool _1458 = _1454 || _1456;
    float _1460 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1442);
    bool _1462 = _1388 >= 0.0;
    bool _1464 = isnan(_1388);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan(0.0);
    bool _1470 = _1466 || _1468;
    float _1472 = floor(_1436);
    float _1474 = _1418 * _786;
    int _1476 = _1458 ? 0 : 1;
    float _1478 = _1418 * _784;
    int _1480 = _1470 ? 0 : 1;
    float _1482 = _1418 * _788;
    bool _1484 = !_1326;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = floor(_1460);
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1492 = _1490 != 0;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1496 = _1494 != 0;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1500 = _1498 != 0;
    int _1502 = ~_1476;
    int _1504 = _1502 + 1;
    int _1506 = _1504 + 1;
    int _1508 = ~_1480;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    int _1514 = _1506;
    int _1516 = _1512;
    if (!_1430)
    {
        int _1518 = ~_1476;
        int _1520 = _1518 + 1;
        _1514 = _1520;
    }
    int _1522 = _1514;
    if (!_1434)
    {
        int _1524 = ~_1480;
        int _1526 = _1524 + 1;
        _1516 = _1526;
    }
    int _1528 = _1516;
    bool _1530 = !_1496;
    int _1532 = _1530 ? 0 : 1;
    float _1534 = in.m_55.x;
    float _1536 = in.m_55.y;
    float _1538 = in.m_55.z;
    bool _1540 = !_1500;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = abs(_1532);
    float _1546 = -_1488;
    float _1548 = _1460 + _1546;
    int _1550 = abs(_1542);
    float _1552 = _1460 + 0.25;
    float _1554 = float(_1426);
    float _1556 = _1460 * 6.283185482025146484375;
    float _1558 = float(_1522);
    float _1560 = floor(_1448);
    float _1562 = float(_1544);
    bool _1564 = !_1492;
    int _1566 = _1564 ? 0 : 1;
    float _1568 = float(_1528);
    float _1570 = _1562 * _1558;
    int _1572 = abs(_1566);
    float _1574 = floor(_1552);
    float _1576 = float(_1550);
    float _1578 = -_1472;
    float _1580 = _1436 + _1578;
    float _1582 = _1570 * (-2.0);
    float _1584 = float(_1572);
    float _1586 = _1436 * 6.283185482025146484375;
    bool _1588 = _1548 >= 0.5;
    bool _1590 = isnan(_1548);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(0.5);
    bool _1596 = _1592 || _1594;
    float _1598 = _1258 + (-0.5);
    bool _1600 = _1580 >= 0.5;
    bool _1602 = isnan(_1580);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan(0.5);
    bool _1608 = _1604 || _1606;
    float _1610 = -_1560;
    float _1612 = _1448 + _1610;
    float _1614 = fma(_1582, _1536, _1536);
    float _1616 = _1584 * _1554;
    float _1618 = _1576 * _1568;
    float _1620 = _1586 * 0.15915493667125701904296875;
    float _1622 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1614);
    bool _1624 = !_1322;
    int _1626 = _1624 ? 0 : 1;
    float _1628 = -_1574;
    float _1630 = _1552 + _1628;
    float _1632 = fma(_1406, _1582, _1406);
    float _1634 = _1556 * 0.15915493667125701904296875;
    int _1636 = abs(_1446);
    float _1638 = _1618 * (-2.0);
    float _1640 = _1620 * 6.283185482025146484375;
    float _1642 = sin(_1640);
    bool _1644 = !_1608;
    float _1646 = _1644 ? 0.5 : (-0.5);
    bool _1648 = _1612 > 0.5;
    int _1650 = abs(_1626);
    bool _1652 = !_1596;
    float _1654 = _1652 ? 0.5 : (-0.5);
    float _1656 = _1634 * 6.283185482025146484375;
    float _1658 = sin(_1656);
    float _1660 = float(_1636);
    float _1662 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1664 = _1662 * 2.0;
    float _1666 = float(_1650);
    float _1668 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1670 = _1668 * 2.0;
    bool _1672 = !_1318;
    int _1674 = _1672 ? 0 : 1;
    float _1676 = _1660 * _1664;
    int _1678 = abs(_1312);
    float _1680 = _1666 * _1670;
    int _1682 = abs(_1674);
    float _1684 = _1612;
    float _1686 = _1630;
    if (_1648)
    {
        float _1688 = -_1612;
        float _1690 = _1688 + 1.0;
        _1684 = _1690;
    }
    float _1692 = _1684;
    bool _1694 = _1630 > 0.5;
    float _1696 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1698 = abs(_1440);
    float _1700 = fma(_1692, 4.0, -1.0);
    float _1702 = float(_1678);
    float _1704 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1706 = float(_1682);
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1710 = fma(_1702, _1696, _1676);
    int _1712 = abs(_1486);
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1716 = _1482 * _1714;
    float _1718 = float(_1698);
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1722 = _1478 * _1720;
    if (_1694)
    {
        float _1724 = -_1630;
        float _1726 = _1724 + 1.0;
        _1686 = _1726;
    }
    float _1728 = _1686;
    float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1732 = -_1716;
    float _1734 = fma(_1474, _1730, _1732);
    float _1736 = fma(_1706, _1704, _1680);
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1740 = -_1722;
    float _1742 = fma(_1482, _1738, _1740);
    float _1744 = fma(_1718, _1708, _1710);
    float _1746 = _1734 * _1734;
    float _1748 = fma(_1728, 4.0, -1.0);
    float _1750 = _1616 * (-2.0);
    float _1752 = fma(_1744, 3.1415927410125732421875, _1534);
    float _1754 = fma(_1742, _1742, _1746);
    float _1756 = fma(_1632, _1392, _1622);
    float _1758 = float(_1712);
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1762 = fma(_1408, _1750, _1408);
    float _1764 = fma(_1752, _1750, _1752);
    float _1766 = _1262 + _1256;
    float _1768 = _1756 * 0.15915493667125701904296875;
    float _1770 = fma(_1758, _1760, _1736);
    float _1772 = _1256 + (-0.5);
    float _1774 = _1766 + (-1.0);
    float _1776 = fma(_1770, 3.1415927410125732421875, _1538);
    float _1778 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1764);
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1782 = _1474 * _1780;
    float _1784 = in.m_57.x;
    float _1786 = in.m_57.y;
    float _1788 = in.m_57.z;
    float _1790 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1792 = _1262 + (-0.5);
    float _1794 = fma(_1776, _1638, _1776);
    float _1796 = fma(_1762, _1392, _1778);
    float _1798 = fma(_1790, _1638, _1790);
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1802 = -_1782;
    float _1804 = fma(_1478, _1800, _1802);
    float _1806 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1794);
    float _1808 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1810 = _1796 * 0.15915493667125701904296875;
    float _1812 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1814 = fma(_1798, _1392, _1806);
    float _1816 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1818 = fma(_1804, _1804, _1754);
    float _1820 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1822 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1808);
    float _1824 = _1814 * 0.15915493667125701904296875;
    float _1826 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1812);
    float _1828 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1816);
    float _1830 = rsqrt(_1818);
    float _1832 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1820);
    float _1834 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1822);
    float _1836 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1826);
    float _1838 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1828);
    float _1840 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1832);
    float _1842 = _1834 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1844 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1846 = _1768 * 6.283185482025146484375;
    float _1848 = cos(_1846);
    float _1850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1784);
    float _1852 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1854 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1788);
    float _1858 = _1844 * _1850;
    float _1860 = _1836 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1862 = _396 * _1842;
    float _1864 = _1810 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1786);
    float _1870 = _380 * _1860;
    float _1872 = _1742 * _1830;
    float _1874 = _1854 * _1856;
    float _1876 = _1852 * _1868;
    float _1878 = _1804 * _1830;
    float _1880 = _1734 * _1830;
    float _1882 = _1810 * 6.283185482025146484375;
    float _1884 = cos(_1882);
    float _1886 = _1840 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1888 = _1824 * 6.283185482025146484375;
    float _1890 = cos(_1888);
    float _1892 = _1866 * _1848;
    float _1894 = _1768 * 6.283185482025146484375;
    float _1896 = sin(_1894);
    float _1898 = _1884 * _1848;
    float _1900 = _1824 * 6.283185482025146484375;
    float _1902 = sin(_1900);
    float _1904 = _1848 * _1890;
    float _1906 = _1884 * _1890;
    float _1908 = _1884 * _1896;
    float _1910 = _1866 * _1896;
    float _1912 = _1866 * _1890;
    float _1914 = _1896 * _1890;
    float _1916 = _1906 * _1474;
    float _1918 = -_1908;
    float _1920 = fma(_1902, _1892, _1918);
    float _1922 = fma(_1902, _1898, _1910);
    float _1924 = -_1892;
    float _1926 = fma(_1902, _1908, _1924);
    float _1928 = fma(_1902, _1910, _1898);
    float _1930 = _1478 * _1878;
    float _1932 = _1922 * _1474;
    float _1934 = _1926 * _1474;
    float _1936 = _1838 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1938 = -_1930;
    float _1940 = fma(_1482, _1880, _1938);
    float _1942 = -_1902;
    float _1944 = fma(_1942, _1872, _1916);
    float _1946 = fma(_1904, _1872, _1932);
    float _1948 = fma(_1914, _1872, _1934);
    float _1950 = _1474 * _1880;
    float _1952 = fma(_1912, _1940, _1944);
    float _1954 = fma(_1920, _1940, _1946);
    float _1956 = fma(_1928, _1940, _1948);
    float _1958 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1960 = _1906 * _1482;
    float _1962 = _424 * _1936;
    float _1964 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1966 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1958);
    float _1968 = -_1950;
    float _1970 = fma(_1478, _1872, _1968);
    float _1972 = _1922 * _1482;
    float _1974 = -_1902;
    float _1976 = fma(_1974, _1878, _1960);
    float _1978 = _1926 * _1482;
    float _1980 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1964);
    float _1982 = fma(_1904, _1878, _1972);
    float _1984 = fma(_1912, _1970, _1976);
    float _1986 = fma(_1914, _1878, _1978);
    float _1988 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1980);
    float _1990 = fma(_1920, _1970, _1982);
    float _1992 = _1876 * _1984;
    float _1994 = fma(_1928, _1970, _1986);
    float _1996 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1966);
    float _1998 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1988);
    float _2000 = _1876 * _1952;
    float _2002 = fma(_1858, _1990, _1992);
    float _2004 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1996);
    float _2006 = _1998 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _2008 = fma(_1858, _1954, _2000);
    float _2010 = fma(_1874, _1994, _2002);
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _2014 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2016 = fma(_1874, _1956, _2008);
    float _2018 = _2006 + _2010;
    float _2020 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2014);
    float _2022 = _2012 + _2016;
    float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2026 = _2018 + _2024;
    float _2028 = _1482 * _1872;
    float _2030 = _1906 * _1478;
    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2034 = _2022 + _2032;
    float _2036 = _2026 * _2026;
    float _2038 = -_2028;
    float _2040 = fma(_1474, _1878, _2038);
    float _2042 = _1922 * _1478;
    float _2044 = -_1902;
    float _2046 = fma(_2044, _1880, _2030);
    float _2048 = fma(_2034, _2034, _2036);
    float _2050 = _1926 * _1478;
    float _2052 = fma(_1904, _1880, _2042);
    float _2054 = fma(_1912, _2040, _2046);
    float _2056 = sqrt(_2048);
    float _2058 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2020);
    float _2060 = fma(_1914, _1880, _2050);
    float _2062 = fma(_1920, _2040, _2052);
    float _2064 = _1876 * _2054;
    float _2066 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2058);
    float _2068 = fma(_1928, _2040, _2060);
    float _2070 = fma(_1858, _2062, _2064);
    float _2072 = _2066 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2074 = fma(_1874, _2068, _2070);
    bool _2076 = _2056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2078 = _2072 + _2074;
    float _2080 = _1874;
    float _2082 = _1858;
    float _2084 = _2014;
    float _2086 = _1886;
    float _2088 = _2052;
    float _2090 = _1902;
    float _2092 = _1784;
    if (!_2076)
    {
        _2080 = _2022;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (!_2076)
    {
        _2082 = _2018;
    }
    float _2098 = _2082;
    float _2100 = _2098;
    if (!_2076)
    {
        _2084 = _2078;
    }
    float _2102 = _2084;
    bool _2104 = !_2076;
    float _2106 = _2102;
    if (!_2104)
    {
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2112 = _2056 + _2110;
        float _2114 = rsqrt(_2048);
        float _2116 = _2112 * _2108;
        float _2118 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2120 = _2116 * 0.15915493667125701904296875;
        float _2122 = _2120 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        float _2126 = _2120 * 6.283185482025146484375;
        float _2128 = cos(_2126);
        float _2130 = fma(_2124, _2118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2132 = _2114 * _2130;
        float _2134 = _2128 + (-1.0);
        float _2136 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2138 = fma(_2034, _2132, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2140 = fma(_2026, _2132, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2142 = fma(_2078, _2128, _2136);
        _2106 = _2142;
        _2096 = _2138;
        _2100 = _2140;
    }
    float _2144 = _2106;
    float _2146 = _2096;
    float _2148 = _2100;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2152 = _2144 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2156 = _2146 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2160 = _2148 + _2158;
    float _2162 = _2152 * _2152;
    float _2164 = fma(_2156, _2156, _2162);
    float _2166 = fma(_2160, _2160, _2164);
    float _2168 = rsqrt(_2166);
    float _2170 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2172 = _2156 * _2170;
    float _2174 = _2160 * _2170;
    float _2176 = _2172 * _2172;
    float _2178 = _2174 * _2174;
    float _2180 = _2176 + _2178;
    float _2182 = sqrt(_2180);
    bool _2184 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2188 = _2182 + _2186;
    float _2190 = _2060;
    float _2192 = _2180;
    float _2194 = _2188;
    if (_2184)
    {
        float _2196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2190 = _2196;
    }
    float _2198 = _2190;
    if (_2184)
    {
        float _2200 = rsqrt(_2180);
        _2192 = _2200;
    }
    float _2202 = _2192;
    if (_2184)
    {
        float _2204 = _2188 * _2198;
        _2194 = _2204;
    }
    float _2206 = _2194;
    if (_2184)
    {
        float _2208 = _2206 * 0.15915493667125701904296875;
        _2086 = _2208;
    }
    float _2210 = _2086;
    float _2212 = _2046;
    float _2214 = _2210;
    if (_2184)
    {
        float _2216 = _2210 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        _2212 = _2218;
    }
    float _2220 = _2212;
    float _2222 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2224 = precise::max(0.0, _2222);
    float _2226 = _2020;
    float _2228 = _2224;
    float _2230 = _2222;
    if (_2184)
    {
        float _2232 = _2210 * 6.283185482025146484375;
        float _2234 = cos(_2232);
        _2226 = _2234;
    }
    float _2236 = _2226;
    float _2238 = -_2170;
    float _2240 = -_2224;
    float _2242 = fma(_2152, _2238, _2240);
    if (_2184)
    {
        float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2228 = _2244;
    }
    float _2246 = _2228;
    float _2248 = _2246;
    float _2250 = _2220;
    if (_2184)
    {
        float _2252 = fma(_2220, _2246, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2088 = _2252;
    }
    float _2254 = _2088;
    if (!_2184)
    {
        _2248 = _2172;
    }
    float _2256 = _2248;
    float _2258 = _2256;
    if (!_2184)
    {
        _2250 = _2242;
    }
    float _2260 = _2250;
    float _2262 = _2260;
    float _2264 = _2236;
    if (_2184)
    {
        float _2266 = _2236 + (-1.0);
        _2230 = _2266;
    }
    float _2268 = _2230;
    float _2270 = _2268;
    if (_2184)
    {
        float _2272 = _2202 * _2254;
        _2214 = _2272;
    }
    float _2274 = _2214;
    float _2276 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2278 = sqrt(_2166);
    if (_2184)
    {
        float _2280 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2090 = _2280;
    }
    float _2282 = _2090;
    float _2284 = _2282;
    if (_2184)
    {
        float _2286 = _2172 * _2274;
        _2258 = _2286;
    }
    float _2288 = _2258;
    if (!_2184)
    {
        _2270 = _2174;
    }
    float _2290 = _2270;
    float _2292 = _2290;
    if (_2184)
    {
        float _2294 = _2174 * _2274;
        _2292 = _2294;
    }
    float _2296 = _2292;
    if (_2184)
    {
        float _2298 = fma(_2242, _2236, _2282);
        _2262 = _2298;
    }
    float _2300 = _2262;
    if (!_2184)
    {
        _2284 = _2176;
    }
    float _2302 = _2284;
    float _2304 = _2302;
    if (_2184)
    {
        float _2306 = _2288 * _2288;
        _2304 = _2306;
    }
    float _2308 = _2304;
    if (!_2184)
    {
        _2264 = _2178;
    }
    float _2310 = _2264;
    float _2312 = _2310;
    if (_2184)
    {
        float _2314 = _2296 * _2296;
        _2312 = _2314;
    }
    float _2316 = _2312;
    float _2318 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2320 = fma(_2300, _2300, _2308);
    float _2322 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2324 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2326 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2276);
    float _2328 = _2320 + _2316;
    float _2330 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2318);
    float _2332 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2322);
    float _2334 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2324);
    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2338 = fma(_2278, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2336);
    float _2340 = precise::clamp(_2338, 0.0, 1.0);
    float _2342 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2330);
    float _2344 = rsqrt(_2328);
    float _2346 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2332);
    float _2348 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2326);
    float _2350 = _2342 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2352 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2354 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2356 = _2348 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2360 = -_2340;
    float _2362 = _2360 + 1.0;
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2366 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2334);
    float _2368 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2358);
    float _2370 = -_2364;
    float _2372 = fma(_2370, _2352, 1.0);
    float _2374 = abs(_2362);
    float _2376 = log2(_2374);
    float _2378 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2368);
    float _2380 = _2344 * _2288;
    float _2382 = _2344 * _2300;
    float _2384 = _2344 * _2296;
    float _2386 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2390 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2392 = log2(_2372);
    float _2394 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2378);
    float _2396 = -_2388;
    float _2398 = fma(_2382, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2396);
    float _2400 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2390);
    float _2402 = _2382 + 1.0;
    float _2404 = -_2384;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2398);
    float _2408 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2410 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2412 = 1.0 / _2394;
    float _2414 = fma(_2406, -0.5, 0.5);
    float _2416 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2408);
    float _2418 = fma(_2406, 0.5, 0.5);
    float _2420 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2416);
    float _2422 = fma(_2418, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2424 = exp2(_2410);
    float _2426 = _2392 * 0.693147182464599609375;
    float _2428 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2420);
    float _2430 = fma(_2418, _2422, -0.212114393711090087890625);
    float _2432 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2434 = fma(_2418, _2430, 1.570728778839111328125);
    float _2436 = sqrt(_2414);
    float _2438 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2400);
    float _2440 = _2428 * _2412;
    float _2442 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2438);
    float _2444 = fma(_2440, 0.5, 0.5);
    float _2446 = -_2382;
    float _2448 = fma(_2424, _2402, _2446);
    float _2450 = _2442 * _2412;
    float _2452 = fma(_2448, 0.5, 0.5);
    float _2454 = fma(_2450, -0.5, 0.5);
    float _2456 = _2436 * 0.636619746685028076171875;
    float _2458 = -_2434;
    float _2460 = fma(_2456, _2458, 1.0);
    float3 _7086 = float3(_2444, _2454, _2432);
    float _2462 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7086, float3(0.0), isnan(_7086)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7086, float3(0.0), isnan(_7086)), level(0.0)).x;
    float3 _7097 = float3(_2444, _2454, _2432);
    float4 _2465 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7097, float3(0.0), isnan(_7097)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7097, float3(0.0), isnan(_7097)), level(0.0)).xyzw;
    float _2467 = _2465.x;
    float _2469 = _2465.y;
    float _2471 = _2465.z;
    float _2473 = _2465.w;
    float2 _7114 = float2(_2460, _2452);
    float3 _2477 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7114, float2(0.0), isnan(_7114)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7114, float2(0.0), isnan(_7114)), level(0.0)).xyz;
    float _2479 = _2477.x;
    float _2481 = _2477.y;
    float _2483 = _2477.z;
    float _2485 = in.m_59.y;
    float _2487 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2489 = _1250 + _2487;
    bool _2491 = _1258 > 0.5;
    float _2493 = in.m_61.x;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2495;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2501 = _2499 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2503;
    float _2507 = 1.0 / _2497;
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2511 = _1250 + _2509;
    float _2513 = in.m_61.w;
    float _2515 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2517 = _1250 + _2515;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2521 = _2519 != 0;
    float _2523 = in.m_61.z;
    float _2525 = 1.0 / _2501;
    float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _2531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2533 = _2531 != 0;
    float _2535 = in.m_61.y;
    float _2537 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2539 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _2541 = isnan(_1250);
    bool _2543 = _2539 || _2541;
    bool _2545 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _2547 = _2543 || _2545;
    float _2549 = float(_2547);
    float _2551 = -_2485;
    float _2553 = _2551 + 1.0;
    float _2555 = 1.0 / _2505;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _2557;
    float _2561 = _2511 * _2507;
    out.m_63.x = _2493;
    float _2563 = _2485;
    if (_2521)
    {
        float _2565 = _2491 ? _2553 : _2485;
        _2563 = _2565;
    }
    float _2567 = _2563;
    float _2569 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _2571 = _1250 + _2569;
    float _2573 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2575 = _1250 + _2573;
    float _2577 = 0.0;
    if (_2533)
    {
        float _2579 = in.m_51.x;
        _2577 = _2579;
    }
    float _2581 = _2577;
    float _2583 = 1.0 / _2529;
    float _2585 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _2587 = _2585 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _2589 = _2489 * _2525;
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2593 = _1250 + _2591;
    out.m_63.w = _2513;
    float _2595 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2537);
    float _2597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2599 = _2517 * _2555;
    out.m_63.z = _2523;
    bool _2601 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2603 = isnan(_1250);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2609 = _2605 || _2607;
    float _2611 = float(_2609);
    float _2613 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2595);
    bool _2615 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2617 = isnan(_1250);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    out.m_63.y = _2535;
    float _2627 = 1.0 / _2587;
    float _2629 = _2593 * _2583;
    bool _2631 = _1786 != 0.0;
    bool _2633 = isnan(_1786);
    bool _2635 = _2631 || _2633;
    bool _2637 = isnan(0.0);
    bool _2639 = _2635 || _2637;
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2643 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2641;
    float _2645 = _2597 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2647 = 1.0 / _2559;
    float _2649 = fma(_2643, _2561, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2651 = fma(_2645, _2567, -0.5);
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2655 = _2653 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2657 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2659 = _2657 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _2661 = _2581 > 0.5;
    bool _2663 = _2661 && _2533;
    float _2665 = _2571 * _2627;
    float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2669 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2667;
    float _2671 = -_1334;
    float _2673 = fma(_1386, _2651, _2671);
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2675;
    float _2679 = fma(_2669, _2561, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2681 = fma(_2677, _2561, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2685 = _2683 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2687 = fma(_2655, _2589, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2689 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2689;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2697 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2699 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2697;
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2701;
    float _2705 = fma(_2685, _2589, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2707 = fma(_2659, _2589, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2709 = fma(_2691, _2599, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2711 = fma(_2699, _2599, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2713 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2717 = fma(_2703, _2599, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _2723 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _2725 = isnan(_1250);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _2731 = _2727 || _2729;
    float _2733 = float(_2731);
    float _2735 = _2575 * _2647;
    float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _2737;
    float _2741 = fma(_2695, _2629, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2743 = fma(_2715, _2629, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2745 = -_2733;
    float _2747 = _2745 + 1.0;
    float _2749 = fma(_2739, _2735, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _2751 = -_2549;
    float _2753 = _2751 + 1.0;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2757 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _2755;
    float _2759 = fma(_2721, _2629, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _2761 = _2549 * _2747;
    bool _2763 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2765 = isnan(_1250);
    bool _2767 = _2763 || _2765;
    bool _2769 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2771 = _2767 || _2769;
    float _2773 = float(_2771);
    float _2775 = _2625 * _2753;
    float _2777 = -_2625;
    float _2779 = _2777 + 1.0;
    float _2781 = fma(_2757, _2735, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _2783 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2785 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _2783;
    float _2787 = in.m_65.x;
    float _2789 = in.m_65.y;
    float _2791 = in.m_65.z;
    float _2793 = _2773 * _2779;
    float _2795 = -_2773;
    float _2797 = _2795 + 1.0;
    float _2799 = fma(_2785, _2735, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _2801 = _1784 == 0.0;
    bool _2803 = !_2639;
    bool _2805 = _2801 && _2803;
    float _2807 = in.m_59.x;
    bool _2809 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2811 = isnan(_1250);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2817 = _2813 || _2815;
    float _2819 = float(_2817);
    float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _2825 = _2611 * _2797;
    float _2827 = -_2611;
    float _2829 = _2827 + 1.0;
    bool _2831 = _1788 == 0.0;
    bool _2833 = _2831 && _2805;
    float _2835 = fma(_2823, _2665, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    bool _2837 = _1250 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2839 = isnan(_1250);
    bool _2841 = _2837 || _2839;
    bool _2843 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2845 = _2841 || _2843;
    float _2847 = float(_2845);
    float _2849 = _2819 * _2829;
    float _2851 = -_2819;
    float _2853 = _2851 + 1.0;
    float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _2857 = _2855 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _2859 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _2861 = _2859 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _2863 = _2847 * _2853;
    float _2865 = -_2847;
    float _2867 = _2865 + 1.0;
    float _2869 = fma(_2857, _2665, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _2871 = fma(_2861, _2665, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _2873 = _2649 * _2863;
    float _2875 = _2681 * _2863;
    float _2877 = _2679 * _2863;
    float _2879 = _2791;
    float _2881 = _2789;
    float _2883 = _2787;
    if (!_2833)
    {
        float _2885 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2791);
        _2879 = _2885;
    }
    float _2887 = _2879;
    if (!_2833)
    {
        float _2889 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2789);
        _2881 = _2889;
    }
    float _2891 = _2881;
    float _2893 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2873);
    float _2895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2897 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2875);
    float _2899 = fma(_2867, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2877);
    if (!_2833)
    {
        float _2901 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2787);
        _2883 = _2901;
    }
    float _2903 = _2883;
    float _2905 = _2807;
    if (_2533)
    {
        _2092 = _2807;
    }
    float _2907 = _2092;
    float _2909 = fma(_2687, _2849, _2893);
    float _2911 = fma(_2705, _2849, _2897);
    float _2913 = fma(_2707, _2849, _2899);
    float _2915 = _2054 * _2891;
    float _2917 = fma(_2709, _2825, _2909);
    float _2919 = fma(_2711, _2825, _2911);
    float _2921 = fma(_2717, _2825, _2913);
    float _2923 = _2907;
    if (_2663)
    {
        float _2925 = -_2907;
        float _2927 = _2925 + 1.0;
        _2923 = _2927;
    }
    float _2929 = _2923;
    float _2931 = fma(_2741, _2793, _2917);
    float _2933 = fma(_2743, _2793, _2919);
    float _2935 = fma(_2759, _2793, _2921);
    float _2937 = fma(_2062, _2903, _2915);
    if (_2533)
    {
        _2905 = _2929;
    }
    float _2939 = _2905;
    float _2941 = _2895 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2943 = fma(_2781, _2775, _2931);
    float _2945 = fma(_2749, _2775, _2933);
    float _2947 = fma(_2799, _2775, _2935);
    float _2949 = fma(_2941, _2939, -0.5);
    float _2951 = fma(_2835, _2761, _2943);
    float _2953 = fma(_2869, _2761, _2945);
    float _2955 = fma(_2871, _2761, _2947);
    float _2957 = fma(_1384, _2949, _1332);
    float _2959 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2961 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[129].x, _2951);
    float _2963 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[129].y, _2953);
    float _2965 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[129].z, _2955);
    float _2967 = _1952 * _2891;
    float _2969 = _1984 * _2891;
    float _2971 = fma(_2068, _2887, _2937);
    float _2973 = _2957 + 0.5;
    float _2975 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2959);
    float _2977 = _2961 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2979 = _2963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2981 = _2965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2983 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2985 = _2673 + 0.5;
    float _2987 = _2977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2989 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2991 = _2981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2993 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2975);
    float _2995 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2983);
    out.m_67.x = _2973;
    out.m_67.y = _2985;
    bool _2997 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2999 = isnan(0.5);
    bool _3001 = _2997 || _2999;
    bool _3003 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3005 = _3001 || _3003;
    float _3007 = _2993 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3009 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2995);
    out.m_69.x = _2987;
    out.m_69.y = _2989;
    out.m_69.z = _2991;
    float _3011 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3013 = 1.0 / _3007;
    float _3015 = fma(_1954, _2903, _2967);
    float _3017 = fma(_1990, _2903, _2969);
    float _3019 = _3009 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3021 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2613);
    float _3023 = fma(_1956, _2887, _3015);
    float _3025 = fma(_1994, _2887, _3017);
    float _3027 = _3019 + _3007;
    float _3029 = exp2(_3011);
    out.m_71.x = _3023;
    out.m_71.y = _2971;
    out.m_71.z = _3025;
    float _3031 = _3027 * _3013;
    float _3033 = _3031 * 0.5;
    float _3035 = _3023;
    if (_3005)
    {
        _3035 = 1.0;
    }
    float _3037 = _3035;
    float _3039 = _3037;
    if (!_3005)
    {
        float _3041 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3043 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3045 = _3041 * 0.15915493667125701904296875;
        float _3047 = _3043 * 0.15915493667125701904296875;
        float _3049 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3051 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3049);
        float _3053 = _3045 * 6.283185482025146484375;
        float _3055 = cos(_3053);
        float _3057 = _3045 * 6.283185482025146484375;
        float _3059 = sin(_3057);
        float _3061 = 1.0 / _3055;
        float _3063 = _3047 * 6.283185482025146484375;
        float _3065 = cos(_3063);
        float _3067 = _3059 * _3061;
        float _3069 = _3047 * 6.283185482025146484375;
        float _3071 = sin(_3069);
        float _3073 = _3065 * _3067;
        float _3075 = 1.0 / _3051;
        float _3077 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3079 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3077;
        float _3081 = 1.0 / _3073;
        float _3083 = 1.0 / _3079;
        float _3085 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3087 = _3075 * _3085;
        float _3089 = _3071 * _3081;
        float _3091 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3093 = fma(_3089, _3087, _3091);
        float _3095 = _3093 * _3083;
        float _3097 = precise::clamp(_3095, 0.0, 1.0);
        _3039 = _3097;
    }
    float _3099 = _3039;
    float _3101 = -_3029;
    float _3103 = _3101 + 1.0;
    float _3105 = _3021 + _2394;
    float _3107 = _3099 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3109 = _3099 > 0.0;
    bool _3111 = isnan(_3099);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan(0.0);
    bool _3117 = _3113 || _3115;
    float _3119 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3121 = _3105 * 0.5;
    float _3123 = _3107 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2428;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _3021;
    out.gl_Position.w = _2394;
    float _3125 = _3119 * _2462;
    float _3127 = -_3119;
    float _3129 = _3127 + 1.0;
    out.m_73.x = _2156;
    out.m_73.y = _2152;
    out.m_73.z = _2160;
    float _3131 = _2473 * _3125;
    float _3133 = _2483 * _3125;
    float _3135 = _2473 * _3129;
    out.m_75.z = _3121;
    out.m_75.w = _2394;
    float _3137 = fma(_2479, _3131, _2467);
    float _3139 = fma(_2481, _3131, _2469);
    float _3141 = fma(_2473, _3133, _2471);
    out.m_45.x = _3123;
    out.m_77.x = _3137;
    out.m_77.y = _3139;
    out.m_77.z = _3141;
    out.m_77.w = _3135;
    if (_3117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3143 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3143;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

