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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_73 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2000 = false;
    bool _800 = false;
    bool _672 = false;
    bool _522 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_108);
        out.gl_Position.z = _2482;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    float _148 = as_type<float>(_146);
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2554 = as_type<float>(_146);
        out.gl_Position.z = _2554;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = 0.0;
    if (!_166)
    {
        float _170 = _156 * _156;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = _174;
    if (!_166)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_166;
    float _184 = _180;
    float _186 = 0.0;
    if (!_182)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _156 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _156);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _216;
        _186 = _202;
        _148 = _206;
    }
    float _218 = _184;
    float _220 = _186;
    float _222 = _148;
    float _224 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _226 = _220;
    float _228 = _222;
    if (!_166)
    {
        _226 = _156;
    }
    float _230 = _226;
    bool _232 = !_166;
    float _234 = _230;
    if (!_232)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _156 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _234 = _254;
    }
    float _256 = _234;
    float _258 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _262 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _266 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].x, _260);
    float _270 = _264;
    if (!_166)
    {
        float _272 = _126 * _126;
        float _274 = _272 * 0.5;
        _228 = _274;
    }
    float _276 = _228;
    float _278 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].y, _264);
    float _280 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _266);
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[10].x, _268);
    if (!_166)
    {
        float _284 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _284;
    }
    float _286 = _270;
    bool _288 = !_166;
    float _290 = _286;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = _126 * _294;
        float _304 = 1.0 / _298;
        float _306 = _300 * 0.693147182464599609375;
        float _308 = exp2(_302);
        float _310 = 1.0 / _306;
        float _312 = _308 + (-1.0);
        float _314 = -_312;
        float _316 = fma(_314, _310, _126);
        float _318 = _316 * _304;
        float _320 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _320;
    }
    float _322 = _290;
    float _324 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _328 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[10].y, _278);
    float _330 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[10].z, _280);
    float _332 = _324 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _334 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = _324 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _338 = _324 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _340 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].y, _332);
    float _342 = _322;
    if (!_166)
    {
        _342 = _126;
    }
    float _344 = _342;
    bool _346 = !_166;
    float _348 = _344;
    if (!_346)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = 1.0 / _356;
        float _360 = _126 * _352;
        float _362 = exp2(_360);
        float _364 = -_362;
        float _366 = _364 + 1.0;
        float _368 = _366 * _358;
        _348 = _368;
    }
    float _370 = _348;
    float _372 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].x, _336);
    float _374 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].y, _340);
    float _376 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].z, _338);
    float _378 = fma(_256, _152, _328);
    float _380 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].x, _372);
    float _382 = fma(_370, _152, _374);
    float _384 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].z, _376);
    float _386 = fma(_256, _150, _282);
    float _388 = fma(_370, _150, _380);
    float _390 = -_382;
    float _392 = _378 + _390;
    float _394 = fma(_256, _154, _330);
    float _396 = fma(_370, _154, _384);
    float _398 = -_388;
    float _400 = _386 + _398;
    float _402 = _392 * _392;
    float _404 = in.m_51.w;
    float _406 = -_396;
    float _408 = _394 + _406;
    float _410 = _392 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _412 = fma(_400, _400, _402);
    float _414 = _392 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _416 = _392 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _418 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _410);
    float _420 = fma(_408, _408, _412);
    float _422 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _414);
    float _424 = in.m_44.x;
    float _426 = in.m_44.y;
    float _428 = in.m_44.z;
    float _430 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _418);
    float _432 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _416);
    float _434 = sqrt(_420);
    float _436 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _422);
    float _438 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _432);
    bool _440 = _434 >= 9.9999999747524270787835121154785e-07;
    bool _442 = isnan(_434);
    bool _444 = _440 || _442;
    bool _446 = isnan(9.9999999747524270787835121154785e-07);
    bool _448 = _444 || _446;
    float _450 = fma(_386, _404, _424);
    float _452 = fma(_378, _404, _426);
    float _454 = fma(_394, _404, _428);
    float _456 = _386;
    float _458 = _436;
    float _460 = _438;
    if (_448)
    {
        _456 = _430;
    }
    float _462 = _456;
    float _464 = _462;
    if (!_448)
    {
        bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _468 = !_466;
        if (!_468)
        {
            float _470 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _472 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _474 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _476 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _470);
            float _478 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _472);
            float _480 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _474);
            float _482 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _476);
            float _484 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _478);
            float _486 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _480);
            float _488 = _482 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _490 = _482 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _492 = _482 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _494 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[5].x, _488);
            float _496 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[4].x, _490);
            float _498 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[6].x, _492);
            float _500 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
            float _502 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[4].z, _496);
            float _504 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[6].z, _498);
            float _506 = _500 * _500;
            float _508 = fma(_502, _502, _506);
            float _510 = fma(_504, _504, _508);
            float _512 = rsqrt(_510);
            float _514 = _512 * 9.9999999747524270787835121154785e-07;
            float _516 = _502 * _514;
            float _518 = _500 * _514;
            float _520 = _504 * _514;
            _464 = _518;
            _458 = _516;
            _460 = _520;
            _522 = true;
        }
        else
        {
            float _524 = _152 * _152;
            float _526 = fma(_150, _150, _524);
            float _528 = fma(_154, _154, _526);
            float _530 = sqrt(_528);
            bool _532 = _530 >= 9.9999999747524270787835121154785e-07;
            bool _534 = isnan(_530);
            bool _536 = _532 || _534;
            bool _538 = isnan(9.9999999747524270787835121154785e-07);
            bool _540 = _536 || _538;
            if (!_540)
            {
                float _542 = _426 * _426;
                float _544 = fma(_424, _424, _542);
                float _546 = fma(_428, _428, _544);
                float _548 = sqrt(_546);
                bool _550 = _548 >= 9.9999999747524270787835121154785e-07;
                bool _552 = isnan(_548);
                bool _554 = _550 || _552;
                bool _556 = isnan(9.9999999747524270787835121154785e-07);
                bool _558 = _554 || _556;
                if (!_558)
                {
                    float _560 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _562 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _560);
                    float _564 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _562);
                    float _566 = rsqrt(_564);
                    float _568 = _566 * 9.9999999747524270787835121154785e-07;
                    float _570 = _568 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _572 = _568 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _574 = _568 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _464 = _572;
                    _458 = _570;
                    _460 = _574;
                    _522 = true;
                }
                else
                {
                    float _576 = _426 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _578 = _426 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _580 = _426 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _582 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
                    float _584 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[4].x, _578);
                    float _586 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
                    float _588 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[5].z, _582);
                    float _590 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[4].z, _584);
                    float _592 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[6].z, _586);
                    float _594 = _588 * _588;
                    float _596 = fma(_590, _590, _594);
                    float _598 = fma(_592, _592, _596);
                    float _600 = rsqrt(_598);
                    float _602 = _600 * 9.9999999747524270787835121154785e-07;
                    float _604 = _590 * _602;
                    float _606 = _588 * _602;
                    float _608 = _592 * _602;
                    _464 = _606;
                    _458 = _604;
                    _460 = _608;
                    _522 = true;
                }
            }
            else
            {
                float _610 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _612 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _614 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _616 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _610);
                float _618 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _612);
                float _620 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _614);
                float _622 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _616);
                float _624 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _618);
                float _626 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _620);
                float _628 = _622 * _622;
                float _630 = fma(_624, _624, _628);
                float _632 = fma(_626, _626, _630);
                float _634 = rsqrt(_632);
                float _636 = _634 * 9.9999999747524270787835121154785e-07;
                float _638 = _624 * _636;
                float _640 = _622 * _636;
                float _642 = _626 * _636;
                _464 = _640;
                _458 = _638;
                _460 = _642;
            }
        }
    }
    _522 = false;
    float _644 = _464;
    float _646 = _458;
    float _648 = _460;
    bool _650 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _652 = !_650;
    float _670;
    if (!_652)
    {
        float _654 = in.m_53.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_92);
        float _676 = 1.0 / _674;
        float _678 = _126 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _684 = _680 + _682;
    bool _686 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _688 = isnan(_680);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _698;
    bool _702 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _704 = isnan(_680);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -_696;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _718;
    float _722 = 1.0 / _700;
    bool _724 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _726 = _684 * _722;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _728;
    float _732 = _712 * _716;
    float _734 = fma(_720, _726, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _736 = -_712;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _740;
    float _744 = fma(_730, _726, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _746 = _734 * _732;
    float _748 = fma(_742, _726, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _750 = _744 * _732;
    float _752 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[107].x, _746);
    float _754 = _748 * _732;
    float _756 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[107].z, _750);
    float _758 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[108].x, _752);
    float _760 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[107].y, _754);
    float _762 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[108].z, _756);
    float _764 = _758 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _766 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[108].y, _760);
    float _768 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _772 = _766 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _774 = _764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = _772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _780 = !_724;
    float _798;
    if (!_780)
    {
        float _782 = in.m_53.x;
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _786 = _782 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _790 = _788 * _784;
        float _792 = floor(_790);
        float _794 = -_792;
        float _796 = _790 + _794;
        _798 = _796;
        _800 = true;
    }
    else
    {
        float _802 = float(_92);
        float _804 = 1.0 / _802;
        float _806 = _126 * _804;
        _798 = _806;
    }
    _800 = false;
    float _808 = _798;
    float _810 = in.m_53.z;
    float _812 = _452 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _814 = in.m_53.x;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _818 = _816 != 0;
    float _820 = _452 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _822 = _452 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _824 = in.m_53.y;
    float _826 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[4].x, _812);
    float _828 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[5].x, _820);
    float _830 = in.m_51.x;
    float _832 = in.m_51.y;
    float _834 = in.m_51.z;
    float _836 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[6].x, _822);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _840 = _808 + _838;
    float _842 = in.m_53.w;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _846 = _808 + _844;
    float _848 = in.m_55.x;
    float _850 = in.m_55.y;
    float _852 = in.m_55.z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _856 = _810 * 2.0;
    float _858 = 0.0;
    if (!_818)
    {
        _858 = _810;
    }
    float _860 = _858;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _864 = 0.0;
    float _866 = _860;
    if (!_818)
    {
        _864 = _810;
    }
    float _868 = _864;
    float _870 = _814 * 2.0;
    float _872 = floor(_856);
    float _874 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _876 = 0.0;
    float _878 = _868;
    if (!_818)
    {
        _876 = _824;
    }
    float _880 = _876;
    float _882 = _644 * _644;
    float _884 = _880;
    if (_818)
    {
        _884 = _814;
    }
    float _886 = _884;
    float _888 = _830 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    if (_818)
    {
        _866 = _824;
    }
    float _890 = _866;
    float _892 = floor(_870);
    if (_818)
    {
        _878 = _824;
    }
    float _894 = _878;
    float _896 = _832 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _898 = fma(_874, -2.0, _854);
    float _900 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _850);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _904;
    bool _908 = _872 > 0.0;
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _848);
    bool _912 = _872 >= 0.0;
    bool _914 = isnan(_872);
    bool _916 = _912 || _914;
    bool _918 = isnan(0.0);
    bool _920 = _916 || _918;
    float _922 = 1.0 / _906;
    float _924 = _834 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _852);
    int _928 = _920 ? 0 : 1;
    float _930 = _810 + (-0.5);
    bool _932 = _892 > 0.0;
    bool _934 = _892 >= 0.0;
    bool _936 = isnan(_892);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    int _944 = ~_928;
    int _946 = _944 + 1;
    int _948 = _946 + 1;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _952 = _808 + _950;
    int _954 = _942 ? 0 : 1;
    int _956 = _948;
    if (!_908)
    {
        int _958 = ~_928;
        int _960 = _958 + 1;
        _956 = _960;
    }
    int _962 = _956;
    int _964 = ~_954;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _972 = _970 != 0;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _980 = _978 != 0;
    int _982 = _968;
    if (!_932)
    {
        int _984 = ~_954;
        int _986 = _984 + 1;
        _982 = _986;
    }
    int _988 = _982;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1004 = _1002 != 0;
    float _1006 = in.m_57.x;
    float _1008 = in.m_57.y;
    float _1010 = in.m_57.z;
    bool _1012 = !_972;
    int _1014 = _1012 ? 0 : 1;
    bool _1016 = _842 > 0.5;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1026 = 1.0 / _1020;
    float _1028 = float(_988);
    float _1030 = 1.0 / _1024;
    float _1032 = _814 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1034 = -_862;
    float _1036 = fma(_1032, 2.0, _1034);
    float _1038 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[5].z, _828);
    float _1040 = _900 * _910;
    float _1042 = _1010 * _1010;
    float _1044 = _824 * 2.0;
    float _1046 = _1006 * _1006;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1052 = _1008 * _1008;
    float _1054 = floor(_1044);
    float _1056 = _824 + _810;
    float _1058 = _840 * _1030;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1062 = _808 + _1060;
    float _1064 = _1056 + (-1.0);
    float _1066 = _924 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1068 = _846 * _1026;
    float _1070 = 1.0 / _1050;
    float _1072 = _1062 * _922;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1080;
    float _1084 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[4].z, _826);
    float _1086 = fma(_1078, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1092 = _814 + _824;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1094;
    float _1098 = fma(_1082, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1100 = fma(_1090, _1058, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1102 = _1092 + (-1.0);
    float _1104 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[6].z, _836);
    float _1106 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = _952 * _1070;
    float _1110 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1112 = _814 + _810;
    bool _1114 = !_976;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = _1066 * _926;
    bool _1120 = _1054 >= 0.0;
    bool _1122 = isnan(_1054);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _1112 + (-1.0);
    float _1132 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1134 = log2(_1132);
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1136;
    int _1140 = _1128 ? 0 : 1;
    float _1142 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1144 = _1054 > 0.0;
    float _1146 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1148 = fma(_1138, _1072, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _1150 = abs(_1116);
    float _1152 = _1146 * _902;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1166 = fma(_1096, _1072, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1168 = fma(_1156, _1058, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1170 = fma(_1160, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1180 = fma(_646, _646, _882);
    float _1182 = _1134 * _126;
    float _1184 = fma(_1174, _1072, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1186 = fma(_1178, _1108, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1188 = fma(_648, _648, _1180);
    float _1190 = fma(_1164, _1058, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1192 = exp2(_1182);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1198 = _1196 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1202 = abs(_1014);
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    int _1208 = ~_1140;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1194);
    float _1216 = rsqrt(_1188);
    float _1218 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1200);
    int _1220 = _1212;
    bool _1222 = _1000;
    bool _1224 = _1004;
    float _1226 = _1198;
    if (!_1144)
    {
        int _1228 = ~_1140;
        int _1230 = _1228 + 1;
        _1220 = _1230;
    }
    int _1232 = _1220;
    float _1234 = _886 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1236 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1238 = isnan(0.0);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1244 = _1240 || _1242;
    float _1246 = _890 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1248 = float(_1202);
    float _1250 = -_1192;
    float _1252 = _1250 + 1.0;
    float _1254 = float(_962);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1258 = in.m_59.y;
    float _1260 = _1244 ? _1252 : 0.0;
    float _1262 = _1248 * _1254;
    bool _1264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1266 = isnan(1.0);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1272 = _1268 || _1270;
    float _1274 = _1216 * _646;
    float _1276 = _1216 * _644;
    float _1278 = _1216 * _648;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1282 = 1.0 + _1280;
    float _1284 = -_1256;
    float _1286 = fma(_1234, 2.0, _1284);
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1292 = !_980;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = 1.0 / _1282;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1300 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1290);
    int _1302 = abs(_1294);
    float _1304 = in.m_61.x;
    float _1306 = in.m_61.y;
    float _1308 = in.m_61.z;
    float _1310 = fma(_1246, -2.0, _1288);
    float _1312 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1298);
    float _1314 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1218);
    float _1316 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _898);
    float _1318 = float(_1302);
    float _1320 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1214);
    float _1322 = float(_1232);
    float _1324 = -_126;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1036);
    float _1328 = float(_1150);
    float _1330 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1300);
    float _1332 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1312);
    float _1334 = -_126;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1286);
    float _1338 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1310);
    float _1340 = _1258;
    float _1342 = _1326;
    if (_1272)
    {
        float _1344 = _1260 * _1296;
        _128 = _1344;
    }
    float _1346 = _128;
    float _1348 = _1318 * _1322;
    float _1350 = _1262 * (-2.0);
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1354 = _1278 * _1352;
    float _1356 = _1328 * _1028;
    float _1358 = _814 + (-0.5);
    float _1360 = fma(_1110, _1350, _1110);
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1364 = -_1354;
    float _1366 = fma(_1274, _1362, _1364);
    float _1368 = _1356 * (-2.0);
    float _1370 = fma(_1350, _1304, _1304);
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1374 = _1276 * _1372;
    float _1376 = _1366 * _1366;
    float _1378 = _1348 * (-2.0);
    float _1380 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1370);
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1384 = _1274 * _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1388 = -_1374;
    float _1390 = fma(_1278, _1386, _1388);
    float _1392 = fma(_1368, _1306, _1306);
    float _1394 = _824 + (-0.5);
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1398 = -_1384;
    float _1400 = fma(_1276, _1396, _1398);
    float _1402 = fma(_1390, _1390, _1376);
    float _1404 = fma(_1378, _1308, _1308);
    bool _1406 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1408 = isnan(_808);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1392);
    float _1420 = fma(_1400, _1400, _1402);
    float _1422 = -_1258;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1074, _1368, _1074);
    float _1428 = fma(_1360, _1346, _1380);
    float _1430 = rsqrt(_1420);
    float _1432 = -_1416;
    float _1434 = _1432 + 1.0;
    float _1436 = in.m_59.x;
    float _1438 = fma(_1426, _1346, _1418);
    int _1440 = _1016 ? as_type<int>(_1424) : as_type<int>(_1258);
    float _1442 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1404);
    bool _1444 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1446 = isnan(_808);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = _1428 * 0.15915493667125701904296875;
    float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1460 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1462 = isnan(_808);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    float _1472 = _1438 * 0.15915493667125701904296875;
    bool _1474 = _824 > 0.5;
    float _1476 = fma(_1206, _1108, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    int _1478 = _1000 ? _1440 : as_type<int>(_1258);
    float _1480 = _1470 * _1434;
    float _1482 = -_1470;
    float _1484 = _1482 + 1.0;
    float _1486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1488 = fma(_1142, _1378, _1142);
    int _1490 = _1478;
    int _1492 = as_type<int>(_1472);
    if (_1004)
    {
        float _1494 = _1474 ? _1424 : _1258;
        _1340 = _1494;
    }
    float _1496 = _1340;
    float _1498 = _1454 * _1484;
    bool _1500 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1502 = isnan(_808);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = -_1454;
    float _1514 = _1512 + 1.0;
    float _1516 = fma(_1488, _1346, _1442);
    if (_992)
    {
        bool _1518 = _814 > 0.5;
        _1222 = _1518;
    }
    bool _1520 = _1222;
    float _1522 = _1510 * _1514;
    float _1524 = -_1510;
    float _1526 = _1524 + 1.0;
    float _1528 = fma(_814, -10.0, -5.0);
    float _1530 = fma(_824, -10.0, -5.0);
    float _1532 = _1516 * 0.15915493667125701904296875;
    float _1534 = fma(-10.0, _810, -5.0);
    if (_996)
    {
        bool _1536 = _810 > 0.5;
        _1224 = _1536;
    }
    bool _1538 = _1224;
    float _1540 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1542 = _1456 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1548 = fma(_1198, _1108, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1550 = fma(_1540, _1496, -0.5);
    float _1552 = _1436;
    if (!_992)
    {
        _1226 = _1436;
    }
    float _1554 = _1226;
    float _1556 = fma(as_type<float>(_1478), _1546, -0.5);
    float _1558 = _1554;
    if (_992)
    {
        float _1560 = -_1436;
        float _1562 = _1560 + 1.0;
        _1490 = as_type<int>(_1562);
    }
    int _1564 = _1490;
    float _1566 = _1366 * _1430;
    float _1568 = _1456 * 6.283185482025146484375;
    float _1570 = cos(_1568);
    float _1572 = -_1316;
    float _1574 = fma(_1332, _1550, _1572);
    bool _1576 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1578 = isnan(_808);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_992)
    {
        float _1590 = _1520 ? as_type<float>(_1564) : _1436;
        _1558 = _1590;
    }
    float _1592 = _1558;
    float _1594 = _1390 * _1430;
    float _1596 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1598 = _1586 * _1526;
    float _1600 = _1472 * 6.283185482025146484375;
    float _1602 = sin(_1600);
    float _1604 = -_1338;
    float _1606 = fma(_1320, _1556, _1604);
    float _1608 = _1042 * _1042;
    float _1610 = _1098 * _1598;
    float _1612 = _1086 * _1598;
    float _1614 = _1170 * _1598;
    float _1616 = -_1586;
    float _1618 = _1616 + 1.0;
    float _1620 = _1472 * 6.283185482025146484375;
    float _1622 = cos(_1620);
    float _1624 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1610);
    float _1626 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1612);
    float _1628 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1614);
    float _1630 = fma(_1100, _1522, _1624);
    float _1632 = fma(_1168, _1522, _1626);
    float _1634 = _1532 * 6.283185482025146484375;
    float _1636 = cos(_1634);
    if (_996)
    {
        float _1638 = -_1436;
        float _1640 = _1638 + 1.0;
        _1492 = as_type<int>(_1640);
    }
    int _1642 = _1492;
    float _1644 = _1544 * _1602;
    float _1646 = _1570 * _1602;
    float _1648 = fma(_1190, _1522, _1628);
    float _1650 = fma(_1166, _1498, _1630);
    if (_996)
    {
        float _1652 = _1538 ? as_type<float>(_1642) : _1436;
        _1552 = _1652;
    }
    float _1654 = _1552;
    float _1656 = _1400 * _1430;
    float _1658 = _1532 * 6.283185482025146484375;
    float _1660 = sin(_1658);
    float _1662 = _1570 * _1622;
    float _1664 = _1544 * _1622;
    float _1666 = _1276 * _1656;
    float _1668 = fma(_1148, _1498, _1632);
    float _1670 = fma(_1184, _1498, _1648);
    float _1672 = -_1666;
    float _1674 = fma(_1278, _1566, _1672);
    float _1676 = _1544 * _1636;
    float _1678 = _1570 * _1636;
    float _1680 = _1622 * _1636;
    float _1682 = _1602 * _1636;
    float _1684 = _1274 * _1566;
    float _1686 = _1678 * _1274;
    float _1688 = fma(_1660, _1662, _1644);
    float _1690 = fma(_1660, _1644, _1662);
    float _1692 = -_1646;
    float _1694 = fma(_1660, _1664, _1692);
    float _1696 = -_1664;
    float _1698 = fma(_1660, _1646, _1696);
    float _1700 = _1688 * _1274;
    float _1702 = _1678 * _1278;
    float _1704 = -_1660;
    float _1706 = fma(_1704, _1594, _1686);
    float _1708 = _1698 * _1274;
    float _1710 = _1688 * _1278;
    float _1712 = -_1684;
    float _1714 = fma(_1276, _1594, _1712);
    float _1716 = fma(_1680, _1594, _1700);
    float _1718 = fma(_1682, _1594, _1708);
    float _1720 = -_1660;
    float _1722 = fma(_1720, _1656, _1702);
    float _1724 = _1278 * _1594;
    float _1726 = _1698 * _1278;
    float _1728 = fma(_1680, _1656, _1710);
    float _1730 = fma(_1676, _1674, _1706);
    float _1732 = fma(_1676, _1714, _1722);
    float _1734 = fma(_1694, _1674, _1716);
    float _1736 = fma(_1682, _1656, _1726);
    float _1738 = _1152 * _1730;
    float _1740 = fma(_1694, _1714, _1728);
    float _1742 = _1152 * _1732;
    float _1744 = fma(_1690, _1674, _1718);
    float _1746 = fma(_1040, _1734, _1738);
    float _1748 = fma(_1690, _1714, _1736);
    float _1750 = fma(_1040, _1740, _1742);
    float _1752 = _1678 * _1276;
    float _1754 = fma(_1118, _1744, _1746);
    float _1756 = -_1724;
    float _1758 = fma(_1274, _1656, _1756);
    float _1760 = fma(_1118, _1748, _1750);
    float _1762 = -_1660;
    float _1764 = fma(_1762, _1566, _1752);
    float _1766 = _1106 + _1754;
    float _1768 = _1688 * _1276;
    float _1770 = _1588 + _1760;
    float _1772 = _1698 * _1276;
    float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1776 = _1766 + _1774;
    float _1778 = fma(_1680, _1566, _1768);
    float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1782 = _1770 + _1780;
    float _1784 = fma(_1676, _1758, _1764);
    float _1786 = _1776 * _1776;
    float _1788 = fma(_1682, _1566, _1772);
    float _1790 = _1782 * _1782;
    float _1792 = fma(_1694, _1758, _1778);
    float _1794 = _1152 * _1784;
    float _1796 = fma(_1690, _1758, _1788);
    float _1798 = _1786 + _1790;
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1802 = fma(_1040, _1792, _1794);
    float _1804 = fma(_1118, _1796, _1802);
    float _1806 = sqrt(_1798);
    float _1808 = _1596 + _1804;
    float _1810 = in.m_57.w;
    float _1812 = fma(_1528, _1608, _1808);
    float _1814 = _1046 * _1046;
    float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1818 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1820 = fma(_1814, _1530, _1812);
    float _1822 = _1052 * _1052;
    float _1824 = fma(_1818, _1592, -0.5);
    float _1826 = fma(_1822, _1534, _1820);
    bool _1828 = _1806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1832 = fma(_1830, _1654, -0.5);
    float _1834 = fma(_1330, _1824, _1326);
    float _1836 = _1786;
    float _1838 = _1790;
    float _1840 = _1766;
    float _1842 = _1770;
    if (!_1828)
    {
        _1342 = _1826;
    }
    float _1844 = _1342;
    float _1846 = fma(_1314, _1832, _1336);
    bool _1848 = !_1828;
    float _1850 = _1844;
    if (!_1848)
    {
        float _1852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1856 = _1806 + _1854;
        float _1858 = rsqrt(_1798);
        float _1860 = _1856 * _1852;
        float _1862 = _1826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1864 = _1860 * 0.15915493667125701904296875;
        float _1866 = _1864 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        float _1870 = _1864 * 6.283185482025146484375;
        float _1872 = cos(_1870);
        float _1874 = fma(_1868, _1862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1876 = _1858 * _1874;
        float _1878 = _1872 + (-1.0);
        float _1880 = fma(_1776, _1876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1882 = fma(_1782, _1876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1884 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1888 = _1880 + _1886;
        float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1892 = _1882 + _1890;
        float _1894 = fma(_1826, _1872, _1884);
        float _1896 = _1888 * _1888;
        float _1898 = _1892 * _1892;
        _1850 = _1894;
        _1836 = _1896;
        _1838 = _1898;
        _1840 = _1880;
        _1842 = _1882;
    }
    float _1900 = _1850;
    float _1902 = _1836;
    float _1904 = _1838;
    float _1906 = _1840;
    float _1908 = _1842;
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1912 = _1900 + _1910;
    float _1914 = fma(_1186, _1480, _1650);
    float _1916 = fma(_1476, _1480, _1668);
    float _1918 = fma(_1548, _1480, _1670);
    float _1920 = fma(_1912, _1912, _1902);
    float _1922 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1914);
    float _1924 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1916);
    float _1926 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1918);
    float _1928 = _1920 + _1904;
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1932 = _1924 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1936 = _1574 + 0.5;
    float _1938 = _1606 + 0.5;
    float _1940 = sqrt(_1928);
    float _1942 = _1834 + 0.5;
    float _1944 = _1846 + 0.5;
    float _1946 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _774;
    out.m_63.y = _778;
    out.m_63.z = _776;
    out.m_63.w = _770;
    out.m_65.w = _1810;
    out.m_67.x = _1942;
    out.m_67.y = _1936;
    out.m_67.z = _1944;
    out.m_67.w = _1938;
    bool _1952 = _1940 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1954 = isnan(_1940);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1960 = _1956 || _1958;
    out.m_69.x = _1946;
    out.m_69.y = _1948;
    out.m_69.z = _1950;
    float _1962 = _1930;
    float _1964 = _1936;
    if (!_1960)
    {
        _1962 = 1.0;
    }
    float _1966 = _1962;
    bool _1968 = !_1960;
    float _1970 = _1966;
    if (!_1968)
    {
        bool _1972 = _1940 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1974 = isnan(_1940);
        bool _1976 = _1972 || _1974;
        bool _1978 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1980 = _1976 || _1978;
        if (!_1980)
        {
            float _1982 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1984 = _1940 + _1982;
            float _1986 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1988 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1986;
            float _1990 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1992 = _1990 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1994 = 1.0 / _1988;
            float _1996 = _1984 * _1994;
            float _1998 = fma(_1996, _1992, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1970 = _1998;
            _2000 = true;
        }
        else
        {
            bool _2002 = _1940 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2004 = isnan(_1940);
            bool _2006 = _2002 || _2004;
            bool _2008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2010 = _2006 || _2008;
            if (!_2010)
            {
                float _2012 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2014 = _1940 + _2012;
                float _2016 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2018 = _2016 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2022 = _2020 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2024 = 1.0 / _2018;
                float _2026 = _2014 * _2024;
                float _2028 = fma(_2026, _2022, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1970 = _2028;
                _2000 = true;
            }
            else
            {
                _1970 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2000 = false;
    float _2030 = _1970;
    float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2034 = _1900 + _2032;
    float _2036 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2038 = _1906 + _2036;
    float _2040 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2042 = _1908 + _2040;
    float _2044 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2046 = fma(_2038, _2030, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2048 = fma(_2042, _2030, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2052 = _2044 + _2050;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2056 = _2046 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2060 = _2048 + _2058;
    float _2062 = _2052 * _2052;
    float _2064 = fma(_2056, _2056, _2062);
    float _2066 = fma(_2060, _2060, _2064);
    float _2068 = rsqrt(_2066);
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2072 = _2056 * _2070;
    float _2074 = _2060 * _2070;
    float _2076 = _2072 * _2072;
    float _2078 = _2074 * _2074;
    float _2080 = _2076 + _2078;
    float _2082 = sqrt(_2080);
    bool _2084 = _2082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2088 = _2082 + _2086;
    float _2090 = _2068;
    float _2092 = _2080;
    float _2094 = _2088;
    float _2096 = _2052;
    float _2098 = _2070;
    float _2100 = _2072;
    if (_2084)
    {
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2090 = _2102;
    }
    float _2104 = _2090;
    if (_2084)
    {
        float _2106 = rsqrt(_2080);
        _2092 = _2106;
    }
    float _2108 = _2092;
    if (_2084)
    {
        float _2110 = _2088 * _2104;
        _2094 = _2110;
    }
    float _2112 = _2094;
    if (_2084)
    {
        float _2114 = _2112 * 0.15915493667125701904296875;
        _1964 = _2114;
    }
    float _2116 = _1964;
    float _2118 = _2104;
    float _2120 = _2116;
    if (_2084)
    {
        float _2122 = _2116 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    float _2128 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2130 = precise::max(0.0, _2128);
    float _2132 = _2060;
    float _2134 = _2130;
    if (_2084)
    {
        float _2136 = _2116 * 6.283185482025146484375;
        float _2138 = cos(_2136);
        _2132 = _2138;
    }
    float _2140 = _2132;
    float _2142 = -_2070;
    float _2144 = -_2130;
    float _2146 = fma(_2052, _2142, _2144);
    if (!_2084)
    {
        _2096 = _2074;
    }
    float _2148 = _2096;
    float _2150 = _2148;
    if (_2084)
    {
        float _2152 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2152;
    }
    float _2154 = _2134;
    float _2156 = _2126;
    float _2158 = _2154;
    if (_2084)
    {
        float _2160 = fma(_2126, _2154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = _2162;
    float _2166 = _2140;
    if (_2084)
    {
        float _2168 = _2140 + (-1.0);
        _2158 = _2168;
    }
    float _2170 = _2158;
    float _2172 = _2170;
    if (_2084)
    {
        float _2174 = _2108 * _2162;
        _2098 = _2174;
    }
    float _2176 = _2098;
    if (!_2084)
    {
        _2164 = _2146;
    }
    float _2178 = _2164;
    float _2180 = sqrt(_2066);
    float _2182 = _2178;
    if (_2084)
    {
        float _2184 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2184;
    }
    float _2186 = _2120;
    if (_2084)
    {
        float _2188 = _2072 * _2176;
        _2100 = _2188;
    }
    float _2190 = _2100;
    if (!_2084)
    {
        _2172 = _2076;
    }
    float _2192 = _2172;
    float _2194 = _2192;
    if (_2084)
    {
        float _2196 = _2074 * _2176;
        _2150 = _2196;
    }
    float _2198 = _2150;
    if (_2084)
    {
        float _2200 = fma(_2146, _2140, _2186);
        _2182 = _2200;
    }
    float _2202 = _2182;
    if (_2084)
    {
        float _2204 = _2190 * _2190;
        _2194 = _2204;
    }
    float _2206 = _2194;
    if (!_2084)
    {
        _2166 = _2078;
    }
    float _2208 = _2166;
    float _2210 = _2208;
    if (_2084)
    {
        float _2212 = _2198 * _2198;
        _2210 = _2212;
    }
    float _2214 = _2210;
    float _2216 = fma(_2202, _2202, _2206);
    float _2218 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2220 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2222 = _2216 + _2214;
    float _2224 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2218);
    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2228 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2226);
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2234 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2236 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2224);
    float _2238 = rsqrt(_2222);
    float _2240 = -_2230;
    float _2242 = _2240 + 1.0;
    float _2244 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2246 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2232);
    float _2248 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2250 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2244);
    float _2252 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2246);
    float _2254 = abs(_2242);
    float _2256 = log2(_2254);
    float _2258 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2220);
    float _2260 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2250);
    float _2262 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2264 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2266 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2258);
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2270 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2272 = _2238 * _2190;
    float _2274 = _2238 * _2202;
    float _2276 = -_2264;
    float _2278 = fma(_2276, _2234, 1.0);
    float _2280 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2270);
    float _2282 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2284 = _2238 * _2198;
    float _2286 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2288 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2280);
    float _2290 = -_2282;
    float _2292 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2290);
    float _2294 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2296 = log2(_2278);
    float _2298 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2288);
    float _2300 = -_2284;
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2292);
    float _2304 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2306 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2308 = fma(_2302, -0.5, 0.5);
    float _2310 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2304);
    float _2312 = exp2(_2294);
    float _2314 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2306);
    float _2316 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2310);
    float _2318 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2314);
    float _2320 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2316);
    float _2322 = 1.0 / _2298;
    float _2324 = fma(_2302, 0.5, 0.5);
    float _2326 = _2274 + 1.0;
    float _2328 = fma(_2324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2330 = sqrt(_2308);
    float _2332 = fma(_2324, _2328, -0.212114393711090087890625);
    float _2334 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2318);
    float _2336 = -_2274;
    float _2338 = fma(_2312, _2326, _2336);
    float _2340 = _2296 * 0.693147182464599609375;
    float _2342 = fma(_2324, _2332, 1.570728778839111328125);
    float _2344 = fma(_2338, 0.5, 0.5);
    float _2346 = _2320 * _2322;
    float _2348 = _2334 * _2322;
    float _2350 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2352 = fma(_2346, 0.5, 0.5);
    float _2354 = fma(_2348, -0.5, 0.5);
    float _2356 = _2330 * 0.636619746685028076171875;
    float3 _6201 = float3(_2352, _2354, _2350);
    float _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6201, float3(0.0), isnan(_6201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6201, float3(0.0), isnan(_6201)), level(0.0)).x;
    float _2360 = -_2342;
    float _2362 = fma(_2356, _2360, 1.0);
    float3 _6217 = float3(_2352, _2354, _2350);
    float4 _2365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6217, float3(0.0), isnan(_6217)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6217, float3(0.0), isnan(_6217)), level(0.0)).xyzw;
    float _2367 = _2365.x;
    float _2369 = _2365.y;
    float _2371 = _2365.z;
    float _2373 = _2365.w;
    float2 _6234 = float2(_2362, _2344);
    float3 _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6234, float2(0.0), isnan(_6234)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6234, float2(0.0), isnan(_6234)), level(0.0)).xyz;
    float _2379 = _2377.x;
    float _2381 = _2377.y;
    float _2383 = _2377.z;
    float _2385 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2387 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2389 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2387);
    float _2391 = exp2(_2385);
    float _2393 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2389);
    float _2395 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2393);
    float _2397 = _2395 + _2298;
    out.gl_Position.x = _2320;
    out.gl_Position.y = _2334;
    out.gl_Position.z = _2395;
    out.gl_Position.w = _2298;
    float _2399 = _2397 * 0.5;
    float _2401 = -_2391;
    float _2403 = _2401 + 1.0;
    float _2405 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2399;
    out.m_71.w = _2298;
    float _2407 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2407;
    float _2409 = _2405 * _2358;
    float _2411 = -_2405;
    float _2413 = _2411 + 1.0;
    float _2415 = _2373 * _2409;
    float _2417 = _2383 * _2409;
    float _2419 = fma(_2379, _2415, _2367);
    float _2421 = fma(_2381, _2415, _2369);
    float _2423 = _2373 * _2413;
    float _2425 = fma(_2373, _2417, _2371);
    out.m_73.x = _2419;
    out.m_73.y = _2421;
    out.m_73.z = _2425;
    out.m_73.w = _2423;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2000 = false;
    bool _800 = false;
    bool _672 = false;
    bool _522 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_108);
        out.gl_Position.z = _2482;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    float _148 = as_type<float>(_146);
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2554 = as_type<float>(_146);
        out.gl_Position.z = _2554;
    }
    if (_138)
    {
        return out;
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = 0.0;
    if (!_166)
    {
        float _170 = _156 * _156;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = _174;
    if (!_166)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_166;
    float _184 = _180;
    float _186 = 0.0;
    if (!_182)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _156 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _156);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _216;
        _186 = _202;
        _148 = _206;
    }
    float _218 = _184;
    float _220 = _186;
    float _222 = _148;
    float _224 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _226 = _220;
    float _228 = _222;
    if (!_166)
    {
        _226 = _156;
    }
    float _230 = _226;
    bool _232 = !_166;
    float _234 = _230;
    if (!_232)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _156 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _234 = _254;
    }
    float _256 = _234;
    float _258 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _262 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _266 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].x, _260);
    float _270 = _264;
    if (!_166)
    {
        float _272 = _126 * _126;
        float _274 = _272 * 0.5;
        _228 = _274;
    }
    float _276 = _228;
    float _278 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].y, _264);
    float _280 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _266);
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[10].x, _268);
    if (!_166)
    {
        float _284 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _284;
    }
    float _286 = _270;
    bool _288 = !_166;
    float _290 = _286;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = _126 * _294;
        float _304 = 1.0 / _298;
        float _306 = _300 * 0.693147182464599609375;
        float _308 = exp2(_302);
        float _310 = 1.0 / _306;
        float _312 = _308 + (-1.0);
        float _314 = -_312;
        float _316 = fma(_314, _310, _126);
        float _318 = _316 * _304;
        float _320 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _320;
    }
    float _322 = _290;
    float _324 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _328 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[10].y, _278);
    float _330 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[10].z, _280);
    float _332 = _324 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _334 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = _324 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _338 = _324 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _340 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].y, _332);
    float _342 = _322;
    if (!_166)
    {
        _342 = _126;
    }
    float _344 = _342;
    bool _346 = !_166;
    float _348 = _344;
    if (!_346)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = 1.0 / _356;
        float _360 = _126 * _352;
        float _362 = exp2(_360);
        float _364 = -_362;
        float _366 = _364 + 1.0;
        float _368 = _366 * _358;
        _348 = _368;
    }
    float _370 = _348;
    float _372 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].x, _336);
    float _374 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].y, _340);
    float _376 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].z, _338);
    float _378 = fma(_256, _152, _328);
    float _380 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].x, _372);
    float _382 = fma(_370, _152, _374);
    float _384 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].z, _376);
    float _386 = fma(_256, _150, _282);
    float _388 = fma(_370, _150, _380);
    float _390 = -_382;
    float _392 = _378 + _390;
    float _394 = fma(_256, _154, _330);
    float _396 = fma(_370, _154, _384);
    float _398 = -_388;
    float _400 = _386 + _398;
    float _402 = _392 * _392;
    float _404 = in.m_51.w;
    float _406 = -_396;
    float _408 = _394 + _406;
    float _410 = _392 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _412 = fma(_400, _400, _402);
    float _414 = _392 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _416 = _392 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _418 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _410);
    float _420 = fma(_408, _408, _412);
    float _422 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _414);
    float _424 = in.m_44.x;
    float _426 = in.m_44.y;
    float _428 = in.m_44.z;
    float _430 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _418);
    float _432 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _416);
    float _434 = sqrt(_420);
    float _436 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _422);
    float _438 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _432);
    bool _440 = _434 >= 9.9999999747524270787835121154785e-07;
    bool _442 = isnan(_434);
    bool _444 = _440 || _442;
    bool _446 = isnan(9.9999999747524270787835121154785e-07);
    bool _448 = _444 || _446;
    float _450 = fma(_386, _404, _424);
    float _452 = fma(_378, _404, _426);
    float _454 = fma(_394, _404, _428);
    float _456 = _386;
    float _458 = _436;
    float _460 = _438;
    if (_448)
    {
        _456 = _430;
    }
    float _462 = _456;
    float _464 = _462;
    if (!_448)
    {
        bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _468 = !_466;
        if (!_468)
        {
            float _470 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _472 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _474 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _476 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _470);
            float _478 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _472);
            float _480 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _474);
            float _482 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _476);
            float _484 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _478);
            float _486 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _480);
            float _488 = _482 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _490 = _482 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _492 = _482 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _494 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[5].x, _488);
            float _496 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[4].x, _490);
            float _498 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[6].x, _492);
            float _500 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
            float _502 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[4].z, _496);
            float _504 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[6].z, _498);
            float _506 = _500 * _500;
            float _508 = fma(_502, _502, _506);
            float _510 = fma(_504, _504, _508);
            float _512 = rsqrt(_510);
            float _514 = _512 * 9.9999999747524270787835121154785e-07;
            float _516 = _502 * _514;
            float _518 = _500 * _514;
            float _520 = _504 * _514;
            _464 = _518;
            _458 = _516;
            _460 = _520;
            _522 = true;
        }
        else
        {
            float _524 = _152 * _152;
            float _526 = fma(_150, _150, _524);
            float _528 = fma(_154, _154, _526);
            float _530 = sqrt(_528);
            bool _532 = _530 >= 9.9999999747524270787835121154785e-07;
            bool _534 = isnan(_530);
            bool _536 = _532 || _534;
            bool _538 = isnan(9.9999999747524270787835121154785e-07);
            bool _540 = _536 || _538;
            if (!_540)
            {
                float _542 = _426 * _426;
                float _544 = fma(_424, _424, _542);
                float _546 = fma(_428, _428, _544);
                float _548 = sqrt(_546);
                bool _550 = _548 >= 9.9999999747524270787835121154785e-07;
                bool _552 = isnan(_548);
                bool _554 = _550 || _552;
                bool _556 = isnan(9.9999999747524270787835121154785e-07);
                bool _558 = _554 || _556;
                if (!_558)
                {
                    float _560 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _562 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _560);
                    float _564 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _562);
                    float _566 = rsqrt(_564);
                    float _568 = _566 * 9.9999999747524270787835121154785e-07;
                    float _570 = _568 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _572 = _568 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _574 = _568 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _464 = _572;
                    _458 = _570;
                    _460 = _574;
                    _522 = true;
                }
                else
                {
                    float _576 = _426 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _578 = _426 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _580 = _426 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _582 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
                    float _584 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[4].x, _578);
                    float _586 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
                    float _588 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[5].z, _582);
                    float _590 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[4].z, _584);
                    float _592 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[6].z, _586);
                    float _594 = _588 * _588;
                    float _596 = fma(_590, _590, _594);
                    float _598 = fma(_592, _592, _596);
                    float _600 = rsqrt(_598);
                    float _602 = _600 * 9.9999999747524270787835121154785e-07;
                    float _604 = _590 * _602;
                    float _606 = _588 * _602;
                    float _608 = _592 * _602;
                    _464 = _606;
                    _458 = _604;
                    _460 = _608;
                    _522 = true;
                }
            }
            else
            {
                float _610 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _612 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _614 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _616 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _610);
                float _618 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _612);
                float _620 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _614);
                float _622 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _616);
                float _624 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _618);
                float _626 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _620);
                float _628 = _622 * _622;
                float _630 = fma(_624, _624, _628);
                float _632 = fma(_626, _626, _630);
                float _634 = rsqrt(_632);
                float _636 = _634 * 9.9999999747524270787835121154785e-07;
                float _638 = _624 * _636;
                float _640 = _622 * _636;
                float _642 = _626 * _636;
                _464 = _640;
                _458 = _638;
                _460 = _642;
            }
        }
    }
    _522 = false;
    float _644 = _464;
    float _646 = _458;
    float _648 = _460;
    bool _650 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _652 = !_650;
    float _670;
    if (!_652)
    {
        float _654 = in.m_53.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_92);
        float _676 = 1.0 / _674;
        float _678 = _126 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _684 = _680 + _682;
    bool _686 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _688 = isnan(_680);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _698;
    bool _702 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _704 = isnan(_680);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -_696;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _718;
    float _722 = 1.0 / _700;
    bool _724 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _726 = _684 * _722;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _728;
    float _732 = _712 * _716;
    float _734 = fma(_720, _726, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _736 = -_712;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _740;
    float _744 = fma(_730, _726, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _746 = _734 * _732;
    float _748 = fma(_742, _726, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _750 = _744 * _732;
    float _752 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[107].x, _746);
    float _754 = _748 * _732;
    float _756 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[107].z, _750);
    float _758 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[108].x, _752);
    float _760 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[107].y, _754);
    float _762 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[108].z, _756);
    float _764 = _758 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _766 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[108].y, _760);
    float _768 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _772 = _766 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _774 = _764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = _772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _780 = !_724;
    float _798;
    if (!_780)
    {
        float _782 = in.m_53.x;
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _786 = _782 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _790 = _788 * _784;
        float _792 = floor(_790);
        float _794 = -_792;
        float _796 = _790 + _794;
        _798 = _796;
        _800 = true;
    }
    else
    {
        float _802 = float(_92);
        float _804 = 1.0 / _802;
        float _806 = _126 * _804;
        _798 = _806;
    }
    _800 = false;
    float _808 = _798;
    float _810 = in.m_53.z;
    float _812 = _452 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _814 = in.m_53.x;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _818 = _816 != 0;
    float _820 = _452 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _822 = _452 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _824 = in.m_53.y;
    float _826 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[4].x, _812);
    float _828 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[5].x, _820);
    float _830 = in.m_51.x;
    float _832 = in.m_51.y;
    float _834 = in.m_51.z;
    float _836 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[6].x, _822);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _840 = _808 + _838;
    float _842 = in.m_53.w;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _846 = _808 + _844;
    float _848 = in.m_55.x;
    float _850 = in.m_55.y;
    float _852 = in.m_55.z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _856 = _810 * 2.0;
    float _858 = 0.0;
    if (!_818)
    {
        _858 = _810;
    }
    float _860 = _858;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _864 = 0.0;
    float _866 = _860;
    if (!_818)
    {
        _864 = _810;
    }
    float _868 = _864;
    float _870 = _814 * 2.0;
    float _872 = floor(_856);
    float _874 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _876 = 0.0;
    float _878 = _868;
    if (!_818)
    {
        _876 = _824;
    }
    float _880 = _876;
    float _882 = _644 * _644;
    float _884 = _880;
    if (_818)
    {
        _884 = _814;
    }
    float _886 = _884;
    float _888 = _830 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    if (_818)
    {
        _866 = _824;
    }
    float _890 = _866;
    float _892 = floor(_870);
    if (_818)
    {
        _878 = _824;
    }
    float _894 = _878;
    float _896 = _832 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _898 = fma(_874, -2.0, _854);
    float _900 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _850);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _904;
    bool _908 = _872 > 0.0;
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _848);
    bool _912 = _872 >= 0.0;
    bool _914 = isnan(_872);
    bool _916 = _912 || _914;
    bool _918 = isnan(0.0);
    bool _920 = _916 || _918;
    float _922 = 1.0 / _906;
    float _924 = _834 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _852);
    int _928 = _920 ? 0 : 1;
    float _930 = _810 + (-0.5);
    bool _932 = _892 > 0.0;
    bool _934 = _892 >= 0.0;
    bool _936 = isnan(_892);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    int _944 = ~_928;
    int _946 = _944 + 1;
    int _948 = _946 + 1;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _952 = _808 + _950;
    int _954 = _942 ? 0 : 1;
    int _956 = _948;
    if (!_908)
    {
        int _958 = ~_928;
        int _960 = _958 + 1;
        _956 = _960;
    }
    int _962 = _956;
    int _964 = ~_954;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _972 = _970 != 0;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _980 = _978 != 0;
    int _982 = _968;
    if (!_932)
    {
        int _984 = ~_954;
        int _986 = _984 + 1;
        _982 = _986;
    }
    int _988 = _982;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1004 = _1002 != 0;
    float _1006 = in.m_57.x;
    float _1008 = in.m_57.y;
    float _1010 = in.m_57.z;
    bool _1012 = !_972;
    int _1014 = _1012 ? 0 : 1;
    bool _1016 = _842 > 0.5;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1026 = 1.0 / _1020;
    float _1028 = float(_988);
    float _1030 = 1.0 / _1024;
    float _1032 = _814 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1034 = -_862;
    float _1036 = fma(_1032, 2.0, _1034);
    float _1038 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[5].z, _828);
    float _1040 = _900 * _910;
    float _1042 = _1010 * _1010;
    float _1044 = _824 * 2.0;
    float _1046 = _1006 * _1006;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1052 = _1008 * _1008;
    float _1054 = floor(_1044);
    float _1056 = _824 + _810;
    float _1058 = _840 * _1030;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1062 = _808 + _1060;
    float _1064 = _1056 + (-1.0);
    float _1066 = _924 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1068 = _846 * _1026;
    float _1070 = 1.0 / _1050;
    float _1072 = _1062 * _922;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1080;
    float _1084 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[4].z, _826);
    float _1086 = fma(_1078, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1092 = _814 + _824;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1094;
    float _1098 = fma(_1082, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1100 = fma(_1090, _1058, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1102 = _1092 + (-1.0);
    float _1104 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[6].z, _836);
    float _1106 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = _952 * _1070;
    float _1110 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1112 = _814 + _810;
    bool _1114 = !_976;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = _1066 * _926;
    bool _1120 = _1054 >= 0.0;
    bool _1122 = isnan(_1054);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _1112 + (-1.0);
    float _1132 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1134 = log2(_1132);
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1136;
    int _1140 = _1128 ? 0 : 1;
    float _1142 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1144 = _1054 > 0.0;
    float _1146 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1148 = fma(_1138, _1072, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _1150 = abs(_1116);
    float _1152 = _1146 * _902;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1166 = fma(_1096, _1072, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1168 = fma(_1156, _1058, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1170 = fma(_1160, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1180 = fma(_646, _646, _882);
    float _1182 = _1134 * _126;
    float _1184 = fma(_1174, _1072, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1186 = fma(_1178, _1108, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1188 = fma(_648, _648, _1180);
    float _1190 = fma(_1164, _1058, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1192 = exp2(_1182);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1198 = _1196 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1202 = abs(_1014);
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    int _1208 = ~_1140;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1194);
    float _1216 = rsqrt(_1188);
    float _1218 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1200);
    int _1220 = _1212;
    bool _1222 = _1000;
    bool _1224 = _1004;
    float _1226 = _1198;
    if (!_1144)
    {
        int _1228 = ~_1140;
        int _1230 = _1228 + 1;
        _1220 = _1230;
    }
    int _1232 = _1220;
    float _1234 = _886 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1236 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1238 = isnan(0.0);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1244 = _1240 || _1242;
    float _1246 = _890 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1248 = float(_1202);
    float _1250 = -_1192;
    float _1252 = _1250 + 1.0;
    float _1254 = float(_962);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1258 = in.m_59.y;
    float _1260 = _1244 ? _1252 : 0.0;
    float _1262 = _1248 * _1254;
    bool _1264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1266 = isnan(1.0);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1272 = _1268 || _1270;
    float _1274 = _1216 * _646;
    float _1276 = _1216 * _644;
    float _1278 = _1216 * _648;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1282 = 1.0 + _1280;
    float _1284 = -_1256;
    float _1286 = fma(_1234, 2.0, _1284);
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1292 = !_980;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = 1.0 / _1282;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1300 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1290);
    int _1302 = abs(_1294);
    float _1304 = in.m_61.x;
    float _1306 = in.m_61.y;
    float _1308 = in.m_61.z;
    float _1310 = fma(_1246, -2.0, _1288);
    float _1312 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1298);
    float _1314 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1218);
    float _1316 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _898);
    float _1318 = float(_1302);
    float _1320 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1214);
    float _1322 = float(_1232);
    float _1324 = -_126;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1036);
    float _1328 = float(_1150);
    float _1330 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1300);
    float _1332 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1312);
    float _1334 = -_126;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1286);
    float _1338 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1310);
    float _1340 = _1258;
    float _1342 = _1326;
    if (_1272)
    {
        float _1344 = _1260 * _1296;
        _128 = _1344;
    }
    float _1346 = _128;
    float _1348 = _1318 * _1322;
    float _1350 = _1262 * (-2.0);
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1354 = _1278 * _1352;
    float _1356 = _1328 * _1028;
    float _1358 = _814 + (-0.5);
    float _1360 = fma(_1110, _1350, _1110);
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1364 = -_1354;
    float _1366 = fma(_1274, _1362, _1364);
    float _1368 = _1356 * (-2.0);
    float _1370 = fma(_1350, _1304, _1304);
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1374 = _1276 * _1372;
    float _1376 = _1366 * _1366;
    float _1378 = _1348 * (-2.0);
    float _1380 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1370);
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1384 = _1274 * _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1388 = -_1374;
    float _1390 = fma(_1278, _1386, _1388);
    float _1392 = fma(_1368, _1306, _1306);
    float _1394 = _824 + (-0.5);
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1398 = -_1384;
    float _1400 = fma(_1276, _1396, _1398);
    float _1402 = fma(_1390, _1390, _1376);
    float _1404 = fma(_1378, _1308, _1308);
    bool _1406 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1408 = isnan(_808);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1392);
    float _1420 = fma(_1400, _1400, _1402);
    float _1422 = -_1258;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1074, _1368, _1074);
    float _1428 = fma(_1360, _1346, _1380);
    float _1430 = rsqrt(_1420);
    float _1432 = -_1416;
    float _1434 = _1432 + 1.0;
    float _1436 = in.m_59.x;
    float _1438 = fma(_1426, _1346, _1418);
    int _1440 = _1016 ? as_type<int>(_1424) : as_type<int>(_1258);
    float _1442 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1404);
    bool _1444 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1446 = isnan(_808);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = _1428 * 0.15915493667125701904296875;
    float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1460 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1462 = isnan(_808);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    float _1472 = _1438 * 0.15915493667125701904296875;
    bool _1474 = _824 > 0.5;
    float _1476 = fma(_1206, _1108, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    int _1478 = _1000 ? _1440 : as_type<int>(_1258);
    float _1480 = _1470 * _1434;
    float _1482 = -_1470;
    float _1484 = _1482 + 1.0;
    float _1486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1488 = fma(_1142, _1378, _1142);
    int _1490 = _1478;
    int _1492 = as_type<int>(_1472);
    if (_1004)
    {
        float _1494 = _1474 ? _1424 : _1258;
        _1340 = _1494;
    }
    float _1496 = _1340;
    float _1498 = _1454 * _1484;
    bool _1500 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1502 = isnan(_808);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = -_1454;
    float _1514 = _1512 + 1.0;
    float _1516 = fma(_1488, _1346, _1442);
    if (_992)
    {
        bool _1518 = _814 > 0.5;
        _1222 = _1518;
    }
    bool _1520 = _1222;
    float _1522 = _1510 * _1514;
    float _1524 = -_1510;
    float _1526 = _1524 + 1.0;
    float _1528 = fma(_814, -10.0, -5.0);
    float _1530 = fma(_824, -10.0, -5.0);
    float _1532 = _1516 * 0.15915493667125701904296875;
    float _1534 = fma(-10.0, _810, -5.0);
    if (_996)
    {
        bool _1536 = _810 > 0.5;
        _1224 = _1536;
    }
    bool _1538 = _1224;
    float _1540 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1542 = _1456 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1548 = fma(_1198, _1108, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1550 = fma(_1540, _1496, -0.5);
    float _1552 = _1436;
    if (!_992)
    {
        _1226 = _1436;
    }
    float _1554 = _1226;
    float _1556 = fma(as_type<float>(_1478), _1546, -0.5);
    float _1558 = _1554;
    if (_992)
    {
        float _1560 = -_1436;
        float _1562 = _1560 + 1.0;
        _1490 = as_type<int>(_1562);
    }
    int _1564 = _1490;
    float _1566 = _1366 * _1430;
    float _1568 = _1456 * 6.283185482025146484375;
    float _1570 = cos(_1568);
    float _1572 = -_1316;
    float _1574 = fma(_1332, _1550, _1572);
    bool _1576 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1578 = isnan(_808);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_992)
    {
        float _1590 = _1520 ? as_type<float>(_1564) : _1436;
        _1558 = _1590;
    }
    float _1592 = _1558;
    float _1594 = _1390 * _1430;
    float _1596 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1598 = _1586 * _1526;
    float _1600 = _1472 * 6.283185482025146484375;
    float _1602 = sin(_1600);
    float _1604 = -_1338;
    float _1606 = fma(_1320, _1556, _1604);
    float _1608 = _1042 * _1042;
    float _1610 = _1098 * _1598;
    float _1612 = _1086 * _1598;
    float _1614 = _1170 * _1598;
    float _1616 = -_1586;
    float _1618 = _1616 + 1.0;
    float _1620 = _1472 * 6.283185482025146484375;
    float _1622 = cos(_1620);
    float _1624 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1610);
    float _1626 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1612);
    float _1628 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1614);
    float _1630 = fma(_1100, _1522, _1624);
    float _1632 = fma(_1168, _1522, _1626);
    float _1634 = _1532 * 6.283185482025146484375;
    float _1636 = cos(_1634);
    if (_996)
    {
        float _1638 = -_1436;
        float _1640 = _1638 + 1.0;
        _1492 = as_type<int>(_1640);
    }
    int _1642 = _1492;
    float _1644 = _1544 * _1602;
    float _1646 = _1570 * _1602;
    float _1648 = fma(_1190, _1522, _1628);
    float _1650 = fma(_1166, _1498, _1630);
    if (_996)
    {
        float _1652 = _1538 ? as_type<float>(_1642) : _1436;
        _1552 = _1652;
    }
    float _1654 = _1552;
    float _1656 = _1400 * _1430;
    float _1658 = _1532 * 6.283185482025146484375;
    float _1660 = sin(_1658);
    float _1662 = _1570 * _1622;
    float _1664 = _1544 * _1622;
    float _1666 = _1276 * _1656;
    float _1668 = fma(_1148, _1498, _1632);
    float _1670 = fma(_1184, _1498, _1648);
    float _1672 = -_1666;
    float _1674 = fma(_1278, _1566, _1672);
    float _1676 = _1544 * _1636;
    float _1678 = _1570 * _1636;
    float _1680 = _1622 * _1636;
    float _1682 = _1602 * _1636;
    float _1684 = _1274 * _1566;
    float _1686 = _1678 * _1274;
    float _1688 = fma(_1660, _1662, _1644);
    float _1690 = fma(_1660, _1644, _1662);
    float _1692 = -_1646;
    float _1694 = fma(_1660, _1664, _1692);
    float _1696 = -_1664;
    float _1698 = fma(_1660, _1646, _1696);
    float _1700 = _1688 * _1274;
    float _1702 = _1678 * _1278;
    float _1704 = -_1660;
    float _1706 = fma(_1704, _1594, _1686);
    float _1708 = _1698 * _1274;
    float _1710 = _1688 * _1278;
    float _1712 = -_1684;
    float _1714 = fma(_1276, _1594, _1712);
    float _1716 = fma(_1680, _1594, _1700);
    float _1718 = fma(_1682, _1594, _1708);
    float _1720 = -_1660;
    float _1722 = fma(_1720, _1656, _1702);
    float _1724 = _1278 * _1594;
    float _1726 = _1698 * _1278;
    float _1728 = fma(_1680, _1656, _1710);
    float _1730 = fma(_1676, _1674, _1706);
    float _1732 = fma(_1676, _1714, _1722);
    float _1734 = fma(_1694, _1674, _1716);
    float _1736 = fma(_1682, _1656, _1726);
    float _1738 = _1152 * _1730;
    float _1740 = fma(_1694, _1714, _1728);
    float _1742 = _1152 * _1732;
    float _1744 = fma(_1690, _1674, _1718);
    float _1746 = fma(_1040, _1734, _1738);
    float _1748 = fma(_1690, _1714, _1736);
    float _1750 = fma(_1040, _1740, _1742);
    float _1752 = _1678 * _1276;
    float _1754 = fma(_1118, _1744, _1746);
    float _1756 = -_1724;
    float _1758 = fma(_1274, _1656, _1756);
    float _1760 = fma(_1118, _1748, _1750);
    float _1762 = -_1660;
    float _1764 = fma(_1762, _1566, _1752);
    float _1766 = _1106 + _1754;
    float _1768 = _1688 * _1276;
    float _1770 = _1588 + _1760;
    float _1772 = _1698 * _1276;
    float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1776 = _1766 + _1774;
    float _1778 = fma(_1680, _1566, _1768);
    float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1782 = _1770 + _1780;
    float _1784 = fma(_1676, _1758, _1764);
    float _1786 = _1776 * _1776;
    float _1788 = fma(_1682, _1566, _1772);
    float _1790 = _1782 * _1782;
    float _1792 = fma(_1694, _1758, _1778);
    float _1794 = _1152 * _1784;
    float _1796 = fma(_1690, _1758, _1788);
    float _1798 = _1786 + _1790;
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1802 = fma(_1040, _1792, _1794);
    float _1804 = fma(_1118, _1796, _1802);
    float _1806 = sqrt(_1798);
    float _1808 = _1596 + _1804;
    float _1810 = in.m_57.w;
    float _1812 = fma(_1528, _1608, _1808);
    float _1814 = _1046 * _1046;
    float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1818 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1820 = fma(_1814, _1530, _1812);
    float _1822 = _1052 * _1052;
    float _1824 = fma(_1818, _1592, -0.5);
    float _1826 = fma(_1822, _1534, _1820);
    bool _1828 = _1806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1832 = fma(_1830, _1654, -0.5);
    float _1834 = fma(_1330, _1824, _1326);
    float _1836 = _1786;
    float _1838 = _1790;
    float _1840 = _1766;
    float _1842 = _1770;
    if (!_1828)
    {
        _1342 = _1826;
    }
    float _1844 = _1342;
    float _1846 = fma(_1314, _1832, _1336);
    bool _1848 = !_1828;
    float _1850 = _1844;
    if (!_1848)
    {
        float _1852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1856 = _1806 + _1854;
        float _1858 = rsqrt(_1798);
        float _1860 = _1856 * _1852;
        float _1862 = _1826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1864 = _1860 * 0.15915493667125701904296875;
        float _1866 = _1864 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        float _1870 = _1864 * 6.283185482025146484375;
        float _1872 = cos(_1870);
        float _1874 = fma(_1868, _1862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1876 = _1858 * _1874;
        float _1878 = _1872 + (-1.0);
        float _1880 = fma(_1776, _1876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1882 = fma(_1782, _1876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1884 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1888 = _1880 + _1886;
        float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1892 = _1882 + _1890;
        float _1894 = fma(_1826, _1872, _1884);
        float _1896 = _1888 * _1888;
        float _1898 = _1892 * _1892;
        _1850 = _1894;
        _1836 = _1896;
        _1838 = _1898;
        _1840 = _1880;
        _1842 = _1882;
    }
    float _1900 = _1850;
    float _1902 = _1836;
    float _1904 = _1838;
    float _1906 = _1840;
    float _1908 = _1842;
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1912 = _1900 + _1910;
    float _1914 = fma(_1186, _1480, _1650);
    float _1916 = fma(_1476, _1480, _1668);
    float _1918 = fma(_1548, _1480, _1670);
    float _1920 = fma(_1912, _1912, _1902);
    float _1922 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1914);
    float _1924 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1916);
    float _1926 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1918);
    float _1928 = _1920 + _1904;
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1932 = _1924 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1936 = _1574 + 0.5;
    float _1938 = _1606 + 0.5;
    float _1940 = sqrt(_1928);
    float _1942 = _1834 + 0.5;
    float _1944 = _1846 + 0.5;
    float _1946 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _774;
    out.m_63.y = _778;
    out.m_63.z = _776;
    out.m_63.w = _770;
    out.m_65.w = _1810;
    out.m_67.x = _1942;
    out.m_67.y = _1936;
    out.m_67.z = _1944;
    out.m_67.w = _1938;
    bool _1952 = _1940 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1954 = isnan(_1940);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1960 = _1956 || _1958;
    out.m_69.x = _1946;
    out.m_69.y = _1948;
    out.m_69.z = _1950;
    float _1962 = _1930;
    float _1964 = _1936;
    if (!_1960)
    {
        _1962 = 1.0;
    }
    float _1966 = _1962;
    bool _1968 = !_1960;
    float _1970 = _1966;
    if (!_1968)
    {
        bool _1972 = _1940 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1974 = isnan(_1940);
        bool _1976 = _1972 || _1974;
        bool _1978 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1980 = _1976 || _1978;
        if (!_1980)
        {
            float _1982 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1984 = _1940 + _1982;
            float _1986 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1988 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1986;
            float _1990 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1992 = _1990 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1994 = 1.0 / _1988;
            float _1996 = _1984 * _1994;
            float _1998 = fma(_1996, _1992, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1970 = _1998;
            _2000 = true;
        }
        else
        {
            bool _2002 = _1940 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2004 = isnan(_1940);
            bool _2006 = _2002 || _2004;
            bool _2008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2010 = _2006 || _2008;
            if (!_2010)
            {
                float _2012 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2014 = _1940 + _2012;
                float _2016 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2018 = _2016 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2022 = _2020 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2024 = 1.0 / _2018;
                float _2026 = _2014 * _2024;
                float _2028 = fma(_2026, _2022, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1970 = _2028;
                _2000 = true;
            }
            else
            {
                _1970 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2000 = false;
    float _2030 = _1970;
    float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2034 = _1900 + _2032;
    float _2036 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2038 = _1906 + _2036;
    float _2040 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2042 = _1908 + _2040;
    float _2044 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2046 = fma(_2038, _2030, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2048 = fma(_2042, _2030, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2052 = _2044 + _2050;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2056 = _2046 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2060 = _2048 + _2058;
    float _2062 = _2052 * _2052;
    float _2064 = fma(_2056, _2056, _2062);
    float _2066 = fma(_2060, _2060, _2064);
    float _2068 = rsqrt(_2066);
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2072 = _2056 * _2070;
    float _2074 = _2060 * _2070;
    float _2076 = _2072 * _2072;
    float _2078 = _2074 * _2074;
    float _2080 = _2076 + _2078;
    float _2082 = sqrt(_2080);
    bool _2084 = _2082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2088 = _2082 + _2086;
    float _2090 = _2068;
    float _2092 = _2080;
    float _2094 = _2088;
    float _2096 = _2052;
    float _2098 = _2070;
    float _2100 = _2072;
    if (_2084)
    {
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2090 = _2102;
    }
    float _2104 = _2090;
    if (_2084)
    {
        float _2106 = rsqrt(_2080);
        _2092 = _2106;
    }
    float _2108 = _2092;
    if (_2084)
    {
        float _2110 = _2088 * _2104;
        _2094 = _2110;
    }
    float _2112 = _2094;
    if (_2084)
    {
        float _2114 = _2112 * 0.15915493667125701904296875;
        _1964 = _2114;
    }
    float _2116 = _1964;
    float _2118 = _2104;
    float _2120 = _2116;
    if (_2084)
    {
        float _2122 = _2116 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    float _2128 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2130 = precise::max(0.0, _2128);
    float _2132 = _2060;
    float _2134 = _2130;
    if (_2084)
    {
        float _2136 = _2116 * 6.283185482025146484375;
        float _2138 = cos(_2136);
        _2132 = _2138;
    }
    float _2140 = _2132;
    float _2142 = -_2070;
    float _2144 = -_2130;
    float _2146 = fma(_2052, _2142, _2144);
    if (!_2084)
    {
        _2096 = _2074;
    }
    float _2148 = _2096;
    float _2150 = _2148;
    if (_2084)
    {
        float _2152 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2152;
    }
    float _2154 = _2134;
    float _2156 = _2126;
    float _2158 = _2154;
    if (_2084)
    {
        float _2160 = fma(_2126, _2154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = _2162;
    float _2166 = _2140;
    if (_2084)
    {
        float _2168 = _2140 + (-1.0);
        _2158 = _2168;
    }
    float _2170 = _2158;
    float _2172 = _2170;
    if (_2084)
    {
        float _2174 = _2108 * _2162;
        _2098 = _2174;
    }
    float _2176 = _2098;
    if (!_2084)
    {
        _2164 = _2146;
    }
    float _2178 = _2164;
    float _2180 = sqrt(_2066);
    float _2182 = _2178;
    if (_2084)
    {
        float _2184 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2184;
    }
    float _2186 = _2120;
    if (_2084)
    {
        float _2188 = _2072 * _2176;
        _2100 = _2188;
    }
    float _2190 = _2100;
    if (!_2084)
    {
        _2172 = _2076;
    }
    float _2192 = _2172;
    float _2194 = _2192;
    if (_2084)
    {
        float _2196 = _2074 * _2176;
        _2150 = _2196;
    }
    float _2198 = _2150;
    if (_2084)
    {
        float _2200 = fma(_2146, _2140, _2186);
        _2182 = _2200;
    }
    float _2202 = _2182;
    if (_2084)
    {
        float _2204 = _2190 * _2190;
        _2194 = _2204;
    }
    float _2206 = _2194;
    if (!_2084)
    {
        _2166 = _2078;
    }
    float _2208 = _2166;
    float _2210 = _2208;
    if (_2084)
    {
        float _2212 = _2198 * _2198;
        _2210 = _2212;
    }
    float _2214 = _2210;
    float _2216 = fma(_2202, _2202, _2206);
    float _2218 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2220 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2222 = _2216 + _2214;
    float _2224 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2218);
    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2228 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2226);
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2234 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2236 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2224);
    float _2238 = rsqrt(_2222);
    float _2240 = -_2230;
    float _2242 = _2240 + 1.0;
    float _2244 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2246 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2232);
    float _2248 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2250 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2244);
    float _2252 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2246);
    float _2254 = abs(_2242);
    float _2256 = log2(_2254);
    float _2258 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2220);
    float _2260 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2250);
    float _2262 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2264 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2266 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2258);
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2270 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2272 = _2238 * _2190;
    float _2274 = _2238 * _2202;
    float _2276 = -_2264;
    float _2278 = fma(_2276, _2234, 1.0);
    float _2280 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2270);
    float _2282 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2284 = _2238 * _2198;
    float _2286 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2288 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2280);
    float _2290 = -_2282;
    float _2292 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2290);
    float _2294 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2296 = log2(_2278);
    float _2298 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2288);
    float _2300 = -_2284;
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2292);
    float _2304 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2306 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2308 = fma(_2302, -0.5, 0.5);
    float _2310 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2304);
    float _2312 = exp2(_2294);
    float _2314 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2306);
    float _2316 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2310);
    float _2318 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2314);
    float _2320 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2316);
    float _2322 = 1.0 / _2298;
    float _2324 = fma(_2302, 0.5, 0.5);
    float _2326 = _2274 + 1.0;
    float _2328 = fma(_2324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2330 = sqrt(_2308);
    float _2332 = fma(_2324, _2328, -0.212114393711090087890625);
    float _2334 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2318);
    float _2336 = -_2274;
    float _2338 = fma(_2312, _2326, _2336);
    float _2340 = _2296 * 0.693147182464599609375;
    float _2342 = fma(_2324, _2332, 1.570728778839111328125);
    float _2344 = fma(_2338, 0.5, 0.5);
    float _2346 = _2320 * _2322;
    float _2348 = _2334 * _2322;
    float _2350 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2352 = fma(_2346, 0.5, 0.5);
    float _2354 = fma(_2348, -0.5, 0.5);
    float _2356 = _2330 * 0.636619746685028076171875;
    float3 _6201 = float3(_2352, _2354, _2350);
    float _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6201, float3(0.0), isnan(_6201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6201, float3(0.0), isnan(_6201)), level(0.0)).x;
    float _2360 = -_2342;
    float _2362 = fma(_2356, _2360, 1.0);
    float3 _6217 = float3(_2352, _2354, _2350);
    float4 _2365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6217, float3(0.0), isnan(_6217)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6217, float3(0.0), isnan(_6217)), level(0.0)).xyzw;
    float _2367 = _2365.x;
    float _2369 = _2365.y;
    float _2371 = _2365.z;
    float _2373 = _2365.w;
    float2 _6234 = float2(_2362, _2344);
    float3 _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6234, float2(0.0), isnan(_6234)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6234, float2(0.0), isnan(_6234)), level(0.0)).xyz;
    float _2379 = _2377.x;
    float _2381 = _2377.y;
    float _2383 = _2377.z;
    float _2385 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2387 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2389 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2387);
    float _2391 = exp2(_2385);
    float _2393 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2389);
    float _2395 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2393);
    float _2397 = _2395 + _2298;
    out.gl_Position.x = _2320;
    out.gl_Position.y = _2334;
    out.gl_Position.z = _2395;
    out.gl_Position.w = _2298;
    float _2399 = _2397 * 0.5;
    float _2401 = -_2391;
    float _2403 = _2401 + 1.0;
    float _2405 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2399;
    out.m_71.w = _2298;
    float _2407 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2407;
    float _2409 = _2405 * _2358;
    float _2411 = -_2405;
    float _2413 = _2411 + 1.0;
    float _2415 = _2373 * _2409;
    float _2417 = _2383 * _2409;
    float _2419 = fma(_2379, _2415, _2367);
    float _2421 = fma(_2381, _2415, _2369);
    float _2423 = _2373 * _2413;
    float _2425 = fma(_2373, _2417, _2371);
    out.m_73.x = _2419;
    out.m_73.y = _2421;
    out.m_73.z = _2425;
    out.m_73.w = _2423;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2000 = false;
    bool _800 = false;
    bool _672 = false;
    bool _522 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_108);
        out.gl_Position.z = _2482;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    float _148 = as_type<float>(_146);
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2554 = as_type<float>(_146);
        out.gl_Position.z = _2554;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = 0.0;
    if (!_166)
    {
        float _170 = _156 * _156;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = _174;
    if (!_166)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_166;
    float _184 = _180;
    float _186 = 0.0;
    if (!_182)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _156 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _156);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _216;
        _186 = _202;
        _148 = _206;
    }
    float _218 = _184;
    float _220 = _186;
    float _222 = _148;
    float _224 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _226 = _220;
    float _228 = _222;
    if (!_166)
    {
        _226 = _156;
    }
    float _230 = _226;
    bool _232 = !_166;
    float _234 = _230;
    if (!_232)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _156 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _234 = _254;
    }
    float _256 = _234;
    float _258 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _262 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _266 = _224 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].x, _260);
    float _270 = _264;
    if (!_166)
    {
        float _272 = _126 * _126;
        float _274 = _272 * 0.5;
        _228 = _274;
    }
    float _276 = _228;
    float _278 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].y, _264);
    float _280 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _266);
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[10].x, _268);
    if (!_166)
    {
        float _284 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _270 = _284;
    }
    float _286 = _270;
    bool _288 = !_166;
    float _290 = _286;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = _126 * _294;
        float _304 = 1.0 / _298;
        float _306 = _300 * 0.693147182464599609375;
        float _308 = exp2(_302);
        float _310 = 1.0 / _306;
        float _312 = _308 + (-1.0);
        float _314 = -_312;
        float _316 = fma(_314, _310, _126);
        float _318 = _316 * _304;
        float _320 = _318 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _290 = _320;
    }
    float _322 = _290;
    float _324 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _328 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[10].y, _278);
    float _330 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[10].z, _280);
    float _332 = _324 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _334 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = _324 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _338 = _324 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _340 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].y, _332);
    float _342 = _322;
    if (!_166)
    {
        _342 = _126;
    }
    float _344 = _342;
    bool _346 = !_166;
    float _348 = _344;
    if (!_346)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = 1.0 / _356;
        float _360 = _126 * _352;
        float _362 = exp2(_360);
        float _364 = -_362;
        float _366 = _364 + 1.0;
        float _368 = _366 * _358;
        _348 = _368;
    }
    float _370 = _348;
    float _372 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].x, _336);
    float _374 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].y, _340);
    float _376 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].z, _338);
    float _378 = fma(_256, _152, _328);
    float _380 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].x, _372);
    float _382 = fma(_370, _152, _374);
    float _384 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].z, _376);
    float _386 = fma(_256, _150, _282);
    float _388 = fma(_370, _150, _380);
    float _390 = -_382;
    float _392 = _378 + _390;
    float _394 = fma(_256, _154, _330);
    float _396 = fma(_370, _154, _384);
    float _398 = -_388;
    float _400 = _386 + _398;
    float _402 = _392 * _392;
    float _404 = in.m_51.w;
    float _406 = -_396;
    float _408 = _394 + _406;
    float _410 = _392 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _412 = fma(_400, _400, _402);
    float _414 = _392 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _416 = _392 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _418 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _410);
    float _420 = fma(_408, _408, _412);
    float _422 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _414);
    float _424 = in.m_44.x;
    float _426 = in.m_44.y;
    float _428 = in.m_44.z;
    float _430 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _418);
    float _432 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _416);
    float _434 = sqrt(_420);
    float _436 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _422);
    float _438 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _432);
    bool _440 = _434 >= 9.9999999747524270787835121154785e-07;
    bool _442 = isnan(_434);
    bool _444 = _440 || _442;
    bool _446 = isnan(9.9999999747524270787835121154785e-07);
    bool _448 = _444 || _446;
    float _450 = fma(_386, _404, _424);
    float _452 = fma(_378, _404, _426);
    float _454 = fma(_394, _404, _428);
    float _456 = _386;
    float _458 = _436;
    float _460 = _438;
    if (_448)
    {
        _456 = _430;
    }
    float _462 = _456;
    float _464 = _462;
    if (!_448)
    {
        bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _468 = !_466;
        if (!_468)
        {
            float _470 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _472 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _474 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _476 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _470);
            float _478 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _472);
            float _480 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _474);
            float _482 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _476);
            float _484 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _478);
            float _486 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _480);
            float _488 = _482 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _490 = _482 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _492 = _482 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _494 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[5].x, _488);
            float _496 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[4].x, _490);
            float _498 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[6].x, _492);
            float _500 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
            float _502 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[4].z, _496);
            float _504 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[6].z, _498);
            float _506 = _500 * _500;
            float _508 = fma(_502, _502, _506);
            float _510 = fma(_504, _504, _508);
            float _512 = rsqrt(_510);
            float _514 = _512 * 9.9999999747524270787835121154785e-07;
            float _516 = _502 * _514;
            float _518 = _500 * _514;
            float _520 = _504 * _514;
            _464 = _518;
            _458 = _516;
            _460 = _520;
            _522 = true;
        }
        else
        {
            float _524 = _152 * _152;
            float _526 = fma(_150, _150, _524);
            float _528 = fma(_154, _154, _526);
            float _530 = sqrt(_528);
            bool _532 = _530 >= 9.9999999747524270787835121154785e-07;
            bool _534 = isnan(_530);
            bool _536 = _532 || _534;
            bool _538 = isnan(9.9999999747524270787835121154785e-07);
            bool _540 = _536 || _538;
            if (!_540)
            {
                float _542 = _426 * _426;
                float _544 = fma(_424, _424, _542);
                float _546 = fma(_428, _428, _544);
                float _548 = sqrt(_546);
                bool _550 = _548 >= 9.9999999747524270787835121154785e-07;
                bool _552 = isnan(_548);
                bool _554 = _550 || _552;
                bool _556 = isnan(9.9999999747524270787835121154785e-07);
                bool _558 = _554 || _556;
                if (!_558)
                {
                    float _560 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _562 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _560);
                    float _564 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _562);
                    float _566 = rsqrt(_564);
                    float _568 = _566 * 9.9999999747524270787835121154785e-07;
                    float _570 = _568 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _572 = _568 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _574 = _568 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _464 = _572;
                    _458 = _570;
                    _460 = _574;
                    _522 = true;
                }
                else
                {
                    float _576 = _426 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _578 = _426 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _580 = _426 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _582 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[5].x, _576);
                    float _584 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[4].x, _578);
                    float _586 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
                    float _588 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[5].z, _582);
                    float _590 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[4].z, _584);
                    float _592 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[6].z, _586);
                    float _594 = _588 * _588;
                    float _596 = fma(_590, _590, _594);
                    float _598 = fma(_592, _592, _596);
                    float _600 = rsqrt(_598);
                    float _602 = _600 * 9.9999999747524270787835121154785e-07;
                    float _604 = _590 * _602;
                    float _606 = _588 * _602;
                    float _608 = _592 * _602;
                    _464 = _606;
                    _458 = _604;
                    _460 = _608;
                    _522 = true;
                }
            }
            else
            {
                float _610 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _612 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _614 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _616 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _610);
                float _618 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _612);
                float _620 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _614);
                float _622 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _616);
                float _624 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _618);
                float _626 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _620);
                float _628 = _622 * _622;
                float _630 = fma(_624, _624, _628);
                float _632 = fma(_626, _626, _630);
                float _634 = rsqrt(_632);
                float _636 = _634 * 9.9999999747524270787835121154785e-07;
                float _638 = _624 * _636;
                float _640 = _622 * _636;
                float _642 = _626 * _636;
                _464 = _640;
                _458 = _638;
                _460 = _642;
            }
        }
    }
    _522 = false;
    float _644 = _464;
    float _646 = _458;
    float _648 = _460;
    bool _650 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _652 = !_650;
    float _670;
    if (!_652)
    {
        float _654 = in.m_53.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_92);
        float _676 = 1.0 / _674;
        float _678 = _126 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _684 = _680 + _682;
    bool _686 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _688 = isnan(_680);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _698;
    bool _702 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _704 = isnan(_680);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = -_696;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _718;
    float _722 = 1.0 / _700;
    bool _724 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _726 = _684 * _722;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _728;
    float _732 = _712 * _716;
    float _734 = fma(_720, _726, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _736 = -_712;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _740;
    float _744 = fma(_730, _726, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _746 = _734 * _732;
    float _748 = fma(_742, _726, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _750 = _744 * _732;
    float _752 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[107].x, _746);
    float _754 = _748 * _732;
    float _756 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[107].z, _750);
    float _758 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[108].x, _752);
    float _760 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[107].y, _754);
    float _762 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[108].z, _756);
    float _764 = _758 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _766 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[108].y, _760);
    float _768 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _772 = _766 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _774 = _764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = _772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _780 = !_724;
    float _798;
    if (!_780)
    {
        float _782 = in.m_53.x;
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _786 = _782 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _790 = _788 * _784;
        float _792 = floor(_790);
        float _794 = -_792;
        float _796 = _790 + _794;
        _798 = _796;
        _800 = true;
    }
    else
    {
        float _802 = float(_92);
        float _804 = 1.0 / _802;
        float _806 = _126 * _804;
        _798 = _806;
    }
    _800 = false;
    float _808 = _798;
    float _810 = in.m_53.z;
    float _812 = _452 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _814 = in.m_53.x;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _818 = _816 != 0;
    float _820 = _452 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _822 = _452 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _824 = in.m_53.y;
    float _826 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[4].x, _812);
    float _828 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[5].x, _820);
    float _830 = in.m_51.x;
    float _832 = in.m_51.y;
    float _834 = in.m_51.z;
    float _836 = fma(_450, (*spvDescriptorSet0.vp_c10)._m0[6].x, _822);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _840 = _808 + _838;
    float _842 = in.m_53.w;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _846 = _808 + _844;
    float _848 = in.m_55.x;
    float _850 = in.m_55.y;
    float _852 = in.m_55.z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _856 = _810 * 2.0;
    float _858 = 0.0;
    if (!_818)
    {
        _858 = _810;
    }
    float _860 = _858;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _864 = 0.0;
    float _866 = _860;
    if (!_818)
    {
        _864 = _810;
    }
    float _868 = _864;
    float _870 = _814 * 2.0;
    float _872 = floor(_856);
    float _874 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _876 = 0.0;
    float _878 = _868;
    if (!_818)
    {
        _876 = _824;
    }
    float _880 = _876;
    float _882 = _644 * _644;
    float _884 = _880;
    if (_818)
    {
        _884 = _814;
    }
    float _886 = _884;
    float _888 = _830 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    if (_818)
    {
        _866 = _824;
    }
    float _890 = _866;
    float _892 = floor(_870);
    if (_818)
    {
        _878 = _824;
    }
    float _894 = _878;
    float _896 = _832 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _898 = fma(_874, -2.0, _854);
    float _900 = _888 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _850);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _904;
    bool _908 = _872 > 0.0;
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _848);
    bool _912 = _872 >= 0.0;
    bool _914 = isnan(_872);
    bool _916 = _912 || _914;
    bool _918 = isnan(0.0);
    bool _920 = _916 || _918;
    float _922 = 1.0 / _906;
    float _924 = _834 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _852);
    int _928 = _920 ? 0 : 1;
    float _930 = _810 + (-0.5);
    bool _932 = _892 > 0.0;
    bool _934 = _892 >= 0.0;
    bool _936 = isnan(_892);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    int _944 = ~_928;
    int _946 = _944 + 1;
    int _948 = _946 + 1;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _952 = _808 + _950;
    int _954 = _942 ? 0 : 1;
    int _956 = _948;
    if (!_908)
    {
        int _958 = ~_928;
        int _960 = _958 + 1;
        _956 = _960;
    }
    int _962 = _956;
    int _964 = ~_954;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _972 = _970 != 0;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _980 = _978 != 0;
    int _982 = _968;
    if (!_932)
    {
        int _984 = ~_954;
        int _986 = _984 + 1;
        _982 = _986;
    }
    int _988 = _982;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1004 = _1002 != 0;
    float _1006 = in.m_57.x;
    float _1008 = in.m_57.y;
    float _1010 = in.m_57.z;
    bool _1012 = !_972;
    int _1014 = _1012 ? 0 : 1;
    bool _1016 = _842 > 0.5;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1026 = 1.0 / _1020;
    float _1028 = float(_988);
    float _1030 = 1.0 / _1024;
    float _1032 = _814 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1034 = -_862;
    float _1036 = fma(_1032, 2.0, _1034);
    float _1038 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[5].z, _828);
    float _1040 = _900 * _910;
    float _1042 = _1010 * _1010;
    float _1044 = _824 * 2.0;
    float _1046 = _1006 * _1006;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1052 = _1008 * _1008;
    float _1054 = floor(_1044);
    float _1056 = _824 + _810;
    float _1058 = _840 * _1030;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1062 = _808 + _1060;
    float _1064 = _1056 + (-1.0);
    float _1066 = _924 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1068 = _846 * _1026;
    float _1070 = 1.0 / _1050;
    float _1072 = _1062 * _922;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1080;
    float _1084 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[4].z, _826);
    float _1086 = fma(_1078, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1092 = _814 + _824;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1094;
    float _1098 = fma(_1082, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1100 = fma(_1090, _1058, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1102 = _1092 + (-1.0);
    float _1104 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[6].z, _836);
    float _1106 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1108 = _952 * _1070;
    float _1110 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1112 = _814 + _810;
    bool _1114 = !_976;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = _1066 * _926;
    bool _1120 = _1054 >= 0.0;
    bool _1122 = isnan(_1054);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _1112 + (-1.0);
    float _1132 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1134 = log2(_1132);
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1136;
    int _1140 = _1128 ? 0 : 1;
    float _1142 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1144 = _1054 > 0.0;
    float _1146 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1148 = fma(_1138, _1072, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _1150 = abs(_1116);
    float _1152 = _1146 * _902;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1156 = _1154 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1166 = fma(_1096, _1072, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1168 = fma(_1156, _1058, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1170 = fma(_1160, _1068, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1180 = fma(_646, _646, _882);
    float _1182 = _1134 * _126;
    float _1184 = fma(_1174, _1072, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1186 = fma(_1178, _1108, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1188 = fma(_648, _648, _1180);
    float _1190 = fma(_1164, _1058, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1192 = exp2(_1182);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1198 = _1196 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1202 = abs(_1014);
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    int _1208 = ~_1140;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1194);
    float _1216 = rsqrt(_1188);
    float _1218 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1200);
    int _1220 = _1212;
    bool _1222 = _1000;
    bool _1224 = _1004;
    float _1226 = _1198;
    if (!_1144)
    {
        int _1228 = ~_1140;
        int _1230 = _1228 + 1;
        _1220 = _1230;
    }
    int _1232 = _1220;
    float _1234 = _886 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1236 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1238 = isnan(0.0);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1244 = _1240 || _1242;
    float _1246 = _890 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1248 = float(_1202);
    float _1250 = -_1192;
    float _1252 = _1250 + 1.0;
    float _1254 = float(_962);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1258 = in.m_59.y;
    float _1260 = _1244 ? _1252 : 0.0;
    float _1262 = _1248 * _1254;
    bool _1264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1266 = isnan(1.0);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1272 = _1268 || _1270;
    float _1274 = _1216 * _646;
    float _1276 = _1216 * _644;
    float _1278 = _1216 * _648;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1282 = 1.0 + _1280;
    float _1284 = -_1256;
    float _1286 = fma(_1234, 2.0, _1284);
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1292 = !_980;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = 1.0 / _1282;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1300 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1290);
    int _1302 = abs(_1294);
    float _1304 = in.m_61.x;
    float _1306 = in.m_61.y;
    float _1308 = in.m_61.z;
    float _1310 = fma(_1246, -2.0, _1288);
    float _1312 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1298);
    float _1314 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1218);
    float _1316 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _898);
    float _1318 = float(_1302);
    float _1320 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1214);
    float _1322 = float(_1232);
    float _1324 = -_126;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1036);
    float _1328 = float(_1150);
    float _1330 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1300);
    float _1332 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1312);
    float _1334 = -_126;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1286);
    float _1338 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1310);
    float _1340 = _1258;
    float _1342 = _1326;
    if (_1272)
    {
        float _1344 = _1260 * _1296;
        _128 = _1344;
    }
    float _1346 = _128;
    float _1348 = _1318 * _1322;
    float _1350 = _1262 * (-2.0);
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1354 = _1278 * _1352;
    float _1356 = _1328 * _1028;
    float _1358 = _814 + (-0.5);
    float _1360 = fma(_1110, _1350, _1110);
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1364 = -_1354;
    float _1366 = fma(_1274, _1362, _1364);
    float _1368 = _1356 * (-2.0);
    float _1370 = fma(_1350, _1304, _1304);
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1374 = _1276 * _1372;
    float _1376 = _1366 * _1366;
    float _1378 = _1348 * (-2.0);
    float _1380 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1370);
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1384 = _1274 * _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1388 = -_1374;
    float _1390 = fma(_1278, _1386, _1388);
    float _1392 = fma(_1368, _1306, _1306);
    float _1394 = _824 + (-0.5);
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1398 = -_1384;
    float _1400 = fma(_1276, _1396, _1398);
    float _1402 = fma(_1390, _1390, _1376);
    float _1404 = fma(_1378, _1308, _1308);
    bool _1406 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1408 = isnan(_808);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1392);
    float _1420 = fma(_1400, _1400, _1402);
    float _1422 = -_1258;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1074, _1368, _1074);
    float _1428 = fma(_1360, _1346, _1380);
    float _1430 = rsqrt(_1420);
    float _1432 = -_1416;
    float _1434 = _1432 + 1.0;
    float _1436 = in.m_59.x;
    float _1438 = fma(_1426, _1346, _1418);
    int _1440 = _1016 ? as_type<int>(_1424) : as_type<int>(_1258);
    float _1442 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1404);
    bool _1444 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1446 = isnan(_808);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1452 = _1448 || _1450;
    float _1454 = float(_1452);
    float _1456 = _1428 * 0.15915493667125701904296875;
    float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1460 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1462 = isnan(_808);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    float _1472 = _1438 * 0.15915493667125701904296875;
    bool _1474 = _824 > 0.5;
    float _1476 = fma(_1206, _1108, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    int _1478 = _1000 ? _1440 : as_type<int>(_1258);
    float _1480 = _1470 * _1434;
    float _1482 = -_1470;
    float _1484 = _1482 + 1.0;
    float _1486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1488 = fma(_1142, _1378, _1142);
    int _1490 = _1478;
    int _1492 = as_type<int>(_1472);
    if (_1004)
    {
        float _1494 = _1474 ? _1424 : _1258;
        _1340 = _1494;
    }
    float _1496 = _1340;
    float _1498 = _1454 * _1484;
    bool _1500 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1502 = isnan(_808);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = -_1454;
    float _1514 = _1512 + 1.0;
    float _1516 = fma(_1488, _1346, _1442);
    if (_992)
    {
        bool _1518 = _814 > 0.5;
        _1222 = _1518;
    }
    bool _1520 = _1222;
    float _1522 = _1510 * _1514;
    float _1524 = -_1510;
    float _1526 = _1524 + 1.0;
    float _1528 = fma(_814, -10.0, -5.0);
    float _1530 = fma(_824, -10.0, -5.0);
    float _1532 = _1516 * 0.15915493667125701904296875;
    float _1534 = fma(-10.0, _810, -5.0);
    if (_996)
    {
        bool _1536 = _810 > 0.5;
        _1224 = _1536;
    }
    bool _1538 = _1224;
    float _1540 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1542 = _1456 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1548 = fma(_1198, _1108, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1550 = fma(_1540, _1496, -0.5);
    float _1552 = _1436;
    if (!_992)
    {
        _1226 = _1436;
    }
    float _1554 = _1226;
    float _1556 = fma(as_type<float>(_1478), _1546, -0.5);
    float _1558 = _1554;
    if (_992)
    {
        float _1560 = -_1436;
        float _1562 = _1560 + 1.0;
        _1490 = as_type<int>(_1562);
    }
    int _1564 = _1490;
    float _1566 = _1366 * _1430;
    float _1568 = _1456 * 6.283185482025146484375;
    float _1570 = cos(_1568);
    float _1572 = -_1316;
    float _1574 = fma(_1332, _1550, _1572);
    bool _1576 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1578 = isnan(_808);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = _1104 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_992)
    {
        float _1590 = _1520 ? as_type<float>(_1564) : _1436;
        _1558 = _1590;
    }
    float _1592 = _1558;
    float _1594 = _1390 * _1430;
    float _1596 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1598 = _1586 * _1526;
    float _1600 = _1472 * 6.283185482025146484375;
    float _1602 = sin(_1600);
    float _1604 = -_1338;
    float _1606 = fma(_1320, _1556, _1604);
    float _1608 = _1042 * _1042;
    float _1610 = _1098 * _1598;
    float _1612 = _1086 * _1598;
    float _1614 = _1170 * _1598;
    float _1616 = -_1586;
    float _1618 = _1616 + 1.0;
    float _1620 = _1472 * 6.283185482025146484375;
    float _1622 = cos(_1620);
    float _1624 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1610);
    float _1626 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1612);
    float _1628 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1614);
    float _1630 = fma(_1100, _1522, _1624);
    float _1632 = fma(_1168, _1522, _1626);
    float _1634 = _1532 * 6.283185482025146484375;
    float _1636 = cos(_1634);
    if (_996)
    {
        float _1638 = -_1436;
        float _1640 = _1638 + 1.0;
        _1492 = as_type<int>(_1640);
    }
    int _1642 = _1492;
    float _1644 = _1544 * _1602;
    float _1646 = _1570 * _1602;
    float _1648 = fma(_1190, _1522, _1628);
    float _1650 = fma(_1166, _1498, _1630);
    if (_996)
    {
        float _1652 = _1538 ? as_type<float>(_1642) : _1436;
        _1552 = _1652;
    }
    float _1654 = _1552;
    float _1656 = _1400 * _1430;
    float _1658 = _1532 * 6.283185482025146484375;
    float _1660 = sin(_1658);
    float _1662 = _1570 * _1622;
    float _1664 = _1544 * _1622;
    float _1666 = _1276 * _1656;
    float _1668 = fma(_1148, _1498, _1632);
    float _1670 = fma(_1184, _1498, _1648);
    float _1672 = -_1666;
    float _1674 = fma(_1278, _1566, _1672);
    float _1676 = _1544 * _1636;
    float _1678 = _1570 * _1636;
    float _1680 = _1622 * _1636;
    float _1682 = _1602 * _1636;
    float _1684 = _1274 * _1566;
    float _1686 = _1678 * _1274;
    float _1688 = fma(_1660, _1662, _1644);
    float _1690 = fma(_1660, _1644, _1662);
    float _1692 = -_1646;
    float _1694 = fma(_1660, _1664, _1692);
    float _1696 = -_1664;
    float _1698 = fma(_1660, _1646, _1696);
    float _1700 = _1688 * _1274;
    float _1702 = _1678 * _1278;
    float _1704 = -_1660;
    float _1706 = fma(_1704, _1594, _1686);
    float _1708 = _1698 * _1274;
    float _1710 = _1688 * _1278;
    float _1712 = -_1684;
    float _1714 = fma(_1276, _1594, _1712);
    float _1716 = fma(_1680, _1594, _1700);
    float _1718 = fma(_1682, _1594, _1708);
    float _1720 = -_1660;
    float _1722 = fma(_1720, _1656, _1702);
    float _1724 = _1278 * _1594;
    float _1726 = _1698 * _1278;
    float _1728 = fma(_1680, _1656, _1710);
    float _1730 = fma(_1676, _1674, _1706);
    float _1732 = fma(_1676, _1714, _1722);
    float _1734 = fma(_1694, _1674, _1716);
    float _1736 = fma(_1682, _1656, _1726);
    float _1738 = _1152 * _1730;
    float _1740 = fma(_1694, _1714, _1728);
    float _1742 = _1152 * _1732;
    float _1744 = fma(_1690, _1674, _1718);
    float _1746 = fma(_1040, _1734, _1738);
    float _1748 = fma(_1690, _1714, _1736);
    float _1750 = fma(_1040, _1740, _1742);
    float _1752 = _1678 * _1276;
    float _1754 = fma(_1118, _1744, _1746);
    float _1756 = -_1724;
    float _1758 = fma(_1274, _1656, _1756);
    float _1760 = fma(_1118, _1748, _1750);
    float _1762 = -_1660;
    float _1764 = fma(_1762, _1566, _1752);
    float _1766 = _1106 + _1754;
    float _1768 = _1688 * _1276;
    float _1770 = _1588 + _1760;
    float _1772 = _1698 * _1276;
    float _1774 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1776 = _1766 + _1774;
    float _1778 = fma(_1680, _1566, _1768);
    float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1782 = _1770 + _1780;
    float _1784 = fma(_1676, _1758, _1764);
    float _1786 = _1776 * _1776;
    float _1788 = fma(_1682, _1566, _1772);
    float _1790 = _1782 * _1782;
    float _1792 = fma(_1694, _1758, _1778);
    float _1794 = _1152 * _1784;
    float _1796 = fma(_1690, _1758, _1788);
    float _1798 = _1786 + _1790;
    float _1800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1802 = fma(_1040, _1792, _1794);
    float _1804 = fma(_1118, _1796, _1802);
    float _1806 = sqrt(_1798);
    float _1808 = _1596 + _1804;
    float _1810 = in.m_57.w;
    float _1812 = fma(_1528, _1608, _1808);
    float _1814 = _1046 * _1046;
    float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1818 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1820 = fma(_1814, _1530, _1812);
    float _1822 = _1052 * _1052;
    float _1824 = fma(_1818, _1592, -0.5);
    float _1826 = fma(_1822, _1534, _1820);
    bool _1828 = _1806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1830 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1832 = fma(_1830, _1654, -0.5);
    float _1834 = fma(_1330, _1824, _1326);
    float _1836 = _1786;
    float _1838 = _1790;
    float _1840 = _1766;
    float _1842 = _1770;
    if (!_1828)
    {
        _1342 = _1826;
    }
    float _1844 = _1342;
    float _1846 = fma(_1314, _1832, _1336);
    bool _1848 = !_1828;
    float _1850 = _1844;
    if (!_1848)
    {
        float _1852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1856 = _1806 + _1854;
        float _1858 = rsqrt(_1798);
        float _1860 = _1856 * _1852;
        float _1862 = _1826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1864 = _1860 * 0.15915493667125701904296875;
        float _1866 = _1864 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        float _1870 = _1864 * 6.283185482025146484375;
        float _1872 = cos(_1870);
        float _1874 = fma(_1868, _1862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1876 = _1858 * _1874;
        float _1878 = _1872 + (-1.0);
        float _1880 = fma(_1776, _1876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1882 = fma(_1782, _1876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1884 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1888 = _1880 + _1886;
        float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1892 = _1882 + _1890;
        float _1894 = fma(_1826, _1872, _1884);
        float _1896 = _1888 * _1888;
        float _1898 = _1892 * _1892;
        _1850 = _1894;
        _1836 = _1896;
        _1838 = _1898;
        _1840 = _1880;
        _1842 = _1882;
    }
    float _1900 = _1850;
    float _1902 = _1836;
    float _1904 = _1838;
    float _1906 = _1840;
    float _1908 = _1842;
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1912 = _1900 + _1910;
    float _1914 = fma(_1186, _1480, _1650);
    float _1916 = fma(_1476, _1480, _1668);
    float _1918 = fma(_1548, _1480, _1670);
    float _1920 = fma(_1912, _1912, _1902);
    float _1922 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1914);
    float _1924 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1916);
    float _1926 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1918);
    float _1928 = _1920 + _1904;
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1932 = _1924 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1936 = _1574 + 0.5;
    float _1938 = _1606 + 0.5;
    float _1940 = sqrt(_1928);
    float _1942 = _1834 + 0.5;
    float _1944 = _1846 + 0.5;
    float _1946 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _774;
    out.m_63.y = _778;
    out.m_63.z = _776;
    out.m_63.w = _770;
    out.m_65.w = _1810;
    out.m_67.x = _1942;
    out.m_67.y = _1936;
    out.m_67.z = _1944;
    out.m_67.w = _1938;
    bool _1952 = _1940 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1954 = isnan(_1940);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1960 = _1956 || _1958;
    out.m_69.x = _1946;
    out.m_69.y = _1948;
    out.m_69.z = _1950;
    float _1962 = _1930;
    float _1964 = _1936;
    if (!_1960)
    {
        _1962 = 1.0;
    }
    float _1966 = _1962;
    bool _1968 = !_1960;
    float _1970 = _1966;
    if (!_1968)
    {
        bool _1972 = _1940 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1974 = isnan(_1940);
        bool _1976 = _1972 || _1974;
        bool _1978 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1980 = _1976 || _1978;
        if (!_1980)
        {
            float _1982 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1984 = _1940 + _1982;
            float _1986 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1988 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1986;
            float _1990 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1992 = _1990 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1994 = 1.0 / _1988;
            float _1996 = _1984 * _1994;
            float _1998 = fma(_1996, _1992, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1970 = _1998;
            _2000 = true;
        }
        else
        {
            bool _2002 = _1940 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2004 = isnan(_1940);
            bool _2006 = _2002 || _2004;
            bool _2008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2010 = _2006 || _2008;
            if (!_2010)
            {
                float _2012 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2014 = _1940 + _2012;
                float _2016 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2018 = _2016 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2022 = _2020 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2024 = 1.0 / _2018;
                float _2026 = _2014 * _2024;
                float _2028 = fma(_2026, _2022, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1970 = _2028;
                _2000 = true;
            }
            else
            {
                _1970 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2000 = false;
    float _2030 = _1970;
    float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2034 = _1900 + _2032;
    float _2036 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2038 = _1906 + _2036;
    float _2040 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2042 = _1908 + _2040;
    float _2044 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2046 = fma(_2038, _2030, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2048 = fma(_2042, _2030, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2052 = _2044 + _2050;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2056 = _2046 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2060 = _2048 + _2058;
    float _2062 = _2052 * _2052;
    float _2064 = fma(_2056, _2056, _2062);
    float _2066 = fma(_2060, _2060, _2064);
    float _2068 = rsqrt(_2066);
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2072 = _2056 * _2070;
    float _2074 = _2060 * _2070;
    float _2076 = _2072 * _2072;
    float _2078 = _2074 * _2074;
    float _2080 = _2076 + _2078;
    float _2082 = sqrt(_2080);
    bool _2084 = _2082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2088 = _2082 + _2086;
    float _2090 = _2068;
    float _2092 = _2080;
    float _2094 = _2088;
    float _2096 = _2052;
    float _2098 = _2070;
    float _2100 = _2072;
    if (_2084)
    {
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2090 = _2102;
    }
    float _2104 = _2090;
    if (_2084)
    {
        float _2106 = rsqrt(_2080);
        _2092 = _2106;
    }
    float _2108 = _2092;
    if (_2084)
    {
        float _2110 = _2088 * _2104;
        _2094 = _2110;
    }
    float _2112 = _2094;
    if (_2084)
    {
        float _2114 = _2112 * 0.15915493667125701904296875;
        _1964 = _2114;
    }
    float _2116 = _1964;
    float _2118 = _2104;
    float _2120 = _2116;
    if (_2084)
    {
        float _2122 = _2116 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    float _2128 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2130 = precise::max(0.0, _2128);
    float _2132 = _2060;
    float _2134 = _2130;
    if (_2084)
    {
        float _2136 = _2116 * 6.283185482025146484375;
        float _2138 = cos(_2136);
        _2132 = _2138;
    }
    float _2140 = _2132;
    float _2142 = -_2070;
    float _2144 = -_2130;
    float _2146 = fma(_2052, _2142, _2144);
    if (!_2084)
    {
        _2096 = _2074;
    }
    float _2148 = _2096;
    float _2150 = _2148;
    if (_2084)
    {
        float _2152 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2134 = _2152;
    }
    float _2154 = _2134;
    float _2156 = _2126;
    float _2158 = _2154;
    if (_2084)
    {
        float _2160 = fma(_2126, _2154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = _2162;
    float _2166 = _2140;
    if (_2084)
    {
        float _2168 = _2140 + (-1.0);
        _2158 = _2168;
    }
    float _2170 = _2158;
    float _2172 = _2170;
    if (_2084)
    {
        float _2174 = _2108 * _2162;
        _2098 = _2174;
    }
    float _2176 = _2098;
    if (!_2084)
    {
        _2164 = _2146;
    }
    float _2178 = _2164;
    float _2180 = sqrt(_2066);
    float _2182 = _2178;
    if (_2084)
    {
        float _2184 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2120 = _2184;
    }
    float _2186 = _2120;
    if (_2084)
    {
        float _2188 = _2072 * _2176;
        _2100 = _2188;
    }
    float _2190 = _2100;
    if (!_2084)
    {
        _2172 = _2076;
    }
    float _2192 = _2172;
    float _2194 = _2192;
    if (_2084)
    {
        float _2196 = _2074 * _2176;
        _2150 = _2196;
    }
    float _2198 = _2150;
    if (_2084)
    {
        float _2200 = fma(_2146, _2140, _2186);
        _2182 = _2200;
    }
    float _2202 = _2182;
    if (_2084)
    {
        float _2204 = _2190 * _2190;
        _2194 = _2204;
    }
    float _2206 = _2194;
    if (!_2084)
    {
        _2166 = _2078;
    }
    float _2208 = _2166;
    float _2210 = _2208;
    if (_2084)
    {
        float _2212 = _2198 * _2198;
        _2210 = _2212;
    }
    float _2214 = _2210;
    float _2216 = fma(_2202, _2202, _2206);
    float _2218 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2220 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2222 = _2216 + _2214;
    float _2224 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2218);
    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2228 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2226);
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2234 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2236 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2224);
    float _2238 = rsqrt(_2222);
    float _2240 = -_2230;
    float _2242 = _2240 + 1.0;
    float _2244 = _2044 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2246 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2232);
    float _2248 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2250 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2244);
    float _2252 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2246);
    float _2254 = abs(_2242);
    float _2256 = log2(_2254);
    float _2258 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2220);
    float _2260 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2250);
    float _2262 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2264 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2266 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2258);
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2270 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2272 = _2238 * _2190;
    float _2274 = _2238 * _2202;
    float _2276 = -_2264;
    float _2278 = fma(_2276, _2234, 1.0);
    float _2280 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2270);
    float _2282 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2284 = _2238 * _2198;
    float _2286 = _2266 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2288 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2280);
    float _2290 = -_2282;
    float _2292 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2290);
    float _2294 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2296 = log2(_2278);
    float _2298 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2288);
    float _2300 = -_2284;
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2292);
    float _2304 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2306 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2308 = fma(_2302, -0.5, 0.5);
    float _2310 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2304);
    float _2312 = exp2(_2294);
    float _2314 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2306);
    float _2316 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2310);
    float _2318 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2314);
    float _2320 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2316);
    float _2322 = 1.0 / _2298;
    float _2324 = fma(_2302, 0.5, 0.5);
    float _2326 = _2274 + 1.0;
    float _2328 = fma(_2324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2330 = sqrt(_2308);
    float _2332 = fma(_2324, _2328, -0.212114393711090087890625);
    float _2334 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2318);
    float _2336 = -_2274;
    float _2338 = fma(_2312, _2326, _2336);
    float _2340 = _2296 * 0.693147182464599609375;
    float _2342 = fma(_2324, _2332, 1.570728778839111328125);
    float _2344 = fma(_2338, 0.5, 0.5);
    float _2346 = _2320 * _2322;
    float _2348 = _2334 * _2322;
    float _2350 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2352 = fma(_2346, 0.5, 0.5);
    float _2354 = fma(_2348, -0.5, 0.5);
    float _2356 = _2330 * 0.636619746685028076171875;
    float3 _6201 = float3(_2352, _2354, _2350);
    float _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6201, float3(0.0), isnan(_6201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6201, float3(0.0), isnan(_6201)), level(0.0)).x;
    float _2360 = -_2342;
    float _2362 = fma(_2356, _2360, 1.0);
    float3 _6217 = float3(_2352, _2354, _2350);
    float4 _2365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6217, float3(0.0), isnan(_6217)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6217, float3(0.0), isnan(_6217)), level(0.0)).xyzw;
    float _2367 = _2365.x;
    float _2369 = _2365.y;
    float _2371 = _2365.z;
    float _2373 = _2365.w;
    float2 _6234 = float2(_2362, _2344);
    float3 _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6234, float2(0.0), isnan(_6234)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6234, float2(0.0), isnan(_6234)), level(0.0)).xyz;
    float _2379 = _2377.x;
    float _2381 = _2377.y;
    float _2383 = _2377.z;
    float _2385 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2387 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2389 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2387);
    float _2391 = exp2(_2385);
    float _2393 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2389);
    float _2395 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2393);
    float _2397 = _2395 + _2298;
    out.gl_Position.x = _2320;
    out.gl_Position.y = _2334;
    out.gl_Position.z = _2395;
    out.gl_Position.w = _2298;
    float _2399 = _2397 * 0.5;
    float _2401 = -_2391;
    float _2403 = _2401 + 1.0;
    float _2405 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2399;
    out.m_71.w = _2298;
    float _2407 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2407;
    float _2409 = _2405 * _2358;
    float _2411 = -_2405;
    float _2413 = _2411 + 1.0;
    float _2415 = _2373 * _2409;
    float _2417 = _2383 * _2409;
    float _2419 = fma(_2379, _2415, _2367);
    float _2421 = fma(_2381, _2415, _2369);
    float _2423 = _2373 * _2413;
    float _2425 = fma(_2373, _2417, _2371);
    out.m_73.x = _2419;
    out.m_73.y = _2421;
    out.m_73.z = _2425;
    out.m_73.w = _2423;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

