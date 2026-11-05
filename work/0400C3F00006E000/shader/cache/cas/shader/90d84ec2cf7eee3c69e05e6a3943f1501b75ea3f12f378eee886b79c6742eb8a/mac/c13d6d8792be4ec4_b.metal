#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
};

struct main0_out
{
    float4 m_49 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_34 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_45 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_41 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1044 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_32.w;
    float _81 = in.m_34.w;
    float _83 = trunc(_79);
    int _86 = int(_83);
    float _88 = -_81;
    float _90 = _88 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _90;
    bool _94 = _86 >= 1;
    float _96 = 0.0;
    int _98 = as_type<int>(_81);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_39.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1310 = as_type<float>(_106);
        out.gl_Position.z = _1310;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _110 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_81);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = float(_86);
    bool _122 = _90 >= _120;
    bool _124 = !_118;
    bool _126 = _122 || _124;
    float _128 = _120;
    bool _130 = _126;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (_126)
    {
        out.m_39.x = 0.0;
    }
    if (_126)
    {
        float _134 = _132 * 5.0;
        _108 = as_type<int>(_134);
    }
    int _136 = _108;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1367 = as_type<float>(_136);
        out.gl_Position.z = _1367;
    }
    if (_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_41.x;
    float _140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _142 = in.m_43.x;
    int _144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _146 = _144 != 0;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _150 = _148 != 0;
    float _152 = in.m_41.y;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _156 = in.m_43.y;
    float _158 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _162 = _160 != 0;
    float _164 = in.m_43.w;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _168 = _166 != 0;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _172 = in.m_43.z;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _176 = _138;
    if (_146)
    {
        float _178 = -_138;
        float _180 = _178 + 1.0;
        _98 = as_type<int>(_180);
    }
    int _182 = _98;
    float _184 = 0.0;
    if (!_146)
    {
        _184 = _138;
    }
    float _186 = _184;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _192 = _186;
    float _194 = _142;
    if (_146)
    {
        bool _196 = _142 > 0.5;
        _130 = _196;
    }
    bool _198 = _130;
    float _200 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].z, _188);
    float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _204 = -_152;
    float _206 = _204 + 1.0;
    float _208 = _152;
    float _210 = _206;
    if (_146)
    {
        float _212 = _198 ? as_type<float>(_182) : _138;
        _192 = _212;
    }
    float _214 = _192;
    int _216 = 0;
    if (_162)
    {
        float _218 = -_138;
        float _220 = _218 + 1.0;
        _216 = as_type<int>(_220);
    }
    int _222 = _216;
    float _224 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _226 = _156 > 0.5;
    float _228 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].w, _170);
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _232 = _230 != 0;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _236 = _164 > 0.5;
    float _238 = _174 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _240 = _226 ? as_type<int>(_206) : as_type<int>(_152);
    int _242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _244 = _242 != 0;
    float _246 = _232 ? as_type<float>(_240) : _152;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _250 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _254 = _252 != 0;
    float _256 = fma(_224, -2.0, _248);
    float _258 = _248;
    bool _260 = _236;
    if (!_150)
    {
        _258 = _156;
    }
    float _262 = _258;
    float _264 = -_158;
    float _266 = fma(_250, 2.0, _264);
    float _268 = _262;
    if (_150)
    {
        _268 = _142;
    }
    float _270 = _268;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _274 = _140 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _276 = 0.0;
    float _278 = _270;
    if (!_150)
    {
        _276 = _172;
    }
    float _280 = _276;
    float _282 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[76].y, _256);
    int _284 = _236 ? as_type<int>(_206) : as_type<int>(_152);
    float _286 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[83].z, _272);
    float _288 = 0.0;
    float _290 = _280;
    if (!_150)
    {
        _288 = _280;
    }
    float _292 = _288;
    float _294 = fma(_274, _246, -0.5);
    float _296 = _292;
    if (_244)
    {
        bool _298 = _172 > 0.5;
        _260 = _298;
    }
    bool _300 = _260;
    float _302 = _154 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_150)
    {
        _290 = _172;
    }
    float _304 = _290;
    float _306 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].w, _228);
    if (!_150)
    {
        _278 = _156;
    }
    float _308 = _278;
    int _310 = 0;
    float _312 = _308;
    if (_244)
    {
        float _314 = -_138;
        float _316 = _314 + 1.0;
        _310 = as_type<int>(_316);
    }
    int _318 = _310;
    float _320 = _168 ? as_type<float>(_284) : _152;
    float _322 = -_282;
    float _324 = fma(_306, _294, _322);
    if (_150)
    {
        _312 = _142;
    }
    float _326 = _312;
    float _328 = fma(_320, _302, -0.5);
    float _330 = 0.0;
    if (!_150)
    {
        _330 = _292;
    }
    float _332 = _330;
    float _334 = _326 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _336 = _332;
    if (_150)
    {
        _336 = _156;
    }
    float _338 = _336;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _342 = _338;
    if (_150)
    {
        _296 = _156;
    }
    float _344 = _296;
    float _346 = in.m_34.x;
    float _348 = in.m_34.y;
    float _350 = in.m_34.z;
    float _352 = _344;
    if (_150)
    {
        _194 = _304;
    }
    float _354 = _194;
    float _356 = -_340;
    float _358 = fma(_334, 2.0, _356);
    bool _360 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _364 = _360 || _362;
    bool _366 = isnan(1.0);
    bool _368 = _364 || _366;
    float _370 = in.m_45.w;
    bool _372 = _304 > 0.5;
    float _374 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[84].z, _190);
    float _376 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _378 = in.m_32.x;
    float _380 = in.m_32.y;
    float _382 = in.m_32.z;
    float _384 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[83].w, _234);
    if (_254)
    {
        float _386 = _372 ? _206 : _152;
        _208 = _386;
    }
    float _388 = _208;
    float _390 = _338 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _392 = 0.0;
    if (!_244)
    {
        _392 = _138;
    }
    float _394 = _392;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _398 = _394;
    if (_244)
    {
        float _400 = _300 ? as_type<float>(_318) : _138;
        _398 = _400;
    }
    float _402 = _398;
    if (!_368)
    {
        float _404 = _376 * _376;
        float _406 = _404 * 0.5;
        _210 = _406;
    }
    float _408 = _210;
    if (_162)
    {
        float _410 = _226 ? as_type<float>(_222) : _138;
        _176 = _410;
    }
    float _412 = _176;
    if (!_368)
    {
        _352 = _376;
    }
    float _414 = _352;
    float _416 = _414;
    if (!_368)
    {
        float _418 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _418;
    }
    float _420 = _342;
    bool _422 = !_368;
    float _424 = _420;
    if (!_422)
    {
        float _426 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _428 = log2(_426);
        float _430 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _432 = _430 + 1.0;
        float _434 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _436 = _376 * _428;
        float _438 = 1.0 / _432;
        float _440 = _434 * 0.693147182464599609375;
        float _442 = exp2(_436);
        float _444 = 1.0 / _440;
        float _446 = _442 + (-1.0);
        float _448 = -_446;
        float _450 = fma(_448, _444, _376);
        float _452 = _450 * _438;
        float _454 = _452 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _424 = _454;
    }
    float _456 = _424;
    bool _458 = !_368;
    if (!_458)
    {
        float _460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _462 = log2(_460);
        float _464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _466 = _464 + 1.0;
        float _468 = 1.0 / _466;
        float _470 = _376 * _462;
        float _472 = exp2(_470);
        float _474 = -_472;
        float _476 = _474 + 1.0;
        float _478 = _476 * _468;
        _416 = _478;
    }
    float _480 = _416;
    float _482 = fma(_238, _214, -0.5);
    float _484 = _456 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _486 = _456 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _488 = _456 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _490 = _202 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _492 = fma(_480, _348, _484);
    float _494 = fma(_480, _346, _486);
    float _496 = fma(_480, _350, _488);
    float _498 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[84].x, _374);
    float _500 = fma(_492, _370, _380);
    float _502 = fma(_494, _370, _378);
    float _504 = fma(_496, _370, _382);
    float _506 = fma(_490, _402, -0.5);
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _510 = _500 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _512 = _500 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _514 = _498 * (-0.15915493667125701904296875);
    float _516 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _508);
    float _518 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    float _520 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _512);
    float _522 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].z, _200);
    float _524 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[5].z, _516);
    float _526 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[4].z, _518);
    float _528 = -_90;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _266);
    float _532 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[6].z, _520);
    float _534 = _524 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _536 = _526 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _538 = _514 * 6.283185482025146484375;
    float _540 = sin(_538);
    float _542 = fma(_522, _482, _530);
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _534 + _544;
    float _548 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _550 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _552 = _536 + _550;
    float _554 = fma(_390, -2.0, _396);
    float _556 = _546 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _558 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _560 = _548 + _558;
    float _562 = _514 * 6.283185482025146484375;
    float _564 = cos(_562);
    float _566 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].z, _286);
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[28].x, _556);
    float _570 = -_90;
    float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[81].x, _358);
    float _574 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[81].y, _554);
    float _576 = _412 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c8)._m0[28].z, _568);
    float _580 = _546 * _546;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _584 = _540 * _328;
    float _586 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].w, _384);
    bool _588 = _578 >= 0.0;
    float _590 = fma(_552, _552, _580);
    float _592 = _388 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _596 = _564 * _328;
    float _598 = -_584;
    float _600 = fma(_564, _506, _598);
    float _602 = fma(_560, _560, _590);
    float _604 = _542 + 0.5;
    float _606 = fma(_540, _506, _596);
    float _608 = fma(_566, _600, _572);
    float _610 = rsqrt(_602);
    float _612 = _506;
    int _614 = as_type<int>(_490);
    if (_588)
    {
        _612 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _616 = _612;
    float _618 = -_574;
    float _620 = fma(_586, _606, _618);
    float _622 = _576 * _582;
    float _624 = _324 + 0.5;
    float _626 = _608 + 0.5;
    float _628 = _620 + 0.5;
    if (_588)
    {
        float _630 = _616 * 5.0;
        _614 = as_type<int>(_630);
    }
    int _632 = _614;
    float _634 = _592 * _594;
    int _636 = _632;
    if (_588)
    {
        out.m_39.x = 0.0;
    }
    out.m_47.x = _622;
    out.m_47.y = _634;
    float _638 = _546 * _610;
    out.m_49.x = _604;
    out.m_49.y = _624;
    out.m_49.z = _626;
    out.m_49.w = _628;
    float _640 = _552 * _610;
    if (_588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2244 = as_type<float>(_632);
        out.gl_Position.z = _2244;
    }
    if (_588)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _642 = -_638;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _534);
    float _646 = _560 * _610;
    float _648 = -_640;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[18].w, _536);
    float _652 = -_638;
    float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    float _656 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _658 = _644 + _656;
    float _660 = -_646;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _548);
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _666 = _650 + _664;
    float _668 = -_640;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _552);
    float _672 = _658 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _676 = _662 + _674;
    float _678 = _654 * _654;
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[28].x, _672);
    float _682 = -_646;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _560);
    float _686 = fma(_670, _670, _678);
    float _688 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[28].z, _680);
    float _690 = fma(_684, _684, _686);
    bool _692 = _688 >= 0.0;
    float _694 = _672;
    float _696 = _646;
    if (_692)
    {
        _694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _698 = _694;
    if (_692)
    {
        out.m_39.x = 0.0;
    }
    if (_692)
    {
        float _700 = _698 * 5.0;
        _636 = as_type<int>(_700);
    }
    int _702 = _636;
    if (_692)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2366 = as_type<float>(_702);
        out.gl_Position.z = _2366;
    }
    if (_692)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _704 = in.m_45.x;
    float _706 = in.m_45.y;
    float _708 = in.m_45.z;
    float _710 = sqrt(_690);
    float _712 = in.m_51.x;
    float _714 = in.m_51.y;
    float _716 = in.m_51.z;
    float _718 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _720 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _718;
    float _722 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _724 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _722;
    float _726 = _720 * _720;
    float _728 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _730 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _728;
    float _732 = fma(_724, _724, _726);
    float _734 = fma(_730, _730, _732);
    float _736 = _610 * _710;
    float _738 = _706 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _740 = sqrt(_734);
    float _742 = _704 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _744 = _708 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _746 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _714);
    float _750 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _712);
    float _754 = _736 * _746;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _716);
    float _758 = _736 * _750;
    float _760 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _762 = _748 * _754;
    float _764 = _752 * _758;
    float _766 = _736 * _760;
    float _768 = _762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _770 = _762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _772 = fma(_740, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _774 = _756 * _766;
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _768);
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _770);
    float _780 = _762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _782 = precise::max(_772, 1.0);
    float _784 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].z, _776);
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].z, _778);
    float _788 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _780);
    float _790 = precise::min(_782, 1.89999997615814208984375);
    float _792 = _784 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _794 = _786 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _796 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].z, _788);
    float _798 = in.m_53.x;
    float _800 = in.m_53.y;
    float _802 = in.m_53.z;
    float _804 = fma(_792, _790, _536);
    float _806 = fma(_794, _790, _548);
    float _808 = _796 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _810 = in.m_55.x;
    float _812 = in.m_55.y;
    float _814 = in.m_55.z;
    float _816 = in.m_55.w;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _820 = _804 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _824 = _806 + _822;
    float _826 = fma(_808, _790, _534);
    float _828 = _820 * _820;
    float _830 = _824 * _824;
    float _832 = _828 + _830;
    float _834 = sqrt(_832);
    float _836 = _798 * _814;
    float _838 = _802 * _812;
    float _840 = _800 * _810;
    float _842 = -_836;
    float _844 = fma(_802, _810, _842);
    float _846 = -_838;
    float _848 = fma(_814, _800, _846);
    bool _850 = _834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _812 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _854 = _812 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _856 = _812 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _858 = -_840;
    float _860 = fma(_812, _798, _858);
    float _862 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _852);
    float _864 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _854);
    float _866 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _856);
    float _868 = _798;
    float _870 = _810;
    float _872 = _854;
    float _874 = _840;
    float _876 = _774;
    if (!_850)
    {
        _868 = _830;
    }
    float _878 = _868;
    float _880 = _878;
    if (!_850)
    {
        _870 = _828;
    }
    float _882 = _870;
    float _884 = _882;
    if (!_850)
    {
        _872 = _804;
    }
    float _886 = _872;
    float _888 = _886;
    if (!_850)
    {
        _874 = _806;
    }
    float _890 = _874;
    float _892 = _890;
    if (!_850)
    {
        _876 = _826;
    }
    float _894 = _876;
    bool _896 = !_850;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _834 + _902;
        float _906 = rsqrt(_832);
        float _908 = _904 * _900;
        float _910 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = _908 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = cos(_918);
        float _922 = fma(_916, _910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _924 = _906 * _922;
        float _926 = _920 + (-1.0);
        float _928 = fma(_820, _924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_824, _924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _932 = _926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _936 = _928 + _934;
        float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _940 = _930 + _938;
        float _942 = fma(_826, _920, _932);
        float _944 = _936 * _936;
        float _946 = _940 * _940;
        _898 = _942;
        _884 = _944;
        _880 = _946;
        _888 = _928;
        _892 = _930;
    }
    float _948 = _898;
    float _950 = _884;
    float _952 = _880;
    float _954 = _888;
    float _956 = _892;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _960 = _948 + _958;
    float _962 = _844 * _816;
    float _964 = _848 * _816;
    float _966 = _860 * _816;
    float _968 = fma(_960, _960, _950);
    float _970 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _972 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _976 = _968 + _952;
    float _978 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _970);
    float _980 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _972);
    float _982 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _974);
    float _984 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].z, _862);
    float _986 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].z, _864);
    float _988 = sqrt(_976);
    float _990 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].z, _866);
    float _992 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _994 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _980);
    float _996 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _982);
    out.m_57.x = _640;
    out.m_57.y = _638;
    out.m_57.z = _646;
    out.m_59.x = _984;
    out.m_59.y = _986;
    out.m_59.z = _990;
    out.m_61.x = _992;
    out.m_61.y = _994;
    out.m_61.z = _996;
    bool _998 = _988 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1000 = isnan(_988);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1006 = _1002 || _1004;
    float _1008 = _978;
    if (!_1006)
    {
        _1008 = 1.0;
    }
    float _1010 = _1008;
    bool _1012 = !_1006;
    float _1014 = _1010;
    if (!_1012)
    {
        bool _1016 = _988 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1018 = isnan(_988);
        bool _1020 = _1016 || _1018;
        bool _1022 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1024 = _1020 || _1022;
        if (!_1024)
        {
            float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1028 = _988 + _1026;
            float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1032 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1030;
            float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1036 = _1034 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1038 = 1.0 / _1032;
            float _1040 = _1028 * _1038;
            float _1042 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1014 = _1042;
            _1044 = true;
        }
        else
        {
            bool _1046 = _988 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1048 = isnan(_988);
            bool _1050 = _1046 || _1048;
            bool _1052 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1054 = _1050 || _1052;
            if (!_1054)
            {
                float _1056 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1058 = _988 + _1056;
                float _1060 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1062 = _1060 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1066 = _1064 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1068 = 1.0 / _1062;
                float _1070 = _1058 * _1068;
                float _1072 = fma(_1070, _1066, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1014 = _1072;
                _1044 = true;
            }
            else
            {
                _1014 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1044 = false;
    float _1074 = _1014;
    float _1076 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1078 = _954 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1082 = _948 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1086 = _956 + _1084;
    bool _1088 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(0.5);
    bool _1096 = _1092 || _1094;
    float _1098 = fma(_1078, _1074, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1100 = fma(_1082, _1074, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1102 = fma(_1086, _1074, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1104 = -_640;
    float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1098);
    float _1108 = -_638;
    float _1110 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1112 = -_646;
    float _1114 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1102);
    float _1116 = _1106;
    float _1118 = _1110;
    if (_1096)
    {
        _696 = _1106;
    }
    float _1120 = _696;
    float _1122 = _1120;
    if (_1096)
    {
        _1116 = _1114;
    }
    float _1124 = _1116;
    float _1126 = _1124;
    if (!_1096)
    {
        float _1128 = _658 * _658;
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1132 = -_548;
        float _1134 = _1132 + _1102;
        float _1136 = -_536;
        float _1138 = _1136 + _1098;
        float _1140 = fma(_666, _666, _1128);
        float _1142 = -_534;
        float _1144 = _1142 + _1100;
        float _1146 = fma(_676, _676, _1140);
        float _1148 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1150 = sqrt(_1146);
        float _1152 = 1.0 / _736;
        float _1154 = precise::min(_1150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1156 = _1154 * _1130;
        float _1158 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1160 = _1156 * _1152;
        float _1162 = _1158 * _1160;
        float _1164 = _1134 * _1160;
        float _1166 = fma(_1138, _1162, _650);
        float _1168 = fma(_1144, _1162, _644);
        float _1170 = fma(_1158, _1164, _662);
        _1118 = _1168;
        _1122 = _1166;
        _1126 = _1170;
    }
    float _1172 = _1118;
    float _1174 = _1122;
    float _1176 = _1126;
    float _1178 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1180 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1184 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1186 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1178);
    float _1188 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1190 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1182);
    float _1192 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1184);
    float _1194 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1186);
    float _1196 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1188);
    float _1198 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1190);
    float _1200 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1192);
    float _1202 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1212 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1210);
    float _1220 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1212);
    float _1222 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1214);
    float _1224 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1216);
    float _1226 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1218);
    float _1228 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1220);
    float _1230 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1222);
    float _1232 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1224);
    float _1234 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1236 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1226);
    float _1238 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1228);
    float _1240 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1230);
    float _1242 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1232);
    out.m_63.x = _650;
    out.m_63.y = _644;
    out.m_63.z = _662;
    out.m_39.x = 1.0;
    out.m_65.w = _1234;
    out.gl_Position.x = _1236;
    out.gl_Position.y = _1238;
    out.gl_Position.z = _1240;
    out.gl_Position.w = _1242;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1044 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_32.w;
    float _81 = in.m_34.w;
    float _83 = trunc(_79);
    int _86 = int(_83);
    float _88 = -_81;
    float _90 = _88 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _90;
    bool _94 = _86 >= 1;
    float _96 = 0.0;
    int _98 = as_type<int>(_81);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_39.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1310 = as_type<float>(_106);
        out.gl_Position.z = _1310;
    }
    if (!_94)
    {
        return out;
    }
    bool _110 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_81);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = float(_86);
    bool _122 = _90 >= _120;
    bool _124 = !_118;
    bool _126 = _122 || _124;
    float _128 = _120;
    bool _130 = _126;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (_126)
    {
        out.m_39.x = 0.0;
    }
    if (_126)
    {
        float _134 = _132 * 5.0;
        _108 = as_type<int>(_134);
    }
    int _136 = _108;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1367 = as_type<float>(_136);
        out.gl_Position.z = _1367;
    }
    if (_126)
    {
        return out;
    }
    float _138 = in.m_41.x;
    float _140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _142 = in.m_43.x;
    int _144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _146 = _144 != 0;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _150 = _148 != 0;
    float _152 = in.m_41.y;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _156 = in.m_43.y;
    float _158 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _162 = _160 != 0;
    float _164 = in.m_43.w;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _168 = _166 != 0;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _172 = in.m_43.z;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _176 = _138;
    if (_146)
    {
        float _178 = -_138;
        float _180 = _178 + 1.0;
        _98 = as_type<int>(_180);
    }
    int _182 = _98;
    float _184 = 0.0;
    if (!_146)
    {
        _184 = _138;
    }
    float _186 = _184;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _192 = _186;
    float _194 = _142;
    if (_146)
    {
        bool _196 = _142 > 0.5;
        _130 = _196;
    }
    bool _198 = _130;
    float _200 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].z, _188);
    float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _204 = -_152;
    float _206 = _204 + 1.0;
    float _208 = _152;
    float _210 = _206;
    if (_146)
    {
        float _212 = _198 ? as_type<float>(_182) : _138;
        _192 = _212;
    }
    float _214 = _192;
    int _216 = 0;
    if (_162)
    {
        float _218 = -_138;
        float _220 = _218 + 1.0;
        _216 = as_type<int>(_220);
    }
    int _222 = _216;
    float _224 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _226 = _156 > 0.5;
    float _228 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].w, _170);
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _232 = _230 != 0;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _236 = _164 > 0.5;
    float _238 = _174 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _240 = _226 ? as_type<int>(_206) : as_type<int>(_152);
    int _242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _244 = _242 != 0;
    float _246 = _232 ? as_type<float>(_240) : _152;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _250 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _254 = _252 != 0;
    float _256 = fma(_224, -2.0, _248);
    float _258 = _248;
    bool _260 = _236;
    if (!_150)
    {
        _258 = _156;
    }
    float _262 = _258;
    float _264 = -_158;
    float _266 = fma(_250, 2.0, _264);
    float _268 = _262;
    if (_150)
    {
        _268 = _142;
    }
    float _270 = _268;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _274 = _140 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _276 = 0.0;
    float _278 = _270;
    if (!_150)
    {
        _276 = _172;
    }
    float _280 = _276;
    float _282 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[76].y, _256);
    int _284 = _236 ? as_type<int>(_206) : as_type<int>(_152);
    float _286 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[83].z, _272);
    float _288 = 0.0;
    float _290 = _280;
    if (!_150)
    {
        _288 = _280;
    }
    float _292 = _288;
    float _294 = fma(_274, _246, -0.5);
    float _296 = _292;
    if (_244)
    {
        bool _298 = _172 > 0.5;
        _260 = _298;
    }
    bool _300 = _260;
    float _302 = _154 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_150)
    {
        _290 = _172;
    }
    float _304 = _290;
    float _306 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].w, _228);
    if (!_150)
    {
        _278 = _156;
    }
    float _308 = _278;
    int _310 = 0;
    float _312 = _308;
    if (_244)
    {
        float _314 = -_138;
        float _316 = _314 + 1.0;
        _310 = as_type<int>(_316);
    }
    int _318 = _310;
    float _320 = _168 ? as_type<float>(_284) : _152;
    float _322 = -_282;
    float _324 = fma(_306, _294, _322);
    if (_150)
    {
        _312 = _142;
    }
    float _326 = _312;
    float _328 = fma(_320, _302, -0.5);
    float _330 = 0.0;
    if (!_150)
    {
        _330 = _292;
    }
    float _332 = _330;
    float _334 = _326 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _336 = _332;
    if (_150)
    {
        _336 = _156;
    }
    float _338 = _336;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _342 = _338;
    if (_150)
    {
        _296 = _156;
    }
    float _344 = _296;
    float _346 = in.m_34.x;
    float _348 = in.m_34.y;
    float _350 = in.m_34.z;
    float _352 = _344;
    if (_150)
    {
        _194 = _304;
    }
    float _354 = _194;
    float _356 = -_340;
    float _358 = fma(_334, 2.0, _356);
    bool _360 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _364 = _360 || _362;
    bool _366 = isnan(1.0);
    bool _368 = _364 || _366;
    float _370 = in.m_45.w;
    bool _372 = _304 > 0.5;
    float _374 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[84].z, _190);
    float _376 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _378 = in.m_32.x;
    float _380 = in.m_32.y;
    float _382 = in.m_32.z;
    float _384 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[83].w, _234);
    if (_254)
    {
        float _386 = _372 ? _206 : _152;
        _208 = _386;
    }
    float _388 = _208;
    float _390 = _338 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _392 = 0.0;
    if (!_244)
    {
        _392 = _138;
    }
    float _394 = _392;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _398 = _394;
    if (_244)
    {
        float _400 = _300 ? as_type<float>(_318) : _138;
        _398 = _400;
    }
    float _402 = _398;
    if (!_368)
    {
        float _404 = _376 * _376;
        float _406 = _404 * 0.5;
        _210 = _406;
    }
    float _408 = _210;
    if (_162)
    {
        float _410 = _226 ? as_type<float>(_222) : _138;
        _176 = _410;
    }
    float _412 = _176;
    if (!_368)
    {
        _352 = _376;
    }
    float _414 = _352;
    float _416 = _414;
    if (!_368)
    {
        float _418 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _418;
    }
    float _420 = _342;
    bool _422 = !_368;
    float _424 = _420;
    if (!_422)
    {
        float _426 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _428 = log2(_426);
        float _430 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _432 = _430 + 1.0;
        float _434 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _436 = _376 * _428;
        float _438 = 1.0 / _432;
        float _440 = _434 * 0.693147182464599609375;
        float _442 = exp2(_436);
        float _444 = 1.0 / _440;
        float _446 = _442 + (-1.0);
        float _448 = -_446;
        float _450 = fma(_448, _444, _376);
        float _452 = _450 * _438;
        float _454 = _452 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _424 = _454;
    }
    float _456 = _424;
    bool _458 = !_368;
    if (!_458)
    {
        float _460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _462 = log2(_460);
        float _464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _466 = _464 + 1.0;
        float _468 = 1.0 / _466;
        float _470 = _376 * _462;
        float _472 = exp2(_470);
        float _474 = -_472;
        float _476 = _474 + 1.0;
        float _478 = _476 * _468;
        _416 = _478;
    }
    float _480 = _416;
    float _482 = fma(_238, _214, -0.5);
    float _484 = _456 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _486 = _456 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _488 = _456 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _490 = _202 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _492 = fma(_480, _348, _484);
    float _494 = fma(_480, _346, _486);
    float _496 = fma(_480, _350, _488);
    float _498 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[84].x, _374);
    float _500 = fma(_492, _370, _380);
    float _502 = fma(_494, _370, _378);
    float _504 = fma(_496, _370, _382);
    float _506 = fma(_490, _402, -0.5);
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _510 = _500 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _512 = _500 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _514 = _498 * (-0.15915493667125701904296875);
    float _516 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _508);
    float _518 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    float _520 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _512);
    float _522 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].z, _200);
    float _524 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[5].z, _516);
    float _526 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[4].z, _518);
    float _528 = -_90;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _266);
    float _532 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[6].z, _520);
    float _534 = _524 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _536 = _526 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _538 = _514 * 6.283185482025146484375;
    float _540 = sin(_538);
    float _542 = fma(_522, _482, _530);
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _534 + _544;
    float _548 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _550 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _552 = _536 + _550;
    float _554 = fma(_390, -2.0, _396);
    float _556 = _546 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _558 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _560 = _548 + _558;
    float _562 = _514 * 6.283185482025146484375;
    float _564 = cos(_562);
    float _566 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].z, _286);
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[28].x, _556);
    float _570 = -_90;
    float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[81].x, _358);
    float _574 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[81].y, _554);
    float _576 = _412 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c8)._m0[28].z, _568);
    float _580 = _546 * _546;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _584 = _540 * _328;
    float _586 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].w, _384);
    bool _588 = _578 >= 0.0;
    float _590 = fma(_552, _552, _580);
    float _592 = _388 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _596 = _564 * _328;
    float _598 = -_584;
    float _600 = fma(_564, _506, _598);
    float _602 = fma(_560, _560, _590);
    float _604 = _542 + 0.5;
    float _606 = fma(_540, _506, _596);
    float _608 = fma(_566, _600, _572);
    float _610 = rsqrt(_602);
    float _612 = _506;
    int _614 = as_type<int>(_490);
    if (_588)
    {
        _612 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _616 = _612;
    float _618 = -_574;
    float _620 = fma(_586, _606, _618);
    float _622 = _576 * _582;
    float _624 = _324 + 0.5;
    float _626 = _608 + 0.5;
    float _628 = _620 + 0.5;
    if (_588)
    {
        float _630 = _616 * 5.0;
        _614 = as_type<int>(_630);
    }
    int _632 = _614;
    float _634 = _592 * _594;
    int _636 = _632;
    if (_588)
    {
        out.m_39.x = 0.0;
    }
    out.m_47.x = _622;
    out.m_47.y = _634;
    float _638 = _546 * _610;
    out.m_49.x = _604;
    out.m_49.y = _624;
    out.m_49.z = _626;
    out.m_49.w = _628;
    float _640 = _552 * _610;
    if (_588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2244 = as_type<float>(_632);
        out.gl_Position.z = _2244;
    }
    if (_588)
    {
        return out;
    }
    float _642 = -_638;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _534);
    float _646 = _560 * _610;
    float _648 = -_640;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[18].w, _536);
    float _652 = -_638;
    float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    float _656 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _658 = _644 + _656;
    float _660 = -_646;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _548);
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _666 = _650 + _664;
    float _668 = -_640;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _552);
    float _672 = _658 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _676 = _662 + _674;
    float _678 = _654 * _654;
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[28].x, _672);
    float _682 = -_646;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _560);
    float _686 = fma(_670, _670, _678);
    float _688 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[28].z, _680);
    float _690 = fma(_684, _684, _686);
    bool _692 = _688 >= 0.0;
    float _694 = _672;
    float _696 = _646;
    if (_692)
    {
        _694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _698 = _694;
    if (_692)
    {
        out.m_39.x = 0.0;
    }
    if (_692)
    {
        float _700 = _698 * 5.0;
        _636 = as_type<int>(_700);
    }
    int _702 = _636;
    if (_692)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2366 = as_type<float>(_702);
        out.gl_Position.z = _2366;
    }
    if (_692)
    {
        return out;
    }
    float _704 = in.m_45.x;
    float _706 = in.m_45.y;
    float _708 = in.m_45.z;
    float _710 = sqrt(_690);
    float _712 = in.m_51.x;
    float _714 = in.m_51.y;
    float _716 = in.m_51.z;
    float _718 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _720 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _718;
    float _722 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _724 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _722;
    float _726 = _720 * _720;
    float _728 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _730 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _728;
    float _732 = fma(_724, _724, _726);
    float _734 = fma(_730, _730, _732);
    float _736 = _610 * _710;
    float _738 = _706 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _740 = sqrt(_734);
    float _742 = _704 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _744 = _708 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _746 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _714);
    float _750 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _712);
    float _754 = _736 * _746;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _716);
    float _758 = _736 * _750;
    float _760 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _762 = _748 * _754;
    float _764 = _752 * _758;
    float _766 = _736 * _760;
    float _768 = _762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _770 = _762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _772 = fma(_740, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _774 = _756 * _766;
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _768);
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _770);
    float _780 = _762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _782 = precise::max(_772, 1.0);
    float _784 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].z, _776);
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].z, _778);
    float _788 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _780);
    float _790 = precise::min(_782, 1.89999997615814208984375);
    float _792 = _784 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _794 = _786 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _796 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].z, _788);
    float _798 = in.m_53.x;
    float _800 = in.m_53.y;
    float _802 = in.m_53.z;
    float _804 = fma(_792, _790, _536);
    float _806 = fma(_794, _790, _548);
    float _808 = _796 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _810 = in.m_55.x;
    float _812 = in.m_55.y;
    float _814 = in.m_55.z;
    float _816 = in.m_55.w;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _820 = _804 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _824 = _806 + _822;
    float _826 = fma(_808, _790, _534);
    float _828 = _820 * _820;
    float _830 = _824 * _824;
    float _832 = _828 + _830;
    float _834 = sqrt(_832);
    float _836 = _798 * _814;
    float _838 = _802 * _812;
    float _840 = _800 * _810;
    float _842 = -_836;
    float _844 = fma(_802, _810, _842);
    float _846 = -_838;
    float _848 = fma(_814, _800, _846);
    bool _850 = _834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _812 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _854 = _812 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _856 = _812 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _858 = -_840;
    float _860 = fma(_812, _798, _858);
    float _862 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _852);
    float _864 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _854);
    float _866 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _856);
    float _868 = _798;
    float _870 = _810;
    float _872 = _854;
    float _874 = _840;
    float _876 = _774;
    if (!_850)
    {
        _868 = _830;
    }
    float _878 = _868;
    float _880 = _878;
    if (!_850)
    {
        _870 = _828;
    }
    float _882 = _870;
    float _884 = _882;
    if (!_850)
    {
        _872 = _804;
    }
    float _886 = _872;
    float _888 = _886;
    if (!_850)
    {
        _874 = _806;
    }
    float _890 = _874;
    float _892 = _890;
    if (!_850)
    {
        _876 = _826;
    }
    float _894 = _876;
    bool _896 = !_850;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _834 + _902;
        float _906 = rsqrt(_832);
        float _908 = _904 * _900;
        float _910 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = _908 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = cos(_918);
        float _922 = fma(_916, _910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _924 = _906 * _922;
        float _926 = _920 + (-1.0);
        float _928 = fma(_820, _924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_824, _924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _932 = _926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _936 = _928 + _934;
        float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _940 = _930 + _938;
        float _942 = fma(_826, _920, _932);
        float _944 = _936 * _936;
        float _946 = _940 * _940;
        _898 = _942;
        _884 = _944;
        _880 = _946;
        _888 = _928;
        _892 = _930;
    }
    float _948 = _898;
    float _950 = _884;
    float _952 = _880;
    float _954 = _888;
    float _956 = _892;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _960 = _948 + _958;
    float _962 = _844 * _816;
    float _964 = _848 * _816;
    float _966 = _860 * _816;
    float _968 = fma(_960, _960, _950);
    float _970 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _972 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _976 = _968 + _952;
    float _978 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _970);
    float _980 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _972);
    float _982 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _974);
    float _984 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].z, _862);
    float _986 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].z, _864);
    float _988 = sqrt(_976);
    float _990 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].z, _866);
    float _992 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _994 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _980);
    float _996 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _982);
    out.m_57.x = _640;
    out.m_57.y = _638;
    out.m_57.z = _646;
    out.m_59.x = _984;
    out.m_59.y = _986;
    out.m_59.z = _990;
    out.m_61.x = _992;
    out.m_61.y = _994;
    out.m_61.z = _996;
    bool _998 = _988 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1000 = isnan(_988);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1006 = _1002 || _1004;
    float _1008 = _978;
    if (!_1006)
    {
        _1008 = 1.0;
    }
    float _1010 = _1008;
    bool _1012 = !_1006;
    float _1014 = _1010;
    if (!_1012)
    {
        bool _1016 = _988 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1018 = isnan(_988);
        bool _1020 = _1016 || _1018;
        bool _1022 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1024 = _1020 || _1022;
        if (!_1024)
        {
            float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1028 = _988 + _1026;
            float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1032 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1030;
            float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1036 = _1034 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1038 = 1.0 / _1032;
            float _1040 = _1028 * _1038;
            float _1042 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1014 = _1042;
            _1044 = true;
        }
        else
        {
            bool _1046 = _988 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1048 = isnan(_988);
            bool _1050 = _1046 || _1048;
            bool _1052 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1054 = _1050 || _1052;
            if (!_1054)
            {
                float _1056 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1058 = _988 + _1056;
                float _1060 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1062 = _1060 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1066 = _1064 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1068 = 1.0 / _1062;
                float _1070 = _1058 * _1068;
                float _1072 = fma(_1070, _1066, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1014 = _1072;
                _1044 = true;
            }
            else
            {
                _1014 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1044 = false;
    float _1074 = _1014;
    float _1076 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1078 = _954 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1082 = _948 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1086 = _956 + _1084;
    bool _1088 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(0.5);
    bool _1096 = _1092 || _1094;
    float _1098 = fma(_1078, _1074, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1100 = fma(_1082, _1074, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1102 = fma(_1086, _1074, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1104 = -_640;
    float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1098);
    float _1108 = -_638;
    float _1110 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1112 = -_646;
    float _1114 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1102);
    float _1116 = _1106;
    float _1118 = _1110;
    if (_1096)
    {
        _696 = _1106;
    }
    float _1120 = _696;
    float _1122 = _1120;
    if (_1096)
    {
        _1116 = _1114;
    }
    float _1124 = _1116;
    float _1126 = _1124;
    if (!_1096)
    {
        float _1128 = _658 * _658;
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1132 = -_548;
        float _1134 = _1132 + _1102;
        float _1136 = -_536;
        float _1138 = _1136 + _1098;
        float _1140 = fma(_666, _666, _1128);
        float _1142 = -_534;
        float _1144 = _1142 + _1100;
        float _1146 = fma(_676, _676, _1140);
        float _1148 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1150 = sqrt(_1146);
        float _1152 = 1.0 / _736;
        float _1154 = precise::min(_1150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1156 = _1154 * _1130;
        float _1158 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1160 = _1156 * _1152;
        float _1162 = _1158 * _1160;
        float _1164 = _1134 * _1160;
        float _1166 = fma(_1138, _1162, _650);
        float _1168 = fma(_1144, _1162, _644);
        float _1170 = fma(_1158, _1164, _662);
        _1118 = _1168;
        _1122 = _1166;
        _1126 = _1170;
    }
    float _1172 = _1118;
    float _1174 = _1122;
    float _1176 = _1126;
    float _1178 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1180 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1184 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1186 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1178);
    float _1188 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1190 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1182);
    float _1192 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1184);
    float _1194 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1186);
    float _1196 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1188);
    float _1198 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1190);
    float _1200 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1192);
    float _1202 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1212 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1210);
    float _1220 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1212);
    float _1222 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1214);
    float _1224 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1216);
    float _1226 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1218);
    float _1228 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1220);
    float _1230 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1222);
    float _1232 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1224);
    float _1234 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1236 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1226);
    float _1238 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1228);
    float _1240 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1230);
    float _1242 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1232);
    out.m_63.x = _650;
    out.m_63.y = _644;
    out.m_63.z = _662;
    out.m_39.x = 1.0;
    out.m_65.w = _1234;
    out.gl_Position.x = _1236;
    out.gl_Position.y = _1238;
    out.gl_Position.z = _1240;
    out.gl_Position.w = _1242;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1044 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_32.w;
    float _81 = in.m_34.w;
    float _83 = trunc(_79);
    int _86 = int(_83);
    float _88 = -_81;
    float _90 = _88 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _90;
    bool _94 = _86 >= 1;
    float _96 = 0.0;
    int _98 = as_type<int>(_81);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_39.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1310 = as_type<float>(_106);
        out.gl_Position.z = _1310;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _110 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_81);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = float(_86);
    bool _122 = _90 >= _120;
    bool _124 = !_118;
    bool _126 = _122 || _124;
    float _128 = _120;
    bool _130 = _126;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (_126)
    {
        out.m_39.x = 0.0;
    }
    if (_126)
    {
        float _134 = _132 * 5.0;
        _108 = as_type<int>(_134);
    }
    int _136 = _108;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1367 = as_type<float>(_136);
        out.gl_Position.z = _1367;
    }
    if (_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_41.x;
    float _140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _142 = in.m_43.x;
    int _144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _146 = _144 != 0;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _150 = _148 != 0;
    float _152 = in.m_41.y;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _156 = in.m_43.y;
    float _158 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _162 = _160 != 0;
    float _164 = in.m_43.w;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _168 = _166 != 0;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _172 = in.m_43.z;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _176 = _138;
    if (_146)
    {
        float _178 = -_138;
        float _180 = _178 + 1.0;
        _98 = as_type<int>(_180);
    }
    int _182 = _98;
    float _184 = 0.0;
    if (!_146)
    {
        _184 = _138;
    }
    float _186 = _184;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _192 = _186;
    float _194 = _142;
    if (_146)
    {
        bool _196 = _142 > 0.5;
        _130 = _196;
    }
    bool _198 = _130;
    float _200 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].z, _188);
    float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _204 = -_152;
    float _206 = _204 + 1.0;
    float _208 = _152;
    float _210 = _206;
    if (_146)
    {
        float _212 = _198 ? as_type<float>(_182) : _138;
        _192 = _212;
    }
    float _214 = _192;
    int _216 = 0;
    if (_162)
    {
        float _218 = -_138;
        float _220 = _218 + 1.0;
        _216 = as_type<int>(_220);
    }
    int _222 = _216;
    float _224 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _226 = _156 > 0.5;
    float _228 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].w, _170);
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _232 = _230 != 0;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _236 = _164 > 0.5;
    float _238 = _174 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _240 = _226 ? as_type<int>(_206) : as_type<int>(_152);
    int _242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _244 = _242 != 0;
    float _246 = _232 ? as_type<float>(_240) : _152;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _250 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _254 = _252 != 0;
    float _256 = fma(_224, -2.0, _248);
    float _258 = _248;
    bool _260 = _236;
    if (!_150)
    {
        _258 = _156;
    }
    float _262 = _258;
    float _264 = -_158;
    float _266 = fma(_250, 2.0, _264);
    float _268 = _262;
    if (_150)
    {
        _268 = _142;
    }
    float _270 = _268;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _274 = _140 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _276 = 0.0;
    float _278 = _270;
    if (!_150)
    {
        _276 = _172;
    }
    float _280 = _276;
    float _282 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[76].y, _256);
    int _284 = _236 ? as_type<int>(_206) : as_type<int>(_152);
    float _286 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[83].z, _272);
    float _288 = 0.0;
    float _290 = _280;
    if (!_150)
    {
        _288 = _280;
    }
    float _292 = _288;
    float _294 = fma(_274, _246, -0.5);
    float _296 = _292;
    if (_244)
    {
        bool _298 = _172 > 0.5;
        _260 = _298;
    }
    bool _300 = _260;
    float _302 = _154 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_150)
    {
        _290 = _172;
    }
    float _304 = _290;
    float _306 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].w, _228);
    if (!_150)
    {
        _278 = _156;
    }
    float _308 = _278;
    int _310 = 0;
    float _312 = _308;
    if (_244)
    {
        float _314 = -_138;
        float _316 = _314 + 1.0;
        _310 = as_type<int>(_316);
    }
    int _318 = _310;
    float _320 = _168 ? as_type<float>(_284) : _152;
    float _322 = -_282;
    float _324 = fma(_306, _294, _322);
    if (_150)
    {
        _312 = _142;
    }
    float _326 = _312;
    float _328 = fma(_320, _302, -0.5);
    float _330 = 0.0;
    if (!_150)
    {
        _330 = _292;
    }
    float _332 = _330;
    float _334 = _326 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _336 = _332;
    if (_150)
    {
        _336 = _156;
    }
    float _338 = _336;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _342 = _338;
    if (_150)
    {
        _296 = _156;
    }
    float _344 = _296;
    float _346 = in.m_34.x;
    float _348 = in.m_34.y;
    float _350 = in.m_34.z;
    float _352 = _344;
    if (_150)
    {
        _194 = _304;
    }
    float _354 = _194;
    float _356 = -_340;
    float _358 = fma(_334, 2.0, _356);
    bool _360 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _364 = _360 || _362;
    bool _366 = isnan(1.0);
    bool _368 = _364 || _366;
    float _370 = in.m_45.w;
    bool _372 = _304 > 0.5;
    float _374 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[84].z, _190);
    float _376 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _378 = in.m_32.x;
    float _380 = in.m_32.y;
    float _382 = in.m_32.z;
    float _384 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[83].w, _234);
    if (_254)
    {
        float _386 = _372 ? _206 : _152;
        _208 = _386;
    }
    float _388 = _208;
    float _390 = _338 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _392 = 0.0;
    if (!_244)
    {
        _392 = _138;
    }
    float _394 = _392;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _398 = _394;
    if (_244)
    {
        float _400 = _300 ? as_type<float>(_318) : _138;
        _398 = _400;
    }
    float _402 = _398;
    if (!_368)
    {
        float _404 = _376 * _376;
        float _406 = _404 * 0.5;
        _210 = _406;
    }
    float _408 = _210;
    if (_162)
    {
        float _410 = _226 ? as_type<float>(_222) : _138;
        _176 = _410;
    }
    float _412 = _176;
    if (!_368)
    {
        _352 = _376;
    }
    float _414 = _352;
    float _416 = _414;
    if (!_368)
    {
        float _418 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _418;
    }
    float _420 = _342;
    bool _422 = !_368;
    float _424 = _420;
    if (!_422)
    {
        float _426 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _428 = log2(_426);
        float _430 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _432 = _430 + 1.0;
        float _434 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _436 = _376 * _428;
        float _438 = 1.0 / _432;
        float _440 = _434 * 0.693147182464599609375;
        float _442 = exp2(_436);
        float _444 = 1.0 / _440;
        float _446 = _442 + (-1.0);
        float _448 = -_446;
        float _450 = fma(_448, _444, _376);
        float _452 = _450 * _438;
        float _454 = _452 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _424 = _454;
    }
    float _456 = _424;
    bool _458 = !_368;
    if (!_458)
    {
        float _460 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _462 = log2(_460);
        float _464 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _466 = _464 + 1.0;
        float _468 = 1.0 / _466;
        float _470 = _376 * _462;
        float _472 = exp2(_470);
        float _474 = -_472;
        float _476 = _474 + 1.0;
        float _478 = _476 * _468;
        _416 = _478;
    }
    float _480 = _416;
    float _482 = fma(_238, _214, -0.5);
    float _484 = _456 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _486 = _456 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _488 = _456 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _490 = _202 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _492 = fma(_480, _348, _484);
    float _494 = fma(_480, _346, _486);
    float _496 = fma(_480, _350, _488);
    float _498 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[84].x, _374);
    float _500 = fma(_492, _370, _380);
    float _502 = fma(_494, _370, _378);
    float _504 = fma(_496, _370, _382);
    float _506 = fma(_490, _402, -0.5);
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _510 = _500 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _512 = _500 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _514 = _498 * (-0.15915493667125701904296875);
    float _516 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _508);
    float _518 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    float _520 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _512);
    float _522 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].z, _200);
    float _524 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[5].z, _516);
    float _526 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[4].z, _518);
    float _528 = -_90;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _266);
    float _532 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[6].z, _520);
    float _534 = _524 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _536 = _526 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _538 = _514 * 6.283185482025146484375;
    float _540 = sin(_538);
    float _542 = fma(_522, _482, _530);
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _546 = _534 + _544;
    float _548 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _550 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _552 = _536 + _550;
    float _554 = fma(_390, -2.0, _396);
    float _556 = _546 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _558 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _560 = _548 + _558;
    float _562 = _514 * 6.283185482025146484375;
    float _564 = cos(_562);
    float _566 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].z, _286);
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[28].x, _556);
    float _570 = -_90;
    float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[81].x, _358);
    float _574 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[81].y, _554);
    float _576 = _412 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c8)._m0[28].z, _568);
    float _580 = _546 * _546;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _584 = _540 * _328;
    float _586 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].w, _384);
    bool _588 = _578 >= 0.0;
    float _590 = fma(_552, _552, _580);
    float _592 = _388 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _596 = _564 * _328;
    float _598 = -_584;
    float _600 = fma(_564, _506, _598);
    float _602 = fma(_560, _560, _590);
    float _604 = _542 + 0.5;
    float _606 = fma(_540, _506, _596);
    float _608 = fma(_566, _600, _572);
    float _610 = rsqrt(_602);
    float _612 = _506;
    int _614 = as_type<int>(_490);
    if (_588)
    {
        _612 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _616 = _612;
    float _618 = -_574;
    float _620 = fma(_586, _606, _618);
    float _622 = _576 * _582;
    float _624 = _324 + 0.5;
    float _626 = _608 + 0.5;
    float _628 = _620 + 0.5;
    if (_588)
    {
        float _630 = _616 * 5.0;
        _614 = as_type<int>(_630);
    }
    int _632 = _614;
    float _634 = _592 * _594;
    int _636 = _632;
    if (_588)
    {
        out.m_39.x = 0.0;
    }
    out.m_47.x = _622;
    out.m_47.y = _634;
    float _638 = _546 * _610;
    out.m_49.x = _604;
    out.m_49.y = _624;
    out.m_49.z = _626;
    out.m_49.w = _628;
    float _640 = _552 * _610;
    if (_588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2244 = as_type<float>(_632);
        out.gl_Position.z = _2244;
    }
    if (_588)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _642 = -_638;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _534);
    float _646 = _560 * _610;
    float _648 = -_640;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[18].w, _536);
    float _652 = -_638;
    float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _546);
    float _656 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _658 = _644 + _656;
    float _660 = -_646;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _548);
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _666 = _650 + _664;
    float _668 = -_640;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _552);
    float _672 = _658 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _676 = _662 + _674;
    float _678 = _654 * _654;
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[28].x, _672);
    float _682 = -_646;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _560);
    float _686 = fma(_670, _670, _678);
    float _688 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[28].z, _680);
    float _690 = fma(_684, _684, _686);
    bool _692 = _688 >= 0.0;
    float _694 = _672;
    float _696 = _646;
    if (_692)
    {
        _694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _698 = _694;
    if (_692)
    {
        out.m_39.x = 0.0;
    }
    if (_692)
    {
        float _700 = _698 * 5.0;
        _636 = as_type<int>(_700);
    }
    int _702 = _636;
    if (_692)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2366 = as_type<float>(_702);
        out.gl_Position.z = _2366;
    }
    if (_692)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _704 = in.m_45.x;
    float _706 = in.m_45.y;
    float _708 = in.m_45.z;
    float _710 = sqrt(_690);
    float _712 = in.m_51.x;
    float _714 = in.m_51.y;
    float _716 = in.m_51.z;
    float _718 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _720 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _718;
    float _722 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _724 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _722;
    float _726 = _720 * _720;
    float _728 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _730 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _728;
    float _732 = fma(_724, _724, _726);
    float _734 = fma(_730, _730, _732);
    float _736 = _610 * _710;
    float _738 = _706 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _740 = sqrt(_734);
    float _742 = _704 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _744 = _708 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _746 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _714);
    float _750 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _712);
    float _754 = _736 * _746;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _716);
    float _758 = _736 * _750;
    float _760 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _762 = _748 * _754;
    float _764 = _752 * _758;
    float _766 = _736 * _760;
    float _768 = _762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _770 = _762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _772 = fma(_740, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _774 = _756 * _766;
    float _776 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _768);
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _770);
    float _780 = _762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _782 = precise::max(_772, 1.0);
    float _784 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].z, _776);
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].z, _778);
    float _788 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _780);
    float _790 = precise::min(_782, 1.89999997615814208984375);
    float _792 = _784 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _794 = _786 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _796 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].z, _788);
    float _798 = in.m_53.x;
    float _800 = in.m_53.y;
    float _802 = in.m_53.z;
    float _804 = fma(_792, _790, _536);
    float _806 = fma(_794, _790, _548);
    float _808 = _796 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _810 = in.m_55.x;
    float _812 = in.m_55.y;
    float _814 = in.m_55.z;
    float _816 = in.m_55.w;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _820 = _804 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _824 = _806 + _822;
    float _826 = fma(_808, _790, _534);
    float _828 = _820 * _820;
    float _830 = _824 * _824;
    float _832 = _828 + _830;
    float _834 = sqrt(_832);
    float _836 = _798 * _814;
    float _838 = _802 * _812;
    float _840 = _800 * _810;
    float _842 = -_836;
    float _844 = fma(_802, _810, _842);
    float _846 = -_838;
    float _848 = fma(_814, _800, _846);
    bool _850 = _834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _812 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _854 = _812 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _856 = _812 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _858 = -_840;
    float _860 = fma(_812, _798, _858);
    float _862 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _852);
    float _864 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _854);
    float _866 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _856);
    float _868 = _798;
    float _870 = _810;
    float _872 = _854;
    float _874 = _840;
    float _876 = _774;
    if (!_850)
    {
        _868 = _830;
    }
    float _878 = _868;
    float _880 = _878;
    if (!_850)
    {
        _870 = _828;
    }
    float _882 = _870;
    float _884 = _882;
    if (!_850)
    {
        _872 = _804;
    }
    float _886 = _872;
    float _888 = _886;
    if (!_850)
    {
        _874 = _806;
    }
    float _890 = _874;
    float _892 = _890;
    if (!_850)
    {
        _876 = _826;
    }
    float _894 = _876;
    bool _896 = !_850;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _834 + _902;
        float _906 = rsqrt(_832);
        float _908 = _904 * _900;
        float _910 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = _908 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = cos(_918);
        float _922 = fma(_916, _910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _924 = _906 * _922;
        float _926 = _920 + (-1.0);
        float _928 = fma(_820, _924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_824, _924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _932 = _926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _936 = _928 + _934;
        float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _940 = _930 + _938;
        float _942 = fma(_826, _920, _932);
        float _944 = _936 * _936;
        float _946 = _940 * _940;
        _898 = _942;
        _884 = _944;
        _880 = _946;
        _888 = _928;
        _892 = _930;
    }
    float _948 = _898;
    float _950 = _884;
    float _952 = _880;
    float _954 = _888;
    float _956 = _892;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _960 = _948 + _958;
    float _962 = _844 * _816;
    float _964 = _848 * _816;
    float _966 = _860 * _816;
    float _968 = fma(_960, _960, _950);
    float _970 = _962 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _972 = _962 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _974 = _962 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _976 = _968 + _952;
    float _978 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[24].x, _970);
    float _980 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[25].x, _972);
    float _982 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[26].x, _974);
    float _984 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].z, _862);
    float _986 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].z, _864);
    float _988 = sqrt(_976);
    float _990 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].z, _866);
    float _992 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _978);
    float _994 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _980);
    float _996 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _982);
    out.m_57.x = _640;
    out.m_57.y = _638;
    out.m_57.z = _646;
    out.m_59.x = _984;
    out.m_59.y = _986;
    out.m_59.z = _990;
    out.m_61.x = _992;
    out.m_61.y = _994;
    out.m_61.z = _996;
    bool _998 = _988 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1000 = isnan(_988);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1006 = _1002 || _1004;
    float _1008 = _978;
    if (!_1006)
    {
        _1008 = 1.0;
    }
    float _1010 = _1008;
    bool _1012 = !_1006;
    float _1014 = _1010;
    if (!_1012)
    {
        bool _1016 = _988 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1018 = isnan(_988);
        bool _1020 = _1016 || _1018;
        bool _1022 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1024 = _1020 || _1022;
        if (!_1024)
        {
            float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1028 = _988 + _1026;
            float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1032 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1030;
            float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1036 = _1034 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1038 = 1.0 / _1032;
            float _1040 = _1028 * _1038;
            float _1042 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1014 = _1042;
            _1044 = true;
        }
        else
        {
            bool _1046 = _988 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1048 = isnan(_988);
            bool _1050 = _1046 || _1048;
            bool _1052 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1054 = _1050 || _1052;
            if (!_1054)
            {
                float _1056 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1058 = _988 + _1056;
                float _1060 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1062 = _1060 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1066 = _1064 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1068 = 1.0 / _1062;
                float _1070 = _1058 * _1068;
                float _1072 = fma(_1070, _1066, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1014 = _1072;
                _1044 = true;
            }
            else
            {
                _1014 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1044 = false;
    float _1074 = _1014;
    float _1076 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1078 = _954 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1082 = _948 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1086 = _956 + _1084;
    bool _1088 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(0.5);
    bool _1096 = _1092 || _1094;
    float _1098 = fma(_1078, _1074, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1100 = fma(_1082, _1074, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1102 = fma(_1086, _1074, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1104 = -_640;
    float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1098);
    float _1108 = -_638;
    float _1110 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1112 = -_646;
    float _1114 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1102);
    float _1116 = _1106;
    float _1118 = _1110;
    if (_1096)
    {
        _696 = _1106;
    }
    float _1120 = _696;
    float _1122 = _1120;
    if (_1096)
    {
        _1116 = _1114;
    }
    float _1124 = _1116;
    float _1126 = _1124;
    if (!_1096)
    {
        float _1128 = _658 * _658;
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1132 = -_548;
        float _1134 = _1132 + _1102;
        float _1136 = -_536;
        float _1138 = _1136 + _1098;
        float _1140 = fma(_666, _666, _1128);
        float _1142 = -_534;
        float _1144 = _1142 + _1100;
        float _1146 = fma(_676, _676, _1140);
        float _1148 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1150 = sqrt(_1146);
        float _1152 = 1.0 / _736;
        float _1154 = precise::min(_1150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1156 = _1154 * _1130;
        float _1158 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1160 = _1156 * _1152;
        float _1162 = _1158 * _1160;
        float _1164 = _1134 * _1160;
        float _1166 = fma(_1138, _1162, _650);
        float _1168 = fma(_1144, _1162, _644);
        float _1170 = fma(_1158, _1164, _662);
        _1118 = _1168;
        _1122 = _1166;
        _1126 = _1170;
    }
    float _1172 = _1118;
    float _1174 = _1122;
    float _1176 = _1126;
    float _1178 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1180 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1184 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1186 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1178);
    float _1188 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1190 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1182);
    float _1192 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1184);
    float _1194 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1186);
    float _1196 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1188);
    float _1198 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1190);
    float _1200 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1192);
    float _1202 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1204 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1206 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1212 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1210);
    float _1220 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1212);
    float _1222 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1214);
    float _1224 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1216);
    float _1226 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1218);
    float _1228 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1220);
    float _1230 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1222);
    float _1232 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1224);
    float _1234 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1236 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1226);
    float _1238 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1228);
    float _1240 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1230);
    float _1242 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1232);
    out.m_63.x = _650;
    out.m_63.y = _644;
    out.m_63.z = _662;
    out.m_39.x = 1.0;
    out.m_65.w = _1234;
    out.gl_Position.x = _1236;
    out.gl_Position.y = _1238;
    out.gl_Position.z = _1240;
    out.gl_Position.w = _1242;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

