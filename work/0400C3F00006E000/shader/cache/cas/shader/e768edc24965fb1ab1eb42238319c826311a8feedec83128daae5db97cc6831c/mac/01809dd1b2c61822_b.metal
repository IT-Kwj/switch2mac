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
    float4 m_63 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _880 = false;
    bool _752 = false;
    bool _626 = false;
    bool _470 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_102);
        out.gl_Position.z = _2412;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = 0.0;
    float _124 = 0.0;
    if (_116)
    {
        float _126 = float(_86);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _120 >= _128;
    bool _132 = !_116;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _104 = as_type<int>(_140);
    }
    int _142 = _104;
    float _144 = as_type<float>(_142);
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2483 = as_type<float>(_142);
        out.gl_Position.z = _2483;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    float _152 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = _152;
    if (!_162)
    {
        float _166 = _152 * _152;
        float _168 = _166 * 0.5;
        _144 = _168;
    }
    float _170 = _144;
    float _172 = 0.0;
    float _174 = _170;
    if (!_162)
    {
        float _176 = _120 * _120;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    if (!_162)
    {
        float _182 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _182;
    }
    float _184 = _174;
    bool _186 = !_162;
    float _188 = _184;
    float _190 = _150;
    float _192 = _150;
    if (!_186)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _152 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _152);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _122 = _212;
        _188 = _222;
        _124 = _210;
    }
    float _224 = _122;
    float _226 = _188;
    float _228 = _124;
    bool _230 = !_162;
    float _232 = _224;
    float _234 = _228;
    if (!_230)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _152 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _232 = _248;
        _234 = _242;
        _164 = _254;
    }
    float _256 = _232;
    float _258 = _234;
    float _260 = _164;
    float _262 = _258;
    float _264 = _256;
    if (!_162)
    {
        _262 = _120;
    }
    float _266 = _262;
    float _268 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _266;
    if (!_162)
    {
        float _274 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _274;
    }
    float _276 = _264;
    bool _278 = !_162;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _120 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _120);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_162;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _120 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _340 = fma(_260, _148, _270);
    float _342 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _346 = fma(_336, _148, _338);
    float _348 = fma(_260, _146, _268);
    float _350 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_336, _146, _342);
    float _354 = -_346;
    float _356 = _340 + _354;
    float _358 = fma(_260, _150, _344);
    float _360 = fma(_336, _150, _350);
    float _362 = -_352;
    float _364 = _348 + _362;
    float _366 = _356 * _356;
    float _368 = in.m_49.w;
    float _370 = -_360;
    float _372 = _358 + _370;
    float _374 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _376 = fma(_364, _364, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _374);
    float _384 = fma(_372, _372, _376);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _388 = in.m_42.x;
    float _390 = in.m_42.y;
    float _392 = in.m_42.z;
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _402 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_348, _368, _388);
    float _416 = fma(_340, _368, _390);
    float _418 = fma(_358, _368, _392);
    float _420 = _358;
    float _422 = _400;
    float _424 = _402;
    float _426 = _352;
    if (_412)
    {
        _420 = _396;
    }
    float _428 = _420;
    float _430 = _428;
    if (!_412)
    {
        bool _432 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _434 = !_432;
        if (!_434)
        {
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _446);
            float _454 = _448 * _448;
            float _456 = fma(_450, _450, _454);
            float _458 = fma(_452, _452, _456);
            float _460 = rsqrt(_458);
            float _462 = _460 * 9.9999999747524270787835121154785e-07;
            float _464 = _450 * _462;
            float _466 = _448 * _462;
            float _468 = _452 * _462;
            _430 = _466;
            _422 = _464;
            _424 = _468;
            _470 = true;
        }
        else
        {
            float _472 = _148 * _148;
            float _474 = fma(_146, _146, _472);
            float _476 = fma(_150, _150, _474);
            float _478 = sqrt(_476);
            bool _480 = _478 >= 9.9999999747524270787835121154785e-07;
            bool _482 = isnan(_478);
            bool _484 = _480 || _482;
            bool _486 = isnan(9.9999999747524270787835121154785e-07);
            bool _488 = _484 || _486;
            if (!_488)
            {
                float _490 = _390 * _390;
                float _492 = fma(_388, _388, _490);
                float _494 = fma(_392, _392, _492);
                float _496 = sqrt(_494);
                bool _498 = _496 >= 9.9999999747524270787835121154785e-07;
                bool _500 = isnan(_496);
                bool _502 = _498 || _500;
                bool _504 = isnan(9.9999999747524270787835121154785e-07);
                bool _506 = _502 || _504;
                if (!_506)
                {
                    float _508 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _510 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _508);
                    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _510);
                    float _514 = rsqrt(_512);
                    float _516 = _514 * 9.9999999747524270787835121154785e-07;
                    float _518 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _520 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _430 = _520;
                    _422 = _518;
                    _424 = _522;
                    _470 = true;
                }
                else
                {
                    float _524 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
                    float _532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
                    float _534 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
                    float _538 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _532);
                    float _540 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _534);
                    float _542 = _536 * _536;
                    float _544 = fma(_538, _538, _542);
                    float _546 = fma(_540, _540, _544);
                    float _548 = rsqrt(_546);
                    float _550 = _548 * 9.9999999747524270787835121154785e-07;
                    float _552 = _538 * _550;
                    float _554 = _536 * _550;
                    float _556 = _540 * _550;
                    _430 = _554;
                    _422 = _552;
                    _424 = _556;
                    _470 = true;
                }
            }
            else
            {
                float _558 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _560 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _562 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _564 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _558);
                float _566 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
                float _568 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
                float _570 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _564);
                float _572 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _566);
                float _574 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _568);
                float _576 = _570 * _570;
                float _578 = fma(_572, _572, _576);
                float _580 = fma(_574, _574, _578);
                float _582 = rsqrt(_580);
                float _584 = _582 * 9.9999999747524270787835121154785e-07;
                float _586 = _572 * _584;
                float _588 = _570 * _584;
                float _590 = _574 * _584;
                _430 = _588;
                _422 = _586;
                _424 = _590;
            }
        }
    }
    _470 = false;
    float _592 = _430;
    float _594 = _422;
    float _596 = _424;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _600 = !_598;
    float _602 = _592;
    float _604 = _594;
    float _606 = _596;
    float _624;
    if (!_600)
    {
        float _608 = in.m_51.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_86);
        float _630 = 1.0 / _628;
        float _632 = _120 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _638 = _634 + _636;
    bool _640 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _642 = isnan(_634);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _652;
    float _656 = 1.0 / _654;
    bool _658 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_634);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_650;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _678;
    bool _682 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _684;
    float _688 = _668 * _672;
    float _690 = -_668;
    float _692 = _690 + 1.0;
    float _694 = _638 * _656;
    float _696 = in.m_49.x;
    float _698 = in.m_49.y;
    float _700 = in.m_49.z;
    float _702 = fma(_676, _694, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _704 = fma(_686, _694, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _706 = fma(_680, _694, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _708 = _702 * _688;
    float _710 = _704 * _688;
    float _712 = _706 * _688;
    float _714 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[143].x, _708);
    float _716 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[143].y, _710);
    float _718 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[143].z, _712);
    float _720 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[144].x, _714);
    float _722 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[144].y, _716);
    float _724 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[144].z, _718);
    float _726 = _720 * _696;
    float _728 = _722 * _698;
    float _730 = _724 * _700;
    bool _732 = !_682;
    float _750;
    if (!_732)
    {
        float _734 = in.m_51.x;
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _738 = _734 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _750 = _748;
        _752 = true;
    }
    else
    {
        float _754 = float(_86);
        float _756 = 1.0 / _754;
        float _758 = _120 * _756;
        _750 = _758;
    }
    _752 = false;
    float _760 = _750;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _764 = _760 + _762;
    bool _766 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _768 = isnan(_760);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _778;
    bool _782 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _784 = isnan(_760);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -_776;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _798;
    float _802 = 1.0 / _780;
    bool _804 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _806 = _792 * _796;
    float _808 = -_792;
    float _810 = _808 + 1.0;
    float _812 = _764 * _802;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _814;
    float _818 = fma(_800, _812, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _820;
    float _824 = fma(_816, _812, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _826 = _818 * _806;
    float _828 = fma(_822, _812, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _830 = _824 * _806;
    float _832 = _828 * _806;
    float _834 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[107].x, _826);
    float _836 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[107].y, _832);
    float _838 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[107].z, _830);
    float _840 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[108].x, _834);
    float _842 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[108].y, _836);
    float _844 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[108].z, _838);
    float _846 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _848 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _850 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _854 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _854;
    out.m_53.y = _856;
    out.m_53.z = _858;
    out.m_53.w = _852;
    bool _860 = !_804;
    float _878;
    if (!_860)
    {
        float _862 = in.m_51.x;
        float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _866 = _862 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _870 = _868 * _864;
        float _872 = floor(_870);
        float _874 = -_872;
        float _876 = _870 + _874;
        _878 = _876;
        _880 = true;
    }
    else
    {
        float _882 = float(_86);
        float _884 = 1.0 / _882;
        float _886 = _120 * _884;
        _878 = _886;
    }
    _880 = false;
    float _888 = _878;
    float _890 = _592 * _592;
    float _892 = in.m_55.x;
    float _894 = in.m_55.y;
    float _896 = in.m_55.z;
    float _898 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _900 = fma(_594, _594, _890);
    float _902 = in.m_51.w;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _906 = _904 != 0;
    float _908 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _910 = fma(_596, _596, _900);
    float _912 = in.m_57.y;
    float _914 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _916 = rsqrt(_910);
    float _918 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _898);
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _922 = _920 != 0;
    float _924 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _908);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _928 = _926 != 0;
    float _930 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _914);
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _934 = _932 != 0;
    float _936 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _940 = _938 != 0;
    float _942 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _944 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _924);
    float _946 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _894);
    float _948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _892);
    float _950 = _916 * _592;
    float _952 = _916 * _594;
    bool _954 = _902 > 0.5;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _956;
    float _960 = _950 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _962 = _916 * _596;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _968 = 1.0 / _958;
    float _970 = fma(_952, (*spvDescriptorSet0.vp_c10)._m0[8].y, _960);
    float _972 = -_912;
    float _974 = _972 + 1.0;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _896);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _978;
    float _982 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _984 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _986 = _936 * _948;
    float _988 = 1.0 / _966;
    float _990 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[10].y, _970);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _996 = _954 ? as_type<int>(_974) : as_type<int>(_912);
    float _998 = _930;
    bool _1000 = _934;
    float _1002 = _912;
    float _1004 = _910;
    if (_922)
    {
        float _1006 = in.m_51.x;
        _998 = _1006;
    }
    float _1008 = _998;
    float _1010 = _942 * _976;
    float _1012 = abs(_990);
    bool _1014 = _1012 > 0.99989998340606689453125;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1018 = _888 + _1016;
    float _1020 = 1.0 / _980;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1024 = _888 + _1022;
    float _1026 = _1018 * _968;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1030 = _888 + _1028;
    float _1032 = _1018;
    float _1034 = _1024;
    bool _1036 = _1014;
    if (_928)
    {
        float _1038 = in.m_51.z;
        _1032 = _1038;
    }
    float _1040 = _1032;
    float _1042 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1044 = 1.0 / _994;
    float _1046 = _1024 * _988;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1050 = _888 + _1048;
    if (_1014)
    {
        _1034 = 0.001000000047497451305389404296875;
    }
    float _1052 = _1034;
    float _1054 = _1042 * _946;
    float _1056 = 0.0;
    if (!_1014)
    {
        _1056 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1058 = _1056;
    float _1060 = 0.0;
    float _1062 = _1058;
    if (!_906)
    {
        float _1064 = in.m_51.z;
        _1060 = _1064;
    }
    float _1066 = _1060;
    float _1068 = 0.0;
    float _1070 = _1066;
    if (!_1014)
    {
        _1068 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1072 = _1068;
    float _1074 = _1030 * _1020;
    float _1076 = _1072;
    if (_1014)
    {
        float _1078 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1062 = _1078;
    }
    float _1080 = _1062;
    float _1082 = in.m_57.x;
    float _1084 = -_1080;
    float _1086 = _962 * _1084;
    float _1088 = _1082;
    if (_1014)
    {
        float _1090 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1076 = _1090;
    }
    float _1092 = _1076;
    float _1094 = _1050 * _1044;
    float _1096 = _1044;
    if (!_1014)
    {
        _1096 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1098 = _1096;
    float _1100 = _1098;
    if (_1014)
    {
        float _1102 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = _1052;
    if (!_906)
    {
        float _1108 = in.m_51.y;
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1116;
    float _1120 = _934 ? as_type<float>(_996) : _912;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1122;
    if (_922)
    {
        bool _1126 = _1008 > 0.5;
        _1000 = _1126;
    }
    bool _1128 = _1000;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1130;
    if (_928)
    {
        bool _1134 = _1040 > 0.5;
        _1036 = _1134;
    }
    bool _1136 = _1036;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1150;
    float _1154 = fma(_1114, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1156 = -_1104;
    float _1158 = -_1086;
    float _1160 = fma(_952, _1156, _1158);
    float _1162 = -_1104;
    float _1164 = _950 * _1162;
    bool _1166 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1168 = isnan(_888);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = fma(_1140, _1046, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1180 = fma(_1144, _1046, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1182 = fma(_1148, _1046, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1184 = fma(_1118, _1026, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1186 = fma(_1132, _1026, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1188 = fma(_1124, _1026, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1190 = fma(_1152, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1192 = -_1092;
    float _1194 = _952 * _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1196;
    float _1200 = -_1092;
    float _1202 = -_1164;
    float _1204 = fma(_962, _1200, _1202);
    bool _1206 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1208 = isnan(_888);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -_1176;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1198, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1224 = _1160 * _1160;
    float _1226 = -_1080;
    float _1228 = -_1194;
    float _1230 = fma(_950, _1226, _1228);
    float _1232 = _1216 * _1220;
    float _1234 = -_1216;
    float _1236 = _1234 + 1.0;
    float _1238 = _1216;
    if (!_906)
    {
        _1238 = _1110;
    }
    float _1240 = _1238;
    float _1242 = fma(_1204, _1204, _1224);
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1246 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1248 = isnan(_888);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1262 = fma(_1230, _1230, _1242);
    float _1264 = _1240;
    float _1266 = _1110;
    int _1268 = as_type<int>(_1260);
    if (_906)
    {
        float _1270 = in.m_51.x;
        float _1272 = in.m_51.y;
        _1264 = _1270;
        _1266 = _1272;
    }
    float _1274 = _1264;
    float _1276 = _1266;
    bool _1278 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1280 = isnan(_888);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = _1256 * _1236;
    float _1292 = -_1256;
    float _1294 = _1292 + 1.0;
    bool _1296 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1298 = isnan(_888);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = rsqrt(_1262);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1314 = _1288 * _1294;
    float _1316 = -_1288;
    float _1318 = _1316 + 1.0;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1324 = fma(_1260, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1326 = _1322;
    float _1328 = _1324;
    if (_922)
    {
        float _1330 = -_1082;
        float _1332 = _1330 + 1.0;
        _1268 = as_type<int>(_1332);
    }
    int _1334 = _1268;
    float _1336 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1338 = _1244;
    if (!_906)
    {
        _1338 = _1066;
    }
    float _1340 = _1338;
    float _1342 = fma(_1322, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1344 = _1306 * _1318;
    float _1346 = _1340;
    float _1348 = _1342;
    if (!_922)
    {
        _1326 = _1082;
    }
    float _1350 = _1326;
    float _1352 = fma(_1312, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1354 = _1350;
    if (_922)
    {
        float _1356 = _1128 ? as_type<float>(_1334) : _1082;
        _1354 = _1356;
    }
    float _1358 = _1354;
    float _1360 = _1184 * _1344;
    float _1362 = _1186 * _1344;
    float _1364 = _1204 * _1308;
    float _1366 = _1230 * _1308;
    float _1368 = _1188 * _1344;
    if (_906)
    {
        _1346 = _1276;
    }
    float _1370 = _1346;
    float _1372 = _1054 * _952;
    if (_906)
    {
        _1070 = _1276;
    }
    float _1374 = _1070;
    float _1376 = fma(_1336, _1120, -0.5);
    bool _1378 = _1276 > 0.5;
    float _1380 = _1160 * _1308;
    float _1382 = _1054 * _962;
    float _1384 = _1054 * _950;
    float _1386 = _952 * _1380;
    float _1388 = _950 * _1366;
    float _1390 = fma(_986, _1366, _1382);
    float _1392 = fma(_986, _1364, _1372);
    float _1394 = -_1386;
    float _1396 = fma(_950, _1364, _1394);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1400 = -_1388;
    float _1402 = fma(_962, _1380, _1400);
    float _1404 = _984 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1406 = fma(_1010, _1396, _1390);
    float _1408 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1398);
    float _1410 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1412 = fma(_1010, _1402, _1392);
    float _1414 = _944 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1416 = _1404 + _1406;
    float _1418 = -_1306;
    float _1420 = _1418 + 1.0;
    int _1422 = 0;
    if (_928)
    {
        float _1424 = -_1082;
        float _1426 = _1424 + 1.0;
        _1422 = as_type<int>(_1426);
    }
    int _1428 = _1422;
    float _1430 = _1414 + _1412;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1434 = _1416 + _1432;
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1360);
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _1430 + _1440;
    float _1444 = _1434 * _1434;
    float _1446 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1368);
    float _1448 = _1430;
    if (_928)
    {
        float _1450 = _1136 ? as_type<float>(_1428) : _1082;
        _1088 = _1450;
    }
    float _1452 = _1088;
    float _1454 = _962 * _1364;
    float _1456 = fma(_1442, _1442, _1444);
    if (_940)
    {
        float _1458 = _1378 ? _974 : _912;
        _1002 = _1458;
    }
    float _1460 = _1002;
    float _1462 = fma(_1178, _1314, _1436);
    float _1464 = sqrt(_1456);
    float _1466 = fma(_1182, _1314, _1446);
    float _1468 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1472 = fma(_986, _1380, _1384);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1476 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1362);
    float _1478 = -_1470;
    float _1480 = fma(_1410, 2.0, _1478);
    float _1482 = -_1454;
    float _1484 = fma(_952, _1366, _1482);
    float _1486 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1474);
    float _1488 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1490 = fma(_1180, _1314, _1476);
    float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1494 = fma(_1010, _1484, _1472);
    bool _1496 = _1464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1500 = fma(_1488, _1452, -0.5);
    float _1502 = fma(_1190, _1290, _1462);
    float _1504 = fma(_1154, _1290, _1490);
    float _1506 = fma(_1468, -2.0, _1498);
    float _1508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1510 = _982 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1512 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1408);
    float _1514 = -_120;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1480);
    float _1518 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1486);
    float _1520 = _1510 + _1494;
    float _1522 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1506);
    float _1524 = fma(_1324, _1232, _1502);
    float _1526 = fma(_1342, _1232, _1504);
    float _1528 = fma(_1222, _1290, _1466);
    float _1530 = fma(_1512, _1500, _1516);
    float _1532 = -_1522;
    float _1534 = fma(_1518, _1376, _1532);
    if (!_1496)
    {
        _1348 = _1416;
    }
    float _1536 = _1348;
    float _1538 = _1536;
    if (!_1496)
    {
        _1328 = _1520;
    }
    float _1540 = _1328;
    bool _1542 = !_1496;
    float _1544 = _1540;
    if (!_1542)
    {
        float _1546 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1548 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1550 = _1464 + _1548;
        float _1552 = rsqrt(_1456);
        float _1554 = _1550 * _1546;
        float _1556 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1558 = _1554 * 0.15915493667125701904296875;
        float _1560 = _1558 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        float _1564 = _1558 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = _1562 + (-1.0);
        float _1570 = fma(_1566, _1556, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1572 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1574 = _1552 * _1570;
        float _1576 = fma(_1520, _1562, _1572);
        float _1578 = fma(_1442, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1580 = fma(_1434, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1544 = _1576;
        _1448 = _1578;
        _1538 = _1580;
    }
    float _1582 = _1544;
    float _1584 = _1448;
    float _1586 = _1538;
    float _1588 = -_1510;
    float _1590 = _1588 + _1582;
    float _1592 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1594 = -_1414;
    float _1596 = _1594 + _1584;
    float _1598 = fma(_1352, _1232, _1528);
    float _1600 = _1590 * _1590;
    float _1602 = -_1404;
    float _1604 = _1602 + _1586;
    float _1606 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1524);
    float _1608 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1526);
    float _1610 = fma(_1596, _1596, _1600);
    float _1612 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1598);
    float _1614 = _1592 * _1492;
    float _1616 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1618 = fma(_1604, _1604, _1610);
    float _1620 = _1606 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1622 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1624 = _1612 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1626 = sqrt(_1618);
    float _1628 = _1616 * _1508;
    float _1630 = _1530 + 0.5;
    float _1632 = _1534 + 0.5;
    float _1634 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1636 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1614;
    out.m_59.y = _1628;
    out.m_59.z = _1630;
    out.m_59.w = _1632;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1640 = _1626 > 0.0;
    out.m_63.x = _1634;
    out.m_63.y = _1636;
    out.m_63.z = _1638;
    bool _1642 = !_1640;
    float _1644 = 1.0;
    float _1646 = 1.0;
    float _1648 = _1614;
    float _1650 = _1614;
    float _1652 = _1584;
    float _1654 = _1582;
    float _1656 = _1586;
    float _1658 = 1.0;
    float _1660 = 1.0;
    float _1662 = _1614;
    float _1664 = _1630;
    if (!_1642)
    {
        bool _1666 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1668 = 1.0;
        if (_1666)
        {
            float _1670 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1668 = _1670;
        }
        float _1672 = _1668;
        if (_1666)
        {
            _1644 = _910;
        }
        float _1674 = _1644;
        float _1676 = _1672;
        float _1678 = _1674;
        if (_1666)
        {
            float _1680 = _1672 * _594;
            _1646 = _1680;
        }
        float _1682 = _1646;
        float _1684 = _1682;
        float _1686 = _1682;
        if (_1666)
        {
            float _1688 = _1672 * _592;
            _1004 = _1688;
        }
        float _1690 = _1004;
        float _1692 = _1690;
        if (_1666)
        {
            float _1694 = _1672 * _596;
            _1676 = _1694;
        }
        float _1696 = _1676;
        float _1698 = _1696;
        if (!_1666)
        {
            float _1700 = _120 + 1.0;
            float _1702 = _1700;
            if (!_162)
            {
                float _1704 = _1700 * _1700;
                float _1706 = _1704 * 0.5;
                _1684 = _1706;
            }
            float _1708 = _1684;
            float _1710 = _1708;
            if (!_162)
            {
                float _1712 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1710 = _1712;
            }
            float _1714 = _1710;
            bool _1716 = !_162;
            float _1718 = _1714;
            if (!_1716)
            {
                float _1720 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1722 = log2(_1720);
                float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1726 = _1724 + 1.0;
                float _1728 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1730 = _1722 * _1700;
                float _1732 = 1.0 / _1726;
                float _1734 = _1728 * 0.693147182464599609375;
                float _1736 = exp2(_1730);
                float _1738 = 1.0 / _1734;
                float _1740 = _1736 + (-1.0);
                float _1742 = -_1740;
                float _1744 = fma(_1742, _1738, _1700);
                float _1746 = _1744 * _1732;
                float _1748 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1718 = _1748;
                _1648 = _1726;
            }
            float _1750 = _1718;
            float _1752 = _1648;
            float _1754 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1756 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1758 = !_162;
            float _1760 = _1752;
            if (!_1758)
            {
                float _1762 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1764 = log2(_1762);
                float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1768 = _1766 + 1.0;
                float _1770 = 1.0 / _1768;
                float _1772 = _1764 * _1700;
                float _1774 = exp2(_1772);
                float _1776 = -_1774;
                float _1778 = _1776 + 1.0;
                float _1780 = _1778 * _1770;
                _1702 = _1780;
                _1760 = _1772;
            }
            float _1782 = _1702;
            float _1784 = _1760;
            float _1786 = fma(_1782, _148, _1756);
            float _1788 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1790 = fma(_1782, _146, _1754);
            float _1792 = -_346;
            float _1794 = _1792 + _1786;
            float _1796 = fma(_1782, _150, _1788);
            float _1798 = -_352;
            float _1800 = _1798 + _1790;
            float _1802 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1804 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1806 = -_360;
            float _1808 = _1806 + _1796;
            float _1810 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1812 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1802);
            float _1814 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1804);
            float _1816 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1810);
            float _1818 = fma(_1808, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1812);
            float _1820 = fma(_1808, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1814);
            float _1822 = fma(_1808, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1816);
            float _1824 = _1818 * _1818;
            float _1826 = fma(_1820, _1820, _1824);
            float _1828 = fma(_1822, _1822, _1826);
            _1678 = _1828;
            _602 = _1818;
            _604 = _1820;
            _606 = _1822;
            _1686 = _1820;
            _1692 = _1818;
            _1698 = _1822;
            _190 = _1808;
            _1650 = _1784;
        }
        float _1830 = _1678;
        float _1832 = _602;
        float _1834 = _604;
        float _1836 = _606;
        float _1838 = _1686;
        float _1840 = _1692;
        float _1842 = _1698;
        float _1844 = _190;
        float _1846 = _1650;
        float _1848 = sqrt(_1830);
        float _1850 = rsqrt(_1618);
        bool _1852 = _1848 > 0.0;
        float _1854 = _1596 * _1850;
        float _1856 = _1590 * _1850;
        float _1858 = _1604 * _1850;
        bool _1860 = !_1852;
        _1658 = _1838;
        _1660 = _1842;
        _192 = _1844;
        _1662 = _1846;
        if (!_1860)
        {
            float _1862 = rsqrt(_1830);
            float _1864 = _1862 * _1832;
            float _1866 = _1862 * _1834;
            float _1868 = _1862 * _1836;
            float _1870 = _1856 * _1864;
            float _1872 = fma(_1854, _1866, _1870);
            float _1874 = fma(_1858, _1868, _1872);
            float _1876 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1878 = fma(_1838, _1876, _1584);
            float _1880 = fma(_1840, _1876, _1582);
            float _1882 = fma(_1842, _1876, _1586);
            _1652 = _1878;
            _1654 = _1880;
            _1656 = _1882;
            _192 = _1864;
        }
    }
    float _1884 = _1652;
    float _1886 = _1654;
    float _1888 = _1656;
    float _1890 = _1658;
    float _1892 = _1660;
    float _1894 = _192;
    float _1896 = _1662;
    bool _1898 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.5);
    bool _1906 = _1902 || _1904;
    float _1908 = _1894;
    float _1910 = _1892;
    float _1912 = _1890;
    float _1914 = _1896;
    if (_1906)
    {
        _1908 = _1884;
    }
    float _1916 = _1908;
    float _1918 = _1916;
    if (_1906)
    {
        _1910 = _1886;
    }
    float _1920 = _1910;
    float _1922 = _1920;
    if (_1906)
    {
        _1912 = _1888;
    }
    float _1924 = _1912;
    float _1926 = _1924;
    if (!_1906)
    {
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1930 = _1510 + _1928;
        float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1934 = _1414 + _1932;
        float _1936 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1938 = -_1414;
        float _1940 = _1938 + _1884;
        float _1942 = _1930 * _1930;
        float _1944 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1946 = _1404 + _1944;
        float _1948 = -_1510;
        float _1950 = _1948 + _1886;
        float _1952 = fma(_1934, _1934, _1942);
        float _1954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1956 = fma(_1946, _1946, _1952);
        float _1958 = sqrt(_1956);
        float _1960 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1962 = -_1404;
        float _1964 = _1962 + _1888;
        float _1966 = precise::min(_1958, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1968 = _1966 * _1954;
        float _1970 = _1960 * _1968;
        float _1972 = fma(_1940, _1970, _1414);
        float _1974 = fma(_1950, _1970, _1510);
        float _1976 = fma(_1964, _1970, _1404);
        _1922 = _1974;
        _1918 = _1972;
        _1926 = _1976;
    }
    float _1978 = _1922;
    float _1980 = _1918;
    float _1982 = _1926;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1986 = _1978 + _1984;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1990 = _1980 + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1994 = _1982 + _1992;
    float _1996 = _1986 * _1986;
    float _1998 = fma(_1990, _1990, _1996);
    float _2000 = fma(_1994, _1994, _1998);
    float _2002 = rsqrt(_2000);
    float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2006 = _1990 * _2004;
    float _2008 = _1994 * _2004;
    float _2010 = _2006 * _2006;
    float _2012 = _2008 * _2008;
    float _2014 = _2010 + _2012;
    float _2016 = sqrt(_2014);
    bool _2018 = _2016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2022 = _2016 + _2020;
    float _2024 = _2002;
    float _2026 = _2022;
    float _2028 = _1986;
    float _2030 = _2004;
    float _2032 = _2006;
    if (_2018)
    {
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2024 = _2034;
    }
    float _2036 = _2024;
    if (_2018)
    {
        float _2038 = rsqrt(_2014);
        _1914 = _2038;
    }
    float _2040 = _1914;
    float _2042 = _2040;
    if (_2018)
    {
        float _2044 = _2022 * _2036;
        _2026 = _2044;
    }
    float _2046 = _2026;
    if (_2018)
    {
        float _2048 = _2046 * 0.15915493667125701904296875;
        _1664 = _2048;
    }
    float _2050 = _1664;
    float _2052 = _2036;
    if (_2018)
    {
        float _2054 = _2050 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        _2052 = _2056;
    }
    float _2058 = _2052;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2062 = precise::max(0.0, _2060);
    float _2064 = _1994;
    float _2066 = _2062;
    if (_2018)
    {
        float _2068 = _2050 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        _2064 = _2070;
    }
    float _2072 = _2064;
    float _2074 = -_2004;
    float _2076 = -_2062;
    float _2078 = fma(_1986, _2074, _2076);
    if (!_2018)
    {
        _2028 = _2010;
    }
    float _2080 = _2028;
    float _2082 = _2080;
    if (_2018)
    {
        float _2084 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2066 = _2084;
    }
    float _2086 = _2066;
    float _2088 = sqrt(_2000);
    float _2090 = _2058;
    float _2092 = _2086;
    if (_2018)
    {
        float _2094 = fma(_2058, _2086, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2090 = _2094;
    }
    float _2096 = _2090;
    float _2098 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2100 = _2096;
    if (_2018)
    {
        float _2102 = _2072 + (-1.0);
        _2092 = _2102;
    }
    float _2104 = _2092;
    float _2106 = _2104;
    if (_2018)
    {
        float _2108 = _2040 * _2096;
        _426 = _2108;
    }
    float _2110 = _426;
    if (!_2018)
    {
        _2042 = _2078;
    }
    float _2112 = _2042;
    float _2114 = _2112;
    if (_2018)
    {
        float _2116 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2030 = _2116;
    }
    float _2118 = _2030;
    if (_2018)
    {
        float _2120 = _2006 * _2110;
        _2032 = _2120;
    }
    float _2122 = _2032;
    if (!_2018)
    {
        _2100 = _2008;
    }
    float _2124 = _2100;
    float _2126 = _2124;
    if (_2018)
    {
        float _2128 = _2008 * _2110;
        _2126 = _2128;
    }
    float _2130 = _2126;
    if (_2018)
    {
        float _2132 = fma(_2078, _2072, _2118);
        _2114 = _2132;
    }
    float _2134 = _2114;
    if (_2018)
    {
        float _2136 = _2122 * _2122;
        _2082 = _2136;
    }
    float _2138 = _2082;
    if (!_2018)
    {
        _2106 = _2012;
    }
    float _2140 = _2106;
    float _2142 = _2140;
    if (_2018)
    {
        float _2144 = _2130 * _2130;
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = fma(_2134, _2134, _2138);
    float _2150 = _2148 + _2146;
    float _2152 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2156 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2154);
    float _2158 = precise::clamp(_2156, 0.0, 1.0);
    float _2160 = rsqrt(_2150);
    float _2162 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2152);
    float _2164 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2166 = -_2158;
    float _2168 = _2166 + 1.0;
    float _2170 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2162);
    float _2172 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2174 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2164);
    float _2176 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2178 = abs(_2168);
    float _2180 = log2(_2178);
    float _2182 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2172);
    float _2184 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2174);
    float _2186 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2176);
    float _2188 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2190 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2182);
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2194 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2186);
    float _2196 = _2160 * _2122;
    float _2198 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2200 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2202 = _2160 * _2134;
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2206 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2208 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2200);
    float _2210 = _2160 * _2130;
    float _2212 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2214 = -_2204;
    float _2216 = fma(_2202, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2214);
    float _2218 = -_2206;
    float _2220 = fma(_2218, _2098, 1.0);
    float _2222 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2224 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2208);
    float _2226 = exp2(_2212);
    float _2228 = -_2210;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2216);
    float _2232 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2234 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2224);
    float _2236 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2238 = fma(_2230, -0.5, 0.5);
    float _2240 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2232);
    float _2242 = fma(_2230, 0.5, 0.5);
    float _2244 = log2(_2220);
    float _2246 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2236);
    float _2248 = _2202 + 1.0;
    float _2250 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2240);
    float _2252 = fma(_2242, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2254 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2246);
    float _2256 = 1.0 / _2234;
    float _2258 = -_2202;
    float _2260 = fma(_2226, _2248, _2258);
    float _2262 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2250);
    float _2264 = fma(_2242, _2252, -0.212114393711090087890625);
    float _2266 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2254);
    float _2268 = fma(_2260, 0.5, 0.5);
    float _2270 = fma(_2242, _2264, 1.570728778839111328125);
    float _2272 = sqrt(_2238);
    float _2274 = _2244 * 0.693147182464599609375;
    float _2276 = _2262 * _2256;
    float _2278 = _2266 * _2256;
    float _2280 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2282 = fma(_2276, 0.5, 0.5);
    float _2284 = fma(_2278, -0.5, 0.5);
    float _2286 = _2272 * 0.636619746685028076171875;
    float3 _5965 = float3(_2282, _2284, _2280);
    float _2288 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5965, float3(0.0), isnan(_5965)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5965, float3(0.0), isnan(_5965)), level(0.0)).x;
    float3 _5976 = float3(_2282, _2284, _2280);
    float4 _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5976, float3(0.0), isnan(_5976)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5976, float3(0.0), isnan(_5976)), level(0.0)).xyzw;
    float _2293 = _2291.x;
    float _2295 = _2291.y;
    float _2297 = _2291.z;
    float _2299 = _2291.w;
    float _2301 = -_2270;
    float _2303 = fma(_2286, _2301, 1.0);
    float2 _5998 = float2(_2303, _2268);
    float3 _2307 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _2309 = _2307.x;
    float _2311 = _2307.y;
    float _2313 = _2307.z;
    float _2315 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2317 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2319 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2317);
    float _2321 = exp2(_2315);
    float _2323 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2319);
    float _2325 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2323);
    float _2327 = _2325 + _2234;
    out.gl_Position.x = _2262;
    out.gl_Position.y = _2266;
    out.gl_Position.z = _2325;
    out.gl_Position.w = _2234;
    float _2329 = -_2321;
    float _2331 = _2329 + 1.0;
    float _2333 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2335 = _2327 * 0.5;
    float _2337 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _2333;
    out.m_65.z = _2335;
    out.m_65.w = _2234;
    float _2339 = _2337 * _2288;
    float _2341 = -_2337;
    float _2343 = _2341 + 1.0;
    float _2345 = _2299 * _2339;
    float _2347 = _2313 * _2339;
    float _2349 = fma(_2309, _2345, _2293);
    float _2351 = fma(_2311, _2345, _2295);
    float _2353 = _2299 * _2343;
    float _2355 = fma(_2299, _2347, _2297);
    out.m_67.x = _2349;
    out.m_67.y = _2351;
    out.m_67.z = _2355;
    out.m_67.w = _2353;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _880 = false;
    bool _752 = false;
    bool _626 = false;
    bool _470 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_102);
        out.gl_Position.z = _2412;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = 0.0;
    float _124 = 0.0;
    if (_116)
    {
        float _126 = float(_86);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _120 >= _128;
    bool _132 = !_116;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _104 = as_type<int>(_140);
    }
    int _142 = _104;
    float _144 = as_type<float>(_142);
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2483 = as_type<float>(_142);
        out.gl_Position.z = _2483;
    }
    if (_134)
    {
        return out;
    }
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    float _152 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = _152;
    if (!_162)
    {
        float _166 = _152 * _152;
        float _168 = _166 * 0.5;
        _144 = _168;
    }
    float _170 = _144;
    float _172 = 0.0;
    float _174 = _170;
    if (!_162)
    {
        float _176 = _120 * _120;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    if (!_162)
    {
        float _182 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _182;
    }
    float _184 = _174;
    bool _186 = !_162;
    float _188 = _184;
    float _190 = _150;
    float _192 = _150;
    if (!_186)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _152 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _152);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _122 = _212;
        _188 = _222;
        _124 = _210;
    }
    float _224 = _122;
    float _226 = _188;
    float _228 = _124;
    bool _230 = !_162;
    float _232 = _224;
    float _234 = _228;
    if (!_230)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _152 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _232 = _248;
        _234 = _242;
        _164 = _254;
    }
    float _256 = _232;
    float _258 = _234;
    float _260 = _164;
    float _262 = _258;
    float _264 = _256;
    if (!_162)
    {
        _262 = _120;
    }
    float _266 = _262;
    float _268 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _266;
    if (!_162)
    {
        float _274 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _274;
    }
    float _276 = _264;
    bool _278 = !_162;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _120 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _120);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_162;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _120 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _340 = fma(_260, _148, _270);
    float _342 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _346 = fma(_336, _148, _338);
    float _348 = fma(_260, _146, _268);
    float _350 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_336, _146, _342);
    float _354 = -_346;
    float _356 = _340 + _354;
    float _358 = fma(_260, _150, _344);
    float _360 = fma(_336, _150, _350);
    float _362 = -_352;
    float _364 = _348 + _362;
    float _366 = _356 * _356;
    float _368 = in.m_49.w;
    float _370 = -_360;
    float _372 = _358 + _370;
    float _374 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _376 = fma(_364, _364, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _374);
    float _384 = fma(_372, _372, _376);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _388 = in.m_42.x;
    float _390 = in.m_42.y;
    float _392 = in.m_42.z;
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _402 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_348, _368, _388);
    float _416 = fma(_340, _368, _390);
    float _418 = fma(_358, _368, _392);
    float _420 = _358;
    float _422 = _400;
    float _424 = _402;
    float _426 = _352;
    if (_412)
    {
        _420 = _396;
    }
    float _428 = _420;
    float _430 = _428;
    if (!_412)
    {
        bool _432 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _434 = !_432;
        if (!_434)
        {
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _446);
            float _454 = _448 * _448;
            float _456 = fma(_450, _450, _454);
            float _458 = fma(_452, _452, _456);
            float _460 = rsqrt(_458);
            float _462 = _460 * 9.9999999747524270787835121154785e-07;
            float _464 = _450 * _462;
            float _466 = _448 * _462;
            float _468 = _452 * _462;
            _430 = _466;
            _422 = _464;
            _424 = _468;
            _470 = true;
        }
        else
        {
            float _472 = _148 * _148;
            float _474 = fma(_146, _146, _472);
            float _476 = fma(_150, _150, _474);
            float _478 = sqrt(_476);
            bool _480 = _478 >= 9.9999999747524270787835121154785e-07;
            bool _482 = isnan(_478);
            bool _484 = _480 || _482;
            bool _486 = isnan(9.9999999747524270787835121154785e-07);
            bool _488 = _484 || _486;
            if (!_488)
            {
                float _490 = _390 * _390;
                float _492 = fma(_388, _388, _490);
                float _494 = fma(_392, _392, _492);
                float _496 = sqrt(_494);
                bool _498 = _496 >= 9.9999999747524270787835121154785e-07;
                bool _500 = isnan(_496);
                bool _502 = _498 || _500;
                bool _504 = isnan(9.9999999747524270787835121154785e-07);
                bool _506 = _502 || _504;
                if (!_506)
                {
                    float _508 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _510 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _508);
                    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _510);
                    float _514 = rsqrt(_512);
                    float _516 = _514 * 9.9999999747524270787835121154785e-07;
                    float _518 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _520 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _430 = _520;
                    _422 = _518;
                    _424 = _522;
                    _470 = true;
                }
                else
                {
                    float _524 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
                    float _532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
                    float _534 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
                    float _538 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _532);
                    float _540 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _534);
                    float _542 = _536 * _536;
                    float _544 = fma(_538, _538, _542);
                    float _546 = fma(_540, _540, _544);
                    float _548 = rsqrt(_546);
                    float _550 = _548 * 9.9999999747524270787835121154785e-07;
                    float _552 = _538 * _550;
                    float _554 = _536 * _550;
                    float _556 = _540 * _550;
                    _430 = _554;
                    _422 = _552;
                    _424 = _556;
                    _470 = true;
                }
            }
            else
            {
                float _558 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _560 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _562 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _564 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _558);
                float _566 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
                float _568 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
                float _570 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _564);
                float _572 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _566);
                float _574 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _568);
                float _576 = _570 * _570;
                float _578 = fma(_572, _572, _576);
                float _580 = fma(_574, _574, _578);
                float _582 = rsqrt(_580);
                float _584 = _582 * 9.9999999747524270787835121154785e-07;
                float _586 = _572 * _584;
                float _588 = _570 * _584;
                float _590 = _574 * _584;
                _430 = _588;
                _422 = _586;
                _424 = _590;
            }
        }
    }
    _470 = false;
    float _592 = _430;
    float _594 = _422;
    float _596 = _424;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _600 = !_598;
    float _602 = _592;
    float _604 = _594;
    float _606 = _596;
    float _624;
    if (!_600)
    {
        float _608 = in.m_51.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_86);
        float _630 = 1.0 / _628;
        float _632 = _120 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _638 = _634 + _636;
    bool _640 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _642 = isnan(_634);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _652;
    float _656 = 1.0 / _654;
    bool _658 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_634);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_650;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _678;
    bool _682 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _684;
    float _688 = _668 * _672;
    float _690 = -_668;
    float _692 = _690 + 1.0;
    float _694 = _638 * _656;
    float _696 = in.m_49.x;
    float _698 = in.m_49.y;
    float _700 = in.m_49.z;
    float _702 = fma(_676, _694, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _704 = fma(_686, _694, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _706 = fma(_680, _694, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _708 = _702 * _688;
    float _710 = _704 * _688;
    float _712 = _706 * _688;
    float _714 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[143].x, _708);
    float _716 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[143].y, _710);
    float _718 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[143].z, _712);
    float _720 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[144].x, _714);
    float _722 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[144].y, _716);
    float _724 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[144].z, _718);
    float _726 = _720 * _696;
    float _728 = _722 * _698;
    float _730 = _724 * _700;
    bool _732 = !_682;
    float _750;
    if (!_732)
    {
        float _734 = in.m_51.x;
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _738 = _734 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _750 = _748;
        _752 = true;
    }
    else
    {
        float _754 = float(_86);
        float _756 = 1.0 / _754;
        float _758 = _120 * _756;
        _750 = _758;
    }
    _752 = false;
    float _760 = _750;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _764 = _760 + _762;
    bool _766 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _768 = isnan(_760);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _778;
    bool _782 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _784 = isnan(_760);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -_776;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _798;
    float _802 = 1.0 / _780;
    bool _804 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _806 = _792 * _796;
    float _808 = -_792;
    float _810 = _808 + 1.0;
    float _812 = _764 * _802;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _814;
    float _818 = fma(_800, _812, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _820;
    float _824 = fma(_816, _812, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _826 = _818 * _806;
    float _828 = fma(_822, _812, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _830 = _824 * _806;
    float _832 = _828 * _806;
    float _834 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[107].x, _826);
    float _836 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[107].y, _832);
    float _838 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[107].z, _830);
    float _840 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[108].x, _834);
    float _842 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[108].y, _836);
    float _844 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[108].z, _838);
    float _846 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _848 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _850 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _854 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _854;
    out.m_53.y = _856;
    out.m_53.z = _858;
    out.m_53.w = _852;
    bool _860 = !_804;
    float _878;
    if (!_860)
    {
        float _862 = in.m_51.x;
        float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _866 = _862 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _870 = _868 * _864;
        float _872 = floor(_870);
        float _874 = -_872;
        float _876 = _870 + _874;
        _878 = _876;
        _880 = true;
    }
    else
    {
        float _882 = float(_86);
        float _884 = 1.0 / _882;
        float _886 = _120 * _884;
        _878 = _886;
    }
    _880 = false;
    float _888 = _878;
    float _890 = _592 * _592;
    float _892 = in.m_55.x;
    float _894 = in.m_55.y;
    float _896 = in.m_55.z;
    float _898 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _900 = fma(_594, _594, _890);
    float _902 = in.m_51.w;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _906 = _904 != 0;
    float _908 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _910 = fma(_596, _596, _900);
    float _912 = in.m_57.y;
    float _914 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _916 = rsqrt(_910);
    float _918 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _898);
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _922 = _920 != 0;
    float _924 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _908);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _928 = _926 != 0;
    float _930 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _914);
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _934 = _932 != 0;
    float _936 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _940 = _938 != 0;
    float _942 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _944 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _924);
    float _946 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _894);
    float _948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _892);
    float _950 = _916 * _592;
    float _952 = _916 * _594;
    bool _954 = _902 > 0.5;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _956;
    float _960 = _950 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _962 = _916 * _596;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _968 = 1.0 / _958;
    float _970 = fma(_952, (*spvDescriptorSet0.vp_c10)._m0[8].y, _960);
    float _972 = -_912;
    float _974 = _972 + 1.0;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _896);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _978;
    float _982 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _984 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _986 = _936 * _948;
    float _988 = 1.0 / _966;
    float _990 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[10].y, _970);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _996 = _954 ? as_type<int>(_974) : as_type<int>(_912);
    float _998 = _930;
    bool _1000 = _934;
    float _1002 = _912;
    float _1004 = _910;
    if (_922)
    {
        float _1006 = in.m_51.x;
        _998 = _1006;
    }
    float _1008 = _998;
    float _1010 = _942 * _976;
    float _1012 = abs(_990);
    bool _1014 = _1012 > 0.99989998340606689453125;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1018 = _888 + _1016;
    float _1020 = 1.0 / _980;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1024 = _888 + _1022;
    float _1026 = _1018 * _968;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1030 = _888 + _1028;
    float _1032 = _1018;
    float _1034 = _1024;
    bool _1036 = _1014;
    if (_928)
    {
        float _1038 = in.m_51.z;
        _1032 = _1038;
    }
    float _1040 = _1032;
    float _1042 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1044 = 1.0 / _994;
    float _1046 = _1024 * _988;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1050 = _888 + _1048;
    if (_1014)
    {
        _1034 = 0.001000000047497451305389404296875;
    }
    float _1052 = _1034;
    float _1054 = _1042 * _946;
    float _1056 = 0.0;
    if (!_1014)
    {
        _1056 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1058 = _1056;
    float _1060 = 0.0;
    float _1062 = _1058;
    if (!_906)
    {
        float _1064 = in.m_51.z;
        _1060 = _1064;
    }
    float _1066 = _1060;
    float _1068 = 0.0;
    float _1070 = _1066;
    if (!_1014)
    {
        _1068 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1072 = _1068;
    float _1074 = _1030 * _1020;
    float _1076 = _1072;
    if (_1014)
    {
        float _1078 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1062 = _1078;
    }
    float _1080 = _1062;
    float _1082 = in.m_57.x;
    float _1084 = -_1080;
    float _1086 = _962 * _1084;
    float _1088 = _1082;
    if (_1014)
    {
        float _1090 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1076 = _1090;
    }
    float _1092 = _1076;
    float _1094 = _1050 * _1044;
    float _1096 = _1044;
    if (!_1014)
    {
        _1096 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1098 = _1096;
    float _1100 = _1098;
    if (_1014)
    {
        float _1102 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = _1052;
    if (!_906)
    {
        float _1108 = in.m_51.y;
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1116;
    float _1120 = _934 ? as_type<float>(_996) : _912;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1122;
    if (_922)
    {
        bool _1126 = _1008 > 0.5;
        _1000 = _1126;
    }
    bool _1128 = _1000;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1130;
    if (_928)
    {
        bool _1134 = _1040 > 0.5;
        _1036 = _1134;
    }
    bool _1136 = _1036;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1150;
    float _1154 = fma(_1114, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1156 = -_1104;
    float _1158 = -_1086;
    float _1160 = fma(_952, _1156, _1158);
    float _1162 = -_1104;
    float _1164 = _950 * _1162;
    bool _1166 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1168 = isnan(_888);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = fma(_1140, _1046, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1180 = fma(_1144, _1046, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1182 = fma(_1148, _1046, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1184 = fma(_1118, _1026, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1186 = fma(_1132, _1026, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1188 = fma(_1124, _1026, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1190 = fma(_1152, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1192 = -_1092;
    float _1194 = _952 * _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1196;
    float _1200 = -_1092;
    float _1202 = -_1164;
    float _1204 = fma(_962, _1200, _1202);
    bool _1206 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1208 = isnan(_888);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -_1176;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1198, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1224 = _1160 * _1160;
    float _1226 = -_1080;
    float _1228 = -_1194;
    float _1230 = fma(_950, _1226, _1228);
    float _1232 = _1216 * _1220;
    float _1234 = -_1216;
    float _1236 = _1234 + 1.0;
    float _1238 = _1216;
    if (!_906)
    {
        _1238 = _1110;
    }
    float _1240 = _1238;
    float _1242 = fma(_1204, _1204, _1224);
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1246 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1248 = isnan(_888);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1262 = fma(_1230, _1230, _1242);
    float _1264 = _1240;
    float _1266 = _1110;
    int _1268 = as_type<int>(_1260);
    if (_906)
    {
        float _1270 = in.m_51.x;
        float _1272 = in.m_51.y;
        _1264 = _1270;
        _1266 = _1272;
    }
    float _1274 = _1264;
    float _1276 = _1266;
    bool _1278 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1280 = isnan(_888);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = _1256 * _1236;
    float _1292 = -_1256;
    float _1294 = _1292 + 1.0;
    bool _1296 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1298 = isnan(_888);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = rsqrt(_1262);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1314 = _1288 * _1294;
    float _1316 = -_1288;
    float _1318 = _1316 + 1.0;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1324 = fma(_1260, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1326 = _1322;
    float _1328 = _1324;
    if (_922)
    {
        float _1330 = -_1082;
        float _1332 = _1330 + 1.0;
        _1268 = as_type<int>(_1332);
    }
    int _1334 = _1268;
    float _1336 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1338 = _1244;
    if (!_906)
    {
        _1338 = _1066;
    }
    float _1340 = _1338;
    float _1342 = fma(_1322, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1344 = _1306 * _1318;
    float _1346 = _1340;
    float _1348 = _1342;
    if (!_922)
    {
        _1326 = _1082;
    }
    float _1350 = _1326;
    float _1352 = fma(_1312, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1354 = _1350;
    if (_922)
    {
        float _1356 = _1128 ? as_type<float>(_1334) : _1082;
        _1354 = _1356;
    }
    float _1358 = _1354;
    float _1360 = _1184 * _1344;
    float _1362 = _1186 * _1344;
    float _1364 = _1204 * _1308;
    float _1366 = _1230 * _1308;
    float _1368 = _1188 * _1344;
    if (_906)
    {
        _1346 = _1276;
    }
    float _1370 = _1346;
    float _1372 = _1054 * _952;
    if (_906)
    {
        _1070 = _1276;
    }
    float _1374 = _1070;
    float _1376 = fma(_1336, _1120, -0.5);
    bool _1378 = _1276 > 0.5;
    float _1380 = _1160 * _1308;
    float _1382 = _1054 * _962;
    float _1384 = _1054 * _950;
    float _1386 = _952 * _1380;
    float _1388 = _950 * _1366;
    float _1390 = fma(_986, _1366, _1382);
    float _1392 = fma(_986, _1364, _1372);
    float _1394 = -_1386;
    float _1396 = fma(_950, _1364, _1394);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1400 = -_1388;
    float _1402 = fma(_962, _1380, _1400);
    float _1404 = _984 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1406 = fma(_1010, _1396, _1390);
    float _1408 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1398);
    float _1410 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1412 = fma(_1010, _1402, _1392);
    float _1414 = _944 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1416 = _1404 + _1406;
    float _1418 = -_1306;
    float _1420 = _1418 + 1.0;
    int _1422 = 0;
    if (_928)
    {
        float _1424 = -_1082;
        float _1426 = _1424 + 1.0;
        _1422 = as_type<int>(_1426);
    }
    int _1428 = _1422;
    float _1430 = _1414 + _1412;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1434 = _1416 + _1432;
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1360);
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _1430 + _1440;
    float _1444 = _1434 * _1434;
    float _1446 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1368);
    float _1448 = _1430;
    if (_928)
    {
        float _1450 = _1136 ? as_type<float>(_1428) : _1082;
        _1088 = _1450;
    }
    float _1452 = _1088;
    float _1454 = _962 * _1364;
    float _1456 = fma(_1442, _1442, _1444);
    if (_940)
    {
        float _1458 = _1378 ? _974 : _912;
        _1002 = _1458;
    }
    float _1460 = _1002;
    float _1462 = fma(_1178, _1314, _1436);
    float _1464 = sqrt(_1456);
    float _1466 = fma(_1182, _1314, _1446);
    float _1468 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1472 = fma(_986, _1380, _1384);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1476 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1362);
    float _1478 = -_1470;
    float _1480 = fma(_1410, 2.0, _1478);
    float _1482 = -_1454;
    float _1484 = fma(_952, _1366, _1482);
    float _1486 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1474);
    float _1488 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1490 = fma(_1180, _1314, _1476);
    float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1494 = fma(_1010, _1484, _1472);
    bool _1496 = _1464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1500 = fma(_1488, _1452, -0.5);
    float _1502 = fma(_1190, _1290, _1462);
    float _1504 = fma(_1154, _1290, _1490);
    float _1506 = fma(_1468, -2.0, _1498);
    float _1508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1510 = _982 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1512 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1408);
    float _1514 = -_120;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1480);
    float _1518 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1486);
    float _1520 = _1510 + _1494;
    float _1522 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1506);
    float _1524 = fma(_1324, _1232, _1502);
    float _1526 = fma(_1342, _1232, _1504);
    float _1528 = fma(_1222, _1290, _1466);
    float _1530 = fma(_1512, _1500, _1516);
    float _1532 = -_1522;
    float _1534 = fma(_1518, _1376, _1532);
    if (!_1496)
    {
        _1348 = _1416;
    }
    float _1536 = _1348;
    float _1538 = _1536;
    if (!_1496)
    {
        _1328 = _1520;
    }
    float _1540 = _1328;
    bool _1542 = !_1496;
    float _1544 = _1540;
    if (!_1542)
    {
        float _1546 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1548 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1550 = _1464 + _1548;
        float _1552 = rsqrt(_1456);
        float _1554 = _1550 * _1546;
        float _1556 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1558 = _1554 * 0.15915493667125701904296875;
        float _1560 = _1558 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        float _1564 = _1558 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = _1562 + (-1.0);
        float _1570 = fma(_1566, _1556, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1572 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1574 = _1552 * _1570;
        float _1576 = fma(_1520, _1562, _1572);
        float _1578 = fma(_1442, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1580 = fma(_1434, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1544 = _1576;
        _1448 = _1578;
        _1538 = _1580;
    }
    float _1582 = _1544;
    float _1584 = _1448;
    float _1586 = _1538;
    float _1588 = -_1510;
    float _1590 = _1588 + _1582;
    float _1592 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1594 = -_1414;
    float _1596 = _1594 + _1584;
    float _1598 = fma(_1352, _1232, _1528);
    float _1600 = _1590 * _1590;
    float _1602 = -_1404;
    float _1604 = _1602 + _1586;
    float _1606 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1524);
    float _1608 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1526);
    float _1610 = fma(_1596, _1596, _1600);
    float _1612 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1598);
    float _1614 = _1592 * _1492;
    float _1616 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1618 = fma(_1604, _1604, _1610);
    float _1620 = _1606 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1622 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1624 = _1612 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1626 = sqrt(_1618);
    float _1628 = _1616 * _1508;
    float _1630 = _1530 + 0.5;
    float _1632 = _1534 + 0.5;
    float _1634 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1636 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1614;
    out.m_59.y = _1628;
    out.m_59.z = _1630;
    out.m_59.w = _1632;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1640 = _1626 > 0.0;
    out.m_63.x = _1634;
    out.m_63.y = _1636;
    out.m_63.z = _1638;
    bool _1642 = !_1640;
    float _1644 = 1.0;
    float _1646 = 1.0;
    float _1648 = _1614;
    float _1650 = _1614;
    float _1652 = _1584;
    float _1654 = _1582;
    float _1656 = _1586;
    float _1658 = 1.0;
    float _1660 = 1.0;
    float _1662 = _1614;
    float _1664 = _1630;
    if (!_1642)
    {
        bool _1666 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1668 = 1.0;
        if (_1666)
        {
            float _1670 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1668 = _1670;
        }
        float _1672 = _1668;
        if (_1666)
        {
            _1644 = _910;
        }
        float _1674 = _1644;
        float _1676 = _1672;
        float _1678 = _1674;
        if (_1666)
        {
            float _1680 = _1672 * _594;
            _1646 = _1680;
        }
        float _1682 = _1646;
        float _1684 = _1682;
        float _1686 = _1682;
        if (_1666)
        {
            float _1688 = _1672 * _592;
            _1004 = _1688;
        }
        float _1690 = _1004;
        float _1692 = _1690;
        if (_1666)
        {
            float _1694 = _1672 * _596;
            _1676 = _1694;
        }
        float _1696 = _1676;
        float _1698 = _1696;
        if (!_1666)
        {
            float _1700 = _120 + 1.0;
            float _1702 = _1700;
            if (!_162)
            {
                float _1704 = _1700 * _1700;
                float _1706 = _1704 * 0.5;
                _1684 = _1706;
            }
            float _1708 = _1684;
            float _1710 = _1708;
            if (!_162)
            {
                float _1712 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1710 = _1712;
            }
            float _1714 = _1710;
            bool _1716 = !_162;
            float _1718 = _1714;
            if (!_1716)
            {
                float _1720 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1722 = log2(_1720);
                float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1726 = _1724 + 1.0;
                float _1728 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1730 = _1722 * _1700;
                float _1732 = 1.0 / _1726;
                float _1734 = _1728 * 0.693147182464599609375;
                float _1736 = exp2(_1730);
                float _1738 = 1.0 / _1734;
                float _1740 = _1736 + (-1.0);
                float _1742 = -_1740;
                float _1744 = fma(_1742, _1738, _1700);
                float _1746 = _1744 * _1732;
                float _1748 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1718 = _1748;
                _1648 = _1726;
            }
            float _1750 = _1718;
            float _1752 = _1648;
            float _1754 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1756 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1758 = !_162;
            float _1760 = _1752;
            if (!_1758)
            {
                float _1762 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1764 = log2(_1762);
                float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1768 = _1766 + 1.0;
                float _1770 = 1.0 / _1768;
                float _1772 = _1764 * _1700;
                float _1774 = exp2(_1772);
                float _1776 = -_1774;
                float _1778 = _1776 + 1.0;
                float _1780 = _1778 * _1770;
                _1702 = _1780;
                _1760 = _1772;
            }
            float _1782 = _1702;
            float _1784 = _1760;
            float _1786 = fma(_1782, _148, _1756);
            float _1788 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1790 = fma(_1782, _146, _1754);
            float _1792 = -_346;
            float _1794 = _1792 + _1786;
            float _1796 = fma(_1782, _150, _1788);
            float _1798 = -_352;
            float _1800 = _1798 + _1790;
            float _1802 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1804 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1806 = -_360;
            float _1808 = _1806 + _1796;
            float _1810 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1812 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1802);
            float _1814 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1804);
            float _1816 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1810);
            float _1818 = fma(_1808, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1812);
            float _1820 = fma(_1808, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1814);
            float _1822 = fma(_1808, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1816);
            float _1824 = _1818 * _1818;
            float _1826 = fma(_1820, _1820, _1824);
            float _1828 = fma(_1822, _1822, _1826);
            _1678 = _1828;
            _602 = _1818;
            _604 = _1820;
            _606 = _1822;
            _1686 = _1820;
            _1692 = _1818;
            _1698 = _1822;
            _190 = _1808;
            _1650 = _1784;
        }
        float _1830 = _1678;
        float _1832 = _602;
        float _1834 = _604;
        float _1836 = _606;
        float _1838 = _1686;
        float _1840 = _1692;
        float _1842 = _1698;
        float _1844 = _190;
        float _1846 = _1650;
        float _1848 = sqrt(_1830);
        float _1850 = rsqrt(_1618);
        bool _1852 = _1848 > 0.0;
        float _1854 = _1596 * _1850;
        float _1856 = _1590 * _1850;
        float _1858 = _1604 * _1850;
        bool _1860 = !_1852;
        _1658 = _1838;
        _1660 = _1842;
        _192 = _1844;
        _1662 = _1846;
        if (!_1860)
        {
            float _1862 = rsqrt(_1830);
            float _1864 = _1862 * _1832;
            float _1866 = _1862 * _1834;
            float _1868 = _1862 * _1836;
            float _1870 = _1856 * _1864;
            float _1872 = fma(_1854, _1866, _1870);
            float _1874 = fma(_1858, _1868, _1872);
            float _1876 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1878 = fma(_1838, _1876, _1584);
            float _1880 = fma(_1840, _1876, _1582);
            float _1882 = fma(_1842, _1876, _1586);
            _1652 = _1878;
            _1654 = _1880;
            _1656 = _1882;
            _192 = _1864;
        }
    }
    float _1884 = _1652;
    float _1886 = _1654;
    float _1888 = _1656;
    float _1890 = _1658;
    float _1892 = _1660;
    float _1894 = _192;
    float _1896 = _1662;
    bool _1898 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.5);
    bool _1906 = _1902 || _1904;
    float _1908 = _1894;
    float _1910 = _1892;
    float _1912 = _1890;
    float _1914 = _1896;
    if (_1906)
    {
        _1908 = _1884;
    }
    float _1916 = _1908;
    float _1918 = _1916;
    if (_1906)
    {
        _1910 = _1886;
    }
    float _1920 = _1910;
    float _1922 = _1920;
    if (_1906)
    {
        _1912 = _1888;
    }
    float _1924 = _1912;
    float _1926 = _1924;
    if (!_1906)
    {
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1930 = _1510 + _1928;
        float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1934 = _1414 + _1932;
        float _1936 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1938 = -_1414;
        float _1940 = _1938 + _1884;
        float _1942 = _1930 * _1930;
        float _1944 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1946 = _1404 + _1944;
        float _1948 = -_1510;
        float _1950 = _1948 + _1886;
        float _1952 = fma(_1934, _1934, _1942);
        float _1954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1956 = fma(_1946, _1946, _1952);
        float _1958 = sqrt(_1956);
        float _1960 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1962 = -_1404;
        float _1964 = _1962 + _1888;
        float _1966 = precise::min(_1958, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1968 = _1966 * _1954;
        float _1970 = _1960 * _1968;
        float _1972 = fma(_1940, _1970, _1414);
        float _1974 = fma(_1950, _1970, _1510);
        float _1976 = fma(_1964, _1970, _1404);
        _1922 = _1974;
        _1918 = _1972;
        _1926 = _1976;
    }
    float _1978 = _1922;
    float _1980 = _1918;
    float _1982 = _1926;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1986 = _1978 + _1984;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1990 = _1980 + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1994 = _1982 + _1992;
    float _1996 = _1986 * _1986;
    float _1998 = fma(_1990, _1990, _1996);
    float _2000 = fma(_1994, _1994, _1998);
    float _2002 = rsqrt(_2000);
    float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2006 = _1990 * _2004;
    float _2008 = _1994 * _2004;
    float _2010 = _2006 * _2006;
    float _2012 = _2008 * _2008;
    float _2014 = _2010 + _2012;
    float _2016 = sqrt(_2014);
    bool _2018 = _2016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2022 = _2016 + _2020;
    float _2024 = _2002;
    float _2026 = _2022;
    float _2028 = _1986;
    float _2030 = _2004;
    float _2032 = _2006;
    if (_2018)
    {
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2024 = _2034;
    }
    float _2036 = _2024;
    if (_2018)
    {
        float _2038 = rsqrt(_2014);
        _1914 = _2038;
    }
    float _2040 = _1914;
    float _2042 = _2040;
    if (_2018)
    {
        float _2044 = _2022 * _2036;
        _2026 = _2044;
    }
    float _2046 = _2026;
    if (_2018)
    {
        float _2048 = _2046 * 0.15915493667125701904296875;
        _1664 = _2048;
    }
    float _2050 = _1664;
    float _2052 = _2036;
    if (_2018)
    {
        float _2054 = _2050 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        _2052 = _2056;
    }
    float _2058 = _2052;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2062 = precise::max(0.0, _2060);
    float _2064 = _1994;
    float _2066 = _2062;
    if (_2018)
    {
        float _2068 = _2050 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        _2064 = _2070;
    }
    float _2072 = _2064;
    float _2074 = -_2004;
    float _2076 = -_2062;
    float _2078 = fma(_1986, _2074, _2076);
    if (!_2018)
    {
        _2028 = _2010;
    }
    float _2080 = _2028;
    float _2082 = _2080;
    if (_2018)
    {
        float _2084 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2066 = _2084;
    }
    float _2086 = _2066;
    float _2088 = sqrt(_2000);
    float _2090 = _2058;
    float _2092 = _2086;
    if (_2018)
    {
        float _2094 = fma(_2058, _2086, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2090 = _2094;
    }
    float _2096 = _2090;
    float _2098 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2100 = _2096;
    if (_2018)
    {
        float _2102 = _2072 + (-1.0);
        _2092 = _2102;
    }
    float _2104 = _2092;
    float _2106 = _2104;
    if (_2018)
    {
        float _2108 = _2040 * _2096;
        _426 = _2108;
    }
    float _2110 = _426;
    if (!_2018)
    {
        _2042 = _2078;
    }
    float _2112 = _2042;
    float _2114 = _2112;
    if (_2018)
    {
        float _2116 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2030 = _2116;
    }
    float _2118 = _2030;
    if (_2018)
    {
        float _2120 = _2006 * _2110;
        _2032 = _2120;
    }
    float _2122 = _2032;
    if (!_2018)
    {
        _2100 = _2008;
    }
    float _2124 = _2100;
    float _2126 = _2124;
    if (_2018)
    {
        float _2128 = _2008 * _2110;
        _2126 = _2128;
    }
    float _2130 = _2126;
    if (_2018)
    {
        float _2132 = fma(_2078, _2072, _2118);
        _2114 = _2132;
    }
    float _2134 = _2114;
    if (_2018)
    {
        float _2136 = _2122 * _2122;
        _2082 = _2136;
    }
    float _2138 = _2082;
    if (!_2018)
    {
        _2106 = _2012;
    }
    float _2140 = _2106;
    float _2142 = _2140;
    if (_2018)
    {
        float _2144 = _2130 * _2130;
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = fma(_2134, _2134, _2138);
    float _2150 = _2148 + _2146;
    float _2152 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2156 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2154);
    float _2158 = precise::clamp(_2156, 0.0, 1.0);
    float _2160 = rsqrt(_2150);
    float _2162 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2152);
    float _2164 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2166 = -_2158;
    float _2168 = _2166 + 1.0;
    float _2170 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2162);
    float _2172 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2174 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2164);
    float _2176 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2178 = abs(_2168);
    float _2180 = log2(_2178);
    float _2182 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2172);
    float _2184 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2174);
    float _2186 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2176);
    float _2188 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2190 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2182);
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2194 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2186);
    float _2196 = _2160 * _2122;
    float _2198 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2200 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2202 = _2160 * _2134;
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2206 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2208 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2200);
    float _2210 = _2160 * _2130;
    float _2212 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2214 = -_2204;
    float _2216 = fma(_2202, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2214);
    float _2218 = -_2206;
    float _2220 = fma(_2218, _2098, 1.0);
    float _2222 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2224 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2208);
    float _2226 = exp2(_2212);
    float _2228 = -_2210;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2216);
    float _2232 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2234 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2224);
    float _2236 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2238 = fma(_2230, -0.5, 0.5);
    float _2240 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2232);
    float _2242 = fma(_2230, 0.5, 0.5);
    float _2244 = log2(_2220);
    float _2246 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2236);
    float _2248 = _2202 + 1.0;
    float _2250 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2240);
    float _2252 = fma(_2242, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2254 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2246);
    float _2256 = 1.0 / _2234;
    float _2258 = -_2202;
    float _2260 = fma(_2226, _2248, _2258);
    float _2262 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2250);
    float _2264 = fma(_2242, _2252, -0.212114393711090087890625);
    float _2266 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2254);
    float _2268 = fma(_2260, 0.5, 0.5);
    float _2270 = fma(_2242, _2264, 1.570728778839111328125);
    float _2272 = sqrt(_2238);
    float _2274 = _2244 * 0.693147182464599609375;
    float _2276 = _2262 * _2256;
    float _2278 = _2266 * _2256;
    float _2280 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2282 = fma(_2276, 0.5, 0.5);
    float _2284 = fma(_2278, -0.5, 0.5);
    float _2286 = _2272 * 0.636619746685028076171875;
    float3 _5965 = float3(_2282, _2284, _2280);
    float _2288 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5965, float3(0.0), isnan(_5965)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5965, float3(0.0), isnan(_5965)), level(0.0)).x;
    float3 _5976 = float3(_2282, _2284, _2280);
    float4 _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5976, float3(0.0), isnan(_5976)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5976, float3(0.0), isnan(_5976)), level(0.0)).xyzw;
    float _2293 = _2291.x;
    float _2295 = _2291.y;
    float _2297 = _2291.z;
    float _2299 = _2291.w;
    float _2301 = -_2270;
    float _2303 = fma(_2286, _2301, 1.0);
    float2 _5998 = float2(_2303, _2268);
    float3 _2307 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _2309 = _2307.x;
    float _2311 = _2307.y;
    float _2313 = _2307.z;
    float _2315 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2317 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2319 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2317);
    float _2321 = exp2(_2315);
    float _2323 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2319);
    float _2325 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2323);
    float _2327 = _2325 + _2234;
    out.gl_Position.x = _2262;
    out.gl_Position.y = _2266;
    out.gl_Position.z = _2325;
    out.gl_Position.w = _2234;
    float _2329 = -_2321;
    float _2331 = _2329 + 1.0;
    float _2333 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2335 = _2327 * 0.5;
    float _2337 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _2333;
    out.m_65.z = _2335;
    out.m_65.w = _2234;
    float _2339 = _2337 * _2288;
    float _2341 = -_2337;
    float _2343 = _2341 + 1.0;
    float _2345 = _2299 * _2339;
    float _2347 = _2313 * _2339;
    float _2349 = fma(_2309, _2345, _2293);
    float _2351 = fma(_2311, _2345, _2295);
    float _2353 = _2299 * _2343;
    float _2355 = fma(_2299, _2347, _2297);
    out.m_67.x = _2349;
    out.m_67.y = _2351;
    out.m_67.z = _2355;
    out.m_67.w = _2353;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _880 = false;
    bool _752 = false;
    bool _626 = false;
    bool _470 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_102);
        out.gl_Position.z = _2412;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _122 = 0.0;
    float _124 = 0.0;
    if (_116)
    {
        float _126 = float(_86);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _120 >= _128;
    bool _132 = !_116;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _104 = as_type<int>(_140);
    }
    int _142 = _104;
    float _144 = as_type<float>(_142);
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2483 = as_type<float>(_142);
        out.gl_Position.z = _2483;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    float _152 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = _152;
    if (!_162)
    {
        float _166 = _152 * _152;
        float _168 = _166 * 0.5;
        _144 = _168;
    }
    float _170 = _144;
    float _172 = 0.0;
    float _174 = _170;
    if (!_162)
    {
        float _176 = _120 * _120;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    if (!_162)
    {
        float _182 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _182;
    }
    float _184 = _174;
    bool _186 = !_162;
    float _188 = _184;
    float _190 = _150;
    float _192 = _150;
    if (!_186)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _152 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _152);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _122 = _212;
        _188 = _222;
        _124 = _210;
    }
    float _224 = _122;
    float _226 = _188;
    float _228 = _124;
    bool _230 = !_162;
    float _232 = _224;
    float _234 = _228;
    if (!_230)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _152 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _232 = _248;
        _234 = _242;
        _164 = _254;
    }
    float _256 = _232;
    float _258 = _234;
    float _260 = _164;
    float _262 = _258;
    float _264 = _256;
    if (!_162)
    {
        _262 = _120;
    }
    float _266 = _262;
    float _268 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _266;
    if (!_162)
    {
        float _274 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _274;
    }
    float _276 = _264;
    bool _278 = !_162;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _120 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _120);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_162;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _120 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _340 = fma(_260, _148, _270);
    float _342 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _346 = fma(_336, _148, _338);
    float _348 = fma(_260, _146, _268);
    float _350 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_336, _146, _342);
    float _354 = -_346;
    float _356 = _340 + _354;
    float _358 = fma(_260, _150, _344);
    float _360 = fma(_336, _150, _350);
    float _362 = -_352;
    float _364 = _348 + _362;
    float _366 = _356 * _356;
    float _368 = in.m_49.w;
    float _370 = -_360;
    float _372 = _358 + _370;
    float _374 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _376 = fma(_364, _364, _366);
    float _378 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _374);
    float _384 = fma(_372, _372, _376);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _388 = in.m_42.x;
    float _390 = in.m_42.y;
    float _392 = in.m_42.z;
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _402 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_348, _368, _388);
    float _416 = fma(_340, _368, _390);
    float _418 = fma(_358, _368, _392);
    float _420 = _358;
    float _422 = _400;
    float _424 = _402;
    float _426 = _352;
    if (_412)
    {
        _420 = _396;
    }
    float _428 = _420;
    float _430 = _428;
    if (!_412)
    {
        bool _432 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _434 = !_432;
        if (!_434)
        {
            float _436 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _438 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _440 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _440);
            float _448 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _442);
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _446);
            float _454 = _448 * _448;
            float _456 = fma(_450, _450, _454);
            float _458 = fma(_452, _452, _456);
            float _460 = rsqrt(_458);
            float _462 = _460 * 9.9999999747524270787835121154785e-07;
            float _464 = _450 * _462;
            float _466 = _448 * _462;
            float _468 = _452 * _462;
            _430 = _466;
            _422 = _464;
            _424 = _468;
            _470 = true;
        }
        else
        {
            float _472 = _148 * _148;
            float _474 = fma(_146, _146, _472);
            float _476 = fma(_150, _150, _474);
            float _478 = sqrt(_476);
            bool _480 = _478 >= 9.9999999747524270787835121154785e-07;
            bool _482 = isnan(_478);
            bool _484 = _480 || _482;
            bool _486 = isnan(9.9999999747524270787835121154785e-07);
            bool _488 = _484 || _486;
            if (!_488)
            {
                float _490 = _390 * _390;
                float _492 = fma(_388, _388, _490);
                float _494 = fma(_392, _392, _492);
                float _496 = sqrt(_494);
                bool _498 = _496 >= 9.9999999747524270787835121154785e-07;
                bool _500 = isnan(_496);
                bool _502 = _498 || _500;
                bool _504 = isnan(9.9999999747524270787835121154785e-07);
                bool _506 = _502 || _504;
                if (!_506)
                {
                    float _508 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _510 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _508);
                    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _510);
                    float _514 = rsqrt(_512);
                    float _516 = _514 * 9.9999999747524270787835121154785e-07;
                    float _518 = _516 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _520 = _516 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _522 = _516 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _430 = _520;
                    _422 = _518;
                    _424 = _522;
                    _470 = true;
                }
                else
                {
                    float _524 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
                    float _532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
                    float _534 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _528);
                    float _536 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
                    float _538 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _532);
                    float _540 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _534);
                    float _542 = _536 * _536;
                    float _544 = fma(_538, _538, _542);
                    float _546 = fma(_540, _540, _544);
                    float _548 = rsqrt(_546);
                    float _550 = _548 * 9.9999999747524270787835121154785e-07;
                    float _552 = _538 * _550;
                    float _554 = _536 * _550;
                    float _556 = _540 * _550;
                    _430 = _554;
                    _422 = _552;
                    _424 = _556;
                    _470 = true;
                }
            }
            else
            {
                float _558 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _560 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _562 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _564 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _558);
                float _566 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
                float _568 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
                float _570 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _564);
                float _572 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _566);
                float _574 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _568);
                float _576 = _570 * _570;
                float _578 = fma(_572, _572, _576);
                float _580 = fma(_574, _574, _578);
                float _582 = rsqrt(_580);
                float _584 = _582 * 9.9999999747524270787835121154785e-07;
                float _586 = _572 * _584;
                float _588 = _570 * _584;
                float _590 = _574 * _584;
                _430 = _588;
                _422 = _586;
                _424 = _590;
            }
        }
    }
    _470 = false;
    float _592 = _430;
    float _594 = _422;
    float _596 = _424;
    bool _598 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _600 = !_598;
    float _602 = _592;
    float _604 = _594;
    float _606 = _596;
    float _624;
    if (!_600)
    {
        float _608 = in.m_51.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_86);
        float _630 = 1.0 / _628;
        float _632 = _120 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _638 = _634 + _636;
    bool _640 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _642 = isnan(_634);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _652;
    float _656 = 1.0 / _654;
    bool _658 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_634);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_650;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _678;
    bool _682 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _684;
    float _688 = _668 * _672;
    float _690 = -_668;
    float _692 = _690 + 1.0;
    float _694 = _638 * _656;
    float _696 = in.m_49.x;
    float _698 = in.m_49.y;
    float _700 = in.m_49.z;
    float _702 = fma(_676, _694, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _704 = fma(_686, _694, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _706 = fma(_680, _694, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _708 = _702 * _688;
    float _710 = _704 * _688;
    float _712 = _706 * _688;
    float _714 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[143].x, _708);
    float _716 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[143].y, _710);
    float _718 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[143].z, _712);
    float _720 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[144].x, _714);
    float _722 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[144].y, _716);
    float _724 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[144].z, _718);
    float _726 = _720 * _696;
    float _728 = _722 * _698;
    float _730 = _724 * _700;
    bool _732 = !_682;
    float _750;
    if (!_732)
    {
        float _734 = in.m_51.x;
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _738 = _734 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _750 = _748;
        _752 = true;
    }
    else
    {
        float _754 = float(_86);
        float _756 = 1.0 / _754;
        float _758 = _120 * _756;
        _750 = _758;
    }
    _752 = false;
    float _760 = _750;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _764 = _760 + _762;
    bool _766 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _768 = isnan(_760);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _778;
    bool _782 = _760 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _784 = isnan(_760);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -_776;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _798;
    float _802 = 1.0 / _780;
    bool _804 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _806 = _792 * _796;
    float _808 = -_792;
    float _810 = _808 + 1.0;
    float _812 = _764 * _802;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _814;
    float _818 = fma(_800, _812, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _820;
    float _824 = fma(_816, _812, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _826 = _818 * _806;
    float _828 = fma(_822, _812, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _830 = _824 * _806;
    float _832 = _828 * _806;
    float _834 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[107].x, _826);
    float _836 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[107].y, _832);
    float _838 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[107].z, _830);
    float _840 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[108].x, _834);
    float _842 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[108].y, _836);
    float _844 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[108].z, _838);
    float _846 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _848 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _850 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _854 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _854;
    out.m_53.y = _856;
    out.m_53.z = _858;
    out.m_53.w = _852;
    bool _860 = !_804;
    float _878;
    if (!_860)
    {
        float _862 = in.m_51.x;
        float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _866 = _862 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _870 = _868 * _864;
        float _872 = floor(_870);
        float _874 = -_872;
        float _876 = _870 + _874;
        _878 = _876;
        _880 = true;
    }
    else
    {
        float _882 = float(_86);
        float _884 = 1.0 / _882;
        float _886 = _120 * _884;
        _878 = _886;
    }
    _880 = false;
    float _888 = _878;
    float _890 = _592 * _592;
    float _892 = in.m_55.x;
    float _894 = in.m_55.y;
    float _896 = in.m_55.z;
    float _898 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _900 = fma(_594, _594, _890);
    float _902 = in.m_51.w;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _906 = _904 != 0;
    float _908 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _910 = fma(_596, _596, _900);
    float _912 = in.m_57.y;
    float _914 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _916 = rsqrt(_910);
    float _918 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _898);
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _922 = _920 != 0;
    float _924 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _908);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _928 = _926 != 0;
    float _930 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _914);
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _934 = _932 != 0;
    float _936 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _940 = _938 != 0;
    float _942 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _944 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _924);
    float _946 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _894);
    float _948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _892);
    float _950 = _916 * _592;
    float _952 = _916 * _594;
    bool _954 = _902 > 0.5;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _956;
    float _960 = _950 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _962 = _916 * _596;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _968 = 1.0 / _958;
    float _970 = fma(_952, (*spvDescriptorSet0.vp_c10)._m0[8].y, _960);
    float _972 = -_912;
    float _974 = _972 + 1.0;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _896);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _978;
    float _982 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _984 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _986 = _936 * _948;
    float _988 = 1.0 / _966;
    float _990 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[10].y, _970);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _996 = _954 ? as_type<int>(_974) : as_type<int>(_912);
    float _998 = _930;
    bool _1000 = _934;
    float _1002 = _912;
    float _1004 = _910;
    if (_922)
    {
        float _1006 = in.m_51.x;
        _998 = _1006;
    }
    float _1008 = _998;
    float _1010 = _942 * _976;
    float _1012 = abs(_990);
    bool _1014 = _1012 > 0.99989998340606689453125;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1018 = _888 + _1016;
    float _1020 = 1.0 / _980;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1024 = _888 + _1022;
    float _1026 = _1018 * _968;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1030 = _888 + _1028;
    float _1032 = _1018;
    float _1034 = _1024;
    bool _1036 = _1014;
    if (_928)
    {
        float _1038 = in.m_51.z;
        _1032 = _1038;
    }
    float _1040 = _1032;
    float _1042 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1044 = 1.0 / _994;
    float _1046 = _1024 * _988;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1050 = _888 + _1048;
    if (_1014)
    {
        _1034 = 0.001000000047497451305389404296875;
    }
    float _1052 = _1034;
    float _1054 = _1042 * _946;
    float _1056 = 0.0;
    if (!_1014)
    {
        _1056 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1058 = _1056;
    float _1060 = 0.0;
    float _1062 = _1058;
    if (!_906)
    {
        float _1064 = in.m_51.z;
        _1060 = _1064;
    }
    float _1066 = _1060;
    float _1068 = 0.0;
    float _1070 = _1066;
    if (!_1014)
    {
        _1068 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1072 = _1068;
    float _1074 = _1030 * _1020;
    float _1076 = _1072;
    if (_1014)
    {
        float _1078 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1062 = _1078;
    }
    float _1080 = _1062;
    float _1082 = in.m_57.x;
    float _1084 = -_1080;
    float _1086 = _962 * _1084;
    float _1088 = _1082;
    if (_1014)
    {
        float _1090 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1076 = _1090;
    }
    float _1092 = _1076;
    float _1094 = _1050 * _1044;
    float _1096 = _1044;
    if (!_1014)
    {
        _1096 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1098 = _1096;
    float _1100 = _1098;
    if (_1014)
    {
        float _1102 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = _1052;
    if (!_906)
    {
        float _1108 = in.m_51.y;
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1112;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1116;
    float _1120 = _934 ? as_type<float>(_996) : _912;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1122;
    if (_922)
    {
        bool _1126 = _1008 > 0.5;
        _1000 = _1126;
    }
    bool _1128 = _1000;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1130;
    if (_928)
    {
        bool _1134 = _1040 > 0.5;
        _1036 = _1134;
    }
    bool _1136 = _1036;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1150;
    float _1154 = fma(_1114, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1156 = -_1104;
    float _1158 = -_1086;
    float _1160 = fma(_952, _1156, _1158);
    float _1162 = -_1104;
    float _1164 = _950 * _1162;
    bool _1166 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1168 = isnan(_888);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = fma(_1140, _1046, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1180 = fma(_1144, _1046, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1182 = fma(_1148, _1046, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1184 = fma(_1118, _1026, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1186 = fma(_1132, _1026, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1188 = fma(_1124, _1026, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1190 = fma(_1152, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1192 = -_1092;
    float _1194 = _952 * _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1196;
    float _1200 = -_1092;
    float _1202 = -_1164;
    float _1204 = fma(_962, _1200, _1202);
    bool _1206 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1208 = isnan(_888);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -_1176;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1198, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1224 = _1160 * _1160;
    float _1226 = -_1080;
    float _1228 = -_1194;
    float _1230 = fma(_950, _1226, _1228);
    float _1232 = _1216 * _1220;
    float _1234 = -_1216;
    float _1236 = _1234 + 1.0;
    float _1238 = _1216;
    if (!_906)
    {
        _1238 = _1110;
    }
    float _1240 = _1238;
    float _1242 = fma(_1204, _1204, _1224);
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1246 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1248 = isnan(_888);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1262 = fma(_1230, _1230, _1242);
    float _1264 = _1240;
    float _1266 = _1110;
    int _1268 = as_type<int>(_1260);
    if (_906)
    {
        float _1270 = in.m_51.x;
        float _1272 = in.m_51.y;
        _1264 = _1270;
        _1266 = _1272;
    }
    float _1274 = _1264;
    float _1276 = _1266;
    bool _1278 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1280 = isnan(_888);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = _1256 * _1236;
    float _1292 = -_1256;
    float _1294 = _1292 + 1.0;
    bool _1296 = _888 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1298 = isnan(_888);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = rsqrt(_1262);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1312 = _1310 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1314 = _1288 * _1294;
    float _1316 = -_1288;
    float _1318 = _1316 + 1.0;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1324 = fma(_1260, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1326 = _1322;
    float _1328 = _1324;
    if (_922)
    {
        float _1330 = -_1082;
        float _1332 = _1330 + 1.0;
        _1268 = as_type<int>(_1332);
    }
    int _1334 = _1268;
    float _1336 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1338 = _1244;
    if (!_906)
    {
        _1338 = _1066;
    }
    float _1340 = _1338;
    float _1342 = fma(_1322, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1344 = _1306 * _1318;
    float _1346 = _1340;
    float _1348 = _1342;
    if (!_922)
    {
        _1326 = _1082;
    }
    float _1350 = _1326;
    float _1352 = fma(_1312, _1094, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1354 = _1350;
    if (_922)
    {
        float _1356 = _1128 ? as_type<float>(_1334) : _1082;
        _1354 = _1356;
    }
    float _1358 = _1354;
    float _1360 = _1184 * _1344;
    float _1362 = _1186 * _1344;
    float _1364 = _1204 * _1308;
    float _1366 = _1230 * _1308;
    float _1368 = _1188 * _1344;
    if (_906)
    {
        _1346 = _1276;
    }
    float _1370 = _1346;
    float _1372 = _1054 * _952;
    if (_906)
    {
        _1070 = _1276;
    }
    float _1374 = _1070;
    float _1376 = fma(_1336, _1120, -0.5);
    bool _1378 = _1276 > 0.5;
    float _1380 = _1160 * _1308;
    float _1382 = _1054 * _962;
    float _1384 = _1054 * _950;
    float _1386 = _952 * _1380;
    float _1388 = _950 * _1366;
    float _1390 = fma(_986, _1366, _1382);
    float _1392 = fma(_986, _1364, _1372);
    float _1394 = -_1386;
    float _1396 = fma(_950, _1364, _1394);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1400 = -_1388;
    float _1402 = fma(_962, _1380, _1400);
    float _1404 = _984 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1406 = fma(_1010, _1396, _1390);
    float _1408 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1398);
    float _1410 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1412 = fma(_1010, _1402, _1392);
    float _1414 = _944 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1416 = _1404 + _1406;
    float _1418 = -_1306;
    float _1420 = _1418 + 1.0;
    int _1422 = 0;
    if (_928)
    {
        float _1424 = -_1082;
        float _1426 = _1424 + 1.0;
        _1422 = as_type<int>(_1426);
    }
    int _1428 = _1422;
    float _1430 = _1414 + _1412;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1434 = _1416 + _1432;
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1360);
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _1430 + _1440;
    float _1444 = _1434 * _1434;
    float _1446 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1368);
    float _1448 = _1430;
    if (_928)
    {
        float _1450 = _1136 ? as_type<float>(_1428) : _1082;
        _1088 = _1450;
    }
    float _1452 = _1088;
    float _1454 = _962 * _1364;
    float _1456 = fma(_1442, _1442, _1444);
    if (_940)
    {
        float _1458 = _1378 ? _974 : _912;
        _1002 = _1458;
    }
    float _1460 = _1002;
    float _1462 = fma(_1178, _1314, _1436);
    float _1464 = sqrt(_1456);
    float _1466 = fma(_1182, _1314, _1446);
    float _1468 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1472 = fma(_986, _1380, _1384);
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1476 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1362);
    float _1478 = -_1470;
    float _1480 = fma(_1410, 2.0, _1478);
    float _1482 = -_1454;
    float _1484 = fma(_952, _1366, _1482);
    float _1486 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1474);
    float _1488 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1490 = fma(_1180, _1314, _1476);
    float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1494 = fma(_1010, _1484, _1472);
    bool _1496 = _1464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1500 = fma(_1488, _1452, -0.5);
    float _1502 = fma(_1190, _1290, _1462);
    float _1504 = fma(_1154, _1290, _1490);
    float _1506 = fma(_1468, -2.0, _1498);
    float _1508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1510 = _982 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1512 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1408);
    float _1514 = -_120;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1480);
    float _1518 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1486);
    float _1520 = _1510 + _1494;
    float _1522 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1506);
    float _1524 = fma(_1324, _1232, _1502);
    float _1526 = fma(_1342, _1232, _1504);
    float _1528 = fma(_1222, _1290, _1466);
    float _1530 = fma(_1512, _1500, _1516);
    float _1532 = -_1522;
    float _1534 = fma(_1518, _1376, _1532);
    if (!_1496)
    {
        _1348 = _1416;
    }
    float _1536 = _1348;
    float _1538 = _1536;
    if (!_1496)
    {
        _1328 = _1520;
    }
    float _1540 = _1328;
    bool _1542 = !_1496;
    float _1544 = _1540;
    if (!_1542)
    {
        float _1546 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1548 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1550 = _1464 + _1548;
        float _1552 = rsqrt(_1456);
        float _1554 = _1550 * _1546;
        float _1556 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1558 = _1554 * 0.15915493667125701904296875;
        float _1560 = _1558 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        float _1564 = _1558 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = _1562 + (-1.0);
        float _1570 = fma(_1566, _1556, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1572 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1574 = _1552 * _1570;
        float _1576 = fma(_1520, _1562, _1572);
        float _1578 = fma(_1442, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1580 = fma(_1434, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1544 = _1576;
        _1448 = _1578;
        _1538 = _1580;
    }
    float _1582 = _1544;
    float _1584 = _1448;
    float _1586 = _1538;
    float _1588 = -_1510;
    float _1590 = _1588 + _1582;
    float _1592 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1594 = -_1414;
    float _1596 = _1594 + _1584;
    float _1598 = fma(_1352, _1232, _1528);
    float _1600 = _1590 * _1590;
    float _1602 = -_1404;
    float _1604 = _1602 + _1586;
    float _1606 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1524);
    float _1608 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1526);
    float _1610 = fma(_1596, _1596, _1600);
    float _1612 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1598);
    float _1614 = _1592 * _1492;
    float _1616 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1618 = fma(_1604, _1604, _1610);
    float _1620 = _1606 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1622 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1624 = _1612 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1626 = sqrt(_1618);
    float _1628 = _1616 * _1508;
    float _1630 = _1530 + 0.5;
    float _1632 = _1534 + 0.5;
    float _1634 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1636 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1614;
    out.m_59.y = _1628;
    out.m_59.z = _1630;
    out.m_59.w = _1632;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1640 = _1626 > 0.0;
    out.m_63.x = _1634;
    out.m_63.y = _1636;
    out.m_63.z = _1638;
    bool _1642 = !_1640;
    float _1644 = 1.0;
    float _1646 = 1.0;
    float _1648 = _1614;
    float _1650 = _1614;
    float _1652 = _1584;
    float _1654 = _1582;
    float _1656 = _1586;
    float _1658 = 1.0;
    float _1660 = 1.0;
    float _1662 = _1614;
    float _1664 = _1630;
    if (!_1642)
    {
        bool _1666 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1668 = 1.0;
        if (_1666)
        {
            float _1670 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1668 = _1670;
        }
        float _1672 = _1668;
        if (_1666)
        {
            _1644 = _910;
        }
        float _1674 = _1644;
        float _1676 = _1672;
        float _1678 = _1674;
        if (_1666)
        {
            float _1680 = _1672 * _594;
            _1646 = _1680;
        }
        float _1682 = _1646;
        float _1684 = _1682;
        float _1686 = _1682;
        if (_1666)
        {
            float _1688 = _1672 * _592;
            _1004 = _1688;
        }
        float _1690 = _1004;
        float _1692 = _1690;
        if (_1666)
        {
            float _1694 = _1672 * _596;
            _1676 = _1694;
        }
        float _1696 = _1676;
        float _1698 = _1696;
        if (!_1666)
        {
            float _1700 = _120 + 1.0;
            float _1702 = _1700;
            if (!_162)
            {
                float _1704 = _1700 * _1700;
                float _1706 = _1704 * 0.5;
                _1684 = _1706;
            }
            float _1708 = _1684;
            float _1710 = _1708;
            if (!_162)
            {
                float _1712 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1710 = _1712;
            }
            float _1714 = _1710;
            bool _1716 = !_162;
            float _1718 = _1714;
            if (!_1716)
            {
                float _1720 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1722 = log2(_1720);
                float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1726 = _1724 + 1.0;
                float _1728 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1730 = _1722 * _1700;
                float _1732 = 1.0 / _1726;
                float _1734 = _1728 * 0.693147182464599609375;
                float _1736 = exp2(_1730);
                float _1738 = 1.0 / _1734;
                float _1740 = _1736 + (-1.0);
                float _1742 = -_1740;
                float _1744 = fma(_1742, _1738, _1700);
                float _1746 = _1744 * _1732;
                float _1748 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1718 = _1748;
                _1648 = _1726;
            }
            float _1750 = _1718;
            float _1752 = _1648;
            float _1754 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1756 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1758 = !_162;
            float _1760 = _1752;
            if (!_1758)
            {
                float _1762 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1764 = log2(_1762);
                float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1768 = _1766 + 1.0;
                float _1770 = 1.0 / _1768;
                float _1772 = _1764 * _1700;
                float _1774 = exp2(_1772);
                float _1776 = -_1774;
                float _1778 = _1776 + 1.0;
                float _1780 = _1778 * _1770;
                _1702 = _1780;
                _1760 = _1772;
            }
            float _1782 = _1702;
            float _1784 = _1760;
            float _1786 = fma(_1782, _148, _1756);
            float _1788 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1790 = fma(_1782, _146, _1754);
            float _1792 = -_346;
            float _1794 = _1792 + _1786;
            float _1796 = fma(_1782, _150, _1788);
            float _1798 = -_352;
            float _1800 = _1798 + _1790;
            float _1802 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1804 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1806 = -_360;
            float _1808 = _1806 + _1796;
            float _1810 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1812 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1802);
            float _1814 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1804);
            float _1816 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1810);
            float _1818 = fma(_1808, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1812);
            float _1820 = fma(_1808, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1814);
            float _1822 = fma(_1808, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1816);
            float _1824 = _1818 * _1818;
            float _1826 = fma(_1820, _1820, _1824);
            float _1828 = fma(_1822, _1822, _1826);
            _1678 = _1828;
            _602 = _1818;
            _604 = _1820;
            _606 = _1822;
            _1686 = _1820;
            _1692 = _1818;
            _1698 = _1822;
            _190 = _1808;
            _1650 = _1784;
        }
        float _1830 = _1678;
        float _1832 = _602;
        float _1834 = _604;
        float _1836 = _606;
        float _1838 = _1686;
        float _1840 = _1692;
        float _1842 = _1698;
        float _1844 = _190;
        float _1846 = _1650;
        float _1848 = sqrt(_1830);
        float _1850 = rsqrt(_1618);
        bool _1852 = _1848 > 0.0;
        float _1854 = _1596 * _1850;
        float _1856 = _1590 * _1850;
        float _1858 = _1604 * _1850;
        bool _1860 = !_1852;
        _1658 = _1838;
        _1660 = _1842;
        _192 = _1844;
        _1662 = _1846;
        if (!_1860)
        {
            float _1862 = rsqrt(_1830);
            float _1864 = _1862 * _1832;
            float _1866 = _1862 * _1834;
            float _1868 = _1862 * _1836;
            float _1870 = _1856 * _1864;
            float _1872 = fma(_1854, _1866, _1870);
            float _1874 = fma(_1858, _1868, _1872);
            float _1876 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1878 = fma(_1838, _1876, _1584);
            float _1880 = fma(_1840, _1876, _1582);
            float _1882 = fma(_1842, _1876, _1586);
            _1652 = _1878;
            _1654 = _1880;
            _1656 = _1882;
            _192 = _1864;
        }
    }
    float _1884 = _1652;
    float _1886 = _1654;
    float _1888 = _1656;
    float _1890 = _1658;
    float _1892 = _1660;
    float _1894 = _192;
    float _1896 = _1662;
    bool _1898 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan(0.5);
    bool _1906 = _1902 || _1904;
    float _1908 = _1894;
    float _1910 = _1892;
    float _1912 = _1890;
    float _1914 = _1896;
    if (_1906)
    {
        _1908 = _1884;
    }
    float _1916 = _1908;
    float _1918 = _1916;
    if (_1906)
    {
        _1910 = _1886;
    }
    float _1920 = _1910;
    float _1922 = _1920;
    if (_1906)
    {
        _1912 = _1888;
    }
    float _1924 = _1912;
    float _1926 = _1924;
    if (!_1906)
    {
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1930 = _1510 + _1928;
        float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1934 = _1414 + _1932;
        float _1936 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1938 = -_1414;
        float _1940 = _1938 + _1884;
        float _1942 = _1930 * _1930;
        float _1944 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1946 = _1404 + _1944;
        float _1948 = -_1510;
        float _1950 = _1948 + _1886;
        float _1952 = fma(_1934, _1934, _1942);
        float _1954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1956 = fma(_1946, _1946, _1952);
        float _1958 = sqrt(_1956);
        float _1960 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1962 = -_1404;
        float _1964 = _1962 + _1888;
        float _1966 = precise::min(_1958, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1968 = _1966 * _1954;
        float _1970 = _1960 * _1968;
        float _1972 = fma(_1940, _1970, _1414);
        float _1974 = fma(_1950, _1970, _1510);
        float _1976 = fma(_1964, _1970, _1404);
        _1922 = _1974;
        _1918 = _1972;
        _1926 = _1976;
    }
    float _1978 = _1922;
    float _1980 = _1918;
    float _1982 = _1926;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1986 = _1978 + _1984;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1990 = _1980 + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1994 = _1982 + _1992;
    float _1996 = _1986 * _1986;
    float _1998 = fma(_1990, _1990, _1996);
    float _2000 = fma(_1994, _1994, _1998);
    float _2002 = rsqrt(_2000);
    float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2006 = _1990 * _2004;
    float _2008 = _1994 * _2004;
    float _2010 = _2006 * _2006;
    float _2012 = _2008 * _2008;
    float _2014 = _2010 + _2012;
    float _2016 = sqrt(_2014);
    bool _2018 = _2016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2022 = _2016 + _2020;
    float _2024 = _2002;
    float _2026 = _2022;
    float _2028 = _1986;
    float _2030 = _2004;
    float _2032 = _2006;
    if (_2018)
    {
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2024 = _2034;
    }
    float _2036 = _2024;
    if (_2018)
    {
        float _2038 = rsqrt(_2014);
        _1914 = _2038;
    }
    float _2040 = _1914;
    float _2042 = _2040;
    if (_2018)
    {
        float _2044 = _2022 * _2036;
        _2026 = _2044;
    }
    float _2046 = _2026;
    if (_2018)
    {
        float _2048 = _2046 * 0.15915493667125701904296875;
        _1664 = _2048;
    }
    float _2050 = _1664;
    float _2052 = _2036;
    if (_2018)
    {
        float _2054 = _2050 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        _2052 = _2056;
    }
    float _2058 = _2052;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2062 = precise::max(0.0, _2060);
    float _2064 = _1994;
    float _2066 = _2062;
    if (_2018)
    {
        float _2068 = _2050 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        _2064 = _2070;
    }
    float _2072 = _2064;
    float _2074 = -_2004;
    float _2076 = -_2062;
    float _2078 = fma(_1986, _2074, _2076);
    if (!_2018)
    {
        _2028 = _2010;
    }
    float _2080 = _2028;
    float _2082 = _2080;
    if (_2018)
    {
        float _2084 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2066 = _2084;
    }
    float _2086 = _2066;
    float _2088 = sqrt(_2000);
    float _2090 = _2058;
    float _2092 = _2086;
    if (_2018)
    {
        float _2094 = fma(_2058, _2086, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2090 = _2094;
    }
    float _2096 = _2090;
    float _2098 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2100 = _2096;
    if (_2018)
    {
        float _2102 = _2072 + (-1.0);
        _2092 = _2102;
    }
    float _2104 = _2092;
    float _2106 = _2104;
    if (_2018)
    {
        float _2108 = _2040 * _2096;
        _426 = _2108;
    }
    float _2110 = _426;
    if (!_2018)
    {
        _2042 = _2078;
    }
    float _2112 = _2042;
    float _2114 = _2112;
    if (_2018)
    {
        float _2116 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2030 = _2116;
    }
    float _2118 = _2030;
    if (_2018)
    {
        float _2120 = _2006 * _2110;
        _2032 = _2120;
    }
    float _2122 = _2032;
    if (!_2018)
    {
        _2100 = _2008;
    }
    float _2124 = _2100;
    float _2126 = _2124;
    if (_2018)
    {
        float _2128 = _2008 * _2110;
        _2126 = _2128;
    }
    float _2130 = _2126;
    if (_2018)
    {
        float _2132 = fma(_2078, _2072, _2118);
        _2114 = _2132;
    }
    float _2134 = _2114;
    if (_2018)
    {
        float _2136 = _2122 * _2122;
        _2082 = _2136;
    }
    float _2138 = _2082;
    if (!_2018)
    {
        _2106 = _2012;
    }
    float _2140 = _2106;
    float _2142 = _2140;
    if (_2018)
    {
        float _2144 = _2130 * _2130;
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = fma(_2134, _2134, _2138);
    float _2150 = _2148 + _2146;
    float _2152 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2156 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2154);
    float _2158 = precise::clamp(_2156, 0.0, 1.0);
    float _2160 = rsqrt(_2150);
    float _2162 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2152);
    float _2164 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2166 = -_2158;
    float _2168 = _2166 + 1.0;
    float _2170 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2162);
    float _2172 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2174 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2164);
    float _2176 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2178 = abs(_2168);
    float _2180 = log2(_2178);
    float _2182 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2172);
    float _2184 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2174);
    float _2186 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2176);
    float _2188 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2190 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2182);
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2194 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2186);
    float _2196 = _2160 * _2122;
    float _2198 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2200 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2202 = _2160 * _2134;
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2206 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2208 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2200);
    float _2210 = _2160 * _2130;
    float _2212 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2214 = -_2204;
    float _2216 = fma(_2202, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2214);
    float _2218 = -_2206;
    float _2220 = fma(_2218, _2098, 1.0);
    float _2222 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2224 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2208);
    float _2226 = exp2(_2212);
    float _2228 = -_2210;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2216);
    float _2232 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2234 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2224);
    float _2236 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2238 = fma(_2230, -0.5, 0.5);
    float _2240 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2232);
    float _2242 = fma(_2230, 0.5, 0.5);
    float _2244 = log2(_2220);
    float _2246 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2236);
    float _2248 = _2202 + 1.0;
    float _2250 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2240);
    float _2252 = fma(_2242, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2254 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2246);
    float _2256 = 1.0 / _2234;
    float _2258 = -_2202;
    float _2260 = fma(_2226, _2248, _2258);
    float _2262 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2250);
    float _2264 = fma(_2242, _2252, -0.212114393711090087890625);
    float _2266 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2254);
    float _2268 = fma(_2260, 0.5, 0.5);
    float _2270 = fma(_2242, _2264, 1.570728778839111328125);
    float _2272 = sqrt(_2238);
    float _2274 = _2244 * 0.693147182464599609375;
    float _2276 = _2262 * _2256;
    float _2278 = _2266 * _2256;
    float _2280 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2282 = fma(_2276, 0.5, 0.5);
    float _2284 = fma(_2278, -0.5, 0.5);
    float _2286 = _2272 * 0.636619746685028076171875;
    float3 _5965 = float3(_2282, _2284, _2280);
    float _2288 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5965, float3(0.0), isnan(_5965)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5965, float3(0.0), isnan(_5965)), level(0.0)).x;
    float3 _5976 = float3(_2282, _2284, _2280);
    float4 _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5976, float3(0.0), isnan(_5976)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5976, float3(0.0), isnan(_5976)), level(0.0)).xyzw;
    float _2293 = _2291.x;
    float _2295 = _2291.y;
    float _2297 = _2291.z;
    float _2299 = _2291.w;
    float _2301 = -_2270;
    float _2303 = fma(_2286, _2301, 1.0);
    float2 _5998 = float2(_2303, _2268);
    float3 _2307 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _2309 = _2307.x;
    float _2311 = _2307.y;
    float _2313 = _2307.z;
    float _2315 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2317 = _2192 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2319 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2317);
    float _2321 = exp2(_2315);
    float _2323 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2319);
    float _2325 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2323);
    float _2327 = _2325 + _2234;
    out.gl_Position.x = _2262;
    out.gl_Position.y = _2266;
    out.gl_Position.z = _2325;
    out.gl_Position.w = _2234;
    float _2329 = -_2321;
    float _2331 = _2329 + 1.0;
    float _2333 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2335 = _2327 * 0.5;
    float _2337 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _2333;
    out.m_65.z = _2335;
    out.m_65.w = _2234;
    float _2339 = _2337 * _2288;
    float _2341 = -_2337;
    float _2343 = _2341 + 1.0;
    float _2345 = _2299 * _2339;
    float _2347 = _2313 * _2339;
    float _2349 = fma(_2309, _2345, _2293);
    float _2351 = fma(_2311, _2345, _2295);
    float _2353 = _2299 * _2343;
    float _2355 = fma(_2299, _2347, _2297);
    out.m_67.x = _2349;
    out.m_67.y = _2351;
    out.m_67.z = _2355;
    out.m_67.w = _2353;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

