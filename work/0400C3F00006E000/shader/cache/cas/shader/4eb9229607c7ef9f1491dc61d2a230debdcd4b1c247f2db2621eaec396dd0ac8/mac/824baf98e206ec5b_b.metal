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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_55 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_69 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2067 = false;
    bool _472 = false;
    bool _290 = false;
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
    float _100 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    float _104 = _102;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2558 = as_type<float>(_110);
        out.gl_Position.z = _2558;
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
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    int _144 = 0;
    if (_140)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2627 = as_type<float>(_148);
        out.gl_Position.z = _2627;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.w;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = _152;
    if (!_162)
    {
        float _178 = _152 * _152;
        float _180 = _178 * 0.5;
        _100 = _180;
    }
    float _182 = _100;
    float _184 = _182;
    if (!_162)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_162;
    float _192 = _188;
    if (!_190)
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
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_162;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _152 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _164, _252);
    float _260 = fma(_248, _166, _254);
    float _262 = fma(_248, _168, _256);
    float _264 = fma(_258, _150, _170);
    float _266 = fma(_260, _150, _172);
    float _268 = fma(_262, _150, _174);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_53.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_92);
        float _294 = 1.0 / _292;
        float _296 = _126 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _298 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _328 = 1.0 / _322;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _332 = 1.0 / _326;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _334;
    float _338 = _302 * _328;
    bool _340 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _342 = isnan(_298);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_314;
    float _354 = _352 + 1.0;
    bool _356 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _358 = isnan(_298);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_336, _338, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _370 = _366 * _354;
    float _372 = -_366;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _380;
    float _384 = _318 * _332;
    float _386 = _350 * _374;
    float _388 = fma(_378, _338, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = fma(_382, _338, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = -_350;
    float _394 = _392 + 1.0;
    float _396 = _368 * _386;
    float _398 = _388 * _386;
    float _400 = _390 * _386;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _414 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].y, _396);
    float _418 = fma(_404, _384, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _420 = fma(_408, _384, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _422 = fma(_412, _384, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_418, _370, _414);
    float _428 = fma(_420, _370, _416);
    float _430 = fma(_422, _370, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    float _438 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _440 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _444 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _446;
    out.m_55.y = _448;
    out.m_55.z = _450;
    out.m_55.w = _442;
    bool _452 = !_330;
    float _470;
    if (!_452)
    {
        float _454 = in.m_53.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_92);
        float _476 = 1.0 / _474;
        float _478 = _126 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _484 = int(_482);
    float _486 = in.m_57.x;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _490 = _480 + _488;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _494 = _492 != 0;
    float _496 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _498 = int(_496);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _502 = _500 != 0;
    float _504 = float(_484);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _508 = 1.0 / _504;
    float _510 = float(uint(_498));
    int _512 = ~_498;
    int _514 = _512 + 1;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _516;
    int _520 = ~_498;
    int _522 = _520 + 1;
    float _524 = 1.0 / _510;
    float _526 = float(_498);
    int _528 = ~_498;
    int _530 = _528 + 1;
    bool _532 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _534 = isnan(_480);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _508 * _126;
    bool _546 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _548 = isnan(_480);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = trunc(_544);
    int _560 = int(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _562;
    int _566 = as_type<int>(_524) + (-2);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _568;
    float _572 = float(uint(_560));
    float _574 = as_type<float>(_566) * _572;
    float _576 = trunc(_574);
    float _578 = precise::max(_576, 0.0);
    uint _581 = uint(_578);
    int _583 = _514 * int(_581);
    int _585 = _583 + _560;
    float _587 = float(uint(_585));
    float _589 = as_type<float>(_566) * _587;
    float _591 = in.m_53.x;
    float _593 = in.m_53.y;
    float _595 = trunc(_589);
    float _597 = precise::max(_595, 0.0);
    uint _599 = uint(_597);
    int _601 = int(_581) + int(_599);
    float _603 = float(_560);
    bool _605 = !_494;
    float _607 = _605 ? 7.345489978790283203125 : 1.0;
    int _609 = _522 * _601;
    int _611 = _609 + _560;
    bool _613 = _603 >= _526;
    bool _615 = isnan(_603);
    bool _617 = _613 || _615;
    bool _619 = isnan(_526);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = float(_92);
    float _627 = _607 * _591;
    bool _629 = uint(_611) >= uint(_498);
    float _631 = trunc(_623);
    int _633 = int(_631);
    bool _635 = !_629;
    int _637 = _635 ? 0 : (-1);
    bool _639 = _498 == 0;
    int _641 = ~_601;
    int _643 = _641 + _637;
    int _645 = _643 + 1;
    float _647 = floor(_627);
    int _649 = _498 * _645;
    int _651 = _649 + _560;
    float _653 = 1.0 / _625;
    int _655 = ~_633;
    int _657 = _655 + 1;
    int _659 = _657 + 1;
    bool _661 = !_639;
    int _663 = _661 ? _651 : (-1);
    float _665 = -_647;
    float _667 = _627 + _665;
    int _669 = _663 * _659;
    float _671 = _667 * _526;
    float _673 = _526 * _126;
    int _675 = _498 + (-1);
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _679 = _677 != 0;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _683 = _681 != 0;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _687 = _685 != 0;
    float _689 = _673 * _653;
    float _691 = trunc(_671);
    int _693 = int(_691);
    int _695 = _633 * _675;
    int _697 = _695 + _669;
    bool _699 = !_502;
    int _701 = _699 ? 0 : 1;
    bool _703 = !_683;
    int _705 = _703 ? 0 : 1;
    bool _707 = !_679;
    int _709 = _707 ? 0 : 1;
    float _711 = trunc(_689);
    int _713 = int(_711);
    int _715 = abs(_705);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _719 = _717 != 0;
    bool _721 = !_687;
    int _723 = _721 ? 0 : 1;
    int _725 = _697 * _715;
    int _727 = abs(_709);
    float _729 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _731 = abs(_701);
    bool _733 = !_719;
    int _735 = _733 ? 0 : 1;
    float _737 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _729);
    int _739 = abs(_723);
    int _741 = _693 * _731;
    int _743 = _741 + _560;
    int _745 = abs(_735);
    int _747 = _713 * _727;
    int _749 = _747 + _725;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _753 = _751 != 0;
    int _755 = _743 * _739;
    int _757 = _755 + _749;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _761 = _759 != 0;
    float _763 = in.m_57.y;
    int _765 = _693 * _745;
    int _767 = _765 + _757;
    int _769 = ~_498;
    int _771 = _769 + 1;
    bool _773 = _593 > 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _775 = float(uint(_767));
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _779 = _777 != 0;
    float _781 = 1.0;
    if (_753)
    {
        float _783 = in.m_53.x;
        _781 = _783;
    }
    float _785 = _781;
    bool _787 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _789 = isnan(1.0);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _795 = _791 || _793;
    float _797 = as_type<float>(_566) * _775;
    float _799 = trunc(_797);
    float _801 = precise::max(_799, 0.0);
    uint _803 = uint(_801);
    float _805 = -_763;
    float _807 = _805 + 1.0;
    float _809 = _763;
    if (_761)
    {
        float _811 = _773 ? _807 : _763;
        _809 = _811;
    }
    float _813 = _809;
    int _815 = _771 * int(_803);
    int _817 = _815 + _767;
    float _819 = float(uint(_817));
    float _821 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _823 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _825 = as_type<float>(_566) * _819;
    float _827 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _823);
    int _829 = ~_498;
    int _831 = _829 + 1;
    float _833 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _821);
    float _835 = trunc(_825);
    float _837 = precise::max(_835, 0.0);
    uint _839 = uint(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _843 = 1.0 + _841;
    float _845 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _847 = log2(_845);
    int _849 = int(_803) + int(_839);
    float _851 = 1.0 / _843;
    float _853 = float(uint(_743));
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _855;
    float _859 = as_type<float>(_566) * _853;
    float _861 = _591 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _863 = _831 * _849;
    int _865 = _863 + _767;
    float _867 = 1.0 / _857;
    float _869 = -_506;
    float _871 = fma(_861, 2.0, _869);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _877 = uint(_865) >= uint(_498);
    float _879 = _591 * 2.0;
    float _881 = -_126;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[76].x, _871);
    float _885 = trunc(_859);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    bool _891 = !_877;
    int _893 = _891 ? 0 : (-1);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _897;
    bool _901 = _785 > 0.5;
    bool _903 = _901 && _753;
    float _905 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _833);
    int _907 = ~_849;
    int _909 = _907 + _893;
    int _911 = _909 + 1;
    float _913 = _593 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _915 = 1.0 / _899;
    float _917 = _833;
    if (_753)
    {
        _917 = _486;
    }
    float _919 = _917;
    float _921 = _905 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _923 = _498 * _911;
    int _925 = _923 + _767;
    float _927 = fma(_913, -2.0, _895);
    float _929 = in.m_53.z;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _933 = _480 + _931;
    float _935 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    int _937 = _530 * int(_889);
    int _939 = _937 + _743;
    bool _941 = !_639;
    int _943 = _941 ? _925 : (-1);
    float _945 = _847 * _126;
    float _947 = floor(_879);
    float _949 = _919;
    if (_903)
    {
        float _951 = -_919;
        float _953 = _951 + 1.0;
        _949 = _953;
    }
    float _955 = _949;
    float _957 = float(uint(_939));
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _961 = _480 + _959;
    int _963 = _943 & 3;
    bool _965 = _963 != 0;
    float _967 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _927);
    float _969 = _935 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _971 = as_type<float>(_566) * _957;
    int _973 = _943 & 3;
    bool _975 = _973 != 0;
    float _977 = exp2(_945);
    int _979 = _965 ? 0 : 1;
    float _981 = _961 * _915;
    bool _983 = uint(_973) > 1u;
    float _985 = _915;
    float _987 = _969;
    if (!_753)
    {
        _985 = _486;
    }
    float _989 = _985;
    float _991 = _989;
    if (_753)
    {
        _991 = _955;
    }
    float _993 = _991;
    float _995 = 1.0 / _875;
    int _997 = ~_979;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    bool _1003 = _947 > 0.0;
    bool _1005 = _947 >= 0.0;
    bool _1007 = isnan(_947);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.0);
    bool _1013 = _1009 || _1011;
    int _1015 = ~_498;
    int _1017 = _1015 + 1;
    float _1019 = -_977;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _827);
    float _1025 = _933 * _867;
    float _1027 = trunc(_971);
    float _1029 = precise::max(_1027, 0.0);
    uint _1031 = uint(_1029);
    float _1033 = _593 + _929;
    float _1035 = fma(_518, _1025, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _1037 = _1001;
    if (!_983)
    {
        int _1039 = ~_979;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = _1033 + (-1.0);
    bool _1047 = uint(_973) >= 2u;
    float _1049 = _490 * _995;
    float _1051 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1053 = _593 * 2.0;
    int _1055 = _1047 ? 0 : 1;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1059 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1061 = isnan(0.0);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1067 = _1063 || _1065;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1071 = int(_889) + int(_1031);
    float _1073 = _929 * 2.0;
    float _1075 = _1067 ? _1021 : 0.0;
    float _1077 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1069);
    bool _1079 = _973 != 3;
    float _1081 = floor(_1053);
    float _1083 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1057);
    float _1085 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1077);
    int _1087 = _1017 * _1071;
    int _1089 = _1087 + _743;
    float _1091 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1083);
    float _1093 = floor(_1073);
    int _1095 = ~_1055;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    int _1101 = _1099;
    if (_795)
    {
        float _1103 = _1075 * _851;
        _130 = _1103;
    }
    float _1105 = _130;
    bool _1107 = uint(_1089) >= uint(_498);
    if (_1079)
    {
        int _1109 = ~_1055;
        int _1111 = _1109 + 1;
        _1101 = _1111;
    }
    int _1113 = _1101;
    int _1115 = _943 >> 31;
    int _1117 = _1013 ? 0 : 1;
    bool _1119 = !_1107;
    int _1121 = _1119 ? 0 : (-1);
    int _1123 = _1115 & 3;
    bool _1125 = !_779;
    int _1127 = _1125 ? 0 : 1;
    bool _1129 = _973 != 3;
    bool _1131 = _1081 > 0.0;
    bool _1133 = _1081 >= 0.0;
    bool _1135 = isnan(_1081);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(0.0);
    bool _1141 = _1137 || _1139;
    int _1143 = ~_1117;
    int _1145 = _1143 + 1;
    int _1147 = _1145 + 1;
    int _1149 = _1147;
    if (!_1003)
    {
        int _1151 = ~_1117;
        int _1153 = _1151 + 1;
        _1149 = _1153;
    }
    int _1155 = _1149;
    int _1157 = _943 + _1123;
    bool _1159 = !_975;
    int _1161 = _1159 ? 0 : 1;
    bool _1163 = !_1129;
    int _1165 = _1163 ? 0 : (-1);
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1169 = _1167 != 0;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1177 = _1175 != 0;
    int _1179 = _1141 ? 0 : 1;
    bool _1181 = _1093 > 0.0;
    float _1183 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1185 = _1093 >= 0.0;
    bool _1187 = isnan(_1093);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan(0.0);
    bool _1193 = _1189 || _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1195;
    float _1199 = -_967;
    float _1201 = fma(_1085, _1183, _1199);
    int _1203 = _1157 >> 2;
    float _1205 = fma(_1197, _1025, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1207 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1209 = isnan(_480);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1219;
    int _1223 = _1203 << 4;
    int _1225 = _1223 + 368;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1231 = abs(_1161);
    float _1233 = -_1217;
    float _1235 = _1233 + 1.0;
    float _1237 = fma(_1221, _1025, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    uint _1239 = uint(int(uint(_1225) >> uint(2)));
    uint _1241 = uint(int(uint(int(_1239)) >> uint(2)));
    int _1243 = int(_1239) & 3;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[int(_1241)][_1243];
    int _1247 = int(_1239) + 1;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    int _1251 = _1247 & 3;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[int(_1249)][_1251];
    bool _1255 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1257 = isnan(_480);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1271 = _542 * _1235;
    float _1273 = -_542;
    float _1275 = _1273 + 1.0;
    float _1277 = fma(_1269, _1049, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1279 = -_1265;
    float _1281 = _1279 + 1.0;
    float _1283 = _1265 * _1275;
    int _1285 = abs(_1113);
    int _1287 = _1225 + 8;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[int(_1299)][_1301];
    float _1305 = _556 * _1281;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1307;
    float _1311 = -_556;
    float _1313 = _1311 + 1.0;
    int _1315 = ~_1285;
    int _1317 = _1315 + 1;
    int _1319 = _1317 + 1;
    float _1321 = _1237 * _1305;
    float _1323 = fma(_1309, _981, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1325 = _1035 * _1305;
    int _1327 = ~_1071;
    int _1329 = _1327 + _1121;
    int _1331 = _1329 + 1;
    float _1333 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1321);
    int _1335 = abs(_1043);
    float _1337 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1339 = abs(_1127);
    int _1341 = _498 * _1331;
    int _1343 = _1341 + _743;
    int _1345 = ~_1335;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    float _1351 = fma(_1091, _1337, _883);
    int _1353 = ~_1231;
    int _1355 = _1353 + 1;
    int _1357 = _1355 + 1;
    float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1361 = _921 + _1359;
    int _1363 = ~_1339;
    int _1365 = _1363 + 1;
    int _1367 = _1365 + 1;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1373 = _1205 * _1305;
    float _1375 = fma(_1229, _1049, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1377 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1325);
    float _1379 = fma(_1371, _1049, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1381 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1373);
    float _1383 = fma(_564, _981, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1385 = fma(_570, _981, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1387 = fma(_1277, _1283, _1333);
    float _1389 = fma(_1375, _1283, _1377);
    float _1391 = fma(_1379, _1283, _1381);
    float _1393 = float(_1155);
    float _1395 = fma(_1323, _1271, _1387);
    float _1397 = fma(_1383, _1271, _1389);
    float _1399 = fma(_1385, _1271, _1391);
    float _1401 = _1201 + 0.5;
    float _1403 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1395);
    float _1405 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1397);
    float _1407 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1399);
    int _1409 = _1349 * as_type<int>(_1253);
    float _1411 = _1023 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1413 = abs(_1165);
    float _1415 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1417 = _1357 * as_type<int>(_1245);
    int _1419 = _1417 + _1409;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1423 = _969 + _1421;
    int _1425 = ~_1413;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1433 = _1411 + _1431;
    float _1435 = _1351 + 0.5;
    float _1437 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1439 = _1319 * as_type<int>(_1295);
    int _1441 = _1439 + _1419;
    float _1443 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1437);
    int _1445 = _1429 * as_type<int>(_1303);
    int _1447 = _1445 + _1441;
    bool _1449 = !_639;
    int _1451 = _1449 ? _1343 : (-1);
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1455 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1443);
    int _1457 = _1447 * _1367;
    float _1459 = _1423 * _1423;
    float _1461 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1435;
    out.m_61.y = _1401;
    int _1463 = _1451 * _1339;
    int _1465 = _1463 + _1457;
    bool _1467 = !_1173;
    int _1469 = _1467 ? 0 : 1;
    float _1471 = _1407 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1473 = _1455 >= 0.0;
    float _1475 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1477 = abs(_1469);
    float _1479 = fma(_1361, _1361, _1459);
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1483 = in.m_63.x;
    float _1485 = in.m_63.y;
    float _1487 = in.m_63.z;
    float _1489 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = fma(_1433, _1433, _1479);
    float _1493 = float(_1465);
    float _1495 = _593 + (-0.5);
    float _1497 = float(_1477);
    out.m_65.x = _1461;
    out.m_65.y = _1489;
    out.m_65.z = _1481;
    out.m_65.w = _1453;
    int _1499 = ~_1179;
    int _1501 = _1499 + 1;
    int _1503 = _1501 + 1;
    float _1505 = rsqrt(_1491);
    float _1507 = as_type<float>(_1155);
    int _1509 = _1503;
    if (_1473)
    {
        _1507 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1511 = _1507;
    out.m_67.x = _1493;
    float _1513 = _1497 * _1393;
    int _1515 = as_type<int>(_1511);
    if (!_1131)
    {
        int _1517 = ~_1179;
        int _1519 = _1517 + 1;
        _1509 = _1519;
    }
    int _1521 = _1509;
    if (_1473)
    {
        float _1523 = _1511 * 5.0;
        _1515 = as_type<int>(_1523);
    }
    int _1525 = _1515;
    if (_1473)
    {
        out.m_47.x = 0.0;
    }
    bool _1527 = !_1177;
    int _1529 = _1527 ? 0 : 1;
    bool _1531 = !_1169;
    int _1533 = _1531 ? 0 : 1;
    if (_1473)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4729 = as_type<float>(_1525);
        out.gl_Position.z = _4729;
    }
    float _1535 = _1423 * _1505;
    float _1537 = _1361 * _1505;
    if (_1473)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1539 = -_1535;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1543 = _1513 * (-2.0);
    float _1545 = -_1537;
    float _1547 = fma(_1545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    int _1549 = _1193 ? 0 : 1;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1553 = _1541 + _1551;
    float _1555 = fma(_1543, _1485, _1485);
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1559 = _1547 + _1557;
    int _1561 = ~_1549;
    int _1563 = _1561 + 1;
    int _1565 = _1563 + 1;
    float _1567 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1569 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1555);
    int _1571 = _1565;
    if (!_1181)
    {
        int _1573 = ~_1549;
        int _1575 = _1573 + 1;
        _1571 = _1575;
    }
    int _1577 = _1571;
    float _1579 = _1433 * _1505;
    float _1581 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1567);
    int _1583 = abs(_1529);
    float _1585 = _929 + _591;
    float _1587 = float(_1521);
    float _1589 = -_1579;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1593 = float(_1583);
    float _1595 = fma(_1051, _1543, _1051);
    int _1597 = abs(_1533);
    float _1599 = _1585 + (-1.0);
    float _1601 = _1593 * _1587;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1591 + _1603;
    float _1607 = float(_1597);
    float _1609 = _929 + (-0.5);
    float _1611 = float(_1577);
    float _1613 = _1601 * (-2.0);
    float _1615 = fma(_1599, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1581);
    float _1619 = _593 + _591;
    float _1621 = fma(_1613, _1487, _1487);
    float _1623 = _1607 * _1611;
    float _1625 = fma(_1615, _1613, _1615);
    float _1627 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1621);
    bool _1629 = _1617 >= 0.0;
    float _1631 = _1619 + (-1.0);
    float _1633 = _1623 * (-2.0);
    float _1635 = fma(_1625, _1105, _1627);
    float _1637 = _591 + (-0.5);
    float _1639 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1641 = fma(_1633, _1483, _1483);
    float _1643 = fma(_1595, _1105, _1569);
    float _1645 = _1635 * 0.15915493667125701904296875;
    float _1647 = fma(_1639, _1633, _1639);
    float _1649 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1641);
    float _1651 = _1643 * 0.15915493667125701904296875;
    float _1653 = _1645 * 6.283185482025146484375;
    float _1655 = sin(_1653);
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (_1629)
    {
        _1657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1659 = _1657;
    float _1661 = fma(_1647, _1105, _1649);
    int _1663 = as_type<int>(_1659);
    if (_1629)
    {
        out.m_47.x = 0.0;
    }
    float _1665 = -_1535;
    float _1667 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1423);
    if (_1629)
    {
        float _1669 = _1659 * 5.0;
        _1663 = as_type<int>(_1669);
    }
    int _1671 = _1663;
    float _1673 = _1651 * 6.283185482025146484375;
    float _1675 = sin(_1673);
    if (_1629)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4969 = as_type<float>(_1671);
        out.gl_Position.z = _4969;
    }
    float _1677 = _1651 * 6.283185482025146484375;
    float _1679 = cos(_1677);
    float _1681 = _1645 * 6.283185482025146484375;
    float _1683 = cos(_1681);
    if (_1629)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1685 = -_969;
    float _1687 = _1685 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1689 = -_921;
    float _1691 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1693 = -_1537;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1361);
    float _1697 = _1667 * _1667;
    float _1699 = _1687 * _1687;
    float _1701 = -_1411;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1705 = -_1579;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1433);
    float _1709 = fma(_1695, _1695, _1697);
    float _1711 = fma(_1691, _1691, _1699);
    float _1713 = _1661 * 0.15915493667125701904296875;
    float _1715 = _1679 * _1683;
    float _1717 = fma(_1707, _1707, _1709);
    float _1719 = fma(_1703, _1703, _1711);
    float _1721 = _1713 * 6.283185482025146484375;
    float _1723 = sin(_1721);
    float _1725 = _1675 * _1655;
    float _1727 = in.m_51.x;
    float _1729 = in.m_51.y;
    float _1731 = in.m_51.z;
    float _1733 = in.m_69.x;
    float _1735 = in.m_69.y;
    float _1737 = in.m_69.z;
    float _1739 = rsqrt(_1719);
    float _1741 = sqrt(_1717);
    float _1743 = fma(_1723, _1725, _1715);
    float _1745 = fma(_1723, _1715, _1725);
    float _1747 = _1679 * _1655;
    float _1749 = _1691 * _1739;
    float _1751 = _1687 * _1739;
    float _1753 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1755 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1757 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1759 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1761 = _1751 * _1759;
    float _1763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1735);
    float _1765 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1733);
    float _1767 = _1505 * _1741;
    float _1769 = _1703 * _1739;
    float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1773 = _1749 * _1771;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1777 = -_1761;
    float _1779 = fma(_1749, _1775, _1777);
    float _1781 = _1675 * _1683;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1785 = _1769 * _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1789 = -_1773;
    float _1791 = fma(_1769, _1787, _1789);
    float _1793 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1795 = -_1781;
    float _1797 = fma(_1723, _1747, _1795);
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1801 = -_1785;
    float _1803 = fma(_1751, _1799, _1801);
    float _1805 = _1791 * _1791;
    float _1807 = _1713 * 6.283185482025146484375;
    float _1809 = cos(_1807);
    float _1811 = -_1747;
    float _1813 = fma(_1723, _1781, _1811);
    float _1815 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1817 = fma(_1803, _1803, _1805);
    float _1819 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1821 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1737);
    float _1823 = _1767 * _1815;
    float _1825 = fma(_1779, _1779, _1817);
    float _1827 = _1767 * _1819;
    float _1829 = _1767 * _1793;
    float _1831 = _1763 * _1823;
    float _1833 = rsqrt(_1825);
    float _1835 = _1765 * _1827;
    float _1837 = _1821 * _1829;
    float _1839 = _1813 * _1831;
    float _1841 = _1745 * _1831;
    float _1843 = _1683 * _1809;
    float _1845 = _1655 * _1809;
    float _1847 = fma(_1743, _1835, _1839);
    float _1849 = _1809 * _1837;
    float _1851 = _1843 * _1831;
    float _1853 = fma(_1797, _1835, _1841);
    float _1855 = fma(_1675, _1849, _1847);
    float _1857 = fma(_1845, _1835, _1851);
    float _1859 = fma(_1679, _1849, _1853);
    float _1861 = _1791 * _1833;
    float _1863 = _1803 * _1833;
    float _1865 = _1779 * _1833;
    float _1867 = -_1723;
    float _1869 = fma(_1867, _1837, _1857);
    float _1871 = _1769 * _1861;
    float _1873 = _1751 * _1863;
    float _1875 = -_1871;
    float _1877 = fma(_1751, _1865, _1875);
    float _1879 = -_1873;
    float _1881 = fma(_1749, _1861, _1879);
    float _1883 = _1877 * _1869;
    float _1885 = _1881 * _1869;
    float _1887 = fma(_1863, _1855, _1883);
    float _1889 = fma(_1865, _1855, _1885);
    float _1891 = fma(_1749, _1859, _1887);
    float _1893 = fma(_1769, _1859, _1889);
    float _1895 = _1749 * _1865;
    float _1897 = _921 + _1891;
    float _1899 = _1411 + _1893;
    float _1901 = -_1895;
    float _1903 = fma(_1769, _1863, _1901);
    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1907 = _1897 + _1905;
    float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1911 = _1899 + _1909;
    float _1913 = _1903 * _1869;
    float _1915 = _1907 * _1907;
    float _1917 = _1911 * _1911;
    float _1919 = fma(_1861, _1855, _1913);
    float _1921 = _1915 + _1917;
    float _1923 = fma(_1751, _1859, _1919);
    float _1925 = sqrt(_1921);
    float _1927 = _969 + _1923;
    bool _1929 = _1925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1931 = _1769;
    float _1933 = _1889;
    float _1935 = _1915;
    float _1937 = _1917;
    float _1939 = _1899;
    if (!_1929)
    {
        _1931 = _1897;
    }
    float _1941 = _1931;
    float _1943 = _1941;
    if (!_1929)
    {
        _1933 = _1927;
    }
    float _1945 = _1933;
    bool _1947 = !_1929;
    float _1949 = _1945;
    if (!_1947)
    {
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1955 = _1925 + _1953;
        float _1957 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = rsqrt(_1921);
        float _1961 = _1955 * _1951;
        float _1963 = _1961 * 0.15915493667125701904296875;
        float _1965 = _1963 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1963 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = fma(_1967, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1975 = _1959 * _1973;
        float _1977 = _1971 + (-1.0);
        float _1979 = fma(_1907, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1981 = fma(_1911, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1983 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1987 = _1979 + _1985;
        float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1991 = _1981 + _1989;
        float _1993 = fma(_1927, _1971, _1983);
        float _1995 = _1987 * _1987;
        float _1997 = _1991 * _1991;
        _1949 = _1993;
        _1935 = _1995;
        _1937 = _1997;
        _1943 = _1979;
        _1939 = _1981;
    }
    float _1999 = _1949;
    float _2001 = _1935;
    float _2003 = _1937;
    float _2005 = _1943;
    float _2007 = _1939;
    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2011 = _1999 + _2009;
    float _2013 = fma(_2011, _2011, _2001);
    float _2015 = _2013 + _2003;
    float _2017 = sqrt(_2015);
    bool _2019 = _2017 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2021 = isnan(_2017);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2027 = _2023 || _2025;
    float _2029 = _2001;
    float _2031 = _2017;
    if (!_2027)
    {
        _2029 = 1.0;
    }
    float _2033 = _2029;
    bool _2035 = !_2027;
    float _2037 = _2033;
    if (!_2035)
    {
        bool _2039 = _2017 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2041 = isnan(_2017);
        bool _2043 = _2039 || _2041;
        bool _2045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2047 = _2043 || _2045;
        if (!_2047)
        {
            float _2049 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2051 = _2017 + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2055 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2053;
            float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2059 = _2057 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2061 = 1.0 / _2055;
            float _2063 = _2051 * _2061;
            float _2065 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2037 = _2065;
            _2067 = true;
        }
        else
        {
            bool _2069 = _2017 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2071 = isnan(_2017);
            bool _2073 = _2069 || _2071;
            bool _2075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2077 = _2073 || _2075;
            if (!_2077)
            {
                float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2081 = _2017 + _2079;
                float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2085 = _2083 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2089 = _2087 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2091 = 1.0 / _2085;
                float _2093 = _2081 * _2091;
                float _2095 = fma(_2093, _2089, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2037 = _2095;
                _2067 = true;
            }
            else
            {
                _2037 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2067 = false;
    float _2097 = _2037;
    float _2099 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2101 = _1999 + _2099;
    float _2103 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2105 = _2005 + _2103;
    float _2107 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2109 = _2007 + _2107;
    float _2111 = fma(_2101, _2097, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2113 = fma(_2105, _2097, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2115 = fma(_2109, _2097, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2117 = -_1535;
    float _2119 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2111);
    float _2121 = -_1537;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2113);
    float _2125 = -_1579;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2115);
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2131 = _2119 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2135 = _2123 + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2139 = _2127 + _2137;
    float _2141 = _2131 * _2131;
    float _2143 = fma(_2135, _2135, _2141);
    float _2145 = fma(_2139, _2139, _2143);
    float _2147 = rsqrt(_2145);
    float _2149 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2151 = _2135 * _2149;
    float _2153 = _2139 * _2149;
    float _2155 = _2151 * _2151;
    float _2157 = _2153 * _2153;
    float _2159 = _2155 + _2157;
    float _2161 = sqrt(_2159);
    bool _2163 = _2161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2167 = _2161 + _2165;
    float _2169 = _2147;
    float _2171 = _2159;
    float _2173 = _2167;
    float _2175 = _2131;
    float _2177 = _2149;
    float _2179 = _2151;
    if (_2163)
    {
        float _2181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2169 = _2181;
    }
    float _2183 = _2169;
    if (_2163)
    {
        float _2185 = rsqrt(_2159);
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (_2163)
    {
        float _2189 = _2167 * _2183;
        _2173 = _2189;
    }
    float _2191 = _2173;
    if (_2163)
    {
        float _2193 = _2191 * 0.15915493667125701904296875;
        _2031 = _2193;
    }
    float _2195 = _2031;
    float _2197 = _2183;
    if (_2163)
    {
        float _2199 = _2195 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        _2197 = _2201;
    }
    float _2203 = _2197;
    float _2205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2207 = precise::max(0.0, _2205);
    float _2209 = _2139;
    float _2211 = _2207;
    if (_2163)
    {
        float _2213 = _2195 * 6.283185482025146484375;
        float _2215 = cos(_2213);
        _2209 = _2215;
    }
    float _2217 = _2209;
    float _2219 = -_2149;
    float _2221 = -_2207;
    float _2223 = fma(_2131, _2219, _2221);
    if (!_2163)
    {
        _2175 = _2153;
    }
    float _2225 = _2175;
    float _2227 = _2225;
    if (_2163)
    {
        float _2229 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2211 = _2229;
    }
    float _2231 = _2211;
    float _2233 = _2203;
    float _2235 = _2231;
    if (_2163)
    {
        float _2237 = fma(_2203, _2231, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2233 = _2237;
    }
    float _2239 = _2233;
    float _2241 = _2239;
    float _2243 = _2217;
    if (_2163)
    {
        float _2245 = _2217 + (-1.0);
        _2235 = _2245;
    }
    float _2247 = _2235;
    float _2249 = _2247;
    if (_2163)
    {
        float _2251 = _2187 * _2239;
        _987 = _2251;
    }
    float _2253 = _987;
    if (!_2163)
    {
        _2241 = _2223;
    }
    float _2255 = _2241;
    float _2257 = sqrt(_2145);
    float _2259 = _2255;
    if (_2163)
    {
        float _2261 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2177 = _2261;
    }
    float _2263 = _2177;
    if (_2163)
    {
        float _2265 = _2151 * _2253;
        _2179 = _2265;
    }
    float _2267 = _2179;
    if (!_2163)
    {
        _2249 = _2155;
    }
    float _2269 = _2249;
    float _2271 = _2269;
    if (_2163)
    {
        float _2273 = _2153 * _2253;
        _2227 = _2273;
    }
    float _2275 = _2227;
    if (_2163)
    {
        float _2277 = fma(_2223, _2217, _2263);
        _2259 = _2277;
    }
    float _2279 = _2259;
    if (_2163)
    {
        float _2281 = _2267 * _2267;
        _2271 = _2281;
    }
    float _2283 = _2271;
    if (!_2163)
    {
        _2243 = _2157;
    }
    float _2285 = _2243;
    float _2287 = _2285;
    if (_2163)
    {
        float _2289 = _2275 * _2275;
        _2287 = _2289;
    }
    float _2291 = _2287;
    float _2293 = fma(_2279, _2279, _2283);
    float _2295 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2297 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2299 = _2293 + _2291;
    float _2301 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2295);
    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2305 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2303);
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2311 = rsqrt(_2299);
    float _2313 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2301);
    float _2315 = -_2307;
    float _2317 = _2315 + 1.0;
    float _2319 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2321 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2309);
    float _2323 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2325 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2297);
    float _2327 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2319);
    float _2329 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2321);
    float _2331 = abs(_2317);
    float _2333 = log2(_2331);
    float _2335 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2337 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2327);
    float _2339 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2341 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2343 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2325);
    float _2345 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2347 = _2311 * _2267;
    float _2349 = -_2339;
    float _2351 = fma(_2349, _2335, 1.0);
    float _2353 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2355 = _2311 * _2279;
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2359 = _2311 * _2275;
    float _2361 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2353);
    float _2363 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2365 = -_2357;
    float _2367 = fma(_2355, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2365);
    float _2369 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2371 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2361);
    float _2373 = log2(_2351);
    float _2375 = -_2359;
    float _2377 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2367);
    float _2379 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2381 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2371);
    float _2383 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2385 = fma(_2377, -0.5, 0.5);
    float _2387 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2379);
    float _2389 = fma(_2377, 0.5, 0.5);
    float _2391 = exp2(_2369);
    float _2393 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2383);
    float _2395 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2387);
    float _2397 = _2355 + 1.0;
    float _2399 = fma(_2389, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2401 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2393);
    float _2403 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2395);
    float _2405 = 1.0 / _2381;
    float _2407 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2401);
    float _2409 = fma(_2389, _2399, -0.212114393711090087890625);
    float _2411 = _2373 * 0.693147182464599609375;
    float _2413 = fma(_2389, _2409, 1.570728778839111328125);
    float _2415 = sqrt(_2385);
    float _2417 = -_2355;
    float _2419 = fma(_2391, _2397, _2417);
    float _2421 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2423 = fma(_2419, 0.5, 0.5);
    float _2425 = _2403 * _2405;
    float _2427 = _2407 * _2405;
    float _2429 = fma(_2425, 0.5, 0.5);
    float _2431 = fma(_2427, -0.5, 0.5);
    float _2433 = _2415 * 0.636619746685028076171875;
    float3 _6193 = float3(_2429, _2431, _2421);
    float _2435 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6193, float3(0.0), isnan(_6193)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6193, float3(0.0), isnan(_6193)), level(0.0)).x;
    float _2437 = -_2413;
    float _2439 = fma(_2433, _2437, 1.0);
    float3 _6209 = float3(_2429, _2431, _2421);
    float4 _2442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6209, float3(0.0), isnan(_6209)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6209, float3(0.0), isnan(_6209)), level(0.0)).xyzw;
    float _2444 = _2442.x;
    float _2446 = _2442.y;
    float _2448 = _2442.z;
    float _2450 = _2442.w;
    float2 _6226 = float2(_2439, _2423);
    float3 _2454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6226, float2(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6226, float2(0.0), isnan(_6226)), level(0.0)).xyz;
    float _2456 = _2454.x;
    float _2458 = _2454.y;
    float _2460 = _2454.z;
    float _2462 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2464 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2466 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2464);
    float _2468 = exp2(_2462);
    float _2470 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2466);
    float _2472 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2470);
    float _2474 = _2472 + _2381;
    out.gl_Position.x = _2403;
    out.gl_Position.y = _2407;
    out.gl_Position.z = _2472;
    out.gl_Position.w = _2381;
    float _2476 = _2474 * 0.5;
    float _2478 = -_2468;
    float _2480 = _2478 + 1.0;
    float _2482 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2476;
    out.m_71.w = _2381;
    out.m_47.x = _2482;
    float _2486 = _2484 * _2435;
    float _2488 = -_2484;
    float _2490 = _2488 + 1.0;
    float _2492 = _2450 * _2486;
    float _2494 = _2450 * _2490;
    float _2496 = _2460 * _2486;
    float _2498 = fma(_2456, _2492, _2444);
    float _2500 = fma(_2458, _2492, _2446);
    float _2502 = fma(_2450, _2496, _2448);
    out.m_73.x = _2498;
    out.m_73.y = _2500;
    out.m_73.z = _2502;
    out.m_73.w = _2494;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2067 = false;
    bool _472 = false;
    bool _290 = false;
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
    float _100 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    float _104 = _102;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2558 = as_type<float>(_110);
        out.gl_Position.z = _2558;
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
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    int _144 = 0;
    if (_140)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2627 = as_type<float>(_148);
        out.gl_Position.z = _2627;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_51.w;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = _152;
    if (!_162)
    {
        float _178 = _152 * _152;
        float _180 = _178 * 0.5;
        _100 = _180;
    }
    float _182 = _100;
    float _184 = _182;
    if (!_162)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_162;
    float _192 = _188;
    if (!_190)
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
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_162;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _152 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _164, _252);
    float _260 = fma(_248, _166, _254);
    float _262 = fma(_248, _168, _256);
    float _264 = fma(_258, _150, _170);
    float _266 = fma(_260, _150, _172);
    float _268 = fma(_262, _150, _174);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_53.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_92);
        float _294 = 1.0 / _292;
        float _296 = _126 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _298 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _328 = 1.0 / _322;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _332 = 1.0 / _326;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _334;
    float _338 = _302 * _328;
    bool _340 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _342 = isnan(_298);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_314;
    float _354 = _352 + 1.0;
    bool _356 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _358 = isnan(_298);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_336, _338, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _370 = _366 * _354;
    float _372 = -_366;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _380;
    float _384 = _318 * _332;
    float _386 = _350 * _374;
    float _388 = fma(_378, _338, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = fma(_382, _338, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = -_350;
    float _394 = _392 + 1.0;
    float _396 = _368 * _386;
    float _398 = _388 * _386;
    float _400 = _390 * _386;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _414 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].y, _396);
    float _418 = fma(_404, _384, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _420 = fma(_408, _384, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _422 = fma(_412, _384, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_418, _370, _414);
    float _428 = fma(_420, _370, _416);
    float _430 = fma(_422, _370, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    float _438 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _440 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _444 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _446;
    out.m_55.y = _448;
    out.m_55.z = _450;
    out.m_55.w = _442;
    bool _452 = !_330;
    float _470;
    if (!_452)
    {
        float _454 = in.m_53.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_92);
        float _476 = 1.0 / _474;
        float _478 = _126 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _484 = int(_482);
    float _486 = in.m_57.x;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _490 = _480 + _488;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _494 = _492 != 0;
    float _496 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _498 = int(_496);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _502 = _500 != 0;
    float _504 = float(_484);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _508 = 1.0 / _504;
    float _510 = float(uint(_498));
    int _512 = ~_498;
    int _514 = _512 + 1;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _516;
    int _520 = ~_498;
    int _522 = _520 + 1;
    float _524 = 1.0 / _510;
    float _526 = float(_498);
    int _528 = ~_498;
    int _530 = _528 + 1;
    bool _532 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _534 = isnan(_480);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _508 * _126;
    bool _546 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _548 = isnan(_480);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = trunc(_544);
    int _560 = int(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _562;
    int _566 = as_type<int>(_524) + (-2);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _568;
    float _572 = float(uint(_560));
    float _574 = as_type<float>(_566) * _572;
    float _576 = trunc(_574);
    float _578 = precise::max(_576, 0.0);
    uint _581 = uint(_578);
    int _583 = _514 * int(_581);
    int _585 = _583 + _560;
    float _587 = float(uint(_585));
    float _589 = as_type<float>(_566) * _587;
    float _591 = in.m_53.x;
    float _593 = in.m_53.y;
    float _595 = trunc(_589);
    float _597 = precise::max(_595, 0.0);
    uint _599 = uint(_597);
    int _601 = int(_581) + int(_599);
    float _603 = float(_560);
    bool _605 = !_494;
    float _607 = _605 ? 7.345489978790283203125 : 1.0;
    int _609 = _522 * _601;
    int _611 = _609 + _560;
    bool _613 = _603 >= _526;
    bool _615 = isnan(_603);
    bool _617 = _613 || _615;
    bool _619 = isnan(_526);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = float(_92);
    float _627 = _607 * _591;
    bool _629 = uint(_611) >= uint(_498);
    float _631 = trunc(_623);
    int _633 = int(_631);
    bool _635 = !_629;
    int _637 = _635 ? 0 : (-1);
    bool _639 = _498 == 0;
    int _641 = ~_601;
    int _643 = _641 + _637;
    int _645 = _643 + 1;
    float _647 = floor(_627);
    int _649 = _498 * _645;
    int _651 = _649 + _560;
    float _653 = 1.0 / _625;
    int _655 = ~_633;
    int _657 = _655 + 1;
    int _659 = _657 + 1;
    bool _661 = !_639;
    int _663 = _661 ? _651 : (-1);
    float _665 = -_647;
    float _667 = _627 + _665;
    int _669 = _663 * _659;
    float _671 = _667 * _526;
    float _673 = _526 * _126;
    int _675 = _498 + (-1);
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _679 = _677 != 0;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _683 = _681 != 0;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _687 = _685 != 0;
    float _689 = _673 * _653;
    float _691 = trunc(_671);
    int _693 = int(_691);
    int _695 = _633 * _675;
    int _697 = _695 + _669;
    bool _699 = !_502;
    int _701 = _699 ? 0 : 1;
    bool _703 = !_683;
    int _705 = _703 ? 0 : 1;
    bool _707 = !_679;
    int _709 = _707 ? 0 : 1;
    float _711 = trunc(_689);
    int _713 = int(_711);
    int _715 = abs(_705);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _719 = _717 != 0;
    bool _721 = !_687;
    int _723 = _721 ? 0 : 1;
    int _725 = _697 * _715;
    int _727 = abs(_709);
    float _729 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _731 = abs(_701);
    bool _733 = !_719;
    int _735 = _733 ? 0 : 1;
    float _737 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _729);
    int _739 = abs(_723);
    int _741 = _693 * _731;
    int _743 = _741 + _560;
    int _745 = abs(_735);
    int _747 = _713 * _727;
    int _749 = _747 + _725;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _753 = _751 != 0;
    int _755 = _743 * _739;
    int _757 = _755 + _749;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _761 = _759 != 0;
    float _763 = in.m_57.y;
    int _765 = _693 * _745;
    int _767 = _765 + _757;
    int _769 = ~_498;
    int _771 = _769 + 1;
    bool _773 = _593 > 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _775 = float(uint(_767));
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _779 = _777 != 0;
    float _781 = 1.0;
    if (_753)
    {
        float _783 = in.m_53.x;
        _781 = _783;
    }
    float _785 = _781;
    bool _787 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _789 = isnan(1.0);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _795 = _791 || _793;
    float _797 = as_type<float>(_566) * _775;
    float _799 = trunc(_797);
    float _801 = precise::max(_799, 0.0);
    uint _803 = uint(_801);
    float _805 = -_763;
    float _807 = _805 + 1.0;
    float _809 = _763;
    if (_761)
    {
        float _811 = _773 ? _807 : _763;
        _809 = _811;
    }
    float _813 = _809;
    int _815 = _771 * int(_803);
    int _817 = _815 + _767;
    float _819 = float(uint(_817));
    float _821 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _823 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _825 = as_type<float>(_566) * _819;
    float _827 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _823);
    int _829 = ~_498;
    int _831 = _829 + 1;
    float _833 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _821);
    float _835 = trunc(_825);
    float _837 = precise::max(_835, 0.0);
    uint _839 = uint(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _843 = 1.0 + _841;
    float _845 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _847 = log2(_845);
    int _849 = int(_803) + int(_839);
    float _851 = 1.0 / _843;
    float _853 = float(uint(_743));
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _855;
    float _859 = as_type<float>(_566) * _853;
    float _861 = _591 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _863 = _831 * _849;
    int _865 = _863 + _767;
    float _867 = 1.0 / _857;
    float _869 = -_506;
    float _871 = fma(_861, 2.0, _869);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _877 = uint(_865) >= uint(_498);
    float _879 = _591 * 2.0;
    float _881 = -_126;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[76].x, _871);
    float _885 = trunc(_859);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    bool _891 = !_877;
    int _893 = _891 ? 0 : (-1);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _897;
    bool _901 = _785 > 0.5;
    bool _903 = _901 && _753;
    float _905 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _833);
    int _907 = ~_849;
    int _909 = _907 + _893;
    int _911 = _909 + 1;
    float _913 = _593 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _915 = 1.0 / _899;
    float _917 = _833;
    if (_753)
    {
        _917 = _486;
    }
    float _919 = _917;
    float _921 = _905 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _923 = _498 * _911;
    int _925 = _923 + _767;
    float _927 = fma(_913, -2.0, _895);
    float _929 = in.m_53.z;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _933 = _480 + _931;
    float _935 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    int _937 = _530 * int(_889);
    int _939 = _937 + _743;
    bool _941 = !_639;
    int _943 = _941 ? _925 : (-1);
    float _945 = _847 * _126;
    float _947 = floor(_879);
    float _949 = _919;
    if (_903)
    {
        float _951 = -_919;
        float _953 = _951 + 1.0;
        _949 = _953;
    }
    float _955 = _949;
    float _957 = float(uint(_939));
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _961 = _480 + _959;
    int _963 = _943 & 3;
    bool _965 = _963 != 0;
    float _967 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _927);
    float _969 = _935 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _971 = as_type<float>(_566) * _957;
    int _973 = _943 & 3;
    bool _975 = _973 != 0;
    float _977 = exp2(_945);
    int _979 = _965 ? 0 : 1;
    float _981 = _961 * _915;
    bool _983 = uint(_973) > 1u;
    float _985 = _915;
    float _987 = _969;
    if (!_753)
    {
        _985 = _486;
    }
    float _989 = _985;
    float _991 = _989;
    if (_753)
    {
        _991 = _955;
    }
    float _993 = _991;
    float _995 = 1.0 / _875;
    int _997 = ~_979;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    bool _1003 = _947 > 0.0;
    bool _1005 = _947 >= 0.0;
    bool _1007 = isnan(_947);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.0);
    bool _1013 = _1009 || _1011;
    int _1015 = ~_498;
    int _1017 = _1015 + 1;
    float _1019 = -_977;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _827);
    float _1025 = _933 * _867;
    float _1027 = trunc(_971);
    float _1029 = precise::max(_1027, 0.0);
    uint _1031 = uint(_1029);
    float _1033 = _593 + _929;
    float _1035 = fma(_518, _1025, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _1037 = _1001;
    if (!_983)
    {
        int _1039 = ~_979;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = _1033 + (-1.0);
    bool _1047 = uint(_973) >= 2u;
    float _1049 = _490 * _995;
    float _1051 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1053 = _593 * 2.0;
    int _1055 = _1047 ? 0 : 1;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1059 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1061 = isnan(0.0);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1067 = _1063 || _1065;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1071 = int(_889) + int(_1031);
    float _1073 = _929 * 2.0;
    float _1075 = _1067 ? _1021 : 0.0;
    float _1077 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1069);
    bool _1079 = _973 != 3;
    float _1081 = floor(_1053);
    float _1083 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1057);
    float _1085 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1077);
    int _1087 = _1017 * _1071;
    int _1089 = _1087 + _743;
    float _1091 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1083);
    float _1093 = floor(_1073);
    int _1095 = ~_1055;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    int _1101 = _1099;
    if (_795)
    {
        float _1103 = _1075 * _851;
        _130 = _1103;
    }
    float _1105 = _130;
    bool _1107 = uint(_1089) >= uint(_498);
    if (_1079)
    {
        int _1109 = ~_1055;
        int _1111 = _1109 + 1;
        _1101 = _1111;
    }
    int _1113 = _1101;
    int _1115 = _943 >> 31;
    int _1117 = _1013 ? 0 : 1;
    bool _1119 = !_1107;
    int _1121 = _1119 ? 0 : (-1);
    int _1123 = _1115 & 3;
    bool _1125 = !_779;
    int _1127 = _1125 ? 0 : 1;
    bool _1129 = _973 != 3;
    bool _1131 = _1081 > 0.0;
    bool _1133 = _1081 >= 0.0;
    bool _1135 = isnan(_1081);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(0.0);
    bool _1141 = _1137 || _1139;
    int _1143 = ~_1117;
    int _1145 = _1143 + 1;
    int _1147 = _1145 + 1;
    int _1149 = _1147;
    if (!_1003)
    {
        int _1151 = ~_1117;
        int _1153 = _1151 + 1;
        _1149 = _1153;
    }
    int _1155 = _1149;
    int _1157 = _943 + _1123;
    bool _1159 = !_975;
    int _1161 = _1159 ? 0 : 1;
    bool _1163 = !_1129;
    int _1165 = _1163 ? 0 : (-1);
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1169 = _1167 != 0;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1177 = _1175 != 0;
    int _1179 = _1141 ? 0 : 1;
    bool _1181 = _1093 > 0.0;
    float _1183 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1185 = _1093 >= 0.0;
    bool _1187 = isnan(_1093);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan(0.0);
    bool _1193 = _1189 || _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1195;
    float _1199 = -_967;
    float _1201 = fma(_1085, _1183, _1199);
    int _1203 = _1157 >> 2;
    float _1205 = fma(_1197, _1025, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1207 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1209 = isnan(_480);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1219;
    int _1223 = _1203 << 4;
    int _1225 = _1223 + 368;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1231 = abs(_1161);
    float _1233 = -_1217;
    float _1235 = _1233 + 1.0;
    float _1237 = fma(_1221, _1025, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    uint _1239 = uint(int(uint(_1225) >> uint(2)));
    uint _1241 = uint(int(uint(int(_1239)) >> uint(2)));
    int _1243 = int(_1239) & 3;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[int(_1241)][_1243];
    int _1247 = int(_1239) + 1;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    int _1251 = _1247 & 3;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[int(_1249)][_1251];
    bool _1255 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1257 = isnan(_480);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1271 = _542 * _1235;
    float _1273 = -_542;
    float _1275 = _1273 + 1.0;
    float _1277 = fma(_1269, _1049, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1279 = -_1265;
    float _1281 = _1279 + 1.0;
    float _1283 = _1265 * _1275;
    int _1285 = abs(_1113);
    int _1287 = _1225 + 8;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[int(_1299)][_1301];
    float _1305 = _556 * _1281;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1307;
    float _1311 = -_556;
    float _1313 = _1311 + 1.0;
    int _1315 = ~_1285;
    int _1317 = _1315 + 1;
    int _1319 = _1317 + 1;
    float _1321 = _1237 * _1305;
    float _1323 = fma(_1309, _981, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1325 = _1035 * _1305;
    int _1327 = ~_1071;
    int _1329 = _1327 + _1121;
    int _1331 = _1329 + 1;
    float _1333 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1321);
    int _1335 = abs(_1043);
    float _1337 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1339 = abs(_1127);
    int _1341 = _498 * _1331;
    int _1343 = _1341 + _743;
    int _1345 = ~_1335;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    float _1351 = fma(_1091, _1337, _883);
    int _1353 = ~_1231;
    int _1355 = _1353 + 1;
    int _1357 = _1355 + 1;
    float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1361 = _921 + _1359;
    int _1363 = ~_1339;
    int _1365 = _1363 + 1;
    int _1367 = _1365 + 1;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1373 = _1205 * _1305;
    float _1375 = fma(_1229, _1049, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1377 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1325);
    float _1379 = fma(_1371, _1049, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1381 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1373);
    float _1383 = fma(_564, _981, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1385 = fma(_570, _981, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1387 = fma(_1277, _1283, _1333);
    float _1389 = fma(_1375, _1283, _1377);
    float _1391 = fma(_1379, _1283, _1381);
    float _1393 = float(_1155);
    float _1395 = fma(_1323, _1271, _1387);
    float _1397 = fma(_1383, _1271, _1389);
    float _1399 = fma(_1385, _1271, _1391);
    float _1401 = _1201 + 0.5;
    float _1403 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1395);
    float _1405 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1397);
    float _1407 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1399);
    int _1409 = _1349 * as_type<int>(_1253);
    float _1411 = _1023 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1413 = abs(_1165);
    float _1415 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1417 = _1357 * as_type<int>(_1245);
    int _1419 = _1417 + _1409;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1423 = _969 + _1421;
    int _1425 = ~_1413;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1433 = _1411 + _1431;
    float _1435 = _1351 + 0.5;
    float _1437 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1439 = _1319 * as_type<int>(_1295);
    int _1441 = _1439 + _1419;
    float _1443 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1437);
    int _1445 = _1429 * as_type<int>(_1303);
    int _1447 = _1445 + _1441;
    bool _1449 = !_639;
    int _1451 = _1449 ? _1343 : (-1);
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1455 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1443);
    int _1457 = _1447 * _1367;
    float _1459 = _1423 * _1423;
    float _1461 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1435;
    out.m_61.y = _1401;
    int _1463 = _1451 * _1339;
    int _1465 = _1463 + _1457;
    bool _1467 = !_1173;
    int _1469 = _1467 ? 0 : 1;
    float _1471 = _1407 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1473 = _1455 >= 0.0;
    float _1475 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1477 = abs(_1469);
    float _1479 = fma(_1361, _1361, _1459);
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1483 = in.m_63.x;
    float _1485 = in.m_63.y;
    float _1487 = in.m_63.z;
    float _1489 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = fma(_1433, _1433, _1479);
    float _1493 = float(_1465);
    float _1495 = _593 + (-0.5);
    float _1497 = float(_1477);
    out.m_65.x = _1461;
    out.m_65.y = _1489;
    out.m_65.z = _1481;
    out.m_65.w = _1453;
    int _1499 = ~_1179;
    int _1501 = _1499 + 1;
    int _1503 = _1501 + 1;
    float _1505 = rsqrt(_1491);
    float _1507 = as_type<float>(_1155);
    int _1509 = _1503;
    if (_1473)
    {
        _1507 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1511 = _1507;
    out.m_67.x = _1493;
    float _1513 = _1497 * _1393;
    int _1515 = as_type<int>(_1511);
    if (!_1131)
    {
        int _1517 = ~_1179;
        int _1519 = _1517 + 1;
        _1509 = _1519;
    }
    int _1521 = _1509;
    if (_1473)
    {
        float _1523 = _1511 * 5.0;
        _1515 = as_type<int>(_1523);
    }
    int _1525 = _1515;
    if (_1473)
    {
        out.m_47.x = 0.0;
    }
    bool _1527 = !_1177;
    int _1529 = _1527 ? 0 : 1;
    bool _1531 = !_1169;
    int _1533 = _1531 ? 0 : 1;
    if (_1473)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4729 = as_type<float>(_1525);
        out.gl_Position.z = _4729;
    }
    float _1535 = _1423 * _1505;
    float _1537 = _1361 * _1505;
    if (_1473)
    {
        return out;
    }
    float _1539 = -_1535;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1543 = _1513 * (-2.0);
    float _1545 = -_1537;
    float _1547 = fma(_1545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    int _1549 = _1193 ? 0 : 1;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1553 = _1541 + _1551;
    float _1555 = fma(_1543, _1485, _1485);
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1559 = _1547 + _1557;
    int _1561 = ~_1549;
    int _1563 = _1561 + 1;
    int _1565 = _1563 + 1;
    float _1567 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1569 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1555);
    int _1571 = _1565;
    if (!_1181)
    {
        int _1573 = ~_1549;
        int _1575 = _1573 + 1;
        _1571 = _1575;
    }
    int _1577 = _1571;
    float _1579 = _1433 * _1505;
    float _1581 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1567);
    int _1583 = abs(_1529);
    float _1585 = _929 + _591;
    float _1587 = float(_1521);
    float _1589 = -_1579;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1593 = float(_1583);
    float _1595 = fma(_1051, _1543, _1051);
    int _1597 = abs(_1533);
    float _1599 = _1585 + (-1.0);
    float _1601 = _1593 * _1587;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1591 + _1603;
    float _1607 = float(_1597);
    float _1609 = _929 + (-0.5);
    float _1611 = float(_1577);
    float _1613 = _1601 * (-2.0);
    float _1615 = fma(_1599, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1581);
    float _1619 = _593 + _591;
    float _1621 = fma(_1613, _1487, _1487);
    float _1623 = _1607 * _1611;
    float _1625 = fma(_1615, _1613, _1615);
    float _1627 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1621);
    bool _1629 = _1617 >= 0.0;
    float _1631 = _1619 + (-1.0);
    float _1633 = _1623 * (-2.0);
    float _1635 = fma(_1625, _1105, _1627);
    float _1637 = _591 + (-0.5);
    float _1639 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1641 = fma(_1633, _1483, _1483);
    float _1643 = fma(_1595, _1105, _1569);
    float _1645 = _1635 * 0.15915493667125701904296875;
    float _1647 = fma(_1639, _1633, _1639);
    float _1649 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1641);
    float _1651 = _1643 * 0.15915493667125701904296875;
    float _1653 = _1645 * 6.283185482025146484375;
    float _1655 = sin(_1653);
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (_1629)
    {
        _1657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1659 = _1657;
    float _1661 = fma(_1647, _1105, _1649);
    int _1663 = as_type<int>(_1659);
    if (_1629)
    {
        out.m_47.x = 0.0;
    }
    float _1665 = -_1535;
    float _1667 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1423);
    if (_1629)
    {
        float _1669 = _1659 * 5.0;
        _1663 = as_type<int>(_1669);
    }
    int _1671 = _1663;
    float _1673 = _1651 * 6.283185482025146484375;
    float _1675 = sin(_1673);
    if (_1629)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4969 = as_type<float>(_1671);
        out.gl_Position.z = _4969;
    }
    float _1677 = _1651 * 6.283185482025146484375;
    float _1679 = cos(_1677);
    float _1681 = _1645 * 6.283185482025146484375;
    float _1683 = cos(_1681);
    if (_1629)
    {
        return out;
    }
    float _1685 = -_969;
    float _1687 = _1685 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1689 = -_921;
    float _1691 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1693 = -_1537;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1361);
    float _1697 = _1667 * _1667;
    float _1699 = _1687 * _1687;
    float _1701 = -_1411;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1705 = -_1579;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1433);
    float _1709 = fma(_1695, _1695, _1697);
    float _1711 = fma(_1691, _1691, _1699);
    float _1713 = _1661 * 0.15915493667125701904296875;
    float _1715 = _1679 * _1683;
    float _1717 = fma(_1707, _1707, _1709);
    float _1719 = fma(_1703, _1703, _1711);
    float _1721 = _1713 * 6.283185482025146484375;
    float _1723 = sin(_1721);
    float _1725 = _1675 * _1655;
    float _1727 = in.m_51.x;
    float _1729 = in.m_51.y;
    float _1731 = in.m_51.z;
    float _1733 = in.m_69.x;
    float _1735 = in.m_69.y;
    float _1737 = in.m_69.z;
    float _1739 = rsqrt(_1719);
    float _1741 = sqrt(_1717);
    float _1743 = fma(_1723, _1725, _1715);
    float _1745 = fma(_1723, _1715, _1725);
    float _1747 = _1679 * _1655;
    float _1749 = _1691 * _1739;
    float _1751 = _1687 * _1739;
    float _1753 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1755 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1757 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1759 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1761 = _1751 * _1759;
    float _1763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1735);
    float _1765 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1733);
    float _1767 = _1505 * _1741;
    float _1769 = _1703 * _1739;
    float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1773 = _1749 * _1771;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1777 = -_1761;
    float _1779 = fma(_1749, _1775, _1777);
    float _1781 = _1675 * _1683;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1785 = _1769 * _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1789 = -_1773;
    float _1791 = fma(_1769, _1787, _1789);
    float _1793 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1795 = -_1781;
    float _1797 = fma(_1723, _1747, _1795);
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1801 = -_1785;
    float _1803 = fma(_1751, _1799, _1801);
    float _1805 = _1791 * _1791;
    float _1807 = _1713 * 6.283185482025146484375;
    float _1809 = cos(_1807);
    float _1811 = -_1747;
    float _1813 = fma(_1723, _1781, _1811);
    float _1815 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1817 = fma(_1803, _1803, _1805);
    float _1819 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1821 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1737);
    float _1823 = _1767 * _1815;
    float _1825 = fma(_1779, _1779, _1817);
    float _1827 = _1767 * _1819;
    float _1829 = _1767 * _1793;
    float _1831 = _1763 * _1823;
    float _1833 = rsqrt(_1825);
    float _1835 = _1765 * _1827;
    float _1837 = _1821 * _1829;
    float _1839 = _1813 * _1831;
    float _1841 = _1745 * _1831;
    float _1843 = _1683 * _1809;
    float _1845 = _1655 * _1809;
    float _1847 = fma(_1743, _1835, _1839);
    float _1849 = _1809 * _1837;
    float _1851 = _1843 * _1831;
    float _1853 = fma(_1797, _1835, _1841);
    float _1855 = fma(_1675, _1849, _1847);
    float _1857 = fma(_1845, _1835, _1851);
    float _1859 = fma(_1679, _1849, _1853);
    float _1861 = _1791 * _1833;
    float _1863 = _1803 * _1833;
    float _1865 = _1779 * _1833;
    float _1867 = -_1723;
    float _1869 = fma(_1867, _1837, _1857);
    float _1871 = _1769 * _1861;
    float _1873 = _1751 * _1863;
    float _1875 = -_1871;
    float _1877 = fma(_1751, _1865, _1875);
    float _1879 = -_1873;
    float _1881 = fma(_1749, _1861, _1879);
    float _1883 = _1877 * _1869;
    float _1885 = _1881 * _1869;
    float _1887 = fma(_1863, _1855, _1883);
    float _1889 = fma(_1865, _1855, _1885);
    float _1891 = fma(_1749, _1859, _1887);
    float _1893 = fma(_1769, _1859, _1889);
    float _1895 = _1749 * _1865;
    float _1897 = _921 + _1891;
    float _1899 = _1411 + _1893;
    float _1901 = -_1895;
    float _1903 = fma(_1769, _1863, _1901);
    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1907 = _1897 + _1905;
    float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1911 = _1899 + _1909;
    float _1913 = _1903 * _1869;
    float _1915 = _1907 * _1907;
    float _1917 = _1911 * _1911;
    float _1919 = fma(_1861, _1855, _1913);
    float _1921 = _1915 + _1917;
    float _1923 = fma(_1751, _1859, _1919);
    float _1925 = sqrt(_1921);
    float _1927 = _969 + _1923;
    bool _1929 = _1925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1931 = _1769;
    float _1933 = _1889;
    float _1935 = _1915;
    float _1937 = _1917;
    float _1939 = _1899;
    if (!_1929)
    {
        _1931 = _1897;
    }
    float _1941 = _1931;
    float _1943 = _1941;
    if (!_1929)
    {
        _1933 = _1927;
    }
    float _1945 = _1933;
    bool _1947 = !_1929;
    float _1949 = _1945;
    if (!_1947)
    {
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1955 = _1925 + _1953;
        float _1957 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = rsqrt(_1921);
        float _1961 = _1955 * _1951;
        float _1963 = _1961 * 0.15915493667125701904296875;
        float _1965 = _1963 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1963 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = fma(_1967, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1975 = _1959 * _1973;
        float _1977 = _1971 + (-1.0);
        float _1979 = fma(_1907, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1981 = fma(_1911, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1983 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1987 = _1979 + _1985;
        float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1991 = _1981 + _1989;
        float _1993 = fma(_1927, _1971, _1983);
        float _1995 = _1987 * _1987;
        float _1997 = _1991 * _1991;
        _1949 = _1993;
        _1935 = _1995;
        _1937 = _1997;
        _1943 = _1979;
        _1939 = _1981;
    }
    float _1999 = _1949;
    float _2001 = _1935;
    float _2003 = _1937;
    float _2005 = _1943;
    float _2007 = _1939;
    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2011 = _1999 + _2009;
    float _2013 = fma(_2011, _2011, _2001);
    float _2015 = _2013 + _2003;
    float _2017 = sqrt(_2015);
    bool _2019 = _2017 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2021 = isnan(_2017);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2027 = _2023 || _2025;
    float _2029 = _2001;
    float _2031 = _2017;
    if (!_2027)
    {
        _2029 = 1.0;
    }
    float _2033 = _2029;
    bool _2035 = !_2027;
    float _2037 = _2033;
    if (!_2035)
    {
        bool _2039 = _2017 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2041 = isnan(_2017);
        bool _2043 = _2039 || _2041;
        bool _2045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2047 = _2043 || _2045;
        if (!_2047)
        {
            float _2049 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2051 = _2017 + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2055 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2053;
            float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2059 = _2057 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2061 = 1.0 / _2055;
            float _2063 = _2051 * _2061;
            float _2065 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2037 = _2065;
            _2067 = true;
        }
        else
        {
            bool _2069 = _2017 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2071 = isnan(_2017);
            bool _2073 = _2069 || _2071;
            bool _2075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2077 = _2073 || _2075;
            if (!_2077)
            {
                float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2081 = _2017 + _2079;
                float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2085 = _2083 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2089 = _2087 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2091 = 1.0 / _2085;
                float _2093 = _2081 * _2091;
                float _2095 = fma(_2093, _2089, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2037 = _2095;
                _2067 = true;
            }
            else
            {
                _2037 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2067 = false;
    float _2097 = _2037;
    float _2099 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2101 = _1999 + _2099;
    float _2103 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2105 = _2005 + _2103;
    float _2107 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2109 = _2007 + _2107;
    float _2111 = fma(_2101, _2097, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2113 = fma(_2105, _2097, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2115 = fma(_2109, _2097, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2117 = -_1535;
    float _2119 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2111);
    float _2121 = -_1537;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2113);
    float _2125 = -_1579;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2115);
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2131 = _2119 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2135 = _2123 + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2139 = _2127 + _2137;
    float _2141 = _2131 * _2131;
    float _2143 = fma(_2135, _2135, _2141);
    float _2145 = fma(_2139, _2139, _2143);
    float _2147 = rsqrt(_2145);
    float _2149 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2151 = _2135 * _2149;
    float _2153 = _2139 * _2149;
    float _2155 = _2151 * _2151;
    float _2157 = _2153 * _2153;
    float _2159 = _2155 + _2157;
    float _2161 = sqrt(_2159);
    bool _2163 = _2161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2167 = _2161 + _2165;
    float _2169 = _2147;
    float _2171 = _2159;
    float _2173 = _2167;
    float _2175 = _2131;
    float _2177 = _2149;
    float _2179 = _2151;
    if (_2163)
    {
        float _2181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2169 = _2181;
    }
    float _2183 = _2169;
    if (_2163)
    {
        float _2185 = rsqrt(_2159);
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (_2163)
    {
        float _2189 = _2167 * _2183;
        _2173 = _2189;
    }
    float _2191 = _2173;
    if (_2163)
    {
        float _2193 = _2191 * 0.15915493667125701904296875;
        _2031 = _2193;
    }
    float _2195 = _2031;
    float _2197 = _2183;
    if (_2163)
    {
        float _2199 = _2195 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        _2197 = _2201;
    }
    float _2203 = _2197;
    float _2205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2207 = precise::max(0.0, _2205);
    float _2209 = _2139;
    float _2211 = _2207;
    if (_2163)
    {
        float _2213 = _2195 * 6.283185482025146484375;
        float _2215 = cos(_2213);
        _2209 = _2215;
    }
    float _2217 = _2209;
    float _2219 = -_2149;
    float _2221 = -_2207;
    float _2223 = fma(_2131, _2219, _2221);
    if (!_2163)
    {
        _2175 = _2153;
    }
    float _2225 = _2175;
    float _2227 = _2225;
    if (_2163)
    {
        float _2229 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2211 = _2229;
    }
    float _2231 = _2211;
    float _2233 = _2203;
    float _2235 = _2231;
    if (_2163)
    {
        float _2237 = fma(_2203, _2231, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2233 = _2237;
    }
    float _2239 = _2233;
    float _2241 = _2239;
    float _2243 = _2217;
    if (_2163)
    {
        float _2245 = _2217 + (-1.0);
        _2235 = _2245;
    }
    float _2247 = _2235;
    float _2249 = _2247;
    if (_2163)
    {
        float _2251 = _2187 * _2239;
        _987 = _2251;
    }
    float _2253 = _987;
    if (!_2163)
    {
        _2241 = _2223;
    }
    float _2255 = _2241;
    float _2257 = sqrt(_2145);
    float _2259 = _2255;
    if (_2163)
    {
        float _2261 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2177 = _2261;
    }
    float _2263 = _2177;
    if (_2163)
    {
        float _2265 = _2151 * _2253;
        _2179 = _2265;
    }
    float _2267 = _2179;
    if (!_2163)
    {
        _2249 = _2155;
    }
    float _2269 = _2249;
    float _2271 = _2269;
    if (_2163)
    {
        float _2273 = _2153 * _2253;
        _2227 = _2273;
    }
    float _2275 = _2227;
    if (_2163)
    {
        float _2277 = fma(_2223, _2217, _2263);
        _2259 = _2277;
    }
    float _2279 = _2259;
    if (_2163)
    {
        float _2281 = _2267 * _2267;
        _2271 = _2281;
    }
    float _2283 = _2271;
    if (!_2163)
    {
        _2243 = _2157;
    }
    float _2285 = _2243;
    float _2287 = _2285;
    if (_2163)
    {
        float _2289 = _2275 * _2275;
        _2287 = _2289;
    }
    float _2291 = _2287;
    float _2293 = fma(_2279, _2279, _2283);
    float _2295 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2297 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2299 = _2293 + _2291;
    float _2301 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2295);
    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2305 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2303);
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2311 = rsqrt(_2299);
    float _2313 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2301);
    float _2315 = -_2307;
    float _2317 = _2315 + 1.0;
    float _2319 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2321 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2309);
    float _2323 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2325 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2297);
    float _2327 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2319);
    float _2329 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2321);
    float _2331 = abs(_2317);
    float _2333 = log2(_2331);
    float _2335 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2337 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2327);
    float _2339 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2341 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2343 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2325);
    float _2345 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2347 = _2311 * _2267;
    float _2349 = -_2339;
    float _2351 = fma(_2349, _2335, 1.0);
    float _2353 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2355 = _2311 * _2279;
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2359 = _2311 * _2275;
    float _2361 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2353);
    float _2363 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2365 = -_2357;
    float _2367 = fma(_2355, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2365);
    float _2369 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2371 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2361);
    float _2373 = log2(_2351);
    float _2375 = -_2359;
    float _2377 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2367);
    float _2379 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2381 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2371);
    float _2383 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2385 = fma(_2377, -0.5, 0.5);
    float _2387 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2379);
    float _2389 = fma(_2377, 0.5, 0.5);
    float _2391 = exp2(_2369);
    float _2393 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2383);
    float _2395 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2387);
    float _2397 = _2355 + 1.0;
    float _2399 = fma(_2389, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2401 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2393);
    float _2403 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2395);
    float _2405 = 1.0 / _2381;
    float _2407 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2401);
    float _2409 = fma(_2389, _2399, -0.212114393711090087890625);
    float _2411 = _2373 * 0.693147182464599609375;
    float _2413 = fma(_2389, _2409, 1.570728778839111328125);
    float _2415 = sqrt(_2385);
    float _2417 = -_2355;
    float _2419 = fma(_2391, _2397, _2417);
    float _2421 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2423 = fma(_2419, 0.5, 0.5);
    float _2425 = _2403 * _2405;
    float _2427 = _2407 * _2405;
    float _2429 = fma(_2425, 0.5, 0.5);
    float _2431 = fma(_2427, -0.5, 0.5);
    float _2433 = _2415 * 0.636619746685028076171875;
    float3 _6193 = float3(_2429, _2431, _2421);
    float _2435 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6193, float3(0.0), isnan(_6193)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6193, float3(0.0), isnan(_6193)), level(0.0)).x;
    float _2437 = -_2413;
    float _2439 = fma(_2433, _2437, 1.0);
    float3 _6209 = float3(_2429, _2431, _2421);
    float4 _2442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6209, float3(0.0), isnan(_6209)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6209, float3(0.0), isnan(_6209)), level(0.0)).xyzw;
    float _2444 = _2442.x;
    float _2446 = _2442.y;
    float _2448 = _2442.z;
    float _2450 = _2442.w;
    float2 _6226 = float2(_2439, _2423);
    float3 _2454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6226, float2(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6226, float2(0.0), isnan(_6226)), level(0.0)).xyz;
    float _2456 = _2454.x;
    float _2458 = _2454.y;
    float _2460 = _2454.z;
    float _2462 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2464 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2466 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2464);
    float _2468 = exp2(_2462);
    float _2470 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2466);
    float _2472 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2470);
    float _2474 = _2472 + _2381;
    out.gl_Position.x = _2403;
    out.gl_Position.y = _2407;
    out.gl_Position.z = _2472;
    out.gl_Position.w = _2381;
    float _2476 = _2474 * 0.5;
    float _2478 = -_2468;
    float _2480 = _2478 + 1.0;
    float _2482 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2476;
    out.m_71.w = _2381;
    out.m_47.x = _2482;
    float _2486 = _2484 * _2435;
    float _2488 = -_2484;
    float _2490 = _2488 + 1.0;
    float _2492 = _2450 * _2486;
    float _2494 = _2450 * _2490;
    float _2496 = _2460 * _2486;
    float _2498 = fma(_2456, _2492, _2444);
    float _2500 = fma(_2458, _2492, _2446);
    float _2502 = fma(_2450, _2496, _2448);
    out.m_73.x = _2498;
    out.m_73.y = _2500;
    out.m_73.z = _2502;
    out.m_73.w = _2494;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2067 = false;
    bool _472 = false;
    bool _290 = false;
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
    float _100 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    float _104 = _102;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_96)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2558 = as_type<float>(_110);
        out.gl_Position.z = _2558;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    int _144 = 0;
    if (_140)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2627 = as_type<float>(_148);
        out.gl_Position.z = _2627;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.w;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = _152;
    if (!_162)
    {
        float _178 = _152 * _152;
        float _180 = _178 * 0.5;
        _100 = _180;
    }
    float _182 = _100;
    float _184 = _182;
    if (!_162)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_162;
    float _192 = _188;
    if (!_190)
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
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_162;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _152 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _164, _252);
    float _260 = fma(_248, _166, _254);
    float _262 = fma(_248, _168, _256);
    float _264 = fma(_258, _150, _170);
    float _266 = fma(_260, _150, _172);
    float _268 = fma(_262, _150, _174);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_53.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_92);
        float _294 = 1.0 / _292;
        float _296 = _126 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _298 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _328 = 1.0 / _322;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _332 = 1.0 / _326;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _334;
    float _338 = _302 * _328;
    bool _340 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _342 = isnan(_298);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_314;
    float _354 = _352 + 1.0;
    bool _356 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _358 = isnan(_298);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_336, _338, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _370 = _366 * _354;
    float _372 = -_366;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _380;
    float _384 = _318 * _332;
    float _386 = _350 * _374;
    float _388 = fma(_378, _338, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = fma(_382, _338, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = -_350;
    float _394 = _392 + 1.0;
    float _396 = _368 * _386;
    float _398 = _388 * _386;
    float _400 = _390 * _386;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _414 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].y, _396);
    float _418 = fma(_404, _384, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _420 = fma(_408, _384, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _422 = fma(_412, _384, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_418, _370, _414);
    float _428 = fma(_420, _370, _416);
    float _430 = fma(_422, _370, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    float _438 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _440 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _444 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _446;
    out.m_55.y = _448;
    out.m_55.z = _450;
    out.m_55.w = _442;
    bool _452 = !_330;
    float _470;
    if (!_452)
    {
        float _454 = in.m_53.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_92);
        float _476 = 1.0 / _474;
        float _478 = _126 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _484 = int(_482);
    float _486 = in.m_57.x;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _490 = _480 + _488;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _494 = _492 != 0;
    float _496 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _498 = int(_496);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _502 = _500 != 0;
    float _504 = float(_484);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _508 = 1.0 / _504;
    float _510 = float(uint(_498));
    int _512 = ~_498;
    int _514 = _512 + 1;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _516;
    int _520 = ~_498;
    int _522 = _520 + 1;
    float _524 = 1.0 / _510;
    float _526 = float(_498);
    int _528 = ~_498;
    int _530 = _528 + 1;
    bool _532 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _534 = isnan(_480);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _508 * _126;
    bool _546 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _548 = isnan(_480);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = trunc(_544);
    int _560 = int(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _562;
    int _566 = as_type<int>(_524) + (-2);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _568;
    float _572 = float(uint(_560));
    float _574 = as_type<float>(_566) * _572;
    float _576 = trunc(_574);
    float _578 = precise::max(_576, 0.0);
    uint _581 = uint(_578);
    int _583 = _514 * int(_581);
    int _585 = _583 + _560;
    float _587 = float(uint(_585));
    float _589 = as_type<float>(_566) * _587;
    float _591 = in.m_53.x;
    float _593 = in.m_53.y;
    float _595 = trunc(_589);
    float _597 = precise::max(_595, 0.0);
    uint _599 = uint(_597);
    int _601 = int(_581) + int(_599);
    float _603 = float(_560);
    bool _605 = !_494;
    float _607 = _605 ? 7.345489978790283203125 : 1.0;
    int _609 = _522 * _601;
    int _611 = _609 + _560;
    bool _613 = _603 >= _526;
    bool _615 = isnan(_603);
    bool _617 = _613 || _615;
    bool _619 = isnan(_526);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = float(_92);
    float _627 = _607 * _591;
    bool _629 = uint(_611) >= uint(_498);
    float _631 = trunc(_623);
    int _633 = int(_631);
    bool _635 = !_629;
    int _637 = _635 ? 0 : (-1);
    bool _639 = _498 == 0;
    int _641 = ~_601;
    int _643 = _641 + _637;
    int _645 = _643 + 1;
    float _647 = floor(_627);
    int _649 = _498 * _645;
    int _651 = _649 + _560;
    float _653 = 1.0 / _625;
    int _655 = ~_633;
    int _657 = _655 + 1;
    int _659 = _657 + 1;
    bool _661 = !_639;
    int _663 = _661 ? _651 : (-1);
    float _665 = -_647;
    float _667 = _627 + _665;
    int _669 = _663 * _659;
    float _671 = _667 * _526;
    float _673 = _526 * _126;
    int _675 = _498 + (-1);
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _679 = _677 != 0;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _683 = _681 != 0;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _687 = _685 != 0;
    float _689 = _673 * _653;
    float _691 = trunc(_671);
    int _693 = int(_691);
    int _695 = _633 * _675;
    int _697 = _695 + _669;
    bool _699 = !_502;
    int _701 = _699 ? 0 : 1;
    bool _703 = !_683;
    int _705 = _703 ? 0 : 1;
    bool _707 = !_679;
    int _709 = _707 ? 0 : 1;
    float _711 = trunc(_689);
    int _713 = int(_711);
    int _715 = abs(_705);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _719 = _717 != 0;
    bool _721 = !_687;
    int _723 = _721 ? 0 : 1;
    int _725 = _697 * _715;
    int _727 = abs(_709);
    float _729 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _731 = abs(_701);
    bool _733 = !_719;
    int _735 = _733 ? 0 : 1;
    float _737 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _729);
    int _739 = abs(_723);
    int _741 = _693 * _731;
    int _743 = _741 + _560;
    int _745 = abs(_735);
    int _747 = _713 * _727;
    int _749 = _747 + _725;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _753 = _751 != 0;
    int _755 = _743 * _739;
    int _757 = _755 + _749;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _761 = _759 != 0;
    float _763 = in.m_57.y;
    int _765 = _693 * _745;
    int _767 = _765 + _757;
    int _769 = ~_498;
    int _771 = _769 + 1;
    bool _773 = _593 > 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _775 = float(uint(_767));
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _779 = _777 != 0;
    float _781 = 1.0;
    if (_753)
    {
        float _783 = in.m_53.x;
        _781 = _783;
    }
    float _785 = _781;
    bool _787 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _789 = isnan(1.0);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _795 = _791 || _793;
    float _797 = as_type<float>(_566) * _775;
    float _799 = trunc(_797);
    float _801 = precise::max(_799, 0.0);
    uint _803 = uint(_801);
    float _805 = -_763;
    float _807 = _805 + 1.0;
    float _809 = _763;
    if (_761)
    {
        float _811 = _773 ? _807 : _763;
        _809 = _811;
    }
    float _813 = _809;
    int _815 = _771 * int(_803);
    int _817 = _815 + _767;
    float _819 = float(uint(_817));
    float _821 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _823 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _825 = as_type<float>(_566) * _819;
    float _827 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _823);
    int _829 = ~_498;
    int _831 = _829 + 1;
    float _833 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _821);
    float _835 = trunc(_825);
    float _837 = precise::max(_835, 0.0);
    uint _839 = uint(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _843 = 1.0 + _841;
    float _845 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _847 = log2(_845);
    int _849 = int(_803) + int(_839);
    float _851 = 1.0 / _843;
    float _853 = float(uint(_743));
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _855;
    float _859 = as_type<float>(_566) * _853;
    float _861 = _591 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _863 = _831 * _849;
    int _865 = _863 + _767;
    float _867 = 1.0 / _857;
    float _869 = -_506;
    float _871 = fma(_861, 2.0, _869);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _877 = uint(_865) >= uint(_498);
    float _879 = _591 * 2.0;
    float _881 = -_126;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[76].x, _871);
    float _885 = trunc(_859);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    bool _891 = !_877;
    int _893 = _891 ? 0 : (-1);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _897;
    bool _901 = _785 > 0.5;
    bool _903 = _901 && _753;
    float _905 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _833);
    int _907 = ~_849;
    int _909 = _907 + _893;
    int _911 = _909 + 1;
    float _913 = _593 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _915 = 1.0 / _899;
    float _917 = _833;
    if (_753)
    {
        _917 = _486;
    }
    float _919 = _917;
    float _921 = _905 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _923 = _498 * _911;
    int _925 = _923 + _767;
    float _927 = fma(_913, -2.0, _895);
    float _929 = in.m_53.z;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _933 = _480 + _931;
    float _935 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _737);
    int _937 = _530 * int(_889);
    int _939 = _937 + _743;
    bool _941 = !_639;
    int _943 = _941 ? _925 : (-1);
    float _945 = _847 * _126;
    float _947 = floor(_879);
    float _949 = _919;
    if (_903)
    {
        float _951 = -_919;
        float _953 = _951 + 1.0;
        _949 = _953;
    }
    float _955 = _949;
    float _957 = float(uint(_939));
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _961 = _480 + _959;
    int _963 = _943 & 3;
    bool _965 = _963 != 0;
    float _967 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _927);
    float _969 = _935 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _971 = as_type<float>(_566) * _957;
    int _973 = _943 & 3;
    bool _975 = _973 != 0;
    float _977 = exp2(_945);
    int _979 = _965 ? 0 : 1;
    float _981 = _961 * _915;
    bool _983 = uint(_973) > 1u;
    float _985 = _915;
    float _987 = _969;
    if (!_753)
    {
        _985 = _486;
    }
    float _989 = _985;
    float _991 = _989;
    if (_753)
    {
        _991 = _955;
    }
    float _993 = _991;
    float _995 = 1.0 / _875;
    int _997 = ~_979;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    bool _1003 = _947 > 0.0;
    bool _1005 = _947 >= 0.0;
    bool _1007 = isnan(_947);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.0);
    bool _1013 = _1009 || _1011;
    int _1015 = ~_498;
    int _1017 = _1015 + 1;
    float _1019 = -_977;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _827);
    float _1025 = _933 * _867;
    float _1027 = trunc(_971);
    float _1029 = precise::max(_1027, 0.0);
    uint _1031 = uint(_1029);
    float _1033 = _593 + _929;
    float _1035 = fma(_518, _1025, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _1037 = _1001;
    if (!_983)
    {
        int _1039 = ~_979;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = _1033 + (-1.0);
    bool _1047 = uint(_973) >= 2u;
    float _1049 = _490 * _995;
    float _1051 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1053 = _593 * 2.0;
    int _1055 = _1047 ? 0 : 1;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1059 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1061 = isnan(0.0);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1067 = _1063 || _1065;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1071 = int(_889) + int(_1031);
    float _1073 = _929 * 2.0;
    float _1075 = _1067 ? _1021 : 0.0;
    float _1077 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1069);
    bool _1079 = _973 != 3;
    float _1081 = floor(_1053);
    float _1083 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1057);
    float _1085 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1077);
    int _1087 = _1017 * _1071;
    int _1089 = _1087 + _743;
    float _1091 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1083);
    float _1093 = floor(_1073);
    int _1095 = ~_1055;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    int _1101 = _1099;
    if (_795)
    {
        float _1103 = _1075 * _851;
        _130 = _1103;
    }
    float _1105 = _130;
    bool _1107 = uint(_1089) >= uint(_498);
    if (_1079)
    {
        int _1109 = ~_1055;
        int _1111 = _1109 + 1;
        _1101 = _1111;
    }
    int _1113 = _1101;
    int _1115 = _943 >> 31;
    int _1117 = _1013 ? 0 : 1;
    bool _1119 = !_1107;
    int _1121 = _1119 ? 0 : (-1);
    int _1123 = _1115 & 3;
    bool _1125 = !_779;
    int _1127 = _1125 ? 0 : 1;
    bool _1129 = _973 != 3;
    bool _1131 = _1081 > 0.0;
    bool _1133 = _1081 >= 0.0;
    bool _1135 = isnan(_1081);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(0.0);
    bool _1141 = _1137 || _1139;
    int _1143 = ~_1117;
    int _1145 = _1143 + 1;
    int _1147 = _1145 + 1;
    int _1149 = _1147;
    if (!_1003)
    {
        int _1151 = ~_1117;
        int _1153 = _1151 + 1;
        _1149 = _1153;
    }
    int _1155 = _1149;
    int _1157 = _943 + _1123;
    bool _1159 = !_975;
    int _1161 = _1159 ? 0 : 1;
    bool _1163 = !_1129;
    int _1165 = _1163 ? 0 : (-1);
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1169 = _1167 != 0;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1177 = _1175 != 0;
    int _1179 = _1141 ? 0 : 1;
    bool _1181 = _1093 > 0.0;
    float _1183 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1185 = _1093 >= 0.0;
    bool _1187 = isnan(_1093);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan(0.0);
    bool _1193 = _1189 || _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1195;
    float _1199 = -_967;
    float _1201 = fma(_1085, _1183, _1199);
    int _1203 = _1157 >> 2;
    float _1205 = fma(_1197, _1025, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1207 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1209 = isnan(_480);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1219;
    int _1223 = _1203 << 4;
    int _1225 = _1223 + 368;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1231 = abs(_1161);
    float _1233 = -_1217;
    float _1235 = _1233 + 1.0;
    float _1237 = fma(_1221, _1025, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    uint _1239 = uint(int(uint(_1225) >> uint(2)));
    uint _1241 = uint(int(uint(int(_1239)) >> uint(2)));
    int _1243 = int(_1239) & 3;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[int(_1241)][_1243];
    int _1247 = int(_1239) + 1;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    int _1251 = _1247 & 3;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[int(_1249)][_1251];
    bool _1255 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1257 = isnan(_480);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1269 = _1267 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1271 = _542 * _1235;
    float _1273 = -_542;
    float _1275 = _1273 + 1.0;
    float _1277 = fma(_1269, _1049, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1279 = -_1265;
    float _1281 = _1279 + 1.0;
    float _1283 = _1265 * _1275;
    int _1285 = abs(_1113);
    int _1287 = _1225 + 8;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[int(_1299)][_1301];
    float _1305 = _556 * _1281;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1307;
    float _1311 = -_556;
    float _1313 = _1311 + 1.0;
    int _1315 = ~_1285;
    int _1317 = _1315 + 1;
    int _1319 = _1317 + 1;
    float _1321 = _1237 * _1305;
    float _1323 = fma(_1309, _981, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1325 = _1035 * _1305;
    int _1327 = ~_1071;
    int _1329 = _1327 + _1121;
    int _1331 = _1329 + 1;
    float _1333 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1321);
    int _1335 = abs(_1043);
    float _1337 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1339 = abs(_1127);
    int _1341 = _498 * _1331;
    int _1343 = _1341 + _743;
    int _1345 = ~_1335;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    float _1351 = fma(_1091, _1337, _883);
    int _1353 = ~_1231;
    int _1355 = _1353 + 1;
    int _1357 = _1355 + 1;
    float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1361 = _921 + _1359;
    int _1363 = ~_1339;
    int _1365 = _1363 + 1;
    int _1367 = _1365 + 1;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1373 = _1205 * _1305;
    float _1375 = fma(_1229, _1049, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1377 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1325);
    float _1379 = fma(_1371, _1049, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1381 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1373);
    float _1383 = fma(_564, _981, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1385 = fma(_570, _981, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1387 = fma(_1277, _1283, _1333);
    float _1389 = fma(_1375, _1283, _1377);
    float _1391 = fma(_1379, _1283, _1381);
    float _1393 = float(_1155);
    float _1395 = fma(_1323, _1271, _1387);
    float _1397 = fma(_1383, _1271, _1389);
    float _1399 = fma(_1385, _1271, _1391);
    float _1401 = _1201 + 0.5;
    float _1403 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1395);
    float _1405 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1397);
    float _1407 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1399);
    int _1409 = _1349 * as_type<int>(_1253);
    float _1411 = _1023 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1413 = abs(_1165);
    float _1415 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1417 = _1357 * as_type<int>(_1245);
    int _1419 = _1417 + _1409;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1423 = _969 + _1421;
    int _1425 = ~_1413;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1433 = _1411 + _1431;
    float _1435 = _1351 + 0.5;
    float _1437 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1439 = _1319 * as_type<int>(_1295);
    int _1441 = _1439 + _1419;
    float _1443 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1437);
    int _1445 = _1429 * as_type<int>(_1303);
    int _1447 = _1445 + _1441;
    bool _1449 = !_639;
    int _1451 = _1449 ? _1343 : (-1);
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1455 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1443);
    int _1457 = _1447 * _1367;
    float _1459 = _1423 * _1423;
    float _1461 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1435;
    out.m_61.y = _1401;
    int _1463 = _1451 * _1339;
    int _1465 = _1463 + _1457;
    bool _1467 = !_1173;
    int _1469 = _1467 ? 0 : 1;
    float _1471 = _1407 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1473 = _1455 >= 0.0;
    float _1475 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1477 = abs(_1469);
    float _1479 = fma(_1361, _1361, _1459);
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1483 = in.m_63.x;
    float _1485 = in.m_63.y;
    float _1487 = in.m_63.z;
    float _1489 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = fma(_1433, _1433, _1479);
    float _1493 = float(_1465);
    float _1495 = _593 + (-0.5);
    float _1497 = float(_1477);
    out.m_65.x = _1461;
    out.m_65.y = _1489;
    out.m_65.z = _1481;
    out.m_65.w = _1453;
    int _1499 = ~_1179;
    int _1501 = _1499 + 1;
    int _1503 = _1501 + 1;
    float _1505 = rsqrt(_1491);
    float _1507 = as_type<float>(_1155);
    int _1509 = _1503;
    if (_1473)
    {
        _1507 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1511 = _1507;
    out.m_67.x = _1493;
    float _1513 = _1497 * _1393;
    int _1515 = as_type<int>(_1511);
    if (!_1131)
    {
        int _1517 = ~_1179;
        int _1519 = _1517 + 1;
        _1509 = _1519;
    }
    int _1521 = _1509;
    if (_1473)
    {
        float _1523 = _1511 * 5.0;
        _1515 = as_type<int>(_1523);
    }
    int _1525 = _1515;
    if (_1473)
    {
        out.m_47.x = 0.0;
    }
    bool _1527 = !_1177;
    int _1529 = _1527 ? 0 : 1;
    bool _1531 = !_1169;
    int _1533 = _1531 ? 0 : 1;
    if (_1473)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4729 = as_type<float>(_1525);
        out.gl_Position.z = _4729;
    }
    float _1535 = _1423 * _1505;
    float _1537 = _1361 * _1505;
    if (_1473)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1539 = -_1535;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1543 = _1513 * (-2.0);
    float _1545 = -_1537;
    float _1547 = fma(_1545, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    int _1549 = _1193 ? 0 : 1;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1553 = _1541 + _1551;
    float _1555 = fma(_1543, _1485, _1485);
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1559 = _1547 + _1557;
    int _1561 = ~_1549;
    int _1563 = _1561 + 1;
    int _1565 = _1563 + 1;
    float _1567 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1569 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1555);
    int _1571 = _1565;
    if (!_1181)
    {
        int _1573 = ~_1549;
        int _1575 = _1573 + 1;
        _1571 = _1575;
    }
    int _1577 = _1571;
    float _1579 = _1433 * _1505;
    float _1581 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1567);
    int _1583 = abs(_1529);
    float _1585 = _929 + _591;
    float _1587 = float(_1521);
    float _1589 = -_1579;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1593 = float(_1583);
    float _1595 = fma(_1051, _1543, _1051);
    int _1597 = abs(_1533);
    float _1599 = _1585 + (-1.0);
    float _1601 = _1593 * _1587;
    float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1605 = _1591 + _1603;
    float _1607 = float(_1597);
    float _1609 = _929 + (-0.5);
    float _1611 = float(_1577);
    float _1613 = _1601 * (-2.0);
    float _1615 = fma(_1599, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1617 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1581);
    float _1619 = _593 + _591;
    float _1621 = fma(_1613, _1487, _1487);
    float _1623 = _1607 * _1611;
    float _1625 = fma(_1615, _1613, _1615);
    float _1627 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1621);
    bool _1629 = _1617 >= 0.0;
    float _1631 = _1619 + (-1.0);
    float _1633 = _1623 * (-2.0);
    float _1635 = fma(_1625, _1105, _1627);
    float _1637 = _591 + (-0.5);
    float _1639 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1641 = fma(_1633, _1483, _1483);
    float _1643 = fma(_1595, _1105, _1569);
    float _1645 = _1635 * 0.15915493667125701904296875;
    float _1647 = fma(_1639, _1633, _1639);
    float _1649 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1641);
    float _1651 = _1643 * 0.15915493667125701904296875;
    float _1653 = _1645 * 6.283185482025146484375;
    float _1655 = sin(_1653);
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (_1629)
    {
        _1657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1659 = _1657;
    float _1661 = fma(_1647, _1105, _1649);
    int _1663 = as_type<int>(_1659);
    if (_1629)
    {
        out.m_47.x = 0.0;
    }
    float _1665 = -_1535;
    float _1667 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1423);
    if (_1629)
    {
        float _1669 = _1659 * 5.0;
        _1663 = as_type<int>(_1669);
    }
    int _1671 = _1663;
    float _1673 = _1651 * 6.283185482025146484375;
    float _1675 = sin(_1673);
    if (_1629)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4969 = as_type<float>(_1671);
        out.gl_Position.z = _4969;
    }
    float _1677 = _1651 * 6.283185482025146484375;
    float _1679 = cos(_1677);
    float _1681 = _1645 * 6.283185482025146484375;
    float _1683 = cos(_1681);
    if (_1629)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1685 = -_969;
    float _1687 = _1685 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1689 = -_921;
    float _1691 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1693 = -_1537;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1361);
    float _1697 = _1667 * _1667;
    float _1699 = _1687 * _1687;
    float _1701 = -_1411;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1705 = -_1579;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1433);
    float _1709 = fma(_1695, _1695, _1697);
    float _1711 = fma(_1691, _1691, _1699);
    float _1713 = _1661 * 0.15915493667125701904296875;
    float _1715 = _1679 * _1683;
    float _1717 = fma(_1707, _1707, _1709);
    float _1719 = fma(_1703, _1703, _1711);
    float _1721 = _1713 * 6.283185482025146484375;
    float _1723 = sin(_1721);
    float _1725 = _1675 * _1655;
    float _1727 = in.m_51.x;
    float _1729 = in.m_51.y;
    float _1731 = in.m_51.z;
    float _1733 = in.m_69.x;
    float _1735 = in.m_69.y;
    float _1737 = in.m_69.z;
    float _1739 = rsqrt(_1719);
    float _1741 = sqrt(_1717);
    float _1743 = fma(_1723, _1725, _1715);
    float _1745 = fma(_1723, _1715, _1725);
    float _1747 = _1679 * _1655;
    float _1749 = _1691 * _1739;
    float _1751 = _1687 * _1739;
    float _1753 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1755 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1757 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1759 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1761 = _1751 * _1759;
    float _1763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1735);
    float _1765 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1733);
    float _1767 = _1505 * _1741;
    float _1769 = _1703 * _1739;
    float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1773 = _1749 * _1771;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1777 = -_1761;
    float _1779 = fma(_1749, _1775, _1777);
    float _1781 = _1675 * _1683;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1785 = _1769 * _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1789 = -_1773;
    float _1791 = fma(_1769, _1787, _1789);
    float _1793 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1795 = -_1781;
    float _1797 = fma(_1723, _1747, _1795);
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1801 = -_1785;
    float _1803 = fma(_1751, _1799, _1801);
    float _1805 = _1791 * _1791;
    float _1807 = _1713 * 6.283185482025146484375;
    float _1809 = cos(_1807);
    float _1811 = -_1747;
    float _1813 = fma(_1723, _1781, _1811);
    float _1815 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1817 = fma(_1803, _1803, _1805);
    float _1819 = _1755 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1821 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1737);
    float _1823 = _1767 * _1815;
    float _1825 = fma(_1779, _1779, _1817);
    float _1827 = _1767 * _1819;
    float _1829 = _1767 * _1793;
    float _1831 = _1763 * _1823;
    float _1833 = rsqrt(_1825);
    float _1835 = _1765 * _1827;
    float _1837 = _1821 * _1829;
    float _1839 = _1813 * _1831;
    float _1841 = _1745 * _1831;
    float _1843 = _1683 * _1809;
    float _1845 = _1655 * _1809;
    float _1847 = fma(_1743, _1835, _1839);
    float _1849 = _1809 * _1837;
    float _1851 = _1843 * _1831;
    float _1853 = fma(_1797, _1835, _1841);
    float _1855 = fma(_1675, _1849, _1847);
    float _1857 = fma(_1845, _1835, _1851);
    float _1859 = fma(_1679, _1849, _1853);
    float _1861 = _1791 * _1833;
    float _1863 = _1803 * _1833;
    float _1865 = _1779 * _1833;
    float _1867 = -_1723;
    float _1869 = fma(_1867, _1837, _1857);
    float _1871 = _1769 * _1861;
    float _1873 = _1751 * _1863;
    float _1875 = -_1871;
    float _1877 = fma(_1751, _1865, _1875);
    float _1879 = -_1873;
    float _1881 = fma(_1749, _1861, _1879);
    float _1883 = _1877 * _1869;
    float _1885 = _1881 * _1869;
    float _1887 = fma(_1863, _1855, _1883);
    float _1889 = fma(_1865, _1855, _1885);
    float _1891 = fma(_1749, _1859, _1887);
    float _1893 = fma(_1769, _1859, _1889);
    float _1895 = _1749 * _1865;
    float _1897 = _921 + _1891;
    float _1899 = _1411 + _1893;
    float _1901 = -_1895;
    float _1903 = fma(_1769, _1863, _1901);
    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1907 = _1897 + _1905;
    float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1911 = _1899 + _1909;
    float _1913 = _1903 * _1869;
    float _1915 = _1907 * _1907;
    float _1917 = _1911 * _1911;
    float _1919 = fma(_1861, _1855, _1913);
    float _1921 = _1915 + _1917;
    float _1923 = fma(_1751, _1859, _1919);
    float _1925 = sqrt(_1921);
    float _1927 = _969 + _1923;
    bool _1929 = _1925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1931 = _1769;
    float _1933 = _1889;
    float _1935 = _1915;
    float _1937 = _1917;
    float _1939 = _1899;
    if (!_1929)
    {
        _1931 = _1897;
    }
    float _1941 = _1931;
    float _1943 = _1941;
    if (!_1929)
    {
        _1933 = _1927;
    }
    float _1945 = _1933;
    bool _1947 = !_1929;
    float _1949 = _1945;
    if (!_1947)
    {
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1955 = _1925 + _1953;
        float _1957 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = rsqrt(_1921);
        float _1961 = _1955 * _1951;
        float _1963 = _1961 * 0.15915493667125701904296875;
        float _1965 = _1963 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1963 * 6.283185482025146484375;
        float _1971 = cos(_1969);
        float _1973 = fma(_1967, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1975 = _1959 * _1973;
        float _1977 = _1971 + (-1.0);
        float _1979 = fma(_1907, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1981 = fma(_1911, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1983 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1987 = _1979 + _1985;
        float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1991 = _1981 + _1989;
        float _1993 = fma(_1927, _1971, _1983);
        float _1995 = _1987 * _1987;
        float _1997 = _1991 * _1991;
        _1949 = _1993;
        _1935 = _1995;
        _1937 = _1997;
        _1943 = _1979;
        _1939 = _1981;
    }
    float _1999 = _1949;
    float _2001 = _1935;
    float _2003 = _1937;
    float _2005 = _1943;
    float _2007 = _1939;
    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2011 = _1999 + _2009;
    float _2013 = fma(_2011, _2011, _2001);
    float _2015 = _2013 + _2003;
    float _2017 = sqrt(_2015);
    bool _2019 = _2017 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2021 = isnan(_2017);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2027 = _2023 || _2025;
    float _2029 = _2001;
    float _2031 = _2017;
    if (!_2027)
    {
        _2029 = 1.0;
    }
    float _2033 = _2029;
    bool _2035 = !_2027;
    float _2037 = _2033;
    if (!_2035)
    {
        bool _2039 = _2017 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2041 = isnan(_2017);
        bool _2043 = _2039 || _2041;
        bool _2045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2047 = _2043 || _2045;
        if (!_2047)
        {
            float _2049 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2051 = _2017 + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2055 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2053;
            float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2059 = _2057 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2061 = 1.0 / _2055;
            float _2063 = _2051 * _2061;
            float _2065 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2037 = _2065;
            _2067 = true;
        }
        else
        {
            bool _2069 = _2017 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2071 = isnan(_2017);
            bool _2073 = _2069 || _2071;
            bool _2075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2077 = _2073 || _2075;
            if (!_2077)
            {
                float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2081 = _2017 + _2079;
                float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2085 = _2083 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2089 = _2087 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2091 = 1.0 / _2085;
                float _2093 = _2081 * _2091;
                float _2095 = fma(_2093, _2089, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2037 = _2095;
                _2067 = true;
            }
            else
            {
                _2037 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2067 = false;
    float _2097 = _2037;
    float _2099 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2101 = _1999 + _2099;
    float _2103 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2105 = _2005 + _2103;
    float _2107 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2109 = _2007 + _2107;
    float _2111 = fma(_2101, _2097, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2113 = fma(_2105, _2097, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2115 = fma(_2109, _2097, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2117 = -_1535;
    float _2119 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2111);
    float _2121 = -_1537;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2113);
    float _2125 = -_1579;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2115);
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2131 = _2119 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2135 = _2123 + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2139 = _2127 + _2137;
    float _2141 = _2131 * _2131;
    float _2143 = fma(_2135, _2135, _2141);
    float _2145 = fma(_2139, _2139, _2143);
    float _2147 = rsqrt(_2145);
    float _2149 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2151 = _2135 * _2149;
    float _2153 = _2139 * _2149;
    float _2155 = _2151 * _2151;
    float _2157 = _2153 * _2153;
    float _2159 = _2155 + _2157;
    float _2161 = sqrt(_2159);
    bool _2163 = _2161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2167 = _2161 + _2165;
    float _2169 = _2147;
    float _2171 = _2159;
    float _2173 = _2167;
    float _2175 = _2131;
    float _2177 = _2149;
    float _2179 = _2151;
    if (_2163)
    {
        float _2181 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2169 = _2181;
    }
    float _2183 = _2169;
    if (_2163)
    {
        float _2185 = rsqrt(_2159);
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (_2163)
    {
        float _2189 = _2167 * _2183;
        _2173 = _2189;
    }
    float _2191 = _2173;
    if (_2163)
    {
        float _2193 = _2191 * 0.15915493667125701904296875;
        _2031 = _2193;
    }
    float _2195 = _2031;
    float _2197 = _2183;
    if (_2163)
    {
        float _2199 = _2195 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        _2197 = _2201;
    }
    float _2203 = _2197;
    float _2205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2207 = precise::max(0.0, _2205);
    float _2209 = _2139;
    float _2211 = _2207;
    if (_2163)
    {
        float _2213 = _2195 * 6.283185482025146484375;
        float _2215 = cos(_2213);
        _2209 = _2215;
    }
    float _2217 = _2209;
    float _2219 = -_2149;
    float _2221 = -_2207;
    float _2223 = fma(_2131, _2219, _2221);
    if (!_2163)
    {
        _2175 = _2153;
    }
    float _2225 = _2175;
    float _2227 = _2225;
    if (_2163)
    {
        float _2229 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2211 = _2229;
    }
    float _2231 = _2211;
    float _2233 = _2203;
    float _2235 = _2231;
    if (_2163)
    {
        float _2237 = fma(_2203, _2231, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2233 = _2237;
    }
    float _2239 = _2233;
    float _2241 = _2239;
    float _2243 = _2217;
    if (_2163)
    {
        float _2245 = _2217 + (-1.0);
        _2235 = _2245;
    }
    float _2247 = _2235;
    float _2249 = _2247;
    if (_2163)
    {
        float _2251 = _2187 * _2239;
        _987 = _2251;
    }
    float _2253 = _987;
    if (!_2163)
    {
        _2241 = _2223;
    }
    float _2255 = _2241;
    float _2257 = sqrt(_2145);
    float _2259 = _2255;
    if (_2163)
    {
        float _2261 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2177 = _2261;
    }
    float _2263 = _2177;
    if (_2163)
    {
        float _2265 = _2151 * _2253;
        _2179 = _2265;
    }
    float _2267 = _2179;
    if (!_2163)
    {
        _2249 = _2155;
    }
    float _2269 = _2249;
    float _2271 = _2269;
    if (_2163)
    {
        float _2273 = _2153 * _2253;
        _2227 = _2273;
    }
    float _2275 = _2227;
    if (_2163)
    {
        float _2277 = fma(_2223, _2217, _2263);
        _2259 = _2277;
    }
    float _2279 = _2259;
    if (_2163)
    {
        float _2281 = _2267 * _2267;
        _2271 = _2281;
    }
    float _2283 = _2271;
    if (!_2163)
    {
        _2243 = _2157;
    }
    float _2285 = _2243;
    float _2287 = _2285;
    if (_2163)
    {
        float _2289 = _2275 * _2275;
        _2287 = _2289;
    }
    float _2291 = _2287;
    float _2293 = fma(_2279, _2279, _2283);
    float _2295 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2297 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2299 = _2293 + _2291;
    float _2301 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2295);
    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2305 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2303);
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2311 = rsqrt(_2299);
    float _2313 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2301);
    float _2315 = -_2307;
    float _2317 = _2315 + 1.0;
    float _2319 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2321 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2309);
    float _2323 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2325 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2297);
    float _2327 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2319);
    float _2329 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2321);
    float _2331 = abs(_2317);
    float _2333 = log2(_2331);
    float _2335 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2337 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2327);
    float _2339 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2341 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2343 = fma(_2127, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2325);
    float _2345 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2347 = _2311 * _2267;
    float _2349 = -_2339;
    float _2351 = fma(_2349, _2335, 1.0);
    float _2353 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2355 = _2311 * _2279;
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2359 = _2311 * _2275;
    float _2361 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2353);
    float _2363 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2365 = -_2357;
    float _2367 = fma(_2355, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2365);
    float _2369 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2371 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2361);
    float _2373 = log2(_2351);
    float _2375 = -_2359;
    float _2377 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2367);
    float _2379 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2381 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2371);
    float _2383 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2385 = fma(_2377, -0.5, 0.5);
    float _2387 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2379);
    float _2389 = fma(_2377, 0.5, 0.5);
    float _2391 = exp2(_2369);
    float _2393 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2383);
    float _2395 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2387);
    float _2397 = _2355 + 1.0;
    float _2399 = fma(_2389, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2401 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2393);
    float _2403 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2395);
    float _2405 = 1.0 / _2381;
    float _2407 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2401);
    float _2409 = fma(_2389, _2399, -0.212114393711090087890625);
    float _2411 = _2373 * 0.693147182464599609375;
    float _2413 = fma(_2389, _2409, 1.570728778839111328125);
    float _2415 = sqrt(_2385);
    float _2417 = -_2355;
    float _2419 = fma(_2391, _2397, _2417);
    float _2421 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2423 = fma(_2419, 0.5, 0.5);
    float _2425 = _2403 * _2405;
    float _2427 = _2407 * _2405;
    float _2429 = fma(_2425, 0.5, 0.5);
    float _2431 = fma(_2427, -0.5, 0.5);
    float _2433 = _2415 * 0.636619746685028076171875;
    float3 _6193 = float3(_2429, _2431, _2421);
    float _2435 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6193, float3(0.0), isnan(_6193)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6193, float3(0.0), isnan(_6193)), level(0.0)).x;
    float _2437 = -_2413;
    float _2439 = fma(_2433, _2437, 1.0);
    float3 _6209 = float3(_2429, _2431, _2421);
    float4 _2442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6209, float3(0.0), isnan(_6209)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6209, float3(0.0), isnan(_6209)), level(0.0)).xyzw;
    float _2444 = _2442.x;
    float _2446 = _2442.y;
    float _2448 = _2442.z;
    float _2450 = _2442.w;
    float2 _6226 = float2(_2439, _2423);
    float3 _2454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6226, float2(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6226, float2(0.0), isnan(_6226)), level(0.0)).xyz;
    float _2456 = _2454.x;
    float _2458 = _2454.y;
    float _2460 = _2454.z;
    float _2462 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2464 = _2341 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2466 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2464);
    float _2468 = exp2(_2462);
    float _2470 = fma(_2323, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2466);
    float _2472 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2470);
    float _2474 = _2472 + _2381;
    out.gl_Position.x = _2403;
    out.gl_Position.y = _2407;
    out.gl_Position.z = _2472;
    out.gl_Position.w = _2381;
    float _2476 = _2474 * 0.5;
    float _2478 = -_2468;
    float _2480 = _2478 + 1.0;
    float _2482 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2476;
    out.m_71.w = _2381;
    out.m_47.x = _2482;
    float _2486 = _2484 * _2435;
    float _2488 = -_2484;
    float _2490 = _2488 + 1.0;
    float _2492 = _2450 * _2486;
    float _2494 = _2450 * _2490;
    float _2496 = _2460 * _2486;
    float _2498 = fma(_2456, _2492, _2444);
    float _2500 = fma(_2458, _2492, _2446);
    float _2502 = fma(_2450, _2496, _2448);
    out.m_73.x = _2498;
    out.m_73.y = _2500;
    out.m_73.z = _2502;
    out.m_73.w = _2494;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

