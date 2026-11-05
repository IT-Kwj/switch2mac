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
    float4 m_61 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    float _110 = _108;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_102)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1839 = as_type<float>(_116);
        out.gl_Position.z = _1839;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_98);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
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
        _118 = as_type<int>(_148);
    }
    int _150 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_150);
        out.gl_Position.z = _1907;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_49.x;
    float _154 = in.m_49.y;
    float _156 = in.m_49.z;
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _162 = in.m_51.x;
    float _164 = in.m_53.z;
    float _166 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _168 = _166 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _172 = _170 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _174 = in.m_53.x;
    float _176 = 0.0;
    bool _178 = _158;
    if (_158)
    {
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _176 = _180;
    }
    float _182 = _176;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _186 = _184 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _190 = _188 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _192 = 1.0 / _168;
    bool _194 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _196 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _198 = _194 || _196;
    bool _200 = isnan(1.0);
    bool _202 = _198 || _200;
    float _204 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _206 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _212 = 1.0 / _172;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _218 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _220 = _154;
    float _222 = _216;
    float _224 = _204;
    float _226 = _162;
    if (_158)
    {
        float _228 = _162 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _220 = _228;
    }
    float _230 = _220;
    float _232 = abs(_164);
    float _234 = abs(_174);
    float _236 = precise::max(_232, _234);
    float _238 = 1.0 / _186;
    float _240 = _160 * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    bool _244 = _236 >= 16.0;
    float _246 = _230;
    float _248 = _242;
    if (_158)
    {
        float _250 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[14].x, _242);
        _246 = _250;
    }
    float _252 = _246;
    float _254 = 1.0 / _190;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _256;
    float _260 = 1.0 / _216;
    float _262 = _258 * _192;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _266 = _264 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _268 = 1.0 / _210;
    if (_158)
    {
        float _270 = _252 * _182;
        _222 = _270;
    }
    float _272 = _222;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _282;
    float _286 = _276 * _212;
    float _288 = _280 * _254;
    float _290 = 1.0 / _266;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _296 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _298 = _284 * _260;
    float _300 = _294 * _238;
    float _302 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _174);
    float _304 = _212;
    float _306 = _296;
    if (_158)
    {
        float _308 = floor(_272);
        _304 = _308;
    }
    float _310 = _304;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _316;
    float _320 = _204 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_202)
    {
        float _322 = _296 * _296;
        float _324 = _322 * 0.5;
        _224 = _324;
    }
    float _326 = _224;
    float _328 = _314 * _268;
    float _330 = _318 * _290;
    float _332 = _320 * _302;
    float _334 = _326;
    if (!_202)
    {
        float _336 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _336;
    }
    float _338 = _334;
    float _340 = _338;
    if (_158)
    {
        float _342 = -_310;
        float _344 = _272 + _342;
        _248 = _344;
    }
    float _346 = _248;
    bool _348 = !_202;
    if (!_348)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _360 = _296 * _352;
        float _362 = 1.0 / _356;
        float _364 = _358 * 0.693147182464599609375;
        float _366 = exp2(_360);
        float _368 = 1.0 / _364;
        float _370 = _366 + (-1.0);
        float _372 = -_370;
        float _374 = fma(_372, _368, _296);
        float _376 = _374 * _362;
        float _378 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _340 = _378;
    }
    float _380 = _340;
    bool _382 = !_202;
    if (!_382)
    {
        float _384 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _386 = log2(_384);
        float _388 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _390 = _388 + 1.0;
        float _392 = 1.0 / _390;
        float _394 = _296 * _386;
        float _396 = exp2(_394);
        float _398 = -_396;
        float _400 = _398 + 1.0;
        float _402 = _400 * _392;
        _306 = _402;
    }
    float _404 = _306;
    float _406 = _174 * 0.0625;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _410 = _346 + _408;
    float _412 = _164 * 0.0625;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _416 = _346 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _420 = _346 + _418;
    float _422 = fma(_262, _410, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _424 = _244 ? _406 : _174;
    float _426 = fma(_288, _416, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _428 = _244 ? _412 : _164;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _432 = _346 + _430;
    float _434 = abs(_424);
    bool _436 = _434 != 0.0;
    bool _438 = isnan(_434);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _448 = _346 + _446;
    float _450 = abs(_428);
    bool _452 = _450 == 0.0;
    float _454 = fma(_300, _432, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _456 = abs(_428);
    bool _458 = _456 == 0.0;
    bool _460 = !_444;
    bool _462 = _458 && _460;
    float _464 = fma(_328, _420, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _466 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _468 = isnan(_346);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _480 = _346 + _478;
    bool _482 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _484 = isnan(_346);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _490 = _486 || _488;
    int _492 = _490 ? 1065353216 : 0;
    float _494 = fma(_298, _448, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _496 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _498 = isnan(_346);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -_476;
    float _510 = _508 + 1.0;
    bool _512 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _514 = isnan(_346);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -as_type<float>(_492);
    float _526 = _524 + 1.0;
    float _528 = fma(_286, _480, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _530 = as_type<float>(_492) * _510;
    int _532 = _492;
    if (_462)
    {
        bool _534 = as_type<int>(_428) >= 0;
        _178 = _534;
    }
    bool _536 = _178;
    float _538 = -_506;
    float _540 = _538 + 1.0;
    float _542 = _522 * _526;
    int _544 = _536 ? (-1) : 0;
    if (_462)
    {
        int _546 = _536 ? 0 : 1078530011;
        _532 = _546;
    }
    int _548 = _532;
    float _550 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _552 = _476 * _540;
    float _554 = _422 * _542;
    bool _556 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _558 = isnan(_346);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    int _568 = _548;
    if (_462)
    {
        int _570 = int(0x80000000) & as_type<int>(_424);
        int _572 = _548 | _570;
        _568 = _572;
    }
    int _574 = _568;
    bool _576 = !_444;
    bool _578 = _576 && _452;
    int _580 = _574;
    float _582 = as_type<float>(_574);
    if (!_578)
    {
        float _584 = abs(_424);
        bool _586 = _584 != as_type<float>(0x7f800000u /* inf */);
        bool _588 = isnan(_584);
        bool _590 = _586 || _588;
        bool _592 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _594 = _590 || _592;
        float _596 = abs(_428);
        bool _598 = _596 == as_type<float>(0x7f800000u /* inf */);
        float _600 = abs(_428);
        bool _602 = _600 == as_type<float>(0x7f800000u /* inf */);
        bool _604 = !_594;
        bool _606 = _602 && _604;
        if (_606)
        {
            bool _608 = as_type<int>(_428) >= 0;
            _544 = _608 ? (-1) : 0;
        }
        int _610 = _544;
        if (_606)
        {
            _580 = 1075235812;
        }
        int _612 = _580;
        int _614 = _612;
        if (_606)
        {
            int _616 = ~_610;
            int _618 = (_616 != 0) ? _612 : 1061752795;
            _614 = _618;
        }
        int _620 = _614;
        float _622 = as_type<float>(_620);
        if (_606)
        {
            int _624 = int(0x80000000) & as_type<int>(_424);
            int _626 = _620 | _624;
            _622 = as_type<float>(_626);
        }
        float _628 = _622;
        bool _630 = !_594;
        bool _632 = _630 && _598;
        _582 = _628;
        if (!_632)
        {
            float _634 = abs(_424);
            float _636 = abs(_428);
            float _638 = precise::max(_634, _636);
            float _640 = abs(_424);
            float _642 = abs(_428);
            float _644 = precise::min(_640, _642);
            float _646 = 1.0 / _638;
            float _648 = abs(_424);
            float _650 = abs(_428);
            bool _652 = _648 > _650;
            bool _654 = as_type<int>(_428) >= 0;
            float _656 = _644 * _646;
            float _658 = _656 * _656;
            float _660 = _658 + 11.33538818359375;
            float _662 = fma(_658, _660, 28.84246826171875);
            float _664 = fma(_658, _662, 19.6966705322265625);
            float _666 = fma(_658, -0.82336294651031494140625, -5.674867153167724609375);
            float _668 = fma(_658, _666, -6.565555095672607421875);
            float _670 = 1.0 / _664;
            float _672 = _658 * _668;
            float _674 = abs(_424);
            float _676 = abs(_428);
            float _678 = _674 + _676;
            int _680 = as_type<int>(_424) & int(0x80000000);
            float _682 = _656 * _672;
            bool _684 = _678 > as_type<float>(0x7f800000u /* inf */);
            bool _686 = isnan(_678);
            bool _688 = _684 || _686;
            bool _690 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _692 = _688 || _690;
            float _694 = fma(_682, _670, _656);
            float _696 = _694;
            _582 = _678;
            if (_652)
            {
                float _698 = -_694;
                float _700 = _698 + 1.57079637050628662109375;
                _696 = _700;
            }
            float _702 = _696;
            int _704 = as_type<int>(_702);
            if (!_654)
            {
                float _706 = -_702;
                float _708 = _706 + 3.1415927410125732421875;
                _704 = as_type<int>(_708);
            }
            int _710 = _704;
            if (!_692)
            {
                int _712 = _680 | _710;
                _582 = as_type<float>(_712);
            }
        }
    }
    float _714 = _582;
    float _716 = -_522;
    float _718 = _716 + 1.0;
    float _720 = in.m_53.y;
    float _722 = fma(_714, 4.0, _550);
    float _724 = -_550;
    float _726 = fma(_714, 4.0, _724);
    float _728 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[159].y, _554);
    float _730 = -_566;
    float _732 = _730 + 1.0;
    float _734 = _722 * 0.15915493667125701904296875;
    float _736 = _726 * 0.15915493667125701904296875;
    float _738 = fma(_528, _530, _728);
    float _740 = in.m_55.w;
    bool _742 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _744 = isnan(_346);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = _506 * _732;
    float _756 = fma(_426, _552, _738);
    bool _758 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _760 = isnan(_346);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = _734 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = -_752;
    float _776 = _774 + 1.0;
    float _778 = fma(_454, _754, _756);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _782 = _346 + _780;
    float _784 = in.m_47.x;
    float _786 = in.m_47.y;
    float _788 = in.m_47.z;
    float _790 = -_768;
    float _792 = _790 + 1.0;
    float _794 = _768 * _776;
    bool _796 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _798 = isnan(_346);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _736 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _566 * _792;
    float _814 = fma(_330, _782, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    bool _816 = _720 > 0.0;
    float _818 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _820 = fma(_494, _812, _778);
    bool _822 = _720 >= 0.0;
    bool _824 = isnan(_720);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    float _832 = in.m_49.w;
    float _834 = -_806;
    float _836 = _834 + 1.0;
    float _838 = fma(_464, _794, _820);
    float _840 = in.m_42.x;
    float _842 = in.m_42.y;
    float _844 = in.m_42.z;
    int _846 = _830 ? 0 : 1;
    float _848 = _752 * _836;
    float _850 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _852 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _854 = _772 + _810;
    float _856 = fma(_814, _848, _838);
    float _858 = -_740;
    float _860 = _858 + 1.0;
    int _862 = ~_846;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = fma(_854, 0.5, 1.0);
    float _870 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[166].y, _856);
    float _872 = precise::clamp(_870, 0.0, 1.0);
    int _874 = _866;
    float _876 = _794;
    float _878 = _752;
    if (!_816)
    {
        int _880 = ~_846;
        int _882 = _880 + 1;
        _874 = _882;
    }
    int _884 = _874;
    float _886 = _868 * _860;
    float _888 = fma(_404, _784, _850);
    float _890 = fma(_872, -2.0, 3.0);
    float _892 = float(_884);
    float _894 = _886 * 25.0;
    float _896 = _872 * _872;
    float _898 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _900 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _902 = fma(_894, _892, _720);
    float _904 = _890 * _896;
    float _906 = fma(_404, _786, _898);
    float _908 = fma(_404, _788, _900);
    float _910 = fma(_888, _832, _840);
    float _912 = _902 * _904;
    float _914 = fma(_906, _832, _842);
    float _916 = fma(_908, _832, _844);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _924 = _852 * _918;
    float _926 = _818 * _920;
    float _928 = _914 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].x, _922);
    float _932 = _926 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].x, _928);
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _938 = _926 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _940 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].x, _932);
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[4].z, _934);
    float _944 = _936 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _946 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].x, _938);
    float _948 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[10].z, _940);
    float _950 = _942 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _952 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[8].z, _946);
    float _954 = _944 + _948;
    float _956 = _950 + _952;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _960 = _954 + _958;
    float _962 = _926 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _956 + _964;
    float _968 = _960 * _960;
    float _970 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[9].x, _962);
    float _972 = fma(_966, _966, _968);
    float _974 = _914 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _976 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[9].z, _970);
    float _978 = sqrt(_972);
    float _980 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].x, _974);
    float _982 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[5].z, _980);
    float _984 = _982 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _986 = _984 + _976;
    bool _988 = _978 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = _924;
    float _992 = _956;
    float _994 = _986;
    float _996 = _954;
    if (!_988)
    {
        _990 = _956;
    }
    float _998 = _990;
    float _1000 = _998;
    if (!_988)
    {
        _992 = _954;
    }
    float _1002 = _992;
    float _1004 = _1002;
    if (!_988)
    {
        _876 = _986;
    }
    float _1006 = _876;
    bool _1008 = !_988;
    float _1010 = _1006;
    if (!_1008)
    {
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1016 = _978 + _1014;
        float _1018 = rsqrt(_972);
        float _1020 = _1016 * _1012;
        float _1022 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1024 = _1020 * 0.15915493667125701904296875;
        float _1026 = _1024 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        float _1034 = fma(_1028, _1022, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = _1018 * _1034;
        float _1038 = _1032 + (-1.0);
        float _1040 = fma(_966, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_960, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = fma(_986, _1032, _1044);
        _1010 = _1046;
        _1000 = _1040;
        _1004 = _1042;
    }
    float _1048 = _1010;
    float _1050 = _1000;
    float _1052 = _1004;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1060 = _1050 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1052 + _1062;
    float _1066 = _1056 * _1056;
    float _1068 = fma(_1060, _1060, _1066);
    float _1070 = fma(_1064, _1064, _1068);
    float _1072 = rsqrt(_1070);
    float _1074 = sqrt(_1070);
    float _1076 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1078 = _1060 * _1076;
    float _1080 = _1064 * _1076;
    float _1082 = _1078 * _1078;
    float _1084 = _1080 * _1080;
    float _1086 = _1082 + _1084;
    float _1088 = sqrt(_1086);
    bool _1090 = _1088 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1094 = _1088 + _1092;
    float _1096 = _1068;
    float _1098 = _1094;
    float _1100 = _1076;
    float _1102 = _1078;
    if (_1090)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1096 = _1104;
    }
    float _1106 = _1096;
    if (_1090)
    {
        float _1108 = rsqrt(_1086);
        _994 = _1108;
    }
    float _1110 = _994;
    float _1112 = _1110;
    if (_1090)
    {
        float _1114 = _1094 * _1106;
        _1098 = _1114;
    }
    float _1116 = _1098;
    if (_1090)
    {
        float _1118 = _1116 * 0.15915493667125701904296875;
        _996 = _1118;
    }
    float _1120 = _996;
    float _1122 = _1106;
    float _1124 = _1120;
    if (_1090)
    {
        float _1126 = _1120 * 6.283185482025146484375;
        float _1128 = sin(_1126);
        _1122 = _1128;
    }
    float _1130 = _1122;
    float _1132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1134 = precise::max(0.0, _1132);
    float _1136 = _914;
    float _1138 = _1134;
    if (_1090)
    {
        float _1140 = _1120 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1136 = _1142;
    }
    float _1144 = _1136;
    float _1146 = -_1076;
    float _1148 = -_1134;
    float _1150 = fma(_1056, _1146, _1148);
    if (_1090)
    {
        float _1152 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1138 = _1152;
    }
    float _1154 = _1138;
    float _1156 = _1154;
    if (!_1090)
    {
        _1124 = _1082;
    }
    float _1158 = _1124;
    float _1160 = _1130;
    float _1162 = _1158;
    if (_1090)
    {
        float _1164 = fma(_1130, _1154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _1166;
    if (_1090)
    {
        float _1170 = _1144 + (-1.0);
        _1156 = _1170;
    }
    float _1172 = _1156;
    float _1174 = _1172;
    if (_1090)
    {
        float _1176 = _1110 * _1166;
        _878 = _1176;
    }
    float _1178 = _878;
    if (!_1090)
    {
        _1112 = _1150;
    }
    float _1180 = _1112;
    float _1182 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1184 = _1180;
    if (_1090)
    {
        float _1186 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1186;
    }
    float _1188 = _1100;
    if (_1090)
    {
        float _1190 = _1078 * _1178;
        _1102 = _1190;
    }
    float _1192 = _1102;
    if (!_1090)
    {
        _1168 = _1080;
    }
    float _1194 = _1168;
    float _1196 = _1194;
    if (_1090)
    {
        float _1198 = _1080 * _1178;
        _1196 = _1198;
    }
    float _1200 = _1196;
    if (_1090)
    {
        float _1202 = fma(_1150, _1144, _1188);
        _1184 = _1202;
    }
    float _1204 = _1184;
    if (_1090)
    {
        float _1206 = _1192 * _1192;
        _1162 = _1206;
    }
    float _1208 = _1162;
    if (!_1090)
    {
        _1174 = _1084;
    }
    float _1210 = _1174;
    float _1212 = _1210;
    if (_1090)
    {
        float _1214 = _1200 * _1200;
        _1212 = _1214;
    }
    float _1216 = _1212;
    float _1218 = fma(_1204, _1204, _1208);
    float _1220 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1222 = _1218 + _1216;
    float _1224 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1228 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1226);
    float _1230 = precise::clamp(_1228, 0.0, 1.0);
    float _1232 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1220);
    float _1234 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1236 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1238 = rsqrt(_1222);
    float _1240 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1242 = -_1230;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1236);
    float _1248 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1232);
    float _1250 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1252 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1240);
    float _1254 = abs(_1244);
    float _1256 = log2(_1254);
    float _1258 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1234);
    float _1260 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1262 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1252);
    float _1264 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1266 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1258);
    float _1268 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1270 = _1238 * _1192;
    float _1272 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1274 = _1238 * _1204;
    float _1276 = _1238 * _1200;
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1280 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1268);
    float _1282 = -_1264;
    float _1284 = fma(_1282, _1182, 1.0);
    float _1286 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1288 = -_1278;
    float _1290 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1288);
    float _1292 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1280);
    float _1294 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1296 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1298 = -_1276;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1290);
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1292);
    float _1304 = log2(_1284);
    float _1306 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1308 = fma(_1300, -0.5, 0.5);
    float _1310 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1296);
    float _1312 = fma(_1300, 0.5, 0.5);
    float _1314 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1306);
    float _1316 = _1274 + 1.0;
    float _1318 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1310);
    float _1320 = exp2(_1294);
    float _1322 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1324 = fma(_1312, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1326 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1318);
    float _1328 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1322);
    float _1330 = fma(_1312, _1324, -0.212114393711090087890625);
    float _1332 = 1.0 / _1302;
    float _1334 = _1304 * 0.693147182464599609375;
    float _1336 = fma(_1312, _1330, 1.570728778839111328125);
    float _1338 = sqrt(_1308);
    float _1340 = -_1274;
    float _1342 = fma(_1320, _1316, _1340);
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1346 = fma(_1342, 0.5, 0.5);
    float _1348 = _1326 * _1332;
    float _1350 = _1328 * _1332;
    float _1352 = fma(_1348, 0.5, 0.5);
    float _1354 = fma(_1350, -0.5, 0.5);
    float _1356 = _1338 * 0.636619746685028076171875;
    float3 _3805 = float3(_1352, _1354, _1344);
    float _1358 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3805, float3(0.0), isnan(_3805)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3805, float3(0.0), isnan(_3805)), level(0.0)).x;
    float _1360 = -_1336;
    float _1362 = fma(_1356, _1360, 1.0);
    float3 _3821 = float3(_1352, _1354, _1344);
    float4 _1365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3821, float3(0.0), isnan(_3821)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3821, float3(0.0), isnan(_3821)), level(0.0)).xyzw;
    float _1367 = _1365.x;
    float _1369 = _1365.y;
    float _1371 = _1365.z;
    float _1373 = _1365.w;
    float2 _3838 = float2(_1362, _1346);
    float3 _1377 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3838, float2(0.0), isnan(_3838)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3838, float2(0.0), isnan(_3838)), level(0.0)).xyz;
    float _1379 = _1377.x;
    float _1381 = _1377.y;
    float _1383 = _1377.z;
    float _1385 = in.m_51.y;
    float _1387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1389 = in.m_57.y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1395 = _1393 != 0;
    float _1397 = in.m_51.z;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1401 = _1399 != 0;
    float _1403 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1407 = _1405 != 0;
    float _1409 = in.m_57.x;
    float _1411 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    float _1417 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1421 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1425 = _1423 != 0;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1429 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1431 = _1385 > 0.5;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1435 = -_1419;
    float _1437 = fma(_1403, 2.0, _1435);
    float _1439 = fma(_1429, -2.0, _1391);
    float _1441 = -_1389;
    float _1443 = _1441 + 1.0;
    float _1445 = _1403;
    float _1447 = _1389;
    float _1449 = _1433;
    bool _1451 = _1401;
    float _1453 = _1385;
    if (!_1395)
    {
        _1445 = _1385;
    }
    float _1455 = _1445;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1459 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1433);
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1463 = _1455;
    if (_1401)
    {
        float _1465 = _1431 ? _1443 : _1389;
        _1447 = _1465;
    }
    float _1467 = _1447;
    float _1469 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1427);
    if (_1395)
    {
        _1463 = _162;
    }
    float _1471 = _1463;
    float _1473 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1461);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_1407)
    {
        _1449 = _1409;
    }
    float _1477 = _1449;
    float _1479 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1457);
    float _1481 = _1477;
    if (_1407)
    {
        bool _1483 = _162 > 0.5;
        _1451 = _1483;
    }
    bool _1485 = _1451;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1489 = false;
    if (_1415)
    {
        bool _1491 = _1397 > 0.5;
        _1489 = _1491;
    }
    bool _1493 = _1489;
    float _1495 = fma(_1421, _1467, -0.5);
    if (!_1395)
    {
        _226 = _1397;
    }
    float _1497 = _226;
    float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1501 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1503 = as_type<int>(_1497);
    if (!_1407)
    {
        _1453 = _1477;
    }
    float _1505 = _1453;
    float _1507 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1439);
    float _1509 = _1505;
    if (_1407)
    {
        _1481 = _1409;
    }
    float _1511 = _1481;
    float _1513 = -_1487;
    float _1515 = fma(_1501, 2.0, _1513);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1519 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1521 = _1517;
    if (_1407)
    {
        float _1523 = -_1511;
        float _1525 = _1523 + 1.0;
        _1503 = as_type<int>(_1525);
    }
    int _1527 = _1503;
    int _1529 = 0;
    if (_1415)
    {
        float _1531 = -_1511;
        float _1533 = _1531 + 1.0;
        _1529 = as_type<int>(_1533);
    }
    int _1535 = _1529;
    int _1537 = 0;
    if (_1425)
    {
        float _1539 = -_1511;
        float _1541 = _1539 + 1.0;
        _1537 = as_type<int>(_1541);
    }
    int _1543 = _1537;
    float _1545 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1517);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_1407)
    {
        float _1549 = _1485 ? as_type<float>(_1527) : _1511;
        _1509 = _1549;
    }
    float _1551 = _1509;
    float _1553 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1555 = 0.0;
    if (!_1415)
    {
        _1555 = _1511;
    }
    float _1557 = _1555;
    float _1559 = _1499 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1561 = _1557;
    if (!_1425)
    {
        _1521 = _1511;
    }
    float _1563 = _1521;
    float _1565 = -_1547;
    float _1567 = fma(_1519, 2.0, _1565);
    float _1569 = _1563;
    if (_1415)
    {
        float _1571 = _1493 ? as_type<float>(_1535) : _1511;
        _1561 = _1571;
    }
    float _1573 = _1561;
    float _1575 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1479);
    if (_1425)
    {
        float _1577 = _1431 ? as_type<float>(_1543) : _1511;
        _1569 = _1577;
    }
    float _1579 = _1569;
    float _1581 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1473);
    float _1583 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1469);
    float _1585 = -_134;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1437);
    float _1589 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1459);
    float _1591 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1545);
    float _1593 = -_134;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1515);
    float _1597 = -_134;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1567);
    float _1601 = fma(_1553, _1573, -0.5);
    float _1603 = fma(_1559, _1579, -0.5);
    bool _1605 = _912 != 0.0;
    bool _1607 = isnan(_912);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan(0.0);
    bool _1613 = _1609 || _1611;
    float _1615 = in.m_59.x;
    float _1617 = in.m_59.y;
    float _1619 = in.m_59.z;
    float _1621 = _1581 * (-0.15915493667125701904296875);
    bool _1623 = _174 == 0.0;
    bool _1625 = !_1613;
    bool _1627 = _1623 && _1625;
    float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1633 = _164 == 0.0;
    bool _1635 = _1633 && _1627;
    float _1637 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1417);
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1641 = exp2(_1411);
    float _1643 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1651 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1653 = _1621 * 6.283185482025146484375;
    float _1655 = sin(_1653);
    float _1657 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_61.x = _1643;
    out.m_61.y = _1647;
    out.m_61.z = _1651;
    out.m_61.w = _1649;
    float _1659 = _1617;
    float _1661 = _1615;
    float _1663 = _1619;
    if (!_1635)
    {
        float _1665 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1617);
        _1659 = _1665;
    }
    float _1667 = _1659;
    if (!_1635)
    {
        float _1669 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1615);
        _1661 = _1669;
    }
    float _1671 = _1661;
    if (!_1635)
    {
        float _1673 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1619);
        _1663 = _1673;
    }
    float _1675 = _1663;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1679 = _1621 * 6.283185482025146484375;
    float _1681 = cos(_1679);
    float _1683 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = -_1641;
    float _1687 = _1685 + 1.0;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1693 = fma(_1671, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1695 = fma(_1657, _1551, -0.5);
    float _1697 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1637);
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1701 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1703 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1705 = _1655 * _1495;
    float _1707 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = fma(_1671, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1701);
    float _1711 = fma(_1671, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1703);
    float _1713 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1693);
    float _1715 = _1681 * _1495;
    float _1717 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1709);
    float _1719 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1711);
    float _1721 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1723 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1725 = -_1705;
    float _1727 = fma(_1681, _1695, _1725);
    float _1729 = fma(_1655, _1695, _1715);
    out.m_63.x = _1713;
    out.m_63.y = _1717;
    out.m_63.z = _1719;
    float _1731 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1697);
    float _1733 = fma(_1591, _1601, _1595);
    float _1735 = fma(_1589, _1603, _1599);
    out.m_65.w = _740;
    float _1737 = fma(_1583, _1727, _1587);
    float _1739 = -_1507;
    float _1741 = fma(_1575, _1729, _1739);
    float _1743 = _1326 + _1302;
    out.m_67.x = _1707;
    out.m_67.y = _1721;
    out.m_67.z = _1723;
    float _1745 = _1302 * 0.5;
    float _1747 = _1735 + 0.5;
    float _1749 = _1733 + 0.5;
    out.m_69.y = _1048;
    float _1751 = _1737 + 0.5;
    float _1753 = _1741 + 0.5;
    out.m_71.x = _1060;
    out.m_71.y = _1056;
    out.m_71.z = _1064;
    float _1755 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1757 = _1731 + _1302;
    float _1759 = _1743 * 0.5;
    float _1761 = fma(_1328, -0.5, _1745);
    out.m_73.x = _1751;
    out.m_73.y = _1753;
    out.m_73.z = _1749;
    float _1763 = _1757 * 0.5;
    out.m_75.x = _1747;
    out.gl_Position.x = _1326;
    out.gl_Position.y = _1328;
    out.gl_Position.z = _1731;
    out.gl_Position.w = _1302;
    out.m_77.x = _1759;
    out.m_77.y = _1761;
    out.m_77.z = _1763;
    out.m_77.w = _1302;
    out.m_45.x = _1755;
    float _1765 = _1699 * _1358;
    float _1767 = -_1699;
    float _1769 = _1767 + 1.0;
    float _1771 = _1373 * _1765;
    float _1773 = _1373 * _1769;
    float _1775 = _1383 * _1765;
    float _1777 = fma(_1379, _1771, _1367);
    float _1779 = fma(_1381, _1771, _1369);
    float _1781 = fma(_1373, _1775, _1371);
    out.m_79.x = _1777;
    out.m_79.y = _1779;
    out.m_79.z = _1781;
    out.m_79.w = _1773;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    float _110 = _108;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_102)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1839 = as_type<float>(_116);
        out.gl_Position.z = _1839;
    }
    if (!_102)
    {
        return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_98);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
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
        _118 = as_type<int>(_148);
    }
    int _150 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_150);
        out.gl_Position.z = _1907;
    }
    if (_144)
    {
        return out;
    }
    float _152 = in.m_49.x;
    float _154 = in.m_49.y;
    float _156 = in.m_49.z;
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _162 = in.m_51.x;
    float _164 = in.m_53.z;
    float _166 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _168 = _166 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _172 = _170 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _174 = in.m_53.x;
    float _176 = 0.0;
    bool _178 = _158;
    if (_158)
    {
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _176 = _180;
    }
    float _182 = _176;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _186 = _184 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _190 = _188 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _192 = 1.0 / _168;
    bool _194 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _196 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _198 = _194 || _196;
    bool _200 = isnan(1.0);
    bool _202 = _198 || _200;
    float _204 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _206 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _212 = 1.0 / _172;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _218 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _220 = _154;
    float _222 = _216;
    float _224 = _204;
    float _226 = _162;
    if (_158)
    {
        float _228 = _162 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _220 = _228;
    }
    float _230 = _220;
    float _232 = abs(_164);
    float _234 = abs(_174);
    float _236 = precise::max(_232, _234);
    float _238 = 1.0 / _186;
    float _240 = _160 * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    bool _244 = _236 >= 16.0;
    float _246 = _230;
    float _248 = _242;
    if (_158)
    {
        float _250 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[14].x, _242);
        _246 = _250;
    }
    float _252 = _246;
    float _254 = 1.0 / _190;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _256;
    float _260 = 1.0 / _216;
    float _262 = _258 * _192;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _266 = _264 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _268 = 1.0 / _210;
    if (_158)
    {
        float _270 = _252 * _182;
        _222 = _270;
    }
    float _272 = _222;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _282;
    float _286 = _276 * _212;
    float _288 = _280 * _254;
    float _290 = 1.0 / _266;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _296 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _298 = _284 * _260;
    float _300 = _294 * _238;
    float _302 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _174);
    float _304 = _212;
    float _306 = _296;
    if (_158)
    {
        float _308 = floor(_272);
        _304 = _308;
    }
    float _310 = _304;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _316;
    float _320 = _204 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_202)
    {
        float _322 = _296 * _296;
        float _324 = _322 * 0.5;
        _224 = _324;
    }
    float _326 = _224;
    float _328 = _314 * _268;
    float _330 = _318 * _290;
    float _332 = _320 * _302;
    float _334 = _326;
    if (!_202)
    {
        float _336 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _336;
    }
    float _338 = _334;
    float _340 = _338;
    if (_158)
    {
        float _342 = -_310;
        float _344 = _272 + _342;
        _248 = _344;
    }
    float _346 = _248;
    bool _348 = !_202;
    if (!_348)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _360 = _296 * _352;
        float _362 = 1.0 / _356;
        float _364 = _358 * 0.693147182464599609375;
        float _366 = exp2(_360);
        float _368 = 1.0 / _364;
        float _370 = _366 + (-1.0);
        float _372 = -_370;
        float _374 = fma(_372, _368, _296);
        float _376 = _374 * _362;
        float _378 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _340 = _378;
    }
    float _380 = _340;
    bool _382 = !_202;
    if (!_382)
    {
        float _384 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _386 = log2(_384);
        float _388 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _390 = _388 + 1.0;
        float _392 = 1.0 / _390;
        float _394 = _296 * _386;
        float _396 = exp2(_394);
        float _398 = -_396;
        float _400 = _398 + 1.0;
        float _402 = _400 * _392;
        _306 = _402;
    }
    float _404 = _306;
    float _406 = _174 * 0.0625;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _410 = _346 + _408;
    float _412 = _164 * 0.0625;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _416 = _346 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _420 = _346 + _418;
    float _422 = fma(_262, _410, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _424 = _244 ? _406 : _174;
    float _426 = fma(_288, _416, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _428 = _244 ? _412 : _164;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _432 = _346 + _430;
    float _434 = abs(_424);
    bool _436 = _434 != 0.0;
    bool _438 = isnan(_434);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _448 = _346 + _446;
    float _450 = abs(_428);
    bool _452 = _450 == 0.0;
    float _454 = fma(_300, _432, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _456 = abs(_428);
    bool _458 = _456 == 0.0;
    bool _460 = !_444;
    bool _462 = _458 && _460;
    float _464 = fma(_328, _420, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _466 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _468 = isnan(_346);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _480 = _346 + _478;
    bool _482 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _484 = isnan(_346);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _490 = _486 || _488;
    int _492 = _490 ? 1065353216 : 0;
    float _494 = fma(_298, _448, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _496 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _498 = isnan(_346);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -_476;
    float _510 = _508 + 1.0;
    bool _512 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _514 = isnan(_346);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -as_type<float>(_492);
    float _526 = _524 + 1.0;
    float _528 = fma(_286, _480, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _530 = as_type<float>(_492) * _510;
    int _532 = _492;
    if (_462)
    {
        bool _534 = as_type<int>(_428) >= 0;
        _178 = _534;
    }
    bool _536 = _178;
    float _538 = -_506;
    float _540 = _538 + 1.0;
    float _542 = _522 * _526;
    int _544 = _536 ? (-1) : 0;
    if (_462)
    {
        int _546 = _536 ? 0 : 1078530011;
        _532 = _546;
    }
    int _548 = _532;
    float _550 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _552 = _476 * _540;
    float _554 = _422 * _542;
    bool _556 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _558 = isnan(_346);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    int _568 = _548;
    if (_462)
    {
        int _570 = int(0x80000000) & as_type<int>(_424);
        int _572 = _548 | _570;
        _568 = _572;
    }
    int _574 = _568;
    bool _576 = !_444;
    bool _578 = _576 && _452;
    int _580 = _574;
    float _582 = as_type<float>(_574);
    if (!_578)
    {
        float _584 = abs(_424);
        bool _586 = _584 != as_type<float>(0x7f800000u /* inf */);
        bool _588 = isnan(_584);
        bool _590 = _586 || _588;
        bool _592 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _594 = _590 || _592;
        float _596 = abs(_428);
        bool _598 = _596 == as_type<float>(0x7f800000u /* inf */);
        float _600 = abs(_428);
        bool _602 = _600 == as_type<float>(0x7f800000u /* inf */);
        bool _604 = !_594;
        bool _606 = _602 && _604;
        if (_606)
        {
            bool _608 = as_type<int>(_428) >= 0;
            _544 = _608 ? (-1) : 0;
        }
        int _610 = _544;
        if (_606)
        {
            _580 = 1075235812;
        }
        int _612 = _580;
        int _614 = _612;
        if (_606)
        {
            int _616 = ~_610;
            int _618 = (_616 != 0) ? _612 : 1061752795;
            _614 = _618;
        }
        int _620 = _614;
        float _622 = as_type<float>(_620);
        if (_606)
        {
            int _624 = int(0x80000000) & as_type<int>(_424);
            int _626 = _620 | _624;
            _622 = as_type<float>(_626);
        }
        float _628 = _622;
        bool _630 = !_594;
        bool _632 = _630 && _598;
        _582 = _628;
        if (!_632)
        {
            float _634 = abs(_424);
            float _636 = abs(_428);
            float _638 = precise::max(_634, _636);
            float _640 = abs(_424);
            float _642 = abs(_428);
            float _644 = precise::min(_640, _642);
            float _646 = 1.0 / _638;
            float _648 = abs(_424);
            float _650 = abs(_428);
            bool _652 = _648 > _650;
            bool _654 = as_type<int>(_428) >= 0;
            float _656 = _644 * _646;
            float _658 = _656 * _656;
            float _660 = _658 + 11.33538818359375;
            float _662 = fma(_658, _660, 28.84246826171875);
            float _664 = fma(_658, _662, 19.6966705322265625);
            float _666 = fma(_658, -0.82336294651031494140625, -5.674867153167724609375);
            float _668 = fma(_658, _666, -6.565555095672607421875);
            float _670 = 1.0 / _664;
            float _672 = _658 * _668;
            float _674 = abs(_424);
            float _676 = abs(_428);
            float _678 = _674 + _676;
            int _680 = as_type<int>(_424) & int(0x80000000);
            float _682 = _656 * _672;
            bool _684 = _678 > as_type<float>(0x7f800000u /* inf */);
            bool _686 = isnan(_678);
            bool _688 = _684 || _686;
            bool _690 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _692 = _688 || _690;
            float _694 = fma(_682, _670, _656);
            float _696 = _694;
            _582 = _678;
            if (_652)
            {
                float _698 = -_694;
                float _700 = _698 + 1.57079637050628662109375;
                _696 = _700;
            }
            float _702 = _696;
            int _704 = as_type<int>(_702);
            if (!_654)
            {
                float _706 = -_702;
                float _708 = _706 + 3.1415927410125732421875;
                _704 = as_type<int>(_708);
            }
            int _710 = _704;
            if (!_692)
            {
                int _712 = _680 | _710;
                _582 = as_type<float>(_712);
            }
        }
    }
    float _714 = _582;
    float _716 = -_522;
    float _718 = _716 + 1.0;
    float _720 = in.m_53.y;
    float _722 = fma(_714, 4.0, _550);
    float _724 = -_550;
    float _726 = fma(_714, 4.0, _724);
    float _728 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[159].y, _554);
    float _730 = -_566;
    float _732 = _730 + 1.0;
    float _734 = _722 * 0.15915493667125701904296875;
    float _736 = _726 * 0.15915493667125701904296875;
    float _738 = fma(_528, _530, _728);
    float _740 = in.m_55.w;
    bool _742 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _744 = isnan(_346);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = _506 * _732;
    float _756 = fma(_426, _552, _738);
    bool _758 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _760 = isnan(_346);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = _734 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = -_752;
    float _776 = _774 + 1.0;
    float _778 = fma(_454, _754, _756);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _782 = _346 + _780;
    float _784 = in.m_47.x;
    float _786 = in.m_47.y;
    float _788 = in.m_47.z;
    float _790 = -_768;
    float _792 = _790 + 1.0;
    float _794 = _768 * _776;
    bool _796 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _798 = isnan(_346);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _736 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _566 * _792;
    float _814 = fma(_330, _782, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    bool _816 = _720 > 0.0;
    float _818 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _820 = fma(_494, _812, _778);
    bool _822 = _720 >= 0.0;
    bool _824 = isnan(_720);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    float _832 = in.m_49.w;
    float _834 = -_806;
    float _836 = _834 + 1.0;
    float _838 = fma(_464, _794, _820);
    float _840 = in.m_42.x;
    float _842 = in.m_42.y;
    float _844 = in.m_42.z;
    int _846 = _830 ? 0 : 1;
    float _848 = _752 * _836;
    float _850 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _852 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _854 = _772 + _810;
    float _856 = fma(_814, _848, _838);
    float _858 = -_740;
    float _860 = _858 + 1.0;
    int _862 = ~_846;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = fma(_854, 0.5, 1.0);
    float _870 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[166].y, _856);
    float _872 = precise::clamp(_870, 0.0, 1.0);
    int _874 = _866;
    float _876 = _794;
    float _878 = _752;
    if (!_816)
    {
        int _880 = ~_846;
        int _882 = _880 + 1;
        _874 = _882;
    }
    int _884 = _874;
    float _886 = _868 * _860;
    float _888 = fma(_404, _784, _850);
    float _890 = fma(_872, -2.0, 3.0);
    float _892 = float(_884);
    float _894 = _886 * 25.0;
    float _896 = _872 * _872;
    float _898 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _900 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _902 = fma(_894, _892, _720);
    float _904 = _890 * _896;
    float _906 = fma(_404, _786, _898);
    float _908 = fma(_404, _788, _900);
    float _910 = fma(_888, _832, _840);
    float _912 = _902 * _904;
    float _914 = fma(_906, _832, _842);
    float _916 = fma(_908, _832, _844);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _924 = _852 * _918;
    float _926 = _818 * _920;
    float _928 = _914 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].x, _922);
    float _932 = _926 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].x, _928);
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _938 = _926 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _940 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].x, _932);
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[4].z, _934);
    float _944 = _936 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _946 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].x, _938);
    float _948 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[10].z, _940);
    float _950 = _942 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _952 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[8].z, _946);
    float _954 = _944 + _948;
    float _956 = _950 + _952;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _960 = _954 + _958;
    float _962 = _926 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _956 + _964;
    float _968 = _960 * _960;
    float _970 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[9].x, _962);
    float _972 = fma(_966, _966, _968);
    float _974 = _914 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _976 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[9].z, _970);
    float _978 = sqrt(_972);
    float _980 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].x, _974);
    float _982 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[5].z, _980);
    float _984 = _982 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _986 = _984 + _976;
    bool _988 = _978 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = _924;
    float _992 = _956;
    float _994 = _986;
    float _996 = _954;
    if (!_988)
    {
        _990 = _956;
    }
    float _998 = _990;
    float _1000 = _998;
    if (!_988)
    {
        _992 = _954;
    }
    float _1002 = _992;
    float _1004 = _1002;
    if (!_988)
    {
        _876 = _986;
    }
    float _1006 = _876;
    bool _1008 = !_988;
    float _1010 = _1006;
    if (!_1008)
    {
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1016 = _978 + _1014;
        float _1018 = rsqrt(_972);
        float _1020 = _1016 * _1012;
        float _1022 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1024 = _1020 * 0.15915493667125701904296875;
        float _1026 = _1024 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        float _1034 = fma(_1028, _1022, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = _1018 * _1034;
        float _1038 = _1032 + (-1.0);
        float _1040 = fma(_966, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_960, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = fma(_986, _1032, _1044);
        _1010 = _1046;
        _1000 = _1040;
        _1004 = _1042;
    }
    float _1048 = _1010;
    float _1050 = _1000;
    float _1052 = _1004;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1060 = _1050 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1052 + _1062;
    float _1066 = _1056 * _1056;
    float _1068 = fma(_1060, _1060, _1066);
    float _1070 = fma(_1064, _1064, _1068);
    float _1072 = rsqrt(_1070);
    float _1074 = sqrt(_1070);
    float _1076 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1078 = _1060 * _1076;
    float _1080 = _1064 * _1076;
    float _1082 = _1078 * _1078;
    float _1084 = _1080 * _1080;
    float _1086 = _1082 + _1084;
    float _1088 = sqrt(_1086);
    bool _1090 = _1088 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1094 = _1088 + _1092;
    float _1096 = _1068;
    float _1098 = _1094;
    float _1100 = _1076;
    float _1102 = _1078;
    if (_1090)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1096 = _1104;
    }
    float _1106 = _1096;
    if (_1090)
    {
        float _1108 = rsqrt(_1086);
        _994 = _1108;
    }
    float _1110 = _994;
    float _1112 = _1110;
    if (_1090)
    {
        float _1114 = _1094 * _1106;
        _1098 = _1114;
    }
    float _1116 = _1098;
    if (_1090)
    {
        float _1118 = _1116 * 0.15915493667125701904296875;
        _996 = _1118;
    }
    float _1120 = _996;
    float _1122 = _1106;
    float _1124 = _1120;
    if (_1090)
    {
        float _1126 = _1120 * 6.283185482025146484375;
        float _1128 = sin(_1126);
        _1122 = _1128;
    }
    float _1130 = _1122;
    float _1132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1134 = precise::max(0.0, _1132);
    float _1136 = _914;
    float _1138 = _1134;
    if (_1090)
    {
        float _1140 = _1120 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1136 = _1142;
    }
    float _1144 = _1136;
    float _1146 = -_1076;
    float _1148 = -_1134;
    float _1150 = fma(_1056, _1146, _1148);
    if (_1090)
    {
        float _1152 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1138 = _1152;
    }
    float _1154 = _1138;
    float _1156 = _1154;
    if (!_1090)
    {
        _1124 = _1082;
    }
    float _1158 = _1124;
    float _1160 = _1130;
    float _1162 = _1158;
    if (_1090)
    {
        float _1164 = fma(_1130, _1154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _1166;
    if (_1090)
    {
        float _1170 = _1144 + (-1.0);
        _1156 = _1170;
    }
    float _1172 = _1156;
    float _1174 = _1172;
    if (_1090)
    {
        float _1176 = _1110 * _1166;
        _878 = _1176;
    }
    float _1178 = _878;
    if (!_1090)
    {
        _1112 = _1150;
    }
    float _1180 = _1112;
    float _1182 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1184 = _1180;
    if (_1090)
    {
        float _1186 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1186;
    }
    float _1188 = _1100;
    if (_1090)
    {
        float _1190 = _1078 * _1178;
        _1102 = _1190;
    }
    float _1192 = _1102;
    if (!_1090)
    {
        _1168 = _1080;
    }
    float _1194 = _1168;
    float _1196 = _1194;
    if (_1090)
    {
        float _1198 = _1080 * _1178;
        _1196 = _1198;
    }
    float _1200 = _1196;
    if (_1090)
    {
        float _1202 = fma(_1150, _1144, _1188);
        _1184 = _1202;
    }
    float _1204 = _1184;
    if (_1090)
    {
        float _1206 = _1192 * _1192;
        _1162 = _1206;
    }
    float _1208 = _1162;
    if (!_1090)
    {
        _1174 = _1084;
    }
    float _1210 = _1174;
    float _1212 = _1210;
    if (_1090)
    {
        float _1214 = _1200 * _1200;
        _1212 = _1214;
    }
    float _1216 = _1212;
    float _1218 = fma(_1204, _1204, _1208);
    float _1220 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1222 = _1218 + _1216;
    float _1224 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1228 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1226);
    float _1230 = precise::clamp(_1228, 0.0, 1.0);
    float _1232 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1220);
    float _1234 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1236 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1238 = rsqrt(_1222);
    float _1240 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1242 = -_1230;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1236);
    float _1248 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1232);
    float _1250 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1252 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1240);
    float _1254 = abs(_1244);
    float _1256 = log2(_1254);
    float _1258 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1234);
    float _1260 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1262 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1252);
    float _1264 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1266 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1258);
    float _1268 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1270 = _1238 * _1192;
    float _1272 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1274 = _1238 * _1204;
    float _1276 = _1238 * _1200;
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1280 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1268);
    float _1282 = -_1264;
    float _1284 = fma(_1282, _1182, 1.0);
    float _1286 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1288 = -_1278;
    float _1290 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1288);
    float _1292 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1280);
    float _1294 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1296 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1298 = -_1276;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1290);
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1292);
    float _1304 = log2(_1284);
    float _1306 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1308 = fma(_1300, -0.5, 0.5);
    float _1310 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1296);
    float _1312 = fma(_1300, 0.5, 0.5);
    float _1314 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1306);
    float _1316 = _1274 + 1.0;
    float _1318 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1310);
    float _1320 = exp2(_1294);
    float _1322 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1324 = fma(_1312, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1326 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1318);
    float _1328 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1322);
    float _1330 = fma(_1312, _1324, -0.212114393711090087890625);
    float _1332 = 1.0 / _1302;
    float _1334 = _1304 * 0.693147182464599609375;
    float _1336 = fma(_1312, _1330, 1.570728778839111328125);
    float _1338 = sqrt(_1308);
    float _1340 = -_1274;
    float _1342 = fma(_1320, _1316, _1340);
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1346 = fma(_1342, 0.5, 0.5);
    float _1348 = _1326 * _1332;
    float _1350 = _1328 * _1332;
    float _1352 = fma(_1348, 0.5, 0.5);
    float _1354 = fma(_1350, -0.5, 0.5);
    float _1356 = _1338 * 0.636619746685028076171875;
    float3 _3805 = float3(_1352, _1354, _1344);
    float _1358 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3805, float3(0.0), isnan(_3805)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3805, float3(0.0), isnan(_3805)), level(0.0)).x;
    float _1360 = -_1336;
    float _1362 = fma(_1356, _1360, 1.0);
    float3 _3821 = float3(_1352, _1354, _1344);
    float4 _1365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3821, float3(0.0), isnan(_3821)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3821, float3(0.0), isnan(_3821)), level(0.0)).xyzw;
    float _1367 = _1365.x;
    float _1369 = _1365.y;
    float _1371 = _1365.z;
    float _1373 = _1365.w;
    float2 _3838 = float2(_1362, _1346);
    float3 _1377 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3838, float2(0.0), isnan(_3838)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3838, float2(0.0), isnan(_3838)), level(0.0)).xyz;
    float _1379 = _1377.x;
    float _1381 = _1377.y;
    float _1383 = _1377.z;
    float _1385 = in.m_51.y;
    float _1387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1389 = in.m_57.y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1395 = _1393 != 0;
    float _1397 = in.m_51.z;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1401 = _1399 != 0;
    float _1403 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1407 = _1405 != 0;
    float _1409 = in.m_57.x;
    float _1411 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    float _1417 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1421 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1425 = _1423 != 0;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1429 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1431 = _1385 > 0.5;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1435 = -_1419;
    float _1437 = fma(_1403, 2.0, _1435);
    float _1439 = fma(_1429, -2.0, _1391);
    float _1441 = -_1389;
    float _1443 = _1441 + 1.0;
    float _1445 = _1403;
    float _1447 = _1389;
    float _1449 = _1433;
    bool _1451 = _1401;
    float _1453 = _1385;
    if (!_1395)
    {
        _1445 = _1385;
    }
    float _1455 = _1445;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1459 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1433);
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1463 = _1455;
    if (_1401)
    {
        float _1465 = _1431 ? _1443 : _1389;
        _1447 = _1465;
    }
    float _1467 = _1447;
    float _1469 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1427);
    if (_1395)
    {
        _1463 = _162;
    }
    float _1471 = _1463;
    float _1473 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1461);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_1407)
    {
        _1449 = _1409;
    }
    float _1477 = _1449;
    float _1479 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1457);
    float _1481 = _1477;
    if (_1407)
    {
        bool _1483 = _162 > 0.5;
        _1451 = _1483;
    }
    bool _1485 = _1451;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1489 = false;
    if (_1415)
    {
        bool _1491 = _1397 > 0.5;
        _1489 = _1491;
    }
    bool _1493 = _1489;
    float _1495 = fma(_1421, _1467, -0.5);
    if (!_1395)
    {
        _226 = _1397;
    }
    float _1497 = _226;
    float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1501 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1503 = as_type<int>(_1497);
    if (!_1407)
    {
        _1453 = _1477;
    }
    float _1505 = _1453;
    float _1507 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1439);
    float _1509 = _1505;
    if (_1407)
    {
        _1481 = _1409;
    }
    float _1511 = _1481;
    float _1513 = -_1487;
    float _1515 = fma(_1501, 2.0, _1513);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1519 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1521 = _1517;
    if (_1407)
    {
        float _1523 = -_1511;
        float _1525 = _1523 + 1.0;
        _1503 = as_type<int>(_1525);
    }
    int _1527 = _1503;
    int _1529 = 0;
    if (_1415)
    {
        float _1531 = -_1511;
        float _1533 = _1531 + 1.0;
        _1529 = as_type<int>(_1533);
    }
    int _1535 = _1529;
    int _1537 = 0;
    if (_1425)
    {
        float _1539 = -_1511;
        float _1541 = _1539 + 1.0;
        _1537 = as_type<int>(_1541);
    }
    int _1543 = _1537;
    float _1545 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1517);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_1407)
    {
        float _1549 = _1485 ? as_type<float>(_1527) : _1511;
        _1509 = _1549;
    }
    float _1551 = _1509;
    float _1553 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1555 = 0.0;
    if (!_1415)
    {
        _1555 = _1511;
    }
    float _1557 = _1555;
    float _1559 = _1499 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1561 = _1557;
    if (!_1425)
    {
        _1521 = _1511;
    }
    float _1563 = _1521;
    float _1565 = -_1547;
    float _1567 = fma(_1519, 2.0, _1565);
    float _1569 = _1563;
    if (_1415)
    {
        float _1571 = _1493 ? as_type<float>(_1535) : _1511;
        _1561 = _1571;
    }
    float _1573 = _1561;
    float _1575 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1479);
    if (_1425)
    {
        float _1577 = _1431 ? as_type<float>(_1543) : _1511;
        _1569 = _1577;
    }
    float _1579 = _1569;
    float _1581 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1473);
    float _1583 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1469);
    float _1585 = -_134;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1437);
    float _1589 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1459);
    float _1591 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1545);
    float _1593 = -_134;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1515);
    float _1597 = -_134;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1567);
    float _1601 = fma(_1553, _1573, -0.5);
    float _1603 = fma(_1559, _1579, -0.5);
    bool _1605 = _912 != 0.0;
    bool _1607 = isnan(_912);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan(0.0);
    bool _1613 = _1609 || _1611;
    float _1615 = in.m_59.x;
    float _1617 = in.m_59.y;
    float _1619 = in.m_59.z;
    float _1621 = _1581 * (-0.15915493667125701904296875);
    bool _1623 = _174 == 0.0;
    bool _1625 = !_1613;
    bool _1627 = _1623 && _1625;
    float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1633 = _164 == 0.0;
    bool _1635 = _1633 && _1627;
    float _1637 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1417);
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1641 = exp2(_1411);
    float _1643 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1651 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1653 = _1621 * 6.283185482025146484375;
    float _1655 = sin(_1653);
    float _1657 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_61.x = _1643;
    out.m_61.y = _1647;
    out.m_61.z = _1651;
    out.m_61.w = _1649;
    float _1659 = _1617;
    float _1661 = _1615;
    float _1663 = _1619;
    if (!_1635)
    {
        float _1665 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1617);
        _1659 = _1665;
    }
    float _1667 = _1659;
    if (!_1635)
    {
        float _1669 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1615);
        _1661 = _1669;
    }
    float _1671 = _1661;
    if (!_1635)
    {
        float _1673 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1619);
        _1663 = _1673;
    }
    float _1675 = _1663;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1679 = _1621 * 6.283185482025146484375;
    float _1681 = cos(_1679);
    float _1683 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = -_1641;
    float _1687 = _1685 + 1.0;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1693 = fma(_1671, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1695 = fma(_1657, _1551, -0.5);
    float _1697 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1637);
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1701 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1703 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1705 = _1655 * _1495;
    float _1707 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = fma(_1671, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1701);
    float _1711 = fma(_1671, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1703);
    float _1713 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1693);
    float _1715 = _1681 * _1495;
    float _1717 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1709);
    float _1719 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1711);
    float _1721 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1723 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1725 = -_1705;
    float _1727 = fma(_1681, _1695, _1725);
    float _1729 = fma(_1655, _1695, _1715);
    out.m_63.x = _1713;
    out.m_63.y = _1717;
    out.m_63.z = _1719;
    float _1731 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1697);
    float _1733 = fma(_1591, _1601, _1595);
    float _1735 = fma(_1589, _1603, _1599);
    out.m_65.w = _740;
    float _1737 = fma(_1583, _1727, _1587);
    float _1739 = -_1507;
    float _1741 = fma(_1575, _1729, _1739);
    float _1743 = _1326 + _1302;
    out.m_67.x = _1707;
    out.m_67.y = _1721;
    out.m_67.z = _1723;
    float _1745 = _1302 * 0.5;
    float _1747 = _1735 + 0.5;
    float _1749 = _1733 + 0.5;
    out.m_69.y = _1048;
    float _1751 = _1737 + 0.5;
    float _1753 = _1741 + 0.5;
    out.m_71.x = _1060;
    out.m_71.y = _1056;
    out.m_71.z = _1064;
    float _1755 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1757 = _1731 + _1302;
    float _1759 = _1743 * 0.5;
    float _1761 = fma(_1328, -0.5, _1745);
    out.m_73.x = _1751;
    out.m_73.y = _1753;
    out.m_73.z = _1749;
    float _1763 = _1757 * 0.5;
    out.m_75.x = _1747;
    out.gl_Position.x = _1326;
    out.gl_Position.y = _1328;
    out.gl_Position.z = _1731;
    out.gl_Position.w = _1302;
    out.m_77.x = _1759;
    out.m_77.y = _1761;
    out.m_77.z = _1763;
    out.m_77.w = _1302;
    out.m_45.x = _1755;
    float _1765 = _1699 * _1358;
    float _1767 = -_1699;
    float _1769 = _1767 + 1.0;
    float _1771 = _1373 * _1765;
    float _1773 = _1373 * _1769;
    float _1775 = _1383 * _1765;
    float _1777 = fma(_1379, _1771, _1367);
    float _1779 = fma(_1381, _1771, _1369);
    float _1781 = fma(_1373, _1775, _1371);
    out.m_79.x = _1777;
    out.m_79.y = _1779;
    out.m_79.z = _1781;
    out.m_79.w = _1773;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    float _110 = _108;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_102)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1839 = as_type<float>(_116);
        out.gl_Position.z = _1839;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_98);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
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
        _118 = as_type<int>(_148);
    }
    int _150 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_150);
        out.gl_Position.z = _1907;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_49.x;
    float _154 = in.m_49.y;
    float _156 = in.m_49.z;
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _162 = in.m_51.x;
    float _164 = in.m_53.z;
    float _166 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _168 = _166 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _172 = _170 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _174 = in.m_53.x;
    float _176 = 0.0;
    bool _178 = _158;
    if (_158)
    {
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _176 = _180;
    }
    float _182 = _176;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _186 = _184 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _190 = _188 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _192 = 1.0 / _168;
    bool _194 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _196 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _198 = _194 || _196;
    bool _200 = isnan(1.0);
    bool _202 = _198 || _200;
    float _204 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _206 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _212 = 1.0 / _172;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _218 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _220 = _154;
    float _222 = _216;
    float _224 = _204;
    float _226 = _162;
    if (_158)
    {
        float _228 = _162 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _220 = _228;
    }
    float _230 = _220;
    float _232 = abs(_164);
    float _234 = abs(_174);
    float _236 = precise::max(_232, _234);
    float _238 = 1.0 / _186;
    float _240 = _160 * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    bool _244 = _236 >= 16.0;
    float _246 = _230;
    float _248 = _242;
    if (_158)
    {
        float _250 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[14].x, _242);
        _246 = _250;
    }
    float _252 = _246;
    float _254 = 1.0 / _190;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _256;
    float _260 = 1.0 / _216;
    float _262 = _258 * _192;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _266 = _264 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _268 = 1.0 / _210;
    if (_158)
    {
        float _270 = _252 * _182;
        _222 = _270;
    }
    float _272 = _222;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _282;
    float _286 = _276 * _212;
    float _288 = _280 * _254;
    float _290 = 1.0 / _266;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _296 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _298 = _284 * _260;
    float _300 = _294 * _238;
    float _302 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _174);
    float _304 = _212;
    float _306 = _296;
    if (_158)
    {
        float _308 = floor(_272);
        _304 = _308;
    }
    float _310 = _304;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _316;
    float _320 = _204 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_202)
    {
        float _322 = _296 * _296;
        float _324 = _322 * 0.5;
        _224 = _324;
    }
    float _326 = _224;
    float _328 = _314 * _268;
    float _330 = _318 * _290;
    float _332 = _320 * _302;
    float _334 = _326;
    if (!_202)
    {
        float _336 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _336;
    }
    float _338 = _334;
    float _340 = _338;
    if (_158)
    {
        float _342 = -_310;
        float _344 = _272 + _342;
        _248 = _344;
    }
    float _346 = _248;
    bool _348 = !_202;
    if (!_348)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _360 = _296 * _352;
        float _362 = 1.0 / _356;
        float _364 = _358 * 0.693147182464599609375;
        float _366 = exp2(_360);
        float _368 = 1.0 / _364;
        float _370 = _366 + (-1.0);
        float _372 = -_370;
        float _374 = fma(_372, _368, _296);
        float _376 = _374 * _362;
        float _378 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _340 = _378;
    }
    float _380 = _340;
    bool _382 = !_202;
    if (!_382)
    {
        float _384 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _386 = log2(_384);
        float _388 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _390 = _388 + 1.0;
        float _392 = 1.0 / _390;
        float _394 = _296 * _386;
        float _396 = exp2(_394);
        float _398 = -_396;
        float _400 = _398 + 1.0;
        float _402 = _400 * _392;
        _306 = _402;
    }
    float _404 = _306;
    float _406 = _174 * 0.0625;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _410 = _346 + _408;
    float _412 = _164 * 0.0625;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _416 = _346 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _420 = _346 + _418;
    float _422 = fma(_262, _410, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _424 = _244 ? _406 : _174;
    float _426 = fma(_288, _416, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _428 = _244 ? _412 : _164;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _432 = _346 + _430;
    float _434 = abs(_424);
    bool _436 = _434 != 0.0;
    bool _438 = isnan(_434);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _448 = _346 + _446;
    float _450 = abs(_428);
    bool _452 = _450 == 0.0;
    float _454 = fma(_300, _432, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _456 = abs(_428);
    bool _458 = _456 == 0.0;
    bool _460 = !_444;
    bool _462 = _458 && _460;
    float _464 = fma(_328, _420, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _466 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _468 = isnan(_346);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _480 = _346 + _478;
    bool _482 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _484 = isnan(_346);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _490 = _486 || _488;
    int _492 = _490 ? 1065353216 : 0;
    float _494 = fma(_298, _448, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _496 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _498 = isnan(_346);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -_476;
    float _510 = _508 + 1.0;
    bool _512 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _514 = isnan(_346);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -as_type<float>(_492);
    float _526 = _524 + 1.0;
    float _528 = fma(_286, _480, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _530 = as_type<float>(_492) * _510;
    int _532 = _492;
    if (_462)
    {
        bool _534 = as_type<int>(_428) >= 0;
        _178 = _534;
    }
    bool _536 = _178;
    float _538 = -_506;
    float _540 = _538 + 1.0;
    float _542 = _522 * _526;
    int _544 = _536 ? (-1) : 0;
    if (_462)
    {
        int _546 = _536 ? 0 : 1078530011;
        _532 = _546;
    }
    int _548 = _532;
    float _550 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _552 = _476 * _540;
    float _554 = _422 * _542;
    bool _556 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _558 = isnan(_346);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    int _568 = _548;
    if (_462)
    {
        int _570 = int(0x80000000) & as_type<int>(_424);
        int _572 = _548 | _570;
        _568 = _572;
    }
    int _574 = _568;
    bool _576 = !_444;
    bool _578 = _576 && _452;
    int _580 = _574;
    float _582 = as_type<float>(_574);
    if (!_578)
    {
        float _584 = abs(_424);
        bool _586 = _584 != as_type<float>(0x7f800000u /* inf */);
        bool _588 = isnan(_584);
        bool _590 = _586 || _588;
        bool _592 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _594 = _590 || _592;
        float _596 = abs(_428);
        bool _598 = _596 == as_type<float>(0x7f800000u /* inf */);
        float _600 = abs(_428);
        bool _602 = _600 == as_type<float>(0x7f800000u /* inf */);
        bool _604 = !_594;
        bool _606 = _602 && _604;
        if (_606)
        {
            bool _608 = as_type<int>(_428) >= 0;
            _544 = _608 ? (-1) : 0;
        }
        int _610 = _544;
        if (_606)
        {
            _580 = 1075235812;
        }
        int _612 = _580;
        int _614 = _612;
        if (_606)
        {
            int _616 = ~_610;
            int _618 = (_616 != 0) ? _612 : 1061752795;
            _614 = _618;
        }
        int _620 = _614;
        float _622 = as_type<float>(_620);
        if (_606)
        {
            int _624 = int(0x80000000) & as_type<int>(_424);
            int _626 = _620 | _624;
            _622 = as_type<float>(_626);
        }
        float _628 = _622;
        bool _630 = !_594;
        bool _632 = _630 && _598;
        _582 = _628;
        if (!_632)
        {
            float _634 = abs(_424);
            float _636 = abs(_428);
            float _638 = precise::max(_634, _636);
            float _640 = abs(_424);
            float _642 = abs(_428);
            float _644 = precise::min(_640, _642);
            float _646 = 1.0 / _638;
            float _648 = abs(_424);
            float _650 = abs(_428);
            bool _652 = _648 > _650;
            bool _654 = as_type<int>(_428) >= 0;
            float _656 = _644 * _646;
            float _658 = _656 * _656;
            float _660 = _658 + 11.33538818359375;
            float _662 = fma(_658, _660, 28.84246826171875);
            float _664 = fma(_658, _662, 19.6966705322265625);
            float _666 = fma(_658, -0.82336294651031494140625, -5.674867153167724609375);
            float _668 = fma(_658, _666, -6.565555095672607421875);
            float _670 = 1.0 / _664;
            float _672 = _658 * _668;
            float _674 = abs(_424);
            float _676 = abs(_428);
            float _678 = _674 + _676;
            int _680 = as_type<int>(_424) & int(0x80000000);
            float _682 = _656 * _672;
            bool _684 = _678 > as_type<float>(0x7f800000u /* inf */);
            bool _686 = isnan(_678);
            bool _688 = _684 || _686;
            bool _690 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _692 = _688 || _690;
            float _694 = fma(_682, _670, _656);
            float _696 = _694;
            _582 = _678;
            if (_652)
            {
                float _698 = -_694;
                float _700 = _698 + 1.57079637050628662109375;
                _696 = _700;
            }
            float _702 = _696;
            int _704 = as_type<int>(_702);
            if (!_654)
            {
                float _706 = -_702;
                float _708 = _706 + 3.1415927410125732421875;
                _704 = as_type<int>(_708);
            }
            int _710 = _704;
            if (!_692)
            {
                int _712 = _680 | _710;
                _582 = as_type<float>(_712);
            }
        }
    }
    float _714 = _582;
    float _716 = -_522;
    float _718 = _716 + 1.0;
    float _720 = in.m_53.y;
    float _722 = fma(_714, 4.0, _550);
    float _724 = -_550;
    float _726 = fma(_714, 4.0, _724);
    float _728 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[159].y, _554);
    float _730 = -_566;
    float _732 = _730 + 1.0;
    float _734 = _722 * 0.15915493667125701904296875;
    float _736 = _726 * 0.15915493667125701904296875;
    float _738 = fma(_528, _530, _728);
    float _740 = in.m_55.w;
    bool _742 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _744 = isnan(_346);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = _506 * _732;
    float _756 = fma(_426, _552, _738);
    bool _758 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _760 = isnan(_346);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = _734 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = -_752;
    float _776 = _774 + 1.0;
    float _778 = fma(_454, _754, _756);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _782 = _346 + _780;
    float _784 = in.m_47.x;
    float _786 = in.m_47.y;
    float _788 = in.m_47.z;
    float _790 = -_768;
    float _792 = _790 + 1.0;
    float _794 = _768 * _776;
    bool _796 = _346 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _798 = isnan(_346);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _736 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _566 * _792;
    float _814 = fma(_330, _782, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    bool _816 = _720 > 0.0;
    float _818 = _218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _820 = fma(_494, _812, _778);
    bool _822 = _720 >= 0.0;
    bool _824 = isnan(_720);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    float _832 = in.m_49.w;
    float _834 = -_806;
    float _836 = _834 + 1.0;
    float _838 = fma(_464, _794, _820);
    float _840 = in.m_42.x;
    float _842 = in.m_42.y;
    float _844 = in.m_42.z;
    int _846 = _830 ? 0 : 1;
    float _848 = _752 * _836;
    float _850 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _852 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _854 = _772 + _810;
    float _856 = fma(_814, _848, _838);
    float _858 = -_740;
    float _860 = _858 + 1.0;
    int _862 = ~_846;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = fma(_854, 0.5, 1.0);
    float _870 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[166].y, _856);
    float _872 = precise::clamp(_870, 0.0, 1.0);
    int _874 = _866;
    float _876 = _794;
    float _878 = _752;
    if (!_816)
    {
        int _880 = ~_846;
        int _882 = _880 + 1;
        _874 = _882;
    }
    int _884 = _874;
    float _886 = _868 * _860;
    float _888 = fma(_404, _784, _850);
    float _890 = fma(_872, -2.0, 3.0);
    float _892 = float(_884);
    float _894 = _886 * 25.0;
    float _896 = _872 * _872;
    float _898 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _900 = _380 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _902 = fma(_894, _892, _720);
    float _904 = _890 * _896;
    float _906 = fma(_404, _786, _898);
    float _908 = fma(_404, _788, _900);
    float _910 = fma(_888, _832, _840);
    float _912 = _902 * _904;
    float _914 = fma(_906, _832, _842);
    float _916 = fma(_908, _832, _844);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _924 = _852 * _918;
    float _926 = _818 * _920;
    float _928 = _914 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[6].x, _922);
    float _932 = _926 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[4].x, _928);
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _938 = _926 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _940 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[10].x, _932);
    float _942 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[4].z, _934);
    float _944 = _936 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _946 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[8].x, _938);
    float _948 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[10].z, _940);
    float _950 = _942 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _952 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[8].z, _946);
    float _954 = _944 + _948;
    float _956 = _950 + _952;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _960 = _954 + _958;
    float _962 = _926 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _956 + _964;
    float _968 = _960 * _960;
    float _970 = fma(_332, (*spvDescriptorSet0.vp_c10)._m0[9].x, _962);
    float _972 = fma(_966, _966, _968);
    float _974 = _914 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _976 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[9].z, _970);
    float _978 = sqrt(_972);
    float _980 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[5].x, _974);
    float _982 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[5].z, _980);
    float _984 = _982 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _986 = _984 + _976;
    bool _988 = _978 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = _924;
    float _992 = _956;
    float _994 = _986;
    float _996 = _954;
    if (!_988)
    {
        _990 = _956;
    }
    float _998 = _990;
    float _1000 = _998;
    if (!_988)
    {
        _992 = _954;
    }
    float _1002 = _992;
    float _1004 = _1002;
    if (!_988)
    {
        _876 = _986;
    }
    float _1006 = _876;
    bool _1008 = !_988;
    float _1010 = _1006;
    if (!_1008)
    {
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1016 = _978 + _1014;
        float _1018 = rsqrt(_972);
        float _1020 = _1016 * _1012;
        float _1022 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1024 = _1020 * 0.15915493667125701904296875;
        float _1026 = _1024 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        float _1034 = fma(_1028, _1022, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = _1018 * _1034;
        float _1038 = _1032 + (-1.0);
        float _1040 = fma(_966, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_960, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = fma(_986, _1032, _1044);
        _1010 = _1046;
        _1000 = _1040;
        _1004 = _1042;
    }
    float _1048 = _1010;
    float _1050 = _1000;
    float _1052 = _1004;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1060 = _1050 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1052 + _1062;
    float _1066 = _1056 * _1056;
    float _1068 = fma(_1060, _1060, _1066);
    float _1070 = fma(_1064, _1064, _1068);
    float _1072 = rsqrt(_1070);
    float _1074 = sqrt(_1070);
    float _1076 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1078 = _1060 * _1076;
    float _1080 = _1064 * _1076;
    float _1082 = _1078 * _1078;
    float _1084 = _1080 * _1080;
    float _1086 = _1082 + _1084;
    float _1088 = sqrt(_1086);
    bool _1090 = _1088 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1094 = _1088 + _1092;
    float _1096 = _1068;
    float _1098 = _1094;
    float _1100 = _1076;
    float _1102 = _1078;
    if (_1090)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1096 = _1104;
    }
    float _1106 = _1096;
    if (_1090)
    {
        float _1108 = rsqrt(_1086);
        _994 = _1108;
    }
    float _1110 = _994;
    float _1112 = _1110;
    if (_1090)
    {
        float _1114 = _1094 * _1106;
        _1098 = _1114;
    }
    float _1116 = _1098;
    if (_1090)
    {
        float _1118 = _1116 * 0.15915493667125701904296875;
        _996 = _1118;
    }
    float _1120 = _996;
    float _1122 = _1106;
    float _1124 = _1120;
    if (_1090)
    {
        float _1126 = _1120 * 6.283185482025146484375;
        float _1128 = sin(_1126);
        _1122 = _1128;
    }
    float _1130 = _1122;
    float _1132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1134 = precise::max(0.0, _1132);
    float _1136 = _914;
    float _1138 = _1134;
    if (_1090)
    {
        float _1140 = _1120 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1136 = _1142;
    }
    float _1144 = _1136;
    float _1146 = -_1076;
    float _1148 = -_1134;
    float _1150 = fma(_1056, _1146, _1148);
    if (_1090)
    {
        float _1152 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1138 = _1152;
    }
    float _1154 = _1138;
    float _1156 = _1154;
    if (!_1090)
    {
        _1124 = _1082;
    }
    float _1158 = _1124;
    float _1160 = _1130;
    float _1162 = _1158;
    if (_1090)
    {
        float _1164 = fma(_1130, _1154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _1166;
    if (_1090)
    {
        float _1170 = _1144 + (-1.0);
        _1156 = _1170;
    }
    float _1172 = _1156;
    float _1174 = _1172;
    if (_1090)
    {
        float _1176 = _1110 * _1166;
        _878 = _1176;
    }
    float _1178 = _878;
    if (!_1090)
    {
        _1112 = _1150;
    }
    float _1180 = _1112;
    float _1182 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1184 = _1180;
    if (_1090)
    {
        float _1186 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1186;
    }
    float _1188 = _1100;
    if (_1090)
    {
        float _1190 = _1078 * _1178;
        _1102 = _1190;
    }
    float _1192 = _1102;
    if (!_1090)
    {
        _1168 = _1080;
    }
    float _1194 = _1168;
    float _1196 = _1194;
    if (_1090)
    {
        float _1198 = _1080 * _1178;
        _1196 = _1198;
    }
    float _1200 = _1196;
    if (_1090)
    {
        float _1202 = fma(_1150, _1144, _1188);
        _1184 = _1202;
    }
    float _1204 = _1184;
    if (_1090)
    {
        float _1206 = _1192 * _1192;
        _1162 = _1206;
    }
    float _1208 = _1162;
    if (!_1090)
    {
        _1174 = _1084;
    }
    float _1210 = _1174;
    float _1212 = _1210;
    if (_1090)
    {
        float _1214 = _1200 * _1200;
        _1212 = _1214;
    }
    float _1216 = _1212;
    float _1218 = fma(_1204, _1204, _1208);
    float _1220 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1222 = _1218 + _1216;
    float _1224 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1228 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1226);
    float _1230 = precise::clamp(_1228, 0.0, 1.0);
    float _1232 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1220);
    float _1234 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1236 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1238 = rsqrt(_1222);
    float _1240 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1242 = -_1230;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1236);
    float _1248 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1232);
    float _1250 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1252 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1240);
    float _1254 = abs(_1244);
    float _1256 = log2(_1254);
    float _1258 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1234);
    float _1260 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1262 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1252);
    float _1264 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1266 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1258);
    float _1268 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1270 = _1238 * _1192;
    float _1272 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1274 = _1238 * _1204;
    float _1276 = _1238 * _1200;
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1280 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1268);
    float _1282 = -_1264;
    float _1284 = fma(_1282, _1182, 1.0);
    float _1286 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1288 = -_1278;
    float _1290 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1288);
    float _1292 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1280);
    float _1294 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1296 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1298 = -_1276;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1290);
    float _1302 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1292);
    float _1304 = log2(_1284);
    float _1306 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1308 = fma(_1300, -0.5, 0.5);
    float _1310 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1296);
    float _1312 = fma(_1300, 0.5, 0.5);
    float _1314 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1306);
    float _1316 = _1274 + 1.0;
    float _1318 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1310);
    float _1320 = exp2(_1294);
    float _1322 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1324 = fma(_1312, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1326 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1318);
    float _1328 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1322);
    float _1330 = fma(_1312, _1324, -0.212114393711090087890625);
    float _1332 = 1.0 / _1302;
    float _1334 = _1304 * 0.693147182464599609375;
    float _1336 = fma(_1312, _1330, 1.570728778839111328125);
    float _1338 = sqrt(_1308);
    float _1340 = -_1274;
    float _1342 = fma(_1320, _1316, _1340);
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1346 = fma(_1342, 0.5, 0.5);
    float _1348 = _1326 * _1332;
    float _1350 = _1328 * _1332;
    float _1352 = fma(_1348, 0.5, 0.5);
    float _1354 = fma(_1350, -0.5, 0.5);
    float _1356 = _1338 * 0.636619746685028076171875;
    float3 _3805 = float3(_1352, _1354, _1344);
    float _1358 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3805, float3(0.0), isnan(_3805)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3805, float3(0.0), isnan(_3805)), level(0.0)).x;
    float _1360 = -_1336;
    float _1362 = fma(_1356, _1360, 1.0);
    float3 _3821 = float3(_1352, _1354, _1344);
    float4 _1365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3821, float3(0.0), isnan(_3821)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3821, float3(0.0), isnan(_3821)), level(0.0)).xyzw;
    float _1367 = _1365.x;
    float _1369 = _1365.y;
    float _1371 = _1365.z;
    float _1373 = _1365.w;
    float2 _3838 = float2(_1362, _1346);
    float3 _1377 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3838, float2(0.0), isnan(_3838)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3838, float2(0.0), isnan(_3838)), level(0.0)).xyz;
    float _1379 = _1377.x;
    float _1381 = _1377.y;
    float _1383 = _1377.z;
    float _1385 = in.m_51.y;
    float _1387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1389 = in.m_57.y;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1395 = _1393 != 0;
    float _1397 = in.m_51.z;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1401 = _1399 != 0;
    float _1403 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1407 = _1405 != 0;
    float _1409 = in.m_57.x;
    float _1411 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    float _1417 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1421 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1425 = _1423 != 0;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1429 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1431 = _1385 > 0.5;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1435 = -_1419;
    float _1437 = fma(_1403, 2.0, _1435);
    float _1439 = fma(_1429, -2.0, _1391);
    float _1441 = -_1389;
    float _1443 = _1441 + 1.0;
    float _1445 = _1403;
    float _1447 = _1389;
    float _1449 = _1433;
    bool _1451 = _1401;
    float _1453 = _1385;
    if (!_1395)
    {
        _1445 = _1385;
    }
    float _1455 = _1445;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1459 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1433);
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1463 = _1455;
    if (_1401)
    {
        float _1465 = _1431 ? _1443 : _1389;
        _1447 = _1465;
    }
    float _1467 = _1447;
    float _1469 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1427);
    if (_1395)
    {
        _1463 = _162;
    }
    float _1471 = _1463;
    float _1473 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1461);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_1407)
    {
        _1449 = _1409;
    }
    float _1477 = _1449;
    float _1479 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1457);
    float _1481 = _1477;
    if (_1407)
    {
        bool _1483 = _162 > 0.5;
        _1451 = _1483;
    }
    bool _1485 = _1451;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1489 = false;
    if (_1415)
    {
        bool _1491 = _1397 > 0.5;
        _1489 = _1491;
    }
    bool _1493 = _1489;
    float _1495 = fma(_1421, _1467, -0.5);
    if (!_1395)
    {
        _226 = _1397;
    }
    float _1497 = _226;
    float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1501 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1503 = as_type<int>(_1497);
    if (!_1407)
    {
        _1453 = _1477;
    }
    float _1505 = _1453;
    float _1507 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1439);
    float _1509 = _1505;
    if (_1407)
    {
        _1481 = _1409;
    }
    float _1511 = _1481;
    float _1513 = -_1487;
    float _1515 = fma(_1501, 2.0, _1513);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1519 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1521 = _1517;
    if (_1407)
    {
        float _1523 = -_1511;
        float _1525 = _1523 + 1.0;
        _1503 = as_type<int>(_1525);
    }
    int _1527 = _1503;
    int _1529 = 0;
    if (_1415)
    {
        float _1531 = -_1511;
        float _1533 = _1531 + 1.0;
        _1529 = as_type<int>(_1533);
    }
    int _1535 = _1529;
    int _1537 = 0;
    if (_1425)
    {
        float _1539 = -_1511;
        float _1541 = _1539 + 1.0;
        _1537 = as_type<int>(_1541);
    }
    int _1543 = _1537;
    float _1545 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1517);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_1407)
    {
        float _1549 = _1485 ? as_type<float>(_1527) : _1511;
        _1509 = _1549;
    }
    float _1551 = _1509;
    float _1553 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1555 = 0.0;
    if (!_1415)
    {
        _1555 = _1511;
    }
    float _1557 = _1555;
    float _1559 = _1499 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1561 = _1557;
    if (!_1425)
    {
        _1521 = _1511;
    }
    float _1563 = _1521;
    float _1565 = -_1547;
    float _1567 = fma(_1519, 2.0, _1565);
    float _1569 = _1563;
    if (_1415)
    {
        float _1571 = _1493 ? as_type<float>(_1535) : _1511;
        _1561 = _1571;
    }
    float _1573 = _1561;
    float _1575 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1479);
    if (_1425)
    {
        float _1577 = _1431 ? as_type<float>(_1543) : _1511;
        _1569 = _1577;
    }
    float _1579 = _1569;
    float _1581 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1473);
    float _1583 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1469);
    float _1585 = -_134;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1437);
    float _1589 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1459);
    float _1591 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1545);
    float _1593 = -_134;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1515);
    float _1597 = -_134;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1567);
    float _1601 = fma(_1553, _1573, -0.5);
    float _1603 = fma(_1559, _1579, -0.5);
    bool _1605 = _912 != 0.0;
    bool _1607 = isnan(_912);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan(0.0);
    bool _1613 = _1609 || _1611;
    float _1615 = in.m_59.x;
    float _1617 = in.m_59.y;
    float _1619 = in.m_59.z;
    float _1621 = _1581 * (-0.15915493667125701904296875);
    bool _1623 = _174 == 0.0;
    bool _1625 = !_1613;
    bool _1627 = _1623 && _1625;
    float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1633 = _164 == 0.0;
    bool _1635 = _1633 && _1627;
    float _1637 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1417);
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1641 = exp2(_1411);
    float _1643 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1651 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1653 = _1621 * 6.283185482025146484375;
    float _1655 = sin(_1653);
    float _1657 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_61.x = _1643;
    out.m_61.y = _1647;
    out.m_61.z = _1651;
    out.m_61.w = _1649;
    float _1659 = _1617;
    float _1661 = _1615;
    float _1663 = _1619;
    if (!_1635)
    {
        float _1665 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1617);
        _1659 = _1665;
    }
    float _1667 = _1659;
    if (!_1635)
    {
        float _1669 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1615);
        _1661 = _1669;
    }
    float _1671 = _1661;
    if (!_1635)
    {
        float _1673 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1619);
        _1663 = _1673;
    }
    float _1675 = _1663;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1679 = _1621 * 6.283185482025146484375;
    float _1681 = cos(_1679);
    float _1683 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = -_1641;
    float _1687 = _1685 + 1.0;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1693 = fma(_1671, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1695 = fma(_1657, _1551, -0.5);
    float _1697 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1637);
    float _1699 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1701 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1703 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1705 = _1655 * _1495;
    float _1707 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = fma(_1671, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1701);
    float _1711 = fma(_1671, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1703);
    float _1713 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1693);
    float _1715 = _1681 * _1495;
    float _1717 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1709);
    float _1719 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1711);
    float _1721 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1723 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1725 = -_1705;
    float _1727 = fma(_1681, _1695, _1725);
    float _1729 = fma(_1655, _1695, _1715);
    out.m_63.x = _1713;
    out.m_63.y = _1717;
    out.m_63.z = _1719;
    float _1731 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1697);
    float _1733 = fma(_1591, _1601, _1595);
    float _1735 = fma(_1589, _1603, _1599);
    out.m_65.w = _740;
    float _1737 = fma(_1583, _1727, _1587);
    float _1739 = -_1507;
    float _1741 = fma(_1575, _1729, _1739);
    float _1743 = _1326 + _1302;
    out.m_67.x = _1707;
    out.m_67.y = _1721;
    out.m_67.z = _1723;
    float _1745 = _1302 * 0.5;
    float _1747 = _1735 + 0.5;
    float _1749 = _1733 + 0.5;
    out.m_69.y = _1048;
    float _1751 = _1737 + 0.5;
    float _1753 = _1741 + 0.5;
    out.m_71.x = _1060;
    out.m_71.y = _1056;
    out.m_71.z = _1064;
    float _1755 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1757 = _1731 + _1302;
    float _1759 = _1743 * 0.5;
    float _1761 = fma(_1328, -0.5, _1745);
    out.m_73.x = _1751;
    out.m_73.y = _1753;
    out.m_73.z = _1749;
    float _1763 = _1757 * 0.5;
    out.m_75.x = _1747;
    out.gl_Position.x = _1326;
    out.gl_Position.y = _1328;
    out.gl_Position.z = _1731;
    out.gl_Position.w = _1302;
    out.m_77.x = _1759;
    out.m_77.y = _1761;
    out.m_77.z = _1763;
    out.m_77.w = _1302;
    out.m_45.x = _1755;
    float _1765 = _1699 * _1358;
    float _1767 = -_1699;
    float _1769 = _1767 + 1.0;
    float _1771 = _1373 * _1765;
    float _1773 = _1373 * _1769;
    float _1775 = _1383 * _1765;
    float _1777 = fma(_1379, _1771, _1367);
    float _1779 = fma(_1381, _1771, _1369);
    float _1781 = fma(_1373, _1775, _1371);
    out.m_79.x = _1777;
    out.m_79.y = _1779;
    out.m_79.z = _1781;
    out.m_79.w = _1773;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

