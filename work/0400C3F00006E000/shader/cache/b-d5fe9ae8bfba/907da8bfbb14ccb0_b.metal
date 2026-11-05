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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_75 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2674 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2984 = as_type<float>(_134);
        out.gl_Position.z = _2984;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_112);
    bool _148 = _116 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _124;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    int _156 = 0;
    if (_152)
    {
        float _158 = _154 * 5.0;
        _156 = as_type<int>(_158);
    }
    int _160 = _156;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3039 = as_type<float>(_160);
        out.gl_Position.z = _3039;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _146;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _186;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _238;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = _250 * _254;
    float _266 = -_250;
    float _268 = _266 + 1.0;
    float _270 = _222 * _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = fma(_280, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = _276 * _264;
    float _288 = _284 * _264;
    float _290 = _282 * _264;
    float _292 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _286);
    float _294 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _288);
    float _296 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _290);
    float _298 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _294);
    float _302 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].z, _296);
    bool _304 = !_262;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _194 = _320;
    }
    float _322 = _194;
    float _324 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _326 = int(_324);
    float _328 = in.m_57.x;
    float _330 = in.m_57.y;
    float _332 = in.m_59.y;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _336 = _334 != 0;
    float _338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _340 = int(_338);
    float _342 = in.m_59.x;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _346 = _344 != 0;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _350 = float(_326);
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _354 = _352 != 0;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _358 = 1.0 / _350;
    float _360 = float(uint(_340));
    float _362 = _328 * 2.0;
    int _364 = ~_340;
    int _366 = _364 + 1;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _372 = _330 > 0.5;
    float _374 = 1.0 / _360;
    int _376 = ~_340;
    int _378 = _376 + 1;
    float _380 = _358 * _116;
    float _382 = 1.0 / _370;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _384;
    float _388 = trunc(_380);
    int _390 = int(_388);
    int _392 = as_type<int>(_374) + (-2);
    float _394 = floor(_362);
    float _396 = _386 * _382;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _402 = float(uint(_390));
    float _404 = as_type<float>(_392) * _402;
    int _406 = ~_340;
    int _408 = _406 + 1;
    float _410 = trunc(_404);
    float _412 = precise::max(_410, 0.0);
    uint _415 = uint(_412);
    int _417 = _408 * int(_415);
    int _419 = _417 + _390;
    float _421 = float(uint(_419));
    float _423 = as_type<float>(_392) * _421;
    float _425 = trunc(_423);
    float _427 = precise::max(_425, 0.0);
    uint _429 = uint(_427);
    bool _431 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _433 = isnan(1.0);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _439 = _435 || _437;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _443 = 1.0 + _441;
    float _445 = float(_340);
    int _447 = int(_415) + int(_429);
    bool _449 = !_336;
    float _451 = _449 ? 7.345489978790283203125 : 1.0;
    float _453 = _328 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _455 = float(_390);
    int _457 = _366 * _447;
    int _459 = _457 + _390;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _463 = _461 != 0;
    float _465 = _451 * _328;
    bool _467 = _455 >= _445;
    bool _469 = isnan(_455);
    bool _471 = _467 || _469;
    bool _473 = isnan(_445);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_332;
    float _481 = _479 + 1.0;
    bool _483 = uint(_459) >= uint(_340);
    float _485 = floor(_465);
    float _487 = -_348;
    float _489 = fma(_453, 2.0, _487);
    float _491 = _445 * _116;
    bool _493 = !_483;
    int _495 = _493 ? 0 : (-1);
    float _497 = _332;
    float _499 = _342;
    if (_346)
    {
        float _501 = _372 ? _481 : _332;
        _497 = _501;
    }
    float _503 = _497;
    float _505 = trunc(_477);
    int _507 = int(_505);
    int _509 = ~_447;
    int _511 = _509 + _495;
    int _513 = _511 + 1;
    float _515 = 0.0;
    if (_463)
    {
        float _517 = in.m_57.x;
        _515 = _517;
    }
    float _519 = _515;
    bool _521 = _340 == 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _533 = _531 != 0;
    float _535 = -_485;
    float _537 = _465 + _535;
    int _539 = _340 * _513;
    int _541 = _539 + _390;
    float _543 = _330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _545 = !_354;
    int _547 = _545 ? 0 : 1;
    float _549 = _537 * _445;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _553 = _551 != 0;
    float _555 = fma(_543, -2.0, _356);
    bool _557 = !_521;
    int _559 = _557 ? _541 : (-1);
    float _561 = _491 * _168;
    int _563 = ~_507;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = trunc(_549);
    int _571 = int(_569);
    bool _573 = !_529;
    int _575 = _573 ? 0 : 1;
    int _577 = abs(_547);
    int _579 = _559 * _567;
    bool _581 = !_525;
    int _583 = _581 ? 0 : 1;
    float _585 = in.m_46.x;
    float _587 = in.m_46.y;
    float _589 = in.m_46.z;
    int _591 = _340 + (-1);
    float _593 = trunc(_561);
    int _595 = int(_593);
    int _597 = abs(_575);
    bool _599 = !_533;
    int _601 = _599 ? 0 : 1;
    int _603 = _507 * _591;
    int _605 = _603 + _579;
    int _607 = abs(_583);
    int _609 = _571 * _577;
    int _611 = _609 + _390;
    int _613 = abs(_601);
    int _615 = _605 * _597;
    float _617 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _619 = log2(_617);
    int _621 = _595 * _607;
    int _623 = _621 + _615;
    bool _625 = !_553;
    int _627 = _625 ? 0 : 1;
    int _629 = _611 * _613;
    int _631 = _629 + _623;
    int _633 = abs(_627);
    float _635 = _587 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = _587 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _639 = _587 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _645 = _571 * _633;
    int _647 = _645 + _631;
    float _649 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    float _651 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[5].x, _637);
    float _653 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[6].x, _639);
    float _655 = _619 * _116;
    float _657 = float(uint(_647));
    float _659 = 1.0 / _643;
    float _661 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[4].z, _649);
    float _663 = as_type<float>(_392) * _657;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _673 = trunc(_663);
    float _675 = precise::max(_673, 0.0);
    uint _677 = uint(_675);
    float _679 = in.m_57.z;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _685 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _691 = _519 > 0.5;
    bool _693 = _691 && _463;
    float _695 = _330 * 2.0;
    float _697 = 1.0 / _683;
    float _699 = _330 + _328;
    out.m_63.x = _685;
    out.m_63.y = _687;
    out.m_63.z = _689;
    out.m_63.w = _669;
    bool _701 = _394 > 0.0;
    float _703 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[5].z, _651);
    bool _705 = _394 >= 0.0;
    bool _707 = isnan(_394);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    int _715 = _378 * int(_677);
    int _717 = _715 + _647;
    float _719 = exp2(_655);
    int _721 = _713 ? 0 : 1;
    float _723 = float(uint(_717));
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _725;
    float _729 = floor(_695);
    float _731 = _699 + (-1.0);
    float _733 = _400 * _659;
    float _735 = as_type<float>(_392) * _723;
    float _737 = _727 * _697;
    float _739 = _330 + _679;
    float _741 = -_719;
    float _743 = _741 + 1.0;
    float _745 = _723;
    if (_463)
    {
        _745 = _342;
    }
    float _747 = _745;
    float _749 = trunc(_735);
    float _751 = precise::max(_749, 0.0);
    uint _753 = uint(_751);
    float _755 = _739 + (-1.0);
    int _757 = ~_340;
    int _759 = _757 + 1;
    float _761 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _555);
    float _763 = _747;
    if (_693)
    {
        float _765 = -_747;
        float _767 = _765 + 1.0;
        _763 = _767;
    }
    float _769 = _763;
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _773 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _775 = 1.0 / _443;
    bool _777 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _785 = _781 || _783;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _789 = _729 >= 0.0;
    bool _791 = isnan(_729);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    float _799 = _785 ? _743 : 0.0;
    float _801 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[78].z, _787);
    int _803 = int(_677) + int(_753);
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _807 = _729 > 0.0;
    float _809 = -_116;
    float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[76].x, _489);
    float _813 = _679 * 2.0;
    float _815 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _805);
    float _817 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _801);
    int _819 = _759 * _803;
    int _821 = _819 + _647;
    if (_463)
    {
        _499 = _769;
    }
    float _823 = _499;
    float _825 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _815);
    if (_439)
    {
        float _827 = _799 * _775;
        _126 = _827;
    }
    float _829 = _126;
    float _831 = float(uint(_611));
    float _833 = floor(_813);
    int _835 = _797 ? 0 : 1;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _839 = _322 + _837;
    bool _841 = uint(_821) >= uint(_340);
    float _843 = as_type<float>(_392) * _831;
    int _845 = ~_721;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    float _851 = fma(_396, _839, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _853 = ~_835;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    int _859 = _849;
    int _861 = _857;
    if (!_701)
    {
        int _863 = ~_721;
        int _865 = _863 + 1;
        _859 = _865;
    }
    int _867 = _859;
    float _869 = trunc(_843);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    if (!_807)
    {
        int _875 = ~_835;
        int _877 = _875 + 1;
        _861 = _877;
    }
    int _879 = _861;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _891 = _889 != 0;
    bool _893 = !_841;
    int _895 = _893 ? 0 : (-1);
    bool _897 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _899 = isnan(_322);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    bool _909 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _911 = isnan(_322);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    int _921 = ~_803;
    int _923 = _921 + _895;
    int _925 = _923 + 1;
    float _927 = -_907;
    float _929 = _927 + 1.0;
    bool _931 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _933 = isnan(_322);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -_919;
    float _945 = _943 + 1.0;
    bool _947 = _833 > 0.0;
    float _949 = _919 * _929;
    float _951 = _941 * _945;
    float _953 = -_941;
    float _955 = _953 + 1.0;
    int _957 = ~_340;
    int _959 = _957 + 1;
    int _961 = _340 * _925;
    int _963 = _961 + _647;
    bool _965 = _833 >= 0.0;
    bool _967 = isnan(_833);
    bool _969 = _965 || _967;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    float _975 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _977 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _979 = isnan(_322);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[6].z, _653);
    float _991 = -_761;
    float _993 = fma(_825, _975, _991);
    bool _995 = !_521;
    int _997 = _995 ? _963 : (-1);
    float _999 = _987 * _955;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1003 = _322 + _1001;
    int _1005 = _959 * int(_873);
    int _1007 = _1005 + _611;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1011 = _322 + _1009;
    float _1013 = _851 * _999;
    int _1015 = _997 >> 31;
    float _1017 = fma(_733, _1003, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1019 = float(uint(_1007));
    float _1021 = -_987;
    float _1023 = _1021 + 1.0;
    int _1025 = _1015 & 3;
    float _1027 = fma(_737, _1011, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1029 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1031 = as_type<float>(_392) * _1019;
    int _1033 = _997 + _1025;
    float _1035 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1013);
    bool _1037 = !_887;
    int _1039 = _1037 ? 0 : 1;
    float _1041 = trunc(_1031);
    float _1043 = precise::max(_1041, 0.0);
    uint _1045 = uint(_1043);
    int _1047 = _1033 >> 2;
    float _1049 = fma(_1017, _951, _1035);
    int _1051 = abs(_1039);
    float _1053 = fma(_817, _1029, _811);
    int _1055 = _1047 << 4;
    int _1057 = _1055 + 368;
    float _1059 = _993 + 0.5;
    int _1061 = _973 ? 0 : 1;
    float _1063 = fma(_1027, _949, _1049);
    uint _1065 = uint(int(uint(_1057) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[int(_1067)][_1069];
    int _1073 = int(_1065) + 1;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    int _1077 = _1073 & 3;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[int(_1075)][_1077];
    int _1081 = ~_340;
    int _1083 = _1081 + 1;
    float _1085 = _989 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1087 = ~_1061;
    int _1089 = _1087 + 1;
    int _1091 = _1089 + 1;
    float _1093 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1063);
    int _1095 = _1091;
    if (!_947)
    {
        int _1097 = ~_1061;
        int _1099 = _1097 + 1;
        _1095 = _1099;
    }
    int _1101 = _1095;
    float _1103 = _703 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1105 = int(_873) + int(_1045);
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1109 = _1085 + _1107;
    float _1111 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1113 = !_883;
    int _1115 = _1113 ? 0 : 1;
    float _1117 = float(_879);
    int _1119 = _1083 * _1105;
    int _1121 = _1119 + _611;
    int _1123 = abs(_1115);
    int _1125 = _1057 + 8;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    uint _1129 = uint(int(uint(int(_1127)) >> uint(2)));
    int _1131 = int(_1127) & 3;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[int(_1129)][_1131];
    int _1135 = int(_1127) + 1;
    uint _1137 = uint(int(uint(_1135) >> uint(2)));
    int _1139 = _1135 & 3;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[int(_1137)][_1139];
    int _1143 = _997 & 3;
    bool _1145 = _1143 != 0;
    int _1147 = _997 & 3;
    bool _1149 = _1147 != 0;
    float _1151 = float(_867);
    float _1153 = _1053 + 0.5;
    float _1155 = float(_1051);
    bool _1157 = uint(_1147) > 1u;
    int _1159 = _1145 ? 0 : 1;
    float _1161 = _1155 * _1151;
    bool _1163 = !_891;
    int _1165 = _1163 ? 0 : 1;
    out.m_65.x = _1153;
    out.m_65.y = _1059;
    float _1167 = float(_1123);
    float _1169 = _1161 * (-2.0);
    int _1171 = abs(_1165);
    float _1173 = float(_1101);
    float _1175 = float(_1171);
    int _1177 = ~_1159;
    int _1179 = _1177 + 1;
    int _1181 = _1179 + 1;
    float _1183 = _1167 * _1173;
    int _1185 = _1181;
    float _1187 = _1103;
    if (!_1157)
    {
        int _1189 = ~_1159;
        int _1191 = _1189 + 1;
        _1185 = _1191;
    }
    int _1193 = _1185;
    float _1195 = _1175 * _1117;
    bool _1197 = _1147 != 3;
    bool _1199 = !_1149;
    int _1201 = _1199 ? 0 : 1;
    int _1203 = abs(_1193);
    bool _1205 = uint(_1147) >= 2u;
    int _1207 = abs(_1201);
    int _1209 = _1205 ? 0 : 1;
    int _1211 = ~_1203;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    int _1217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1219 = _1217 != 0;
    int _1221 = ~_1209;
    int _1223 = _1221 + 1;
    int _1225 = _1223 + 1;
    int _1227 = _1215 * as_type<int>(_1079);
    int _1229 = ~_1207;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    bool _1235 = !_1219;
    int _1237 = _1235 ? 0 : 1;
    int _1239 = _1225;
    if (_1197)
    {
        int _1241 = ~_1209;
        int _1243 = _1241 + 1;
        _1239 = _1243;
    }
    int _1245 = _1239;
    int _1247 = _1233 * as_type<int>(_1071);
    int _1249 = _1247 + _1227;
    bool _1251 = _1147 != 3;
    float _1253 = _661 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1255 = abs(_1237);
    float _1257 = in.m_67.x;
    float _1259 = in.m_67.y;
    float _1261 = in.m_67.z;
    int _1263 = abs(_1245);
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1267 = _1103 + _1265;
    bool _1269 = !_1251;
    int _1271 = _1269 ? 0 : (-1);
    float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1275 = _1253 + _1273;
    bool _1277 = uint(_1121) >= uint(_340);
    int _1279 = ~_1263;
    int _1281 = _1279 + 1;
    int _1283 = _1281 + 1;
    int _1285 = abs(_1271);
    float _1287 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1289 = !_1277;
    int _1291 = _1289 ? 0 : (-1);
    int _1293 = _1283 * as_type<int>(_1133);
    int _1295 = _1293 + _1249;
    float _1297 = _1183 * (-2.0);
    float _1299 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1287);
    int _1301 = ~_1105;
    int _1303 = _1301 + _1291;
    int _1305 = _1303 + 1;
    int _1307 = ~_1285;
    int _1309 = _1307 + 1;
    int _1311 = _1309 + 1;
    float _1313 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1299);
    float _1315 = fma(_773, _1297, _773);
    float _1317 = _1267 * _1267;
    int _1319 = _340 * _1305;
    int _1321 = _1319 + _611;
    int _1323 = ~_1255;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    int _1329 = _1311 * as_type<int>(_1141);
    int _1331 = _1329 + _1295;
    bool _1333 = _1313 >= 0.0;
    float _1335 = fma(_1275, _1275, _1317);
    bool _1337 = !_521;
    int _1339 = _1337 ? _1321 : (-1);
    int _1341 = _1331 * _1327;
    float _1343 = fma(_1297, _1257, _1257);
    float _1345 = fma(_1109, _1109, _1335);
    int _1347 = _1339 * _1255;
    int _1349 = _1347 + _1341;
    float _1351 = rsqrt(_1345);
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1333)
    {
        _1355 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1357 = _1355;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1363 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1365 = float(_1349);
    float _1367 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1371 = as_type<int>(_1357);
    if (_1333)
    {
        float _1373 = _1357 * 5.0;
        _1371 = as_type<int>(_1373);
    }
    int _1375 = _1371;
    if (_1333)
    {
        out.m_53.x = 0.0;
    }
    float _1377 = fma(_771, _1169, _771);
    float _1379 = fma(_1169, _1259, _1259);
    float _1381 = _328 + (-0.5);
    out.m_69.x = _1367;
    out.m_69.y = _1369;
    out.m_69.z = _1363;
    out.m_69.w = _1111;
    float _1383 = _1267 * _1351;
    float _1385 = _1275 * _1351;
    if (_1333)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4877 = as_type<float>(_1375);
        out.gl_Position.z = _4877;
    }
    out.m_71.x = _1365;
    if (_1333)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1387 = -_1383;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1103);
    float _1391 = _1109 * _1351;
    float _1393 = -_1385;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1397 = _330 + (-0.5);
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1401 = _1389 + _1399;
    float _1403 = -_1391;
    float _1405 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1085);
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1409 = _1395 + _1407;
    float _1411 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1379);
    float _1413 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1417 = _1405 + _1415;
    float _1419 = _679 + _328;
    float _1421 = fma(_1377, _829, _1411);
    float _1423 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1413);
    float _1425 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1343);
    float _1427 = _1419 + (-1.0);
    float _1429 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1423);
    float _1431 = _1195 * (-2.0);
    float _1433 = -_1383;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1267);
    float _1437 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1439 = _1421 * 0.15915493667125701904296875;
    bool _1441 = _1429 >= 0.0;
    float _1443 = fma(_1431, _1261, _1261);
    float _1445 = _679 + (-0.5);
    float _1447 = -_1385;
    float _1449 = fma(_1447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1275);
    float _1451 = _1435 * _1435;
    float _1453 = fma(_1315, _829, _1425);
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1443);
    float _1457 = -_1391;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1109);
    float _1461 = fma(_1449, _1449, _1451);
    float _1463 = in.m_73.x;
    float _1465 = in.m_73.y;
    float _1467 = in.m_73.z;
    float _1469 = _1453 * 0.15915493667125701904296875;
    float _1471 = _1439 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = fma(_1459, _1459, _1461);
    float _1477 = _1449;
    if (_1441)
    {
        _1477 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1479 = _1477;
    float _1481 = fma(_1437, _1431, _1437);
    int _1483 = as_type<int>(_1479);
    if (_1441)
    {
        out.m_53.x = 0.0;
    }
    if (_1441)
    {
        float _1485 = _1479 * 5.0;
        _1483 = as_type<int>(_1485);
    }
    int _1487 = _1483;
    float _1489 = _1469 * 6.283185482025146484375;
    float _1491 = sin(_1489);
    float _1493 = fma(_1481, _829, _1455);
    if (_1441)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5075 = as_type<float>(_1487);
        out.gl_Position.z = _5075;
    }
    float _1495 = _1493 * 0.15915493667125701904296875;
    float _1497 = _1469 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    float _1501 = _1439 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = sqrt(_1475);
    if (_1441)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1507 = in.m_75.x;
    float _1509 = in.m_75.y;
    float _1511 = in.m_75.z;
    float _1513 = _1495 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = _298 * _1463;
    float _1519 = _1351 * _1505;
    float _1521 = _300 * _1465;
    float _1523 = _302 * _1467;
    float _1525 = _1491 * _1473;
    float _1527 = _1491 * _1503;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1531 = _1495 * 6.283185482025146484375;
    float _1533 = sin(_1531);
    float _1535 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1537 = _1499 * _1503;
    float _1539 = _1499 * _1473;
    float _1541 = _1519 * _1529;
    float _1543 = _1519 * _1535;
    float _1545 = _1491 * _1515;
    float _1547 = _1499 * _1515;
    float _1549 = _1503 * _1515;
    float _1551 = _1473 * _1515;
    float _1553 = _1523 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1555 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1509);
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1507);
    float _1559 = _1519 * _1553;
    float _1561 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1511);
    float _1563 = _1555 * _1541;
    float _1565 = _1557 * _1543;
    float _1567 = fma(_1533, _1537, _1525);
    float _1569 = _1561 * _1559;
    float _1571 = _1547 * _1563;
    float _1573 = -_1527;
    float _1575 = fma(_1533, _1539, _1573);
    float _1577 = -_1563;
    float _1579 = _1533 * _1577;
    float _1581 = -_1539;
    float _1583 = fma(_1533, _1527, _1581);
    float _1585 = fma(_1567, _1565, _1571);
    float _1587 = _1545 * _1563;
    float _1589 = fma(_1549, _1565, _1579);
    float _1591 = fma(_1533, _1525, _1537);
    float _1593 = fma(_1575, _1569, _1585);
    float _1595 = fma(_1583, _1565, _1587);
    float _1597 = fma(_1551, _1569, _1589);
    float _1599 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1601 = fma(_1591, _1569, _1595);
    float _1603 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1605 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1607 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1599);
    float _1609 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1603);
    float _1611 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1605);
    float _1613 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1607);
    float _1615 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1609);
    float _1617 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1611);
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1621 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1623 = _1085 + _1619;
    float _1625 = _1253 + _1621;
    float _1627 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1631 = _1623 + _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1635 = _1625 + _1633;
    float _1637 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1627);
    float _1639 = _1631 * _1631;
    float _1641 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1637);
    float _1643 = fma(_1635, _1635, _1639);
    float _1645 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1647 = sqrt(_1643);
    float _1649 = _1103 + _1645;
    bool _1651 = _1647 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1653 = _1617;
    float _1655 = _1637;
    float _1657 = _1625;
    if (!_1651)
    {
        _1653 = _1625;
    }
    float _1659 = _1653;
    float _1661 = _1659;
    if (!_1651)
    {
        _1655 = _1623;
    }
    float _1663 = _1655;
    float _1665 = _1663;
    if (!_1651)
    {
        _1657 = _1649;
    }
    float _1667 = _1657;
    bool _1669 = !_1651;
    float _1671 = _1667;
    if (!_1669)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1677 = _1647 + _1675;
        float _1679 = rsqrt(_1643);
        float _1681 = _1677 * _1673;
        float _1683 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1685 = _1681 * 0.15915493667125701904296875;
        float _1687 = _1685 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        float _1691 = _1685 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = _1689 + (-1.0);
        float _1697 = fma(_1693, _1683, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1699 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1701 = _1679 * _1697;
        float _1703 = fma(_1649, _1689, _1699);
        float _1705 = fma(_1635, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1707 = fma(_1631, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1671 = _1703;
        _1661 = _1705;
        _1665 = _1707;
    }
    float _1709 = _1671;
    float _1711 = _1661;
    float _1713 = _1665;
    float _1715 = -_1103;
    float _1717 = _1715 + _1709;
    float _1719 = -_1253;
    float _1721 = _1719 + _1711;
    float _1723 = -_1085;
    float _1725 = _1723 + _1713;
    float _1727 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1729 = _1717 * _1717;
    float _1731 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1733 = 1.0 / _1727;
    float _1735 = fma(_1721, _1721, _1729);
    float _1737 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1731);
    bool _1739 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1741 = isnan(0.5);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1747 = _1743 || _1745;
    float _1749 = fma(_1725, _1725, _1735);
    float _1751 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1737);
    bool _1753 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1755 = isnan(0.5);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1761 = _1757 || _1759;
    float _1763 = sqrt(_1749);
    float _1765 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1767 = _1765 + _1727;
    float _1769 = _1767 * _1733;
    float _1771 = _1769 * 0.5;
    bool _1773 = _1763 > 0.0;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1777 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1775);
    float _1779 = 1.0 / _1777;
    bool _1781 = !_1773;
    float _1783 = _1711;
    float _1785 = _1709;
    float _1787 = _1713;
    if (!_1781)
    {
        float _1789 = _186 * _186;
        float _1791 = rsqrt(_1749);
        float _1793 = fma(_188, _188, _1789);
        float _1795 = fma(_190, _190, _1793);
        float _1797 = sqrt(_1795);
        float _1799 = _1721 * _1791;
        float _1801 = _1717 * _1791;
        float _1803 = _1725 * _1791;
        bool _1805 = _1797 > 0.0;
        bool _1807 = !_1805;
        if (!_1807)
        {
            float _1809 = rsqrt(_1795);
            float _1811 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1813 = _186 * _1809;
            float _1815 = _188 * _1809;
            float _1817 = _1801 * _1813;
            float _1819 = _190 * _1809;
            float _1821 = fma(_1799, _1815, _1817);
            float _1823 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1825 = fma(_1803, _1819, _1821);
            float _1827 = _1825 * _1823;
            float _1829 = fma(_188, _1827, _1711);
            float _1831 = fma(_186, _1827, _1709);
            float _1833 = fma(_190, _1827, _1713);
            _1783 = _1829;
            _1785 = _1831;
            _1787 = _1833;
        }
    }
    float _1835 = _1783;
    float _1837 = _1785;
    float _1839 = _1787;
    float _1841 = -_1385;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1835);
    float _1845 = -_1383;
    float _1847 = fma(_1845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1837);
    float _1849 = -_1391;
    float _1851 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1839);
    float _1853 = _1847;
    float _1855 = _1843;
    float _1857 = _1851;
    if (_1761)
    {
        _196 = 1.0;
    }
    float _1859 = _196;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1863 = _1779 * _1861;
    float _1865 = _1859;
    if (!_1747)
    {
        float _1867 = _1401 * _1401;
        float _1869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1871 = -_1085;
        float _1873 = _1871 + _1839;
        float _1875 = -_1253;
        float _1877 = _1875 + _1835;
        float _1879 = fma(_1409, _1409, _1867);
        float _1881 = fma(_1417, _1417, _1879);
        float _1883 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1885 = sqrt(_1881);
        float _1887 = 1.0 / _1519;
        float _1889 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1891 = precise::min(_1885, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1893 = _1891 * _1869;
        float _1895 = _1893 * _1887;
        float _1897 = -_1103;
        float _1899 = _1897 + _1837;
        float _1901 = _1889 * _1895;
        float _1903 = _1873 * _1895;
        float _1905 = fma(_1899, _1901, _1389);
        float _1907 = fma(_1877, _1901, _1395);
        float _1909 = fma(_1889, _1903, _1405);
        _1853 = _1905;
        _1855 = _1907;
        _1857 = _1909;
    }
    float _1911 = _1853;
    float _1913 = _1855;
    float _1915 = _1857;
    if (!_1761)
    {
        float _1917 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1919 = _1917 * 0.15915493667125701904296875;
        float _1921 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1923 = _1919 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        float _1927 = _1921 * 0.15915493667125701904296875;
        float _1929 = _1919 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        float _1933 = 1.0 / _1925;
        float _1935 = _1927 * 6.283185482025146484375;
        float _1937 = cos(_1935);
        float _1939 = _1931 * _1933;
        float _1941 = _1927 * 6.283185482025146484375;
        float _1943 = sin(_1941);
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1945;
        float _1949 = _1937 * _1939;
        float _1951 = 1.0 / _1947;
        float _1953 = 1.0 / _1949;
        float _1955 = _1943 * _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1959 = fma(_1863, _1955, _1957);
        float _1961 = _1959 * _1951;
        float _1963 = precise::clamp(_1961, 0.0, 1.0);
        _1865 = _1963;
    }
    float _1965 = _1865;
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1969 = _1911 + _1967;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1973 = _1913 + _1971;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1977 = _1915 + _1975;
    float _1979 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1981 = _1969 * _1969;
    float _1983 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1979);
    float _1985 = fma(_1973, _1973, _1981);
    float _1987 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1983);
    float _1989 = fma(_1977, _1977, _1985);
    float _1991 = rsqrt(_1989);
    float _1993 = sqrt(_1989);
    float _1995 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1997 = _1973 * _1995;
    float _1999 = _1977 * _1995;
    float _2001 = _1997 * _1997;
    float _2003 = _1999 * _1999;
    float _2005 = _2001 + _2003;
    float _2007 = sqrt(_2005);
    bool _2009 = _2007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = _2007 + _2011;
    float _2015 = _1977;
    float _2017 = _2005;
    float _2019 = _2013;
    float _2021 = _1981;
    float _2023 = _1969;
    if (_2009)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2025;
    }
    float _2027 = _2015;
    if (_2009)
    {
        float _2029 = rsqrt(_2005);
        _2017 = _2029;
    }
    float _2031 = _2017;
    float _2033 = _2031;
    if (_2009)
    {
        float _2035 = _2013 * _2027;
        _2019 = _2035;
    }
    float _2037 = _2019;
    if (_2009)
    {
        float _2039 = _2037 * 0.15915493667125701904296875;
        _2021 = _2039;
    }
    float _2041 = _2021;
    float _2043 = _1991;
    float _2045 = _2041;
    if (_2009)
    {
        float _2047 = _2041 * 6.283185482025146484375;
        float _2049 = sin(_2047);
        _2043 = _2049;
    }
    float _2051 = _2043;
    float _2053 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2055 = precise::max(0.0, _2053);
    float _2057 = _2027;
    if (_2009)
    {
        float _2059 = _2041 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        _2057 = _2061;
    }
    float _2063 = _2057;
    float _2065 = -_1995;
    float _2067 = -_2055;
    float _2069 = fma(_1969, _2065, _2067);
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2009)
    {
        float _2073 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2023 = _2073;
    }
    float _2075 = _2023;
    float _2077 = _2075;
    if (!_2009)
    {
        _2045 = _1997;
    }
    float _2079 = _2045;
    float _2081 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2083 = _2051;
    float _2085 = _2079;
    if (_2009)
    {
        float _2087 = fma(_2051, _2075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2077 = _2087;
    }
    float _2089 = _2077;
    float _2091 = _2089;
    if (!_2009)
    {
        _2083 = _1999;
    }
    float _2093 = _2083;
    float _2095 = _2093;
    float _2097 = _2063;
    if (_2009)
    {
        float _2099 = _2063 + (-1.0);
        _2071 = _2099;
    }
    float _2101 = _2071;
    float _2103 = _2101;
    if (_2009)
    {
        float _2105 = _2031 * _2089;
        _1187 = _2105;
    }
    float _2107 = _1187;
    if (!_2009)
    {
        _2091 = _2069;
    }
    float _2109 = _2091;
    float _2111 = _2109;
    if (_2009)
    {
        float _2113 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2103 = _2113;
    }
    float _2115 = _2103;
    if (_2009)
    {
        float _2117 = _1997 * _2107;
        _2085 = _2117;
    }
    float _2119 = _2085;
    if (!_2009)
    {
        _2033 = _2001;
    }
    float _2121 = _2033;
    float _2123 = _2121;
    if (_2009)
    {
        float _2125 = _1999 * _2107;
        _2095 = _2125;
    }
    float _2127 = _2095;
    if (_2009)
    {
        float _2129 = fma(_2069, _2063, _2115);
        _2111 = _2129;
    }
    float _2131 = _2111;
    if (_2009)
    {
        float _2133 = _2119 * _2119;
        _2123 = _2133;
    }
    float _2135 = _2123;
    if (!_2009)
    {
        _2097 = _2003;
    }
    float _2137 = _2097;
    float _2139 = _2137;
    if (_2009)
    {
        float _2141 = _2127 * _2127;
        _2139 = _2141;
    }
    float _2143 = _2139;
    float _2145 = fma(_2131, _2131, _2135);
    float _2147 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2149 = floor(_2081);
    float _2151 = _2145 + _2143;
    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2155 = fma(_1993, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2153);
    float _2157 = precise::clamp(_2155, 0.0, 1.0);
    float _2159 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2147);
    float _2161 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2163 = -_2157;
    float _2165 = _2163 + 1.0;
    float _2167 = rsqrt(_2151);
    float _2169 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2171 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2173 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2159);
    float _2175 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2171);
    float _2177 = _2173 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2179 = abs(_2165);
    float _2181 = log2(_2179);
    float _2183 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2185 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2175);
    float _2187 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2189 = -_2149;
    float _2191 = _2081 + _2189;
    float _2193 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2183);
    float _2195 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2197 = -_2187;
    float _2199 = fma(_2197, _2161, 1.0);
    float _2201 = _2167 * _2119;
    float _2203 = _2167 * _2131;
    float _2205 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2193);
    float _2207 = _2167 * _2127;
    float _2209 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2211 = floor(_2169);
    float _2213 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2215 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2217 = -_2209;
    float _2219 = fma(_2203, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2217);
    float _2221 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2223 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2225 = -_2207;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2219);
    float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2215);
    float _2231 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2233 = exp2(_2221);
    float _2235 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2237 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2229);
    float _2239 = fma(_2227, 0.5, 0.5);
    float _2241 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2237);
    float _2243 = -_2211;
    float _2245 = _2169 + _2243;
    float _2247 = log2(_2199);
    float _2249 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2223);
    float _2251 = _2203 + 1.0;
    float _2253 = fma(_2239, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2255 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2249);
    float _2257 = fma(_2239, _2253, -0.212114393711090087890625);
    float _2259 = 1.0 / _2241;
    float _2261 = fma(_2227, -0.5, 0.5);
    float _2263 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2235);
    float2 _6310 = float2(_2191, _2245);
    float _2265 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).x;
    float _2267 = fma(_2239, _2257, 1.570728778839111328125);
    float _2269 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2263);
    float _2271 = sqrt(_2261);
    float _2273 = _2247 * 0.693147182464599609375;
    float _2275 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2277 = -_2203;
    float _2279 = fma(_2233, _2251, _2277);
    float _2281 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2283 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2269);
    float _2285 = fma(_2279, 0.5, 0.5);
    float _2287 = _2281 * _2259;
    float _2289 = _2283 * _2259;
    float _2291 = _2271 * 0.636619746685028076171875;
    float _2293 = fma(_2287, 0.5, 0.5);
    float _2295 = fma(_2289, -0.5, 0.5);
    float _2297 = -_2267;
    float _2299 = fma(_2291, _2297, 1.0);
    float3 _6375 = float3(_2293, _2295, _2275);
    float _2301 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6375, float3(0.0), isnan(_6375)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6375, float3(0.0), isnan(_6375)), level(0.0)).x;
    float3 _6386 = float3(_2293, _2295, _2275);
    float4 _2304 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6386, float3(0.0), isnan(_6386)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6386, float3(0.0), isnan(_6386)), level(0.0)).xyzw;
    float _2306 = _2304.x;
    float _2308 = _2304.y;
    float _2310 = _2304.z;
    float _2312 = _2304.w;
    float2 _6402 = float2(_2299, _2285);
    float3 _2316 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6402, float2(0.0), isnan(_6402)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6402, float2(0.0), isnan(_6402)), level(0.0)).xyz;
    float _2318 = _2316.x;
    float _2320 = _2316.y;
    float _2322 = _2316.z;
    float _2324 = abs(_1863);
    float _2326 = log2(_2324);
    float _2328 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2330 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2332 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2334 = _1509 != 0.0;
    bool _2336 = isnan(_1509);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(0.0);
    bool _2342 = _2338 || _2340;
    float _2344 = in.m_77.x;
    float _2346 = in.m_77.y;
    float _2348 = in.m_77.z;
    float _2350 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2328);
    float _2352 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2330);
    bool _2354 = _1507 == 0.0;
    bool _2356 = !_2342;
    bool _2358 = _2354 && _2356;
    float _2360 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2332);
    float _2362 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2364 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2366 = _1511 == 0.0;
    bool _2368 = _2366 && _2358;
    float _2370 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2372 = -_1533;
    float _2374 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2362);
    float _2376 = -_1533;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2364);
    float _2380 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2382 = -_1533;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2370);
    float _2386 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2388 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2390 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2392 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2352);
    float _2394 = exp2(_2380);
    float _2396 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2360);
    float _2398 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2386);
    float _2400 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2388);
    float _2402 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2390);
    float _2404 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2406 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2398);
    float _2408 = _2346;
    float _2410 = _2344;
    float _2412 = _2348;
    float _2414 = _2283;
    float _2416 = _2281;
    if (!_2368)
    {
        float _2418 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2346);
        _2408 = _2418;
    }
    float _2420 = _2408;
    if (!_2368)
    {
        float _2422 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2344);
        _2410 = _2422;
    }
    float _2424 = _2410;
    if (!_2368)
    {
        float _2426 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2348);
        _2412 = _2426;
    }
    float _2428 = _2412;
    float _2430 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2374);
    float _2432 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2378);
    float _2434 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2384);
    float _2436 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2400);
    float _2438 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2402);
    float _2440 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2442 = precise::clamp(_2440, 0.0, 1.0);
    float _2444 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2404);
    float _2446 = _2430 * _2420;
    float _2448 = _2432 * _2420;
    float _2450 = _2434 * _2420;
    float _2452 = fma(_2442, -2.0, 3.0);
    float _2454 = _2442 * _2442;
    float _2456 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2458 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2444);
    float _2460 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2350);
    float _2462 = fma(_2396, _2424, _2450);
    float _2464 = _2454 * _2452;
    float _2466 = exp2(_2456);
    float _2468 = fma(_2460, _2424, _2446);
    float _2470 = fma(_2392, _2424, _2448);
    float _2472 = -_2464;
    float _2474 = _2472 + 1.0;
    float _2476 = in.m_79.x;
    bool _2478 = _1863 <= 8000.0;
    bool _2480 = isnan(_1863);
    bool _2482 = _2478 || _2480;
    bool _2484 = isnan(8000.0);
    bool _2486 = _2482 || _2484;
    float _2488 = float(_2486);
    float _2490 = _2241 * 0.5;
    float _2492 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2464);
    float _2494 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2458);
    float _2496 = fma(_2436, _2428, _2470);
    float _2498 = fma(_2283, -0.5, _2490);
    float _2500 = _2488 * _2492;
    float _2502 = fma(_2406, _2428, _2468);
    float _2504 = fma(_2438, _2428, _2462);
    float _2506 = _2494 + _2241;
    float _2508 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2510 = -_2466;
    float _2512 = _2510 + 1.0;
    float _2514 = _2281 + _2241;
    float _2516 = _2506 * 0.5;
    float _2518 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2520 = _2514 * 0.5;
    out.m_81.x = _2502;
    out.m_81.y = _2496;
    out.m_81.z = _2504;
    bool _2522 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2524 = isnan(_1993);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2530 = _2526 || _2528;
    out.m_83.x = _2520;
    out.m_83.y = _2498;
    out.m_83.z = _2516;
    out.m_83.w = _2241;
    out.gl_Position.x = _2281;
    out.gl_Position.y = _2283;
    out.gl_Position.z = _2494;
    out.gl_Position.w = _2241;
    float _2532 = -_2518;
    float _2534 = _2532 + 1.0;
    float _2536 = _2241;
    float _2538 = _2516;
    float _2540 = _2498;
    float _2542 = _2534;
    if (!_2530)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2544 = _2536;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2530)
    {
        _2538 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2550 = _2538;
    float _2552 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2554 = _2550;
    float _2556 = _2550;
    if (!_2530)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2558 = _2414;
    float _2560 = _2558;
    float _2562 = _2558;
    if (!_2530)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2564 = _2416;
    float _2566 = _2564;
    float _2568 = _2564;
    if (!_2530)
    {
        _2540 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2570 = _2540;
    float _2572 = -_2265;
    float _2574 = _2572 + 1.0;
    float _2576 = _2574 * _2508;
    float _2578 = precise::clamp(_2576, 0.0, 1.0);
    float _2580 = -_2578;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2584 = _2582 * _2476;
    float _2586 = _2584 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2586;
    float _2588 = _2518 * _2301;
    float _2590 = _2312 * _2534;
    float _2592 = _2570;
    float _2594 = _2570;
    if (!_2530)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2596 = _2542;
    float _2598 = _2312 * _2588;
    float _2600 = _2322 * _2588;
    float _2602 = fma(_2318, _2598, _2306);
    float _2604 = fma(_2320, _2598, _2308);
    float _2606 = fma(_2312, _2600, _2310);
    out.m_87.x = _2602;
    out.m_87.y = _2604;
    out.m_87.z = _2606;
    out.m_87.w = _2590;
    bool _2608 = !_2530;
    float _2610 = _2596;
    float _2612 = _2596;
    if (!_2608)
    {
        bool _2614 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2616 = isnan(_1993);
        bool _2618 = _2614 || _2616;
        bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2622 = _2618 || _2620;
        if (!_2622)
        {
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2626 = _1993 + _2624;
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2628;
            float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2636 = 1.0 / _2630;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2654 = _2626 * _2636;
            float _2656 = precise::clamp(_2654, 0.0, 1.0);
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2662 = fma(_2656, _2634, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2568 = _2666;
            _2594 = _2670;
            _2562 = _2662;
            _2556 = _2668;
            _2548 = _2664;
            _2612 = _2672;
            _2674 = true;
        }
        else
        {
            bool _2676 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2678 = isnan(_1993);
            bool _2680 = _2676 || _2678;
            bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2684 = _2680 || _2682;
            if (!_2684)
            {
                _2560 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2686 = _2560;
            _2562 = _2686;
            if (!_2684)
            {
                _2566 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2688 = _2566;
            _2568 = _2688;
            if (!_2684)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2690 = _2546;
            _2548 = _2690;
            if (!_2684)
            {
                _2554 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2692 = _2554;
            _2556 = _2692;
            if (!_2684)
            {
                _2592 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2694 = _2592;
            _2594 = _2694;
            if (!_2684)
            {
                _2610 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2696 = _2610;
            bool _2698 = !_2684;
            _2612 = _2696;
            if (!_2698)
            {
                bool _2700 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2702 = isnan(_1993);
                bool _2704 = _2700 || _2702;
                bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2708 = _2704 || _2706;
                if (!_2708)
                {
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2712 = _1993 + _2710;
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2716 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2714;
                    float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2722 = 1.0 / _2716;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2740 = _2712 * _2722;
                    float _2742 = precise::clamp(_2740, 0.0, 1.0);
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2748 = fma(_2742, _2720, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2750 = fma(_2742, _2746, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2752 = fma(_2742, _2726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2754 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2756 = fma(_2742, _2734, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2758 = fma(_2742, _2738, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2568 = _2752;
                    _2594 = _2756;
                    _2562 = _2748;
                    _2556 = _2754;
                    _2548 = _2750;
                    _2612 = _2758;
                    _2674 = true;
                }
                else
                {
                    _2568 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2594 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2562 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2556 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2612 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2674 = false;
    float _2760 = _2568;
    float _2762 = _2594;
    float _2764 = _2562;
    float _2766 = _2556;
    float _2768 = _2548;
    float _2770 = _2612;
    float _2772 = _2552 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2774 = fma(_2496, -0.5, 0.5);
    float _2776 = precise::clamp(_2774, 0.0, 1.0);
    float _2778 = -_2760;
    float _2780 = _2778 + _2762;
    float _2782 = -_2764;
    float _2784 = _2782 + _2766;
    out.m_89.x = 0.0;
    float _2786 = fma(_2776, _2780, _2760);
    float _2788 = -_2768;
    float _2790 = _2788 + _2770;
    float _2792 = fma(_2776, _2784, _2764);
    float _2794 = _2786 * 0.586610972881317138671875;
    bool _2796 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2798 = fma(_2776, _2790, _2768);
    out.m_53.x = _2772;
    float _2800 = fma(_2792, 0.298911988735198974609375, _2794);
    bool _2802 = _1965 > 0.0;
    bool _2804 = isnan(_1965);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan(0.0);
    bool _2810 = _2806 || _2808;
    float _2812 = fma(_2798, 0.114477999508380889892578125, _2800);
    float _2814 = -_2812;
    float _2816 = _2792 + _2814;
    float _2818 = -_2812;
    float _2820 = _2786 + _2818;
    float _2822 = -_2812;
    float _2824 = _2798 + _2822;
    float _2826 = fma(_2816, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2812);
    float _2828 = fma(_2820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2812);
    float _2830 = fma(_2824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2812);
    bool _2832 = !_2796;
    if (!_2832)
    {
        float _2834 = -_1911;
        float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2838 = -_1913;
        float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2842 = -_1915;
        float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2846 = _2836 * _2836;
        float _2848 = fma(_2840, _2840, _2846);
        float _2850 = fma(_2844, _2844, _2848);
        float _2852 = sqrt(_2850);
        float _2854 = rsqrt(_2850);
        float _2856 = -_2852;
        float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2860 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = _2840 * _2854;
        float _2866 = _2836 * _2854;
        float _2868 = abs(_2862);
        float _2870 = log2(_2868);
        float _2872 = _2844 * _2854;
        float _2874 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2876 = _2496 * _2866;
        float _2878 = -_2866;
        float _2880 = -_2874;
        float _2882 = fma(_2878, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2880);
        float _2884 = fma(_2502, _2864, _2876);
        float _2886 = -_2872;
        float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2882);
        float _2890 = fma(_2504, _2872, _2884);
        float _2892 = precise::clamp(_2890, 0.0, 1.0);
        float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2896 = _2888 + _2894;
        float _2898 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2900 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2902 = precise::clamp(_2900, 0.0, 1.0);
        float _2904 = exp2(_2898);
        float _2906 = _2904 * _2902;
        float _2908 = _2892 * _2906;
        float _2910 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2912 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2914 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2910;
        out.m_89.y = _2912;
        out.m_89.z = _2914;
    }
    out.m_91.x = _2826;
    out.m_91.y = _2828;
    out.m_91.z = _2830;
    if (_2810)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2916 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2916;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2674 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2984 = as_type<float>(_134);
        out.gl_Position.z = _2984;
    }
    if (!_120)
    {
        return out;
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_112);
    bool _148 = _116 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _124;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    int _156 = 0;
    if (_152)
    {
        float _158 = _154 * 5.0;
        _156 = as_type<int>(_158);
    }
    int _160 = _156;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3039 = as_type<float>(_160);
        out.gl_Position.z = _3039;
    }
    if (_152)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _146;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _186;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _238;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = _250 * _254;
    float _266 = -_250;
    float _268 = _266 + 1.0;
    float _270 = _222 * _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = fma(_280, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = _276 * _264;
    float _288 = _284 * _264;
    float _290 = _282 * _264;
    float _292 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _286);
    float _294 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _288);
    float _296 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _290);
    float _298 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _294);
    float _302 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].z, _296);
    bool _304 = !_262;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _194 = _320;
    }
    float _322 = _194;
    float _324 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _326 = int(_324);
    float _328 = in.m_57.x;
    float _330 = in.m_57.y;
    float _332 = in.m_59.y;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _336 = _334 != 0;
    float _338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _340 = int(_338);
    float _342 = in.m_59.x;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _346 = _344 != 0;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _350 = float(_326);
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _354 = _352 != 0;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _358 = 1.0 / _350;
    float _360 = float(uint(_340));
    float _362 = _328 * 2.0;
    int _364 = ~_340;
    int _366 = _364 + 1;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _372 = _330 > 0.5;
    float _374 = 1.0 / _360;
    int _376 = ~_340;
    int _378 = _376 + 1;
    float _380 = _358 * _116;
    float _382 = 1.0 / _370;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _384;
    float _388 = trunc(_380);
    int _390 = int(_388);
    int _392 = as_type<int>(_374) + (-2);
    float _394 = floor(_362);
    float _396 = _386 * _382;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _402 = float(uint(_390));
    float _404 = as_type<float>(_392) * _402;
    int _406 = ~_340;
    int _408 = _406 + 1;
    float _410 = trunc(_404);
    float _412 = precise::max(_410, 0.0);
    uint _415 = uint(_412);
    int _417 = _408 * int(_415);
    int _419 = _417 + _390;
    float _421 = float(uint(_419));
    float _423 = as_type<float>(_392) * _421;
    float _425 = trunc(_423);
    float _427 = precise::max(_425, 0.0);
    uint _429 = uint(_427);
    bool _431 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _433 = isnan(1.0);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _439 = _435 || _437;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _443 = 1.0 + _441;
    float _445 = float(_340);
    int _447 = int(_415) + int(_429);
    bool _449 = !_336;
    float _451 = _449 ? 7.345489978790283203125 : 1.0;
    float _453 = _328 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _455 = float(_390);
    int _457 = _366 * _447;
    int _459 = _457 + _390;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _463 = _461 != 0;
    float _465 = _451 * _328;
    bool _467 = _455 >= _445;
    bool _469 = isnan(_455);
    bool _471 = _467 || _469;
    bool _473 = isnan(_445);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_332;
    float _481 = _479 + 1.0;
    bool _483 = uint(_459) >= uint(_340);
    float _485 = floor(_465);
    float _487 = -_348;
    float _489 = fma(_453, 2.0, _487);
    float _491 = _445 * _116;
    bool _493 = !_483;
    int _495 = _493 ? 0 : (-1);
    float _497 = _332;
    float _499 = _342;
    if (_346)
    {
        float _501 = _372 ? _481 : _332;
        _497 = _501;
    }
    float _503 = _497;
    float _505 = trunc(_477);
    int _507 = int(_505);
    int _509 = ~_447;
    int _511 = _509 + _495;
    int _513 = _511 + 1;
    float _515 = 0.0;
    if (_463)
    {
        float _517 = in.m_57.x;
        _515 = _517;
    }
    float _519 = _515;
    bool _521 = _340 == 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _533 = _531 != 0;
    float _535 = -_485;
    float _537 = _465 + _535;
    int _539 = _340 * _513;
    int _541 = _539 + _390;
    float _543 = _330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _545 = !_354;
    int _547 = _545 ? 0 : 1;
    float _549 = _537 * _445;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _553 = _551 != 0;
    float _555 = fma(_543, -2.0, _356);
    bool _557 = !_521;
    int _559 = _557 ? _541 : (-1);
    float _561 = _491 * _168;
    int _563 = ~_507;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = trunc(_549);
    int _571 = int(_569);
    bool _573 = !_529;
    int _575 = _573 ? 0 : 1;
    int _577 = abs(_547);
    int _579 = _559 * _567;
    bool _581 = !_525;
    int _583 = _581 ? 0 : 1;
    float _585 = in.m_46.x;
    float _587 = in.m_46.y;
    float _589 = in.m_46.z;
    int _591 = _340 + (-1);
    float _593 = trunc(_561);
    int _595 = int(_593);
    int _597 = abs(_575);
    bool _599 = !_533;
    int _601 = _599 ? 0 : 1;
    int _603 = _507 * _591;
    int _605 = _603 + _579;
    int _607 = abs(_583);
    int _609 = _571 * _577;
    int _611 = _609 + _390;
    int _613 = abs(_601);
    int _615 = _605 * _597;
    float _617 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _619 = log2(_617);
    int _621 = _595 * _607;
    int _623 = _621 + _615;
    bool _625 = !_553;
    int _627 = _625 ? 0 : 1;
    int _629 = _611 * _613;
    int _631 = _629 + _623;
    int _633 = abs(_627);
    float _635 = _587 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = _587 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _639 = _587 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _645 = _571 * _633;
    int _647 = _645 + _631;
    float _649 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    float _651 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[5].x, _637);
    float _653 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[6].x, _639);
    float _655 = _619 * _116;
    float _657 = float(uint(_647));
    float _659 = 1.0 / _643;
    float _661 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[4].z, _649);
    float _663 = as_type<float>(_392) * _657;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _673 = trunc(_663);
    float _675 = precise::max(_673, 0.0);
    uint _677 = uint(_675);
    float _679 = in.m_57.z;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _685 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _691 = _519 > 0.5;
    bool _693 = _691 && _463;
    float _695 = _330 * 2.0;
    float _697 = 1.0 / _683;
    float _699 = _330 + _328;
    out.m_63.x = _685;
    out.m_63.y = _687;
    out.m_63.z = _689;
    out.m_63.w = _669;
    bool _701 = _394 > 0.0;
    float _703 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[5].z, _651);
    bool _705 = _394 >= 0.0;
    bool _707 = isnan(_394);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    int _715 = _378 * int(_677);
    int _717 = _715 + _647;
    float _719 = exp2(_655);
    int _721 = _713 ? 0 : 1;
    float _723 = float(uint(_717));
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _725;
    float _729 = floor(_695);
    float _731 = _699 + (-1.0);
    float _733 = _400 * _659;
    float _735 = as_type<float>(_392) * _723;
    float _737 = _727 * _697;
    float _739 = _330 + _679;
    float _741 = -_719;
    float _743 = _741 + 1.0;
    float _745 = _723;
    if (_463)
    {
        _745 = _342;
    }
    float _747 = _745;
    float _749 = trunc(_735);
    float _751 = precise::max(_749, 0.0);
    uint _753 = uint(_751);
    float _755 = _739 + (-1.0);
    int _757 = ~_340;
    int _759 = _757 + 1;
    float _761 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _555);
    float _763 = _747;
    if (_693)
    {
        float _765 = -_747;
        float _767 = _765 + 1.0;
        _763 = _767;
    }
    float _769 = _763;
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _773 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _775 = 1.0 / _443;
    bool _777 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _785 = _781 || _783;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _789 = _729 >= 0.0;
    bool _791 = isnan(_729);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    float _799 = _785 ? _743 : 0.0;
    float _801 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[78].z, _787);
    int _803 = int(_677) + int(_753);
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _807 = _729 > 0.0;
    float _809 = -_116;
    float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[76].x, _489);
    float _813 = _679 * 2.0;
    float _815 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _805);
    float _817 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _801);
    int _819 = _759 * _803;
    int _821 = _819 + _647;
    if (_463)
    {
        _499 = _769;
    }
    float _823 = _499;
    float _825 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _815);
    if (_439)
    {
        float _827 = _799 * _775;
        _126 = _827;
    }
    float _829 = _126;
    float _831 = float(uint(_611));
    float _833 = floor(_813);
    int _835 = _797 ? 0 : 1;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _839 = _322 + _837;
    bool _841 = uint(_821) >= uint(_340);
    float _843 = as_type<float>(_392) * _831;
    int _845 = ~_721;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    float _851 = fma(_396, _839, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _853 = ~_835;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    int _859 = _849;
    int _861 = _857;
    if (!_701)
    {
        int _863 = ~_721;
        int _865 = _863 + 1;
        _859 = _865;
    }
    int _867 = _859;
    float _869 = trunc(_843);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    if (!_807)
    {
        int _875 = ~_835;
        int _877 = _875 + 1;
        _861 = _877;
    }
    int _879 = _861;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _891 = _889 != 0;
    bool _893 = !_841;
    int _895 = _893 ? 0 : (-1);
    bool _897 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _899 = isnan(_322);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    bool _909 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _911 = isnan(_322);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    int _921 = ~_803;
    int _923 = _921 + _895;
    int _925 = _923 + 1;
    float _927 = -_907;
    float _929 = _927 + 1.0;
    bool _931 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _933 = isnan(_322);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -_919;
    float _945 = _943 + 1.0;
    bool _947 = _833 > 0.0;
    float _949 = _919 * _929;
    float _951 = _941 * _945;
    float _953 = -_941;
    float _955 = _953 + 1.0;
    int _957 = ~_340;
    int _959 = _957 + 1;
    int _961 = _340 * _925;
    int _963 = _961 + _647;
    bool _965 = _833 >= 0.0;
    bool _967 = isnan(_833);
    bool _969 = _965 || _967;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    float _975 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _977 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _979 = isnan(_322);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[6].z, _653);
    float _991 = -_761;
    float _993 = fma(_825, _975, _991);
    bool _995 = !_521;
    int _997 = _995 ? _963 : (-1);
    float _999 = _987 * _955;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1003 = _322 + _1001;
    int _1005 = _959 * int(_873);
    int _1007 = _1005 + _611;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1011 = _322 + _1009;
    float _1013 = _851 * _999;
    int _1015 = _997 >> 31;
    float _1017 = fma(_733, _1003, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1019 = float(uint(_1007));
    float _1021 = -_987;
    float _1023 = _1021 + 1.0;
    int _1025 = _1015 & 3;
    float _1027 = fma(_737, _1011, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1029 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1031 = as_type<float>(_392) * _1019;
    int _1033 = _997 + _1025;
    float _1035 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1013);
    bool _1037 = !_887;
    int _1039 = _1037 ? 0 : 1;
    float _1041 = trunc(_1031);
    float _1043 = precise::max(_1041, 0.0);
    uint _1045 = uint(_1043);
    int _1047 = _1033 >> 2;
    float _1049 = fma(_1017, _951, _1035);
    int _1051 = abs(_1039);
    float _1053 = fma(_817, _1029, _811);
    int _1055 = _1047 << 4;
    int _1057 = _1055 + 368;
    float _1059 = _993 + 0.5;
    int _1061 = _973 ? 0 : 1;
    float _1063 = fma(_1027, _949, _1049);
    uint _1065 = uint(int(uint(_1057) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[int(_1067)][_1069];
    int _1073 = int(_1065) + 1;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    int _1077 = _1073 & 3;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[int(_1075)][_1077];
    int _1081 = ~_340;
    int _1083 = _1081 + 1;
    float _1085 = _989 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1087 = ~_1061;
    int _1089 = _1087 + 1;
    int _1091 = _1089 + 1;
    float _1093 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1063);
    int _1095 = _1091;
    if (!_947)
    {
        int _1097 = ~_1061;
        int _1099 = _1097 + 1;
        _1095 = _1099;
    }
    int _1101 = _1095;
    float _1103 = _703 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1105 = int(_873) + int(_1045);
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1109 = _1085 + _1107;
    float _1111 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1113 = !_883;
    int _1115 = _1113 ? 0 : 1;
    float _1117 = float(_879);
    int _1119 = _1083 * _1105;
    int _1121 = _1119 + _611;
    int _1123 = abs(_1115);
    int _1125 = _1057 + 8;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    uint _1129 = uint(int(uint(int(_1127)) >> uint(2)));
    int _1131 = int(_1127) & 3;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[int(_1129)][_1131];
    int _1135 = int(_1127) + 1;
    uint _1137 = uint(int(uint(_1135) >> uint(2)));
    int _1139 = _1135 & 3;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[int(_1137)][_1139];
    int _1143 = _997 & 3;
    bool _1145 = _1143 != 0;
    int _1147 = _997 & 3;
    bool _1149 = _1147 != 0;
    float _1151 = float(_867);
    float _1153 = _1053 + 0.5;
    float _1155 = float(_1051);
    bool _1157 = uint(_1147) > 1u;
    int _1159 = _1145 ? 0 : 1;
    float _1161 = _1155 * _1151;
    bool _1163 = !_891;
    int _1165 = _1163 ? 0 : 1;
    out.m_65.x = _1153;
    out.m_65.y = _1059;
    float _1167 = float(_1123);
    float _1169 = _1161 * (-2.0);
    int _1171 = abs(_1165);
    float _1173 = float(_1101);
    float _1175 = float(_1171);
    int _1177 = ~_1159;
    int _1179 = _1177 + 1;
    int _1181 = _1179 + 1;
    float _1183 = _1167 * _1173;
    int _1185 = _1181;
    float _1187 = _1103;
    if (!_1157)
    {
        int _1189 = ~_1159;
        int _1191 = _1189 + 1;
        _1185 = _1191;
    }
    int _1193 = _1185;
    float _1195 = _1175 * _1117;
    bool _1197 = _1147 != 3;
    bool _1199 = !_1149;
    int _1201 = _1199 ? 0 : 1;
    int _1203 = abs(_1193);
    bool _1205 = uint(_1147) >= 2u;
    int _1207 = abs(_1201);
    int _1209 = _1205 ? 0 : 1;
    int _1211 = ~_1203;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    int _1217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1219 = _1217 != 0;
    int _1221 = ~_1209;
    int _1223 = _1221 + 1;
    int _1225 = _1223 + 1;
    int _1227 = _1215 * as_type<int>(_1079);
    int _1229 = ~_1207;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    bool _1235 = !_1219;
    int _1237 = _1235 ? 0 : 1;
    int _1239 = _1225;
    if (_1197)
    {
        int _1241 = ~_1209;
        int _1243 = _1241 + 1;
        _1239 = _1243;
    }
    int _1245 = _1239;
    int _1247 = _1233 * as_type<int>(_1071);
    int _1249 = _1247 + _1227;
    bool _1251 = _1147 != 3;
    float _1253 = _661 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1255 = abs(_1237);
    float _1257 = in.m_67.x;
    float _1259 = in.m_67.y;
    float _1261 = in.m_67.z;
    int _1263 = abs(_1245);
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1267 = _1103 + _1265;
    bool _1269 = !_1251;
    int _1271 = _1269 ? 0 : (-1);
    float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1275 = _1253 + _1273;
    bool _1277 = uint(_1121) >= uint(_340);
    int _1279 = ~_1263;
    int _1281 = _1279 + 1;
    int _1283 = _1281 + 1;
    int _1285 = abs(_1271);
    float _1287 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1289 = !_1277;
    int _1291 = _1289 ? 0 : (-1);
    int _1293 = _1283 * as_type<int>(_1133);
    int _1295 = _1293 + _1249;
    float _1297 = _1183 * (-2.0);
    float _1299 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1287);
    int _1301 = ~_1105;
    int _1303 = _1301 + _1291;
    int _1305 = _1303 + 1;
    int _1307 = ~_1285;
    int _1309 = _1307 + 1;
    int _1311 = _1309 + 1;
    float _1313 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1299);
    float _1315 = fma(_773, _1297, _773);
    float _1317 = _1267 * _1267;
    int _1319 = _340 * _1305;
    int _1321 = _1319 + _611;
    int _1323 = ~_1255;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    int _1329 = _1311 * as_type<int>(_1141);
    int _1331 = _1329 + _1295;
    bool _1333 = _1313 >= 0.0;
    float _1335 = fma(_1275, _1275, _1317);
    bool _1337 = !_521;
    int _1339 = _1337 ? _1321 : (-1);
    int _1341 = _1331 * _1327;
    float _1343 = fma(_1297, _1257, _1257);
    float _1345 = fma(_1109, _1109, _1335);
    int _1347 = _1339 * _1255;
    int _1349 = _1347 + _1341;
    float _1351 = rsqrt(_1345);
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1333)
    {
        _1355 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1357 = _1355;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1363 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1365 = float(_1349);
    float _1367 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1371 = as_type<int>(_1357);
    if (_1333)
    {
        float _1373 = _1357 * 5.0;
        _1371 = as_type<int>(_1373);
    }
    int _1375 = _1371;
    if (_1333)
    {
        out.m_53.x = 0.0;
    }
    float _1377 = fma(_771, _1169, _771);
    float _1379 = fma(_1169, _1259, _1259);
    float _1381 = _328 + (-0.5);
    out.m_69.x = _1367;
    out.m_69.y = _1369;
    out.m_69.z = _1363;
    out.m_69.w = _1111;
    float _1383 = _1267 * _1351;
    float _1385 = _1275 * _1351;
    if (_1333)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4877 = as_type<float>(_1375);
        out.gl_Position.z = _4877;
    }
    out.m_71.x = _1365;
    if (_1333)
    {
        return out;
    }
    float _1387 = -_1383;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1103);
    float _1391 = _1109 * _1351;
    float _1393 = -_1385;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1397 = _330 + (-0.5);
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1401 = _1389 + _1399;
    float _1403 = -_1391;
    float _1405 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1085);
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1409 = _1395 + _1407;
    float _1411 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1379);
    float _1413 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1417 = _1405 + _1415;
    float _1419 = _679 + _328;
    float _1421 = fma(_1377, _829, _1411);
    float _1423 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1413);
    float _1425 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1343);
    float _1427 = _1419 + (-1.0);
    float _1429 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1423);
    float _1431 = _1195 * (-2.0);
    float _1433 = -_1383;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1267);
    float _1437 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1439 = _1421 * 0.15915493667125701904296875;
    bool _1441 = _1429 >= 0.0;
    float _1443 = fma(_1431, _1261, _1261);
    float _1445 = _679 + (-0.5);
    float _1447 = -_1385;
    float _1449 = fma(_1447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1275);
    float _1451 = _1435 * _1435;
    float _1453 = fma(_1315, _829, _1425);
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1443);
    float _1457 = -_1391;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1109);
    float _1461 = fma(_1449, _1449, _1451);
    float _1463 = in.m_73.x;
    float _1465 = in.m_73.y;
    float _1467 = in.m_73.z;
    float _1469 = _1453 * 0.15915493667125701904296875;
    float _1471 = _1439 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = fma(_1459, _1459, _1461);
    float _1477 = _1449;
    if (_1441)
    {
        _1477 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1479 = _1477;
    float _1481 = fma(_1437, _1431, _1437);
    int _1483 = as_type<int>(_1479);
    if (_1441)
    {
        out.m_53.x = 0.0;
    }
    if (_1441)
    {
        float _1485 = _1479 * 5.0;
        _1483 = as_type<int>(_1485);
    }
    int _1487 = _1483;
    float _1489 = _1469 * 6.283185482025146484375;
    float _1491 = sin(_1489);
    float _1493 = fma(_1481, _829, _1455);
    if (_1441)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5075 = as_type<float>(_1487);
        out.gl_Position.z = _5075;
    }
    float _1495 = _1493 * 0.15915493667125701904296875;
    float _1497 = _1469 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    float _1501 = _1439 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = sqrt(_1475);
    if (_1441)
    {
        return out;
    }
    float _1507 = in.m_75.x;
    float _1509 = in.m_75.y;
    float _1511 = in.m_75.z;
    float _1513 = _1495 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = _298 * _1463;
    float _1519 = _1351 * _1505;
    float _1521 = _300 * _1465;
    float _1523 = _302 * _1467;
    float _1525 = _1491 * _1473;
    float _1527 = _1491 * _1503;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1531 = _1495 * 6.283185482025146484375;
    float _1533 = sin(_1531);
    float _1535 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1537 = _1499 * _1503;
    float _1539 = _1499 * _1473;
    float _1541 = _1519 * _1529;
    float _1543 = _1519 * _1535;
    float _1545 = _1491 * _1515;
    float _1547 = _1499 * _1515;
    float _1549 = _1503 * _1515;
    float _1551 = _1473 * _1515;
    float _1553 = _1523 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1555 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1509);
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1507);
    float _1559 = _1519 * _1553;
    float _1561 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1511);
    float _1563 = _1555 * _1541;
    float _1565 = _1557 * _1543;
    float _1567 = fma(_1533, _1537, _1525);
    float _1569 = _1561 * _1559;
    float _1571 = _1547 * _1563;
    float _1573 = -_1527;
    float _1575 = fma(_1533, _1539, _1573);
    float _1577 = -_1563;
    float _1579 = _1533 * _1577;
    float _1581 = -_1539;
    float _1583 = fma(_1533, _1527, _1581);
    float _1585 = fma(_1567, _1565, _1571);
    float _1587 = _1545 * _1563;
    float _1589 = fma(_1549, _1565, _1579);
    float _1591 = fma(_1533, _1525, _1537);
    float _1593 = fma(_1575, _1569, _1585);
    float _1595 = fma(_1583, _1565, _1587);
    float _1597 = fma(_1551, _1569, _1589);
    float _1599 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1601 = fma(_1591, _1569, _1595);
    float _1603 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1605 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1607 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1599);
    float _1609 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1603);
    float _1611 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1605);
    float _1613 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1607);
    float _1615 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1609);
    float _1617 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1611);
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1621 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1623 = _1085 + _1619;
    float _1625 = _1253 + _1621;
    float _1627 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1631 = _1623 + _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1635 = _1625 + _1633;
    float _1637 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1627);
    float _1639 = _1631 * _1631;
    float _1641 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1637);
    float _1643 = fma(_1635, _1635, _1639);
    float _1645 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1647 = sqrt(_1643);
    float _1649 = _1103 + _1645;
    bool _1651 = _1647 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1653 = _1617;
    float _1655 = _1637;
    float _1657 = _1625;
    if (!_1651)
    {
        _1653 = _1625;
    }
    float _1659 = _1653;
    float _1661 = _1659;
    if (!_1651)
    {
        _1655 = _1623;
    }
    float _1663 = _1655;
    float _1665 = _1663;
    if (!_1651)
    {
        _1657 = _1649;
    }
    float _1667 = _1657;
    bool _1669 = !_1651;
    float _1671 = _1667;
    if (!_1669)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1677 = _1647 + _1675;
        float _1679 = rsqrt(_1643);
        float _1681 = _1677 * _1673;
        float _1683 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1685 = _1681 * 0.15915493667125701904296875;
        float _1687 = _1685 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        float _1691 = _1685 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = _1689 + (-1.0);
        float _1697 = fma(_1693, _1683, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1699 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1701 = _1679 * _1697;
        float _1703 = fma(_1649, _1689, _1699);
        float _1705 = fma(_1635, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1707 = fma(_1631, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1671 = _1703;
        _1661 = _1705;
        _1665 = _1707;
    }
    float _1709 = _1671;
    float _1711 = _1661;
    float _1713 = _1665;
    float _1715 = -_1103;
    float _1717 = _1715 + _1709;
    float _1719 = -_1253;
    float _1721 = _1719 + _1711;
    float _1723 = -_1085;
    float _1725 = _1723 + _1713;
    float _1727 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1729 = _1717 * _1717;
    float _1731 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1733 = 1.0 / _1727;
    float _1735 = fma(_1721, _1721, _1729);
    float _1737 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1731);
    bool _1739 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1741 = isnan(0.5);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1747 = _1743 || _1745;
    float _1749 = fma(_1725, _1725, _1735);
    float _1751 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1737);
    bool _1753 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1755 = isnan(0.5);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1761 = _1757 || _1759;
    float _1763 = sqrt(_1749);
    float _1765 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1767 = _1765 + _1727;
    float _1769 = _1767 * _1733;
    float _1771 = _1769 * 0.5;
    bool _1773 = _1763 > 0.0;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1777 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1775);
    float _1779 = 1.0 / _1777;
    bool _1781 = !_1773;
    float _1783 = _1711;
    float _1785 = _1709;
    float _1787 = _1713;
    if (!_1781)
    {
        float _1789 = _186 * _186;
        float _1791 = rsqrt(_1749);
        float _1793 = fma(_188, _188, _1789);
        float _1795 = fma(_190, _190, _1793);
        float _1797 = sqrt(_1795);
        float _1799 = _1721 * _1791;
        float _1801 = _1717 * _1791;
        float _1803 = _1725 * _1791;
        bool _1805 = _1797 > 0.0;
        bool _1807 = !_1805;
        if (!_1807)
        {
            float _1809 = rsqrt(_1795);
            float _1811 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1813 = _186 * _1809;
            float _1815 = _188 * _1809;
            float _1817 = _1801 * _1813;
            float _1819 = _190 * _1809;
            float _1821 = fma(_1799, _1815, _1817);
            float _1823 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1825 = fma(_1803, _1819, _1821);
            float _1827 = _1825 * _1823;
            float _1829 = fma(_188, _1827, _1711);
            float _1831 = fma(_186, _1827, _1709);
            float _1833 = fma(_190, _1827, _1713);
            _1783 = _1829;
            _1785 = _1831;
            _1787 = _1833;
        }
    }
    float _1835 = _1783;
    float _1837 = _1785;
    float _1839 = _1787;
    float _1841 = -_1385;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1835);
    float _1845 = -_1383;
    float _1847 = fma(_1845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1837);
    float _1849 = -_1391;
    float _1851 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1839);
    float _1853 = _1847;
    float _1855 = _1843;
    float _1857 = _1851;
    if (_1761)
    {
        _196 = 1.0;
    }
    float _1859 = _196;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1863 = _1779 * _1861;
    float _1865 = _1859;
    if (!_1747)
    {
        float _1867 = _1401 * _1401;
        float _1869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1871 = -_1085;
        float _1873 = _1871 + _1839;
        float _1875 = -_1253;
        float _1877 = _1875 + _1835;
        float _1879 = fma(_1409, _1409, _1867);
        float _1881 = fma(_1417, _1417, _1879);
        float _1883 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1885 = sqrt(_1881);
        float _1887 = 1.0 / _1519;
        float _1889 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1891 = precise::min(_1885, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1893 = _1891 * _1869;
        float _1895 = _1893 * _1887;
        float _1897 = -_1103;
        float _1899 = _1897 + _1837;
        float _1901 = _1889 * _1895;
        float _1903 = _1873 * _1895;
        float _1905 = fma(_1899, _1901, _1389);
        float _1907 = fma(_1877, _1901, _1395);
        float _1909 = fma(_1889, _1903, _1405);
        _1853 = _1905;
        _1855 = _1907;
        _1857 = _1909;
    }
    float _1911 = _1853;
    float _1913 = _1855;
    float _1915 = _1857;
    if (!_1761)
    {
        float _1917 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1919 = _1917 * 0.15915493667125701904296875;
        float _1921 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1923 = _1919 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        float _1927 = _1921 * 0.15915493667125701904296875;
        float _1929 = _1919 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        float _1933 = 1.0 / _1925;
        float _1935 = _1927 * 6.283185482025146484375;
        float _1937 = cos(_1935);
        float _1939 = _1931 * _1933;
        float _1941 = _1927 * 6.283185482025146484375;
        float _1943 = sin(_1941);
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1945;
        float _1949 = _1937 * _1939;
        float _1951 = 1.0 / _1947;
        float _1953 = 1.0 / _1949;
        float _1955 = _1943 * _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1959 = fma(_1863, _1955, _1957);
        float _1961 = _1959 * _1951;
        float _1963 = precise::clamp(_1961, 0.0, 1.0);
        _1865 = _1963;
    }
    float _1965 = _1865;
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1969 = _1911 + _1967;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1973 = _1913 + _1971;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1977 = _1915 + _1975;
    float _1979 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1981 = _1969 * _1969;
    float _1983 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1979);
    float _1985 = fma(_1973, _1973, _1981);
    float _1987 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1983);
    float _1989 = fma(_1977, _1977, _1985);
    float _1991 = rsqrt(_1989);
    float _1993 = sqrt(_1989);
    float _1995 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1997 = _1973 * _1995;
    float _1999 = _1977 * _1995;
    float _2001 = _1997 * _1997;
    float _2003 = _1999 * _1999;
    float _2005 = _2001 + _2003;
    float _2007 = sqrt(_2005);
    bool _2009 = _2007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = _2007 + _2011;
    float _2015 = _1977;
    float _2017 = _2005;
    float _2019 = _2013;
    float _2021 = _1981;
    float _2023 = _1969;
    if (_2009)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2025;
    }
    float _2027 = _2015;
    if (_2009)
    {
        float _2029 = rsqrt(_2005);
        _2017 = _2029;
    }
    float _2031 = _2017;
    float _2033 = _2031;
    if (_2009)
    {
        float _2035 = _2013 * _2027;
        _2019 = _2035;
    }
    float _2037 = _2019;
    if (_2009)
    {
        float _2039 = _2037 * 0.15915493667125701904296875;
        _2021 = _2039;
    }
    float _2041 = _2021;
    float _2043 = _1991;
    float _2045 = _2041;
    if (_2009)
    {
        float _2047 = _2041 * 6.283185482025146484375;
        float _2049 = sin(_2047);
        _2043 = _2049;
    }
    float _2051 = _2043;
    float _2053 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2055 = precise::max(0.0, _2053);
    float _2057 = _2027;
    if (_2009)
    {
        float _2059 = _2041 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        _2057 = _2061;
    }
    float _2063 = _2057;
    float _2065 = -_1995;
    float _2067 = -_2055;
    float _2069 = fma(_1969, _2065, _2067);
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2009)
    {
        float _2073 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2023 = _2073;
    }
    float _2075 = _2023;
    float _2077 = _2075;
    if (!_2009)
    {
        _2045 = _1997;
    }
    float _2079 = _2045;
    float _2081 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2083 = _2051;
    float _2085 = _2079;
    if (_2009)
    {
        float _2087 = fma(_2051, _2075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2077 = _2087;
    }
    float _2089 = _2077;
    float _2091 = _2089;
    if (!_2009)
    {
        _2083 = _1999;
    }
    float _2093 = _2083;
    float _2095 = _2093;
    float _2097 = _2063;
    if (_2009)
    {
        float _2099 = _2063 + (-1.0);
        _2071 = _2099;
    }
    float _2101 = _2071;
    float _2103 = _2101;
    if (_2009)
    {
        float _2105 = _2031 * _2089;
        _1187 = _2105;
    }
    float _2107 = _1187;
    if (!_2009)
    {
        _2091 = _2069;
    }
    float _2109 = _2091;
    float _2111 = _2109;
    if (_2009)
    {
        float _2113 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2103 = _2113;
    }
    float _2115 = _2103;
    if (_2009)
    {
        float _2117 = _1997 * _2107;
        _2085 = _2117;
    }
    float _2119 = _2085;
    if (!_2009)
    {
        _2033 = _2001;
    }
    float _2121 = _2033;
    float _2123 = _2121;
    if (_2009)
    {
        float _2125 = _1999 * _2107;
        _2095 = _2125;
    }
    float _2127 = _2095;
    if (_2009)
    {
        float _2129 = fma(_2069, _2063, _2115);
        _2111 = _2129;
    }
    float _2131 = _2111;
    if (_2009)
    {
        float _2133 = _2119 * _2119;
        _2123 = _2133;
    }
    float _2135 = _2123;
    if (!_2009)
    {
        _2097 = _2003;
    }
    float _2137 = _2097;
    float _2139 = _2137;
    if (_2009)
    {
        float _2141 = _2127 * _2127;
        _2139 = _2141;
    }
    float _2143 = _2139;
    float _2145 = fma(_2131, _2131, _2135);
    float _2147 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2149 = floor(_2081);
    float _2151 = _2145 + _2143;
    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2155 = fma(_1993, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2153);
    float _2157 = precise::clamp(_2155, 0.0, 1.0);
    float _2159 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2147);
    float _2161 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2163 = -_2157;
    float _2165 = _2163 + 1.0;
    float _2167 = rsqrt(_2151);
    float _2169 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2171 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2173 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2159);
    float _2175 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2171);
    float _2177 = _2173 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2179 = abs(_2165);
    float _2181 = log2(_2179);
    float _2183 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2185 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2175);
    float _2187 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2189 = -_2149;
    float _2191 = _2081 + _2189;
    float _2193 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2183);
    float _2195 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2197 = -_2187;
    float _2199 = fma(_2197, _2161, 1.0);
    float _2201 = _2167 * _2119;
    float _2203 = _2167 * _2131;
    float _2205 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2193);
    float _2207 = _2167 * _2127;
    float _2209 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2211 = floor(_2169);
    float _2213 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2215 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2217 = -_2209;
    float _2219 = fma(_2203, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2217);
    float _2221 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2223 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2225 = -_2207;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2219);
    float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2215);
    float _2231 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2233 = exp2(_2221);
    float _2235 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2237 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2229);
    float _2239 = fma(_2227, 0.5, 0.5);
    float _2241 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2237);
    float _2243 = -_2211;
    float _2245 = _2169 + _2243;
    float _2247 = log2(_2199);
    float _2249 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2223);
    float _2251 = _2203 + 1.0;
    float _2253 = fma(_2239, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2255 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2249);
    float _2257 = fma(_2239, _2253, -0.212114393711090087890625);
    float _2259 = 1.0 / _2241;
    float _2261 = fma(_2227, -0.5, 0.5);
    float _2263 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2235);
    float2 _6310 = float2(_2191, _2245);
    float _2265 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).x;
    float _2267 = fma(_2239, _2257, 1.570728778839111328125);
    float _2269 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2263);
    float _2271 = sqrt(_2261);
    float _2273 = _2247 * 0.693147182464599609375;
    float _2275 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2277 = -_2203;
    float _2279 = fma(_2233, _2251, _2277);
    float _2281 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2283 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2269);
    float _2285 = fma(_2279, 0.5, 0.5);
    float _2287 = _2281 * _2259;
    float _2289 = _2283 * _2259;
    float _2291 = _2271 * 0.636619746685028076171875;
    float _2293 = fma(_2287, 0.5, 0.5);
    float _2295 = fma(_2289, -0.5, 0.5);
    float _2297 = -_2267;
    float _2299 = fma(_2291, _2297, 1.0);
    float3 _6375 = float3(_2293, _2295, _2275);
    float _2301 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6375, float3(0.0), isnan(_6375)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6375, float3(0.0), isnan(_6375)), level(0.0)).x;
    float3 _6386 = float3(_2293, _2295, _2275);
    float4 _2304 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6386, float3(0.0), isnan(_6386)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6386, float3(0.0), isnan(_6386)), level(0.0)).xyzw;
    float _2306 = _2304.x;
    float _2308 = _2304.y;
    float _2310 = _2304.z;
    float _2312 = _2304.w;
    float2 _6402 = float2(_2299, _2285);
    float3 _2316 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6402, float2(0.0), isnan(_6402)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6402, float2(0.0), isnan(_6402)), level(0.0)).xyz;
    float _2318 = _2316.x;
    float _2320 = _2316.y;
    float _2322 = _2316.z;
    float _2324 = abs(_1863);
    float _2326 = log2(_2324);
    float _2328 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2330 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2332 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2334 = _1509 != 0.0;
    bool _2336 = isnan(_1509);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(0.0);
    bool _2342 = _2338 || _2340;
    float _2344 = in.m_77.x;
    float _2346 = in.m_77.y;
    float _2348 = in.m_77.z;
    float _2350 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2328);
    float _2352 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2330);
    bool _2354 = _1507 == 0.0;
    bool _2356 = !_2342;
    bool _2358 = _2354 && _2356;
    float _2360 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2332);
    float _2362 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2364 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2366 = _1511 == 0.0;
    bool _2368 = _2366 && _2358;
    float _2370 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2372 = -_1533;
    float _2374 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2362);
    float _2376 = -_1533;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2364);
    float _2380 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2382 = -_1533;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2370);
    float _2386 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2388 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2390 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2392 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2352);
    float _2394 = exp2(_2380);
    float _2396 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2360);
    float _2398 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2386);
    float _2400 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2388);
    float _2402 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2390);
    float _2404 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2406 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2398);
    float _2408 = _2346;
    float _2410 = _2344;
    float _2412 = _2348;
    float _2414 = _2283;
    float _2416 = _2281;
    if (!_2368)
    {
        float _2418 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2346);
        _2408 = _2418;
    }
    float _2420 = _2408;
    if (!_2368)
    {
        float _2422 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2344);
        _2410 = _2422;
    }
    float _2424 = _2410;
    if (!_2368)
    {
        float _2426 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2348);
        _2412 = _2426;
    }
    float _2428 = _2412;
    float _2430 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2374);
    float _2432 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2378);
    float _2434 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2384);
    float _2436 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2400);
    float _2438 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2402);
    float _2440 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2442 = precise::clamp(_2440, 0.0, 1.0);
    float _2444 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2404);
    float _2446 = _2430 * _2420;
    float _2448 = _2432 * _2420;
    float _2450 = _2434 * _2420;
    float _2452 = fma(_2442, -2.0, 3.0);
    float _2454 = _2442 * _2442;
    float _2456 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2458 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2444);
    float _2460 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2350);
    float _2462 = fma(_2396, _2424, _2450);
    float _2464 = _2454 * _2452;
    float _2466 = exp2(_2456);
    float _2468 = fma(_2460, _2424, _2446);
    float _2470 = fma(_2392, _2424, _2448);
    float _2472 = -_2464;
    float _2474 = _2472 + 1.0;
    float _2476 = in.m_79.x;
    bool _2478 = _1863 <= 8000.0;
    bool _2480 = isnan(_1863);
    bool _2482 = _2478 || _2480;
    bool _2484 = isnan(8000.0);
    bool _2486 = _2482 || _2484;
    float _2488 = float(_2486);
    float _2490 = _2241 * 0.5;
    float _2492 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2464);
    float _2494 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2458);
    float _2496 = fma(_2436, _2428, _2470);
    float _2498 = fma(_2283, -0.5, _2490);
    float _2500 = _2488 * _2492;
    float _2502 = fma(_2406, _2428, _2468);
    float _2504 = fma(_2438, _2428, _2462);
    float _2506 = _2494 + _2241;
    float _2508 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2510 = -_2466;
    float _2512 = _2510 + 1.0;
    float _2514 = _2281 + _2241;
    float _2516 = _2506 * 0.5;
    float _2518 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2520 = _2514 * 0.5;
    out.m_81.x = _2502;
    out.m_81.y = _2496;
    out.m_81.z = _2504;
    bool _2522 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2524 = isnan(_1993);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2530 = _2526 || _2528;
    out.m_83.x = _2520;
    out.m_83.y = _2498;
    out.m_83.z = _2516;
    out.m_83.w = _2241;
    out.gl_Position.x = _2281;
    out.gl_Position.y = _2283;
    out.gl_Position.z = _2494;
    out.gl_Position.w = _2241;
    float _2532 = -_2518;
    float _2534 = _2532 + 1.0;
    float _2536 = _2241;
    float _2538 = _2516;
    float _2540 = _2498;
    float _2542 = _2534;
    if (!_2530)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2544 = _2536;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2530)
    {
        _2538 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2550 = _2538;
    float _2552 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2554 = _2550;
    float _2556 = _2550;
    if (!_2530)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2558 = _2414;
    float _2560 = _2558;
    float _2562 = _2558;
    if (!_2530)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2564 = _2416;
    float _2566 = _2564;
    float _2568 = _2564;
    if (!_2530)
    {
        _2540 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2570 = _2540;
    float _2572 = -_2265;
    float _2574 = _2572 + 1.0;
    float _2576 = _2574 * _2508;
    float _2578 = precise::clamp(_2576, 0.0, 1.0);
    float _2580 = -_2578;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2584 = _2582 * _2476;
    float _2586 = _2584 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2586;
    float _2588 = _2518 * _2301;
    float _2590 = _2312 * _2534;
    float _2592 = _2570;
    float _2594 = _2570;
    if (!_2530)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2596 = _2542;
    float _2598 = _2312 * _2588;
    float _2600 = _2322 * _2588;
    float _2602 = fma(_2318, _2598, _2306);
    float _2604 = fma(_2320, _2598, _2308);
    float _2606 = fma(_2312, _2600, _2310);
    out.m_87.x = _2602;
    out.m_87.y = _2604;
    out.m_87.z = _2606;
    out.m_87.w = _2590;
    bool _2608 = !_2530;
    float _2610 = _2596;
    float _2612 = _2596;
    if (!_2608)
    {
        bool _2614 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2616 = isnan(_1993);
        bool _2618 = _2614 || _2616;
        bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2622 = _2618 || _2620;
        if (!_2622)
        {
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2626 = _1993 + _2624;
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2628;
            float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2636 = 1.0 / _2630;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2654 = _2626 * _2636;
            float _2656 = precise::clamp(_2654, 0.0, 1.0);
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2662 = fma(_2656, _2634, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2568 = _2666;
            _2594 = _2670;
            _2562 = _2662;
            _2556 = _2668;
            _2548 = _2664;
            _2612 = _2672;
            _2674 = true;
        }
        else
        {
            bool _2676 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2678 = isnan(_1993);
            bool _2680 = _2676 || _2678;
            bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2684 = _2680 || _2682;
            if (!_2684)
            {
                _2560 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2686 = _2560;
            _2562 = _2686;
            if (!_2684)
            {
                _2566 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2688 = _2566;
            _2568 = _2688;
            if (!_2684)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2690 = _2546;
            _2548 = _2690;
            if (!_2684)
            {
                _2554 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2692 = _2554;
            _2556 = _2692;
            if (!_2684)
            {
                _2592 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2694 = _2592;
            _2594 = _2694;
            if (!_2684)
            {
                _2610 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2696 = _2610;
            bool _2698 = !_2684;
            _2612 = _2696;
            if (!_2698)
            {
                bool _2700 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2702 = isnan(_1993);
                bool _2704 = _2700 || _2702;
                bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2708 = _2704 || _2706;
                if (!_2708)
                {
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2712 = _1993 + _2710;
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2716 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2714;
                    float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2722 = 1.0 / _2716;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2740 = _2712 * _2722;
                    float _2742 = precise::clamp(_2740, 0.0, 1.0);
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2748 = fma(_2742, _2720, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2750 = fma(_2742, _2746, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2752 = fma(_2742, _2726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2754 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2756 = fma(_2742, _2734, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2758 = fma(_2742, _2738, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2568 = _2752;
                    _2594 = _2756;
                    _2562 = _2748;
                    _2556 = _2754;
                    _2548 = _2750;
                    _2612 = _2758;
                    _2674 = true;
                }
                else
                {
                    _2568 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2594 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2562 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2556 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2612 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2674 = false;
    float _2760 = _2568;
    float _2762 = _2594;
    float _2764 = _2562;
    float _2766 = _2556;
    float _2768 = _2548;
    float _2770 = _2612;
    float _2772 = _2552 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2774 = fma(_2496, -0.5, 0.5);
    float _2776 = precise::clamp(_2774, 0.0, 1.0);
    float _2778 = -_2760;
    float _2780 = _2778 + _2762;
    float _2782 = -_2764;
    float _2784 = _2782 + _2766;
    out.m_89.x = 0.0;
    float _2786 = fma(_2776, _2780, _2760);
    float _2788 = -_2768;
    float _2790 = _2788 + _2770;
    float _2792 = fma(_2776, _2784, _2764);
    float _2794 = _2786 * 0.586610972881317138671875;
    bool _2796 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2798 = fma(_2776, _2790, _2768);
    out.m_53.x = _2772;
    float _2800 = fma(_2792, 0.298911988735198974609375, _2794);
    bool _2802 = _1965 > 0.0;
    bool _2804 = isnan(_1965);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan(0.0);
    bool _2810 = _2806 || _2808;
    float _2812 = fma(_2798, 0.114477999508380889892578125, _2800);
    float _2814 = -_2812;
    float _2816 = _2792 + _2814;
    float _2818 = -_2812;
    float _2820 = _2786 + _2818;
    float _2822 = -_2812;
    float _2824 = _2798 + _2822;
    float _2826 = fma(_2816, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2812);
    float _2828 = fma(_2820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2812);
    float _2830 = fma(_2824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2812);
    bool _2832 = !_2796;
    if (!_2832)
    {
        float _2834 = -_1911;
        float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2838 = -_1913;
        float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2842 = -_1915;
        float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2846 = _2836 * _2836;
        float _2848 = fma(_2840, _2840, _2846);
        float _2850 = fma(_2844, _2844, _2848);
        float _2852 = sqrt(_2850);
        float _2854 = rsqrt(_2850);
        float _2856 = -_2852;
        float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2860 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = _2840 * _2854;
        float _2866 = _2836 * _2854;
        float _2868 = abs(_2862);
        float _2870 = log2(_2868);
        float _2872 = _2844 * _2854;
        float _2874 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2876 = _2496 * _2866;
        float _2878 = -_2866;
        float _2880 = -_2874;
        float _2882 = fma(_2878, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2880);
        float _2884 = fma(_2502, _2864, _2876);
        float _2886 = -_2872;
        float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2882);
        float _2890 = fma(_2504, _2872, _2884);
        float _2892 = precise::clamp(_2890, 0.0, 1.0);
        float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2896 = _2888 + _2894;
        float _2898 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2900 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2902 = precise::clamp(_2900, 0.0, 1.0);
        float _2904 = exp2(_2898);
        float _2906 = _2904 * _2902;
        float _2908 = _2892 * _2906;
        float _2910 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2912 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2914 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2910;
        out.m_89.y = _2912;
        out.m_89.z = _2914;
    }
    out.m_91.x = _2826;
    out.m_91.y = _2828;
    out.m_91.z = _2830;
    if (_2810)
    {
        return out;
    }
    float _2916 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2916;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2674 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2984 = as_type<float>(_134);
        out.gl_Position.z = _2984;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_112);
    bool _148 = _116 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _124;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    int _156 = 0;
    if (_152)
    {
        float _158 = _154 * 5.0;
        _156 = as_type<int>(_158);
    }
    int _160 = _156;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3039 = as_type<float>(_160);
        out.gl_Position.z = _3039;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _146;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _196 = _186;
    float _214;
    if (!_192)
    {
        float _198 = in.m_57.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        _214 = _172;
    }
    _216 = false;
    float _218 = _214;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    bool _240 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_218);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    float _260 = 1.0 / _238;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = _250 * _254;
    float _266 = -_250;
    float _268 = _266 + 1.0;
    float _270 = _222 * _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = fma(_280, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = _276 * _264;
    float _288 = _284 * _264;
    float _290 = _282 * _264;
    float _292 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _286);
    float _294 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _288);
    float _296 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _290);
    float _298 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _294);
    float _302 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].z, _296);
    bool _304 = !_262;
    if (!_304)
    {
        float _306 = in.m_57.x;
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _310 = _306 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _314 = _312 * _308;
        float _316 = floor(_314);
        float _318 = -_316;
        float _320 = _314 + _318;
        _194 = _320;
    }
    float _322 = _194;
    float _324 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _326 = int(_324);
    float _328 = in.m_57.x;
    float _330 = in.m_57.y;
    float _332 = in.m_59.y;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _336 = _334 != 0;
    float _338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _340 = int(_338);
    float _342 = in.m_59.x;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _346 = _344 != 0;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _350 = float(_326);
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _354 = _352 != 0;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _358 = 1.0 / _350;
    float _360 = float(uint(_340));
    float _362 = _328 * 2.0;
    int _364 = ~_340;
    int _366 = _364 + 1;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _372 = _330 > 0.5;
    float _374 = 1.0 / _360;
    int _376 = ~_340;
    int _378 = _376 + 1;
    float _380 = _358 * _116;
    float _382 = 1.0 / _370;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _384;
    float _388 = trunc(_380);
    int _390 = int(_388);
    int _392 = as_type<int>(_374) + (-2);
    float _394 = floor(_362);
    float _396 = _386 * _382;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _402 = float(uint(_390));
    float _404 = as_type<float>(_392) * _402;
    int _406 = ~_340;
    int _408 = _406 + 1;
    float _410 = trunc(_404);
    float _412 = precise::max(_410, 0.0);
    uint _415 = uint(_412);
    int _417 = _408 * int(_415);
    int _419 = _417 + _390;
    float _421 = float(uint(_419));
    float _423 = as_type<float>(_392) * _421;
    float _425 = trunc(_423);
    float _427 = precise::max(_425, 0.0);
    uint _429 = uint(_427);
    bool _431 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _433 = isnan(1.0);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _439 = _435 || _437;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _443 = 1.0 + _441;
    float _445 = float(_340);
    int _447 = int(_415) + int(_429);
    bool _449 = !_336;
    float _451 = _449 ? 7.345489978790283203125 : 1.0;
    float _453 = _328 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _455 = float(_390);
    int _457 = _366 * _447;
    int _459 = _457 + _390;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _463 = _461 != 0;
    float _465 = _451 * _328;
    bool _467 = _455 >= _445;
    bool _469 = isnan(_455);
    bool _471 = _467 || _469;
    bool _473 = isnan(_445);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_332;
    float _481 = _479 + 1.0;
    bool _483 = uint(_459) >= uint(_340);
    float _485 = floor(_465);
    float _487 = -_348;
    float _489 = fma(_453, 2.0, _487);
    float _491 = _445 * _116;
    bool _493 = !_483;
    int _495 = _493 ? 0 : (-1);
    float _497 = _332;
    float _499 = _342;
    if (_346)
    {
        float _501 = _372 ? _481 : _332;
        _497 = _501;
    }
    float _503 = _497;
    float _505 = trunc(_477);
    int _507 = int(_505);
    int _509 = ~_447;
    int _511 = _509 + _495;
    int _513 = _511 + 1;
    float _515 = 0.0;
    if (_463)
    {
        float _517 = in.m_57.x;
        _515 = _517;
    }
    float _519 = _515;
    bool _521 = _340 == 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _533 = _531 != 0;
    float _535 = -_485;
    float _537 = _465 + _535;
    int _539 = _340 * _513;
    int _541 = _539 + _390;
    float _543 = _330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _545 = !_354;
    int _547 = _545 ? 0 : 1;
    float _549 = _537 * _445;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _553 = _551 != 0;
    float _555 = fma(_543, -2.0, _356);
    bool _557 = !_521;
    int _559 = _557 ? _541 : (-1);
    float _561 = _491 * _168;
    int _563 = ~_507;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = trunc(_549);
    int _571 = int(_569);
    bool _573 = !_529;
    int _575 = _573 ? 0 : 1;
    int _577 = abs(_547);
    int _579 = _559 * _567;
    bool _581 = !_525;
    int _583 = _581 ? 0 : 1;
    float _585 = in.m_46.x;
    float _587 = in.m_46.y;
    float _589 = in.m_46.z;
    int _591 = _340 + (-1);
    float _593 = trunc(_561);
    int _595 = int(_593);
    int _597 = abs(_575);
    bool _599 = !_533;
    int _601 = _599 ? 0 : 1;
    int _603 = _507 * _591;
    int _605 = _603 + _579;
    int _607 = abs(_583);
    int _609 = _571 * _577;
    int _611 = _609 + _390;
    int _613 = abs(_601);
    int _615 = _605 * _597;
    float _617 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _619 = log2(_617);
    int _621 = _595 * _607;
    int _623 = _621 + _615;
    bool _625 = !_553;
    int _627 = _625 ? 0 : 1;
    int _629 = _611 * _613;
    int _631 = _629 + _623;
    int _633 = abs(_627);
    float _635 = _587 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = _587 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _639 = _587 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _645 = _571 * _633;
    int _647 = _645 + _631;
    float _649 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    float _651 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[5].x, _637);
    float _653 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[6].x, _639);
    float _655 = _619 * _116;
    float _657 = float(uint(_647));
    float _659 = 1.0 / _643;
    float _661 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[4].z, _649);
    float _663 = as_type<float>(_392) * _657;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _673 = trunc(_663);
    float _675 = precise::max(_673, 0.0);
    uint _677 = uint(_675);
    float _679 = in.m_57.z;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _685 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _691 = _519 > 0.5;
    bool _693 = _691 && _463;
    float _695 = _330 * 2.0;
    float _697 = 1.0 / _683;
    float _699 = _330 + _328;
    out.m_63.x = _685;
    out.m_63.y = _687;
    out.m_63.z = _689;
    out.m_63.w = _669;
    bool _701 = _394 > 0.0;
    float _703 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[5].z, _651);
    bool _705 = _394 >= 0.0;
    bool _707 = isnan(_394);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    int _715 = _378 * int(_677);
    int _717 = _715 + _647;
    float _719 = exp2(_655);
    int _721 = _713 ? 0 : 1;
    float _723 = float(uint(_717));
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _725;
    float _729 = floor(_695);
    float _731 = _699 + (-1.0);
    float _733 = _400 * _659;
    float _735 = as_type<float>(_392) * _723;
    float _737 = _727 * _697;
    float _739 = _330 + _679;
    float _741 = -_719;
    float _743 = _741 + 1.0;
    float _745 = _723;
    if (_463)
    {
        _745 = _342;
    }
    float _747 = _745;
    float _749 = trunc(_735);
    float _751 = precise::max(_749, 0.0);
    uint _753 = uint(_751);
    float _755 = _739 + (-1.0);
    int _757 = ~_340;
    int _759 = _757 + 1;
    float _761 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _555);
    float _763 = _747;
    if (_693)
    {
        float _765 = -_747;
        float _767 = _765 + 1.0;
        _763 = _767;
    }
    float _769 = _763;
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _773 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _775 = 1.0 / _443;
    bool _777 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _785 = _781 || _783;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _789 = _729 >= 0.0;
    bool _791 = isnan(_729);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    float _799 = _785 ? _743 : 0.0;
    float _801 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[78].z, _787);
    int _803 = int(_677) + int(_753);
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _807 = _729 > 0.0;
    float _809 = -_116;
    float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[76].x, _489);
    float _813 = _679 * 2.0;
    float _815 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _805);
    float _817 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _801);
    int _819 = _759 * _803;
    int _821 = _819 + _647;
    if (_463)
    {
        _499 = _769;
    }
    float _823 = _499;
    float _825 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _815);
    if (_439)
    {
        float _827 = _799 * _775;
        _126 = _827;
    }
    float _829 = _126;
    float _831 = float(uint(_611));
    float _833 = floor(_813);
    int _835 = _797 ? 0 : 1;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _839 = _322 + _837;
    bool _841 = uint(_821) >= uint(_340);
    float _843 = as_type<float>(_392) * _831;
    int _845 = ~_721;
    int _847 = _845 + 1;
    int _849 = _847 + 1;
    float _851 = fma(_396, _839, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _853 = ~_835;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    int _859 = _849;
    int _861 = _857;
    if (!_701)
    {
        int _863 = ~_721;
        int _865 = _863 + 1;
        _859 = _865;
    }
    int _867 = _859;
    float _869 = trunc(_843);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    if (!_807)
    {
        int _875 = ~_835;
        int _877 = _875 + 1;
        _861 = _877;
    }
    int _879 = _861;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _891 = _889 != 0;
    bool _893 = !_841;
    int _895 = _893 ? 0 : (-1);
    bool _897 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _899 = isnan(_322);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    bool _909 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _911 = isnan(_322);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    int _921 = ~_803;
    int _923 = _921 + _895;
    int _925 = _923 + 1;
    float _927 = -_907;
    float _929 = _927 + 1.0;
    bool _931 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _933 = isnan(_322);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -_919;
    float _945 = _943 + 1.0;
    bool _947 = _833 > 0.0;
    float _949 = _919 * _929;
    float _951 = _941 * _945;
    float _953 = -_941;
    float _955 = _953 + 1.0;
    int _957 = ~_340;
    int _959 = _957 + 1;
    int _961 = _340 * _925;
    int _963 = _961 + _647;
    bool _965 = _833 >= 0.0;
    bool _967 = isnan(_833);
    bool _969 = _965 || _967;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    float _975 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _977 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _979 = isnan(_322);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[6].z, _653);
    float _991 = -_761;
    float _993 = fma(_825, _975, _991);
    bool _995 = !_521;
    int _997 = _995 ? _963 : (-1);
    float _999 = _987 * _955;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1003 = _322 + _1001;
    int _1005 = _959 * int(_873);
    int _1007 = _1005 + _611;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1011 = _322 + _1009;
    float _1013 = _851 * _999;
    int _1015 = _997 >> 31;
    float _1017 = fma(_733, _1003, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1019 = float(uint(_1007));
    float _1021 = -_987;
    float _1023 = _1021 + 1.0;
    int _1025 = _1015 & 3;
    float _1027 = fma(_737, _1011, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1029 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1031 = as_type<float>(_392) * _1019;
    int _1033 = _997 + _1025;
    float _1035 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1013);
    bool _1037 = !_887;
    int _1039 = _1037 ? 0 : 1;
    float _1041 = trunc(_1031);
    float _1043 = precise::max(_1041, 0.0);
    uint _1045 = uint(_1043);
    int _1047 = _1033 >> 2;
    float _1049 = fma(_1017, _951, _1035);
    int _1051 = abs(_1039);
    float _1053 = fma(_817, _1029, _811);
    int _1055 = _1047 << 4;
    int _1057 = _1055 + 368;
    float _1059 = _993 + 0.5;
    int _1061 = _973 ? 0 : 1;
    float _1063 = fma(_1027, _949, _1049);
    uint _1065 = uint(int(uint(_1057) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[int(_1067)][_1069];
    int _1073 = int(_1065) + 1;
    uint _1075 = uint(int(uint(_1073) >> uint(2)));
    int _1077 = _1073 & 3;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[int(_1075)][_1077];
    int _1081 = ~_340;
    int _1083 = _1081 + 1;
    float _1085 = _989 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1087 = ~_1061;
    int _1089 = _1087 + 1;
    int _1091 = _1089 + 1;
    float _1093 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1063);
    int _1095 = _1091;
    if (!_947)
    {
        int _1097 = ~_1061;
        int _1099 = _1097 + 1;
        _1095 = _1099;
    }
    int _1101 = _1095;
    float _1103 = _703 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1105 = int(_873) + int(_1045);
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1109 = _1085 + _1107;
    float _1111 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1113 = !_883;
    int _1115 = _1113 ? 0 : 1;
    float _1117 = float(_879);
    int _1119 = _1083 * _1105;
    int _1121 = _1119 + _611;
    int _1123 = abs(_1115);
    int _1125 = _1057 + 8;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    uint _1129 = uint(int(uint(int(_1127)) >> uint(2)));
    int _1131 = int(_1127) & 3;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[int(_1129)][_1131];
    int _1135 = int(_1127) + 1;
    uint _1137 = uint(int(uint(_1135) >> uint(2)));
    int _1139 = _1135 & 3;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[int(_1137)][_1139];
    int _1143 = _997 & 3;
    bool _1145 = _1143 != 0;
    int _1147 = _997 & 3;
    bool _1149 = _1147 != 0;
    float _1151 = float(_867);
    float _1153 = _1053 + 0.5;
    float _1155 = float(_1051);
    bool _1157 = uint(_1147) > 1u;
    int _1159 = _1145 ? 0 : 1;
    float _1161 = _1155 * _1151;
    bool _1163 = !_891;
    int _1165 = _1163 ? 0 : 1;
    out.m_65.x = _1153;
    out.m_65.y = _1059;
    float _1167 = float(_1123);
    float _1169 = _1161 * (-2.0);
    int _1171 = abs(_1165);
    float _1173 = float(_1101);
    float _1175 = float(_1171);
    int _1177 = ~_1159;
    int _1179 = _1177 + 1;
    int _1181 = _1179 + 1;
    float _1183 = _1167 * _1173;
    int _1185 = _1181;
    float _1187 = _1103;
    if (!_1157)
    {
        int _1189 = ~_1159;
        int _1191 = _1189 + 1;
        _1185 = _1191;
    }
    int _1193 = _1185;
    float _1195 = _1175 * _1117;
    bool _1197 = _1147 != 3;
    bool _1199 = !_1149;
    int _1201 = _1199 ? 0 : 1;
    int _1203 = abs(_1193);
    bool _1205 = uint(_1147) >= 2u;
    int _1207 = abs(_1201);
    int _1209 = _1205 ? 0 : 1;
    int _1211 = ~_1203;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    int _1217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1219 = _1217 != 0;
    int _1221 = ~_1209;
    int _1223 = _1221 + 1;
    int _1225 = _1223 + 1;
    int _1227 = _1215 * as_type<int>(_1079);
    int _1229 = ~_1207;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    bool _1235 = !_1219;
    int _1237 = _1235 ? 0 : 1;
    int _1239 = _1225;
    if (_1197)
    {
        int _1241 = ~_1209;
        int _1243 = _1241 + 1;
        _1239 = _1243;
    }
    int _1245 = _1239;
    int _1247 = _1233 * as_type<int>(_1071);
    int _1249 = _1247 + _1227;
    bool _1251 = _1147 != 3;
    float _1253 = _661 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1255 = abs(_1237);
    float _1257 = in.m_67.x;
    float _1259 = in.m_67.y;
    float _1261 = in.m_67.z;
    int _1263 = abs(_1245);
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1267 = _1103 + _1265;
    bool _1269 = !_1251;
    int _1271 = _1269 ? 0 : (-1);
    float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1275 = _1253 + _1273;
    bool _1277 = uint(_1121) >= uint(_340);
    int _1279 = ~_1263;
    int _1281 = _1279 + 1;
    int _1283 = _1281 + 1;
    int _1285 = abs(_1271);
    float _1287 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1289 = !_1277;
    int _1291 = _1289 ? 0 : (-1);
    int _1293 = _1283 * as_type<int>(_1133);
    int _1295 = _1293 + _1249;
    float _1297 = _1183 * (-2.0);
    float _1299 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1287);
    int _1301 = ~_1105;
    int _1303 = _1301 + _1291;
    int _1305 = _1303 + 1;
    int _1307 = ~_1285;
    int _1309 = _1307 + 1;
    int _1311 = _1309 + 1;
    float _1313 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1299);
    float _1315 = fma(_773, _1297, _773);
    float _1317 = _1267 * _1267;
    int _1319 = _340 * _1305;
    int _1321 = _1319 + _611;
    int _1323 = ~_1255;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    int _1329 = _1311 * as_type<int>(_1141);
    int _1331 = _1329 + _1295;
    bool _1333 = _1313 >= 0.0;
    float _1335 = fma(_1275, _1275, _1317);
    bool _1337 = !_521;
    int _1339 = _1337 ? _1321 : (-1);
    int _1341 = _1331 * _1327;
    float _1343 = fma(_1297, _1257, _1257);
    float _1345 = fma(_1109, _1109, _1335);
    int _1347 = _1339 * _1255;
    int _1349 = _1347 + _1341;
    float _1351 = rsqrt(_1345);
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (_1333)
    {
        _1355 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1357 = _1355;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1363 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1365 = float(_1349);
    float _1367 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1371 = as_type<int>(_1357);
    if (_1333)
    {
        float _1373 = _1357 * 5.0;
        _1371 = as_type<int>(_1373);
    }
    int _1375 = _1371;
    if (_1333)
    {
        out.m_53.x = 0.0;
    }
    float _1377 = fma(_771, _1169, _771);
    float _1379 = fma(_1169, _1259, _1259);
    float _1381 = _328 + (-0.5);
    out.m_69.x = _1367;
    out.m_69.y = _1369;
    out.m_69.z = _1363;
    out.m_69.w = _1111;
    float _1383 = _1267 * _1351;
    float _1385 = _1275 * _1351;
    if (_1333)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4877 = as_type<float>(_1375);
        out.gl_Position.z = _4877;
    }
    out.m_71.x = _1365;
    if (_1333)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1387 = -_1383;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1103);
    float _1391 = _1109 * _1351;
    float _1393 = -_1385;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1397 = _330 + (-0.5);
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1401 = _1389 + _1399;
    float _1403 = -_1391;
    float _1405 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1085);
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1409 = _1395 + _1407;
    float _1411 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1379);
    float _1413 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1417 = _1405 + _1415;
    float _1419 = _679 + _328;
    float _1421 = fma(_1377, _829, _1411);
    float _1423 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1413);
    float _1425 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1343);
    float _1427 = _1419 + (-1.0);
    float _1429 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1423);
    float _1431 = _1195 * (-2.0);
    float _1433 = -_1383;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1267);
    float _1437 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1439 = _1421 * 0.15915493667125701904296875;
    bool _1441 = _1429 >= 0.0;
    float _1443 = fma(_1431, _1261, _1261);
    float _1445 = _679 + (-0.5);
    float _1447 = -_1385;
    float _1449 = fma(_1447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1275);
    float _1451 = _1435 * _1435;
    float _1453 = fma(_1315, _829, _1425);
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1443);
    float _1457 = -_1391;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1109);
    float _1461 = fma(_1449, _1449, _1451);
    float _1463 = in.m_73.x;
    float _1465 = in.m_73.y;
    float _1467 = in.m_73.z;
    float _1469 = _1453 * 0.15915493667125701904296875;
    float _1471 = _1439 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = fma(_1459, _1459, _1461);
    float _1477 = _1449;
    if (_1441)
    {
        _1477 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1479 = _1477;
    float _1481 = fma(_1437, _1431, _1437);
    int _1483 = as_type<int>(_1479);
    if (_1441)
    {
        out.m_53.x = 0.0;
    }
    if (_1441)
    {
        float _1485 = _1479 * 5.0;
        _1483 = as_type<int>(_1485);
    }
    int _1487 = _1483;
    float _1489 = _1469 * 6.283185482025146484375;
    float _1491 = sin(_1489);
    float _1493 = fma(_1481, _829, _1455);
    if (_1441)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5075 = as_type<float>(_1487);
        out.gl_Position.z = _5075;
    }
    float _1495 = _1493 * 0.15915493667125701904296875;
    float _1497 = _1469 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    float _1501 = _1439 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = sqrt(_1475);
    if (_1441)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1507 = in.m_75.x;
    float _1509 = in.m_75.y;
    float _1511 = in.m_75.z;
    float _1513 = _1495 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = _298 * _1463;
    float _1519 = _1351 * _1505;
    float _1521 = _300 * _1465;
    float _1523 = _302 * _1467;
    float _1525 = _1491 * _1473;
    float _1527 = _1491 * _1503;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1531 = _1495 * 6.283185482025146484375;
    float _1533 = sin(_1531);
    float _1535 = _1517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1537 = _1499 * _1503;
    float _1539 = _1499 * _1473;
    float _1541 = _1519 * _1529;
    float _1543 = _1519 * _1535;
    float _1545 = _1491 * _1515;
    float _1547 = _1499 * _1515;
    float _1549 = _1503 * _1515;
    float _1551 = _1473 * _1515;
    float _1553 = _1523 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1555 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1509);
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1507);
    float _1559 = _1519 * _1553;
    float _1561 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1511);
    float _1563 = _1555 * _1541;
    float _1565 = _1557 * _1543;
    float _1567 = fma(_1533, _1537, _1525);
    float _1569 = _1561 * _1559;
    float _1571 = _1547 * _1563;
    float _1573 = -_1527;
    float _1575 = fma(_1533, _1539, _1573);
    float _1577 = -_1563;
    float _1579 = _1533 * _1577;
    float _1581 = -_1539;
    float _1583 = fma(_1533, _1527, _1581);
    float _1585 = fma(_1567, _1565, _1571);
    float _1587 = _1545 * _1563;
    float _1589 = fma(_1549, _1565, _1579);
    float _1591 = fma(_1533, _1525, _1537);
    float _1593 = fma(_1575, _1569, _1585);
    float _1595 = fma(_1583, _1565, _1587);
    float _1597 = fma(_1551, _1569, _1589);
    float _1599 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1601 = fma(_1591, _1569, _1595);
    float _1603 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1605 = _1593 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1607 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1599);
    float _1609 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1603);
    float _1611 = fma(_1597, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1605);
    float _1613 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1607);
    float _1615 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1609);
    float _1617 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1611);
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1621 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1623 = _1085 + _1619;
    float _1625 = _1253 + _1621;
    float _1627 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1631 = _1623 + _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1635 = _1625 + _1633;
    float _1637 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1627);
    float _1639 = _1631 * _1631;
    float _1641 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1637);
    float _1643 = fma(_1635, _1635, _1639);
    float _1645 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1647 = sqrt(_1643);
    float _1649 = _1103 + _1645;
    bool _1651 = _1647 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1653 = _1617;
    float _1655 = _1637;
    float _1657 = _1625;
    if (!_1651)
    {
        _1653 = _1625;
    }
    float _1659 = _1653;
    float _1661 = _1659;
    if (!_1651)
    {
        _1655 = _1623;
    }
    float _1663 = _1655;
    float _1665 = _1663;
    if (!_1651)
    {
        _1657 = _1649;
    }
    float _1667 = _1657;
    bool _1669 = !_1651;
    float _1671 = _1667;
    if (!_1669)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1677 = _1647 + _1675;
        float _1679 = rsqrt(_1643);
        float _1681 = _1677 * _1673;
        float _1683 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1685 = _1681 * 0.15915493667125701904296875;
        float _1687 = _1685 * 6.283185482025146484375;
        float _1689 = cos(_1687);
        float _1691 = _1685 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = _1689 + (-1.0);
        float _1697 = fma(_1693, _1683, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1699 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1701 = _1679 * _1697;
        float _1703 = fma(_1649, _1689, _1699);
        float _1705 = fma(_1635, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1707 = fma(_1631, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1671 = _1703;
        _1661 = _1705;
        _1665 = _1707;
    }
    float _1709 = _1671;
    float _1711 = _1661;
    float _1713 = _1665;
    float _1715 = -_1103;
    float _1717 = _1715 + _1709;
    float _1719 = -_1253;
    float _1721 = _1719 + _1711;
    float _1723 = -_1085;
    float _1725 = _1723 + _1713;
    float _1727 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1729 = _1717 * _1717;
    float _1731 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1733 = 1.0 / _1727;
    float _1735 = fma(_1721, _1721, _1729);
    float _1737 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1731);
    bool _1739 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1741 = isnan(0.5);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1747 = _1743 || _1745;
    float _1749 = fma(_1725, _1725, _1735);
    float _1751 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1737);
    bool _1753 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1755 = isnan(0.5);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1761 = _1757 || _1759;
    float _1763 = sqrt(_1749);
    float _1765 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1767 = _1765 + _1727;
    float _1769 = _1767 * _1733;
    float _1771 = _1769 * 0.5;
    bool _1773 = _1763 > 0.0;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1777 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1775);
    float _1779 = 1.0 / _1777;
    bool _1781 = !_1773;
    float _1783 = _1711;
    float _1785 = _1709;
    float _1787 = _1713;
    if (!_1781)
    {
        float _1789 = _186 * _186;
        float _1791 = rsqrt(_1749);
        float _1793 = fma(_188, _188, _1789);
        float _1795 = fma(_190, _190, _1793);
        float _1797 = sqrt(_1795);
        float _1799 = _1721 * _1791;
        float _1801 = _1717 * _1791;
        float _1803 = _1725 * _1791;
        bool _1805 = _1797 > 0.0;
        bool _1807 = !_1805;
        if (!_1807)
        {
            float _1809 = rsqrt(_1795);
            float _1811 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1813 = _186 * _1809;
            float _1815 = _188 * _1809;
            float _1817 = _1801 * _1813;
            float _1819 = _190 * _1809;
            float _1821 = fma(_1799, _1815, _1817);
            float _1823 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1825 = fma(_1803, _1819, _1821);
            float _1827 = _1825 * _1823;
            float _1829 = fma(_188, _1827, _1711);
            float _1831 = fma(_186, _1827, _1709);
            float _1833 = fma(_190, _1827, _1713);
            _1783 = _1829;
            _1785 = _1831;
            _1787 = _1833;
        }
    }
    float _1835 = _1783;
    float _1837 = _1785;
    float _1839 = _1787;
    float _1841 = -_1385;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1835);
    float _1845 = -_1383;
    float _1847 = fma(_1845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1837);
    float _1849 = -_1391;
    float _1851 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1839);
    float _1853 = _1847;
    float _1855 = _1843;
    float _1857 = _1851;
    if (_1761)
    {
        _196 = 1.0;
    }
    float _1859 = _196;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1863 = _1779 * _1861;
    float _1865 = _1859;
    if (!_1747)
    {
        float _1867 = _1401 * _1401;
        float _1869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1871 = -_1085;
        float _1873 = _1871 + _1839;
        float _1875 = -_1253;
        float _1877 = _1875 + _1835;
        float _1879 = fma(_1409, _1409, _1867);
        float _1881 = fma(_1417, _1417, _1879);
        float _1883 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1885 = sqrt(_1881);
        float _1887 = 1.0 / _1519;
        float _1889 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1891 = precise::min(_1885, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1893 = _1891 * _1869;
        float _1895 = _1893 * _1887;
        float _1897 = -_1103;
        float _1899 = _1897 + _1837;
        float _1901 = _1889 * _1895;
        float _1903 = _1873 * _1895;
        float _1905 = fma(_1899, _1901, _1389);
        float _1907 = fma(_1877, _1901, _1395);
        float _1909 = fma(_1889, _1903, _1405);
        _1853 = _1905;
        _1855 = _1907;
        _1857 = _1909;
    }
    float _1911 = _1853;
    float _1913 = _1855;
    float _1915 = _1857;
    if (!_1761)
    {
        float _1917 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1919 = _1917 * 0.15915493667125701904296875;
        float _1921 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1923 = _1919 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        float _1927 = _1921 * 0.15915493667125701904296875;
        float _1929 = _1919 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        float _1933 = 1.0 / _1925;
        float _1935 = _1927 * 6.283185482025146484375;
        float _1937 = cos(_1935);
        float _1939 = _1931 * _1933;
        float _1941 = _1927 * 6.283185482025146484375;
        float _1943 = sin(_1941);
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1945;
        float _1949 = _1937 * _1939;
        float _1951 = 1.0 / _1947;
        float _1953 = 1.0 / _1949;
        float _1955 = _1943 * _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1959 = fma(_1863, _1955, _1957);
        float _1961 = _1959 * _1951;
        float _1963 = precise::clamp(_1961, 0.0, 1.0);
        _1865 = _1963;
    }
    float _1965 = _1865;
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1969 = _1911 + _1967;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1973 = _1913 + _1971;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1977 = _1915 + _1975;
    float _1979 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1981 = _1969 * _1969;
    float _1983 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1979);
    float _1985 = fma(_1973, _1973, _1981);
    float _1987 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1983);
    float _1989 = fma(_1977, _1977, _1985);
    float _1991 = rsqrt(_1989);
    float _1993 = sqrt(_1989);
    float _1995 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1997 = _1973 * _1995;
    float _1999 = _1977 * _1995;
    float _2001 = _1997 * _1997;
    float _2003 = _1999 * _1999;
    float _2005 = _2001 + _2003;
    float _2007 = sqrt(_2005);
    bool _2009 = _2007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = _2007 + _2011;
    float _2015 = _1977;
    float _2017 = _2005;
    float _2019 = _2013;
    float _2021 = _1981;
    float _2023 = _1969;
    if (_2009)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2025;
    }
    float _2027 = _2015;
    if (_2009)
    {
        float _2029 = rsqrt(_2005);
        _2017 = _2029;
    }
    float _2031 = _2017;
    float _2033 = _2031;
    if (_2009)
    {
        float _2035 = _2013 * _2027;
        _2019 = _2035;
    }
    float _2037 = _2019;
    if (_2009)
    {
        float _2039 = _2037 * 0.15915493667125701904296875;
        _2021 = _2039;
    }
    float _2041 = _2021;
    float _2043 = _1991;
    float _2045 = _2041;
    if (_2009)
    {
        float _2047 = _2041 * 6.283185482025146484375;
        float _2049 = sin(_2047);
        _2043 = _2049;
    }
    float _2051 = _2043;
    float _2053 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2055 = precise::max(0.0, _2053);
    float _2057 = _2027;
    if (_2009)
    {
        float _2059 = _2041 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        _2057 = _2061;
    }
    float _2063 = _2057;
    float _2065 = -_1995;
    float _2067 = -_2055;
    float _2069 = fma(_1969, _2065, _2067);
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2009)
    {
        float _2073 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2023 = _2073;
    }
    float _2075 = _2023;
    float _2077 = _2075;
    if (!_2009)
    {
        _2045 = _1997;
    }
    float _2079 = _2045;
    float _2081 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2083 = _2051;
    float _2085 = _2079;
    if (_2009)
    {
        float _2087 = fma(_2051, _2075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2077 = _2087;
    }
    float _2089 = _2077;
    float _2091 = _2089;
    if (!_2009)
    {
        _2083 = _1999;
    }
    float _2093 = _2083;
    float _2095 = _2093;
    float _2097 = _2063;
    if (_2009)
    {
        float _2099 = _2063 + (-1.0);
        _2071 = _2099;
    }
    float _2101 = _2071;
    float _2103 = _2101;
    if (_2009)
    {
        float _2105 = _2031 * _2089;
        _1187 = _2105;
    }
    float _2107 = _1187;
    if (!_2009)
    {
        _2091 = _2069;
    }
    float _2109 = _2091;
    float _2111 = _2109;
    if (_2009)
    {
        float _2113 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2103 = _2113;
    }
    float _2115 = _2103;
    if (_2009)
    {
        float _2117 = _1997 * _2107;
        _2085 = _2117;
    }
    float _2119 = _2085;
    if (!_2009)
    {
        _2033 = _2001;
    }
    float _2121 = _2033;
    float _2123 = _2121;
    if (_2009)
    {
        float _2125 = _1999 * _2107;
        _2095 = _2125;
    }
    float _2127 = _2095;
    if (_2009)
    {
        float _2129 = fma(_2069, _2063, _2115);
        _2111 = _2129;
    }
    float _2131 = _2111;
    if (_2009)
    {
        float _2133 = _2119 * _2119;
        _2123 = _2133;
    }
    float _2135 = _2123;
    if (!_2009)
    {
        _2097 = _2003;
    }
    float _2137 = _2097;
    float _2139 = _2137;
    if (_2009)
    {
        float _2141 = _2127 * _2127;
        _2139 = _2141;
    }
    float _2143 = _2139;
    float _2145 = fma(_2131, _2131, _2135);
    float _2147 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2149 = floor(_2081);
    float _2151 = _2145 + _2143;
    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2155 = fma(_1993, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2153);
    float _2157 = precise::clamp(_2155, 0.0, 1.0);
    float _2159 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2147);
    float _2161 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2163 = -_2157;
    float _2165 = _2163 + 1.0;
    float _2167 = rsqrt(_2151);
    float _2169 = fma(_1405, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2171 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2173 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2159);
    float _2175 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2171);
    float _2177 = _2173 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2179 = abs(_2165);
    float _2181 = log2(_2179);
    float _2183 = _1911 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2185 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2175);
    float _2187 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2189 = -_2149;
    float _2191 = _2081 + _2189;
    float _2193 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2183);
    float _2195 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2197 = -_2187;
    float _2199 = fma(_2197, _2161, 1.0);
    float _2201 = _2167 * _2119;
    float _2203 = _2167 * _2131;
    float _2205 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2193);
    float _2207 = _2167 * _2127;
    float _2209 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2211 = floor(_2169);
    float _2213 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2215 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2217 = -_2209;
    float _2219 = fma(_2203, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2217);
    float _2221 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2223 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2225 = -_2207;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2219);
    float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2215);
    float _2231 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2233 = exp2(_2221);
    float _2235 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2237 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2229);
    float _2239 = fma(_2227, 0.5, 0.5);
    float _2241 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2237);
    float _2243 = -_2211;
    float _2245 = _2169 + _2243;
    float _2247 = log2(_2199);
    float _2249 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2223);
    float _2251 = _2203 + 1.0;
    float _2253 = fma(_2239, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2255 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2249);
    float _2257 = fma(_2239, _2253, -0.212114393711090087890625);
    float _2259 = 1.0 / _2241;
    float _2261 = fma(_2227, -0.5, 0.5);
    float _2263 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2235);
    float2 _6310 = float2(_2191, _2245);
    float _2265 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).x;
    float _2267 = fma(_2239, _2257, 1.570728778839111328125);
    float _2269 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2263);
    float _2271 = sqrt(_2261);
    float _2273 = _2247 * 0.693147182464599609375;
    float _2275 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2277 = -_2203;
    float _2279 = fma(_2233, _2251, _2277);
    float _2281 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2283 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2269);
    float _2285 = fma(_2279, 0.5, 0.5);
    float _2287 = _2281 * _2259;
    float _2289 = _2283 * _2259;
    float _2291 = _2271 * 0.636619746685028076171875;
    float _2293 = fma(_2287, 0.5, 0.5);
    float _2295 = fma(_2289, -0.5, 0.5);
    float _2297 = -_2267;
    float _2299 = fma(_2291, _2297, 1.0);
    float3 _6375 = float3(_2293, _2295, _2275);
    float _2301 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6375, float3(0.0), isnan(_6375)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6375, float3(0.0), isnan(_6375)), level(0.0)).x;
    float3 _6386 = float3(_2293, _2295, _2275);
    float4 _2304 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6386, float3(0.0), isnan(_6386)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6386, float3(0.0), isnan(_6386)), level(0.0)).xyzw;
    float _2306 = _2304.x;
    float _2308 = _2304.y;
    float _2310 = _2304.z;
    float _2312 = _2304.w;
    float2 _6402 = float2(_2299, _2285);
    float3 _2316 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6402, float2(0.0), isnan(_6402)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6402, float2(0.0), isnan(_6402)), level(0.0)).xyz;
    float _2318 = _2316.x;
    float _2320 = _2316.y;
    float _2322 = _2316.z;
    float _2324 = abs(_1863);
    float _2326 = log2(_2324);
    float _2328 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2330 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2332 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2334 = _1509 != 0.0;
    bool _2336 = isnan(_1509);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(0.0);
    bool _2342 = _2338 || _2340;
    float _2344 = in.m_77.x;
    float _2346 = in.m_77.y;
    float _2348 = in.m_77.z;
    float _2350 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2328);
    float _2352 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2330);
    bool _2354 = _1507 == 0.0;
    bool _2356 = !_2342;
    bool _2358 = _2354 && _2356;
    float _2360 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2332);
    float _2362 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2364 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2366 = _1511 == 0.0;
    bool _2368 = _2366 && _2358;
    float _2370 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2372 = -_1533;
    float _2374 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2362);
    float _2376 = -_1533;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2364);
    float _2380 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2382 = -_1533;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2370);
    float _2386 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2388 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2390 = _1575 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2392 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2352);
    float _2394 = exp2(_2380);
    float _2396 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2360);
    float _2398 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2386);
    float _2400 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2388);
    float _2402 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2390);
    float _2404 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2406 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2398);
    float _2408 = _2346;
    float _2410 = _2344;
    float _2412 = _2348;
    float _2414 = _2283;
    float _2416 = _2281;
    if (!_2368)
    {
        float _2418 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2346);
        _2408 = _2418;
    }
    float _2420 = _2408;
    if (!_2368)
    {
        float _2422 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2344);
        _2410 = _2422;
    }
    float _2424 = _2410;
    if (!_2368)
    {
        float _2426 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2348);
        _2412 = _2426;
    }
    float _2428 = _2412;
    float _2430 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2374);
    float _2432 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2378);
    float _2434 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2384);
    float _2436 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2400);
    float _2438 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2402);
    float _2440 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2442 = precise::clamp(_2440, 0.0, 1.0);
    float _2444 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2404);
    float _2446 = _2430 * _2420;
    float _2448 = _2432 * _2420;
    float _2450 = _2434 * _2420;
    float _2452 = fma(_2442, -2.0, 3.0);
    float _2454 = _2442 * _2442;
    float _2456 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2458 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2444);
    float _2460 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2350);
    float _2462 = fma(_2396, _2424, _2450);
    float _2464 = _2454 * _2452;
    float _2466 = exp2(_2456);
    float _2468 = fma(_2460, _2424, _2446);
    float _2470 = fma(_2392, _2424, _2448);
    float _2472 = -_2464;
    float _2474 = _2472 + 1.0;
    float _2476 = in.m_79.x;
    bool _2478 = _1863 <= 8000.0;
    bool _2480 = isnan(_1863);
    bool _2482 = _2478 || _2480;
    bool _2484 = isnan(8000.0);
    bool _2486 = _2482 || _2484;
    float _2488 = float(_2486);
    float _2490 = _2241 * 0.5;
    float _2492 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2464);
    float _2494 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2458);
    float _2496 = fma(_2436, _2428, _2470);
    float _2498 = fma(_2283, -0.5, _2490);
    float _2500 = _2488 * _2492;
    float _2502 = fma(_2406, _2428, _2468);
    float _2504 = fma(_2438, _2428, _2462);
    float _2506 = _2494 + _2241;
    float _2508 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2510 = -_2466;
    float _2512 = _2510 + 1.0;
    float _2514 = _2281 + _2241;
    float _2516 = _2506 * 0.5;
    float _2518 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2520 = _2514 * 0.5;
    out.m_81.x = _2502;
    out.m_81.y = _2496;
    out.m_81.z = _2504;
    bool _2522 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2524 = isnan(_1993);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2530 = _2526 || _2528;
    out.m_83.x = _2520;
    out.m_83.y = _2498;
    out.m_83.z = _2516;
    out.m_83.w = _2241;
    out.gl_Position.x = _2281;
    out.gl_Position.y = _2283;
    out.gl_Position.z = _2494;
    out.gl_Position.w = _2241;
    float _2532 = -_2518;
    float _2534 = _2532 + 1.0;
    float _2536 = _2241;
    float _2538 = _2516;
    float _2540 = _2498;
    float _2542 = _2534;
    if (!_2530)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2544 = _2536;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2530)
    {
        _2538 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2550 = _2538;
    float _2552 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2554 = _2550;
    float _2556 = _2550;
    if (!_2530)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2558 = _2414;
    float _2560 = _2558;
    float _2562 = _2558;
    if (!_2530)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2564 = _2416;
    float _2566 = _2564;
    float _2568 = _2564;
    if (!_2530)
    {
        _2540 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2570 = _2540;
    float _2572 = -_2265;
    float _2574 = _2572 + 1.0;
    float _2576 = _2574 * _2508;
    float _2578 = precise::clamp(_2576, 0.0, 1.0);
    float _2580 = -_2578;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2584 = _2582 * _2476;
    float _2586 = _2584 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2586;
    float _2588 = _2518 * _2301;
    float _2590 = _2312 * _2534;
    float _2592 = _2570;
    float _2594 = _2570;
    if (!_2530)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2596 = _2542;
    float _2598 = _2312 * _2588;
    float _2600 = _2322 * _2588;
    float _2602 = fma(_2318, _2598, _2306);
    float _2604 = fma(_2320, _2598, _2308);
    float _2606 = fma(_2312, _2600, _2310);
    out.m_87.x = _2602;
    out.m_87.y = _2604;
    out.m_87.z = _2606;
    out.m_87.w = _2590;
    bool _2608 = !_2530;
    float _2610 = _2596;
    float _2612 = _2596;
    if (!_2608)
    {
        bool _2614 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2616 = isnan(_1993);
        bool _2618 = _2614 || _2616;
        bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2622 = _2618 || _2620;
        if (!_2622)
        {
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2626 = _1993 + _2624;
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2628;
            float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2636 = 1.0 / _2630;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2654 = _2626 * _2636;
            float _2656 = precise::clamp(_2654, 0.0, 1.0);
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2662 = fma(_2656, _2634, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2568 = _2666;
            _2594 = _2670;
            _2562 = _2662;
            _2556 = _2668;
            _2548 = _2664;
            _2612 = _2672;
            _2674 = true;
        }
        else
        {
            bool _2676 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2678 = isnan(_1993);
            bool _2680 = _2676 || _2678;
            bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2684 = _2680 || _2682;
            if (!_2684)
            {
                _2560 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2686 = _2560;
            _2562 = _2686;
            if (!_2684)
            {
                _2566 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2688 = _2566;
            _2568 = _2688;
            if (!_2684)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2690 = _2546;
            _2548 = _2690;
            if (!_2684)
            {
                _2554 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2692 = _2554;
            _2556 = _2692;
            if (!_2684)
            {
                _2592 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2694 = _2592;
            _2594 = _2694;
            if (!_2684)
            {
                _2610 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2696 = _2610;
            bool _2698 = !_2684;
            _2612 = _2696;
            if (!_2698)
            {
                bool _2700 = _1993 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2702 = isnan(_1993);
                bool _2704 = _2700 || _2702;
                bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2708 = _2704 || _2706;
                if (!_2708)
                {
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2712 = _1993 + _2710;
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2716 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2714;
                    float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2722 = 1.0 / _2716;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2740 = _2712 * _2722;
                    float _2742 = precise::clamp(_2740, 0.0, 1.0);
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2748 = fma(_2742, _2720, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2750 = fma(_2742, _2746, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2752 = fma(_2742, _2726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2754 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2756 = fma(_2742, _2734, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2758 = fma(_2742, _2738, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2568 = _2752;
                    _2594 = _2756;
                    _2562 = _2748;
                    _2556 = _2754;
                    _2548 = _2750;
                    _2612 = _2758;
                    _2674 = true;
                }
                else
                {
                    _2568 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2594 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2562 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2556 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2612 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2674 = false;
    float _2760 = _2568;
    float _2762 = _2594;
    float _2764 = _2562;
    float _2766 = _2556;
    float _2768 = _2548;
    float _2770 = _2612;
    float _2772 = _2552 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2774 = fma(_2496, -0.5, 0.5);
    float _2776 = precise::clamp(_2774, 0.0, 1.0);
    float _2778 = -_2760;
    float _2780 = _2778 + _2762;
    float _2782 = -_2764;
    float _2784 = _2782 + _2766;
    out.m_89.x = 0.0;
    float _2786 = fma(_2776, _2780, _2760);
    float _2788 = -_2768;
    float _2790 = _2788 + _2770;
    float _2792 = fma(_2776, _2784, _2764);
    float _2794 = _2786 * 0.586610972881317138671875;
    bool _2796 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2798 = fma(_2776, _2790, _2768);
    out.m_53.x = _2772;
    float _2800 = fma(_2792, 0.298911988735198974609375, _2794);
    bool _2802 = _1965 > 0.0;
    bool _2804 = isnan(_1965);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan(0.0);
    bool _2810 = _2806 || _2808;
    float _2812 = fma(_2798, 0.114477999508380889892578125, _2800);
    float _2814 = -_2812;
    float _2816 = _2792 + _2814;
    float _2818 = -_2812;
    float _2820 = _2786 + _2818;
    float _2822 = -_2812;
    float _2824 = _2798 + _2822;
    float _2826 = fma(_2816, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2812);
    float _2828 = fma(_2820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2812);
    float _2830 = fma(_2824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2812);
    bool _2832 = !_2796;
    if (!_2832)
    {
        float _2834 = -_1911;
        float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2838 = -_1913;
        float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2842 = -_1915;
        float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2846 = _2836 * _2836;
        float _2848 = fma(_2840, _2840, _2846);
        float _2850 = fma(_2844, _2844, _2848);
        float _2852 = sqrt(_2850);
        float _2854 = rsqrt(_2850);
        float _2856 = -_2852;
        float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2860 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = _2840 * _2854;
        float _2866 = _2836 * _2854;
        float _2868 = abs(_2862);
        float _2870 = log2(_2868);
        float _2872 = _2844 * _2854;
        float _2874 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2876 = _2496 * _2866;
        float _2878 = -_2866;
        float _2880 = -_2874;
        float _2882 = fma(_2878, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2880);
        float _2884 = fma(_2502, _2864, _2876);
        float _2886 = -_2872;
        float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2882);
        float _2890 = fma(_2504, _2872, _2884);
        float _2892 = precise::clamp(_2890, 0.0, 1.0);
        float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2896 = _2888 + _2894;
        float _2898 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2900 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2902 = precise::clamp(_2900, 0.0, 1.0);
        float _2904 = exp2(_2898);
        float _2906 = _2904 * _2902;
        float _2908 = _2892 * _2906;
        float _2910 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2912 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2914 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2910;
        out.m_89.y = _2912;
        out.m_89.z = _2914;
    }
    out.m_91.x = _2826;
    out.m_91.y = _2828;
    out.m_91.z = _2830;
    if (_2810)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2916 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2916;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

