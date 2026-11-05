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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_53 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1056 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = in.m_46.w;
    float _97 = trunc(_93);
    int _100 = int(_97);
    float _102 = -_95;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _104;
    bool _108 = _100 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_100);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1629 = as_type<float>(_120);
        out.gl_Position.z = _1629;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _124 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_95);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_100);
    bool _136 = _104 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    int _142 = as_type<int>(_134);
    bool _144 = _140;
    if (_140)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _112;
    if (_140)
    {
        out.m_51.x = 0.0;
    }
    if (_140)
    {
        float _148 = _146 * 5.0;
        _122 = as_type<int>(_148);
    }
    int _150 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1687 = as_type<float>(_150);
        out.gl_Position.z = _1687;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_53.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _156 = in.m_55.x;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _160 = _158 != 0;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _164 = _162 != 0;
    float _166 = in.m_53.y;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _170 = _168 != 0;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _176 = _174 != 0;
    float _178 = in.m_55.y;
    float _180 = in.m_55.w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _184 = in.m_55.z;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _188 = _152;
    if (_160)
    {
        float _190 = -_152;
        float _192 = _190 + 1.0;
        _142 = as_type<int>(_192);
    }
    int _194 = _142;
    float _196 = 0.0;
    if (!_160)
    {
        _196 = _152;
    }
    float _198 = _196;
    float _200 = _172 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _202 = in.m_57.w;
    float _204 = _198;
    float _206 = _156;
    if (_160)
    {
        bool _208 = _156 > 0.5;
        _144 = _208;
    }
    bool _210 = _144;
    float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _216 = -_166;
    float _218 = _216 + 1.0;
    float _220 = _166;
    float _222 = _218;
    if (_160)
    {
        float _224 = _210 ? as_type<float>(_194) : _152;
        _204 = _224;
    }
    float _226 = _204;
    int _228 = 0;
    if (_170)
    {
        float _230 = -_152;
        float _232 = _230 + 1.0;
        _228 = as_type<int>(_232);
    }
    int _234 = _228;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _238 = _236 != 0;
    bool _240 = _178 > 0.5;
    float _242 = _186 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _244 = _180 > 0.5;
    int _246 = _240 ? as_type<int>(_218) : as_type<int>(_166);
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _252 = _250 != 0;
    float _254 = _238 ? as_type<float>(_246) : _166;
    float _256 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _260 = _258 != 0;
    float _262 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _264 = 0.0;
    float _266 = _256;
    bool _268 = _244;
    if (!_164)
    {
        _264 = _184;
    }
    float _270 = _264;
    float _272 = -_182;
    float _274 = fma(_256, 2.0, _272);
    float _276 = _270;
    if (!_164)
    {
        _266 = _178;
    }
    float _278 = _266;
    float _280 = fma(_262, -2.0, _248);
    float _282 = _154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _286 = _244 ? as_type<int>(_218) : as_type<int>(_166);
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _290 = fma(_282, _254, -0.5);
    float _292 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].w, _284);
    float _294 = _278;
    if (_164)
    {
        _294 = _156;
    }
    float _296 = _294;
    float _298 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[76].y, _280);
    float _300 = _176 ? as_type<float>(_286) : _166;
    float _302 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].w, _292);
    float _304 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[83].z, _288);
    float _306 = 0.0;
    float _308 = _296;
    if (!_164)
    {
        _306 = _270;
    }
    float _310 = _306;
    float _312 = -_298;
    float _314 = fma(_302, _290, _312);
    float _316 = _310;
    if (!_164)
    {
        _308 = _178;
    }
    float _318 = _308;
    int _320 = 0;
    float _322 = _318;
    if (_252)
    {
        float _324 = -_152;
        float _326 = _324 + 1.0;
        _320 = as_type<int>(_326);
    }
    int _328 = _320;
    if (_252)
    {
        bool _330 = _184 > 0.5;
        _268 = _330;
    }
    bool _332 = _268;
    if (_164)
    {
        _276 = _184;
    }
    float _334 = _276;
    float _336 = fma(_300, _200, -0.5);
    if (_164)
    {
        _322 = _156;
    }
    float _338 = _322;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _342 = in.m_46.x;
    float _344 = in.m_46.y;
    float _346 = in.m_46.z;
    float _348 = 0.0;
    if (!_164)
    {
        _348 = _310;
    }
    float _350 = _348;
    float _352 = _338 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _354 = _350;
    if (_164)
    {
        _354 = _178;
    }
    float _356 = _354;
    if (_164)
    {
        _316 = _178;
    }
    float _358 = _316;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _362 = -_340;
    float _364 = fma(_352, 2.0, _362);
    float _366 = 0.0;
    if (!_252)
    {
        _366 = _152;
    }
    float _368 = _366;
    float _370 = in.m_44.x;
    float _372 = in.m_44.y;
    float _374 = in.m_44.z;
    float _376 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _360);
    float _378 = _368;
    if (_164)
    {
        _206 = _334;
    }
    float _380 = _206;
    bool _382 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _386 = _382 || _384;
    bool _388 = isnan(1.0);
    bool _390 = _386 || _388;
    bool _392 = _334 > 0.5;
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[84].z, _214);
    if (_252)
    {
        float _396 = _332 ? as_type<float>(_328) : _152;
        _378 = _396;
    }
    float _398 = _378;
    float _400 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _404 = _400;
    if (_260)
    {
        float _406 = _392 ? _218 : _166;
        _220 = _406;
    }
    float _408 = _220;
    if (_170)
    {
        float _410 = _240 ? as_type<float>(_234) : _152;
        _188 = _410;
    }
    float _412 = _188;
    float _414 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[83].w, _402);
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _418 = as_type<int>(_416);
    if (!_390)
    {
        float _420 = _400 * _400;
        float _422 = _420 * 0.5;
        _222 = _422;
    }
    float _424 = _222;
    float _426 = _356 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _428 = _424;
    if (!_390)
    {
        float _430 = _424 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _430;
    }
    float _432 = _428;
    bool _434 = !_390;
    float _436 = _432;
    if (!_434)
    {
        float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _440 = log2(_438);
        float _442 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _444 = _442 + 1.0;
        float _446 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _448 = _400 * _440;
        float _450 = 1.0 / _444;
        float _452 = _446 * 0.693147182464599609375;
        float _454 = exp2(_448);
        float _456 = 1.0 / _452;
        float _458 = _454 + (-1.0);
        float _460 = -_458;
        float _462 = fma(_460, _456, _400);
        float _464 = _462 * _450;
        float _466 = _464 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _436 = _466;
    }
    float _468 = _436;
    bool _470 = !_390;
    if (!_470)
    {
        float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _474 = log2(_472);
        float _476 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _478 = _476 + 1.0;
        float _480 = 1.0 / _478;
        float _482 = _400 * _474;
        float _484 = exp2(_482);
        float _486 = -_484;
        float _488 = _486 + 1.0;
        float _490 = _488 * _480;
        _404 = _490;
    }
    float _492 = _404;
    float _494 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _496 = fma(_426, -2.0, _416);
    float _498 = fma(_242, _226, -0.5);
    float _500 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _502 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _504 = fma(_492, _344, _494);
    float _506 = _212 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _508 = fma(_492, _346, _500);
    float _510 = fma(_492, _342, _502);
    float _512 = fma(_504, _202, _372);
    float _514 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[84].x, _394);
    float _516 = fma(_508, _202, _374);
    float _518 = fma(_510, _202, _370);
    float _520 = _512 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _522 = _512 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _524 = _512 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _526 = fma(_506, _398, -0.5);
    float _528 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
    float _530 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
    float _532 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
    float _534 = _514 * (-0.15915493667125701904296875);
    float _536 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
    float _538 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[4].z, _530);
    float _540 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].z, _376);
    float _542 = -_104;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _274);
    float _546 = _536 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _548 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
    float _550 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _552 = _534 * 6.283185482025146484375;
    float _554 = cos(_552);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _558 = _546 + _556;
    float _560 = fma(_540, _498, _544);
    float _562 = _548 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _566 = _550 + _564;
    float _568 = _558 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _570 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].z, _304);
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _574 = _562 + _572;
    float _576 = _534 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = -_104;
    float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[81].x, _364);
    float _584 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[81].y, _496);
    float _586 = _412 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _588 = _408 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _592 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[28].x, _568);
    float _594 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].w, _414);
    float _596 = _558 * _558;
    float _598 = _554 * _336;
    float _600 = fma(_574, (*spvDescriptorSet0.vp_c8)._m0[28].z, _592);
    float _602 = fma(_566, _566, _596);
    float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _606 = _578 * _336;
    bool _608 = _600 >= 0.0;
    float _610 = fma(_578, _526, _598);
    float _612 = fma(_574, _574, _602);
    float _614 = -_606;
    float _616 = fma(_554, _526, _614);
    float _618 = -_584;
    float _620 = fma(_594, _610, _618);
    float _622 = rsqrt(_612);
    float _624 = _586 * _590;
    float _626 = fma(_570, _616, _582);
    float _628 = _314 + 0.5;
    float _630 = _560 + 0.5;
    float _632 = _620 + 0.5;
    float _634 = _626 + 0.5;
    float _636 = _590;
    int _638 = as_type<int>(_634);
    if (_608)
    {
        _636 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _640 = _636;
    float _642 = _588 * _604;
    if (_608)
    {
        out.m_51.x = 0.0;
    }
    if (_608)
    {
        float _644 = _640 * 5.0;
        _418 = as_type<int>(_644);
    }
    int _646 = _418;
    out.m_59.x = _624;
    out.m_59.y = _642;
    float _648 = _558 * _622;
    out.m_61.x = _630;
    out.m_61.y = _628;
    out.m_61.z = _634;
    out.m_61.w = _632;
    float _650 = _566 * _622;
    float _652 = _648;
    if (_608)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2559 = as_type<float>(_646);
        out.gl_Position.z = _2559;
    }
    if (_608)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _654 = -_648;
    float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    float _658 = _574 * _622;
    float _660 = -_650;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _550);
    float _664 = -_648;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _670 = _656 + _668;
    float _672 = -_658;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _678 = _662 + _676;
    float _680 = -_650;
    float _682 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _566);
    float _684 = _670 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _688 = _674 + _686;
    float _690 = _666 * _666;
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[28].x, _684);
    float _694 = -_658;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _698 = fma(_682, _682, _690);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[28].z, _692);
    float _702 = fma(_696, _696, _698);
    bool _704 = _700 >= 0.0;
    float _706 = _700;
    if (_704)
    {
        _706 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _708 = _706;
    if (_704)
    {
        out.m_51.x = 0.0;
    }
    if (_704)
    {
        float _710 = _708 * 5.0;
        _638 = as_type<int>(_710);
    }
    int _712 = _638;
    if (_704)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2680 = as_type<float>(_712);
        out.gl_Position.z = _2680;
    }
    if (_704)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _714 = in.m_57.x;
    float _716 = in.m_57.y;
    float _718 = in.m_57.z;
    float _720 = sqrt(_702);
    float _722 = in.m_63.x;
    float _724 = in.m_63.y;
    float _726 = in.m_63.z;
    float _728 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _730 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _728;
    float _732 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _734 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _732;
    float _736 = _730 * _730;
    float _738 = fma(_734, _734, _736);
    float _740 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _742 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _740;
    float _744 = _622 * _720;
    float _746 = fma(_742, _742, _738);
    float _748 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _750 = sqrt(_746);
    float _752 = _714 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _754 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _724);
    float _760 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _722);
    float _764 = _744 * _756;
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _726);
    float _768 = _744 * _760;
    float _770 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _772 = _758 * _764;
    float _774 = _762 * _768;
    float _776 = _744 * _770;
    float _778 = _772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _780 = _772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _782 = fma(_750, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _784 = _766 * _776;
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _778);
    float _788 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _780);
    float _790 = _772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _792 = precise::max(_782, 1.0);
    float _794 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].z, _786);
    float _796 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].z, _788);
    float _798 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _790);
    float _800 = precise::min(_792, 1.89999997615814208984375);
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _804 = _796 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _806 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].z, _798);
    float _808 = in.m_65.x;
    float _810 = in.m_65.y;
    float _812 = in.m_65.z;
    float _814 = fma(_802, _800, _550);
    float _816 = fma(_804, _800, _562);
    float _818 = _806 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _820 = in.m_67.x;
    float _822 = in.m_67.y;
    float _824 = in.m_67.z;
    float _826 = in.m_67.w;
    float _828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _830 = _814 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _816 + _832;
    float _836 = fma(_818, _800, _546);
    float _838 = _830 * _830;
    float _840 = _834 * _834;
    float _842 = _838 + _840;
    float _844 = sqrt(_842);
    float _846 = _808 * _824;
    float _848 = _812 * _822;
    float _850 = _810 * _820;
    float _852 = -_846;
    float _854 = fma(_812, _820, _852);
    float _856 = -_848;
    float _858 = fma(_824, _810, _856);
    bool _860 = _844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _862 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _864 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _866 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _868 = -_850;
    float _870 = fma(_822, _808, _868);
    float _872 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _862);
    float _874 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _864);
    float _876 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _866);
    float _878 = _818;
    float _880 = _820;
    float _882 = _850;
    float _884 = _864;
    float _886 = _784;
    float _888 = _744;
    if (!_860)
    {
        _878 = _840;
    }
    float _890 = _878;
    float _892 = _890;
    if (!_860)
    {
        _880 = _838;
    }
    float _894 = _880;
    float _896 = _894;
    if (!_860)
    {
        _882 = _814;
    }
    float _898 = _882;
    float _900 = _898;
    if (!_860)
    {
        _884 = _816;
    }
    float _902 = _884;
    float _904 = _902;
    if (!_860)
    {
        _886 = _836;
    }
    float _906 = _886;
    bool _908 = !_860;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _844 + _914;
        float _918 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _920 = rsqrt(_842);
        float _922 = _916 * _912;
        float _924 = _922 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = sin(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = cos(_930);
        float _934 = fma(_928, _918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _936 = _920 * _934;
        float _938 = _932 + (-1.0);
        float _940 = fma(_830, _936, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _942 = fma(_834, _936, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _944 = _938 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _946 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _948 = _940 + _946;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _952 = _942 + _950;
        float _954 = fma(_836, _932, _944);
        float _956 = _948 * _948;
        float _958 = _952 * _952;
        _910 = _954;
        _896 = _956;
        _892 = _958;
        _900 = _940;
        _904 = _942;
    }
    float _960 = _910;
    float _962 = _896;
    float _964 = _892;
    float _966 = _900;
    float _968 = _904;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _972 = _960 + _970;
    float _974 = _854 * _826;
    float _976 = _858 * _826;
    float _978 = _870 * _826;
    float _980 = fma(_972, _972, _962);
    float _982 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _984 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _986 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _988 = _980 + _964;
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _982);
    float _992 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _984);
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _986);
    float _996 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].z, _872);
    float _998 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _1000 = sqrt(_988);
    float _1002 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _992);
    float _1004 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].z, _876);
    float _1006 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _990);
    float _1008 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _994);
    out.m_69.x = _650;
    out.m_69.y = _648;
    out.m_69.z = _658;
    out.m_71.x = _996;
    out.m_71.y = _998;
    out.m_71.z = _1004;
    out.m_73.x = _1006;
    out.m_73.y = _1002;
    out.m_73.z = _1008;
    bool _1010 = _1000 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1012 = isnan(_1000);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1018 = _1014 || _1016;
    float _1020 = _978;
    if (!_1018)
    {
        _1020 = 1.0;
    }
    float _1022 = _1020;
    bool _1024 = !_1018;
    float _1026 = _1022;
    if (!_1024)
    {
        bool _1028 = _1000 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1030 = isnan(_1000);
        bool _1032 = _1028 || _1030;
        bool _1034 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1036 = _1032 || _1034;
        if (!_1036)
        {
            float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1040 = _1000 + _1038;
            float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1044 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1042;
            float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1050 = 1.0 / _1044;
            float _1052 = _1040 * _1050;
            float _1054 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1026 = _1054;
            _1056 = true;
        }
        else
        {
            bool _1058 = _1000 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1060 = isnan(_1000);
            bool _1062 = _1058 || _1060;
            bool _1064 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1066 = _1062 || _1064;
            if (!_1066)
            {
                float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1070 = _1000 + _1068;
                float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1074 = _1072 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1076 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1078 = _1076 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1080 = 1.0 / _1074;
                float _1082 = _1070 * _1080;
                float _1084 = fma(_1082, _1078, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1026 = _1084;
                _1056 = true;
            }
            else
            {
                _1026 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1056 = false;
    float _1086 = _1026;
    float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1090 = _966 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1094 = _960 + _1092;
    bool _1096 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan(0.5);
    bool _1104 = _1100 || _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1108 = _968 + _1106;
    float _1110 = fma(_1090, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1112 = fma(_1094, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1114 = fma(_1108, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1116 = -_650;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1110);
    float _1120 = -_648;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1112);
    float _1124 = -_658;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1114);
    float _1128 = _1118;
    float _1130 = _1122;
    float _1132 = _1110;
    if (_1104)
    {
        _652 = _1118;
    }
    float _1134 = _652;
    float _1136 = _1134;
    if (_1104)
    {
        _1128 = _1126;
    }
    float _1138 = _1128;
    float _1140 = _1138;
    if (!_1104)
    {
        float _1142 = _670 * _670;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1146 = -_562;
        float _1148 = _1146 + _1114;
        float _1150 = -_546;
        float _1152 = _1150 + _1112;
        float _1154 = fma(_678, _678, _1142);
        float _1156 = fma(_688, _688, _1154);
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1160 = sqrt(_1156);
        float _1162 = 1.0 / _744;
        float _1164 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1166 = precise::min(_1160, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1168 = _1166 * _1144;
        float _1170 = -_550;
        float _1172 = _1170 + _1110;
        float _1174 = _1168 * _1162;
        float _1176 = _1164 * _1174;
        float _1178 = _1148 * _1174;
        float _1180 = fma(_1172, _1176, _662);
        float _1182 = fma(_1152, _1176, _656);
        float _1184 = fma(_1164, _1178, _674);
        _1130 = _1182;
        _1136 = _1180;
        _1140 = _1184;
        _888 = _1162;
    }
    float _1186 = _1130;
    float _1188 = _1136;
    float _1190 = _1140;
    float _1192 = _888;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1196 = _1186 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1200 = _1188 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1204 = _1190 + _1202;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1208 = _1196 * _1196;
    float _1210 = fma(_1200, _1200, _1208);
    float _1212 = fma(_1204, _1204, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1200 * _1216;
    float _1220 = _1204 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1210;
    float _1238 = _1234;
    float _1240 = _1196;
    float _1242 = _1192;
    float _1244 = _1218;
    if (_1230)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1246;
    }
    float _1248 = _1236;
    float _1250 = _1248;
    if (_1230)
    {
        float _1252 = _1234 * _1248;
        _1238 = _1252;
    }
    float _1254 = _1238;
    if (_1230)
    {
        float _1256 = rsqrt(_1226);
        _1250 = _1256;
    }
    float _1258 = _1250;
    float _1260 = _1258;
    if (_1230)
    {
        float _1262 = _1254 * 0.15915493667125701904296875;
        _1132 = _1262;
    }
    float _1264 = _1132;
    float _1266 = precise::max(0.0, _1206);
    float _1268 = _1204;
    float _1270 = _1266;
    if (_1230)
    {
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        _1268 = _1274;
    }
    float _1276 = _1268;
    float _1278 = -_1216;
    float _1280 = -_1266;
    float _1282 = fma(_1196, _1278, _1280);
    float _1284 = _1282;
    if (_1230)
    {
        float _1286 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1286;
    }
    float _1288 = _1240;
    float _1290 = _1214;
    float _1292 = _1288;
    if (_1230)
    {
        float _1294 = _1264 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        _1290 = _1296;
    }
    float _1298 = _1290;
    float _1300 = _1276;
    if (_1230)
    {
        float _1302 = fma(_1276, _1288, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1300 = _1302;
    }
    float _1304 = _1300;
    float _1306 = sqrt(_1212);
    float _1308 = _1304;
    if (!_1230)
    {
        _1292 = _1222;
    }
    float _1310 = _1292;
    float _1312 = _1310;
    if (_1230)
    {
        float _1314 = _1258 * _1304;
        _1242 = _1314;
    }
    float _1316 = _1242;
    if (!_1230)
    {
        _1308 = _1220;
    }
    float _1318 = _1308;
    float _1320 = _1318;
    if (_1230)
    {
        float _1322 = _1298 + (-1.0);
        _1270 = _1322;
    }
    float _1324 = _1270;
    float _1326 = _1324;
    if (_1230)
    {
        float _1328 = _1218 * _1316;
        _1244 = _1328;
    }
    float _1330 = _1244;
    if (_1230)
    {
        float _1332 = _1220 * _1316;
        _1320 = _1332;
    }
    float _1334 = _1320;
    float _1336 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1230)
    {
        float _1338 = _1324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1260 = _1338;
    }
    float _1340 = _1260;
    if (_1230)
    {
        float _1342 = _1330 * _1330;
        _1312 = _1342;
    }
    float _1344 = _1312;
    if (!_1230)
    {
        _1326 = _1224;
    }
    float _1346 = _1326;
    float _1348 = _1346;
    if (_1230)
    {
        float _1350 = _1334 * _1334;
        _1348 = _1350;
    }
    float _1352 = _1348;
    if (_1230)
    {
        float _1354 = fma(_1282, _1298, _1340);
        _1284 = _1354;
    }
    float _1356 = _1284;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1360 = fma(_1356, _1356, _1344);
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1364 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1362);
    float _1366 = precise::clamp(_1364, 0.0, 1.0);
    float _1368 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1370 = _1360 + _1352;
    float _1372 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1374 = -_1366;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1368);
    float _1380 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1382 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1384 = rsqrt(_1370);
    float _1386 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1378);
    float _1388 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1380);
    float _1390 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1382);
    float _1392 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1336);
    float _1394 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1390);
    float _1398 = abs(_1376);
    float _1400 = log2(_1398);
    float _1402 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1392);
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = -_1404;
    float _1410 = fma(_1408, _1358, 1.0);
    float _1412 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1384 * _1330;
    float _1418 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1422 = _1384 * _1356;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1384 * _1334;
    float _1428 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1430 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1420);
    float _1432 = -_1424;
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1432);
    float _1436 = log2(_1410);
    float _1438 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1440 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1430);
    float _1442 = -_1426;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1434);
    float _1446 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1448 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1438);
    float _1450 = fma(_1444, -0.5, 0.5);
    float _1452 = exp2(_1428);
    float _1454 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1446);
    float _1456 = fma(_1444, 0.5, 0.5);
    float _1458 = _1422 + 1.0;
    float _1460 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1448);
    float _1462 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1454);
    float _1464 = fma(_1456, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1466 = 1.0 / _1440;
    float _1468 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1462);
    float _1470 = fma(_1456, _1464, -0.212114393711090087890625);
    float _1472 = _1436 * 0.693147182464599609375;
    float _1474 = fma(_1456, _1470, 1.570728778839111328125);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1478 = sqrt(_1450);
    float _1480 = -_1422;
    float _1482 = fma(_1452, _1458, _1480);
    float _1484 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1460);
    float _1486 = fma(_1482, 0.5, 0.5);
    float _1488 = _1468 * _1466;
    float _1490 = _1484 * _1466;
    float _1492 = fma(_1488, 0.5, 0.5);
    float _1494 = fma(_1490, -0.5, 0.5);
    float _1496 = _1478 * 0.636619746685028076171875;
    float _1498 = -_1474;
    float _1500 = fma(_1496, _1498, 1.0);
    float3 _4007 = float3(_1492, _1494, _1476);
    float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4007, float3(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4007, float3(0.0), isnan(_4007)), level(0.0)).x;
    float3 _4018 = float3(_1492, _1494, _1476);
    float4 _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4018, float3(0.0), isnan(_4018)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4018, float3(0.0), isnan(_4018)), level(0.0)).xyzw;
    float _1507 = _1505.x;
    float _1509 = _1505.y;
    float _1511 = _1505.z;
    float _1513 = _1505.w;
    float2 _4035 = float2(_1500, _1486);
    float3 _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4035, float2(0.0), isnan(_4035)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4035, float2(0.0), isnan(_4035)), level(0.0)).xyz;
    float _1519 = _1517.x;
    float _1521 = _1517.y;
    float _1523 = _1517.z;
    float _1525 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1527 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _662;
    out.m_75.y = _656;
    out.m_75.z = _674;
    float _1529 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1527);
    float _1531 = exp2(_1525);
    float _1533 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1529);
    float _1535 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1533);
    out.gl_Position.x = _1468;
    out.gl_Position.y = _1484;
    out.gl_Position.z = _1535;
    out.gl_Position.w = _1440;
    float _1537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1539 = -_1531;
    float _1541 = _1539 + 1.0;
    float _1543 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.w = _1537;
    float _1545 = -_1543;
    float _1547 = _1545 + 1.0;
    float _1549 = _1543 * _1502;
    float _1551 = _1513 * _1549;
    float _1553 = _1523 * _1549;
    float _1555 = _1513 * _1547;
    out.m_51.x = 1.0;
    float _1557 = fma(_1519, _1551, _1507);
    float _1559 = fma(_1521, _1551, _1509);
    float _1561 = fma(_1513, _1553, _1511);
    out.m_79.x = _1557;
    out.m_79.y = _1559;
    out.m_79.z = _1561;
    out.m_79.w = _1555;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1056 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = in.m_46.w;
    float _97 = trunc(_93);
    int _100 = int(_97);
    float _102 = -_95;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _104;
    bool _108 = _100 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_100);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1629 = as_type<float>(_120);
        out.gl_Position.z = _1629;
    }
    if (!_108)
    {
        return out;
    }
    bool _124 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_95);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_100);
    bool _136 = _104 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    int _142 = as_type<int>(_134);
    bool _144 = _140;
    if (_140)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _112;
    if (_140)
    {
        out.m_51.x = 0.0;
    }
    if (_140)
    {
        float _148 = _146 * 5.0;
        _122 = as_type<int>(_148);
    }
    int _150 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1687 = as_type<float>(_150);
        out.gl_Position.z = _1687;
    }
    if (_140)
    {
        return out;
    }
    float _152 = in.m_53.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _156 = in.m_55.x;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _160 = _158 != 0;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _164 = _162 != 0;
    float _166 = in.m_53.y;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _170 = _168 != 0;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _176 = _174 != 0;
    float _178 = in.m_55.y;
    float _180 = in.m_55.w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _184 = in.m_55.z;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _188 = _152;
    if (_160)
    {
        float _190 = -_152;
        float _192 = _190 + 1.0;
        _142 = as_type<int>(_192);
    }
    int _194 = _142;
    float _196 = 0.0;
    if (!_160)
    {
        _196 = _152;
    }
    float _198 = _196;
    float _200 = _172 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _202 = in.m_57.w;
    float _204 = _198;
    float _206 = _156;
    if (_160)
    {
        bool _208 = _156 > 0.5;
        _144 = _208;
    }
    bool _210 = _144;
    float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _216 = -_166;
    float _218 = _216 + 1.0;
    float _220 = _166;
    float _222 = _218;
    if (_160)
    {
        float _224 = _210 ? as_type<float>(_194) : _152;
        _204 = _224;
    }
    float _226 = _204;
    int _228 = 0;
    if (_170)
    {
        float _230 = -_152;
        float _232 = _230 + 1.0;
        _228 = as_type<int>(_232);
    }
    int _234 = _228;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _238 = _236 != 0;
    bool _240 = _178 > 0.5;
    float _242 = _186 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _244 = _180 > 0.5;
    int _246 = _240 ? as_type<int>(_218) : as_type<int>(_166);
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _252 = _250 != 0;
    float _254 = _238 ? as_type<float>(_246) : _166;
    float _256 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _260 = _258 != 0;
    float _262 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _264 = 0.0;
    float _266 = _256;
    bool _268 = _244;
    if (!_164)
    {
        _264 = _184;
    }
    float _270 = _264;
    float _272 = -_182;
    float _274 = fma(_256, 2.0, _272);
    float _276 = _270;
    if (!_164)
    {
        _266 = _178;
    }
    float _278 = _266;
    float _280 = fma(_262, -2.0, _248);
    float _282 = _154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _286 = _244 ? as_type<int>(_218) : as_type<int>(_166);
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _290 = fma(_282, _254, -0.5);
    float _292 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].w, _284);
    float _294 = _278;
    if (_164)
    {
        _294 = _156;
    }
    float _296 = _294;
    float _298 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[76].y, _280);
    float _300 = _176 ? as_type<float>(_286) : _166;
    float _302 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].w, _292);
    float _304 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[83].z, _288);
    float _306 = 0.0;
    float _308 = _296;
    if (!_164)
    {
        _306 = _270;
    }
    float _310 = _306;
    float _312 = -_298;
    float _314 = fma(_302, _290, _312);
    float _316 = _310;
    if (!_164)
    {
        _308 = _178;
    }
    float _318 = _308;
    int _320 = 0;
    float _322 = _318;
    if (_252)
    {
        float _324 = -_152;
        float _326 = _324 + 1.0;
        _320 = as_type<int>(_326);
    }
    int _328 = _320;
    if (_252)
    {
        bool _330 = _184 > 0.5;
        _268 = _330;
    }
    bool _332 = _268;
    if (_164)
    {
        _276 = _184;
    }
    float _334 = _276;
    float _336 = fma(_300, _200, -0.5);
    if (_164)
    {
        _322 = _156;
    }
    float _338 = _322;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _342 = in.m_46.x;
    float _344 = in.m_46.y;
    float _346 = in.m_46.z;
    float _348 = 0.0;
    if (!_164)
    {
        _348 = _310;
    }
    float _350 = _348;
    float _352 = _338 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _354 = _350;
    if (_164)
    {
        _354 = _178;
    }
    float _356 = _354;
    if (_164)
    {
        _316 = _178;
    }
    float _358 = _316;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _362 = -_340;
    float _364 = fma(_352, 2.0, _362);
    float _366 = 0.0;
    if (!_252)
    {
        _366 = _152;
    }
    float _368 = _366;
    float _370 = in.m_44.x;
    float _372 = in.m_44.y;
    float _374 = in.m_44.z;
    float _376 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _360);
    float _378 = _368;
    if (_164)
    {
        _206 = _334;
    }
    float _380 = _206;
    bool _382 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _386 = _382 || _384;
    bool _388 = isnan(1.0);
    bool _390 = _386 || _388;
    bool _392 = _334 > 0.5;
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[84].z, _214);
    if (_252)
    {
        float _396 = _332 ? as_type<float>(_328) : _152;
        _378 = _396;
    }
    float _398 = _378;
    float _400 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _404 = _400;
    if (_260)
    {
        float _406 = _392 ? _218 : _166;
        _220 = _406;
    }
    float _408 = _220;
    if (_170)
    {
        float _410 = _240 ? as_type<float>(_234) : _152;
        _188 = _410;
    }
    float _412 = _188;
    float _414 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[83].w, _402);
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _418 = as_type<int>(_416);
    if (!_390)
    {
        float _420 = _400 * _400;
        float _422 = _420 * 0.5;
        _222 = _422;
    }
    float _424 = _222;
    float _426 = _356 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _428 = _424;
    if (!_390)
    {
        float _430 = _424 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _430;
    }
    float _432 = _428;
    bool _434 = !_390;
    float _436 = _432;
    if (!_434)
    {
        float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _440 = log2(_438);
        float _442 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _444 = _442 + 1.0;
        float _446 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _448 = _400 * _440;
        float _450 = 1.0 / _444;
        float _452 = _446 * 0.693147182464599609375;
        float _454 = exp2(_448);
        float _456 = 1.0 / _452;
        float _458 = _454 + (-1.0);
        float _460 = -_458;
        float _462 = fma(_460, _456, _400);
        float _464 = _462 * _450;
        float _466 = _464 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _436 = _466;
    }
    float _468 = _436;
    bool _470 = !_390;
    if (!_470)
    {
        float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _474 = log2(_472);
        float _476 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _478 = _476 + 1.0;
        float _480 = 1.0 / _478;
        float _482 = _400 * _474;
        float _484 = exp2(_482);
        float _486 = -_484;
        float _488 = _486 + 1.0;
        float _490 = _488 * _480;
        _404 = _490;
    }
    float _492 = _404;
    float _494 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _496 = fma(_426, -2.0, _416);
    float _498 = fma(_242, _226, -0.5);
    float _500 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _502 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _504 = fma(_492, _344, _494);
    float _506 = _212 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _508 = fma(_492, _346, _500);
    float _510 = fma(_492, _342, _502);
    float _512 = fma(_504, _202, _372);
    float _514 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[84].x, _394);
    float _516 = fma(_508, _202, _374);
    float _518 = fma(_510, _202, _370);
    float _520 = _512 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _522 = _512 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _524 = _512 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _526 = fma(_506, _398, -0.5);
    float _528 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
    float _530 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
    float _532 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
    float _534 = _514 * (-0.15915493667125701904296875);
    float _536 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
    float _538 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[4].z, _530);
    float _540 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].z, _376);
    float _542 = -_104;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _274);
    float _546 = _536 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _548 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
    float _550 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _552 = _534 * 6.283185482025146484375;
    float _554 = cos(_552);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _558 = _546 + _556;
    float _560 = fma(_540, _498, _544);
    float _562 = _548 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _566 = _550 + _564;
    float _568 = _558 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _570 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].z, _304);
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _574 = _562 + _572;
    float _576 = _534 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = -_104;
    float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[81].x, _364);
    float _584 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[81].y, _496);
    float _586 = _412 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _588 = _408 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _592 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[28].x, _568);
    float _594 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].w, _414);
    float _596 = _558 * _558;
    float _598 = _554 * _336;
    float _600 = fma(_574, (*spvDescriptorSet0.vp_c8)._m0[28].z, _592);
    float _602 = fma(_566, _566, _596);
    float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _606 = _578 * _336;
    bool _608 = _600 >= 0.0;
    float _610 = fma(_578, _526, _598);
    float _612 = fma(_574, _574, _602);
    float _614 = -_606;
    float _616 = fma(_554, _526, _614);
    float _618 = -_584;
    float _620 = fma(_594, _610, _618);
    float _622 = rsqrt(_612);
    float _624 = _586 * _590;
    float _626 = fma(_570, _616, _582);
    float _628 = _314 + 0.5;
    float _630 = _560 + 0.5;
    float _632 = _620 + 0.5;
    float _634 = _626 + 0.5;
    float _636 = _590;
    int _638 = as_type<int>(_634);
    if (_608)
    {
        _636 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _640 = _636;
    float _642 = _588 * _604;
    if (_608)
    {
        out.m_51.x = 0.0;
    }
    if (_608)
    {
        float _644 = _640 * 5.0;
        _418 = as_type<int>(_644);
    }
    int _646 = _418;
    out.m_59.x = _624;
    out.m_59.y = _642;
    float _648 = _558 * _622;
    out.m_61.x = _630;
    out.m_61.y = _628;
    out.m_61.z = _634;
    out.m_61.w = _632;
    float _650 = _566 * _622;
    float _652 = _648;
    if (_608)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2559 = as_type<float>(_646);
        out.gl_Position.z = _2559;
    }
    if (_608)
    {
        return out;
    }
    float _654 = -_648;
    float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    float _658 = _574 * _622;
    float _660 = -_650;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _550);
    float _664 = -_648;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _670 = _656 + _668;
    float _672 = -_658;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _678 = _662 + _676;
    float _680 = -_650;
    float _682 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _566);
    float _684 = _670 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _688 = _674 + _686;
    float _690 = _666 * _666;
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[28].x, _684);
    float _694 = -_658;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _698 = fma(_682, _682, _690);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[28].z, _692);
    float _702 = fma(_696, _696, _698);
    bool _704 = _700 >= 0.0;
    float _706 = _700;
    if (_704)
    {
        _706 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _708 = _706;
    if (_704)
    {
        out.m_51.x = 0.0;
    }
    if (_704)
    {
        float _710 = _708 * 5.0;
        _638 = as_type<int>(_710);
    }
    int _712 = _638;
    if (_704)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2680 = as_type<float>(_712);
        out.gl_Position.z = _2680;
    }
    if (_704)
    {
        return out;
    }
    float _714 = in.m_57.x;
    float _716 = in.m_57.y;
    float _718 = in.m_57.z;
    float _720 = sqrt(_702);
    float _722 = in.m_63.x;
    float _724 = in.m_63.y;
    float _726 = in.m_63.z;
    float _728 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _730 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _728;
    float _732 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _734 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _732;
    float _736 = _730 * _730;
    float _738 = fma(_734, _734, _736);
    float _740 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _742 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _740;
    float _744 = _622 * _720;
    float _746 = fma(_742, _742, _738);
    float _748 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _750 = sqrt(_746);
    float _752 = _714 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _754 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _724);
    float _760 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _722);
    float _764 = _744 * _756;
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _726);
    float _768 = _744 * _760;
    float _770 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _772 = _758 * _764;
    float _774 = _762 * _768;
    float _776 = _744 * _770;
    float _778 = _772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _780 = _772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _782 = fma(_750, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _784 = _766 * _776;
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _778);
    float _788 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _780);
    float _790 = _772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _792 = precise::max(_782, 1.0);
    float _794 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].z, _786);
    float _796 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].z, _788);
    float _798 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _790);
    float _800 = precise::min(_792, 1.89999997615814208984375);
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _804 = _796 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _806 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].z, _798);
    float _808 = in.m_65.x;
    float _810 = in.m_65.y;
    float _812 = in.m_65.z;
    float _814 = fma(_802, _800, _550);
    float _816 = fma(_804, _800, _562);
    float _818 = _806 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _820 = in.m_67.x;
    float _822 = in.m_67.y;
    float _824 = in.m_67.z;
    float _826 = in.m_67.w;
    float _828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _830 = _814 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _816 + _832;
    float _836 = fma(_818, _800, _546);
    float _838 = _830 * _830;
    float _840 = _834 * _834;
    float _842 = _838 + _840;
    float _844 = sqrt(_842);
    float _846 = _808 * _824;
    float _848 = _812 * _822;
    float _850 = _810 * _820;
    float _852 = -_846;
    float _854 = fma(_812, _820, _852);
    float _856 = -_848;
    float _858 = fma(_824, _810, _856);
    bool _860 = _844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _862 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _864 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _866 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _868 = -_850;
    float _870 = fma(_822, _808, _868);
    float _872 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _862);
    float _874 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _864);
    float _876 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _866);
    float _878 = _818;
    float _880 = _820;
    float _882 = _850;
    float _884 = _864;
    float _886 = _784;
    float _888 = _744;
    if (!_860)
    {
        _878 = _840;
    }
    float _890 = _878;
    float _892 = _890;
    if (!_860)
    {
        _880 = _838;
    }
    float _894 = _880;
    float _896 = _894;
    if (!_860)
    {
        _882 = _814;
    }
    float _898 = _882;
    float _900 = _898;
    if (!_860)
    {
        _884 = _816;
    }
    float _902 = _884;
    float _904 = _902;
    if (!_860)
    {
        _886 = _836;
    }
    float _906 = _886;
    bool _908 = !_860;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _844 + _914;
        float _918 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _920 = rsqrt(_842);
        float _922 = _916 * _912;
        float _924 = _922 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = sin(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = cos(_930);
        float _934 = fma(_928, _918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _936 = _920 * _934;
        float _938 = _932 + (-1.0);
        float _940 = fma(_830, _936, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _942 = fma(_834, _936, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _944 = _938 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _946 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _948 = _940 + _946;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _952 = _942 + _950;
        float _954 = fma(_836, _932, _944);
        float _956 = _948 * _948;
        float _958 = _952 * _952;
        _910 = _954;
        _896 = _956;
        _892 = _958;
        _900 = _940;
        _904 = _942;
    }
    float _960 = _910;
    float _962 = _896;
    float _964 = _892;
    float _966 = _900;
    float _968 = _904;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _972 = _960 + _970;
    float _974 = _854 * _826;
    float _976 = _858 * _826;
    float _978 = _870 * _826;
    float _980 = fma(_972, _972, _962);
    float _982 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _984 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _986 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _988 = _980 + _964;
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _982);
    float _992 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _984);
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _986);
    float _996 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].z, _872);
    float _998 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _1000 = sqrt(_988);
    float _1002 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _992);
    float _1004 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].z, _876);
    float _1006 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _990);
    float _1008 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _994);
    out.m_69.x = _650;
    out.m_69.y = _648;
    out.m_69.z = _658;
    out.m_71.x = _996;
    out.m_71.y = _998;
    out.m_71.z = _1004;
    out.m_73.x = _1006;
    out.m_73.y = _1002;
    out.m_73.z = _1008;
    bool _1010 = _1000 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1012 = isnan(_1000);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1018 = _1014 || _1016;
    float _1020 = _978;
    if (!_1018)
    {
        _1020 = 1.0;
    }
    float _1022 = _1020;
    bool _1024 = !_1018;
    float _1026 = _1022;
    if (!_1024)
    {
        bool _1028 = _1000 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1030 = isnan(_1000);
        bool _1032 = _1028 || _1030;
        bool _1034 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1036 = _1032 || _1034;
        if (!_1036)
        {
            float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1040 = _1000 + _1038;
            float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1044 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1042;
            float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1050 = 1.0 / _1044;
            float _1052 = _1040 * _1050;
            float _1054 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1026 = _1054;
            _1056 = true;
        }
        else
        {
            bool _1058 = _1000 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1060 = isnan(_1000);
            bool _1062 = _1058 || _1060;
            bool _1064 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1066 = _1062 || _1064;
            if (!_1066)
            {
                float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1070 = _1000 + _1068;
                float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1074 = _1072 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1076 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1078 = _1076 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1080 = 1.0 / _1074;
                float _1082 = _1070 * _1080;
                float _1084 = fma(_1082, _1078, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1026 = _1084;
                _1056 = true;
            }
            else
            {
                _1026 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1056 = false;
    float _1086 = _1026;
    float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1090 = _966 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1094 = _960 + _1092;
    bool _1096 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan(0.5);
    bool _1104 = _1100 || _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1108 = _968 + _1106;
    float _1110 = fma(_1090, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1112 = fma(_1094, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1114 = fma(_1108, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1116 = -_650;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1110);
    float _1120 = -_648;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1112);
    float _1124 = -_658;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1114);
    float _1128 = _1118;
    float _1130 = _1122;
    float _1132 = _1110;
    if (_1104)
    {
        _652 = _1118;
    }
    float _1134 = _652;
    float _1136 = _1134;
    if (_1104)
    {
        _1128 = _1126;
    }
    float _1138 = _1128;
    float _1140 = _1138;
    if (!_1104)
    {
        float _1142 = _670 * _670;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1146 = -_562;
        float _1148 = _1146 + _1114;
        float _1150 = -_546;
        float _1152 = _1150 + _1112;
        float _1154 = fma(_678, _678, _1142);
        float _1156 = fma(_688, _688, _1154);
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1160 = sqrt(_1156);
        float _1162 = 1.0 / _744;
        float _1164 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1166 = precise::min(_1160, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1168 = _1166 * _1144;
        float _1170 = -_550;
        float _1172 = _1170 + _1110;
        float _1174 = _1168 * _1162;
        float _1176 = _1164 * _1174;
        float _1178 = _1148 * _1174;
        float _1180 = fma(_1172, _1176, _662);
        float _1182 = fma(_1152, _1176, _656);
        float _1184 = fma(_1164, _1178, _674);
        _1130 = _1182;
        _1136 = _1180;
        _1140 = _1184;
        _888 = _1162;
    }
    float _1186 = _1130;
    float _1188 = _1136;
    float _1190 = _1140;
    float _1192 = _888;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1196 = _1186 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1200 = _1188 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1204 = _1190 + _1202;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1208 = _1196 * _1196;
    float _1210 = fma(_1200, _1200, _1208);
    float _1212 = fma(_1204, _1204, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1200 * _1216;
    float _1220 = _1204 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1210;
    float _1238 = _1234;
    float _1240 = _1196;
    float _1242 = _1192;
    float _1244 = _1218;
    if (_1230)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1246;
    }
    float _1248 = _1236;
    float _1250 = _1248;
    if (_1230)
    {
        float _1252 = _1234 * _1248;
        _1238 = _1252;
    }
    float _1254 = _1238;
    if (_1230)
    {
        float _1256 = rsqrt(_1226);
        _1250 = _1256;
    }
    float _1258 = _1250;
    float _1260 = _1258;
    if (_1230)
    {
        float _1262 = _1254 * 0.15915493667125701904296875;
        _1132 = _1262;
    }
    float _1264 = _1132;
    float _1266 = precise::max(0.0, _1206);
    float _1268 = _1204;
    float _1270 = _1266;
    if (_1230)
    {
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        _1268 = _1274;
    }
    float _1276 = _1268;
    float _1278 = -_1216;
    float _1280 = -_1266;
    float _1282 = fma(_1196, _1278, _1280);
    float _1284 = _1282;
    if (_1230)
    {
        float _1286 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1286;
    }
    float _1288 = _1240;
    float _1290 = _1214;
    float _1292 = _1288;
    if (_1230)
    {
        float _1294 = _1264 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        _1290 = _1296;
    }
    float _1298 = _1290;
    float _1300 = _1276;
    if (_1230)
    {
        float _1302 = fma(_1276, _1288, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1300 = _1302;
    }
    float _1304 = _1300;
    float _1306 = sqrt(_1212);
    float _1308 = _1304;
    if (!_1230)
    {
        _1292 = _1222;
    }
    float _1310 = _1292;
    float _1312 = _1310;
    if (_1230)
    {
        float _1314 = _1258 * _1304;
        _1242 = _1314;
    }
    float _1316 = _1242;
    if (!_1230)
    {
        _1308 = _1220;
    }
    float _1318 = _1308;
    float _1320 = _1318;
    if (_1230)
    {
        float _1322 = _1298 + (-1.0);
        _1270 = _1322;
    }
    float _1324 = _1270;
    float _1326 = _1324;
    if (_1230)
    {
        float _1328 = _1218 * _1316;
        _1244 = _1328;
    }
    float _1330 = _1244;
    if (_1230)
    {
        float _1332 = _1220 * _1316;
        _1320 = _1332;
    }
    float _1334 = _1320;
    float _1336 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1230)
    {
        float _1338 = _1324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1260 = _1338;
    }
    float _1340 = _1260;
    if (_1230)
    {
        float _1342 = _1330 * _1330;
        _1312 = _1342;
    }
    float _1344 = _1312;
    if (!_1230)
    {
        _1326 = _1224;
    }
    float _1346 = _1326;
    float _1348 = _1346;
    if (_1230)
    {
        float _1350 = _1334 * _1334;
        _1348 = _1350;
    }
    float _1352 = _1348;
    if (_1230)
    {
        float _1354 = fma(_1282, _1298, _1340);
        _1284 = _1354;
    }
    float _1356 = _1284;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1360 = fma(_1356, _1356, _1344);
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1364 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1362);
    float _1366 = precise::clamp(_1364, 0.0, 1.0);
    float _1368 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1370 = _1360 + _1352;
    float _1372 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1374 = -_1366;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1368);
    float _1380 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1382 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1384 = rsqrt(_1370);
    float _1386 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1378);
    float _1388 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1380);
    float _1390 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1382);
    float _1392 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1336);
    float _1394 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1390);
    float _1398 = abs(_1376);
    float _1400 = log2(_1398);
    float _1402 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1392);
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = -_1404;
    float _1410 = fma(_1408, _1358, 1.0);
    float _1412 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1384 * _1330;
    float _1418 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1422 = _1384 * _1356;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1384 * _1334;
    float _1428 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1430 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1420);
    float _1432 = -_1424;
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1432);
    float _1436 = log2(_1410);
    float _1438 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1440 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1430);
    float _1442 = -_1426;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1434);
    float _1446 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1448 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1438);
    float _1450 = fma(_1444, -0.5, 0.5);
    float _1452 = exp2(_1428);
    float _1454 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1446);
    float _1456 = fma(_1444, 0.5, 0.5);
    float _1458 = _1422 + 1.0;
    float _1460 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1448);
    float _1462 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1454);
    float _1464 = fma(_1456, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1466 = 1.0 / _1440;
    float _1468 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1462);
    float _1470 = fma(_1456, _1464, -0.212114393711090087890625);
    float _1472 = _1436 * 0.693147182464599609375;
    float _1474 = fma(_1456, _1470, 1.570728778839111328125);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1478 = sqrt(_1450);
    float _1480 = -_1422;
    float _1482 = fma(_1452, _1458, _1480);
    float _1484 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1460);
    float _1486 = fma(_1482, 0.5, 0.5);
    float _1488 = _1468 * _1466;
    float _1490 = _1484 * _1466;
    float _1492 = fma(_1488, 0.5, 0.5);
    float _1494 = fma(_1490, -0.5, 0.5);
    float _1496 = _1478 * 0.636619746685028076171875;
    float _1498 = -_1474;
    float _1500 = fma(_1496, _1498, 1.0);
    float3 _4007 = float3(_1492, _1494, _1476);
    float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4007, float3(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4007, float3(0.0), isnan(_4007)), level(0.0)).x;
    float3 _4018 = float3(_1492, _1494, _1476);
    float4 _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4018, float3(0.0), isnan(_4018)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4018, float3(0.0), isnan(_4018)), level(0.0)).xyzw;
    float _1507 = _1505.x;
    float _1509 = _1505.y;
    float _1511 = _1505.z;
    float _1513 = _1505.w;
    float2 _4035 = float2(_1500, _1486);
    float3 _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4035, float2(0.0), isnan(_4035)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4035, float2(0.0), isnan(_4035)), level(0.0)).xyz;
    float _1519 = _1517.x;
    float _1521 = _1517.y;
    float _1523 = _1517.z;
    float _1525 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1527 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _662;
    out.m_75.y = _656;
    out.m_75.z = _674;
    float _1529 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1527);
    float _1531 = exp2(_1525);
    float _1533 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1529);
    float _1535 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1533);
    out.gl_Position.x = _1468;
    out.gl_Position.y = _1484;
    out.gl_Position.z = _1535;
    out.gl_Position.w = _1440;
    float _1537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1539 = -_1531;
    float _1541 = _1539 + 1.0;
    float _1543 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.w = _1537;
    float _1545 = -_1543;
    float _1547 = _1545 + 1.0;
    float _1549 = _1543 * _1502;
    float _1551 = _1513 * _1549;
    float _1553 = _1523 * _1549;
    float _1555 = _1513 * _1547;
    out.m_51.x = 1.0;
    float _1557 = fma(_1519, _1551, _1507);
    float _1559 = fma(_1521, _1551, _1509);
    float _1561 = fma(_1513, _1553, _1511);
    out.m_79.x = _1557;
    out.m_79.y = _1559;
    out.m_79.z = _1561;
    out.m_79.w = _1555;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1056 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = in.m_46.w;
    float _97 = trunc(_93);
    int _100 = int(_97);
    float _102 = -_95;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _104;
    bool _108 = _100 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_100);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1629 = as_type<float>(_120);
        out.gl_Position.z = _1629;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _124 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_95);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_100);
    bool _136 = _104 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    int _142 = as_type<int>(_134);
    bool _144 = _140;
    if (_140)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _112;
    if (_140)
    {
        out.m_51.x = 0.0;
    }
    if (_140)
    {
        float _148 = _146 * 5.0;
        _122 = as_type<int>(_148);
    }
    int _150 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1687 = as_type<float>(_150);
        out.gl_Position.z = _1687;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_53.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _156 = in.m_55.x;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _160 = _158 != 0;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _164 = _162 != 0;
    float _166 = in.m_53.y;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _170 = _168 != 0;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _176 = _174 != 0;
    float _178 = in.m_55.y;
    float _180 = in.m_55.w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _184 = in.m_55.z;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _188 = _152;
    if (_160)
    {
        float _190 = -_152;
        float _192 = _190 + 1.0;
        _142 = as_type<int>(_192);
    }
    int _194 = _142;
    float _196 = 0.0;
    if (!_160)
    {
        _196 = _152;
    }
    float _198 = _196;
    float _200 = _172 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _202 = in.m_57.w;
    float _204 = _198;
    float _206 = _156;
    if (_160)
    {
        bool _208 = _156 > 0.5;
        _144 = _208;
    }
    bool _210 = _144;
    float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _216 = -_166;
    float _218 = _216 + 1.0;
    float _220 = _166;
    float _222 = _218;
    if (_160)
    {
        float _224 = _210 ? as_type<float>(_194) : _152;
        _204 = _224;
    }
    float _226 = _204;
    int _228 = 0;
    if (_170)
    {
        float _230 = -_152;
        float _232 = _230 + 1.0;
        _228 = as_type<int>(_232);
    }
    int _234 = _228;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _238 = _236 != 0;
    bool _240 = _178 > 0.5;
    float _242 = _186 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _244 = _180 > 0.5;
    int _246 = _240 ? as_type<int>(_218) : as_type<int>(_166);
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _252 = _250 != 0;
    float _254 = _238 ? as_type<float>(_246) : _166;
    float _256 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _260 = _258 != 0;
    float _262 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _264 = 0.0;
    float _266 = _256;
    bool _268 = _244;
    if (!_164)
    {
        _264 = _184;
    }
    float _270 = _264;
    float _272 = -_182;
    float _274 = fma(_256, 2.0, _272);
    float _276 = _270;
    if (!_164)
    {
        _266 = _178;
    }
    float _278 = _266;
    float _280 = fma(_262, -2.0, _248);
    float _282 = _154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _286 = _244 ? as_type<int>(_218) : as_type<int>(_166);
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _290 = fma(_282, _254, -0.5);
    float _292 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].w, _284);
    float _294 = _278;
    if (_164)
    {
        _294 = _156;
    }
    float _296 = _294;
    float _298 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[76].y, _280);
    float _300 = _176 ? as_type<float>(_286) : _166;
    float _302 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].w, _292);
    float _304 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[83].z, _288);
    float _306 = 0.0;
    float _308 = _296;
    if (!_164)
    {
        _306 = _270;
    }
    float _310 = _306;
    float _312 = -_298;
    float _314 = fma(_302, _290, _312);
    float _316 = _310;
    if (!_164)
    {
        _308 = _178;
    }
    float _318 = _308;
    int _320 = 0;
    float _322 = _318;
    if (_252)
    {
        float _324 = -_152;
        float _326 = _324 + 1.0;
        _320 = as_type<int>(_326);
    }
    int _328 = _320;
    if (_252)
    {
        bool _330 = _184 > 0.5;
        _268 = _330;
    }
    bool _332 = _268;
    if (_164)
    {
        _276 = _184;
    }
    float _334 = _276;
    float _336 = fma(_300, _200, -0.5);
    if (_164)
    {
        _322 = _156;
    }
    float _338 = _322;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _342 = in.m_46.x;
    float _344 = in.m_46.y;
    float _346 = in.m_46.z;
    float _348 = 0.0;
    if (!_164)
    {
        _348 = _310;
    }
    float _350 = _348;
    float _352 = _338 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _354 = _350;
    if (_164)
    {
        _354 = _178;
    }
    float _356 = _354;
    if (_164)
    {
        _316 = _178;
    }
    float _358 = _316;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _362 = -_340;
    float _364 = fma(_352, 2.0, _362);
    float _366 = 0.0;
    if (!_252)
    {
        _366 = _152;
    }
    float _368 = _366;
    float _370 = in.m_44.x;
    float _372 = in.m_44.y;
    float _374 = in.m_44.z;
    float _376 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _360);
    float _378 = _368;
    if (_164)
    {
        _206 = _334;
    }
    float _380 = _206;
    bool _382 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _386 = _382 || _384;
    bool _388 = isnan(1.0);
    bool _390 = _386 || _388;
    bool _392 = _334 > 0.5;
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[84].z, _214);
    if (_252)
    {
        float _396 = _332 ? as_type<float>(_328) : _152;
        _378 = _396;
    }
    float _398 = _378;
    float _400 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _404 = _400;
    if (_260)
    {
        float _406 = _392 ? _218 : _166;
        _220 = _406;
    }
    float _408 = _220;
    if (_170)
    {
        float _410 = _240 ? as_type<float>(_234) : _152;
        _188 = _410;
    }
    float _412 = _188;
    float _414 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[83].w, _402);
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _418 = as_type<int>(_416);
    if (!_390)
    {
        float _420 = _400 * _400;
        float _422 = _420 * 0.5;
        _222 = _422;
    }
    float _424 = _222;
    float _426 = _356 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _428 = _424;
    if (!_390)
    {
        float _430 = _424 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _430;
    }
    float _432 = _428;
    bool _434 = !_390;
    float _436 = _432;
    if (!_434)
    {
        float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _440 = log2(_438);
        float _442 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _444 = _442 + 1.0;
        float _446 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _448 = _400 * _440;
        float _450 = 1.0 / _444;
        float _452 = _446 * 0.693147182464599609375;
        float _454 = exp2(_448);
        float _456 = 1.0 / _452;
        float _458 = _454 + (-1.0);
        float _460 = -_458;
        float _462 = fma(_460, _456, _400);
        float _464 = _462 * _450;
        float _466 = _464 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _436 = _466;
    }
    float _468 = _436;
    bool _470 = !_390;
    if (!_470)
    {
        float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _474 = log2(_472);
        float _476 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _478 = _476 + 1.0;
        float _480 = 1.0 / _478;
        float _482 = _400 * _474;
        float _484 = exp2(_482);
        float _486 = -_484;
        float _488 = _486 + 1.0;
        float _490 = _488 * _480;
        _404 = _490;
    }
    float _492 = _404;
    float _494 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _496 = fma(_426, -2.0, _416);
    float _498 = fma(_242, _226, -0.5);
    float _500 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _502 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _504 = fma(_492, _344, _494);
    float _506 = _212 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _508 = fma(_492, _346, _500);
    float _510 = fma(_492, _342, _502);
    float _512 = fma(_504, _202, _372);
    float _514 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[84].x, _394);
    float _516 = fma(_508, _202, _374);
    float _518 = fma(_510, _202, _370);
    float _520 = _512 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _522 = _512 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _524 = _512 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _526 = fma(_506, _398, -0.5);
    float _528 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
    float _530 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
    float _532 = fma(_518, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
    float _534 = _514 * (-0.15915493667125701904296875);
    float _536 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
    float _538 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[4].z, _530);
    float _540 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].z, _376);
    float _542 = -_104;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _274);
    float _546 = _536 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _548 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
    float _550 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _552 = _534 * 6.283185482025146484375;
    float _554 = cos(_552);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _558 = _546 + _556;
    float _560 = fma(_540, _498, _544);
    float _562 = _548 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _566 = _550 + _564;
    float _568 = _558 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _570 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].z, _304);
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _574 = _562 + _572;
    float _576 = _534 * 6.283185482025146484375;
    float _578 = sin(_576);
    float _580 = -_104;
    float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[81].x, _364);
    float _584 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[81].y, _496);
    float _586 = _412 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _588 = _408 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _592 = fma(_566, (*spvDescriptorSet0.vp_c8)._m0[28].x, _568);
    float _594 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].w, _414);
    float _596 = _558 * _558;
    float _598 = _554 * _336;
    float _600 = fma(_574, (*spvDescriptorSet0.vp_c8)._m0[28].z, _592);
    float _602 = fma(_566, _566, _596);
    float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _606 = _578 * _336;
    bool _608 = _600 >= 0.0;
    float _610 = fma(_578, _526, _598);
    float _612 = fma(_574, _574, _602);
    float _614 = -_606;
    float _616 = fma(_554, _526, _614);
    float _618 = -_584;
    float _620 = fma(_594, _610, _618);
    float _622 = rsqrt(_612);
    float _624 = _586 * _590;
    float _626 = fma(_570, _616, _582);
    float _628 = _314 + 0.5;
    float _630 = _560 + 0.5;
    float _632 = _620 + 0.5;
    float _634 = _626 + 0.5;
    float _636 = _590;
    int _638 = as_type<int>(_634);
    if (_608)
    {
        _636 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _640 = _636;
    float _642 = _588 * _604;
    if (_608)
    {
        out.m_51.x = 0.0;
    }
    if (_608)
    {
        float _644 = _640 * 5.0;
        _418 = as_type<int>(_644);
    }
    int _646 = _418;
    out.m_59.x = _624;
    out.m_59.y = _642;
    float _648 = _558 * _622;
    out.m_61.x = _630;
    out.m_61.y = _628;
    out.m_61.z = _634;
    out.m_61.w = _632;
    float _650 = _566 * _622;
    float _652 = _648;
    if (_608)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2559 = as_type<float>(_646);
        out.gl_Position.z = _2559;
    }
    if (_608)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _654 = -_648;
    float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    float _658 = _574 * _622;
    float _660 = -_650;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _550);
    float _664 = -_648;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _670 = _656 + _668;
    float _672 = -_658;
    float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _678 = _662 + _676;
    float _680 = -_650;
    float _682 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _566);
    float _684 = _670 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _688 = _674 + _686;
    float _690 = _666 * _666;
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[28].x, _684);
    float _694 = -_658;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _574);
    float _698 = fma(_682, _682, _690);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[28].z, _692);
    float _702 = fma(_696, _696, _698);
    bool _704 = _700 >= 0.0;
    float _706 = _700;
    if (_704)
    {
        _706 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _708 = _706;
    if (_704)
    {
        out.m_51.x = 0.0;
    }
    if (_704)
    {
        float _710 = _708 * 5.0;
        _638 = as_type<int>(_710);
    }
    int _712 = _638;
    if (_704)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2680 = as_type<float>(_712);
        out.gl_Position.z = _2680;
    }
    if (_704)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _714 = in.m_57.x;
    float _716 = in.m_57.y;
    float _718 = in.m_57.z;
    float _720 = sqrt(_702);
    float _722 = in.m_63.x;
    float _724 = in.m_63.y;
    float _726 = in.m_63.z;
    float _728 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _730 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _728;
    float _732 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _734 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _732;
    float _736 = _730 * _730;
    float _738 = fma(_734, _734, _736);
    float _740 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _742 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _740;
    float _744 = _622 * _720;
    float _746 = fma(_742, _742, _738);
    float _748 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _750 = sqrt(_746);
    float _752 = _714 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _754 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _724);
    float _760 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _722);
    float _764 = _744 * _756;
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _726);
    float _768 = _744 * _760;
    float _770 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _772 = _758 * _764;
    float _774 = _762 * _768;
    float _776 = _744 * _770;
    float _778 = _772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _780 = _772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _782 = fma(_750, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _784 = _766 * _776;
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _778);
    float _788 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _780);
    float _790 = _772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _792 = precise::max(_782, 1.0);
    float _794 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].z, _786);
    float _796 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].z, _788);
    float _798 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _790);
    float _800 = precise::min(_792, 1.89999997615814208984375);
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _804 = _796 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _806 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].z, _798);
    float _808 = in.m_65.x;
    float _810 = in.m_65.y;
    float _812 = in.m_65.z;
    float _814 = fma(_802, _800, _550);
    float _816 = fma(_804, _800, _562);
    float _818 = _806 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _820 = in.m_67.x;
    float _822 = in.m_67.y;
    float _824 = in.m_67.z;
    float _826 = in.m_67.w;
    float _828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _830 = _814 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _816 + _832;
    float _836 = fma(_818, _800, _546);
    float _838 = _830 * _830;
    float _840 = _834 * _834;
    float _842 = _838 + _840;
    float _844 = sqrt(_842);
    float _846 = _808 * _824;
    float _848 = _812 * _822;
    float _850 = _810 * _820;
    float _852 = -_846;
    float _854 = fma(_812, _820, _852);
    float _856 = -_848;
    float _858 = fma(_824, _810, _856);
    bool _860 = _844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _862 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _864 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _866 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _868 = -_850;
    float _870 = fma(_822, _808, _868);
    float _872 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _862);
    float _874 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _864);
    float _876 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _866);
    float _878 = _818;
    float _880 = _820;
    float _882 = _850;
    float _884 = _864;
    float _886 = _784;
    float _888 = _744;
    if (!_860)
    {
        _878 = _840;
    }
    float _890 = _878;
    float _892 = _890;
    if (!_860)
    {
        _880 = _838;
    }
    float _894 = _880;
    float _896 = _894;
    if (!_860)
    {
        _882 = _814;
    }
    float _898 = _882;
    float _900 = _898;
    if (!_860)
    {
        _884 = _816;
    }
    float _902 = _884;
    float _904 = _902;
    if (!_860)
    {
        _886 = _836;
    }
    float _906 = _886;
    bool _908 = !_860;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _844 + _914;
        float _918 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _920 = rsqrt(_842);
        float _922 = _916 * _912;
        float _924 = _922 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = sin(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = cos(_930);
        float _934 = fma(_928, _918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _936 = _920 * _934;
        float _938 = _932 + (-1.0);
        float _940 = fma(_830, _936, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _942 = fma(_834, _936, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _944 = _938 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _946 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _948 = _940 + _946;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _952 = _942 + _950;
        float _954 = fma(_836, _932, _944);
        float _956 = _948 * _948;
        float _958 = _952 * _952;
        _910 = _954;
        _896 = _956;
        _892 = _958;
        _900 = _940;
        _904 = _942;
    }
    float _960 = _910;
    float _962 = _896;
    float _964 = _892;
    float _966 = _900;
    float _968 = _904;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _972 = _960 + _970;
    float _974 = _854 * _826;
    float _976 = _858 * _826;
    float _978 = _870 * _826;
    float _980 = fma(_972, _972, _962);
    float _982 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _984 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _986 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _988 = _980 + _964;
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _982);
    float _992 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _984);
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _986);
    float _996 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].z, _872);
    float _998 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _1000 = sqrt(_988);
    float _1002 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _992);
    float _1004 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].z, _876);
    float _1006 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _990);
    float _1008 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _994);
    out.m_69.x = _650;
    out.m_69.y = _648;
    out.m_69.z = _658;
    out.m_71.x = _996;
    out.m_71.y = _998;
    out.m_71.z = _1004;
    out.m_73.x = _1006;
    out.m_73.y = _1002;
    out.m_73.z = _1008;
    bool _1010 = _1000 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1012 = isnan(_1000);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1018 = _1014 || _1016;
    float _1020 = _978;
    if (!_1018)
    {
        _1020 = 1.0;
    }
    float _1022 = _1020;
    bool _1024 = !_1018;
    float _1026 = _1022;
    if (!_1024)
    {
        bool _1028 = _1000 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1030 = isnan(_1000);
        bool _1032 = _1028 || _1030;
        bool _1034 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1036 = _1032 || _1034;
        if (!_1036)
        {
            float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1040 = _1000 + _1038;
            float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1044 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1042;
            float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1050 = 1.0 / _1044;
            float _1052 = _1040 * _1050;
            float _1054 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1026 = _1054;
            _1056 = true;
        }
        else
        {
            bool _1058 = _1000 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1060 = isnan(_1000);
            bool _1062 = _1058 || _1060;
            bool _1064 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1066 = _1062 || _1064;
            if (!_1066)
            {
                float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1070 = _1000 + _1068;
                float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1074 = _1072 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1076 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1078 = _1076 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1080 = 1.0 / _1074;
                float _1082 = _1070 * _1080;
                float _1084 = fma(_1082, _1078, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1026 = _1084;
                _1056 = true;
            }
            else
            {
                _1026 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1056 = false;
    float _1086 = _1026;
    float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1090 = _966 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1094 = _960 + _1092;
    bool _1096 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan(0.5);
    bool _1104 = _1100 || _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1108 = _968 + _1106;
    float _1110 = fma(_1090, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1112 = fma(_1094, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1114 = fma(_1108, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1116 = -_650;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1110);
    float _1120 = -_648;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1112);
    float _1124 = -_658;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1114);
    float _1128 = _1118;
    float _1130 = _1122;
    float _1132 = _1110;
    if (_1104)
    {
        _652 = _1118;
    }
    float _1134 = _652;
    float _1136 = _1134;
    if (_1104)
    {
        _1128 = _1126;
    }
    float _1138 = _1128;
    float _1140 = _1138;
    if (!_1104)
    {
        float _1142 = _670 * _670;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1146 = -_562;
        float _1148 = _1146 + _1114;
        float _1150 = -_546;
        float _1152 = _1150 + _1112;
        float _1154 = fma(_678, _678, _1142);
        float _1156 = fma(_688, _688, _1154);
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1160 = sqrt(_1156);
        float _1162 = 1.0 / _744;
        float _1164 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1166 = precise::min(_1160, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1168 = _1166 * _1144;
        float _1170 = -_550;
        float _1172 = _1170 + _1110;
        float _1174 = _1168 * _1162;
        float _1176 = _1164 * _1174;
        float _1178 = _1148 * _1174;
        float _1180 = fma(_1172, _1176, _662);
        float _1182 = fma(_1152, _1176, _656);
        float _1184 = fma(_1164, _1178, _674);
        _1130 = _1182;
        _1136 = _1180;
        _1140 = _1184;
        _888 = _1162;
    }
    float _1186 = _1130;
    float _1188 = _1136;
    float _1190 = _1140;
    float _1192 = _888;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1196 = _1186 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1200 = _1188 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1204 = _1190 + _1202;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1208 = _1196 * _1196;
    float _1210 = fma(_1200, _1200, _1208);
    float _1212 = fma(_1204, _1204, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1200 * _1216;
    float _1220 = _1204 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1210;
    float _1238 = _1234;
    float _1240 = _1196;
    float _1242 = _1192;
    float _1244 = _1218;
    if (_1230)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1246;
    }
    float _1248 = _1236;
    float _1250 = _1248;
    if (_1230)
    {
        float _1252 = _1234 * _1248;
        _1238 = _1252;
    }
    float _1254 = _1238;
    if (_1230)
    {
        float _1256 = rsqrt(_1226);
        _1250 = _1256;
    }
    float _1258 = _1250;
    float _1260 = _1258;
    if (_1230)
    {
        float _1262 = _1254 * 0.15915493667125701904296875;
        _1132 = _1262;
    }
    float _1264 = _1132;
    float _1266 = precise::max(0.0, _1206);
    float _1268 = _1204;
    float _1270 = _1266;
    if (_1230)
    {
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        _1268 = _1274;
    }
    float _1276 = _1268;
    float _1278 = -_1216;
    float _1280 = -_1266;
    float _1282 = fma(_1196, _1278, _1280);
    float _1284 = _1282;
    if (_1230)
    {
        float _1286 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1286;
    }
    float _1288 = _1240;
    float _1290 = _1214;
    float _1292 = _1288;
    if (_1230)
    {
        float _1294 = _1264 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        _1290 = _1296;
    }
    float _1298 = _1290;
    float _1300 = _1276;
    if (_1230)
    {
        float _1302 = fma(_1276, _1288, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1300 = _1302;
    }
    float _1304 = _1300;
    float _1306 = sqrt(_1212);
    float _1308 = _1304;
    if (!_1230)
    {
        _1292 = _1222;
    }
    float _1310 = _1292;
    float _1312 = _1310;
    if (_1230)
    {
        float _1314 = _1258 * _1304;
        _1242 = _1314;
    }
    float _1316 = _1242;
    if (!_1230)
    {
        _1308 = _1220;
    }
    float _1318 = _1308;
    float _1320 = _1318;
    if (_1230)
    {
        float _1322 = _1298 + (-1.0);
        _1270 = _1322;
    }
    float _1324 = _1270;
    float _1326 = _1324;
    if (_1230)
    {
        float _1328 = _1218 * _1316;
        _1244 = _1328;
    }
    float _1330 = _1244;
    if (_1230)
    {
        float _1332 = _1220 * _1316;
        _1320 = _1332;
    }
    float _1334 = _1320;
    float _1336 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1230)
    {
        float _1338 = _1324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1260 = _1338;
    }
    float _1340 = _1260;
    if (_1230)
    {
        float _1342 = _1330 * _1330;
        _1312 = _1342;
    }
    float _1344 = _1312;
    if (!_1230)
    {
        _1326 = _1224;
    }
    float _1346 = _1326;
    float _1348 = _1346;
    if (_1230)
    {
        float _1350 = _1334 * _1334;
        _1348 = _1350;
    }
    float _1352 = _1348;
    if (_1230)
    {
        float _1354 = fma(_1282, _1298, _1340);
        _1284 = _1354;
    }
    float _1356 = _1284;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1360 = fma(_1356, _1356, _1344);
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1364 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1362);
    float _1366 = precise::clamp(_1364, 0.0, 1.0);
    float _1368 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1370 = _1360 + _1352;
    float _1372 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1374 = -_1366;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1368);
    float _1380 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1382 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1384 = rsqrt(_1370);
    float _1386 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1378);
    float _1388 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1380);
    float _1390 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1382);
    float _1392 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1336);
    float _1394 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1390);
    float _1398 = abs(_1376);
    float _1400 = log2(_1398);
    float _1402 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1392);
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = -_1404;
    float _1410 = fma(_1408, _1358, 1.0);
    float _1412 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1384 * _1330;
    float _1418 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1422 = _1384 * _1356;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1384 * _1334;
    float _1428 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1430 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1420);
    float _1432 = -_1424;
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1432);
    float _1436 = log2(_1410);
    float _1438 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1440 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1430);
    float _1442 = -_1426;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1434);
    float _1446 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1448 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1438);
    float _1450 = fma(_1444, -0.5, 0.5);
    float _1452 = exp2(_1428);
    float _1454 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1446);
    float _1456 = fma(_1444, 0.5, 0.5);
    float _1458 = _1422 + 1.0;
    float _1460 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1448);
    float _1462 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1454);
    float _1464 = fma(_1456, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1466 = 1.0 / _1440;
    float _1468 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1462);
    float _1470 = fma(_1456, _1464, -0.212114393711090087890625);
    float _1472 = _1436 * 0.693147182464599609375;
    float _1474 = fma(_1456, _1470, 1.570728778839111328125);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1478 = sqrt(_1450);
    float _1480 = -_1422;
    float _1482 = fma(_1452, _1458, _1480);
    float _1484 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1460);
    float _1486 = fma(_1482, 0.5, 0.5);
    float _1488 = _1468 * _1466;
    float _1490 = _1484 * _1466;
    float _1492 = fma(_1488, 0.5, 0.5);
    float _1494 = fma(_1490, -0.5, 0.5);
    float _1496 = _1478 * 0.636619746685028076171875;
    float _1498 = -_1474;
    float _1500 = fma(_1496, _1498, 1.0);
    float3 _4007 = float3(_1492, _1494, _1476);
    float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4007, float3(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4007, float3(0.0), isnan(_4007)), level(0.0)).x;
    float3 _4018 = float3(_1492, _1494, _1476);
    float4 _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4018, float3(0.0), isnan(_4018)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4018, float3(0.0), isnan(_4018)), level(0.0)).xyzw;
    float _1507 = _1505.x;
    float _1509 = _1505.y;
    float _1511 = _1505.z;
    float _1513 = _1505.w;
    float2 _4035 = float2(_1500, _1486);
    float3 _1517 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4035, float2(0.0), isnan(_4035)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4035, float2(0.0), isnan(_4035)), level(0.0)).xyz;
    float _1519 = _1517.x;
    float _1521 = _1517.y;
    float _1523 = _1517.z;
    float _1525 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1527 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _662;
    out.m_75.y = _656;
    out.m_75.z = _674;
    float _1529 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1527);
    float _1531 = exp2(_1525);
    float _1533 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1529);
    float _1535 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1533);
    out.gl_Position.x = _1468;
    out.gl_Position.y = _1484;
    out.gl_Position.z = _1535;
    out.gl_Position.w = _1440;
    float _1537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1539 = -_1531;
    float _1541 = _1539 + 1.0;
    float _1543 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.w = _1537;
    float _1545 = -_1543;
    float _1547 = _1545 + 1.0;
    float _1549 = _1543 * _1502;
    float _1551 = _1513 * _1549;
    float _1553 = _1523 * _1549;
    float _1555 = _1513 * _1547;
    out.m_51.x = 1.0;
    float _1557 = fma(_1519, _1551, _1507);
    float _1559 = fma(_1521, _1551, _1509);
    float _1561 = fma(_1513, _1553, _1511);
    out.m_79.x = _1557;
    out.m_79.y = _1559;
    out.m_79.z = _1561;
    out.m_79.w = _1555;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

