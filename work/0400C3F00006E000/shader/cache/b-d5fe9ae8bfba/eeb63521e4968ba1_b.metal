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
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _666 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1161 = as_type<float>(_104);
        out.gl_Position.z = _1161;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1230 = as_type<float>(_140);
        out.gl_Position.z = _1230;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    float _244 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_242, _158, _244);
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _160, _248);
    float _256 = fma(_250, _142, _164);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _166);
    float _262 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _264 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _266 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _262);
    float _270 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _264);
    float _272 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _266);
    float _274 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _268);
    float _276 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _270);
    float _278 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _272);
    float _280 = _274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _286 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _288 = _280 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _292 = _282 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _296 = _284 + _294;
    float _298 = _288 * _288;
    float _300 = fma(_292, _292, _298);
    float _302 = in.m_51.x;
    float _304 = in.m_51.y;
    float _306 = in.m_51.z;
    float _308 = fma(_296, _296, _300);
    float _310 = rsqrt(_308);
    float _312 = _288 * _310;
    float _314 = _292 * _310;
    float _316 = _296 * _310;
    float _318 = _306 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = -_312;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _288);
    float _324 = -_314;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _328 = -_316;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _332 = _302 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = _322 * _322;
    float _336 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _338 = _304 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _342 = fma(_326, _326, _334);
    float _344 = in.m_53.x;
    float _346 = in.m_53.y;
    float _348 = in.m_53.z;
    float _350 = _338 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _352 = fma(_330, _330, _342);
    float _354 = sqrt(_352);
    float _356 = _310 * _354;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _348);
    float _360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _344);
    float _362 = _336 * _356;
    float _364 = _340 * _356;
    float _366 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _346);
    float _368 = _350 * _356;
    float _370 = _362 * _358;
    float _372 = _364 * _360;
    float _374 = in.m_55.y;
    float _376 = _368 * _366;
    float _378 = _370 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _380 = _370 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _382 = in.m_57.y;
    float _384 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[8].x, _378);
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[10].x, _380);
    float _388 = -_376;
    float _390 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[8].z, _384);
    float _392 = -_376;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].z, _386);
    float _396 = _282 + _390;
    float _398 = _284 + _394;
    float _400 = in.m_55.x;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _408 = _398 + _406;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _412 = _410 != 0;
    float _414 = _370 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _416 = _404 * _404;
    float _418 = _408 * _408;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _422 = _420 != 0;
    float _424 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[9].x, _414);
    float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _428 = _416 + _418;
    float _430 = -_374;
    float _432 = _430 + 1.0;
    float _434 = -_376;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[9].z, _424);
    bool _438 = _382 > 0.5;
    float _440 = _282;
    float _442 = _374;
    float _444 = _280;
    float _446 = _432;
    float _448 = _414;
    float _450 = _416;
    float _452 = _396;
    if (_412)
    {
        float _454 = in.m_57.x;
        _440 = _454;
    }
    float _456 = _440;
    float _458 = sqrt(_428);
    float _460 = _280 + _436;
    if (_422)
    {
        float _462 = _438 ? _432 : _374;
        _442 = _462;
    }
    float _464 = _442;
    if (_412)
    {
        _444 = _400;
    }
    float _466 = _444;
    bool _468 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _470 = _456 > 0.5;
    bool _472 = _470 && _412;
    float _474 = _456;
    float _476 = _458;
    float _478 = _466;
    if (!_468)
    {
        _446 = _416;
    }
    float _480 = _446;
    float _482 = _480;
    if (!_468)
    {
        _448 = _418;
    }
    float _484 = _448;
    float _486 = _484;
    if (!_468)
    {
        _474 = _398;
    }
    float _488 = _474;
    float _490 = _488;
    if (!_468)
    {
        _450 = _460;
    }
    float _492 = _450;
    bool _494 = !_468;
    float _496 = _492;
    if (!_494)
    {
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _502 = _458 + _500;
        float _504 = rsqrt(_428);
        float _506 = _502 * _498;
        float _508 = _460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _510 = _506 * 0.15915493667125701904296875;
        float _512 = _510 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _510 * 6.283185482025146484375;
        float _518 = cos(_516);
        float _520 = fma(_514, _508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _522 = _504 * _520;
        float _524 = _518 + (-1.0);
        float _526 = fma(_404, _522, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _528 = fma(_408, _522, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _530 = _524 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _534 = _526 + _532;
        float _536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _538 = _528 + _536;
        float _540 = fma(_460, _518, _530);
        float _542 = _534 * _534;
        float _544 = _538 * _538;
        _496 = _540;
        _482 = _542;
        _486 = _544;
        _476 = _538;
        _452 = _526;
        _490 = _528;
    }
    float _546 = _496;
    float _548 = _482;
    float _550 = _486;
    float _552 = _476;
    float _554 = _452;
    float _556 = _490;
    float _558 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _560 = _546 + _558;
    float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _564 = _464 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _566 = _552;
    float _568 = _556;
    if (_472)
    {
        float _570 = -_466;
        float _572 = _570 + 1.0;
        _478 = _572;
    }
    float _574 = _478;
    float _576 = fma(_560, _560, _548);
    if (!_412)
    {
        _566 = _400;
    }
    float _578 = _566;
    float _580 = _564 * _426;
    float _582 = _576 + _550;
    float _584 = _578;
    float _586 = _582;
    if (_412)
    {
        _584 = _574;
    }
    float _588 = _584;
    float _590 = sqrt(_582);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _602 = _588 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _608 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _602 * _562;
    out.m_59.x = _608;
    out.m_59.y = _610;
    out.m_59.z = _612;
    out.m_59.w = _606;
    bool _622 = _590 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _624 = isnan(_590);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _630 = _626 || _628;
    out.m_61.x = _614;
    out.m_61.y = _616;
    out.m_61.z = _618;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _620;
    out.m_65.y = _580;
    if (!_630)
    {
        _586 = 1.0;
    }
    float _632 = _586;
    bool _634 = !_630;
    float _636 = _632;
    if (!_634)
    {
        bool _638 = _590 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _640 = isnan(_590);
        bool _642 = _638 || _640;
        bool _644 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _646 = _642 || _644;
        if (!_646)
        {
            float _648 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _650 = _590 + _648;
            float _652 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _654 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _652;
            float _656 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _658 = _656 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _660 = 1.0 / _654;
            float _662 = _650 * _660;
            float _664 = fma(_662, _658, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _636 = _664;
            _666 = true;
        }
        else
        {
            bool _668 = _590 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _670 = isnan(_590);
            bool _672 = _668 || _670;
            bool _674 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _676 = _672 || _674;
            if (!_676)
            {
                float _678 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _680 = _590 + _678;
                float _682 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _684 = _682 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _686 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _688 = _686 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _690 = 1.0 / _684;
                float _692 = _680 * _690;
                float _694 = fma(_692, _688, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _636 = _694;
                _666 = true;
            }
            else
            {
                _636 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _666 = false;
    float _696 = _636;
    float _698 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _700 = _546 + _698;
    float _702 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _704 = _554 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _708 = _556 + _706;
    float _710 = fma(_700, _696, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _712 = fma(_704, _696, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _714 = fma(_708, _696, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _716 = -_312;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _710);
    float _720 = -_314;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _724 = -_316;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _728 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _730 = _718 + _728;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _734 = _722 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _738 = _726 + _736;
    float _740 = _730 * _730;
    float _742 = fma(_734, _734, _740);
    float _744 = fma(_738, _738, _742);
    float _746 = rsqrt(_744);
    float _748 = sqrt(_744);
    float _750 = _746 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _752 = _734 * _750;
    float _754 = _738 * _750;
    float _756 = _752 * _752;
    float _758 = _754 * _754;
    float _760 = _756 + _758;
    float _762 = sqrt(_760);
    bool _764 = _762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _768 = _762 + _766;
    float _770 = _742;
    float _772 = _768;
    float _774 = _730;
    float _776 = _752;
    if (_764)
    {
        float _778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _770 = _778;
    }
    float _780 = _770;
    float _782 = _780;
    if (_764)
    {
        float _784 = _768 * _780;
        _772 = _784;
    }
    float _786 = _772;
    if (_764)
    {
        float _788 = rsqrt(_760);
        _782 = _788;
    }
    float _790 = _782;
    float _792 = _790;
    if (_764)
    {
        float _794 = _786 * 0.15915493667125701904296875;
        _568 = _794;
    }
    float _796 = _568;
    float _798 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _800 = _746;
    float _802 = _796;
    if (_764)
    {
        float _804 = _796 * 6.283185482025146484375;
        float _806 = sin(_804);
        _800 = _806;
    }
    float _808 = _800;
    float _810 = precise::max(0.0, _798);
    float _812 = _738;
    float _814 = _810;
    if (_764)
    {
        float _816 = _796 * 6.283185482025146484375;
        float _818 = cos(_816);
        _812 = _818;
    }
    float _820 = _812;
    float _822 = -_750;
    float _824 = -_810;
    float _826 = fma(_730, _822, _824);
    float _828 = _826;
    if (_764)
    {
        float _830 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _774 = _830;
    }
    float _832 = _774;
    float _834 = _808;
    float _836 = _832;
    if (_764)
    {
        float _838 = fma(_808, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _834 = _838;
    }
    float _840 = _834;
    float _842 = _840;
    if (!_764)
    {
        _836 = _756;
    }
    float _844 = _836;
    float _846 = _844;
    if (_764)
    {
        float _848 = _790 * _840;
        _842 = _848;
    }
    float _850 = _842;
    if (!_764)
    {
        _792 = _754;
    }
    float _852 = _792;
    float _854 = _852;
    if (_764)
    {
        float _856 = _820 + (-1.0);
        _814 = _856;
    }
    float _858 = _814;
    float _860 = _858;
    if (_764)
    {
        float _862 = _752 * _850;
        _776 = _862;
    }
    float _864 = _776;
    if (_764)
    {
        float _866 = _754 * _850;
        _854 = _866;
    }
    float _868 = _854;
    if (_764)
    {
        float _870 = _858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _802 = _870;
    }
    float _872 = _802;
    if (_764)
    {
        float _874 = _864 * _864;
        _846 = _874;
    }
    float _876 = _846;
    if (!_764)
    {
        _860 = _758;
    }
    float _878 = _860;
    float _880 = _878;
    if (_764)
    {
        float _882 = _868 * _868;
        _880 = _882;
    }
    float _884 = _880;
    if (_764)
    {
        float _886 = fma(_826, _820, _872);
        _828 = _886;
    }
    float _888 = _828;
    float _890 = fma(_888, _888, _876);
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _894 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _892);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = _890 + _884;
    float _900 = _718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _902 = -_896;
    float _904 = _902 + 1.0;
    float _906 = _718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _908 = rsqrt(_898);
    float _910 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _900);
    float _912 = _718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _914 = _718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _916 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _918 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _910);
    float _920 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _912);
    float _922 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _906);
    float _924 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _914);
    float _926 = _918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _928 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _920);
    float _930 = abs(_904);
    float _932 = log2(_930);
    float _934 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _922);
    float _936 = _926 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _938 = _928 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _940 = _934 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _942 = -_936;
    float _944 = fma(_942, _916, 1.0);
    float _946 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _924);
    float _948 = _908 * _864;
    float _950 = _938 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _952 = _908 * _888;
    float _954 = _908 * _868;
    float _956 = _948 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _958 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[7].x, _950);
    float _960 = _946 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _962 = log2(_944);
    float _964 = _932 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _966 = -_956;
    float _968 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[21].y, _966);
    float _970 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _958);
    float _972 = _938 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _974 = -_954;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c15)._m0[21].z, _968);
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[7].w, _970);
    float _980 = exp2(_964);
    float _982 = _938 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _984 = fma(_976, -0.5, 0.5);
    float _986 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[5].x, _972);
    float _988 = fma(_976, 0.5, 0.5);
    float _990 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[4].x, _982);
    float _992 = _952 + 1.0;
    float _994 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _986);
    float _996 = 1.0 / _978;
    float _998 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _990);
    float _1000 = fma(_988, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1002 = _962 * 0.693147182464599609375;
    float _1004 = fma(_988, _1000, -0.212114393711090087890625);
    float _1006 = sqrt(_984);
    float _1008 = -_952;
    float _1010 = fma(_980, _992, _1008);
    float _1012 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[4].w, _998);
    float _1014 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[5].w, _994);
    float _1016 = fma(_988, _1004, 1.570728778839111328125);
    float _1018 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1020 = fma(_1010, 0.5, 0.5);
    float _1022 = _1012 * _996;
    float _1024 = _1014 * _996;
    float _1026 = fma(_1022, 0.5, 0.5);
    float _1028 = fma(_1024, -0.5, 0.5);
    float _1030 = _1006 * 0.636619746685028076171875;
    float3 _2722 = float3(_1026, _1028, _1018);
    float _1032 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2722, float3(0.0), isnan(_2722)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2722, float3(0.0), isnan(_2722)), level(0.0)).x;
    float3 _2733 = float3(_1026, _1028, _1018);
    float4 _1035 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2733, float3(0.0), isnan(_2733)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2733, float3(0.0), isnan(_2733)), level(0.0)).xyzw;
    float _1037 = _1035.x;
    float _1039 = _1035.y;
    float _1041 = _1035.z;
    float _1043 = _1035.w;
    float _1045 = -_1016;
    float _1047 = fma(_1030, _1045, 1.0);
    float2 _2755 = float2(_1047, _1020);
    float3 _1051 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2755, float2(0.0), isnan(_2755)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2755, float2(0.0), isnan(_2755)), level(0.0)).xyz;
    float _1053 = _1051.x;
    float _1055 = _1051.y;
    float _1057 = _1051.z;
    float _1059 = _932 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1061 = _938 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1063 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1061);
    float _1065 = exp2(_1059);
    float _1067 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1063);
    float _1069 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1067);
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1073 = _1069 + _1071;
    float _1075 = _978 + _1073;
    float _1077 = -_1065;
    float _1079 = _1077 + 1.0;
    float _1081 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1012;
    out.gl_Position.y = _1014;
    out.gl_Position.z = _1073;
    out.gl_Position.w = _978;
    float _1083 = _1075 * 0.5;
    float _1085 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _1081;
    out.m_67.z = _1083;
    out.m_67.w = _978;
    float _1087 = _1085 * _1032;
    float _1089 = -_1085;
    float _1091 = _1089 + 1.0;
    float _1093 = _1043 * _1087;
    float _1095 = _1043 * _1091;
    float _1097 = _1057 * _1087;
    float _1099 = fma(_1053, _1093, _1037);
    float _1101 = fma(_1055, _1093, _1039);
    float _1103 = fma(_1043, _1097, _1041);
    out.m_69.x = _1099;
    out.m_69.y = _1101;
    out.m_69.z = _1103;
    out.m_69.w = _1095;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _666 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1161 = as_type<float>(_104);
        out.gl_Position.z = _1161;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1230 = as_type<float>(_140);
        out.gl_Position.z = _1230;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    float _244 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_242, _158, _244);
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _160, _248);
    float _256 = fma(_250, _142, _164);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _166);
    float _262 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _264 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _266 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _262);
    float _270 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _264);
    float _272 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _266);
    float _274 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _268);
    float _276 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _270);
    float _278 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _272);
    float _280 = _274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _286 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _288 = _280 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _292 = _282 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _296 = _284 + _294;
    float _298 = _288 * _288;
    float _300 = fma(_292, _292, _298);
    float _302 = in.m_51.x;
    float _304 = in.m_51.y;
    float _306 = in.m_51.z;
    float _308 = fma(_296, _296, _300);
    float _310 = rsqrt(_308);
    float _312 = _288 * _310;
    float _314 = _292 * _310;
    float _316 = _296 * _310;
    float _318 = _306 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = -_312;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _288);
    float _324 = -_314;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _328 = -_316;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _332 = _302 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = _322 * _322;
    float _336 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _338 = _304 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _342 = fma(_326, _326, _334);
    float _344 = in.m_53.x;
    float _346 = in.m_53.y;
    float _348 = in.m_53.z;
    float _350 = _338 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _352 = fma(_330, _330, _342);
    float _354 = sqrt(_352);
    float _356 = _310 * _354;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _348);
    float _360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _344);
    float _362 = _336 * _356;
    float _364 = _340 * _356;
    float _366 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _346);
    float _368 = _350 * _356;
    float _370 = _362 * _358;
    float _372 = _364 * _360;
    float _374 = in.m_55.y;
    float _376 = _368 * _366;
    float _378 = _370 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _380 = _370 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _382 = in.m_57.y;
    float _384 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[8].x, _378);
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[10].x, _380);
    float _388 = -_376;
    float _390 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[8].z, _384);
    float _392 = -_376;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].z, _386);
    float _396 = _282 + _390;
    float _398 = _284 + _394;
    float _400 = in.m_55.x;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _408 = _398 + _406;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _412 = _410 != 0;
    float _414 = _370 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _416 = _404 * _404;
    float _418 = _408 * _408;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _422 = _420 != 0;
    float _424 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[9].x, _414);
    float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _428 = _416 + _418;
    float _430 = -_374;
    float _432 = _430 + 1.0;
    float _434 = -_376;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[9].z, _424);
    bool _438 = _382 > 0.5;
    float _440 = _282;
    float _442 = _374;
    float _444 = _280;
    float _446 = _432;
    float _448 = _414;
    float _450 = _416;
    float _452 = _396;
    if (_412)
    {
        float _454 = in.m_57.x;
        _440 = _454;
    }
    float _456 = _440;
    float _458 = sqrt(_428);
    float _460 = _280 + _436;
    if (_422)
    {
        float _462 = _438 ? _432 : _374;
        _442 = _462;
    }
    float _464 = _442;
    if (_412)
    {
        _444 = _400;
    }
    float _466 = _444;
    bool _468 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _470 = _456 > 0.5;
    bool _472 = _470 && _412;
    float _474 = _456;
    float _476 = _458;
    float _478 = _466;
    if (!_468)
    {
        _446 = _416;
    }
    float _480 = _446;
    float _482 = _480;
    if (!_468)
    {
        _448 = _418;
    }
    float _484 = _448;
    float _486 = _484;
    if (!_468)
    {
        _474 = _398;
    }
    float _488 = _474;
    float _490 = _488;
    if (!_468)
    {
        _450 = _460;
    }
    float _492 = _450;
    bool _494 = !_468;
    float _496 = _492;
    if (!_494)
    {
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _502 = _458 + _500;
        float _504 = rsqrt(_428);
        float _506 = _502 * _498;
        float _508 = _460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _510 = _506 * 0.15915493667125701904296875;
        float _512 = _510 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _510 * 6.283185482025146484375;
        float _518 = cos(_516);
        float _520 = fma(_514, _508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _522 = _504 * _520;
        float _524 = _518 + (-1.0);
        float _526 = fma(_404, _522, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _528 = fma(_408, _522, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _530 = _524 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _534 = _526 + _532;
        float _536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _538 = _528 + _536;
        float _540 = fma(_460, _518, _530);
        float _542 = _534 * _534;
        float _544 = _538 * _538;
        _496 = _540;
        _482 = _542;
        _486 = _544;
        _476 = _538;
        _452 = _526;
        _490 = _528;
    }
    float _546 = _496;
    float _548 = _482;
    float _550 = _486;
    float _552 = _476;
    float _554 = _452;
    float _556 = _490;
    float _558 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _560 = _546 + _558;
    float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _564 = _464 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _566 = _552;
    float _568 = _556;
    if (_472)
    {
        float _570 = -_466;
        float _572 = _570 + 1.0;
        _478 = _572;
    }
    float _574 = _478;
    float _576 = fma(_560, _560, _548);
    if (!_412)
    {
        _566 = _400;
    }
    float _578 = _566;
    float _580 = _564 * _426;
    float _582 = _576 + _550;
    float _584 = _578;
    float _586 = _582;
    if (_412)
    {
        _584 = _574;
    }
    float _588 = _584;
    float _590 = sqrt(_582);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _602 = _588 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _608 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _602 * _562;
    out.m_59.x = _608;
    out.m_59.y = _610;
    out.m_59.z = _612;
    out.m_59.w = _606;
    bool _622 = _590 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _624 = isnan(_590);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _630 = _626 || _628;
    out.m_61.x = _614;
    out.m_61.y = _616;
    out.m_61.z = _618;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _620;
    out.m_65.y = _580;
    if (!_630)
    {
        _586 = 1.0;
    }
    float _632 = _586;
    bool _634 = !_630;
    float _636 = _632;
    if (!_634)
    {
        bool _638 = _590 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _640 = isnan(_590);
        bool _642 = _638 || _640;
        bool _644 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _646 = _642 || _644;
        if (!_646)
        {
            float _648 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _650 = _590 + _648;
            float _652 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _654 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _652;
            float _656 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _658 = _656 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _660 = 1.0 / _654;
            float _662 = _650 * _660;
            float _664 = fma(_662, _658, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _636 = _664;
            _666 = true;
        }
        else
        {
            bool _668 = _590 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _670 = isnan(_590);
            bool _672 = _668 || _670;
            bool _674 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _676 = _672 || _674;
            if (!_676)
            {
                float _678 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _680 = _590 + _678;
                float _682 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _684 = _682 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _686 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _688 = _686 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _690 = 1.0 / _684;
                float _692 = _680 * _690;
                float _694 = fma(_692, _688, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _636 = _694;
                _666 = true;
            }
            else
            {
                _636 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _666 = false;
    float _696 = _636;
    float _698 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _700 = _546 + _698;
    float _702 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _704 = _554 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _708 = _556 + _706;
    float _710 = fma(_700, _696, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _712 = fma(_704, _696, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _714 = fma(_708, _696, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _716 = -_312;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _710);
    float _720 = -_314;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _724 = -_316;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _728 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _730 = _718 + _728;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _734 = _722 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _738 = _726 + _736;
    float _740 = _730 * _730;
    float _742 = fma(_734, _734, _740);
    float _744 = fma(_738, _738, _742);
    float _746 = rsqrt(_744);
    float _748 = sqrt(_744);
    float _750 = _746 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _752 = _734 * _750;
    float _754 = _738 * _750;
    float _756 = _752 * _752;
    float _758 = _754 * _754;
    float _760 = _756 + _758;
    float _762 = sqrt(_760);
    bool _764 = _762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _768 = _762 + _766;
    float _770 = _742;
    float _772 = _768;
    float _774 = _730;
    float _776 = _752;
    if (_764)
    {
        float _778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _770 = _778;
    }
    float _780 = _770;
    float _782 = _780;
    if (_764)
    {
        float _784 = _768 * _780;
        _772 = _784;
    }
    float _786 = _772;
    if (_764)
    {
        float _788 = rsqrt(_760);
        _782 = _788;
    }
    float _790 = _782;
    float _792 = _790;
    if (_764)
    {
        float _794 = _786 * 0.15915493667125701904296875;
        _568 = _794;
    }
    float _796 = _568;
    float _798 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _800 = _746;
    float _802 = _796;
    if (_764)
    {
        float _804 = _796 * 6.283185482025146484375;
        float _806 = sin(_804);
        _800 = _806;
    }
    float _808 = _800;
    float _810 = precise::max(0.0, _798);
    float _812 = _738;
    float _814 = _810;
    if (_764)
    {
        float _816 = _796 * 6.283185482025146484375;
        float _818 = cos(_816);
        _812 = _818;
    }
    float _820 = _812;
    float _822 = -_750;
    float _824 = -_810;
    float _826 = fma(_730, _822, _824);
    float _828 = _826;
    if (_764)
    {
        float _830 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _774 = _830;
    }
    float _832 = _774;
    float _834 = _808;
    float _836 = _832;
    if (_764)
    {
        float _838 = fma(_808, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _834 = _838;
    }
    float _840 = _834;
    float _842 = _840;
    if (!_764)
    {
        _836 = _756;
    }
    float _844 = _836;
    float _846 = _844;
    if (_764)
    {
        float _848 = _790 * _840;
        _842 = _848;
    }
    float _850 = _842;
    if (!_764)
    {
        _792 = _754;
    }
    float _852 = _792;
    float _854 = _852;
    if (_764)
    {
        float _856 = _820 + (-1.0);
        _814 = _856;
    }
    float _858 = _814;
    float _860 = _858;
    if (_764)
    {
        float _862 = _752 * _850;
        _776 = _862;
    }
    float _864 = _776;
    if (_764)
    {
        float _866 = _754 * _850;
        _854 = _866;
    }
    float _868 = _854;
    if (_764)
    {
        float _870 = _858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _802 = _870;
    }
    float _872 = _802;
    if (_764)
    {
        float _874 = _864 * _864;
        _846 = _874;
    }
    float _876 = _846;
    if (!_764)
    {
        _860 = _758;
    }
    float _878 = _860;
    float _880 = _878;
    if (_764)
    {
        float _882 = _868 * _868;
        _880 = _882;
    }
    float _884 = _880;
    if (_764)
    {
        float _886 = fma(_826, _820, _872);
        _828 = _886;
    }
    float _888 = _828;
    float _890 = fma(_888, _888, _876);
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _894 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _892);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = _890 + _884;
    float _900 = _718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _902 = -_896;
    float _904 = _902 + 1.0;
    float _906 = _718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _908 = rsqrt(_898);
    float _910 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _900);
    float _912 = _718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _914 = _718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _916 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _918 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _910);
    float _920 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _912);
    float _922 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _906);
    float _924 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _914);
    float _926 = _918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _928 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _920);
    float _930 = abs(_904);
    float _932 = log2(_930);
    float _934 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _922);
    float _936 = _926 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _938 = _928 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _940 = _934 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _942 = -_936;
    float _944 = fma(_942, _916, 1.0);
    float _946 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _924);
    float _948 = _908 * _864;
    float _950 = _938 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _952 = _908 * _888;
    float _954 = _908 * _868;
    float _956 = _948 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _958 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[7].x, _950);
    float _960 = _946 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _962 = log2(_944);
    float _964 = _932 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _966 = -_956;
    float _968 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[21].y, _966);
    float _970 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _958);
    float _972 = _938 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _974 = -_954;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c15)._m0[21].z, _968);
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[7].w, _970);
    float _980 = exp2(_964);
    float _982 = _938 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _984 = fma(_976, -0.5, 0.5);
    float _986 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[5].x, _972);
    float _988 = fma(_976, 0.5, 0.5);
    float _990 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[4].x, _982);
    float _992 = _952 + 1.0;
    float _994 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _986);
    float _996 = 1.0 / _978;
    float _998 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _990);
    float _1000 = fma(_988, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1002 = _962 * 0.693147182464599609375;
    float _1004 = fma(_988, _1000, -0.212114393711090087890625);
    float _1006 = sqrt(_984);
    float _1008 = -_952;
    float _1010 = fma(_980, _992, _1008);
    float _1012 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[4].w, _998);
    float _1014 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[5].w, _994);
    float _1016 = fma(_988, _1004, 1.570728778839111328125);
    float _1018 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1020 = fma(_1010, 0.5, 0.5);
    float _1022 = _1012 * _996;
    float _1024 = _1014 * _996;
    float _1026 = fma(_1022, 0.5, 0.5);
    float _1028 = fma(_1024, -0.5, 0.5);
    float _1030 = _1006 * 0.636619746685028076171875;
    float3 _2722 = float3(_1026, _1028, _1018);
    float _1032 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2722, float3(0.0), isnan(_2722)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2722, float3(0.0), isnan(_2722)), level(0.0)).x;
    float3 _2733 = float3(_1026, _1028, _1018);
    float4 _1035 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2733, float3(0.0), isnan(_2733)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2733, float3(0.0), isnan(_2733)), level(0.0)).xyzw;
    float _1037 = _1035.x;
    float _1039 = _1035.y;
    float _1041 = _1035.z;
    float _1043 = _1035.w;
    float _1045 = -_1016;
    float _1047 = fma(_1030, _1045, 1.0);
    float2 _2755 = float2(_1047, _1020);
    float3 _1051 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2755, float2(0.0), isnan(_2755)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2755, float2(0.0), isnan(_2755)), level(0.0)).xyz;
    float _1053 = _1051.x;
    float _1055 = _1051.y;
    float _1057 = _1051.z;
    float _1059 = _932 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1061 = _938 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1063 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1061);
    float _1065 = exp2(_1059);
    float _1067 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1063);
    float _1069 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1067);
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1073 = _1069 + _1071;
    float _1075 = _978 + _1073;
    float _1077 = -_1065;
    float _1079 = _1077 + 1.0;
    float _1081 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1012;
    out.gl_Position.y = _1014;
    out.gl_Position.z = _1073;
    out.gl_Position.w = _978;
    float _1083 = _1075 * 0.5;
    float _1085 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _1081;
    out.m_67.z = _1083;
    out.m_67.w = _978;
    float _1087 = _1085 * _1032;
    float _1089 = -_1085;
    float _1091 = _1089 + 1.0;
    float _1093 = _1043 * _1087;
    float _1095 = _1043 * _1091;
    float _1097 = _1057 * _1087;
    float _1099 = fma(_1053, _1093, _1037);
    float _1101 = fma(_1055, _1093, _1039);
    float _1103 = fma(_1043, _1097, _1041);
    out.m_69.x = _1099;
    out.m_69.y = _1101;
    out.m_69.z = _1103;
    out.m_69.w = _1095;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _666 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1161 = as_type<float>(_104);
        out.gl_Position.z = _1161;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1230 = as_type<float>(_140);
        out.gl_Position.z = _1230;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    float _244 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_242, _158, _244);
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _160, _248);
    float _256 = fma(_250, _142, _164);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _166);
    float _262 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _264 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _266 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _262);
    float _270 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _264);
    float _272 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _266);
    float _274 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _268);
    float _276 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _270);
    float _278 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _272);
    float _280 = _274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _286 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _288 = _280 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _292 = _282 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _296 = _284 + _294;
    float _298 = _288 * _288;
    float _300 = fma(_292, _292, _298);
    float _302 = in.m_51.x;
    float _304 = in.m_51.y;
    float _306 = in.m_51.z;
    float _308 = fma(_296, _296, _300);
    float _310 = rsqrt(_308);
    float _312 = _288 * _310;
    float _314 = _292 * _310;
    float _316 = _296 * _310;
    float _318 = _306 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = -_312;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _288);
    float _324 = -_314;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _328 = -_316;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _332 = _302 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = _322 * _322;
    float _336 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _338 = _304 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _342 = fma(_326, _326, _334);
    float _344 = in.m_53.x;
    float _346 = in.m_53.y;
    float _348 = in.m_53.z;
    float _350 = _338 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _352 = fma(_330, _330, _342);
    float _354 = sqrt(_352);
    float _356 = _310 * _354;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _348);
    float _360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _344);
    float _362 = _336 * _356;
    float _364 = _340 * _356;
    float _366 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _346);
    float _368 = _350 * _356;
    float _370 = _362 * _358;
    float _372 = _364 * _360;
    float _374 = in.m_55.y;
    float _376 = _368 * _366;
    float _378 = _370 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _380 = _370 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _382 = in.m_57.y;
    float _384 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[8].x, _378);
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[10].x, _380);
    float _388 = -_376;
    float _390 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[8].z, _384);
    float _392 = -_376;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].z, _386);
    float _396 = _282 + _390;
    float _398 = _284 + _394;
    float _400 = in.m_55.x;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _408 = _398 + _406;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _412 = _410 != 0;
    float _414 = _370 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _416 = _404 * _404;
    float _418 = _408 * _408;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _422 = _420 != 0;
    float _424 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[9].x, _414);
    float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _428 = _416 + _418;
    float _430 = -_374;
    float _432 = _430 + 1.0;
    float _434 = -_376;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[9].z, _424);
    bool _438 = _382 > 0.5;
    float _440 = _282;
    float _442 = _374;
    float _444 = _280;
    float _446 = _432;
    float _448 = _414;
    float _450 = _416;
    float _452 = _396;
    if (_412)
    {
        float _454 = in.m_57.x;
        _440 = _454;
    }
    float _456 = _440;
    float _458 = sqrt(_428);
    float _460 = _280 + _436;
    if (_422)
    {
        float _462 = _438 ? _432 : _374;
        _442 = _462;
    }
    float _464 = _442;
    if (_412)
    {
        _444 = _400;
    }
    float _466 = _444;
    bool _468 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _470 = _456 > 0.5;
    bool _472 = _470 && _412;
    float _474 = _456;
    float _476 = _458;
    float _478 = _466;
    if (!_468)
    {
        _446 = _416;
    }
    float _480 = _446;
    float _482 = _480;
    if (!_468)
    {
        _448 = _418;
    }
    float _484 = _448;
    float _486 = _484;
    if (!_468)
    {
        _474 = _398;
    }
    float _488 = _474;
    float _490 = _488;
    if (!_468)
    {
        _450 = _460;
    }
    float _492 = _450;
    bool _494 = !_468;
    float _496 = _492;
    if (!_494)
    {
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _502 = _458 + _500;
        float _504 = rsqrt(_428);
        float _506 = _502 * _498;
        float _508 = _460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _510 = _506 * 0.15915493667125701904296875;
        float _512 = _510 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _510 * 6.283185482025146484375;
        float _518 = cos(_516);
        float _520 = fma(_514, _508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _522 = _504 * _520;
        float _524 = _518 + (-1.0);
        float _526 = fma(_404, _522, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _528 = fma(_408, _522, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _530 = _524 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _534 = _526 + _532;
        float _536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _538 = _528 + _536;
        float _540 = fma(_460, _518, _530);
        float _542 = _534 * _534;
        float _544 = _538 * _538;
        _496 = _540;
        _482 = _542;
        _486 = _544;
        _476 = _538;
        _452 = _526;
        _490 = _528;
    }
    float _546 = _496;
    float _548 = _482;
    float _550 = _486;
    float _552 = _476;
    float _554 = _452;
    float _556 = _490;
    float _558 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _560 = _546 + _558;
    float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _564 = _464 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _566 = _552;
    float _568 = _556;
    if (_472)
    {
        float _570 = -_466;
        float _572 = _570 + 1.0;
        _478 = _572;
    }
    float _574 = _478;
    float _576 = fma(_560, _560, _548);
    if (!_412)
    {
        _566 = _400;
    }
    float _578 = _566;
    float _580 = _564 * _426;
    float _582 = _576 + _550;
    float _584 = _578;
    float _586 = _582;
    if (_412)
    {
        _584 = _574;
    }
    float _588 = _584;
    float _590 = sqrt(_582);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _602 = _588 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _608 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _602 * _562;
    out.m_59.x = _608;
    out.m_59.y = _610;
    out.m_59.z = _612;
    out.m_59.w = _606;
    bool _622 = _590 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _624 = isnan(_590);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _630 = _626 || _628;
    out.m_61.x = _614;
    out.m_61.y = _616;
    out.m_61.z = _618;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _620;
    out.m_65.y = _580;
    if (!_630)
    {
        _586 = 1.0;
    }
    float _632 = _586;
    bool _634 = !_630;
    float _636 = _632;
    if (!_634)
    {
        bool _638 = _590 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _640 = isnan(_590);
        bool _642 = _638 || _640;
        bool _644 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _646 = _642 || _644;
        if (!_646)
        {
            float _648 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _650 = _590 + _648;
            float _652 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _654 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _652;
            float _656 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _658 = _656 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _660 = 1.0 / _654;
            float _662 = _650 * _660;
            float _664 = fma(_662, _658, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _636 = _664;
            _666 = true;
        }
        else
        {
            bool _668 = _590 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _670 = isnan(_590);
            bool _672 = _668 || _670;
            bool _674 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _676 = _672 || _674;
            if (!_676)
            {
                float _678 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _680 = _590 + _678;
                float _682 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _684 = _682 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _686 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _688 = _686 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _690 = 1.0 / _684;
                float _692 = _680 * _690;
                float _694 = fma(_692, _688, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _636 = _694;
                _666 = true;
            }
            else
            {
                _636 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _666 = false;
    float _696 = _636;
    float _698 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _700 = _546 + _698;
    float _702 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _704 = _554 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _708 = _556 + _706;
    float _710 = fma(_700, _696, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _712 = fma(_704, _696, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _714 = fma(_708, _696, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _716 = -_312;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _710);
    float _720 = -_314;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _724 = -_316;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _728 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _730 = _718 + _728;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _734 = _722 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _738 = _726 + _736;
    float _740 = _730 * _730;
    float _742 = fma(_734, _734, _740);
    float _744 = fma(_738, _738, _742);
    float _746 = rsqrt(_744);
    float _748 = sqrt(_744);
    float _750 = _746 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _752 = _734 * _750;
    float _754 = _738 * _750;
    float _756 = _752 * _752;
    float _758 = _754 * _754;
    float _760 = _756 + _758;
    float _762 = sqrt(_760);
    bool _764 = _762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _768 = _762 + _766;
    float _770 = _742;
    float _772 = _768;
    float _774 = _730;
    float _776 = _752;
    if (_764)
    {
        float _778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _770 = _778;
    }
    float _780 = _770;
    float _782 = _780;
    if (_764)
    {
        float _784 = _768 * _780;
        _772 = _784;
    }
    float _786 = _772;
    if (_764)
    {
        float _788 = rsqrt(_760);
        _782 = _788;
    }
    float _790 = _782;
    float _792 = _790;
    if (_764)
    {
        float _794 = _786 * 0.15915493667125701904296875;
        _568 = _794;
    }
    float _796 = _568;
    float _798 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _800 = _746;
    float _802 = _796;
    if (_764)
    {
        float _804 = _796 * 6.283185482025146484375;
        float _806 = sin(_804);
        _800 = _806;
    }
    float _808 = _800;
    float _810 = precise::max(0.0, _798);
    float _812 = _738;
    float _814 = _810;
    if (_764)
    {
        float _816 = _796 * 6.283185482025146484375;
        float _818 = cos(_816);
        _812 = _818;
    }
    float _820 = _812;
    float _822 = -_750;
    float _824 = -_810;
    float _826 = fma(_730, _822, _824);
    float _828 = _826;
    if (_764)
    {
        float _830 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _774 = _830;
    }
    float _832 = _774;
    float _834 = _808;
    float _836 = _832;
    if (_764)
    {
        float _838 = fma(_808, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _834 = _838;
    }
    float _840 = _834;
    float _842 = _840;
    if (!_764)
    {
        _836 = _756;
    }
    float _844 = _836;
    float _846 = _844;
    if (_764)
    {
        float _848 = _790 * _840;
        _842 = _848;
    }
    float _850 = _842;
    if (!_764)
    {
        _792 = _754;
    }
    float _852 = _792;
    float _854 = _852;
    if (_764)
    {
        float _856 = _820 + (-1.0);
        _814 = _856;
    }
    float _858 = _814;
    float _860 = _858;
    if (_764)
    {
        float _862 = _752 * _850;
        _776 = _862;
    }
    float _864 = _776;
    if (_764)
    {
        float _866 = _754 * _850;
        _854 = _866;
    }
    float _868 = _854;
    if (_764)
    {
        float _870 = _858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _802 = _870;
    }
    float _872 = _802;
    if (_764)
    {
        float _874 = _864 * _864;
        _846 = _874;
    }
    float _876 = _846;
    if (!_764)
    {
        _860 = _758;
    }
    float _878 = _860;
    float _880 = _878;
    if (_764)
    {
        float _882 = _868 * _868;
        _880 = _882;
    }
    float _884 = _880;
    if (_764)
    {
        float _886 = fma(_826, _820, _872);
        _828 = _886;
    }
    float _888 = _828;
    float _890 = fma(_888, _888, _876);
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _894 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _892);
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = _890 + _884;
    float _900 = _718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _902 = -_896;
    float _904 = _902 + 1.0;
    float _906 = _718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _908 = rsqrt(_898);
    float _910 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _900);
    float _912 = _718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _914 = _718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _916 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _918 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _910);
    float _920 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _912);
    float _922 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _906);
    float _924 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _914);
    float _926 = _918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _928 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _920);
    float _930 = abs(_904);
    float _932 = log2(_930);
    float _934 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _922);
    float _936 = _926 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _938 = _928 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _940 = _934 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _942 = -_936;
    float _944 = fma(_942, _916, 1.0);
    float _946 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _924);
    float _948 = _908 * _864;
    float _950 = _938 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _952 = _908 * _888;
    float _954 = _908 * _868;
    float _956 = _948 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _958 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[7].x, _950);
    float _960 = _946 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _962 = log2(_944);
    float _964 = _932 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _966 = -_956;
    float _968 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[21].y, _966);
    float _970 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _958);
    float _972 = _938 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _974 = -_954;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c15)._m0[21].z, _968);
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[7].w, _970);
    float _980 = exp2(_964);
    float _982 = _938 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _984 = fma(_976, -0.5, 0.5);
    float _986 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[5].x, _972);
    float _988 = fma(_976, 0.5, 0.5);
    float _990 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[4].x, _982);
    float _992 = _952 + 1.0;
    float _994 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _986);
    float _996 = 1.0 / _978;
    float _998 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _990);
    float _1000 = fma(_988, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1002 = _962 * 0.693147182464599609375;
    float _1004 = fma(_988, _1000, -0.212114393711090087890625);
    float _1006 = sqrt(_984);
    float _1008 = -_952;
    float _1010 = fma(_980, _992, _1008);
    float _1012 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[4].w, _998);
    float _1014 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[5].w, _994);
    float _1016 = fma(_988, _1004, 1.570728778839111328125);
    float _1018 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1020 = fma(_1010, 0.5, 0.5);
    float _1022 = _1012 * _996;
    float _1024 = _1014 * _996;
    float _1026 = fma(_1022, 0.5, 0.5);
    float _1028 = fma(_1024, -0.5, 0.5);
    float _1030 = _1006 * 0.636619746685028076171875;
    float3 _2722 = float3(_1026, _1028, _1018);
    float _1032 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2722, float3(0.0), isnan(_2722)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2722, float3(0.0), isnan(_2722)), level(0.0)).x;
    float3 _2733 = float3(_1026, _1028, _1018);
    float4 _1035 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2733, float3(0.0), isnan(_2733)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2733, float3(0.0), isnan(_2733)), level(0.0)).xyzw;
    float _1037 = _1035.x;
    float _1039 = _1035.y;
    float _1041 = _1035.z;
    float _1043 = _1035.w;
    float _1045 = -_1016;
    float _1047 = fma(_1030, _1045, 1.0);
    float2 _2755 = float2(_1047, _1020);
    float3 _1051 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2755, float2(0.0), isnan(_2755)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2755, float2(0.0), isnan(_2755)), level(0.0)).xyz;
    float _1053 = _1051.x;
    float _1055 = _1051.y;
    float _1057 = _1051.z;
    float _1059 = _932 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1061 = _938 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1063 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1061);
    float _1065 = exp2(_1059);
    float _1067 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1063);
    float _1069 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1067);
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1073 = _1069 + _1071;
    float _1075 = _978 + _1073;
    float _1077 = -_1065;
    float _1079 = _1077 + 1.0;
    float _1081 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1012;
    out.gl_Position.y = _1014;
    out.gl_Position.z = _1073;
    out.gl_Position.w = _978;
    float _1083 = _1075 * 0.5;
    float _1085 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _1081;
    out.m_67.z = _1083;
    out.m_67.w = _978;
    float _1087 = _1085 * _1032;
    float _1089 = -_1085;
    float _1091 = _1089 + 1.0;
    float _1093 = _1043 * _1087;
    float _1095 = _1043 * _1091;
    float _1097 = _1057 * _1087;
    float _1099 = fma(_1053, _1093, _1037);
    float _1101 = fma(_1055, _1093, _1039);
    float _1103 = fma(_1043, _1097, _1041);
    out.m_69.x = _1099;
    out.m_69.y = _1101;
    out.m_69.z = _1103;
    out.m_69.w = _1095;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

