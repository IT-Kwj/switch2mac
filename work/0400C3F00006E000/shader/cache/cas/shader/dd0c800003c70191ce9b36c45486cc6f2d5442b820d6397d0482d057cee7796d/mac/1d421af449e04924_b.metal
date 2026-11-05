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
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2528 = as_type<float>(_104);
        out.gl_Position.z = _2528;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _142 = _138 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_144);
        out.gl_Position.z = _2599;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    float _152 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = 0.0;
    float _166 = _152;
    if (!_162)
    {
        float _168 = _152 * _152;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = 0.0;
    float _176 = _172;
    if (!_162)
    {
        float _178 = _122 * _122;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    if (!_162)
    {
        float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _184;
    }
    float _186 = _176;
    bool _188 = !_162;
    float _190 = 0.0;
    float _192 = _186;
    if (!_188)
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
        _190 = _210;
        _192 = _222;
        _140 = _208;
    }
    float _224 = _190;
    float _226 = _192;
    float _228 = _140;
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
        _166 = _254;
    }
    float _256 = _232;
    float _258 = _234;
    float _260 = _166;
    float _262 = _258;
    float _264 = _256;
    if (!_162)
    {
        _262 = _122;
    }
    float _266 = _262;
    float _268 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _266;
    if (!_162)
    {
        float _272 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _272;
    }
    float _274 = _264;
    bool _276 = !_162;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _122 * _282;
        float _292 = exp2(_290);
        float _294 = _288 * 0.693147182464599609375;
        float _296 = 1.0 / _294;
        float _298 = 1.0 / _286;
        float _300 = _292 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _296, _122);
        float _306 = _304 * _298;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
    }
    float _310 = _278;
    bool _312 = !_162;
    if (!_312)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _122 * _316;
        float _326 = exp2(_324);
        float _328 = -_326;
        float _330 = _328 + 1.0;
        float _332 = _330 * _322;
        _270 = _332;
    }
    float _334 = _270;
    float _336 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _342 = fma(_260, _148, _268);
    float _344 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_334, _148, _336);
    float _348 = fma(_260, _146, _338);
    float _350 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_334, _146, _344);
    float _354 = -_346;
    float _356 = _342 + _354;
    float _358 = fma(_260, _150, _340);
    float _360 = fma(_334, _150, _350);
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
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _402 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_348, _368, _388);
    float _416 = fma(_342, _368, _390);
    float _418 = fma(_358, _368, _392);
    float _420 = _400;
    float _422 = _396;
    float _424 = _402;
    if (!_412)
    {
        bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _428 = !_426;
        if (!_428)
        {
            float _430 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _430);
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _440);
            float _448 = _442 * _442;
            float _450 = fma(_444, _444, _448);
            float _452 = fma(_446, _446, _450);
            float _454 = rsqrt(_452);
            float _456 = _454 * 9.9999999747524270787835121154785e-07;
            float _458 = _444 * _456;
            float _460 = _442 * _456;
            float _462 = _446 * _456;
            _420 = _460;
            _422 = _458;
            _424 = _462;
            _464 = true;
        }
        else
        {
            float _466 = _148 * _148;
            float _468 = fma(_146, _146, _466);
            float _470 = fma(_150, _150, _468);
            float _472 = sqrt(_470);
            bool _474 = _472 >= 9.9999999747524270787835121154785e-07;
            bool _476 = isnan(_472);
            bool _478 = _474 || _476;
            bool _480 = isnan(9.9999999747524270787835121154785e-07);
            bool _482 = _478 || _480;
            if (!_482)
            {
                float _484 = _390 * _390;
                float _486 = fma(_388, _388, _484);
                float _488 = fma(_392, _392, _486);
                float _490 = sqrt(_488);
                bool _492 = _490 >= 9.9999999747524270787835121154785e-07;
                bool _494 = isnan(_490);
                bool _496 = _492 || _494;
                bool _498 = isnan(9.9999999747524270787835121154785e-07);
                bool _500 = _496 || _498;
                if (!_500)
                {
                    float _502 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _502);
                    float _506 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _504);
                    float _508 = rsqrt(_506);
                    float _510 = _508 * 9.9999999747524270787835121154785e-07;
                    float _512 = _510 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _514 = _510 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _516 = _510 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _420 = _514;
                    _422 = _512;
                    _424 = _516;
                    _464 = true;
                }
                else
                {
                    float _518 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _522 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _524 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _518);
                    float _526 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
                    float _528 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
                    float _530 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
                    float _536 = _530 * _530;
                    float _538 = fma(_532, _532, _536);
                    float _540 = fma(_534, _534, _538);
                    float _542 = rsqrt(_540);
                    float _544 = _542 * 9.9999999747524270787835121154785e-07;
                    float _546 = _532 * _544;
                    float _548 = _530 * _544;
                    float _550 = _534 * _544;
                    _420 = _548;
                    _422 = _546;
                    _424 = _550;
                    _464 = true;
                }
            }
            else
            {
                float _552 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _554 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _556 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _558 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _552);
                float _560 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
                float _562 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
                float _564 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _558);
                float _566 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
                float _568 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
                float _570 = _564 * _564;
                float _572 = fma(_566, _566, _570);
                float _574 = fma(_568, _568, _572);
                float _576 = rsqrt(_574);
                float _578 = _576 * 9.9999999747524270787835121154785e-07;
                float _580 = _566 * _578;
                float _582 = _564 * _578;
                float _584 = _568 * _578;
                _420 = _582;
                _422 = _580;
                _424 = _584;
            }
        }
    }
    _464 = false;
    float _586 = _420;
    float _588 = _422;
    float _590 = _424;
    float _592 = in.m_51.x;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _596 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _610 = _608 != 0;
    float _612 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _616 = _596 * _594;
    float _618 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _622 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _624 = _622 != 0;
    float _626 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[20].x, _616);
    out.m_53.x = _612;
    out.m_53.y = _618;
    out.m_53.z = _620;
    out.m_53.w = _614;
    float _628 = _626 * 6.283185482025146484375;
    float _630 = floor(_626);
    float _632 = _628 * 0.15915493667125701904296875;
    bool _634 = !_606;
    int _636 = _634 ? 0 : 1;
    int _638 = abs(_636);
    float _640 = _632 * 6.283185482025146484375;
    float _642 = cos(_640);
    bool _644 = !_624;
    int _646 = _644 ? 0 : 1;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    int _650 = abs(_646);
    float _652 = -_630;
    float _654 = _626 + _652;
    bool _656 = !_610;
    int _658 = _656 ? 0 : 1;
    float _660 = float(_638);
    int _662 = abs(_658);
    float _664 = -_654;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _668 = _654 < 0.5;
    float _670 = float(_668);
    float _672 = fma(_642, 0.5, 0.5);
    float _674 = abs(_666);
    float _676 = _660 * _674;
    float _678 = -_670;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = float(_650);
    float _684 = -_672;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _688 = float(_662);
    float _690 = fma(_682, _686, _676);
    float _692 = abs(_680);
    float _694 = fma(_688, _692, _690);
    bool _696 = !_648;
    float _712;
    if (!_696)
    {
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _700 = _592 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_88);
        float _718 = 1.0 / _716;
        float _720 = _122 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = in.m_51.y;
    float _726 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _728 = log2(_726);
    float _730 = _592 * 2.0;
    float _732 = in.m_51.z;
    float _734 = _586 * _586;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _738 = floor(_730);
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _744 = isnan(0.0);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _750 = _746 || _748;
    float _752 = fma(_588, _588, _734);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _756 = 1.0 + _754;
    bool _758 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(1.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    float _768 = _728 * _122;
    float _770 = _592 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _772 = 1.0 / _756;
    float _774 = -_740;
    float _776 = fma(_770, 2.0, _774);
    float _778 = _724 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _780 = _724 * 2.0;
    float _782 = exp2(_768);
    float _784 = fma(_778, -2.0, _736);
    float _786 = _732 * 2.0;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _790 = _738 > 0.0;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _794 = _738 >= 0.0;
    bool _796 = isnan(_738);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[78].w, _788);
    float _806 = floor(_786);
    float _808 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[78].z, _792);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _820 = _818 != 0;
    float _822 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _804);
    float _824 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    float _826 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _808);
    float _828 = -_122;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _776);
    float _832 = fma(_590, _590, _752);
    float _834 = -_782;
    float _836 = _834 + 1.0;
    float _838 = floor(_780);
    bool _840 = !_812;
    int _842 = _840 ? 0 : 1;
    float _844 = _592 + _724;
    float _846 = _750 ? _836 : 0.0;
    float _848 = _844 + (-1.0);
    bool _850 = _806 >= 0.0;
    bool _852 = isnan(_806);
    bool _854 = _850 || _852;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    if (_766)
    {
        float _862 = _846 * _772;
        _124 = _862;
    }
    float _864 = _124;
    int _866 = _858 ? 0 : 1;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _878 = _876 != 0;
    int _880 = _802 ? 0 : 1;
    float _882 = rsqrt(_832);
    bool _884 = _806 > 0.0;
    float _886 = _724 + _732;
    int _888 = ~_880;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    int _894 = _892;
    if (!_790)
    {
        int _896 = ~_880;
        int _898 = _896 + 1;
        _894 = _898;
    }
    int _900 = _894;
    float _902 = _886 + (-1.0);
    bool _904 = _838 > 0.0;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _908 = ~_866;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _916 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _918 = _864 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _920 = float(_900);
    int _922 = _912;
    if (!_884)
    {
        int _924 = ~_866;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    float _930 = _918 * _860;
    float _932 = _864 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _934 = _838 >= 0.0;
    bool _936 = isnan(_838);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _882 * _588;
    float _946 = _882 * _586;
    float _948 = _882 * _590;
    float _950 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[203].x, _930);
    bool _952 = !_816;
    int _954 = _952 ? 0 : 1;
    float _956 = _932 * _906;
    int _958 = _942 ? 0 : 1;
    float _960 = floor(_950);
    bool _962 = !_820;
    int _964 = _962 ? 0 : 1;
    float _966 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[203].z, _956);
    bool _968 = !_878;
    int _970 = _968 ? 0 : 1;
    float _972 = _950 + 0.25;
    int _974 = ~_958;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = floor(_966);
    int _994 = _978;
    float _996 = _948;
    if (!_904)
    {
        int _998 = ~_958;
        int _1000 = _998 + 1;
        _994 = _1000;
    }
    int _1002 = _994;
    float _1004 = in.m_55.x;
    float _1006 = in.m_55.y;
    float _1008 = in.m_55.z;
    bool _1010 = !_986;
    int _1012 = _1010 ? 0 : 1;
    bool _1014 = !_990;
    int _1016 = _1014 ? 0 : 1;
    int _1018 = abs(_1012);
    float _1020 = -_960;
    float _1022 = _950 + _1020;
    float _1024 = float(_928);
    float _1026 = _950 * 6.283185482025146484375;
    float _1028 = floor(_972);
    float _1030 = float(_1018);
    int _1032 = abs(_1016);
    float _1034 = _966 + 0.25;
    float _1036 = float(_1002);
    float _1038 = _1030 * _920;
    float _1040 = -_992;
    float _1042 = _966 + _1040;
    float _1044 = floor(_1034);
    float _1046 = float(_1032);
    float _1048 = _1038 * (-2.0);
    bool _1050 = _1022 >= 0.5;
    bool _1052 = isnan(_1022);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    float _1060 = _724 + (-0.5);
    bool _1062 = _1042 >= 0.5;
    bool _1064 = isnan(_1042);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.5);
    bool _1070 = _1066 || _1068;
    float _1072 = _966 * 6.283185482025146484375;
    float _1074 = fma(_1048, _1006, _1006);
    float _1076 = _1046 * _1036;
    float _1078 = -_1028;
    float _1080 = _972 + _1078;
    float _1082 = fma(_914, _1048, _914);
    float _1084 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1074);
    float _1086 = _1026 * 0.15915493667125701904296875;
    float _1088 = _1072 * 0.15915493667125701904296875;
    int _1090 = abs(_954);
    float _1092 = _1076 * (-2.0);
    bool _1094 = !_874;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = -_1044;
    float _1100 = _1034 + _1098;
    float _1102 = _1086 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    int _1106 = abs(_842);
    float _1108 = fma(_1082, _864, _1084);
    int _1110 = abs(_1096);
    float _1112 = _1108 * 0.15915493667125701904296875;
    bool _1114 = !_870;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = _1088 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    bool _1122 = !_1058;
    float _1124 = _1122 ? 0.5 : (-0.5);
    bool _1126 = _1080 > 0.5;
    bool _1128 = !_1070;
    float _1130 = _1128 ? 0.5 : (-0.5);
    int _1132 = abs(_1116);
    float _1134 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1136 = float(_1090);
    float _1138 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1140 = _1138 * 2.0;
    float _1142 = float(_1110);
    float _1144 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1146 = _1144 * 2.0;
    int _1148 = abs(_964);
    float _1150 = _1136 * _1146;
    float _1152 = float(_1106);
    float _1154 = _1142 * _1140;
    float _1156 = float(_1132);
    float _1158 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1160 = _1080;
    float _1162 = _1100;
    if (_1126)
    {
        float _1164 = -_1080;
        float _1166 = _1164 + 1.0;
        _1160 = _1166;
    }
    float _1168 = _1160;
    bool _1170 = _1100 > 0.5;
    float _1172 = fma(_1152, _1134, _1150);
    float _1174 = fma(_1156, _1158, _1154);
    bool _1176 = !_982;
    int _1178 = _1176 ? 0 : 1;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1182 = _948 * _1180;
    float _1184 = fma(_1168, 4.0, -1.0);
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1188 = _946 * _1186;
    int _1190 = abs(_1178);
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1194 = -_1182;
    float _1196 = fma(_944, _1192, _1194);
    float _1198 = float(_1148);
    float _1200 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1204 = -_1188;
    float _1206 = fma(_948, _1202, _1204);
    float _1208 = float(_1190);
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1212 = _944 * _1210;
    float _1214 = _1196 * _1196;
    float _1216 = fma(_1198, _1200, _1172);
    if (_1170)
    {
        float _1218 = -_1100;
        float _1220 = _1218 + 1.0;
        _1162 = _1220;
    }
    float _1222 = _1162;
    int _1224 = abs(_970);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1228 = -_1212;
    float _1230 = fma(_946, _1226, _1228);
    float _1232 = fma(_1206, _1206, _1214);
    float _1234 = _1208 * _1024;
    float _1236 = fma(_1216, 3.1415927410125732421875, _1004);
    float _1238 = fma(_1222, 4.0, -1.0);
    float _1240 = fma(_1230, _1230, _1232);
    float _1242 = float(_1224);
    float _1244 = _1234 * (-2.0);
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1248 = _592 + (-0.5);
    float _1250 = fma(_1236, _1244, _1236);
    float _1252 = fma(_1242, _1246, _1174);
    float _1254 = fma(_916, _1244, _916);
    float _1256 = _592 + _732;
    float _1258 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1250);
    float _1260 = fma(_1252, 3.1415927410125732421875, _1008);
    float _1262 = _732 + (-0.5);
    float _1264 = in.m_49.x;
    float _1266 = in.m_49.y;
    float _1268 = in.m_49.z;
    float _1270 = _1256 + (-1.0);
    float _1272 = fma(_1260, _1092, _1260);
    float _1274 = fma(_1254, _864, _1258);
    float _1276 = rsqrt(_1240);
    float _1278 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1280 = in.m_57.x;
    float _1282 = in.m_57.y;
    float _1284 = in.m_57.z;
    float _1286 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1272);
    float _1288 = _1274 * 0.15915493667125701904296875;
    float _1290 = fma(_1278, _1092, _1278);
    bool _1292 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1294 = isnan(0.5);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1300 = _1296 || _1298;
    float _1302 = _1112 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = fma(_1290, _864, _1286);
    float _1308 = _1306 * 0.15915493667125701904296875;
    float _1310 = _1112 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = _1230 * _1276;
    float _1316 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1320 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1322 = _1288 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1280);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1284);
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1334 = _1206 * _1276;
    float _1336 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1282);
    float _1340 = _1308 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = _1332 * _1330;
    float _1346 = _1326 * _1328;
    float _1348 = _1336 * _1338;
    float _1350 = _1196 * _1276;
    float _1352 = _1288 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1324 * _1304;
    float _1358 = _1324 * _1312;
    float _1360 = _1308 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = _1324 * _1342;
    float _1366 = _1354 * _1312;
    float _1368 = _1354 * _1304;
    float _1370 = _1354 * _1342;
    float _1372 = _1312 * _1342;
    float _1374 = _1304 * _1342;
    float _1376 = _1370 * _944;
    float _1378 = _1370 * _948;
    float _1380 = fma(_1362, _1366, _1356);
    float _1382 = -_1368;
    float _1384 = fma(_1362, _1358, _1382);
    float _1386 = -_1358;
    float _1388 = fma(_1362, _1368, _1386);
    float _1390 = fma(_1362, _1356, _1366);
    float _1392 = -_1362;
    float _1394 = fma(_1392, _1334, _1376);
    float _1396 = _946 * _1314;
    float _1398 = _944 * _1350;
    float _1400 = -_1362;
    float _1402 = fma(_1400, _1314, _1378);
    float _1404 = _1380 * _944;
    float _1406 = _1388 * _948;
    float _1408 = -_1396;
    float _1410 = fma(_948, _1350, _1408);
    float _1412 = -_1398;
    float _1414 = fma(_946, _1334, _1412);
    float _1416 = fma(_1372, _1334, _1404);
    float _1418 = _1380 * _948;
    float _1420 = fma(_1374, _1314, _1406);
    float _1422 = _1388 * _944;
    float _1424 = fma(_1384, _1410, _1416);
    float _1426 = fma(_1372, _1314, _1418);
    float _1428 = fma(_1364, _1414, _1402);
    float _1430 = fma(_1390, _1414, _1420);
    float _1432 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1434 = fma(_1374, _1334, _1422);
    float _1436 = fma(_1384, _1414, _1426);
    float _1438 = _1348 * _1428;
    float _1440 = fma(_1364, _1410, _1394);
    float _1442 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1444 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1432);
    float _1446 = fma(_1390, _1410, _1434);
    float _1448 = fma(_1346, _1436, _1438);
    float _1450 = _1348 * _1440;
    float _1452 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1442);
    float _1454 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1444);
    float _1456 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1458 = fma(_1344, _1430, _1448);
    float _1460 = fma(_1346, _1424, _1450);
    float _1462 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1452);
    float _1464 = _1454 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1466 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1456);
    float _1468 = fma(_1344, _1446, _1460);
    float _1470 = _1462 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1472 = _1464 + _1458;
    float _1474 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1466);
    float _1476 = _1370 * _946;
    float _1478 = _1470 + _1468;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1482 = _1472 + _1480;
    float _1484 = _1474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1486 = _1380 * _946;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1490 = _1478 + _1488;
    float _1492 = _1482 * _1482;
    float _1494 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1496 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1498 = -_1362;
    float _1500 = fma(_1498, _1350, _1476);
    float _1502 = fma(_1490, _1490, _1492);
    float _1504 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1494);
    float _1506 = _948 * _1334;
    float _1508 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1496);
    float _1510 = sqrt(_1502);
    float _1512 = _1388 * _946;
    float _1514 = -_1506;
    float _1516 = fma(_944, _1314, _1514);
    float _1518 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1508);
    float _1520 = fma(_1372, _1350, _1486);
    float _1522 = fma(_1374, _1350, _1512);
    float _1524 = fma(_1364, _1516, _1500);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1528 = fma(_1384, _1516, _1520);
    float _1530 = fma(_1390, _1516, _1522);
    float _1532 = _1348 * _1524;
    float _1534 = 1.0 / _1526;
    float _1536 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1504);
    float _1538 = _1362;
    float _1540 = _1472;
    float _1542 = _1350;
    float _1544 = _1524;
    if (_1300)
    {
        _996 = 1.0;
    }
    float _1546 = _996;
    float _1548 = fma(_1346, _1528, _1532);
    bool _1550 = _1510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1554 = fma(_1344, _1530, _1548);
    float _1556 = _1552 + _1526;
    float _1558 = _1484 + _1554;
    float _1560 = _1556 * _1534;
    float _1562 = _1560 * 0.5;
    float _1564 = _1554;
    float _1566 = _1546;
    float _1568 = _1558;
    if (!_1550)
    {
        _1538 = _1478;
    }
    float _1570 = _1538;
    float _1572 = _1570;
    if (!_1550)
    {
        _1564 = _1558;
    }
    float _1574 = _1564;
    bool _1576 = !_1550;
    float _1578 = _1574;
    if (!_1576)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1584 = _1510 + _1582;
        float _1586 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = rsqrt(_1502);
        float _1590 = _1584 * _1580;
        float _1592 = _1590 * 0.15915493667125701904296875;
        float _1594 = _1592 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = fma(_1596, _1586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1604 = _1588 * _1602;
        float _1606 = _1600 + (-1.0);
        float _1608 = fma(_1490, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1482, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1612 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1614 = fma(_1558, _1600, _1612);
        _1578 = _1614;
        _1572 = _1608;
        _1540 = _1610;
        _1542 = _1586;
    }
    float _1616 = _1578;
    float _1618 = _1572;
    float _1620 = _1540;
    float _1622 = _1542;
    float _1624 = _1622;
    if (!_1300)
    {
        float _1626 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1628 = _1626 * 0.15915493667125701904296875;
        float _1630 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1634 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1632);
        float _1636 = _1628 * 6.283185482025146484375;
        float _1638 = cos(_1636);
        float _1640 = _1630 * 0.15915493667125701904296875;
        float _1642 = _1628 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = 1.0 / _1638;
        float _1648 = _1640 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        float _1652 = _1644 * _1646;
        float _1654 = _1640 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        float _1658 = _1650 * _1652;
        float _1660 = 1.0 / _1634;
        float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1664 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1662;
        float _1666 = 1.0 / _1658;
        float _1668 = 1.0 / _1664;
        float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1672 = _1660 * _1670;
        float _1674 = _1656 * _1666;
        float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1678 = fma(_1674, _1672, _1676);
        float _1680 = _1678 * _1668;
        float _1682 = precise::clamp(_1680, 0.0, 1.0);
        _1624 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1566 = _1682;
    }
    float _1684 = _1624;
    float _1686 = _1566;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1690 = _1616 + _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1694 = _1618 + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1698 = _1620 + _1696;
    float _1700 = _1690 * _1690;
    float _1702 = fma(_1694, _1694, _1700);
    float _1704 = fma(_1698, _1698, _1702);
    float _1706 = rsqrt(_1704);
    float _1708 = sqrt(_1704);
    float _1710 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1712 = _1694 * _1710;
    float _1714 = _1698 * _1710;
    float _1716 = _1712 * _1712;
    float _1718 = _1714 * _1714;
    float _1720 = _1716 + _1718;
    float _1722 = sqrt(_1720);
    bool _1724 = _1722 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1728 = _1722 + _1726;
    float _1730 = _1698;
    float _1732 = _1720;
    float _1734 = _1728;
    float _1736 = _1684;
    float _1738 = _1690;
    if (_1724)
    {
        float _1740 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1730 = _1740;
    }
    float _1742 = _1730;
    if (_1724)
    {
        float _1744 = rsqrt(_1720);
        _1732 = _1744;
    }
    float _1746 = _1732;
    if (_1724)
    {
        float _1748 = _1728 * _1742;
        _1734 = _1748;
    }
    float _1750 = _1734;
    if (_1724)
    {
        float _1752 = _1750 * 0.15915493667125701904296875;
        _1736 = _1752;
    }
    float _1754 = _1736;
    float _1756 = _1706;
    float _1758 = _1754;
    if (_1724)
    {
        float _1760 = _1754 * 6.283185482025146484375;
        float _1762 = sin(_1760);
        _1756 = _1762;
    }
    float _1764 = _1756;
    float _1766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1768 = precise::max(0.0, _1766);
    float _1770 = _1742;
    float _1772 = _1768;
    if (_1724)
    {
        float _1774 = _1754 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = -_1710;
    float _1782 = -_1768;
    float _1784 = fma(_1690, _1780, _1782);
    if (_1724)
    {
        float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1738 = _1786;
    }
    float _1788 = _1738;
    float _1790 = _1788;
    if (!_1724)
    {
        _1758 = _1716;
    }
    float _1792 = _1758;
    float _1794 = _1764;
    float _1796 = _1792;
    if (_1724)
    {
        float _1798 = fma(_1764, _1788, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1794 = _1798;
    }
    float _1800 = _1794;
    float _1802 = _1800;
    if (!_1724)
    {
        _1790 = _1784;
    }
    float _1804 = _1790;
    float _1806 = _1804;
    float _1808 = _1778;
    if (_1724)
    {
        float _1810 = _1778 + (-1.0);
        _1772 = _1810;
    }
    float _1812 = _1772;
    float _1814 = _1812;
    if (_1724)
    {
        float _1816 = _1746 * _1800;
        _1544 = _1816;
    }
    float _1818 = _1544;
    if (!_1724)
    {
        _1802 = _1712;
    }
    float _1820 = _1802;
    float _1822 = _1820;
    if (_1724)
    {
        float _1824 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1824;
    }
    float _1826 = _1568;
    if (_1724)
    {
        float _1828 = _1712 * _1818;
        _1822 = _1828;
    }
    float _1830 = _1822;
    if (!_1724)
    {
        _1814 = _1714;
    }
    float _1832 = _1814;
    float _1834 = _1832;
    if (_1724)
    {
        float _1836 = _1714 * _1818;
        _1834 = _1836;
    }
    float _1838 = _1834;
    if (_1724)
    {
        float _1840 = fma(_1784, _1778, _1826);
        _1806 = _1840;
    }
    float _1842 = _1806;
    if (_1724)
    {
        float _1844 = _1830 * _1830;
        _1796 = _1844;
    }
    float _1846 = _1796;
    if (!_1724)
    {
        _1808 = _1718;
    }
    float _1848 = _1808;
    float _1850 = _1848;
    if (_1724)
    {
        float _1852 = _1838 * _1838;
        _1850 = _1852;
    }
    float _1854 = _1850;
    float _1856 = fma(_1842, _1842, _1846);
    float _1858 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1860 = _1856 + _1854;
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1864 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1862);
    float _1866 = precise::clamp(_1864, 0.0, 1.0);
    float _1868 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1858);
    float _1870 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1872 = rsqrt(_1860);
    float _1874 = -_1866;
    float _1876 = _1874 + 1.0;
    float _1878 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1880 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1882 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1870);
    float _1884 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1886 = _1878 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1888 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1880);
    float _1890 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1882);
    float _1892 = abs(_1876);
    float _1894 = log2(_1892);
    float _1896 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1884);
    float _1898 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1888);
    float _1900 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1902 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1904 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1896);
    float _1906 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1908 = _1872 * _1830;
    float _1910 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1912 = _1872 * _1842;
    float _1914 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1916 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1918 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1910);
    float _1920 = _1872 * _1838;
    float _1922 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1924 = -_1916;
    float _1926 = fma(_1912, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1924);
    float _1928 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1918);
    float _1930 = -_1914;
    float _1932 = fma(_1930, _1902, 1.0);
    float _1934 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1936 = -_1920;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1926);
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1928);
    float _1942 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1944 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1938, -0.5, 0.5);
    float _1948 = log2(_1932);
    float _1950 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1942);
    float _1952 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1954 = fma(_1938, 0.5, 0.5);
    float _1956 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1950);
    float _1958 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1952);
    float _1960 = _1912 + 1.0;
    float _1962 = exp2(_1934);
    float _1964 = fma(_1954, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1966 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1956);
    float _1968 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1958);
    float _1970 = fma(_1954, _1964, -0.212114393711090087890625);
    float _1972 = 1.0 / _1940;
    float _1974 = _1948 * 0.693147182464599609375;
    float _1976 = fma(_1954, _1970, 1.570728778839111328125);
    float _1978 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1980 = sqrt(_1946);
    float _1982 = -_1912;
    float _1984 = fma(_1962, _1960, _1982);
    float _1986 = fma(_1984, 0.5, 0.5);
    float _1988 = _1966 * _1972;
    float _1990 = _1968 * _1972;
    float _1992 = fma(_1988, 0.5, 0.5);
    float _1994 = fma(_1990, -0.5, 0.5);
    float _1996 = _1980 * 0.636619746685028076171875;
    float3 _5482 = float3(_1992, _1994, _1978);
    float _1998 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5482, float3(0.0), isnan(_5482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5482, float3(0.0), isnan(_5482)), level(0.0)).x;
    float _2000 = -_1976;
    float _2002 = fma(_1996, _2000, 1.0);
    float3 _5498 = float3(_1992, _1994, _1978);
    float4 _2005 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5498, float3(0.0), isnan(_5498)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5498, float3(0.0), isnan(_5498)), level(0.0)).xyzw;
    float _2007 = _2005.x;
    float _2009 = _2005.y;
    float _2011 = _2005.z;
    float _2013 = _2005.w;
    float2 _5515 = float2(_2002, _1986);
    float3 _2017 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5515, float2(0.0), isnan(_5515)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5515, float2(0.0), isnan(_5515)), level(0.0)).xyz;
    float _2019 = _2017.x;
    float _2021 = _2017.y;
    float _2023 = _2017.z;
    float _2025 = in.m_59.y;
    float _2027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2029;
    float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2035 = _2033 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2037;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2045 = 1.0 / _2031;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2049 = _2047 != 0;
    int _2051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2053 = _2051 != 0;
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2057 = _722 + _2055;
    bool _2059 = _724 > 0.5;
    float _2061 = 1.0 / _2035;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _2063 = _592 > 0.5;
    bool _2065 = _2063 && _2053;
    float _2067 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2069 = _722 + _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2073 = _722 + _2071;
    float _2075 = 1.0 / _2039;
    float _2077 = -_2025;
    float _2079 = _2077 + 1.0;
    float _2081 = _2069 * _2045;
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _2083;
    float _2087 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2089 = _2025;
    if (_2049)
    {
        float _2091 = _2059 ? _2079 : _2025;
        _2089 = _2091;
    }
    float _2093 = _2089;
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2097 = _722 + _2095;
    float _2099 = 1.0 / _2043;
    float _2101 = in.m_59.x;
    float _2103 = _2073 * _2061;
    float _2105 = fma(_2087, _2093, -0.5);
    float _2107 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2109 = _722 + _2107;
    bool _2111 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2113 = isnan(_722);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2119 = _2115 || _2117;
    float _2121 = float(_2119);
    float _2123 = -_824;
    float _2125 = fma(_822, _2105, _2123);
    float _2127 = _2057 * _2075;
    float _2129 = 1.0 / _2085;
    bool _2131 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _2133 = isnan(_722);
    bool _2135 = _2131 || _2133;
    bool _2137 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _2139 = _2135 || _2137;
    float _2141 = float(_2139);
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2143;
    bool _2147 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2149 = isnan(_722);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2155 = _2151 || _2153;
    float _2157 = float(_2155);
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2165 = _2163 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2167 = _2097 * _2099;
    float _2169 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2169;
    float _2173 = fma(_2161, _2081, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2175;
    float _2179 = -_2141;
    float _2181 = _2179 + 1.0;
    float _2183 = fma(_2171, _2081, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2185 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2187 = _2185 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2189 = fma(_2177, _2081, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2191 = -_2157;
    float _2193 = _2191 + 1.0;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2197 = _2195 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2199 = _2157 * _2181;
    float _2201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2203 = _2121 * _2193;
    float _2205 = fma(_2187, _2103, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2207 = 0.0;
    if (_2053)
    {
        _2207 = _2101;
    }
    float _2209 = _2207;
    float _2211 = fma(_2165, _2103, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2213 = fma(_2197, _2103, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2215 = -_2121;
    float _2217 = _2215 + 1.0;
    bool _2219 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2221 = isnan(_722);
    bool _2223 = _2219 || _2221;
    bool _2225 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2227 = _2223 || _2225;
    float _2229 = float(_2227);
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2231;
    float _2235 = _2209;
    if (_2065)
    {
        float _2237 = -_2209;
        float _2239 = _2237 + 1.0;
        _2235 = _2239;
    }
    float _2241 = _2235;
    bool _2243 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2245 = isnan(_722);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2255;
    float _2259 = _2109 * _2129;
    float _2261 = -_2229;
    float _2263 = _2261 + 1.0;
    float _2265 = _2229 * _2217;
    float _2267 = _2129;
    if (!_2053)
    {
        _2267 = _2101;
    }
    float _2269 = _2267;
    float _2271 = fma(_2145, _2127, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2273 = fma(_2233, _2127, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2275 = fma(_2257, _2127, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2277 = _2269;
    if (_2053)
    {
        _2277 = _2241;
    }
    float _2279 = _2277;
    float _2281 = _2253 * _2263;
    bool _2283 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2285 = isnan(_722);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2291 = _2287 || _2289;
    float _2293 = float(_2291);
    float _2295 = -_2253;
    float _2297 = _2295 + 1.0;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2301 = _2299 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2303 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2307 = _2305 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2309 = _2293 * _2297;
    float _2311 = -_2293;
    float _2313 = _2311 + 1.0;
    float _2315 = fma(_2303, _2279, -0.5);
    float _2317 = fma(_2301, _2167, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2319 = _2189 * _2309;
    float _2321 = _2173 * _2309;
    float _2323 = fma(_826, _2315, _830);
    float _2325 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2319);
    float _2327 = _2183 * _2309;
    float _2329 = _2323 + 0.5;
    float _2331 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2321);
    float _2333 = fma(_2205, _2281, _2325);
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _2335;
    float _2339 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2327);
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2343 = _2341 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2345 = fma(_2337, _2259, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _2347 = _2125 + 0.5;
    float _2349 = fma(_2211, _2281, _2331);
    float _2351 = fma(_2213, _2281, _2339);
    float _2353 = fma(_2307, _2167, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    out.m_63.x = _2329;
    out.m_63.y = _2347;
    float _2355 = fma(_2343, _2167, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _2357 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2359 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _2357;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2363 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _2361;
    float _2365 = fma(_2271, _2265, _2333);
    float _2367 = fma(_2273, _2265, _2349);
    float _2369 = fma(_2275, _2265, _2351);
    float _2371 = fma(_2359, _2259, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _2373 = fma(_2363, _2259, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _2375 = fma(_2317, _2203, _2365);
    float _2377 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2379 = fma(_2353, _2203, _2367);
    float _2381 = fma(_2355, _2203, _2369);
    float _2383 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2385 = exp2(_2377);
    float _2387 = fma(_2345, _2199, _2375);
    float _2389 = fma(_2371, _2199, _2379);
    float _2391 = fma(_2373, _2199, _2381);
    float _2393 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2383);
    float _2395 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2397 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2387);
    float _2399 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2389);
    float _2401 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2391);
    float _2403 = _1940 * 0.5;
    float _2405 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2407 = _694 * _2395;
    float _2409 = fma(_1968, -0.5, _2403);
    float _2411 = _2397 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2413 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2415 = -_2385;
    float _2417 = _2415 + 1.0;
    float _2419 = _2401 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2421 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2405);
    bool _2423 = _1686 > 0.0;
    bool _2425 = isnan(_1686);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(0.0);
    bool _2431 = _2427 || _2429;
    float _2433 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2437 = _2411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2439 = _2413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2441 = _2419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2443 = _2421 + _1940;
    float _2445 = _1966 + _1940;
    float _2447 = _2407 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2437;
    out.m_65.y = _2439;
    out.m_65.z = _2441;
    out.m_65.w = _2435;
    float _2449 = _2443 * 0.5;
    float _2451 = _2445 * 0.5;
    out.gl_Position.x = _1966;
    out.gl_Position.y = _1968;
    out.gl_Position.z = _2421;
    out.gl_Position.w = _1940;
    out.m_67.x = _2451;
    out.m_67.y = _2409;
    out.m_67.z = _2449;
    out.m_67.w = _1940;
    out.m_45.x = _2447;
    float _2453 = _2433 * _1998;
    float _2455 = -_2433;
    float _2457 = _2455 + 1.0;
    float _2459 = _2013 * _2453;
    float _2461 = _2023 * _2453;
    float _2463 = fma(_2019, _2459, _2007);
    float _2465 = fma(_2021, _2459, _2009);
    float _2467 = _2013 * _2457;
    float _2469 = fma(_2013, _2461, _2011);
    out.m_69.x = _2463;
    out.m_69.y = _2465;
    out.m_69.z = _2469;
    out.m_69.w = _2467;
    if (_2431)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2471 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2471;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2528 = as_type<float>(_104);
        out.gl_Position.z = _2528;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _142 = _138 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_144);
        out.gl_Position.z = _2599;
    }
    if (_134)
    {
        return out;
    }
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    float _152 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = 0.0;
    float _166 = _152;
    if (!_162)
    {
        float _168 = _152 * _152;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = 0.0;
    float _176 = _172;
    if (!_162)
    {
        float _178 = _122 * _122;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    if (!_162)
    {
        float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _184;
    }
    float _186 = _176;
    bool _188 = !_162;
    float _190 = 0.0;
    float _192 = _186;
    if (!_188)
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
        _190 = _210;
        _192 = _222;
        _140 = _208;
    }
    float _224 = _190;
    float _226 = _192;
    float _228 = _140;
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
        _166 = _254;
    }
    float _256 = _232;
    float _258 = _234;
    float _260 = _166;
    float _262 = _258;
    float _264 = _256;
    if (!_162)
    {
        _262 = _122;
    }
    float _266 = _262;
    float _268 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _266;
    if (!_162)
    {
        float _272 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _272;
    }
    float _274 = _264;
    bool _276 = !_162;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _122 * _282;
        float _292 = exp2(_290);
        float _294 = _288 * 0.693147182464599609375;
        float _296 = 1.0 / _294;
        float _298 = 1.0 / _286;
        float _300 = _292 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _296, _122);
        float _306 = _304 * _298;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
    }
    float _310 = _278;
    bool _312 = !_162;
    if (!_312)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _122 * _316;
        float _326 = exp2(_324);
        float _328 = -_326;
        float _330 = _328 + 1.0;
        float _332 = _330 * _322;
        _270 = _332;
    }
    float _334 = _270;
    float _336 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _342 = fma(_260, _148, _268);
    float _344 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_334, _148, _336);
    float _348 = fma(_260, _146, _338);
    float _350 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_334, _146, _344);
    float _354 = -_346;
    float _356 = _342 + _354;
    float _358 = fma(_260, _150, _340);
    float _360 = fma(_334, _150, _350);
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
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _402 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_348, _368, _388);
    float _416 = fma(_342, _368, _390);
    float _418 = fma(_358, _368, _392);
    float _420 = _400;
    float _422 = _396;
    float _424 = _402;
    if (!_412)
    {
        bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _428 = !_426;
        if (!_428)
        {
            float _430 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _430);
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _440);
            float _448 = _442 * _442;
            float _450 = fma(_444, _444, _448);
            float _452 = fma(_446, _446, _450);
            float _454 = rsqrt(_452);
            float _456 = _454 * 9.9999999747524270787835121154785e-07;
            float _458 = _444 * _456;
            float _460 = _442 * _456;
            float _462 = _446 * _456;
            _420 = _460;
            _422 = _458;
            _424 = _462;
            _464 = true;
        }
        else
        {
            float _466 = _148 * _148;
            float _468 = fma(_146, _146, _466);
            float _470 = fma(_150, _150, _468);
            float _472 = sqrt(_470);
            bool _474 = _472 >= 9.9999999747524270787835121154785e-07;
            bool _476 = isnan(_472);
            bool _478 = _474 || _476;
            bool _480 = isnan(9.9999999747524270787835121154785e-07);
            bool _482 = _478 || _480;
            if (!_482)
            {
                float _484 = _390 * _390;
                float _486 = fma(_388, _388, _484);
                float _488 = fma(_392, _392, _486);
                float _490 = sqrt(_488);
                bool _492 = _490 >= 9.9999999747524270787835121154785e-07;
                bool _494 = isnan(_490);
                bool _496 = _492 || _494;
                bool _498 = isnan(9.9999999747524270787835121154785e-07);
                bool _500 = _496 || _498;
                if (!_500)
                {
                    float _502 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _502);
                    float _506 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _504);
                    float _508 = rsqrt(_506);
                    float _510 = _508 * 9.9999999747524270787835121154785e-07;
                    float _512 = _510 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _514 = _510 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _516 = _510 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _420 = _514;
                    _422 = _512;
                    _424 = _516;
                    _464 = true;
                }
                else
                {
                    float _518 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _522 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _524 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _518);
                    float _526 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
                    float _528 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
                    float _530 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
                    float _536 = _530 * _530;
                    float _538 = fma(_532, _532, _536);
                    float _540 = fma(_534, _534, _538);
                    float _542 = rsqrt(_540);
                    float _544 = _542 * 9.9999999747524270787835121154785e-07;
                    float _546 = _532 * _544;
                    float _548 = _530 * _544;
                    float _550 = _534 * _544;
                    _420 = _548;
                    _422 = _546;
                    _424 = _550;
                    _464 = true;
                }
            }
            else
            {
                float _552 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _554 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _556 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _558 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _552);
                float _560 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
                float _562 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
                float _564 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _558);
                float _566 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
                float _568 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
                float _570 = _564 * _564;
                float _572 = fma(_566, _566, _570);
                float _574 = fma(_568, _568, _572);
                float _576 = rsqrt(_574);
                float _578 = _576 * 9.9999999747524270787835121154785e-07;
                float _580 = _566 * _578;
                float _582 = _564 * _578;
                float _584 = _568 * _578;
                _420 = _582;
                _422 = _580;
                _424 = _584;
            }
        }
    }
    _464 = false;
    float _586 = _420;
    float _588 = _422;
    float _590 = _424;
    float _592 = in.m_51.x;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _596 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _610 = _608 != 0;
    float _612 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _616 = _596 * _594;
    float _618 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _622 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _624 = _622 != 0;
    float _626 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[20].x, _616);
    out.m_53.x = _612;
    out.m_53.y = _618;
    out.m_53.z = _620;
    out.m_53.w = _614;
    float _628 = _626 * 6.283185482025146484375;
    float _630 = floor(_626);
    float _632 = _628 * 0.15915493667125701904296875;
    bool _634 = !_606;
    int _636 = _634 ? 0 : 1;
    int _638 = abs(_636);
    float _640 = _632 * 6.283185482025146484375;
    float _642 = cos(_640);
    bool _644 = !_624;
    int _646 = _644 ? 0 : 1;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    int _650 = abs(_646);
    float _652 = -_630;
    float _654 = _626 + _652;
    bool _656 = !_610;
    int _658 = _656 ? 0 : 1;
    float _660 = float(_638);
    int _662 = abs(_658);
    float _664 = -_654;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _668 = _654 < 0.5;
    float _670 = float(_668);
    float _672 = fma(_642, 0.5, 0.5);
    float _674 = abs(_666);
    float _676 = _660 * _674;
    float _678 = -_670;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = float(_650);
    float _684 = -_672;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _688 = float(_662);
    float _690 = fma(_682, _686, _676);
    float _692 = abs(_680);
    float _694 = fma(_688, _692, _690);
    bool _696 = !_648;
    float _712;
    if (!_696)
    {
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _700 = _592 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_88);
        float _718 = 1.0 / _716;
        float _720 = _122 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = in.m_51.y;
    float _726 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _728 = log2(_726);
    float _730 = _592 * 2.0;
    float _732 = in.m_51.z;
    float _734 = _586 * _586;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _738 = floor(_730);
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _744 = isnan(0.0);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _750 = _746 || _748;
    float _752 = fma(_588, _588, _734);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _756 = 1.0 + _754;
    bool _758 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(1.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    float _768 = _728 * _122;
    float _770 = _592 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _772 = 1.0 / _756;
    float _774 = -_740;
    float _776 = fma(_770, 2.0, _774);
    float _778 = _724 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _780 = _724 * 2.0;
    float _782 = exp2(_768);
    float _784 = fma(_778, -2.0, _736);
    float _786 = _732 * 2.0;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _790 = _738 > 0.0;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _794 = _738 >= 0.0;
    bool _796 = isnan(_738);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[78].w, _788);
    float _806 = floor(_786);
    float _808 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[78].z, _792);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _820 = _818 != 0;
    float _822 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _804);
    float _824 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    float _826 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _808);
    float _828 = -_122;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _776);
    float _832 = fma(_590, _590, _752);
    float _834 = -_782;
    float _836 = _834 + 1.0;
    float _838 = floor(_780);
    bool _840 = !_812;
    int _842 = _840 ? 0 : 1;
    float _844 = _592 + _724;
    float _846 = _750 ? _836 : 0.0;
    float _848 = _844 + (-1.0);
    bool _850 = _806 >= 0.0;
    bool _852 = isnan(_806);
    bool _854 = _850 || _852;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    if (_766)
    {
        float _862 = _846 * _772;
        _124 = _862;
    }
    float _864 = _124;
    int _866 = _858 ? 0 : 1;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _878 = _876 != 0;
    int _880 = _802 ? 0 : 1;
    float _882 = rsqrt(_832);
    bool _884 = _806 > 0.0;
    float _886 = _724 + _732;
    int _888 = ~_880;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    int _894 = _892;
    if (!_790)
    {
        int _896 = ~_880;
        int _898 = _896 + 1;
        _894 = _898;
    }
    int _900 = _894;
    float _902 = _886 + (-1.0);
    bool _904 = _838 > 0.0;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _908 = ~_866;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _916 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _918 = _864 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _920 = float(_900);
    int _922 = _912;
    if (!_884)
    {
        int _924 = ~_866;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    float _930 = _918 * _860;
    float _932 = _864 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _934 = _838 >= 0.0;
    bool _936 = isnan(_838);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _882 * _588;
    float _946 = _882 * _586;
    float _948 = _882 * _590;
    float _950 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[203].x, _930);
    bool _952 = !_816;
    int _954 = _952 ? 0 : 1;
    float _956 = _932 * _906;
    int _958 = _942 ? 0 : 1;
    float _960 = floor(_950);
    bool _962 = !_820;
    int _964 = _962 ? 0 : 1;
    float _966 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[203].z, _956);
    bool _968 = !_878;
    int _970 = _968 ? 0 : 1;
    float _972 = _950 + 0.25;
    int _974 = ~_958;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = floor(_966);
    int _994 = _978;
    float _996 = _948;
    if (!_904)
    {
        int _998 = ~_958;
        int _1000 = _998 + 1;
        _994 = _1000;
    }
    int _1002 = _994;
    float _1004 = in.m_55.x;
    float _1006 = in.m_55.y;
    float _1008 = in.m_55.z;
    bool _1010 = !_986;
    int _1012 = _1010 ? 0 : 1;
    bool _1014 = !_990;
    int _1016 = _1014 ? 0 : 1;
    int _1018 = abs(_1012);
    float _1020 = -_960;
    float _1022 = _950 + _1020;
    float _1024 = float(_928);
    float _1026 = _950 * 6.283185482025146484375;
    float _1028 = floor(_972);
    float _1030 = float(_1018);
    int _1032 = abs(_1016);
    float _1034 = _966 + 0.25;
    float _1036 = float(_1002);
    float _1038 = _1030 * _920;
    float _1040 = -_992;
    float _1042 = _966 + _1040;
    float _1044 = floor(_1034);
    float _1046 = float(_1032);
    float _1048 = _1038 * (-2.0);
    bool _1050 = _1022 >= 0.5;
    bool _1052 = isnan(_1022);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    float _1060 = _724 + (-0.5);
    bool _1062 = _1042 >= 0.5;
    bool _1064 = isnan(_1042);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.5);
    bool _1070 = _1066 || _1068;
    float _1072 = _966 * 6.283185482025146484375;
    float _1074 = fma(_1048, _1006, _1006);
    float _1076 = _1046 * _1036;
    float _1078 = -_1028;
    float _1080 = _972 + _1078;
    float _1082 = fma(_914, _1048, _914);
    float _1084 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1074);
    float _1086 = _1026 * 0.15915493667125701904296875;
    float _1088 = _1072 * 0.15915493667125701904296875;
    int _1090 = abs(_954);
    float _1092 = _1076 * (-2.0);
    bool _1094 = !_874;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = -_1044;
    float _1100 = _1034 + _1098;
    float _1102 = _1086 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    int _1106 = abs(_842);
    float _1108 = fma(_1082, _864, _1084);
    int _1110 = abs(_1096);
    float _1112 = _1108 * 0.15915493667125701904296875;
    bool _1114 = !_870;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = _1088 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    bool _1122 = !_1058;
    float _1124 = _1122 ? 0.5 : (-0.5);
    bool _1126 = _1080 > 0.5;
    bool _1128 = !_1070;
    float _1130 = _1128 ? 0.5 : (-0.5);
    int _1132 = abs(_1116);
    float _1134 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1136 = float(_1090);
    float _1138 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1140 = _1138 * 2.0;
    float _1142 = float(_1110);
    float _1144 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1146 = _1144 * 2.0;
    int _1148 = abs(_964);
    float _1150 = _1136 * _1146;
    float _1152 = float(_1106);
    float _1154 = _1142 * _1140;
    float _1156 = float(_1132);
    float _1158 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1160 = _1080;
    float _1162 = _1100;
    if (_1126)
    {
        float _1164 = -_1080;
        float _1166 = _1164 + 1.0;
        _1160 = _1166;
    }
    float _1168 = _1160;
    bool _1170 = _1100 > 0.5;
    float _1172 = fma(_1152, _1134, _1150);
    float _1174 = fma(_1156, _1158, _1154);
    bool _1176 = !_982;
    int _1178 = _1176 ? 0 : 1;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1182 = _948 * _1180;
    float _1184 = fma(_1168, 4.0, -1.0);
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1188 = _946 * _1186;
    int _1190 = abs(_1178);
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1194 = -_1182;
    float _1196 = fma(_944, _1192, _1194);
    float _1198 = float(_1148);
    float _1200 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1204 = -_1188;
    float _1206 = fma(_948, _1202, _1204);
    float _1208 = float(_1190);
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1212 = _944 * _1210;
    float _1214 = _1196 * _1196;
    float _1216 = fma(_1198, _1200, _1172);
    if (_1170)
    {
        float _1218 = -_1100;
        float _1220 = _1218 + 1.0;
        _1162 = _1220;
    }
    float _1222 = _1162;
    int _1224 = abs(_970);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1228 = -_1212;
    float _1230 = fma(_946, _1226, _1228);
    float _1232 = fma(_1206, _1206, _1214);
    float _1234 = _1208 * _1024;
    float _1236 = fma(_1216, 3.1415927410125732421875, _1004);
    float _1238 = fma(_1222, 4.0, -1.0);
    float _1240 = fma(_1230, _1230, _1232);
    float _1242 = float(_1224);
    float _1244 = _1234 * (-2.0);
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1248 = _592 + (-0.5);
    float _1250 = fma(_1236, _1244, _1236);
    float _1252 = fma(_1242, _1246, _1174);
    float _1254 = fma(_916, _1244, _916);
    float _1256 = _592 + _732;
    float _1258 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1250);
    float _1260 = fma(_1252, 3.1415927410125732421875, _1008);
    float _1262 = _732 + (-0.5);
    float _1264 = in.m_49.x;
    float _1266 = in.m_49.y;
    float _1268 = in.m_49.z;
    float _1270 = _1256 + (-1.0);
    float _1272 = fma(_1260, _1092, _1260);
    float _1274 = fma(_1254, _864, _1258);
    float _1276 = rsqrt(_1240);
    float _1278 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1280 = in.m_57.x;
    float _1282 = in.m_57.y;
    float _1284 = in.m_57.z;
    float _1286 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1272);
    float _1288 = _1274 * 0.15915493667125701904296875;
    float _1290 = fma(_1278, _1092, _1278);
    bool _1292 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1294 = isnan(0.5);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1300 = _1296 || _1298;
    float _1302 = _1112 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = fma(_1290, _864, _1286);
    float _1308 = _1306 * 0.15915493667125701904296875;
    float _1310 = _1112 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = _1230 * _1276;
    float _1316 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1320 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1322 = _1288 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1280);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1284);
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1334 = _1206 * _1276;
    float _1336 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1282);
    float _1340 = _1308 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = _1332 * _1330;
    float _1346 = _1326 * _1328;
    float _1348 = _1336 * _1338;
    float _1350 = _1196 * _1276;
    float _1352 = _1288 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1324 * _1304;
    float _1358 = _1324 * _1312;
    float _1360 = _1308 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = _1324 * _1342;
    float _1366 = _1354 * _1312;
    float _1368 = _1354 * _1304;
    float _1370 = _1354 * _1342;
    float _1372 = _1312 * _1342;
    float _1374 = _1304 * _1342;
    float _1376 = _1370 * _944;
    float _1378 = _1370 * _948;
    float _1380 = fma(_1362, _1366, _1356);
    float _1382 = -_1368;
    float _1384 = fma(_1362, _1358, _1382);
    float _1386 = -_1358;
    float _1388 = fma(_1362, _1368, _1386);
    float _1390 = fma(_1362, _1356, _1366);
    float _1392 = -_1362;
    float _1394 = fma(_1392, _1334, _1376);
    float _1396 = _946 * _1314;
    float _1398 = _944 * _1350;
    float _1400 = -_1362;
    float _1402 = fma(_1400, _1314, _1378);
    float _1404 = _1380 * _944;
    float _1406 = _1388 * _948;
    float _1408 = -_1396;
    float _1410 = fma(_948, _1350, _1408);
    float _1412 = -_1398;
    float _1414 = fma(_946, _1334, _1412);
    float _1416 = fma(_1372, _1334, _1404);
    float _1418 = _1380 * _948;
    float _1420 = fma(_1374, _1314, _1406);
    float _1422 = _1388 * _944;
    float _1424 = fma(_1384, _1410, _1416);
    float _1426 = fma(_1372, _1314, _1418);
    float _1428 = fma(_1364, _1414, _1402);
    float _1430 = fma(_1390, _1414, _1420);
    float _1432 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1434 = fma(_1374, _1334, _1422);
    float _1436 = fma(_1384, _1414, _1426);
    float _1438 = _1348 * _1428;
    float _1440 = fma(_1364, _1410, _1394);
    float _1442 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1444 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1432);
    float _1446 = fma(_1390, _1410, _1434);
    float _1448 = fma(_1346, _1436, _1438);
    float _1450 = _1348 * _1440;
    float _1452 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1442);
    float _1454 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1444);
    float _1456 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1458 = fma(_1344, _1430, _1448);
    float _1460 = fma(_1346, _1424, _1450);
    float _1462 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1452);
    float _1464 = _1454 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1466 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1456);
    float _1468 = fma(_1344, _1446, _1460);
    float _1470 = _1462 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1472 = _1464 + _1458;
    float _1474 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1466);
    float _1476 = _1370 * _946;
    float _1478 = _1470 + _1468;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1482 = _1472 + _1480;
    float _1484 = _1474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1486 = _1380 * _946;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1490 = _1478 + _1488;
    float _1492 = _1482 * _1482;
    float _1494 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1496 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1498 = -_1362;
    float _1500 = fma(_1498, _1350, _1476);
    float _1502 = fma(_1490, _1490, _1492);
    float _1504 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1494);
    float _1506 = _948 * _1334;
    float _1508 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1496);
    float _1510 = sqrt(_1502);
    float _1512 = _1388 * _946;
    float _1514 = -_1506;
    float _1516 = fma(_944, _1314, _1514);
    float _1518 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1508);
    float _1520 = fma(_1372, _1350, _1486);
    float _1522 = fma(_1374, _1350, _1512);
    float _1524 = fma(_1364, _1516, _1500);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1528 = fma(_1384, _1516, _1520);
    float _1530 = fma(_1390, _1516, _1522);
    float _1532 = _1348 * _1524;
    float _1534 = 1.0 / _1526;
    float _1536 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1504);
    float _1538 = _1362;
    float _1540 = _1472;
    float _1542 = _1350;
    float _1544 = _1524;
    if (_1300)
    {
        _996 = 1.0;
    }
    float _1546 = _996;
    float _1548 = fma(_1346, _1528, _1532);
    bool _1550 = _1510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1554 = fma(_1344, _1530, _1548);
    float _1556 = _1552 + _1526;
    float _1558 = _1484 + _1554;
    float _1560 = _1556 * _1534;
    float _1562 = _1560 * 0.5;
    float _1564 = _1554;
    float _1566 = _1546;
    float _1568 = _1558;
    if (!_1550)
    {
        _1538 = _1478;
    }
    float _1570 = _1538;
    float _1572 = _1570;
    if (!_1550)
    {
        _1564 = _1558;
    }
    float _1574 = _1564;
    bool _1576 = !_1550;
    float _1578 = _1574;
    if (!_1576)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1584 = _1510 + _1582;
        float _1586 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = rsqrt(_1502);
        float _1590 = _1584 * _1580;
        float _1592 = _1590 * 0.15915493667125701904296875;
        float _1594 = _1592 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = fma(_1596, _1586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1604 = _1588 * _1602;
        float _1606 = _1600 + (-1.0);
        float _1608 = fma(_1490, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1482, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1612 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1614 = fma(_1558, _1600, _1612);
        _1578 = _1614;
        _1572 = _1608;
        _1540 = _1610;
        _1542 = _1586;
    }
    float _1616 = _1578;
    float _1618 = _1572;
    float _1620 = _1540;
    float _1622 = _1542;
    float _1624 = _1622;
    if (!_1300)
    {
        float _1626 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1628 = _1626 * 0.15915493667125701904296875;
        float _1630 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1634 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1632);
        float _1636 = _1628 * 6.283185482025146484375;
        float _1638 = cos(_1636);
        float _1640 = _1630 * 0.15915493667125701904296875;
        float _1642 = _1628 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = 1.0 / _1638;
        float _1648 = _1640 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        float _1652 = _1644 * _1646;
        float _1654 = _1640 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        float _1658 = _1650 * _1652;
        float _1660 = 1.0 / _1634;
        float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1664 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1662;
        float _1666 = 1.0 / _1658;
        float _1668 = 1.0 / _1664;
        float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1672 = _1660 * _1670;
        float _1674 = _1656 * _1666;
        float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1678 = fma(_1674, _1672, _1676);
        float _1680 = _1678 * _1668;
        float _1682 = precise::clamp(_1680, 0.0, 1.0);
        _1624 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1566 = _1682;
    }
    float _1684 = _1624;
    float _1686 = _1566;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1690 = _1616 + _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1694 = _1618 + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1698 = _1620 + _1696;
    float _1700 = _1690 * _1690;
    float _1702 = fma(_1694, _1694, _1700);
    float _1704 = fma(_1698, _1698, _1702);
    float _1706 = rsqrt(_1704);
    float _1708 = sqrt(_1704);
    float _1710 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1712 = _1694 * _1710;
    float _1714 = _1698 * _1710;
    float _1716 = _1712 * _1712;
    float _1718 = _1714 * _1714;
    float _1720 = _1716 + _1718;
    float _1722 = sqrt(_1720);
    bool _1724 = _1722 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1728 = _1722 + _1726;
    float _1730 = _1698;
    float _1732 = _1720;
    float _1734 = _1728;
    float _1736 = _1684;
    float _1738 = _1690;
    if (_1724)
    {
        float _1740 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1730 = _1740;
    }
    float _1742 = _1730;
    if (_1724)
    {
        float _1744 = rsqrt(_1720);
        _1732 = _1744;
    }
    float _1746 = _1732;
    if (_1724)
    {
        float _1748 = _1728 * _1742;
        _1734 = _1748;
    }
    float _1750 = _1734;
    if (_1724)
    {
        float _1752 = _1750 * 0.15915493667125701904296875;
        _1736 = _1752;
    }
    float _1754 = _1736;
    float _1756 = _1706;
    float _1758 = _1754;
    if (_1724)
    {
        float _1760 = _1754 * 6.283185482025146484375;
        float _1762 = sin(_1760);
        _1756 = _1762;
    }
    float _1764 = _1756;
    float _1766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1768 = precise::max(0.0, _1766);
    float _1770 = _1742;
    float _1772 = _1768;
    if (_1724)
    {
        float _1774 = _1754 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = -_1710;
    float _1782 = -_1768;
    float _1784 = fma(_1690, _1780, _1782);
    if (_1724)
    {
        float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1738 = _1786;
    }
    float _1788 = _1738;
    float _1790 = _1788;
    if (!_1724)
    {
        _1758 = _1716;
    }
    float _1792 = _1758;
    float _1794 = _1764;
    float _1796 = _1792;
    if (_1724)
    {
        float _1798 = fma(_1764, _1788, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1794 = _1798;
    }
    float _1800 = _1794;
    float _1802 = _1800;
    if (!_1724)
    {
        _1790 = _1784;
    }
    float _1804 = _1790;
    float _1806 = _1804;
    float _1808 = _1778;
    if (_1724)
    {
        float _1810 = _1778 + (-1.0);
        _1772 = _1810;
    }
    float _1812 = _1772;
    float _1814 = _1812;
    if (_1724)
    {
        float _1816 = _1746 * _1800;
        _1544 = _1816;
    }
    float _1818 = _1544;
    if (!_1724)
    {
        _1802 = _1712;
    }
    float _1820 = _1802;
    float _1822 = _1820;
    if (_1724)
    {
        float _1824 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1824;
    }
    float _1826 = _1568;
    if (_1724)
    {
        float _1828 = _1712 * _1818;
        _1822 = _1828;
    }
    float _1830 = _1822;
    if (!_1724)
    {
        _1814 = _1714;
    }
    float _1832 = _1814;
    float _1834 = _1832;
    if (_1724)
    {
        float _1836 = _1714 * _1818;
        _1834 = _1836;
    }
    float _1838 = _1834;
    if (_1724)
    {
        float _1840 = fma(_1784, _1778, _1826);
        _1806 = _1840;
    }
    float _1842 = _1806;
    if (_1724)
    {
        float _1844 = _1830 * _1830;
        _1796 = _1844;
    }
    float _1846 = _1796;
    if (!_1724)
    {
        _1808 = _1718;
    }
    float _1848 = _1808;
    float _1850 = _1848;
    if (_1724)
    {
        float _1852 = _1838 * _1838;
        _1850 = _1852;
    }
    float _1854 = _1850;
    float _1856 = fma(_1842, _1842, _1846);
    float _1858 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1860 = _1856 + _1854;
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1864 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1862);
    float _1866 = precise::clamp(_1864, 0.0, 1.0);
    float _1868 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1858);
    float _1870 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1872 = rsqrt(_1860);
    float _1874 = -_1866;
    float _1876 = _1874 + 1.0;
    float _1878 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1880 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1882 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1870);
    float _1884 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1886 = _1878 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1888 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1880);
    float _1890 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1882);
    float _1892 = abs(_1876);
    float _1894 = log2(_1892);
    float _1896 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1884);
    float _1898 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1888);
    float _1900 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1902 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1904 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1896);
    float _1906 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1908 = _1872 * _1830;
    float _1910 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1912 = _1872 * _1842;
    float _1914 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1916 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1918 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1910);
    float _1920 = _1872 * _1838;
    float _1922 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1924 = -_1916;
    float _1926 = fma(_1912, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1924);
    float _1928 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1918);
    float _1930 = -_1914;
    float _1932 = fma(_1930, _1902, 1.0);
    float _1934 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1936 = -_1920;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1926);
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1928);
    float _1942 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1944 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1938, -0.5, 0.5);
    float _1948 = log2(_1932);
    float _1950 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1942);
    float _1952 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1954 = fma(_1938, 0.5, 0.5);
    float _1956 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1950);
    float _1958 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1952);
    float _1960 = _1912 + 1.0;
    float _1962 = exp2(_1934);
    float _1964 = fma(_1954, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1966 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1956);
    float _1968 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1958);
    float _1970 = fma(_1954, _1964, -0.212114393711090087890625);
    float _1972 = 1.0 / _1940;
    float _1974 = _1948 * 0.693147182464599609375;
    float _1976 = fma(_1954, _1970, 1.570728778839111328125);
    float _1978 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1980 = sqrt(_1946);
    float _1982 = -_1912;
    float _1984 = fma(_1962, _1960, _1982);
    float _1986 = fma(_1984, 0.5, 0.5);
    float _1988 = _1966 * _1972;
    float _1990 = _1968 * _1972;
    float _1992 = fma(_1988, 0.5, 0.5);
    float _1994 = fma(_1990, -0.5, 0.5);
    float _1996 = _1980 * 0.636619746685028076171875;
    float3 _5482 = float3(_1992, _1994, _1978);
    float _1998 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5482, float3(0.0), isnan(_5482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5482, float3(0.0), isnan(_5482)), level(0.0)).x;
    float _2000 = -_1976;
    float _2002 = fma(_1996, _2000, 1.0);
    float3 _5498 = float3(_1992, _1994, _1978);
    float4 _2005 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5498, float3(0.0), isnan(_5498)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5498, float3(0.0), isnan(_5498)), level(0.0)).xyzw;
    float _2007 = _2005.x;
    float _2009 = _2005.y;
    float _2011 = _2005.z;
    float _2013 = _2005.w;
    float2 _5515 = float2(_2002, _1986);
    float3 _2017 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5515, float2(0.0), isnan(_5515)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5515, float2(0.0), isnan(_5515)), level(0.0)).xyz;
    float _2019 = _2017.x;
    float _2021 = _2017.y;
    float _2023 = _2017.z;
    float _2025 = in.m_59.y;
    float _2027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2029;
    float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2035 = _2033 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2037;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2045 = 1.0 / _2031;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2049 = _2047 != 0;
    int _2051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2053 = _2051 != 0;
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2057 = _722 + _2055;
    bool _2059 = _724 > 0.5;
    float _2061 = 1.0 / _2035;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _2063 = _592 > 0.5;
    bool _2065 = _2063 && _2053;
    float _2067 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2069 = _722 + _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2073 = _722 + _2071;
    float _2075 = 1.0 / _2039;
    float _2077 = -_2025;
    float _2079 = _2077 + 1.0;
    float _2081 = _2069 * _2045;
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _2083;
    float _2087 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2089 = _2025;
    if (_2049)
    {
        float _2091 = _2059 ? _2079 : _2025;
        _2089 = _2091;
    }
    float _2093 = _2089;
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2097 = _722 + _2095;
    float _2099 = 1.0 / _2043;
    float _2101 = in.m_59.x;
    float _2103 = _2073 * _2061;
    float _2105 = fma(_2087, _2093, -0.5);
    float _2107 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2109 = _722 + _2107;
    bool _2111 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2113 = isnan(_722);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2119 = _2115 || _2117;
    float _2121 = float(_2119);
    float _2123 = -_824;
    float _2125 = fma(_822, _2105, _2123);
    float _2127 = _2057 * _2075;
    float _2129 = 1.0 / _2085;
    bool _2131 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _2133 = isnan(_722);
    bool _2135 = _2131 || _2133;
    bool _2137 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _2139 = _2135 || _2137;
    float _2141 = float(_2139);
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2143;
    bool _2147 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2149 = isnan(_722);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2155 = _2151 || _2153;
    float _2157 = float(_2155);
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2165 = _2163 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2167 = _2097 * _2099;
    float _2169 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2169;
    float _2173 = fma(_2161, _2081, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2175;
    float _2179 = -_2141;
    float _2181 = _2179 + 1.0;
    float _2183 = fma(_2171, _2081, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2185 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2187 = _2185 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2189 = fma(_2177, _2081, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2191 = -_2157;
    float _2193 = _2191 + 1.0;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2197 = _2195 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2199 = _2157 * _2181;
    float _2201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2203 = _2121 * _2193;
    float _2205 = fma(_2187, _2103, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2207 = 0.0;
    if (_2053)
    {
        _2207 = _2101;
    }
    float _2209 = _2207;
    float _2211 = fma(_2165, _2103, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2213 = fma(_2197, _2103, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2215 = -_2121;
    float _2217 = _2215 + 1.0;
    bool _2219 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2221 = isnan(_722);
    bool _2223 = _2219 || _2221;
    bool _2225 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2227 = _2223 || _2225;
    float _2229 = float(_2227);
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2231;
    float _2235 = _2209;
    if (_2065)
    {
        float _2237 = -_2209;
        float _2239 = _2237 + 1.0;
        _2235 = _2239;
    }
    float _2241 = _2235;
    bool _2243 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2245 = isnan(_722);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2255;
    float _2259 = _2109 * _2129;
    float _2261 = -_2229;
    float _2263 = _2261 + 1.0;
    float _2265 = _2229 * _2217;
    float _2267 = _2129;
    if (!_2053)
    {
        _2267 = _2101;
    }
    float _2269 = _2267;
    float _2271 = fma(_2145, _2127, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2273 = fma(_2233, _2127, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2275 = fma(_2257, _2127, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2277 = _2269;
    if (_2053)
    {
        _2277 = _2241;
    }
    float _2279 = _2277;
    float _2281 = _2253 * _2263;
    bool _2283 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2285 = isnan(_722);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2291 = _2287 || _2289;
    float _2293 = float(_2291);
    float _2295 = -_2253;
    float _2297 = _2295 + 1.0;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2301 = _2299 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2303 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2307 = _2305 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2309 = _2293 * _2297;
    float _2311 = -_2293;
    float _2313 = _2311 + 1.0;
    float _2315 = fma(_2303, _2279, -0.5);
    float _2317 = fma(_2301, _2167, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2319 = _2189 * _2309;
    float _2321 = _2173 * _2309;
    float _2323 = fma(_826, _2315, _830);
    float _2325 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2319);
    float _2327 = _2183 * _2309;
    float _2329 = _2323 + 0.5;
    float _2331 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2321);
    float _2333 = fma(_2205, _2281, _2325);
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _2335;
    float _2339 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2327);
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2343 = _2341 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2345 = fma(_2337, _2259, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _2347 = _2125 + 0.5;
    float _2349 = fma(_2211, _2281, _2331);
    float _2351 = fma(_2213, _2281, _2339);
    float _2353 = fma(_2307, _2167, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    out.m_63.x = _2329;
    out.m_63.y = _2347;
    float _2355 = fma(_2343, _2167, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _2357 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2359 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _2357;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2363 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _2361;
    float _2365 = fma(_2271, _2265, _2333);
    float _2367 = fma(_2273, _2265, _2349);
    float _2369 = fma(_2275, _2265, _2351);
    float _2371 = fma(_2359, _2259, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _2373 = fma(_2363, _2259, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _2375 = fma(_2317, _2203, _2365);
    float _2377 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2379 = fma(_2353, _2203, _2367);
    float _2381 = fma(_2355, _2203, _2369);
    float _2383 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2385 = exp2(_2377);
    float _2387 = fma(_2345, _2199, _2375);
    float _2389 = fma(_2371, _2199, _2379);
    float _2391 = fma(_2373, _2199, _2381);
    float _2393 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2383);
    float _2395 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2397 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2387);
    float _2399 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2389);
    float _2401 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2391);
    float _2403 = _1940 * 0.5;
    float _2405 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2407 = _694 * _2395;
    float _2409 = fma(_1968, -0.5, _2403);
    float _2411 = _2397 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2413 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2415 = -_2385;
    float _2417 = _2415 + 1.0;
    float _2419 = _2401 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2421 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2405);
    bool _2423 = _1686 > 0.0;
    bool _2425 = isnan(_1686);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(0.0);
    bool _2431 = _2427 || _2429;
    float _2433 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2437 = _2411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2439 = _2413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2441 = _2419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2443 = _2421 + _1940;
    float _2445 = _1966 + _1940;
    float _2447 = _2407 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2437;
    out.m_65.y = _2439;
    out.m_65.z = _2441;
    out.m_65.w = _2435;
    float _2449 = _2443 * 0.5;
    float _2451 = _2445 * 0.5;
    out.gl_Position.x = _1966;
    out.gl_Position.y = _1968;
    out.gl_Position.z = _2421;
    out.gl_Position.w = _1940;
    out.m_67.x = _2451;
    out.m_67.y = _2409;
    out.m_67.z = _2449;
    out.m_67.w = _1940;
    out.m_45.x = _2447;
    float _2453 = _2433 * _1998;
    float _2455 = -_2433;
    float _2457 = _2455 + 1.0;
    float _2459 = _2013 * _2453;
    float _2461 = _2023 * _2453;
    float _2463 = fma(_2019, _2459, _2007);
    float _2465 = fma(_2021, _2459, _2009);
    float _2467 = _2013 * _2457;
    float _2469 = fma(_2013, _2461, _2011);
    out.m_69.x = _2463;
    out.m_69.y = _2465;
    out.m_69.z = _2469;
    out.m_69.w = _2467;
    if (_2431)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2471 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2471;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2528 = as_type<float>(_104);
        out.gl_Position.z = _2528;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _142 = _138 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_144);
        out.gl_Position.z = _2599;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    float _152 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = 0.0;
    float _166 = _152;
    if (!_162)
    {
        float _168 = _152 * _152;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = 0.0;
    float _176 = _172;
    if (!_162)
    {
        float _178 = _122 * _122;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    if (!_162)
    {
        float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _184;
    }
    float _186 = _176;
    bool _188 = !_162;
    float _190 = 0.0;
    float _192 = _186;
    if (!_188)
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
        _190 = _210;
        _192 = _222;
        _140 = _208;
    }
    float _224 = _190;
    float _226 = _192;
    float _228 = _140;
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
        _166 = _254;
    }
    float _256 = _232;
    float _258 = _234;
    float _260 = _166;
    float _262 = _258;
    float _264 = _256;
    if (!_162)
    {
        _262 = _122;
    }
    float _266 = _262;
    float _268 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _266;
    if (!_162)
    {
        float _272 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _272;
    }
    float _274 = _264;
    bool _276 = !_162;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _122 * _282;
        float _292 = exp2(_290);
        float _294 = _288 * 0.693147182464599609375;
        float _296 = 1.0 / _294;
        float _298 = 1.0 / _286;
        float _300 = _292 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _296, _122);
        float _306 = _304 * _298;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
    }
    float _310 = _278;
    bool _312 = !_162;
    if (!_312)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _122 * _316;
        float _326 = exp2(_324);
        float _328 = -_326;
        float _330 = _328 + 1.0;
        float _332 = _330 * _322;
        _270 = _332;
    }
    float _334 = _270;
    float _336 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _342 = fma(_260, _148, _268);
    float _344 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_334, _148, _336);
    float _348 = fma(_260, _146, _338);
    float _350 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_334, _146, _344);
    float _354 = -_346;
    float _356 = _342 + _354;
    float _358 = fma(_260, _150, _340);
    float _360 = fma(_334, _150, _350);
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
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _398 = sqrt(_384);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _402 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    bool _404 = _398 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_348, _368, _388);
    float _416 = fma(_342, _368, _390);
    float _418 = fma(_358, _368, _392);
    float _420 = _400;
    float _422 = _396;
    float _424 = _402;
    if (!_412)
    {
        bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _428 = !_426;
        if (!_428)
        {
            float _430 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _430);
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _440);
            float _448 = _442 * _442;
            float _450 = fma(_444, _444, _448);
            float _452 = fma(_446, _446, _450);
            float _454 = rsqrt(_452);
            float _456 = _454 * 9.9999999747524270787835121154785e-07;
            float _458 = _444 * _456;
            float _460 = _442 * _456;
            float _462 = _446 * _456;
            _420 = _460;
            _422 = _458;
            _424 = _462;
            _464 = true;
        }
        else
        {
            float _466 = _148 * _148;
            float _468 = fma(_146, _146, _466);
            float _470 = fma(_150, _150, _468);
            float _472 = sqrt(_470);
            bool _474 = _472 >= 9.9999999747524270787835121154785e-07;
            bool _476 = isnan(_472);
            bool _478 = _474 || _476;
            bool _480 = isnan(9.9999999747524270787835121154785e-07);
            bool _482 = _478 || _480;
            if (!_482)
            {
                float _484 = _390 * _390;
                float _486 = fma(_388, _388, _484);
                float _488 = fma(_392, _392, _486);
                float _490 = sqrt(_488);
                bool _492 = _490 >= 9.9999999747524270787835121154785e-07;
                bool _494 = isnan(_490);
                bool _496 = _492 || _494;
                bool _498 = isnan(9.9999999747524270787835121154785e-07);
                bool _500 = _496 || _498;
                if (!_500)
                {
                    float _502 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _502);
                    float _506 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _504);
                    float _508 = rsqrt(_506);
                    float _510 = _508 * 9.9999999747524270787835121154785e-07;
                    float _512 = _510 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _514 = _510 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _516 = _510 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _420 = _514;
                    _422 = _512;
                    _424 = _516;
                    _464 = true;
                }
                else
                {
                    float _518 = _390 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = _390 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _522 = _390 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _524 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _518);
                    float _526 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
                    float _528 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
                    float _530 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
                    float _532 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
                    float _534 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
                    float _536 = _530 * _530;
                    float _538 = fma(_532, _532, _536);
                    float _540 = fma(_534, _534, _538);
                    float _542 = rsqrt(_540);
                    float _544 = _542 * 9.9999999747524270787835121154785e-07;
                    float _546 = _532 * _544;
                    float _548 = _530 * _544;
                    float _550 = _534 * _544;
                    _420 = _548;
                    _422 = _546;
                    _424 = _550;
                    _464 = true;
                }
            }
            else
            {
                float _552 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _554 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _556 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _558 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _552);
                float _560 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
                float _562 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
                float _564 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _558);
                float _566 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
                float _568 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
                float _570 = _564 * _564;
                float _572 = fma(_566, _566, _570);
                float _574 = fma(_568, _568, _572);
                float _576 = rsqrt(_574);
                float _578 = _576 * 9.9999999747524270787835121154785e-07;
                float _580 = _566 * _578;
                float _582 = _564 * _578;
                float _584 = _568 * _578;
                _420 = _582;
                _422 = _580;
                _424 = _584;
            }
        }
    }
    _464 = false;
    float _586 = _420;
    float _588 = _422;
    float _590 = _424;
    float _592 = in.m_51.x;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _596 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _610 = _608 != 0;
    float _612 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _616 = _596 * _594;
    float _618 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _622 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _624 = _622 != 0;
    float _626 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[20].x, _616);
    out.m_53.x = _612;
    out.m_53.y = _618;
    out.m_53.z = _620;
    out.m_53.w = _614;
    float _628 = _626 * 6.283185482025146484375;
    float _630 = floor(_626);
    float _632 = _628 * 0.15915493667125701904296875;
    bool _634 = !_606;
    int _636 = _634 ? 0 : 1;
    int _638 = abs(_636);
    float _640 = _632 * 6.283185482025146484375;
    float _642 = cos(_640);
    bool _644 = !_624;
    int _646 = _644 ? 0 : 1;
    bool _648 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    int _650 = abs(_646);
    float _652 = -_630;
    float _654 = _626 + _652;
    bool _656 = !_610;
    int _658 = _656 ? 0 : 1;
    float _660 = float(_638);
    int _662 = abs(_658);
    float _664 = -_654;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _668 = _654 < 0.5;
    float _670 = float(_668);
    float _672 = fma(_642, 0.5, 0.5);
    float _674 = abs(_666);
    float _676 = _660 * _674;
    float _678 = -_670;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = float(_650);
    float _684 = -_672;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _688 = float(_662);
    float _690 = fma(_682, _686, _676);
    float _692 = abs(_680);
    float _694 = fma(_688, _692, _690);
    bool _696 = !_648;
    float _712;
    if (!_696)
    {
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _700 = _592 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_88);
        float _718 = 1.0 / _716;
        float _720 = _122 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    float _724 = in.m_51.y;
    float _726 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _728 = log2(_726);
    float _730 = _592 * 2.0;
    float _732 = in.m_51.z;
    float _734 = _586 * _586;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _738 = floor(_730);
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _744 = isnan(0.0);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _750 = _746 || _748;
    float _752 = fma(_588, _588, _734);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _756 = 1.0 + _754;
    bool _758 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(1.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    float _768 = _728 * _122;
    float _770 = _592 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _772 = 1.0 / _756;
    float _774 = -_740;
    float _776 = fma(_770, 2.0, _774);
    float _778 = _724 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _780 = _724 * 2.0;
    float _782 = exp2(_768);
    float _784 = fma(_778, -2.0, _736);
    float _786 = _732 * 2.0;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _790 = _738 > 0.0;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _794 = _738 >= 0.0;
    bool _796 = isnan(_738);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[78].w, _788);
    float _806 = floor(_786);
    float _808 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[78].z, _792);
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _816 = _814 != 0;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _820 = _818 != 0;
    float _822 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _804);
    float _824 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _784);
    float _826 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _808);
    float _828 = -_122;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _776);
    float _832 = fma(_590, _590, _752);
    float _834 = -_782;
    float _836 = _834 + 1.0;
    float _838 = floor(_780);
    bool _840 = !_812;
    int _842 = _840 ? 0 : 1;
    float _844 = _592 + _724;
    float _846 = _750 ? _836 : 0.0;
    float _848 = _844 + (-1.0);
    bool _850 = _806 >= 0.0;
    bool _852 = isnan(_806);
    bool _854 = _850 || _852;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    if (_766)
    {
        float _862 = _846 * _772;
        _124 = _862;
    }
    float _864 = _124;
    int _866 = _858 ? 0 : 1;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _878 = _876 != 0;
    int _880 = _802 ? 0 : 1;
    float _882 = rsqrt(_832);
    bool _884 = _806 > 0.0;
    float _886 = _724 + _732;
    int _888 = ~_880;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    int _894 = _892;
    if (!_790)
    {
        int _896 = ~_880;
        int _898 = _896 + 1;
        _894 = _898;
    }
    int _900 = _894;
    float _902 = _886 + (-1.0);
    bool _904 = _838 > 0.0;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _908 = ~_866;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _916 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _918 = _864 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _920 = float(_900);
    int _922 = _912;
    if (!_884)
    {
        int _924 = ~_866;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    float _930 = _918 * _860;
    float _932 = _864 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _934 = _838 >= 0.0;
    bool _936 = isnan(_838);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _882 * _588;
    float _946 = _882 * _586;
    float _948 = _882 * _590;
    float _950 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[203].x, _930);
    bool _952 = !_816;
    int _954 = _952 ? 0 : 1;
    float _956 = _932 * _906;
    int _958 = _942 ? 0 : 1;
    float _960 = floor(_950);
    bool _962 = !_820;
    int _964 = _962 ? 0 : 1;
    float _966 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[203].z, _956);
    bool _968 = !_878;
    int _970 = _968 ? 0 : 1;
    float _972 = _950 + 0.25;
    int _974 = ~_958;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = floor(_966);
    int _994 = _978;
    float _996 = _948;
    if (!_904)
    {
        int _998 = ~_958;
        int _1000 = _998 + 1;
        _994 = _1000;
    }
    int _1002 = _994;
    float _1004 = in.m_55.x;
    float _1006 = in.m_55.y;
    float _1008 = in.m_55.z;
    bool _1010 = !_986;
    int _1012 = _1010 ? 0 : 1;
    bool _1014 = !_990;
    int _1016 = _1014 ? 0 : 1;
    int _1018 = abs(_1012);
    float _1020 = -_960;
    float _1022 = _950 + _1020;
    float _1024 = float(_928);
    float _1026 = _950 * 6.283185482025146484375;
    float _1028 = floor(_972);
    float _1030 = float(_1018);
    int _1032 = abs(_1016);
    float _1034 = _966 + 0.25;
    float _1036 = float(_1002);
    float _1038 = _1030 * _920;
    float _1040 = -_992;
    float _1042 = _966 + _1040;
    float _1044 = floor(_1034);
    float _1046 = float(_1032);
    float _1048 = _1038 * (-2.0);
    bool _1050 = _1022 >= 0.5;
    bool _1052 = isnan(_1022);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    float _1060 = _724 + (-0.5);
    bool _1062 = _1042 >= 0.5;
    bool _1064 = isnan(_1042);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.5);
    bool _1070 = _1066 || _1068;
    float _1072 = _966 * 6.283185482025146484375;
    float _1074 = fma(_1048, _1006, _1006);
    float _1076 = _1046 * _1036;
    float _1078 = -_1028;
    float _1080 = _972 + _1078;
    float _1082 = fma(_914, _1048, _914);
    float _1084 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1074);
    float _1086 = _1026 * 0.15915493667125701904296875;
    float _1088 = _1072 * 0.15915493667125701904296875;
    int _1090 = abs(_954);
    float _1092 = _1076 * (-2.0);
    bool _1094 = !_874;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = -_1044;
    float _1100 = _1034 + _1098;
    float _1102 = _1086 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    int _1106 = abs(_842);
    float _1108 = fma(_1082, _864, _1084);
    int _1110 = abs(_1096);
    float _1112 = _1108 * 0.15915493667125701904296875;
    bool _1114 = !_870;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = _1088 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    bool _1122 = !_1058;
    float _1124 = _1122 ? 0.5 : (-0.5);
    bool _1126 = _1080 > 0.5;
    bool _1128 = !_1070;
    float _1130 = _1128 ? 0.5 : (-0.5);
    int _1132 = abs(_1116);
    float _1134 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1136 = float(_1090);
    float _1138 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1140 = _1138 * 2.0;
    float _1142 = float(_1110);
    float _1144 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1146 = _1144 * 2.0;
    int _1148 = abs(_964);
    float _1150 = _1136 * _1146;
    float _1152 = float(_1106);
    float _1154 = _1142 * _1140;
    float _1156 = float(_1132);
    float _1158 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1160 = _1080;
    float _1162 = _1100;
    if (_1126)
    {
        float _1164 = -_1080;
        float _1166 = _1164 + 1.0;
        _1160 = _1166;
    }
    float _1168 = _1160;
    bool _1170 = _1100 > 0.5;
    float _1172 = fma(_1152, _1134, _1150);
    float _1174 = fma(_1156, _1158, _1154);
    bool _1176 = !_982;
    int _1178 = _1176 ? 0 : 1;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1182 = _948 * _1180;
    float _1184 = fma(_1168, 4.0, -1.0);
    float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1188 = _946 * _1186;
    int _1190 = abs(_1178);
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1194 = -_1182;
    float _1196 = fma(_944, _1192, _1194);
    float _1198 = float(_1148);
    float _1200 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1204 = -_1188;
    float _1206 = fma(_948, _1202, _1204);
    float _1208 = float(_1190);
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1212 = _944 * _1210;
    float _1214 = _1196 * _1196;
    float _1216 = fma(_1198, _1200, _1172);
    if (_1170)
    {
        float _1218 = -_1100;
        float _1220 = _1218 + 1.0;
        _1162 = _1220;
    }
    float _1222 = _1162;
    int _1224 = abs(_970);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1228 = -_1212;
    float _1230 = fma(_946, _1226, _1228);
    float _1232 = fma(_1206, _1206, _1214);
    float _1234 = _1208 * _1024;
    float _1236 = fma(_1216, 3.1415927410125732421875, _1004);
    float _1238 = fma(_1222, 4.0, -1.0);
    float _1240 = fma(_1230, _1230, _1232);
    float _1242 = float(_1224);
    float _1244 = _1234 * (-2.0);
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1248 = _592 + (-0.5);
    float _1250 = fma(_1236, _1244, _1236);
    float _1252 = fma(_1242, _1246, _1174);
    float _1254 = fma(_916, _1244, _916);
    float _1256 = _592 + _732;
    float _1258 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1250);
    float _1260 = fma(_1252, 3.1415927410125732421875, _1008);
    float _1262 = _732 + (-0.5);
    float _1264 = in.m_49.x;
    float _1266 = in.m_49.y;
    float _1268 = in.m_49.z;
    float _1270 = _1256 + (-1.0);
    float _1272 = fma(_1260, _1092, _1260);
    float _1274 = fma(_1254, _864, _1258);
    float _1276 = rsqrt(_1240);
    float _1278 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1280 = in.m_57.x;
    float _1282 = in.m_57.y;
    float _1284 = in.m_57.z;
    float _1286 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1272);
    float _1288 = _1274 * 0.15915493667125701904296875;
    float _1290 = fma(_1278, _1092, _1278);
    bool _1292 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1294 = isnan(0.5);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1300 = _1296 || _1298;
    float _1302 = _1112 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = fma(_1290, _864, _1286);
    float _1308 = _1306 * 0.15915493667125701904296875;
    float _1310 = _1112 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = _1230 * _1276;
    float _1316 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1320 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1322 = _1288 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1280);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1284);
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1334 = _1206 * _1276;
    float _1336 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1282);
    float _1340 = _1308 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = _1332 * _1330;
    float _1346 = _1326 * _1328;
    float _1348 = _1336 * _1338;
    float _1350 = _1196 * _1276;
    float _1352 = _1288 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1324 * _1304;
    float _1358 = _1324 * _1312;
    float _1360 = _1308 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = _1324 * _1342;
    float _1366 = _1354 * _1312;
    float _1368 = _1354 * _1304;
    float _1370 = _1354 * _1342;
    float _1372 = _1312 * _1342;
    float _1374 = _1304 * _1342;
    float _1376 = _1370 * _944;
    float _1378 = _1370 * _948;
    float _1380 = fma(_1362, _1366, _1356);
    float _1382 = -_1368;
    float _1384 = fma(_1362, _1358, _1382);
    float _1386 = -_1358;
    float _1388 = fma(_1362, _1368, _1386);
    float _1390 = fma(_1362, _1356, _1366);
    float _1392 = -_1362;
    float _1394 = fma(_1392, _1334, _1376);
    float _1396 = _946 * _1314;
    float _1398 = _944 * _1350;
    float _1400 = -_1362;
    float _1402 = fma(_1400, _1314, _1378);
    float _1404 = _1380 * _944;
    float _1406 = _1388 * _948;
    float _1408 = -_1396;
    float _1410 = fma(_948, _1350, _1408);
    float _1412 = -_1398;
    float _1414 = fma(_946, _1334, _1412);
    float _1416 = fma(_1372, _1334, _1404);
    float _1418 = _1380 * _948;
    float _1420 = fma(_1374, _1314, _1406);
    float _1422 = _1388 * _944;
    float _1424 = fma(_1384, _1410, _1416);
    float _1426 = fma(_1372, _1314, _1418);
    float _1428 = fma(_1364, _1414, _1402);
    float _1430 = fma(_1390, _1414, _1420);
    float _1432 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1434 = fma(_1374, _1334, _1422);
    float _1436 = fma(_1384, _1414, _1426);
    float _1438 = _1348 * _1428;
    float _1440 = fma(_1364, _1410, _1394);
    float _1442 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1444 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1432);
    float _1446 = fma(_1390, _1410, _1434);
    float _1448 = fma(_1346, _1436, _1438);
    float _1450 = _1348 * _1440;
    float _1452 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1442);
    float _1454 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1444);
    float _1456 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1458 = fma(_1344, _1430, _1448);
    float _1460 = fma(_1346, _1424, _1450);
    float _1462 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1452);
    float _1464 = _1454 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1466 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1456);
    float _1468 = fma(_1344, _1446, _1460);
    float _1470 = _1462 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1472 = _1464 + _1458;
    float _1474 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1466);
    float _1476 = _1370 * _946;
    float _1478 = _1470 + _1468;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1482 = _1472 + _1480;
    float _1484 = _1474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1486 = _1380 * _946;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1490 = _1478 + _1488;
    float _1492 = _1482 * _1482;
    float _1494 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1496 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1498 = -_1362;
    float _1500 = fma(_1498, _1350, _1476);
    float _1502 = fma(_1490, _1490, _1492);
    float _1504 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1494);
    float _1506 = _948 * _1334;
    float _1508 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1496);
    float _1510 = sqrt(_1502);
    float _1512 = _1388 * _946;
    float _1514 = -_1506;
    float _1516 = fma(_944, _1314, _1514);
    float _1518 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1508);
    float _1520 = fma(_1372, _1350, _1486);
    float _1522 = fma(_1374, _1350, _1512);
    float _1524 = fma(_1364, _1516, _1500);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1528 = fma(_1384, _1516, _1520);
    float _1530 = fma(_1390, _1516, _1522);
    float _1532 = _1348 * _1524;
    float _1534 = 1.0 / _1526;
    float _1536 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1504);
    float _1538 = _1362;
    float _1540 = _1472;
    float _1542 = _1350;
    float _1544 = _1524;
    if (_1300)
    {
        _996 = 1.0;
    }
    float _1546 = _996;
    float _1548 = fma(_1346, _1528, _1532);
    bool _1550 = _1510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1554 = fma(_1344, _1530, _1548);
    float _1556 = _1552 + _1526;
    float _1558 = _1484 + _1554;
    float _1560 = _1556 * _1534;
    float _1562 = _1560 * 0.5;
    float _1564 = _1554;
    float _1566 = _1546;
    float _1568 = _1558;
    if (!_1550)
    {
        _1538 = _1478;
    }
    float _1570 = _1538;
    float _1572 = _1570;
    if (!_1550)
    {
        _1564 = _1558;
    }
    float _1574 = _1564;
    bool _1576 = !_1550;
    float _1578 = _1574;
    if (!_1576)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1584 = _1510 + _1582;
        float _1586 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = rsqrt(_1502);
        float _1590 = _1584 * _1580;
        float _1592 = _1590 * 0.15915493667125701904296875;
        float _1594 = _1592 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = fma(_1596, _1586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1604 = _1588 * _1602;
        float _1606 = _1600 + (-1.0);
        float _1608 = fma(_1490, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1482, _1604, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1612 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1614 = fma(_1558, _1600, _1612);
        _1578 = _1614;
        _1572 = _1608;
        _1540 = _1610;
        _1542 = _1586;
    }
    float _1616 = _1578;
    float _1618 = _1572;
    float _1620 = _1540;
    float _1622 = _1542;
    float _1624 = _1622;
    if (!_1300)
    {
        float _1626 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1628 = _1626 * 0.15915493667125701904296875;
        float _1630 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1634 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1632);
        float _1636 = _1628 * 6.283185482025146484375;
        float _1638 = cos(_1636);
        float _1640 = _1630 * 0.15915493667125701904296875;
        float _1642 = _1628 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = 1.0 / _1638;
        float _1648 = _1640 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        float _1652 = _1644 * _1646;
        float _1654 = _1640 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        float _1658 = _1650 * _1652;
        float _1660 = 1.0 / _1634;
        float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1664 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1662;
        float _1666 = 1.0 / _1658;
        float _1668 = 1.0 / _1664;
        float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1672 = _1660 * _1670;
        float _1674 = _1656 * _1666;
        float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1678 = fma(_1674, _1672, _1676);
        float _1680 = _1678 * _1668;
        float _1682 = precise::clamp(_1680, 0.0, 1.0);
        _1624 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1566 = _1682;
    }
    float _1684 = _1624;
    float _1686 = _1566;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1690 = _1616 + _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1694 = _1618 + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1698 = _1620 + _1696;
    float _1700 = _1690 * _1690;
    float _1702 = fma(_1694, _1694, _1700);
    float _1704 = fma(_1698, _1698, _1702);
    float _1706 = rsqrt(_1704);
    float _1708 = sqrt(_1704);
    float _1710 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1712 = _1694 * _1710;
    float _1714 = _1698 * _1710;
    float _1716 = _1712 * _1712;
    float _1718 = _1714 * _1714;
    float _1720 = _1716 + _1718;
    float _1722 = sqrt(_1720);
    bool _1724 = _1722 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1728 = _1722 + _1726;
    float _1730 = _1698;
    float _1732 = _1720;
    float _1734 = _1728;
    float _1736 = _1684;
    float _1738 = _1690;
    if (_1724)
    {
        float _1740 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1730 = _1740;
    }
    float _1742 = _1730;
    if (_1724)
    {
        float _1744 = rsqrt(_1720);
        _1732 = _1744;
    }
    float _1746 = _1732;
    if (_1724)
    {
        float _1748 = _1728 * _1742;
        _1734 = _1748;
    }
    float _1750 = _1734;
    if (_1724)
    {
        float _1752 = _1750 * 0.15915493667125701904296875;
        _1736 = _1752;
    }
    float _1754 = _1736;
    float _1756 = _1706;
    float _1758 = _1754;
    if (_1724)
    {
        float _1760 = _1754 * 6.283185482025146484375;
        float _1762 = sin(_1760);
        _1756 = _1762;
    }
    float _1764 = _1756;
    float _1766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1768 = precise::max(0.0, _1766);
    float _1770 = _1742;
    float _1772 = _1768;
    if (_1724)
    {
        float _1774 = _1754 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = -_1710;
    float _1782 = -_1768;
    float _1784 = fma(_1690, _1780, _1782);
    if (_1724)
    {
        float _1786 = _1784 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1738 = _1786;
    }
    float _1788 = _1738;
    float _1790 = _1788;
    if (!_1724)
    {
        _1758 = _1716;
    }
    float _1792 = _1758;
    float _1794 = _1764;
    float _1796 = _1792;
    if (_1724)
    {
        float _1798 = fma(_1764, _1788, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1794 = _1798;
    }
    float _1800 = _1794;
    float _1802 = _1800;
    if (!_1724)
    {
        _1790 = _1784;
    }
    float _1804 = _1790;
    float _1806 = _1804;
    float _1808 = _1778;
    if (_1724)
    {
        float _1810 = _1778 + (-1.0);
        _1772 = _1810;
    }
    float _1812 = _1772;
    float _1814 = _1812;
    if (_1724)
    {
        float _1816 = _1746 * _1800;
        _1544 = _1816;
    }
    float _1818 = _1544;
    if (!_1724)
    {
        _1802 = _1712;
    }
    float _1820 = _1802;
    float _1822 = _1820;
    if (_1724)
    {
        float _1824 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1824;
    }
    float _1826 = _1568;
    if (_1724)
    {
        float _1828 = _1712 * _1818;
        _1822 = _1828;
    }
    float _1830 = _1822;
    if (!_1724)
    {
        _1814 = _1714;
    }
    float _1832 = _1814;
    float _1834 = _1832;
    if (_1724)
    {
        float _1836 = _1714 * _1818;
        _1834 = _1836;
    }
    float _1838 = _1834;
    if (_1724)
    {
        float _1840 = fma(_1784, _1778, _1826);
        _1806 = _1840;
    }
    float _1842 = _1806;
    if (_1724)
    {
        float _1844 = _1830 * _1830;
        _1796 = _1844;
    }
    float _1846 = _1796;
    if (!_1724)
    {
        _1808 = _1718;
    }
    float _1848 = _1808;
    float _1850 = _1848;
    if (_1724)
    {
        float _1852 = _1838 * _1838;
        _1850 = _1852;
    }
    float _1854 = _1850;
    float _1856 = fma(_1842, _1842, _1846);
    float _1858 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1860 = _1856 + _1854;
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1864 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1862);
    float _1866 = precise::clamp(_1864, 0.0, 1.0);
    float _1868 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1858);
    float _1870 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1872 = rsqrt(_1860);
    float _1874 = -_1866;
    float _1876 = _1874 + 1.0;
    float _1878 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1880 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1882 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1870);
    float _1884 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1886 = _1878 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1888 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1880);
    float _1890 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1882);
    float _1892 = abs(_1876);
    float _1894 = log2(_1892);
    float _1896 = fma(_1618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1884);
    float _1898 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1888);
    float _1900 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1902 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1904 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1896);
    float _1906 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1908 = _1872 * _1830;
    float _1910 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1912 = _1872 * _1842;
    float _1914 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1916 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1918 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1910);
    float _1920 = _1872 * _1838;
    float _1922 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1924 = -_1916;
    float _1926 = fma(_1912, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1924);
    float _1928 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1918);
    float _1930 = -_1914;
    float _1932 = fma(_1930, _1902, 1.0);
    float _1934 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1936 = -_1920;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1926);
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1928);
    float _1942 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1944 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1938, -0.5, 0.5);
    float _1948 = log2(_1932);
    float _1950 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1942);
    float _1952 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1954 = fma(_1938, 0.5, 0.5);
    float _1956 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1950);
    float _1958 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1952);
    float _1960 = _1912 + 1.0;
    float _1962 = exp2(_1934);
    float _1964 = fma(_1954, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1966 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1956);
    float _1968 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1958);
    float _1970 = fma(_1954, _1964, -0.212114393711090087890625);
    float _1972 = 1.0 / _1940;
    float _1974 = _1948 * 0.693147182464599609375;
    float _1976 = fma(_1954, _1970, 1.570728778839111328125);
    float _1978 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1980 = sqrt(_1946);
    float _1982 = -_1912;
    float _1984 = fma(_1962, _1960, _1982);
    float _1986 = fma(_1984, 0.5, 0.5);
    float _1988 = _1966 * _1972;
    float _1990 = _1968 * _1972;
    float _1992 = fma(_1988, 0.5, 0.5);
    float _1994 = fma(_1990, -0.5, 0.5);
    float _1996 = _1980 * 0.636619746685028076171875;
    float3 _5482 = float3(_1992, _1994, _1978);
    float _1998 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5482, float3(0.0), isnan(_5482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5482, float3(0.0), isnan(_5482)), level(0.0)).x;
    float _2000 = -_1976;
    float _2002 = fma(_1996, _2000, 1.0);
    float3 _5498 = float3(_1992, _1994, _1978);
    float4 _2005 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5498, float3(0.0), isnan(_5498)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5498, float3(0.0), isnan(_5498)), level(0.0)).xyzw;
    float _2007 = _2005.x;
    float _2009 = _2005.y;
    float _2011 = _2005.z;
    float _2013 = _2005.w;
    float2 _5515 = float2(_2002, _1986);
    float3 _2017 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5515, float2(0.0), isnan(_5515)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5515, float2(0.0), isnan(_5515)), level(0.0)).xyz;
    float _2019 = _2017.x;
    float _2021 = _2017.y;
    float _2023 = _2017.z;
    float _2025 = in.m_59.y;
    float _2027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2029;
    float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2035 = _2033 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2037;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2045 = 1.0 / _2031;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2049 = _2047 != 0;
    int _2051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2053 = _2051 != 0;
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2057 = _722 + _2055;
    bool _2059 = _724 > 0.5;
    float _2061 = 1.0 / _2035;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _2063 = _592 > 0.5;
    bool _2065 = _2063 && _2053;
    float _2067 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2069 = _722 + _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2073 = _722 + _2071;
    float _2075 = 1.0 / _2039;
    float _2077 = -_2025;
    float _2079 = _2077 + 1.0;
    float _2081 = _2069 * _2045;
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _2083;
    float _2087 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2089 = _2025;
    if (_2049)
    {
        float _2091 = _2059 ? _2079 : _2025;
        _2089 = _2091;
    }
    float _2093 = _2089;
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2097 = _722 + _2095;
    float _2099 = 1.0 / _2043;
    float _2101 = in.m_59.x;
    float _2103 = _2073 * _2061;
    float _2105 = fma(_2087, _2093, -0.5);
    float _2107 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2109 = _722 + _2107;
    bool _2111 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2113 = isnan(_722);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2119 = _2115 || _2117;
    float _2121 = float(_2119);
    float _2123 = -_824;
    float _2125 = fma(_822, _2105, _2123);
    float _2127 = _2057 * _2075;
    float _2129 = 1.0 / _2085;
    bool _2131 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _2133 = isnan(_722);
    bool _2135 = _2131 || _2133;
    bool _2137 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _2139 = _2135 || _2137;
    float _2141 = float(_2139);
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2143;
    bool _2147 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2149 = isnan(_722);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2155 = _2151 || _2153;
    float _2157 = float(_2155);
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2165 = _2163 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2167 = _2097 * _2099;
    float _2169 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2169;
    float _2173 = fma(_2161, _2081, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2175;
    float _2179 = -_2141;
    float _2181 = _2179 + 1.0;
    float _2183 = fma(_2171, _2081, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2185 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2187 = _2185 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2189 = fma(_2177, _2081, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2191 = -_2157;
    float _2193 = _2191 + 1.0;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2197 = _2195 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2199 = _2157 * _2181;
    float _2201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2203 = _2121 * _2193;
    float _2205 = fma(_2187, _2103, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2207 = 0.0;
    if (_2053)
    {
        _2207 = _2101;
    }
    float _2209 = _2207;
    float _2211 = fma(_2165, _2103, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2213 = fma(_2197, _2103, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2215 = -_2121;
    float _2217 = _2215 + 1.0;
    bool _2219 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2221 = isnan(_722);
    bool _2223 = _2219 || _2221;
    bool _2225 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2227 = _2223 || _2225;
    float _2229 = float(_2227);
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2231;
    float _2235 = _2209;
    if (_2065)
    {
        float _2237 = -_2209;
        float _2239 = _2237 + 1.0;
        _2235 = _2239;
    }
    float _2241 = _2235;
    bool _2243 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2245 = isnan(_722);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2255;
    float _2259 = _2109 * _2129;
    float _2261 = -_2229;
    float _2263 = _2261 + 1.0;
    float _2265 = _2229 * _2217;
    float _2267 = _2129;
    if (!_2053)
    {
        _2267 = _2101;
    }
    float _2269 = _2267;
    float _2271 = fma(_2145, _2127, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2273 = fma(_2233, _2127, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2275 = fma(_2257, _2127, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2277 = _2269;
    if (_2053)
    {
        _2277 = _2241;
    }
    float _2279 = _2277;
    float _2281 = _2253 * _2263;
    bool _2283 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2285 = isnan(_722);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2291 = _2287 || _2289;
    float _2293 = float(_2291);
    float _2295 = -_2253;
    float _2297 = _2295 + 1.0;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2301 = _2299 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2303 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2305 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2307 = _2305 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2309 = _2293 * _2297;
    float _2311 = -_2293;
    float _2313 = _2311 + 1.0;
    float _2315 = fma(_2303, _2279, -0.5);
    float _2317 = fma(_2301, _2167, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2319 = _2189 * _2309;
    float _2321 = _2173 * _2309;
    float _2323 = fma(_826, _2315, _830);
    float _2325 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2319);
    float _2327 = _2183 * _2309;
    float _2329 = _2323 + 0.5;
    float _2331 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2321);
    float _2333 = fma(_2205, _2281, _2325);
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _2335;
    float _2339 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2327);
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2343 = _2341 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2345 = fma(_2337, _2259, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _2347 = _2125 + 0.5;
    float _2349 = fma(_2211, _2281, _2331);
    float _2351 = fma(_2213, _2281, _2339);
    float _2353 = fma(_2307, _2167, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    out.m_63.x = _2329;
    out.m_63.y = _2347;
    float _2355 = fma(_2343, _2167, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _2357 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2359 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _2357;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2363 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _2361;
    float _2365 = fma(_2271, _2265, _2333);
    float _2367 = fma(_2273, _2265, _2349);
    float _2369 = fma(_2275, _2265, _2351);
    float _2371 = fma(_2359, _2259, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _2373 = fma(_2363, _2259, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _2375 = fma(_2317, _2203, _2365);
    float _2377 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2379 = fma(_2353, _2203, _2367);
    float _2381 = fma(_2355, _2203, _2369);
    float _2383 = _1900 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2385 = exp2(_2377);
    float _2387 = fma(_2345, _2199, _2375);
    float _2389 = fma(_2371, _2199, _2379);
    float _2391 = fma(_2373, _2199, _2381);
    float _2393 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2383);
    float _2395 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2397 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2387);
    float _2399 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2389);
    float _2401 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2391);
    float _2403 = _1940 * 0.5;
    float _2405 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2407 = _694 * _2395;
    float _2409 = fma(_1968, -0.5, _2403);
    float _2411 = _2397 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2413 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2415 = -_2385;
    float _2417 = _2415 + 1.0;
    float _2419 = _2401 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2421 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2405);
    bool _2423 = _1686 > 0.0;
    bool _2425 = isnan(_1686);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(0.0);
    bool _2431 = _2427 || _2429;
    float _2433 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2437 = _2411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2439 = _2413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2441 = _2419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2443 = _2421 + _1940;
    float _2445 = _1966 + _1940;
    float _2447 = _2407 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2437;
    out.m_65.y = _2439;
    out.m_65.z = _2441;
    out.m_65.w = _2435;
    float _2449 = _2443 * 0.5;
    float _2451 = _2445 * 0.5;
    out.gl_Position.x = _1966;
    out.gl_Position.y = _1968;
    out.gl_Position.z = _2421;
    out.gl_Position.w = _1940;
    out.m_67.x = _2451;
    out.m_67.y = _2409;
    out.m_67.z = _2449;
    out.m_67.w = _1940;
    out.m_45.x = _2447;
    float _2453 = _2433 * _1998;
    float _2455 = -_2433;
    float _2457 = _2455 + 1.0;
    float _2459 = _2013 * _2453;
    float _2461 = _2023 * _2453;
    float _2463 = fma(_2019, _2459, _2007);
    float _2465 = fma(_2021, _2459, _2009);
    float _2467 = _2013 * _2457;
    float _2469 = fma(_2013, _2461, _2011);
    out.m_69.x = _2463;
    out.m_69.y = _2465;
    out.m_69.z = _2469;
    out.m_69.w = _2467;
    if (_2431)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2471 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2471;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

