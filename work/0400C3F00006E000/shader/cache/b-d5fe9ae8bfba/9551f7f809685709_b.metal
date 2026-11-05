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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_33 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_45 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _708 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_30.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    float _74 = as_type<float>(_66);
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _72;
    if (!_70)
    {
        out.m_33.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_82);
        out.gl_Position.z = _2080;
    }
    if (!_70)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _86 = in.m_35.w;
    float _88 = float(_66);
    float _90 = -_86;
    float _92 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_86);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    bool _104 = _92 >= _88;
    bool _106 = !_102;
    bool _108 = _104 || _106;
    float _110 = _92;
    if (_108)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _74;
    if (_108)
    {
        out.m_33.x = 0.0;
    }
    if (_108)
    {
        float _114 = _112 * 5.0;
        _84 = as_type<int>(_114);
    }
    int _116 = _84;
    if (_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2144 = as_type<float>(_116);
        out.gl_Position.z = _2144;
    }
    if (_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_37.w;
    float _120 = 1.0 / _88;
    float _122 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _124 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _126 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = in.m_35.x;
    float _136 = in.m_35.y;
    float _138 = in.m_35.z;
    float _140 = in.m_30.x;
    float _142 = in.m_30.y;
    float _144 = in.m_30.z;
    float _146 = 0.0;
    float _148 = _122;
    if (!_132)
    {
        float _150 = _122 * _122;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_132)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_132;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _122 * _168;
        float _178 = 1.0 / _172;
        float _180 = _174 * 0.693147182464599609375;
        float _182 = exp2(_176);
        float _184 = 1.0 / _180;
        float _186 = _182 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _184, _122);
        float _192 = _190 * _178;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_132;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _122 * _202;
        float _212 = exp2(_210);
        float _214 = -_212;
        float _216 = _214 + 1.0;
        float _218 = _216 * _208;
        _148 = _218;
    }
    float _220 = _148;
    bool _222 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _226 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _228 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _230 = fma(_220, _134, _224);
    float _232 = fma(_220, _136, _226);
    float _234 = fma(_220, _138, _228);
    float _236 = fma(_230, _118, _140);
    float _238 = fma(_232, _118, _142);
    float _240 = fma(_234, _118, _144);
    float _242 = _92 * _120;
    bool _244 = !_222;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _92);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        _262 = _242;
    }
    _264 = false;
    float _266 = _262;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _270 = _266 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _288 = 1.0 / _274;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _298;
    float _302 = 1.0 / _278;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _266 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _308;
    bool _312 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_266);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_266);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _336;
    float _340 = 1.0 / _282;
    float _342 = _306 * _288;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _266 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = _266 + _348;
    bool _352 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _354 = isnan(_266);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -_322;
    float _366 = _364 + 1.0;
    float _368 = 1.0 / _292;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _372 = _266 + _370;
    float _374 = _346 * _302;
    bool _376 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _378 = isnan(_266);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _334 * _366;
    float _390 = -_334;
    float _392 = _390 + 1.0;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _398 = 1.0 / _286;
    float _400 = _350 * _340;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _404 = _266 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _408 = _266 + _406;
    float _410 = fma(_310, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _414 = 1.0 / _300;
    float _416 = _372 * _368;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = fma(_420, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _428 = 1.0 / _296;
    float _430 = _270 * _398;
    bool _432 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _434 = isnan(_266);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_386;
    float _446 = _444 + 1.0;
    float _448 = fma(_424, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _450 = _404 * _414;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _460;
    float _464 = fma(_454, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _466 = _408 * _428;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = _442 * _446;
    float _474 = -_442;
    float _476 = _474 + 1.0;
    float _478 = fma(_462, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _480 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _482 = isnan(_266);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_362;
    float _494 = _492 + 1.0;
    float _496 = fma(_458, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _498 = fma(_470, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _500 = _362 * _476;
    bool _502 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _504 = isnan(_266);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _490 * _494;
    float _516 = -_490;
    float _518 = _516 + 1.0;
    float _520 = _512 * _518;
    float _522 = -_512;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _526;
    float _530 = _322 * _524;
    float _532 = fma(_528, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _534 = fma(_338, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _536 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_266);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _556 = _546 * _392;
    float _558 = -_546;
    float _560 = _558 + 1.0;
    float _562 = fma(_554, _430, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _564 = fma(_550, _430, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _566 = _464 * _556;
    float _568 = _478 * _556;
    float _570 = fma(_396, _430, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _572 = _426 * _556;
    float _574 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].x, _566);
    float _576 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].y, _568);
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].z, _572);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _580;
    float _584 = fma(_496, _388, _574);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _590;
    float _594 = fma(_498, _388, _576);
    float _596 = fma(_448, _388, _578);
    float _598 = fma(_588, _416, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _600 = fma(_592, _416, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _602 = fma(_582, _416, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _604 = fma(_410, _530, _594);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _610 = fma(_532, _530, _584);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _620 = fma(_534, _530, _596);
    float _622 = fma(_608, _466, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _624 = fma(_614, _466, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _626 = fma(_618, _466, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _628 = fma(_562, _520, _610);
    float _630 = fma(_564, _520, _604);
    float _632 = fma(_570, _520, _620);
    float _634 = in.m_37.x;
    float _636 = in.m_37.y;
    float _638 = in.m_37.z;
    float _640 = fma(_600, _514, _630);
    float _642 = fma(_598, _514, _628);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _648;
    float _652 = fma(_602, _514, _632);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _654;
    float _658 = fma(_646, _450, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _660 = fma(_650, _450, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _662 = fma(_622, _500, _642);
    float _664 = fma(_624, _500, _640);
    float _666 = fma(_656, _450, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _668 = fma(_626, _500, _652);
    float _670 = fma(_658, _472, _662);
    float _672 = fma(_660, _472, _664);
    float _674 = fma(_666, _472, _668);
    float _676 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[150].x, _670);
    float _678 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[150].y, _672);
    float _680 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[150].z, _674);
    float _682 = _676 * _634;
    float _684 = _678 * _636;
    float _686 = _680 * _638;
    bool _688 = !_412;
    float _706;
    if (!_688)
    {
        float _690 = in.m_39.x;
        float _692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _694 = _690 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[14].x, _92);
        float _698 = _696 * _692;
        float _700 = floor(_698);
        float _702 = -_700;
        float _704 = _698 + _702;
        _706 = _704;
        _708 = true;
    }
    else
    {
        _706 = _242;
    }
    _708 = false;
    float _710 = _706;
    float _712 = in.m_39.z;
    float _714 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _716 = log2(_714);
    float _718 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _720 = in.m_39.x;
    float _722 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _726 = 1.0 + _724;
    bool _728 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(1.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _740 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(0.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _752 = _242 * 3.1415927410125732421875;
    float _754 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _750);
    float _756 = _716 * _92;
    float _758 = 1.0 / _726;
    float _760 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _766 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _718);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _772 = _712 * 2.0;
    float _774 = exp2(_756);
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _778 = _776 != 0;
    float _780 = _720 * 2.0;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _790 = _754 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = floor(_772);
    bool _794 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _796 = isnan(_710);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _814 = -_804;
    float _816 = _814 + 1.0;
    float _818 = floor(_780);
    float _820 = -_774;
    float _822 = _820 + 1.0;
    float _824 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _760);
    float _826 = _748 ? _822 : 0.0;
    float _828 = _92 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    bool _830 = _792 > 0.0;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _836 = _792 >= 0.0;
    bool _838 = isnan(_792);
    bool _840 = _836 || _838;
    bool _842 = isnan(0.0);
    bool _844 = _840 || _842;
    float _846 = 1.0 / _764;
    if (_736)
    {
        float _848 = _826 * _758;
        _110 = _848;
    }
    float _850 = _110;
    int _852 = _844 ? 0 : 1;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _860 = _858 != 0;
    int _862 = ~_852;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = 1.0 / _834;
    int _870 = _866;
    int _872 = as_type<int>(_850);
    if (!_830)
    {
        int _874 = ~_852;
        int _876 = _874 + 1;
        _870 = _876;
    }
    int _878 = _870;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _884 = _818 >= 0.0;
    bool _886 = isnan(_818);
    bool _888 = _884 || _886;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    float _894 = 1.0 / _770;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _902 = _900 != 0;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _910 = _908 != 0;
    int _912 = _892 ? 0 : 1;
    float _914 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _916 = _818 > 0.0;
    float _918 = 1.0 / _882;
    float _920 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _766);
    int _922 = ~_912;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = _808 * _868;
    bool _930 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _932 = isnan(_710);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _914);
    float _944 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _824);
    float _946 = in.m_39.y;
    float _948 = 1.0 / _898;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _954 = _926;
    if (!_916)
    {
        int _956 = ~_912;
        int _958 = _956 + 1;
        _954 = _958;
    }
    int _960 = _954;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _966 = _812 * _918;
    float _968 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _970 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _972 = precise::max(_968, _970);
    float _974 = 1.0 / _952;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _980;
    bool _984 = _972 >= 16.0;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _990 = _978 * _894;
    float _992 = _720 + _712;
    float _994 = -_940;
    float _996 = _994 + 1.0;
    float _998 = 1.0 / _964;
    float _1000 = _784 * _948;
    float _1002 = _992 + (-1.0);
    float _1004 = _988 * _846;
    float _1006 = _944 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1008 = float(_878);
    float _1010 = _946 * 2.0;
    float _1012 = _788 * _974;
    float _1014 = floor(_1010);
    float _1016 = float(_960);
    float _1018 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _942);
    bool _1020 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1022 = isnan(_710);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = _982 * _998;
    bool _1034 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1036 = isnan(_710);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = -_1030;
    float _1048 = _1046 + 1.0;
    bool _1050 = !_902;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1056 = _720 + _946;
    float _1058 = _1056 + (-1.0);
    bool _1060 = _1014 >= 0.0;
    bool _1062 = isnan(_1014);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(0.0);
    bool _1068 = _1064 || _1066;
    float _1070 = _1044 * _1048;
    float _1072 = -_1044;
    float _1074 = _1072 + 1.0;
    float _1076 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1078 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1080 = isnan(_710);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1092 = _710 + _1090;
    int _1094 = _1068 ? 0 : 1;
    float _1096 = _940 * _1074;
    bool _1098 = _1014 > 0.0;
    float _1100 = _1088 * _996;
    bool _1102 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1104 = isnan(_710);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = -_1088;
    float _1116 = _1114 + 1.0;
    bool _1118 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1120 = isnan(_710);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = fma(_990, _1092, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1132 = _1112 * _816;
    float _1134 = -_1112;
    float _1136 = _1134 + 1.0;
    float _1138 = _804 * _1116;
    bool _1140 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1142 = isnan(_710);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1154 = _710 + _1152;
    float _1156 = -_1128;
    float _1158 = _1156 + 1.0;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1162 = _710 + _1160;
    float _1164 = _1128 * _1136;
    float _1166 = fma(_1004, _1154, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1168 = _1150 * _1158;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1172 = _710 + _1170;
    float _1174 = fma(_928, _1162, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1178 = _710 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1182 = _710 + _1180;
    float _1184 = _1130 * _1168;
    float _1186 = -_1150;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_966, _1172, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1192 = fma(_1000, _1178, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1194 = fma(_1012, _1182, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1198 = _710 + _1196;
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1184);
    float _1202 = _850 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _1204 = ~_1094;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = fma(_1032, _1198, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1212 = fma(_1166, _1164, _1200);
    float _1214 = _1202 * _738;
    bool _1216 = !_910;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = _920 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1222 = _1208;
    bool _1224 = _984;
    if (!_1098)
    {
        int _1226 = ~_1094;
        int _1228 = _1226 + 1;
        _1222 = _1228;
    }
    int _1230 = _1222;
    float _1232 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1214);
    bool _1234 = !_906;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = fma(_1174, _1132, _1212);
    int _1240 = abs(_1218);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1244 = _1220 + _1242;
    int _1246 = abs(_1236);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1250 = _1006 + _1248;
    int _1252 = abs(_1052);
    float _1254 = _1244 * _1244;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1258 = _790 + _1256;
    float _1260 = floor(_1232);
    float _1262 = float(_1252);
    float _1264 = fma(_1250, _1250, _1254);
    float _1266 = _1232 + 0.25;
    float _1268 = float(_1246);
    float _1270 = fma(_1190, _1138, _1238);
    float _1272 = fma(_1258, _1258, _1264);
    float _1274 = _1262 * _1008;
    float _1276 = floor(_1266);
    float _1278 = _1268 * _1016;
    float _1280 = fma(_1192, _1100, _1270);
    float _1282 = _1274 * (-2.0);
    float _1284 = float(_1240);
    float _1286 = float(_1230);
    float _1288 = fma(_1076, _1282, _1076);
    float _1290 = rsqrt(_1272);
    float _1292 = -_1260;
    float _1294 = _1232 + _1292;
    float _1296 = _720 + (-0.5);
    float _1298 = fma(_1194, _1096, _1280);
    float _1300 = _1232 * 6.283185482025146484375;
    float _1302 = _1284 * _1286;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1306 = fma(_1210, _1070, _1298);
    float _1308 = _1300 * 0.15915493667125701904296875;
    float _1310 = _1302 * (-2.0);
    float _1312 = -_1276;
    float _1314 = _1266 + _1312;
    float _1316 = _752 * 0.15915493667125701904296875;
    float _1318 = _712 + (-0.5);
    float _1320 = fma(_1288, _850, _1304);
    float _1322 = fma(_1054, _1310, _1054);
    float _1324 = _828 * 0.15915493667125701904296875;
    float _1326 = _1244 * _1290;
    float _1328 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1306);
    float _1330 = _1308 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    bool _1334 = _1294 >= 0.5;
    bool _1336 = isnan(_1294);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan(0.5);
    bool _1342 = _1338 || _1340;
    float _1344 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1346 = !_856;
    int _1348 = _1346 ? 0 : 1;
    float _1350 = _1250 * _1290;
    float _1352 = -_1326;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    bool _1356 = !_778;
    int _1358 = _1356 ? 0 : 1;
    float _1360 = -_1350;
    float _1362 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    int _1364 = abs(_1348);
    float _1366 = _1354 * _1354;
    bool _1368 = !_1342;
    float _1370 = _1368 ? 0.5 : (-0.5);
    float _1372 = _1258 * _1290;
    int _1374 = abs(_1358);
    float _1376 = fma(_1362, _1362, _1366);
    float _1378 = float(_1364);
    float _1380 = -_1372;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1386 = _1384 * 2.0;
    bool _1388 = _1314 > 0.5;
    float _1390 = _1324 * 6.283185482025146484375;
    float _1392 = sin(_1390);
    float _1394 = fma(_1382, _1382, _1376);
    float _1396 = _1378 * _1386;
    float _1398 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1400 = float(_1374);
    float _1402 = _1320 * 0.15915493667125701904296875;
    bool _1404 = !_860;
    int _1406 = _1404 ? 0 : 1;
    float _1408 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1410 = _946 + _712;
    float _1412 = fma(_1400, _1398, _1396);
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1416 = _1314;
    if (_1388)
    {
        float _1418 = -_1314;
        float _1420 = _1418 + 1.0;
        _1416 = _1420;
    }
    float _1422 = _1416;
    int _1424 = abs(_1406);
    float _1426 = fma(_1322, _850, _1344);
    float _1428 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1430 = _984 ? _1414 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1432 = fma(_1422, 4.0, -1.0);
    float _1434 = _1392 * _1408;
    float _1436 = float(_1424);
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = sin(_1438);
    float _1442 = _984 ? _1428 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1446 = abs(_1430);
    bool _1448 = _1446 != 0.0;
    bool _1450 = isnan(_1446);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = _1426 * 0.15915493667125701904296875;
    float _1460 = fma(_1436, _1444, _1412);
    float _1462 = _1402 * 6.283185482025146484375;
    float _1464 = cos(_1462);
    float _1466 = abs(_1442);
    bool _1468 = _1466 == 0.0;
    bool _1470 = !_1456;
    bool _1472 = _1468 && _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[191].w + _1474;
    float _1478 = abs(_1442);
    bool _1480 = _1478 == 0.0;
    float _1482 = _1460 * 3.1415927410125732421875;
    float _1484 = _1316 * 6.283185482025146484375;
    float _1486 = sin(_1484);
    float _1488 = _1410 + (-1.0);
    float _1490 = in.m_41.x;
    float _1492 = in.m_41.y;
    float _1494 = in.m_41.z;
    float _1496 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1498 = _1278 * (-2.0);
    float _1500 = _1434 * 0.15915493667125701904296875;
    float _1502 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1504 = 1.0 / _1476;
    float _1506 = _946 + (-0.5);
    float _1508 = fma(_1482, _1498, _1482);
    int _1510 = as_type<int>(_1496);
    if (_1472)
    {
        bool _1512 = as_type<int>(_1442) >= 0;
        _1224 = _1512;
    }
    bool _1514 = _1224;
    float _1516 = fma(_1496, _1498, _1496);
    float _1518 = -_1502;
    float _1520 = precise::max(_1518, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _1522 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1508);
    int _1524 = _1514 ? (-1) : 0;
    if (_1472)
    {
        int _1526 = _1514 ? 0 : 1078530011;
        _1510 = _1526;
    }
    int _1528 = _1510;
    float _1530 = _1458 * 6.283185482025146484375;
    float _1532 = cos(_1530);
    float _1534 = precise::min(_1520, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _1536 = fma(_1516, _850, _1522);
    if (_1472)
    {
        int _1538 = int(0x80000000) & as_type<int>(_1430);
        int _1540 = _1528 | _1538;
        _872 = _1540;
    }
    int _1542 = _872;
    float _1544 = sqrt(_1394);
    float _1546 = _1500 * 6.283185482025146484375;
    float _1548 = sin(_1546);
    bool _1550 = !_1456;
    bool _1552 = _1550 && _1480;
    int _1554 = _1542;
    float _1556 = as_type<float>(_1542);
    if (!_1552)
    {
        float _1558 = abs(_1430);
        bool _1560 = _1558 != as_type<float>(0x7f800000u /* inf */);
        bool _1562 = isnan(_1558);
        bool _1564 = _1560 || _1562;
        bool _1566 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1568 = _1564 || _1566;
        float _1570 = abs(_1442);
        bool _1572 = _1570 == as_type<float>(0x7f800000u /* inf */);
        float _1574 = abs(_1442);
        bool _1576 = _1574 == as_type<float>(0x7f800000u /* inf */);
        bool _1578 = !_1568;
        bool _1580 = _1576 && _1578;
        if (_1580)
        {
            bool _1582 = as_type<int>(_1442) >= 0;
            _1524 = _1582 ? (-1) : 0;
        }
        int _1584 = _1524;
        if (_1580)
        {
            _1554 = 1075235812;
        }
        int _1586 = _1554;
        int _1588 = _1586;
        if (_1580)
        {
            int _1590 = ~_1584;
            int _1592 = (_1590 != 0) ? _1586 : 1061752795;
            _1588 = _1592;
        }
        int _1594 = _1588;
        float _1596 = as_type<float>(_1594);
        if (_1580)
        {
            int _1598 = int(0x80000000) & as_type<int>(_1430);
            int _1600 = _1594 | _1598;
            _1596 = as_type<float>(_1600);
        }
        float _1602 = _1596;
        bool _1604 = !_1568;
        bool _1606 = _1604 && _1572;
        _1556 = _1602;
        if (!_1606)
        {
            float _1608 = abs(_1430);
            float _1610 = abs(_1442);
            float _1612 = precise::max(_1608, _1610);
            float _1614 = abs(_1430);
            float _1616 = abs(_1442);
            float _1618 = precise::min(_1614, _1616);
            float _1620 = 1.0 / _1612;
            float _1622 = abs(_1430);
            float _1624 = abs(_1442);
            bool _1626 = _1622 > _1624;
            bool _1628 = as_type<int>(_1442) >= 0;
            float _1630 = _1618 * _1620;
            float _1632 = abs(_1430);
            float _1634 = abs(_1442);
            float _1636 = _1632 + _1634;
            int _1638 = as_type<int>(_1430) & int(0x80000000);
            float _1640 = _1630 * _1630;
            bool _1642 = _1636 > as_type<float>(0x7f800000u /* inf */);
            bool _1644 = isnan(_1636);
            bool _1646 = _1642 || _1644;
            bool _1648 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1650 = _1646 || _1648;
            float _1652 = _1640 + 11.33538818359375;
            float _1654 = fma(_1640, _1652, 28.84246826171875);
            float _1656 = fma(_1640, _1654, 19.6966705322265625);
            float _1658 = fma(_1640, -0.82336294651031494140625, -5.674867153167724609375);
            float _1660 = fma(_1640, _1658, -6.565555095672607421875);
            float _1662 = 1.0 / _1656;
            float _1664 = _1640 * _1660;
            float _1666 = _1630 * _1664;
            float _1668 = fma(_1666, _1662, _1630);
            float _1670 = _1668;
            _1556 = _1636;
            if (_1626)
            {
                float _1672 = -_1668;
                float _1674 = _1672 + 1.57079637050628662109375;
                _1670 = _1674;
            }
            float _1676 = _1670;
            int _1678 = as_type<int>(_1676);
            if (!_1628)
            {
                float _1680 = -_1676;
                float _1682 = _1680 + 3.1415927410125732421875;
                _1678 = as_type<int>(_1682);
            }
            int _1684 = _1678;
            if (!_1650)
            {
                int _1686 = _1638 | _1684;
                _1556 = as_type<float>(_1686);
            }
        }
    }
    float _1688 = _1556;
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1692 = _1534 + _1690;
    float _1694 = 0.0 + _1486;
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = _1500 * 6.283185482025146484375;
    float _1700 = cos(_1698);
    float _1702 = _1536 + _1688;
    float _1704 = _1692 * _1504;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1708 = _1290 * _1544;
    float _1710 = _1702 * 0.15915493667125701904296875;
    float _1712 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1714 = fma(_1706, _1704, _1492);
    float _1716 = _1458 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1722 = _1708 * _1712;
    float _1724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1714);
    float _1726 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1728 = _1708 * _1720;
    bool _1730 = _946 > 0.5;
    float _1732 = _1722 * _1724;
    float _1734 = _1710 * 6.283185482025146484375;
    float _1736 = sin(_1734);
    float _1738 = _1700 * _1490;
    float _1740 = _1548 * _1490;
    float _1742 = _1708 * _1726;
    float _1744 = _1532 * _1732;
    float _1746 = fma(_1548, _1494, _1738);
    float _1748 = -_1740;
    float _1750 = fma(_1700, _1494, _1748);
    float _1752 = _1710 * 6.283185482025146484375;
    float _1754 = cos(_1752);
    float _1756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1746);
    float _1758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1750);
    float _1760 = _1440 * _1744;
    float _1762 = _1718 * _1732;
    float _1764 = _1728 * _1756;
    float _1766 = _1742 * _1758;
    float _1768 = _1464 * _1736;
    float _1770 = _1440 * _1736;
    float _1772 = _1736 * _1532;
    float _1774 = _1440 * _1754;
    float _1776 = _1464 * _1754;
    float _1778 = _1754 * _1532;
    float _1780 = _1464 * _1744;
    float _1782 = -_1768;
    float _1784 = fma(_1718, _1774, _1782);
    float _1786 = -_1774;
    float _1788 = fma(_1718, _1768, _1786);
    float _1790 = -_1762;
    float _1792 = fma(_1778, _1764, _1790);
    float _1794 = fma(_1784, _1764, _1760);
    float _1796 = fma(_1718, _1770, _1776);
    float _1798 = fma(_1772, _1766, _1792);
    float _1800 = in.m_43.x;
    float _1802 = fma(_1718, _1776, _1770);
    float _1804 = fma(_1796, _1766, _1794);
    float _1806 = _1006 + _1798;
    float _1808 = fma(_1802, _1764, _1780);
    float _1810 = _790 + _1804;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1814 = _1806 + _1812;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1818 = _1816 != 0;
    float _1820 = fma(_1788, _1766, _1808);
    float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1824 = _1810 + _1822;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1828 = _1826 != 0;
    bool _1830 = _720 > 0.5;
    bool _1832 = _1830 && _1818;
    float _1834 = _1824 * _1824;
    float _1836 = _1220 + _1820;
    float _1838 = fma(_1814, _1814, _1834);
    float _1840 = in.m_43.y;
    float _1842 = sqrt(_1838);
    float _1844 = _1764;
    float _1846 = _1800;
    float _1848 = _1820;
    if (_1818)
    {
        _1844 = _1800;
    }
    float _1850 = _1844;
    float _1852 = _1850;
    if (_1832)
    {
        float _1854 = -_1850;
        float _1856 = _1854 + 1.0;
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = _1858;
    if (_1818)
    {
        _1846 = _1858;
    }
    float _1862 = _1846;
    bool _1864 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = -_1840;
    float _1868 = _1866 + 1.0;
    float _1870 = _1840;
    float _1872 = _1868;
    if (_1828)
    {
        float _1874 = _1730 ? _1868 : _1840;
        _1870 = _1874;
    }
    float _1876 = _1870;
    if (!_1864)
    {
        _1872 = _1806;
    }
    float _1878 = _1872;
    float _1880 = _1878;
    if (!_1864)
    {
        _1848 = _1810;
    }
    float _1882 = _1848;
    float _1884 = _1882;
    if (!_1864)
    {
        _1860 = _1836;
    }
    float _1886 = _1860;
    bool _1888 = !_1864;
    float _1890 = _1886;
    if (!_1888)
    {
        float _1892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1896 = _1842 + _1894;
        float _1898 = rsqrt(_1838);
        float _1900 = _1896 * _1892;
        float _1902 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1904 = _1900 * 0.15915493667125701904296875;
        float _1906 = _1904 * 6.283185482025146484375;
        float _1908 = sin(_1906);
        float _1910 = _1904 * 6.283185482025146484375;
        float _1912 = cos(_1910);
        float _1914 = fma(_1908, _1902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1916 = _1898 * _1914;
        float _1918 = _1912 + (-1.0);
        float _1920 = fma(_1814, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1922 = fma(_1824, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1924 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1926 = fma(_1836, _1912, _1924);
        _1890 = _1926;
        _1880 = _1920;
        _1884 = _1922;
    }
    float _1928 = _1890;
    float _1930 = _1880;
    float _1932 = _1884;
    float _1934 = -_1326;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1928);
    float _1938 = -_1350;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1930);
    float _1942 = -_1372;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1932);
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1948 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1950 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1952 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1954 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1956 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1948);
    float _1958 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1950);
    float _1960 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1952);
    float _1962 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1954);
    float _1964 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1956);
    float _1966 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1968 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1960);
    float _1970 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1962);
    float _1972 = _1964 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1976 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1978 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1984 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1986 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1988 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1980);
    float _1990 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1982);
    float _1994 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1984);
    float _1996 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1986);
    float _1998 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1988);
    float _2000 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1992);
    float _2002 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2004 = _1990 * _1974;
    float _2006 = _1970 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2008 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1994);
    float _2010 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1996);
    float _2012 = _2002 * _1946;
    float _2014 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2000);
    float _2016 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2018 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1998);
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2008);
    float _2022 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2010);
    out.m_33.x = 1.0;
    out.m_45.w = _2016;
    out.m_47.x = _2012;
    out.m_47.y = _2004;
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _2014;
    out.gl_Position.w = _2022;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _708 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_30.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    float _74 = as_type<float>(_66);
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _72;
    if (!_70)
    {
        out.m_33.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_82);
        out.gl_Position.z = _2080;
    }
    if (!_70)
    {
        return out;
    }
    float _86 = in.m_35.w;
    float _88 = float(_66);
    float _90 = -_86;
    float _92 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_86);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    bool _104 = _92 >= _88;
    bool _106 = !_102;
    bool _108 = _104 || _106;
    float _110 = _92;
    if (_108)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _74;
    if (_108)
    {
        out.m_33.x = 0.0;
    }
    if (_108)
    {
        float _114 = _112 * 5.0;
        _84 = as_type<int>(_114);
    }
    int _116 = _84;
    if (_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2144 = as_type<float>(_116);
        out.gl_Position.z = _2144;
    }
    if (_108)
    {
        return out;
    }
    float _118 = in.m_37.w;
    float _120 = 1.0 / _88;
    float _122 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _124 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _126 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = in.m_35.x;
    float _136 = in.m_35.y;
    float _138 = in.m_35.z;
    float _140 = in.m_30.x;
    float _142 = in.m_30.y;
    float _144 = in.m_30.z;
    float _146 = 0.0;
    float _148 = _122;
    if (!_132)
    {
        float _150 = _122 * _122;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_132)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_132;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _122 * _168;
        float _178 = 1.0 / _172;
        float _180 = _174 * 0.693147182464599609375;
        float _182 = exp2(_176);
        float _184 = 1.0 / _180;
        float _186 = _182 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _184, _122);
        float _192 = _190 * _178;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_132;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _122 * _202;
        float _212 = exp2(_210);
        float _214 = -_212;
        float _216 = _214 + 1.0;
        float _218 = _216 * _208;
        _148 = _218;
    }
    float _220 = _148;
    bool _222 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _226 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _228 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _230 = fma(_220, _134, _224);
    float _232 = fma(_220, _136, _226);
    float _234 = fma(_220, _138, _228);
    float _236 = fma(_230, _118, _140);
    float _238 = fma(_232, _118, _142);
    float _240 = fma(_234, _118, _144);
    float _242 = _92 * _120;
    bool _244 = !_222;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _92);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        _262 = _242;
    }
    _264 = false;
    float _266 = _262;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _270 = _266 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _288 = 1.0 / _274;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _298;
    float _302 = 1.0 / _278;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _266 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _308;
    bool _312 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_266);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_266);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _336;
    float _340 = 1.0 / _282;
    float _342 = _306 * _288;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _266 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = _266 + _348;
    bool _352 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _354 = isnan(_266);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -_322;
    float _366 = _364 + 1.0;
    float _368 = 1.0 / _292;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _372 = _266 + _370;
    float _374 = _346 * _302;
    bool _376 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _378 = isnan(_266);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _334 * _366;
    float _390 = -_334;
    float _392 = _390 + 1.0;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _398 = 1.0 / _286;
    float _400 = _350 * _340;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _404 = _266 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _408 = _266 + _406;
    float _410 = fma(_310, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _414 = 1.0 / _300;
    float _416 = _372 * _368;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = fma(_420, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _428 = 1.0 / _296;
    float _430 = _270 * _398;
    bool _432 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _434 = isnan(_266);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_386;
    float _446 = _444 + 1.0;
    float _448 = fma(_424, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _450 = _404 * _414;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _460;
    float _464 = fma(_454, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _466 = _408 * _428;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = _442 * _446;
    float _474 = -_442;
    float _476 = _474 + 1.0;
    float _478 = fma(_462, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _480 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _482 = isnan(_266);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_362;
    float _494 = _492 + 1.0;
    float _496 = fma(_458, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _498 = fma(_470, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _500 = _362 * _476;
    bool _502 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _504 = isnan(_266);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _490 * _494;
    float _516 = -_490;
    float _518 = _516 + 1.0;
    float _520 = _512 * _518;
    float _522 = -_512;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _526;
    float _530 = _322 * _524;
    float _532 = fma(_528, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _534 = fma(_338, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _536 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_266);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _556 = _546 * _392;
    float _558 = -_546;
    float _560 = _558 + 1.0;
    float _562 = fma(_554, _430, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _564 = fma(_550, _430, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _566 = _464 * _556;
    float _568 = _478 * _556;
    float _570 = fma(_396, _430, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _572 = _426 * _556;
    float _574 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].x, _566);
    float _576 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].y, _568);
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].z, _572);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _580;
    float _584 = fma(_496, _388, _574);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _590;
    float _594 = fma(_498, _388, _576);
    float _596 = fma(_448, _388, _578);
    float _598 = fma(_588, _416, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _600 = fma(_592, _416, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _602 = fma(_582, _416, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _604 = fma(_410, _530, _594);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _610 = fma(_532, _530, _584);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _620 = fma(_534, _530, _596);
    float _622 = fma(_608, _466, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _624 = fma(_614, _466, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _626 = fma(_618, _466, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _628 = fma(_562, _520, _610);
    float _630 = fma(_564, _520, _604);
    float _632 = fma(_570, _520, _620);
    float _634 = in.m_37.x;
    float _636 = in.m_37.y;
    float _638 = in.m_37.z;
    float _640 = fma(_600, _514, _630);
    float _642 = fma(_598, _514, _628);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _648;
    float _652 = fma(_602, _514, _632);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _654;
    float _658 = fma(_646, _450, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _660 = fma(_650, _450, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _662 = fma(_622, _500, _642);
    float _664 = fma(_624, _500, _640);
    float _666 = fma(_656, _450, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _668 = fma(_626, _500, _652);
    float _670 = fma(_658, _472, _662);
    float _672 = fma(_660, _472, _664);
    float _674 = fma(_666, _472, _668);
    float _676 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[150].x, _670);
    float _678 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[150].y, _672);
    float _680 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[150].z, _674);
    float _682 = _676 * _634;
    float _684 = _678 * _636;
    float _686 = _680 * _638;
    bool _688 = !_412;
    float _706;
    if (!_688)
    {
        float _690 = in.m_39.x;
        float _692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _694 = _690 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[14].x, _92);
        float _698 = _696 * _692;
        float _700 = floor(_698);
        float _702 = -_700;
        float _704 = _698 + _702;
        _706 = _704;
        _708 = true;
    }
    else
    {
        _706 = _242;
    }
    _708 = false;
    float _710 = _706;
    float _712 = in.m_39.z;
    float _714 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _716 = log2(_714);
    float _718 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _720 = in.m_39.x;
    float _722 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _726 = 1.0 + _724;
    bool _728 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(1.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _740 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(0.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _752 = _242 * 3.1415927410125732421875;
    float _754 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _750);
    float _756 = _716 * _92;
    float _758 = 1.0 / _726;
    float _760 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _766 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _718);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _772 = _712 * 2.0;
    float _774 = exp2(_756);
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _778 = _776 != 0;
    float _780 = _720 * 2.0;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _790 = _754 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = floor(_772);
    bool _794 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _796 = isnan(_710);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _814 = -_804;
    float _816 = _814 + 1.0;
    float _818 = floor(_780);
    float _820 = -_774;
    float _822 = _820 + 1.0;
    float _824 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _760);
    float _826 = _748 ? _822 : 0.0;
    float _828 = _92 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    bool _830 = _792 > 0.0;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _836 = _792 >= 0.0;
    bool _838 = isnan(_792);
    bool _840 = _836 || _838;
    bool _842 = isnan(0.0);
    bool _844 = _840 || _842;
    float _846 = 1.0 / _764;
    if (_736)
    {
        float _848 = _826 * _758;
        _110 = _848;
    }
    float _850 = _110;
    int _852 = _844 ? 0 : 1;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _860 = _858 != 0;
    int _862 = ~_852;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = 1.0 / _834;
    int _870 = _866;
    int _872 = as_type<int>(_850);
    if (!_830)
    {
        int _874 = ~_852;
        int _876 = _874 + 1;
        _870 = _876;
    }
    int _878 = _870;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _884 = _818 >= 0.0;
    bool _886 = isnan(_818);
    bool _888 = _884 || _886;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    float _894 = 1.0 / _770;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _902 = _900 != 0;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _910 = _908 != 0;
    int _912 = _892 ? 0 : 1;
    float _914 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _916 = _818 > 0.0;
    float _918 = 1.0 / _882;
    float _920 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _766);
    int _922 = ~_912;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = _808 * _868;
    bool _930 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _932 = isnan(_710);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _914);
    float _944 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _824);
    float _946 = in.m_39.y;
    float _948 = 1.0 / _898;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _954 = _926;
    if (!_916)
    {
        int _956 = ~_912;
        int _958 = _956 + 1;
        _954 = _958;
    }
    int _960 = _954;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _966 = _812 * _918;
    float _968 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _970 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _972 = precise::max(_968, _970);
    float _974 = 1.0 / _952;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _980;
    bool _984 = _972 >= 16.0;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _990 = _978 * _894;
    float _992 = _720 + _712;
    float _994 = -_940;
    float _996 = _994 + 1.0;
    float _998 = 1.0 / _964;
    float _1000 = _784 * _948;
    float _1002 = _992 + (-1.0);
    float _1004 = _988 * _846;
    float _1006 = _944 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1008 = float(_878);
    float _1010 = _946 * 2.0;
    float _1012 = _788 * _974;
    float _1014 = floor(_1010);
    float _1016 = float(_960);
    float _1018 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _942);
    bool _1020 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1022 = isnan(_710);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = _982 * _998;
    bool _1034 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1036 = isnan(_710);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = -_1030;
    float _1048 = _1046 + 1.0;
    bool _1050 = !_902;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1056 = _720 + _946;
    float _1058 = _1056 + (-1.0);
    bool _1060 = _1014 >= 0.0;
    bool _1062 = isnan(_1014);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(0.0);
    bool _1068 = _1064 || _1066;
    float _1070 = _1044 * _1048;
    float _1072 = -_1044;
    float _1074 = _1072 + 1.0;
    float _1076 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1078 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1080 = isnan(_710);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1092 = _710 + _1090;
    int _1094 = _1068 ? 0 : 1;
    float _1096 = _940 * _1074;
    bool _1098 = _1014 > 0.0;
    float _1100 = _1088 * _996;
    bool _1102 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1104 = isnan(_710);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = -_1088;
    float _1116 = _1114 + 1.0;
    bool _1118 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1120 = isnan(_710);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = fma(_990, _1092, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1132 = _1112 * _816;
    float _1134 = -_1112;
    float _1136 = _1134 + 1.0;
    float _1138 = _804 * _1116;
    bool _1140 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1142 = isnan(_710);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1154 = _710 + _1152;
    float _1156 = -_1128;
    float _1158 = _1156 + 1.0;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1162 = _710 + _1160;
    float _1164 = _1128 * _1136;
    float _1166 = fma(_1004, _1154, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1168 = _1150 * _1158;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1172 = _710 + _1170;
    float _1174 = fma(_928, _1162, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1178 = _710 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1182 = _710 + _1180;
    float _1184 = _1130 * _1168;
    float _1186 = -_1150;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_966, _1172, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1192 = fma(_1000, _1178, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1194 = fma(_1012, _1182, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1198 = _710 + _1196;
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1184);
    float _1202 = _850 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _1204 = ~_1094;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = fma(_1032, _1198, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1212 = fma(_1166, _1164, _1200);
    float _1214 = _1202 * _738;
    bool _1216 = !_910;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = _920 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1222 = _1208;
    bool _1224 = _984;
    if (!_1098)
    {
        int _1226 = ~_1094;
        int _1228 = _1226 + 1;
        _1222 = _1228;
    }
    int _1230 = _1222;
    float _1232 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1214);
    bool _1234 = !_906;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = fma(_1174, _1132, _1212);
    int _1240 = abs(_1218);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1244 = _1220 + _1242;
    int _1246 = abs(_1236);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1250 = _1006 + _1248;
    int _1252 = abs(_1052);
    float _1254 = _1244 * _1244;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1258 = _790 + _1256;
    float _1260 = floor(_1232);
    float _1262 = float(_1252);
    float _1264 = fma(_1250, _1250, _1254);
    float _1266 = _1232 + 0.25;
    float _1268 = float(_1246);
    float _1270 = fma(_1190, _1138, _1238);
    float _1272 = fma(_1258, _1258, _1264);
    float _1274 = _1262 * _1008;
    float _1276 = floor(_1266);
    float _1278 = _1268 * _1016;
    float _1280 = fma(_1192, _1100, _1270);
    float _1282 = _1274 * (-2.0);
    float _1284 = float(_1240);
    float _1286 = float(_1230);
    float _1288 = fma(_1076, _1282, _1076);
    float _1290 = rsqrt(_1272);
    float _1292 = -_1260;
    float _1294 = _1232 + _1292;
    float _1296 = _720 + (-0.5);
    float _1298 = fma(_1194, _1096, _1280);
    float _1300 = _1232 * 6.283185482025146484375;
    float _1302 = _1284 * _1286;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1306 = fma(_1210, _1070, _1298);
    float _1308 = _1300 * 0.15915493667125701904296875;
    float _1310 = _1302 * (-2.0);
    float _1312 = -_1276;
    float _1314 = _1266 + _1312;
    float _1316 = _752 * 0.15915493667125701904296875;
    float _1318 = _712 + (-0.5);
    float _1320 = fma(_1288, _850, _1304);
    float _1322 = fma(_1054, _1310, _1054);
    float _1324 = _828 * 0.15915493667125701904296875;
    float _1326 = _1244 * _1290;
    float _1328 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1306);
    float _1330 = _1308 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    bool _1334 = _1294 >= 0.5;
    bool _1336 = isnan(_1294);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan(0.5);
    bool _1342 = _1338 || _1340;
    float _1344 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1346 = !_856;
    int _1348 = _1346 ? 0 : 1;
    float _1350 = _1250 * _1290;
    float _1352 = -_1326;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    bool _1356 = !_778;
    int _1358 = _1356 ? 0 : 1;
    float _1360 = -_1350;
    float _1362 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    int _1364 = abs(_1348);
    float _1366 = _1354 * _1354;
    bool _1368 = !_1342;
    float _1370 = _1368 ? 0.5 : (-0.5);
    float _1372 = _1258 * _1290;
    int _1374 = abs(_1358);
    float _1376 = fma(_1362, _1362, _1366);
    float _1378 = float(_1364);
    float _1380 = -_1372;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1386 = _1384 * 2.0;
    bool _1388 = _1314 > 0.5;
    float _1390 = _1324 * 6.283185482025146484375;
    float _1392 = sin(_1390);
    float _1394 = fma(_1382, _1382, _1376);
    float _1396 = _1378 * _1386;
    float _1398 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1400 = float(_1374);
    float _1402 = _1320 * 0.15915493667125701904296875;
    bool _1404 = !_860;
    int _1406 = _1404 ? 0 : 1;
    float _1408 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1410 = _946 + _712;
    float _1412 = fma(_1400, _1398, _1396);
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1416 = _1314;
    if (_1388)
    {
        float _1418 = -_1314;
        float _1420 = _1418 + 1.0;
        _1416 = _1420;
    }
    float _1422 = _1416;
    int _1424 = abs(_1406);
    float _1426 = fma(_1322, _850, _1344);
    float _1428 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1430 = _984 ? _1414 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1432 = fma(_1422, 4.0, -1.0);
    float _1434 = _1392 * _1408;
    float _1436 = float(_1424);
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = sin(_1438);
    float _1442 = _984 ? _1428 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1446 = abs(_1430);
    bool _1448 = _1446 != 0.0;
    bool _1450 = isnan(_1446);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = _1426 * 0.15915493667125701904296875;
    float _1460 = fma(_1436, _1444, _1412);
    float _1462 = _1402 * 6.283185482025146484375;
    float _1464 = cos(_1462);
    float _1466 = abs(_1442);
    bool _1468 = _1466 == 0.0;
    bool _1470 = !_1456;
    bool _1472 = _1468 && _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[191].w + _1474;
    float _1478 = abs(_1442);
    bool _1480 = _1478 == 0.0;
    float _1482 = _1460 * 3.1415927410125732421875;
    float _1484 = _1316 * 6.283185482025146484375;
    float _1486 = sin(_1484);
    float _1488 = _1410 + (-1.0);
    float _1490 = in.m_41.x;
    float _1492 = in.m_41.y;
    float _1494 = in.m_41.z;
    float _1496 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1498 = _1278 * (-2.0);
    float _1500 = _1434 * 0.15915493667125701904296875;
    float _1502 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1504 = 1.0 / _1476;
    float _1506 = _946 + (-0.5);
    float _1508 = fma(_1482, _1498, _1482);
    int _1510 = as_type<int>(_1496);
    if (_1472)
    {
        bool _1512 = as_type<int>(_1442) >= 0;
        _1224 = _1512;
    }
    bool _1514 = _1224;
    float _1516 = fma(_1496, _1498, _1496);
    float _1518 = -_1502;
    float _1520 = precise::max(_1518, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _1522 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1508);
    int _1524 = _1514 ? (-1) : 0;
    if (_1472)
    {
        int _1526 = _1514 ? 0 : 1078530011;
        _1510 = _1526;
    }
    int _1528 = _1510;
    float _1530 = _1458 * 6.283185482025146484375;
    float _1532 = cos(_1530);
    float _1534 = precise::min(_1520, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _1536 = fma(_1516, _850, _1522);
    if (_1472)
    {
        int _1538 = int(0x80000000) & as_type<int>(_1430);
        int _1540 = _1528 | _1538;
        _872 = _1540;
    }
    int _1542 = _872;
    float _1544 = sqrt(_1394);
    float _1546 = _1500 * 6.283185482025146484375;
    float _1548 = sin(_1546);
    bool _1550 = !_1456;
    bool _1552 = _1550 && _1480;
    int _1554 = _1542;
    float _1556 = as_type<float>(_1542);
    if (!_1552)
    {
        float _1558 = abs(_1430);
        bool _1560 = _1558 != as_type<float>(0x7f800000u /* inf */);
        bool _1562 = isnan(_1558);
        bool _1564 = _1560 || _1562;
        bool _1566 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1568 = _1564 || _1566;
        float _1570 = abs(_1442);
        bool _1572 = _1570 == as_type<float>(0x7f800000u /* inf */);
        float _1574 = abs(_1442);
        bool _1576 = _1574 == as_type<float>(0x7f800000u /* inf */);
        bool _1578 = !_1568;
        bool _1580 = _1576 && _1578;
        if (_1580)
        {
            bool _1582 = as_type<int>(_1442) >= 0;
            _1524 = _1582 ? (-1) : 0;
        }
        int _1584 = _1524;
        if (_1580)
        {
            _1554 = 1075235812;
        }
        int _1586 = _1554;
        int _1588 = _1586;
        if (_1580)
        {
            int _1590 = ~_1584;
            int _1592 = (_1590 != 0) ? _1586 : 1061752795;
            _1588 = _1592;
        }
        int _1594 = _1588;
        float _1596 = as_type<float>(_1594);
        if (_1580)
        {
            int _1598 = int(0x80000000) & as_type<int>(_1430);
            int _1600 = _1594 | _1598;
            _1596 = as_type<float>(_1600);
        }
        float _1602 = _1596;
        bool _1604 = !_1568;
        bool _1606 = _1604 && _1572;
        _1556 = _1602;
        if (!_1606)
        {
            float _1608 = abs(_1430);
            float _1610 = abs(_1442);
            float _1612 = precise::max(_1608, _1610);
            float _1614 = abs(_1430);
            float _1616 = abs(_1442);
            float _1618 = precise::min(_1614, _1616);
            float _1620 = 1.0 / _1612;
            float _1622 = abs(_1430);
            float _1624 = abs(_1442);
            bool _1626 = _1622 > _1624;
            bool _1628 = as_type<int>(_1442) >= 0;
            float _1630 = _1618 * _1620;
            float _1632 = abs(_1430);
            float _1634 = abs(_1442);
            float _1636 = _1632 + _1634;
            int _1638 = as_type<int>(_1430) & int(0x80000000);
            float _1640 = _1630 * _1630;
            bool _1642 = _1636 > as_type<float>(0x7f800000u /* inf */);
            bool _1644 = isnan(_1636);
            bool _1646 = _1642 || _1644;
            bool _1648 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1650 = _1646 || _1648;
            float _1652 = _1640 + 11.33538818359375;
            float _1654 = fma(_1640, _1652, 28.84246826171875);
            float _1656 = fma(_1640, _1654, 19.6966705322265625);
            float _1658 = fma(_1640, -0.82336294651031494140625, -5.674867153167724609375);
            float _1660 = fma(_1640, _1658, -6.565555095672607421875);
            float _1662 = 1.0 / _1656;
            float _1664 = _1640 * _1660;
            float _1666 = _1630 * _1664;
            float _1668 = fma(_1666, _1662, _1630);
            float _1670 = _1668;
            _1556 = _1636;
            if (_1626)
            {
                float _1672 = -_1668;
                float _1674 = _1672 + 1.57079637050628662109375;
                _1670 = _1674;
            }
            float _1676 = _1670;
            int _1678 = as_type<int>(_1676);
            if (!_1628)
            {
                float _1680 = -_1676;
                float _1682 = _1680 + 3.1415927410125732421875;
                _1678 = as_type<int>(_1682);
            }
            int _1684 = _1678;
            if (!_1650)
            {
                int _1686 = _1638 | _1684;
                _1556 = as_type<float>(_1686);
            }
        }
    }
    float _1688 = _1556;
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1692 = _1534 + _1690;
    float _1694 = 0.0 + _1486;
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = _1500 * 6.283185482025146484375;
    float _1700 = cos(_1698);
    float _1702 = _1536 + _1688;
    float _1704 = _1692 * _1504;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1708 = _1290 * _1544;
    float _1710 = _1702 * 0.15915493667125701904296875;
    float _1712 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1714 = fma(_1706, _1704, _1492);
    float _1716 = _1458 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1722 = _1708 * _1712;
    float _1724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1714);
    float _1726 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1728 = _1708 * _1720;
    bool _1730 = _946 > 0.5;
    float _1732 = _1722 * _1724;
    float _1734 = _1710 * 6.283185482025146484375;
    float _1736 = sin(_1734);
    float _1738 = _1700 * _1490;
    float _1740 = _1548 * _1490;
    float _1742 = _1708 * _1726;
    float _1744 = _1532 * _1732;
    float _1746 = fma(_1548, _1494, _1738);
    float _1748 = -_1740;
    float _1750 = fma(_1700, _1494, _1748);
    float _1752 = _1710 * 6.283185482025146484375;
    float _1754 = cos(_1752);
    float _1756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1746);
    float _1758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1750);
    float _1760 = _1440 * _1744;
    float _1762 = _1718 * _1732;
    float _1764 = _1728 * _1756;
    float _1766 = _1742 * _1758;
    float _1768 = _1464 * _1736;
    float _1770 = _1440 * _1736;
    float _1772 = _1736 * _1532;
    float _1774 = _1440 * _1754;
    float _1776 = _1464 * _1754;
    float _1778 = _1754 * _1532;
    float _1780 = _1464 * _1744;
    float _1782 = -_1768;
    float _1784 = fma(_1718, _1774, _1782);
    float _1786 = -_1774;
    float _1788 = fma(_1718, _1768, _1786);
    float _1790 = -_1762;
    float _1792 = fma(_1778, _1764, _1790);
    float _1794 = fma(_1784, _1764, _1760);
    float _1796 = fma(_1718, _1770, _1776);
    float _1798 = fma(_1772, _1766, _1792);
    float _1800 = in.m_43.x;
    float _1802 = fma(_1718, _1776, _1770);
    float _1804 = fma(_1796, _1766, _1794);
    float _1806 = _1006 + _1798;
    float _1808 = fma(_1802, _1764, _1780);
    float _1810 = _790 + _1804;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1814 = _1806 + _1812;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1818 = _1816 != 0;
    float _1820 = fma(_1788, _1766, _1808);
    float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1824 = _1810 + _1822;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1828 = _1826 != 0;
    bool _1830 = _720 > 0.5;
    bool _1832 = _1830 && _1818;
    float _1834 = _1824 * _1824;
    float _1836 = _1220 + _1820;
    float _1838 = fma(_1814, _1814, _1834);
    float _1840 = in.m_43.y;
    float _1842 = sqrt(_1838);
    float _1844 = _1764;
    float _1846 = _1800;
    float _1848 = _1820;
    if (_1818)
    {
        _1844 = _1800;
    }
    float _1850 = _1844;
    float _1852 = _1850;
    if (_1832)
    {
        float _1854 = -_1850;
        float _1856 = _1854 + 1.0;
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = _1858;
    if (_1818)
    {
        _1846 = _1858;
    }
    float _1862 = _1846;
    bool _1864 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = -_1840;
    float _1868 = _1866 + 1.0;
    float _1870 = _1840;
    float _1872 = _1868;
    if (_1828)
    {
        float _1874 = _1730 ? _1868 : _1840;
        _1870 = _1874;
    }
    float _1876 = _1870;
    if (!_1864)
    {
        _1872 = _1806;
    }
    float _1878 = _1872;
    float _1880 = _1878;
    if (!_1864)
    {
        _1848 = _1810;
    }
    float _1882 = _1848;
    float _1884 = _1882;
    if (!_1864)
    {
        _1860 = _1836;
    }
    float _1886 = _1860;
    bool _1888 = !_1864;
    float _1890 = _1886;
    if (!_1888)
    {
        float _1892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1896 = _1842 + _1894;
        float _1898 = rsqrt(_1838);
        float _1900 = _1896 * _1892;
        float _1902 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1904 = _1900 * 0.15915493667125701904296875;
        float _1906 = _1904 * 6.283185482025146484375;
        float _1908 = sin(_1906);
        float _1910 = _1904 * 6.283185482025146484375;
        float _1912 = cos(_1910);
        float _1914 = fma(_1908, _1902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1916 = _1898 * _1914;
        float _1918 = _1912 + (-1.0);
        float _1920 = fma(_1814, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1922 = fma(_1824, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1924 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1926 = fma(_1836, _1912, _1924);
        _1890 = _1926;
        _1880 = _1920;
        _1884 = _1922;
    }
    float _1928 = _1890;
    float _1930 = _1880;
    float _1932 = _1884;
    float _1934 = -_1326;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1928);
    float _1938 = -_1350;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1930);
    float _1942 = -_1372;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1932);
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1948 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1950 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1952 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1954 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1956 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1948);
    float _1958 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1950);
    float _1960 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1952);
    float _1962 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1954);
    float _1964 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1956);
    float _1966 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1968 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1960);
    float _1970 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1962);
    float _1972 = _1964 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1976 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1978 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1984 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1986 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1988 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1980);
    float _1990 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1982);
    float _1994 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1984);
    float _1996 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1986);
    float _1998 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1988);
    float _2000 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1992);
    float _2002 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2004 = _1990 * _1974;
    float _2006 = _1970 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2008 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1994);
    float _2010 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1996);
    float _2012 = _2002 * _1946;
    float _2014 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2000);
    float _2016 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2018 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1998);
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2008);
    float _2022 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2010);
    out.m_33.x = 1.0;
    out.m_45.w = _2016;
    out.m_47.x = _2012;
    out.m_47.y = _2004;
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _2014;
    out.gl_Position.w = _2022;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _708 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_30.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    float _74 = as_type<float>(_66);
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _72;
    if (!_70)
    {
        out.m_33.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_82);
        out.gl_Position.z = _2080;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _86 = in.m_35.w;
    float _88 = float(_66);
    float _90 = -_86;
    float _92 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_86);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    bool _104 = _92 >= _88;
    bool _106 = !_102;
    bool _108 = _104 || _106;
    float _110 = _92;
    if (_108)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _74;
    if (_108)
    {
        out.m_33.x = 0.0;
    }
    if (_108)
    {
        float _114 = _112 * 5.0;
        _84 = as_type<int>(_114);
    }
    int _116 = _84;
    if (_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2144 = as_type<float>(_116);
        out.gl_Position.z = _2144;
    }
    if (_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_37.w;
    float _120 = 1.0 / _88;
    float _122 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _124 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _126 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = in.m_35.x;
    float _136 = in.m_35.y;
    float _138 = in.m_35.z;
    float _140 = in.m_30.x;
    float _142 = in.m_30.y;
    float _144 = in.m_30.z;
    float _146 = 0.0;
    float _148 = _122;
    if (!_132)
    {
        float _150 = _122 * _122;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_132)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_132;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _122 * _168;
        float _178 = 1.0 / _172;
        float _180 = _174 * 0.693147182464599609375;
        float _182 = exp2(_176);
        float _184 = 1.0 / _180;
        float _186 = _182 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _184, _122);
        float _192 = _190 * _178;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_132;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _122 * _202;
        float _212 = exp2(_210);
        float _214 = -_212;
        float _216 = _214 + 1.0;
        float _218 = _216 * _208;
        _148 = _218;
    }
    float _220 = _148;
    bool _222 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _226 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _228 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _230 = fma(_220, _134, _224);
    float _232 = fma(_220, _136, _226);
    float _234 = fma(_220, _138, _228);
    float _236 = fma(_230, _118, _140);
    float _238 = fma(_232, _118, _142);
    float _240 = fma(_234, _118, _144);
    float _242 = _92 * _120;
    bool _244 = !_222;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _92);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        _262 = _242;
    }
    _264 = false;
    float _266 = _262;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _270 = _266 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _288 = 1.0 / _274;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _298;
    float _302 = 1.0 / _278;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _266 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _308;
    bool _312 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_266);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_266);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _336;
    float _340 = 1.0 / _282;
    float _342 = _306 * _288;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _266 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = _266 + _348;
    bool _352 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _354 = isnan(_266);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -_322;
    float _366 = _364 + 1.0;
    float _368 = 1.0 / _292;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _372 = _266 + _370;
    float _374 = _346 * _302;
    bool _376 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _378 = isnan(_266);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _334 * _366;
    float _390 = -_334;
    float _392 = _390 + 1.0;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _398 = 1.0 / _286;
    float _400 = _350 * _340;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _404 = _266 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _408 = _266 + _406;
    float _410 = fma(_310, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _414 = 1.0 / _300;
    float _416 = _372 * _368;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = fma(_420, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _428 = 1.0 / _296;
    float _430 = _270 * _398;
    bool _432 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _434 = isnan(_266);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_386;
    float _446 = _444 + 1.0;
    float _448 = fma(_424, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _450 = _404 * _414;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _460;
    float _464 = fma(_454, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _466 = _408 * _428;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = _442 * _446;
    float _474 = -_442;
    float _476 = _474 + 1.0;
    float _478 = fma(_462, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _480 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _482 = isnan(_266);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_362;
    float _494 = _492 + 1.0;
    float _496 = fma(_458, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _498 = fma(_470, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _500 = _362 * _476;
    bool _502 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _504 = isnan(_266);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _490 * _494;
    float _516 = -_490;
    float _518 = _516 + 1.0;
    float _520 = _512 * _518;
    float _522 = -_512;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _526;
    float _530 = _322 * _524;
    float _532 = fma(_528, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _534 = fma(_338, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _536 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_266);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _556 = _546 * _392;
    float _558 = -_546;
    float _560 = _558 + 1.0;
    float _562 = fma(_554, _430, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _564 = fma(_550, _430, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _566 = _464 * _556;
    float _568 = _478 * _556;
    float _570 = fma(_396, _430, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _572 = _426 * _556;
    float _574 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].x, _566);
    float _576 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].y, _568);
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].z, _572);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _580;
    float _584 = fma(_496, _388, _574);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _590;
    float _594 = fma(_498, _388, _576);
    float _596 = fma(_448, _388, _578);
    float _598 = fma(_588, _416, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _600 = fma(_592, _416, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _602 = fma(_582, _416, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _604 = fma(_410, _530, _594);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _610 = fma(_532, _530, _584);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _620 = fma(_534, _530, _596);
    float _622 = fma(_608, _466, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _624 = fma(_614, _466, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _626 = fma(_618, _466, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _628 = fma(_562, _520, _610);
    float _630 = fma(_564, _520, _604);
    float _632 = fma(_570, _520, _620);
    float _634 = in.m_37.x;
    float _636 = in.m_37.y;
    float _638 = in.m_37.z;
    float _640 = fma(_600, _514, _630);
    float _642 = fma(_598, _514, _628);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _648;
    float _652 = fma(_602, _514, _632);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _654;
    float _658 = fma(_646, _450, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _660 = fma(_650, _450, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _662 = fma(_622, _500, _642);
    float _664 = fma(_624, _500, _640);
    float _666 = fma(_656, _450, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _668 = fma(_626, _500, _652);
    float _670 = fma(_658, _472, _662);
    float _672 = fma(_660, _472, _664);
    float _674 = fma(_666, _472, _668);
    float _676 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[150].x, _670);
    float _678 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[150].y, _672);
    float _680 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[150].z, _674);
    float _682 = _676 * _634;
    float _684 = _678 * _636;
    float _686 = _680 * _638;
    bool _688 = !_412;
    float _706;
    if (!_688)
    {
        float _690 = in.m_39.x;
        float _692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _694 = _690 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[14].x, _92);
        float _698 = _696 * _692;
        float _700 = floor(_698);
        float _702 = -_700;
        float _704 = _698 + _702;
        _706 = _704;
        _708 = true;
    }
    else
    {
        _706 = _242;
    }
    _708 = false;
    float _710 = _706;
    float _712 = in.m_39.z;
    float _714 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _716 = log2(_714);
    float _718 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _720 = in.m_39.x;
    float _722 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _726 = 1.0 + _724;
    bool _728 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(1.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _740 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(0.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _752 = _242 * 3.1415927410125732421875;
    float _754 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _750);
    float _756 = _716 * _92;
    float _758 = 1.0 / _726;
    float _760 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _766 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _718);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _772 = _712 * 2.0;
    float _774 = exp2(_756);
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _778 = _776 != 0;
    float _780 = _720 * 2.0;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _790 = _754 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = floor(_772);
    bool _794 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _796 = isnan(_710);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _814 = -_804;
    float _816 = _814 + 1.0;
    float _818 = floor(_780);
    float _820 = -_774;
    float _822 = _820 + 1.0;
    float _824 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _760);
    float _826 = _748 ? _822 : 0.0;
    float _828 = _92 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    bool _830 = _792 > 0.0;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _836 = _792 >= 0.0;
    bool _838 = isnan(_792);
    bool _840 = _836 || _838;
    bool _842 = isnan(0.0);
    bool _844 = _840 || _842;
    float _846 = 1.0 / _764;
    if (_736)
    {
        float _848 = _826 * _758;
        _110 = _848;
    }
    float _850 = _110;
    int _852 = _844 ? 0 : 1;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _860 = _858 != 0;
    int _862 = ~_852;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = 1.0 / _834;
    int _870 = _866;
    int _872 = as_type<int>(_850);
    if (!_830)
    {
        int _874 = ~_852;
        int _876 = _874 + 1;
        _870 = _876;
    }
    int _878 = _870;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _884 = _818 >= 0.0;
    bool _886 = isnan(_818);
    bool _888 = _884 || _886;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    float _894 = 1.0 / _770;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _902 = _900 != 0;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _910 = _908 != 0;
    int _912 = _892 ? 0 : 1;
    float _914 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _916 = _818 > 0.0;
    float _918 = 1.0 / _882;
    float _920 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _766);
    int _922 = ~_912;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = _808 * _868;
    bool _930 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _932 = isnan(_710);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _914);
    float _944 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _824);
    float _946 = in.m_39.y;
    float _948 = 1.0 / _898;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _954 = _926;
    if (!_916)
    {
        int _956 = ~_912;
        int _958 = _956 + 1;
        _954 = _958;
    }
    int _960 = _954;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _966 = _812 * _918;
    float _968 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _970 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _972 = precise::max(_968, _970);
    float _974 = 1.0 / _952;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _980;
    bool _984 = _972 >= 16.0;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _990 = _978 * _894;
    float _992 = _720 + _712;
    float _994 = -_940;
    float _996 = _994 + 1.0;
    float _998 = 1.0 / _964;
    float _1000 = _784 * _948;
    float _1002 = _992 + (-1.0);
    float _1004 = _988 * _846;
    float _1006 = _944 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1008 = float(_878);
    float _1010 = _946 * 2.0;
    float _1012 = _788 * _974;
    float _1014 = floor(_1010);
    float _1016 = float(_960);
    float _1018 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _942);
    bool _1020 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1022 = isnan(_710);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = _982 * _998;
    bool _1034 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1036 = isnan(_710);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = -_1030;
    float _1048 = _1046 + 1.0;
    bool _1050 = !_902;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1056 = _720 + _946;
    float _1058 = _1056 + (-1.0);
    bool _1060 = _1014 >= 0.0;
    bool _1062 = isnan(_1014);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(0.0);
    bool _1068 = _1064 || _1066;
    float _1070 = _1044 * _1048;
    float _1072 = -_1044;
    float _1074 = _1072 + 1.0;
    float _1076 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1078 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1080 = isnan(_710);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1092 = _710 + _1090;
    int _1094 = _1068 ? 0 : 1;
    float _1096 = _940 * _1074;
    bool _1098 = _1014 > 0.0;
    float _1100 = _1088 * _996;
    bool _1102 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1104 = isnan(_710);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = -_1088;
    float _1116 = _1114 + 1.0;
    bool _1118 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1120 = isnan(_710);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = fma(_990, _1092, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1132 = _1112 * _816;
    float _1134 = -_1112;
    float _1136 = _1134 + 1.0;
    float _1138 = _804 * _1116;
    bool _1140 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1142 = isnan(_710);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1154 = _710 + _1152;
    float _1156 = -_1128;
    float _1158 = _1156 + 1.0;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1162 = _710 + _1160;
    float _1164 = _1128 * _1136;
    float _1166 = fma(_1004, _1154, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1168 = _1150 * _1158;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1172 = _710 + _1170;
    float _1174 = fma(_928, _1162, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1178 = _710 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1182 = _710 + _1180;
    float _1184 = _1130 * _1168;
    float _1186 = -_1150;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_966, _1172, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1192 = fma(_1000, _1178, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1194 = fma(_1012, _1182, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1198 = _710 + _1196;
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1184);
    float _1202 = _850 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _1204 = ~_1094;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = fma(_1032, _1198, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1212 = fma(_1166, _1164, _1200);
    float _1214 = _1202 * _738;
    bool _1216 = !_910;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = _920 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1222 = _1208;
    bool _1224 = _984;
    if (!_1098)
    {
        int _1226 = ~_1094;
        int _1228 = _1226 + 1;
        _1222 = _1228;
    }
    int _1230 = _1222;
    float _1232 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1214);
    bool _1234 = !_906;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = fma(_1174, _1132, _1212);
    int _1240 = abs(_1218);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1244 = _1220 + _1242;
    int _1246 = abs(_1236);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1250 = _1006 + _1248;
    int _1252 = abs(_1052);
    float _1254 = _1244 * _1244;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1258 = _790 + _1256;
    float _1260 = floor(_1232);
    float _1262 = float(_1252);
    float _1264 = fma(_1250, _1250, _1254);
    float _1266 = _1232 + 0.25;
    float _1268 = float(_1246);
    float _1270 = fma(_1190, _1138, _1238);
    float _1272 = fma(_1258, _1258, _1264);
    float _1274 = _1262 * _1008;
    float _1276 = floor(_1266);
    float _1278 = _1268 * _1016;
    float _1280 = fma(_1192, _1100, _1270);
    float _1282 = _1274 * (-2.0);
    float _1284 = float(_1240);
    float _1286 = float(_1230);
    float _1288 = fma(_1076, _1282, _1076);
    float _1290 = rsqrt(_1272);
    float _1292 = -_1260;
    float _1294 = _1232 + _1292;
    float _1296 = _720 + (-0.5);
    float _1298 = fma(_1194, _1096, _1280);
    float _1300 = _1232 * 6.283185482025146484375;
    float _1302 = _1284 * _1286;
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1306 = fma(_1210, _1070, _1298);
    float _1308 = _1300 * 0.15915493667125701904296875;
    float _1310 = _1302 * (-2.0);
    float _1312 = -_1276;
    float _1314 = _1266 + _1312;
    float _1316 = _752 * 0.15915493667125701904296875;
    float _1318 = _712 + (-0.5);
    float _1320 = fma(_1288, _850, _1304);
    float _1322 = fma(_1054, _1310, _1054);
    float _1324 = _828 * 0.15915493667125701904296875;
    float _1326 = _1244 * _1290;
    float _1328 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1306);
    float _1330 = _1308 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    bool _1334 = _1294 >= 0.5;
    bool _1336 = isnan(_1294);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan(0.5);
    bool _1342 = _1338 || _1340;
    float _1344 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1346 = !_856;
    int _1348 = _1346 ? 0 : 1;
    float _1350 = _1250 * _1290;
    float _1352 = -_1326;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    bool _1356 = !_778;
    int _1358 = _1356 ? 0 : 1;
    float _1360 = -_1350;
    float _1362 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    int _1364 = abs(_1348);
    float _1366 = _1354 * _1354;
    bool _1368 = !_1342;
    float _1370 = _1368 ? 0.5 : (-0.5);
    float _1372 = _1258 * _1290;
    int _1374 = abs(_1358);
    float _1376 = fma(_1362, _1362, _1366);
    float _1378 = float(_1364);
    float _1380 = -_1372;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1386 = _1384 * 2.0;
    bool _1388 = _1314 > 0.5;
    float _1390 = _1324 * 6.283185482025146484375;
    float _1392 = sin(_1390);
    float _1394 = fma(_1382, _1382, _1376);
    float _1396 = _1378 * _1386;
    float _1398 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1400 = float(_1374);
    float _1402 = _1320 * 0.15915493667125701904296875;
    bool _1404 = !_860;
    int _1406 = _1404 ? 0 : 1;
    float _1408 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1410 = _946 + _712;
    float _1412 = fma(_1400, _1398, _1396);
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1416 = _1314;
    if (_1388)
    {
        float _1418 = -_1314;
        float _1420 = _1418 + 1.0;
        _1416 = _1420;
    }
    float _1422 = _1416;
    int _1424 = abs(_1406);
    float _1426 = fma(_1322, _850, _1344);
    float _1428 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1430 = _984 ? _1414 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1432 = fma(_1422, 4.0, -1.0);
    float _1434 = _1392 * _1408;
    float _1436 = float(_1424);
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = sin(_1438);
    float _1442 = _984 ? _1428 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1446 = abs(_1430);
    bool _1448 = _1446 != 0.0;
    bool _1450 = isnan(_1446);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = _1426 * 0.15915493667125701904296875;
    float _1460 = fma(_1436, _1444, _1412);
    float _1462 = _1402 * 6.283185482025146484375;
    float _1464 = cos(_1462);
    float _1466 = abs(_1442);
    bool _1468 = _1466 == 0.0;
    bool _1470 = !_1456;
    bool _1472 = _1468 && _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[191].w + _1474;
    float _1478 = abs(_1442);
    bool _1480 = _1478 == 0.0;
    float _1482 = _1460 * 3.1415927410125732421875;
    float _1484 = _1316 * 6.283185482025146484375;
    float _1486 = sin(_1484);
    float _1488 = _1410 + (-1.0);
    float _1490 = in.m_41.x;
    float _1492 = in.m_41.y;
    float _1494 = in.m_41.z;
    float _1496 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1498 = _1278 * (-2.0);
    float _1500 = _1434 * 0.15915493667125701904296875;
    float _1502 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1504 = 1.0 / _1476;
    float _1506 = _946 + (-0.5);
    float _1508 = fma(_1482, _1498, _1482);
    int _1510 = as_type<int>(_1496);
    if (_1472)
    {
        bool _1512 = as_type<int>(_1442) >= 0;
        _1224 = _1512;
    }
    bool _1514 = _1224;
    float _1516 = fma(_1496, _1498, _1496);
    float _1518 = -_1502;
    float _1520 = precise::max(_1518, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _1522 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1508);
    int _1524 = _1514 ? (-1) : 0;
    if (_1472)
    {
        int _1526 = _1514 ? 0 : 1078530011;
        _1510 = _1526;
    }
    int _1528 = _1510;
    float _1530 = _1458 * 6.283185482025146484375;
    float _1532 = cos(_1530);
    float _1534 = precise::min(_1520, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _1536 = fma(_1516, _850, _1522);
    if (_1472)
    {
        int _1538 = int(0x80000000) & as_type<int>(_1430);
        int _1540 = _1528 | _1538;
        _872 = _1540;
    }
    int _1542 = _872;
    float _1544 = sqrt(_1394);
    float _1546 = _1500 * 6.283185482025146484375;
    float _1548 = sin(_1546);
    bool _1550 = !_1456;
    bool _1552 = _1550 && _1480;
    int _1554 = _1542;
    float _1556 = as_type<float>(_1542);
    if (!_1552)
    {
        float _1558 = abs(_1430);
        bool _1560 = _1558 != as_type<float>(0x7f800000u /* inf */);
        bool _1562 = isnan(_1558);
        bool _1564 = _1560 || _1562;
        bool _1566 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1568 = _1564 || _1566;
        float _1570 = abs(_1442);
        bool _1572 = _1570 == as_type<float>(0x7f800000u /* inf */);
        float _1574 = abs(_1442);
        bool _1576 = _1574 == as_type<float>(0x7f800000u /* inf */);
        bool _1578 = !_1568;
        bool _1580 = _1576 && _1578;
        if (_1580)
        {
            bool _1582 = as_type<int>(_1442) >= 0;
            _1524 = _1582 ? (-1) : 0;
        }
        int _1584 = _1524;
        if (_1580)
        {
            _1554 = 1075235812;
        }
        int _1586 = _1554;
        int _1588 = _1586;
        if (_1580)
        {
            int _1590 = ~_1584;
            int _1592 = (_1590 != 0) ? _1586 : 1061752795;
            _1588 = _1592;
        }
        int _1594 = _1588;
        float _1596 = as_type<float>(_1594);
        if (_1580)
        {
            int _1598 = int(0x80000000) & as_type<int>(_1430);
            int _1600 = _1594 | _1598;
            _1596 = as_type<float>(_1600);
        }
        float _1602 = _1596;
        bool _1604 = !_1568;
        bool _1606 = _1604 && _1572;
        _1556 = _1602;
        if (!_1606)
        {
            float _1608 = abs(_1430);
            float _1610 = abs(_1442);
            float _1612 = precise::max(_1608, _1610);
            float _1614 = abs(_1430);
            float _1616 = abs(_1442);
            float _1618 = precise::min(_1614, _1616);
            float _1620 = 1.0 / _1612;
            float _1622 = abs(_1430);
            float _1624 = abs(_1442);
            bool _1626 = _1622 > _1624;
            bool _1628 = as_type<int>(_1442) >= 0;
            float _1630 = _1618 * _1620;
            float _1632 = abs(_1430);
            float _1634 = abs(_1442);
            float _1636 = _1632 + _1634;
            int _1638 = as_type<int>(_1430) & int(0x80000000);
            float _1640 = _1630 * _1630;
            bool _1642 = _1636 > as_type<float>(0x7f800000u /* inf */);
            bool _1644 = isnan(_1636);
            bool _1646 = _1642 || _1644;
            bool _1648 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1650 = _1646 || _1648;
            float _1652 = _1640 + 11.33538818359375;
            float _1654 = fma(_1640, _1652, 28.84246826171875);
            float _1656 = fma(_1640, _1654, 19.6966705322265625);
            float _1658 = fma(_1640, -0.82336294651031494140625, -5.674867153167724609375);
            float _1660 = fma(_1640, _1658, -6.565555095672607421875);
            float _1662 = 1.0 / _1656;
            float _1664 = _1640 * _1660;
            float _1666 = _1630 * _1664;
            float _1668 = fma(_1666, _1662, _1630);
            float _1670 = _1668;
            _1556 = _1636;
            if (_1626)
            {
                float _1672 = -_1668;
                float _1674 = _1672 + 1.57079637050628662109375;
                _1670 = _1674;
            }
            float _1676 = _1670;
            int _1678 = as_type<int>(_1676);
            if (!_1628)
            {
                float _1680 = -_1676;
                float _1682 = _1680 + 3.1415927410125732421875;
                _1678 = as_type<int>(_1682);
            }
            int _1684 = _1678;
            if (!_1650)
            {
                int _1686 = _1638 | _1684;
                _1556 = as_type<float>(_1686);
            }
        }
    }
    float _1688 = _1556;
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1692 = _1534 + _1690;
    float _1694 = 0.0 + _1486;
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = _1500 * 6.283185482025146484375;
    float _1700 = cos(_1698);
    float _1702 = _1536 + _1688;
    float _1704 = _1692 * _1504;
    float _1706 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1708 = _1290 * _1544;
    float _1710 = _1702 * 0.15915493667125701904296875;
    float _1712 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1714 = fma(_1706, _1704, _1492);
    float _1716 = _1458 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1722 = _1708 * _1712;
    float _1724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1714);
    float _1726 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1728 = _1708 * _1720;
    bool _1730 = _946 > 0.5;
    float _1732 = _1722 * _1724;
    float _1734 = _1710 * 6.283185482025146484375;
    float _1736 = sin(_1734);
    float _1738 = _1700 * _1490;
    float _1740 = _1548 * _1490;
    float _1742 = _1708 * _1726;
    float _1744 = _1532 * _1732;
    float _1746 = fma(_1548, _1494, _1738);
    float _1748 = -_1740;
    float _1750 = fma(_1700, _1494, _1748);
    float _1752 = _1710 * 6.283185482025146484375;
    float _1754 = cos(_1752);
    float _1756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1746);
    float _1758 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1750);
    float _1760 = _1440 * _1744;
    float _1762 = _1718 * _1732;
    float _1764 = _1728 * _1756;
    float _1766 = _1742 * _1758;
    float _1768 = _1464 * _1736;
    float _1770 = _1440 * _1736;
    float _1772 = _1736 * _1532;
    float _1774 = _1440 * _1754;
    float _1776 = _1464 * _1754;
    float _1778 = _1754 * _1532;
    float _1780 = _1464 * _1744;
    float _1782 = -_1768;
    float _1784 = fma(_1718, _1774, _1782);
    float _1786 = -_1774;
    float _1788 = fma(_1718, _1768, _1786);
    float _1790 = -_1762;
    float _1792 = fma(_1778, _1764, _1790);
    float _1794 = fma(_1784, _1764, _1760);
    float _1796 = fma(_1718, _1770, _1776);
    float _1798 = fma(_1772, _1766, _1792);
    float _1800 = in.m_43.x;
    float _1802 = fma(_1718, _1776, _1770);
    float _1804 = fma(_1796, _1766, _1794);
    float _1806 = _1006 + _1798;
    float _1808 = fma(_1802, _1764, _1780);
    float _1810 = _790 + _1804;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1814 = _1806 + _1812;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1818 = _1816 != 0;
    float _1820 = fma(_1788, _1766, _1808);
    float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1824 = _1810 + _1822;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1828 = _1826 != 0;
    bool _1830 = _720 > 0.5;
    bool _1832 = _1830 && _1818;
    float _1834 = _1824 * _1824;
    float _1836 = _1220 + _1820;
    float _1838 = fma(_1814, _1814, _1834);
    float _1840 = in.m_43.y;
    float _1842 = sqrt(_1838);
    float _1844 = _1764;
    float _1846 = _1800;
    float _1848 = _1820;
    if (_1818)
    {
        _1844 = _1800;
    }
    float _1850 = _1844;
    float _1852 = _1850;
    if (_1832)
    {
        float _1854 = -_1850;
        float _1856 = _1854 + 1.0;
        _1852 = _1856;
    }
    float _1858 = _1852;
    float _1860 = _1858;
    if (_1818)
    {
        _1846 = _1858;
    }
    float _1862 = _1846;
    bool _1864 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = -_1840;
    float _1868 = _1866 + 1.0;
    float _1870 = _1840;
    float _1872 = _1868;
    if (_1828)
    {
        float _1874 = _1730 ? _1868 : _1840;
        _1870 = _1874;
    }
    float _1876 = _1870;
    if (!_1864)
    {
        _1872 = _1806;
    }
    float _1878 = _1872;
    float _1880 = _1878;
    if (!_1864)
    {
        _1848 = _1810;
    }
    float _1882 = _1848;
    float _1884 = _1882;
    if (!_1864)
    {
        _1860 = _1836;
    }
    float _1886 = _1860;
    bool _1888 = !_1864;
    float _1890 = _1886;
    if (!_1888)
    {
        float _1892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1896 = _1842 + _1894;
        float _1898 = rsqrt(_1838);
        float _1900 = _1896 * _1892;
        float _1902 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1904 = _1900 * 0.15915493667125701904296875;
        float _1906 = _1904 * 6.283185482025146484375;
        float _1908 = sin(_1906);
        float _1910 = _1904 * 6.283185482025146484375;
        float _1912 = cos(_1910);
        float _1914 = fma(_1908, _1902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1916 = _1898 * _1914;
        float _1918 = _1912 + (-1.0);
        float _1920 = fma(_1814, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1922 = fma(_1824, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1924 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1926 = fma(_1836, _1912, _1924);
        _1890 = _1926;
        _1880 = _1920;
        _1884 = _1922;
    }
    float _1928 = _1890;
    float _1930 = _1880;
    float _1932 = _1884;
    float _1934 = -_1326;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1928);
    float _1938 = -_1350;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1930);
    float _1942 = -_1372;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1932);
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1948 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1950 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1952 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1954 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1956 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1948);
    float _1958 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1950);
    float _1960 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1952);
    float _1962 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1954);
    float _1964 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1956);
    float _1966 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1968 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1960);
    float _1970 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1962);
    float _1972 = _1964 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1976 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1978 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1984 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1986 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1988 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1980);
    float _1990 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1982);
    float _1994 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1984);
    float _1996 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1986);
    float _1998 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1988);
    float _2000 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1992);
    float _2002 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2004 = _1990 * _1974;
    float _2006 = _1970 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2008 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1994);
    float _2010 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1996);
    float _2012 = _2002 * _1946;
    float _2014 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2000);
    float _2016 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2018 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1998);
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2008);
    float _2022 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2010);
    out.m_33.x = 1.0;
    out.m_45.w = _2016;
    out.m_47.x = _2012;
    out.m_47.y = _2004;
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _2014;
    out.gl_Position.w = _2022;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

