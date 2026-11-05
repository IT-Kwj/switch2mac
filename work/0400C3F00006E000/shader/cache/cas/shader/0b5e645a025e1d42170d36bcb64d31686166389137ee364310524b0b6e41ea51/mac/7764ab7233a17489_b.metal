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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_76 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 m_80 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_66 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3679 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3978 = as_type<float>(_119);
        out.gl_Position.z = _3978;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    float _141 = _137;
    if (_133)
    {
        float _143 = float(_103);
        _139 = _143;
    }
    float _145 = _139;
    bool _147 = _137 >= _145;
    bool _149 = !_133;
    bool _151 = _147 || _149;
    if (_151)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _113;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4047 = as_type<float>(_157);
        out.gl_Position.z = _4047;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _163 = as_type<int>(_159) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_159) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _197;
    if (!_179)
    {
        float _181 = in.m_56.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_103);
        float _203 = 1.0 / _201;
        float _205 = _137 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _211 = int(_209);
    float _213 = float(_103);
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _217 = _215 != 0;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _221 = int(_219);
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _225 = float(_211);
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _229 = int(_227);
    float _231 = 0.0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_217)
    {
        float _235 = in.m_56.x;
        _231 = _235;
    }
    float _237 = _231;
    float _239 = _237;
    if (!_217)
    {
        float _241 = in.m_56.y;
        _239 = _241;
    }
    float _243 = _239;
    float _245 = float(_221);
    float _247 = 1.0 / _225;
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _251 = int(_249);
    float _253 = float(uint(_229));
    int _255 = ~_229;
    int _257 = _255 + 1;
    bool _259 = _229 == 0;
    float _261 = 1.0 / _245;
    float _263 = _247 * _137;
    float _265 = 1.0 / _253;
    float _267 = float(uint(_251));
    int _269 = ~_251;
    int _271 = _269 + 1;
    float _273 = trunc(_263);
    int _275 = int(_273);
    float _277 = _261 * _137;
    float _279 = 1.0 / _267;
    int _281 = as_type<int>(_265) + (-2);
    float _283 = trunc(_277);
    int _285 = int(_283);
    float _287 = float(uint(_275));
    float _289 = as_type<float>(_281) * _287;
    int _291 = as_type<int>(_279) + (-2);
    float _293 = 1.0 / _213;
    float _295 = float(uint(_285));
    float _297 = trunc(_289);
    float _299 = precise::max(_297, 0.0);
    uint _302 = uint(_299);
    float _304 = as_type<float>(_291) * _295;
    float _306 = in.m_56.x;
    float _308 = in.m_56.y;
    float _310 = in.m_56.z;
    float _312 = in.m_56.w;
    float _314 = trunc(_304);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    float _320 = _293 * _137;
    int _322 = _257 * int(_302);
    int _324 = _322 + _275;
    float _326 = _304;
    if (_217)
    {
        _326 = 1.0;
    }
    float _328 = _326;
    float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _332 = _328;
    if (!_217)
    {
        _332 = 7.345489978790283203125;
    }
    float _334 = _332;
    float _336 = float(uint(_324));
    int _338 = _271 * int(_318);
    int _340 = _338 + _285;
    float _342 = as_type<float>(_281) * _336;
    float _344 = float(uint(_340));
    float _346 = trunc(_342);
    float _348 = precise::max(_346, 0.0);
    uint _350 = uint(_348);
    float _352 = as_type<float>(_340);
    if (_217)
    {
        _352 = 1.0;
    }
    float _354 = _352;
    float _356 = _334 * _306;
    float _358 = _354;
    if (!_217)
    {
        _358 = 1.2345600128173828125;
    }
    float _360 = _358;
    float _362 = as_type<float>(_291) * _344;
    float _364 = _308 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _366 = _330 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _368 = _243 * _360;
    int _370 = ~_229;
    int _372 = _370 + 1;
    float _374 = trunc(_362);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    float _380 = float(_229);
    int _382 = int(_302) + int(_350);
    float _384 = floor(_368);
    int _386 = ~_251;
    int _388 = _386 + 1;
    int _390 = _372 * _382;
    int _392 = _390 + _275;
    float _394 = float(_275);
    float _396 = floor(_356);
    int _398 = int(_318) + int(_378);
    bool _400 = uint(_392) >= uint(_229);
    float _402 = float(_251);
    int _404 = _388 * _398;
    int _406 = _404 + _285;
    float _408 = float(_285);
    float _410 = -_384;
    float _412 = _368 + _410;
    bool _414 = !_400;
    int _416 = _414 ? 0 : (-1);
    bool _418 = uint(_406) >= uint(_251);
    float _420 = _412 * _402;
    int _422 = ~_382;
    int _424 = _422 + _416;
    int _426 = _424 + 1;
    float _428 = -_396;
    float _430 = _356 + _428;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _434 = _432 != 0;
    float _436 = _380 * _320;
    bool _438 = _394 >= _380;
    bool _440 = isnan(_394);
    bool _442 = _438 || _440;
    bool _444 = isnan(_380);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = _430 * _380;
    bool _452 = !_434;
    int _454 = _452 ? 0 : 1;
    bool _456 = _408 >= _402;
    bool _458 = isnan(_408);
    bool _460 = _456 || _458;
    bool _462 = isnan(_402);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = trunc(_448);
    int _470 = int(_468);
    int _472 = abs(_454);
    int _474 = _229 * _426;
    int _476 = _474 + _275;
    bool _478 = !_418;
    int _480 = _478 ? 0 : (-1);
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _484 = _482 != 0;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _492 = _490 != 0;
    float _494 = trunc(_466);
    int _496 = int(_494);
    int _498 = ~_398;
    int _500 = _498 + _480;
    int _502 = _500 + 1;
    float _504 = _402 * _320;
    bool _506 = !_488;
    int _508 = _506 ? 0 : 1;
    int _510 = _251 * _502;
    int _512 = _510 + _285;
    bool _514 = _251 == 0;
    float _516 = trunc(_436);
    int _518 = int(_516);
    int _520 = ~_470;
    int _522 = _520 + 1;
    int _524 = _522 + 1;
    bool _526 = !_259;
    int _528 = _526 ? _476 : (-1);
    int _530 = abs(_508);
    bool _532 = !_514;
    int _534 = _532 ? _512 : (-1);
    int _536 = _528 * _524;
    int _538 = ~_496;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = trunc(_450);
    int _546 = int(_544);
    int _548 = _229 + (-1);
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _552 = _550 != 0;
    int _554 = _534 * _542;
    bool _556 = !_484;
    int _558 = _556 ? 0 : 1;
    int _560 = _470 * _548;
    int _562 = _560 + _536;
    bool _564 = !_552;
    int _566 = _564 ? 0 : 1;
    float _568 = trunc(_420);
    int _570 = int(_568);
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _574 = _572 != 0;
    int _576 = _562 * _530;
    int _578 = abs(_566);
    int _580 = _251 + (-1);
    bool _582 = !_574;
    int _584 = _582 ? 0 : 1;
    int _586 = _546 * _472;
    int _588 = _586 + _275;
    int _590 = abs(_558);
    int _592 = _496 * _580;
    int _594 = _592 + _554;
    bool _596 = !_492;
    int _598 = _596 ? 0 : 1;
    float _600 = trunc(_504);
    int _602 = int(_600);
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _618 = _616 != 0;
    int _620 = _518 * _590;
    int _622 = _620 + _576;
    int _624 = abs(_598);
    int _626 = _570 * _578;
    int _628 = _626 + _285;
    int _630 = abs(_584);
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    bool _636 = !_606;
    int _638 = _636 ? 0 : 1;
    int _640 = _588 * _624;
    int _642 = _640 + _622;
    int _644 = abs(_634);
    bool _646 = !_614;
    int _648 = _646 ? 0 : 1;
    int _650 = _546 * _630;
    int _652 = _650 + _642;
    int _654 = abs(_638);
    bool _656 = !_618;
    int _658 = _656 ? 0 : 1;
    int _660 = abs(_648);
    int _662 = _594 * _644;
    int _664 = abs(_658);
    float _666 = float(uint(_652));
    int _668 = _602 * _654;
    int _670 = _668 + _662;
    float _672 = as_type<float>(_281) * _666;
    int _674 = ~_251;
    int _676 = _674 + 1;
    int _678 = _628 * _660;
    int _680 = _678 + _670;
    float _682 = float(uint(_588));
    bool _684 = _229 == 0;
    float _686 = trunc(_672);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = _570 * _664;
    int _694 = _692 + _680;
    float _696 = as_type<float>(_281) * _682;
    int _698 = ~_229;
    int _700 = _698 + 1;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _704 = _702 != 0;
    float _706 = float(uint(_694));
    float _708 = trunc(_696);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    float _714 = as_type<float>(_291) * _706;
    int _716 = ~_229;
    int _718 = _716 + 1;
    int _720 = _700 * int(_690);
    int _722 = _720 + _652;
    float _724 = trunc(_714);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    if (_704)
    {
        _233 = 0;
    }
    int _730 = _233;
    int _732 = _730;
    if (!_704)
    {
        _732 = 1;
    }
    int _734 = _732;
    float _736 = float(uint(_722));
    int _738 = _718 * int(_712);
    int _740 = _738 + _588;
    bool _742 = _308 > 0.5;
    float _744 = as_type<float>(_281) * _736;
    float _746 = float(uint(_740));
    float _748 = trunc(_744);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    int _754 = _676 * int(_728);
    int _756 = _754 + _694;
    float _758 = as_type<float>(_281) * _746;
    int _760 = ~_229;
    int _762 = _760 + 1;
    float _764 = float(uint(_756));
    float _766 = trunc(_758);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = ~_229;
    int _774 = _772 + 1;
    float _776 = as_type<float>(_291) * _764;
    int _778 = int(_690) + int(_752);
    float _780 = trunc(_776);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = float(uint(_628));
    int _788 = _762 * _778;
    int _790 = _788 + _652;
    int _792 = ~_251;
    int _794 = _792 + 1;
    float _796 = as_type<float>(_291) * _786;
    int _798 = int(_712) + int(_770);
    bool _800 = uint(_790) >= uint(_229);
    float _802 = trunc(_796);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = ~_251;
    int _810 = _808 + 1;
    bool _812 = !_800;
    int _814 = _812 ? 0 : (-1);
    int _816 = int(_728) + int(_784);
    int _818 = ~_778;
    int _820 = _818 + _814;
    int _822 = _820 + 1;
    int _824 = _229 * _822;
    int _826 = _824 + _652;
    int _828 = _774 * _798;
    int _830 = _828 + _588;
    int _832 = _810 * _816;
    int _834 = _832 + _694;
    bool _836 = !_684;
    int _838 = _836 ? _826 : (-1);
    int _840 = _794 * int(_806);
    int _842 = _840 + _628;
    bool _844 = uint(_830) >= uint(_229);
    bool _846 = uint(_834) >= uint(_251);
    int _848 = _838 & 3;
    bool _850 = _848 != 0;
    bool _852 = !_846;
    int _854 = _852 ? 0 : (-1);
    int _856 = _838 & 3;
    bool _858 = _856 != 0;
    bool _860 = !_844;
    int _862 = _860 ? 0 : (-1);
    bool _864 = uint(_848) > 1u;
    float _866 = float(uint(_842));
    int _868 = ~_816;
    int _870 = _868 + _854;
    int _872 = _870 + 1;
    int _874 = _858 ? 0 : 1;
    float _876 = as_type<float>(_291) * _866;
    bool _878 = _848 != 3;
    int _880 = _251 * _872;
    int _882 = _880 + _694;
    int _884 = ~_798;
    int _886 = _884 + _862;
    int _888 = _886 + 1;
    float _890 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _892 = int(_890);
    bool _894 = uint(_848) >= 2u;
    int _896 = ~_874;
    int _898 = _896 + 1;
    int _900 = _898 + 1;
    int _902 = _229 * _888;
    int _904 = _902 + _588;
    int _906 = _894 ? 0 : 1;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _910 = _908 != 0;
    float _912 = trunc(_876);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    bool _918 = !_514;
    int _920 = _918 ? _882 : (-1);
    int _922 = _900;
    if (!_864)
    {
        int _924 = ~_874;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    int _930 = _838 >> 31;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _934 = _932 != 0;
    bool _936 = !_910;
    int _938 = _936 ? 0 : 1;
    bool _940 = !_684;
    int _942 = _940 ? _904 : (-1);
    bool _944 = !_850;
    int _946 = _944 ? 0 : 1;
    int _948 = ~_906;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = _920 & 3;
    bool _956 = _954 != 0;
    int _958 = _920 & 3;
    bool _960 = _958 != 0;
    bool _962 = _848 != 3;
    int _964 = _952;
    if (_878)
    {
        int _966 = ~_906;
        int _968 = _966 + 1;
        _964 = _968;
    }
    int _970 = _964;
    float _972 = _306 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _974 = _312 > 0.5;
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _978 = int(_976);
    int _980 = _930 & 3;
    float _982 = -_223;
    float _984 = fma(_972, 2.0, _982);
    bool _986 = !_934;
    int _988 = _986 ? 0 : 1;
    bool _990 = uint(_954) > 1u;
    float _992 = -_137;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[76].x, _984);
    int _996 = _960 ? 0 : 1;
    bool _998 = !_962;
    int _1000 = _998 ? 0 : (-1);
    bool _1002 = !_956;
    int _1004 = _1002 ? 0 : 1;
    bool _1006 = uint(_954) >= 2u;
    bool _1008 = _954 != 3;
    bool _1010 = _954 != 3;
    int _1012 = _838 + _980;
    int _1014 = _920 >> 31;
    int _1016 = _1012 >> 2;
    int _1018 = _1014 & 3;
    int _1020 = _1016 << 4;
    int _1022 = _1020 + 368;
    int _1024 = ~_996;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    int _1030 = _1028;
    if (!_990)
    {
        int _1032 = ~_996;
        int _1034 = _1032 + 1;
        _1030 = _1034;
    }
    int _1036 = _1030;
    uint _1038 = uint(int(uint(_1022) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[int(_1048)][_1050];
    int _1054 = _920 + _1018;
    int _1056 = int(_806) + int(_916);
    int _1058 = ~_251;
    int _1060 = _1058 + 1;
    int _1062 = _1054 >> 2;
    int _1064 = _1006 ? 0 : 1;
    int _1066 = _1060 * _1056;
    int _1068 = _1066 + _628;
    int _1070 = _1062 << 4;
    int _1072 = _1070 + 512;
    int _1074 = ~_1064;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    int _1080 = _1078;
    if (_1008)
    {
        int _1082 = ~_1064;
        int _1084 = _1082 + 1;
        _1080 = _1084;
    }
    int _1086 = _1080;
    uint _1088 = uint(int(uint(_1072) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[int(_1098)][_1100];
    bool _1104 = uint(_1068) >= uint(_251);
    bool _1106 = !_1104;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1112 = _1110 != 0;
    int _1114 = _1072 + 8;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[int(_1126)][_1128];
    bool _1132 = !_1010;
    int _1134 = _1132 ? 0 : (-1);
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1146 = _1144 != 0;
    int _1148 = _1022 + 8;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
    int _1154 = int(_1150) & 3;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[int(_1152)][_1154];
    int _1158 = int(_1150) + 1;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    int _1162 = _1158 & 3;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[int(_1160)][_1162];
    float _1166 = in.m_46.x;
    float _1168 = in.m_46.y;
    float _1170 = in.m_46.z;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1176 = abs(_928);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1180 = fma(_364, -2.0, _1172);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1184 = ~_1176;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1192 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1196 = abs(_946);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1200 = _1188 * as_type<int>(_1052);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1206 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1208 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1210 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1212;
    float _1216 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1206);
    float _1218 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1208);
    float _1220 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1210);
    int _1222 = abs(_1036);
    out.m_58.x = _1190;
    out.m_58.y = _1192;
    out.m_58.z = _1194;
    out.m_58.w = _1198;
    int _1224 = abs(_1004);
    float _1226 = 1.0 / _1214;
    float _1228 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1216);
    float _1230 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1218);
    int _1232 = abs(_970);
    float _1234 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1220);
    float _1236 = 1.0 / _1204;
    int _1238 = ~_1056;
    int _1240 = _1238 + _1108;
    int _1242 = _1240 + 1;
    float _1244 = _310 * 2.0;
    int _1246 = ~_1224;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    int _1252 = ~_1222;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1258;
    int _1262 = ~_1196;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    int _1268 = _251 * _1242;
    int _1270 = _1268 + _628;
    int _1272 = _1256 * as_type<int>(_1102);
    float _1274 = float(uint(_978));
    float _1276 = 1.0 / _1260;
    int _1278 = ~_1232;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    int _1284 = _1266 * as_type<int>(_1044);
    int _1286 = _1284 + _1200;
    int _1288 = abs(_938);
    int _1290 = _1250 * as_type<int>(_1094);
    int _1292 = _1290 + _1272;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1298 = _1282 * as_type<int>(_1156);
    int _1300 = _1298 + _1286;
    int _1302 = abs(_1086);
    float _1304 = 1.0 / _1274;
    int _1306 = abs(_1000);
    int _1308 = abs(_1134);
    int _1310 = ~_1306;
    int _1312 = _1310 + 1;
    int _1314 = _1312 + 1;
    int _1316 = ~_1302;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = 1.0 / _1296;
    float _1324 = float(uint(_892));
    int _1326 = _1314 * as_type<int>(_1164);
    int _1328 = _1326 + _1300;
    int _1330 = ~_1288;
    int _1332 = _1330 + 1;
    int _1334 = _1332 + 1;
    int _1336 = _1320 * as_type<int>(_1122);
    int _1338 = _1336 + _1292;
    int _1340 = abs(_988);
    int _1342 = _1328 * _1334;
    int _1344 = ~_1308;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = 1.0 / _1324;
    int _1352 = as_type<int>(_1304) + (-2);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1354;
    int _1358 = abs(_978);
    int _1360 = _1348 * as_type<int>(_1130);
    int _1362 = _1360 + _1338;
    int _1364 = _942 * _1288;
    int _1366 = _1364 + _1342;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    int _1372 = ~_1340;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1380 = float(uint(_1366));
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1384 = float(uint(_1358));
    int _1386 = _1362 * _1376;
    bool _1388 = !_514;
    int _1390 = _1388 ? _1270 : (-1);
    float _1392 = as_type<float>(_1352) * _1380;
    float _1394 = 1.0 / _1384;
    float _1396 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1398 = _1390 * _1340;
    int _1400 = _1398 + _1386;
    int _1402 = as_type<int>(_1350) + (-2);
    float _1404 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1408 = ~_978;
    int _1410 = _1408 + 1;
    float _1412 = trunc(_1392);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    int _1418 = abs(_892);
    float _1420 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = float(uint(_1400));
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1426 = _207 + _1424;
    float _1428 = float(uint(_1418));
    out.m_60.x = _1396;
    out.m_60.y = _1420;
    out.m_60.z = _1404;
    float _1430 = as_type<float>(_1402) * _1422;
    int _1432 = abs(_1366);
    float _1434 = 1.0 / _1370;
    int _1436 = as_type<int>(_1394) + (-2);
    int _1438 = ~_892;
    int _1440 = _1438 + 1;
    float _1442 = 1.0 / _1428;
    int _1444 = _1410 * int(_1416);
    int _1446 = _1444 + _1366;
    float _1448 = float(uint(_1432));
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1452 = _207 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1456 = _207 + _1454;
    int _1458 = ~_1418;
    int _1460 = _1458 + 1;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1464 = float(uint(_1446));
    float _1466 = trunc(_1430);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    float _1472 = _1426 * _1226;
    int _1474 = abs(_1400);
    float _1476 = as_type<float>(_1436) * _1448;
    float _1478 = as_type<float>(_1352) * _1464;
    float _1480 = _1452 * _1276;
    float _1482 = float(uint(_1474));
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1486 = _207 + _1484;
    int _1488 = as_type<int>(_1442) + (-2);
    float _1490 = trunc(_1476);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    float _1496 = _1456 * _1236;
    float _1498 = _1486 * _1322;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1502 = _207 + _1500;
    float _1504 = as_type<float>(_1488) * _1482;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1508 = _207 + _1506;
    int _1510 = _1440 * int(_1470);
    int _1512 = _1510 + _1400;
    float _1514 = trunc(_1478);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    float _1520 = _1502 * _1434;
    int _1522 = ~_1418;
    int _1524 = _1522 + 1;
    float _1526 = float(uint(_1512));
    float _1528 = 1.0 / _1356;
    int _1530 = ~_1358;
    int _1532 = _1530 + 1;
    float _1534 = as_type<float>(_1402) * _1526;
    float _1536 = _306 * 2.0;
    int _1538 = ~_978;
    int _1540 = _1538 + 1;
    int _1542 = _1532 * int(_1494);
    int _1544 = _1542 + _1432;
    float _1546 = trunc(_1504);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = int(_1416) + int(_1518);
    float _1554 = _310 + _306;
    float _1556 = float(uint(_1544));
    float _1558 = _1508 * _1528;
    float _1560 = _306 + _308;
    float _1562 = trunc(_1534);
    float _1564 = precise::max(_1562, 0.0);
    uint _1566 = uint(_1564);
    float _1568 = as_type<float>(_1436) * _1556;
    float _1570 = _1554 + (-1.0);
    float _1572 = _1560 + (-1.0);
    int _1574 = _1524 * int(_1550);
    int _1576 = _1574 + _1474;
    float _1578 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1580 = trunc(_1568);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1588 = ~_892;
    int _1590 = _1588 + 1;
    float _1592 = float(uint(_1576));
    int _1594 = _1540 * _1552;
    int _1596 = _1594 + _1366;
    float _1598 = floor(_1536);
    float _1600 = as_type<float>(_1488) * _1592;
    bool _1602 = uint(_1596) >= uint(_978);
    bool _1604 = !_1602;
    int _1606 = _1604 ? 0 : (-1);
    float _1608 = trunc(_1600);
    float _1610 = precise::max(_1608, 0.0);
    uint _1612 = uint(_1610);
    int _1614 = int(_1470) + int(_1566);
    float _1616 = -_177;
    int _1618 = _974 ? as_type<int>(_1616) : as_type<int>(_177);
    bool _1620 = _306 > 0.5;
    int _1622 = _1590 * _1614;
    int _1624 = _1622 + _1400;
    int _1626 = ~_1358;
    int _1628 = _1626 + 1;
    float _1630 = -_173;
    int _1632 = _1620 ? as_type<int>(_1630) : as_type<int>(_173);
    bool _1634 = _1598 > 0.0;
    bool _1636 = _1598 >= 0.0;
    bool _1638 = isnan(_1598);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan(0.0);
    bool _1644 = _1640 || _1642;
    float _1646 = -_177;
    int _1648 = _742 ? as_type<int>(_1646) : as_type<int>(_177);
    bool _1650 = !_1112;
    float _1652 = _1650 ? _173 : as_type<float>(_1632);
    int _1654 = int(_1494) + int(_1584);
    float _1656 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1462);
    bool _1658 = uint(_1624) >= uint(_892);
    bool _1660 = _734 != 1;
    int _1662 = _1628 * _1654;
    int _1664 = _1662 + _1432;
    bool _1666 = !_1658;
    int _1668 = _1666 ? 0 : (-1);
    float _1670 = _310 + _308;
    bool _1672 = _310 > 0.5;
    float _1674 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1656);
    float _1676 = _1670 + (-1.0);
    int _1678 = int(_1550) + int(_1612);
    float _1680 = -_1674;
    float _1682 = _1680 + 1.0;
    float _1684 = -_173;
    int _1686 = _1672 ? as_type<int>(_1684) : as_type<int>(_173);
    int _1688 = _1460 * _1678;
    int _1690 = _1688 + _1474;
    bool _1692 = uint(_1664) >= uint(_1358);
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1696 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1698 = as_type<float>(_1358);
    float _1700 = as_type<float>(_1474);
    float _1702 = as_type<float>(_1540);
    float _1704 = as_type<float>(_1612);
    if (!_1660)
    {
        _1698 = _308;
    }
    float _1706 = _1698;
    float _1708 = _306 + (-0.5);
    float _1710 = _1706;
    if (!_1660)
    {
        _1700 = _308;
    }
    float _1712 = _1700;
    float _1714 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1694);
    float _1716 = _1712;
    if (_1660)
    {
        _1710 = _306;
    }
    float _1718 = _1710;
    float _1720 = _310 + (-0.5);
    if (_1660)
    {
        _1716 = _306;
    }
    float _1722 = _1716;
    float _1724 = _308 + (-0.5);
    if (!_1660)
    {
        _1702 = _310;
    }
    float _1726 = _1702;
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1730 = _1726;
    if (!_1660)
    {
        _1704 = _310;
    }
    float _1732 = _1704;
    float _1734 = _308 * 2.0;
    float _1736 = _1732;
    if (_1660)
    {
        _1730 = _308;
    }
    float _1738 = _1730;
    float _1740 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1714);
    if (_1660)
    {
        _1736 = _308;
    }
    float _1742 = _1736;
    int _1744 = _1366 ^ _978;
    float _1746 = floor(_1734);
    bool _1748 = !_1692;
    int _1750 = _1748 ? 0 : (-1);
    float _1752 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    uint _1754 = uint(int(uint(_1744) >> uint(31)));
    int _1756 = ~_1750;
    int _1758 = _1654 + _1756;
    int _1760 = _1758 + 1;
    int _1762 = ~int(_1754);
    int _1764 = _1762 + 1;
    float _1766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1768 = ~_1552;
    int _1770 = _1768 + _1606;
    int _1772 = _1770 + 1;
    int _1774 = ~_1614;
    int _1776 = _1774 + _1668;
    int _1778 = _1776 + 1;
    int _1780 = _1760 ^ _1764;
    int _1782 = _978 * _1772;
    int _1784 = _1782 + _1366;
    bool _1786 = uint(_1690) >= uint(_1418);
    int _1788 = _892 * _1778;
    int _1790 = _1788 + _1400;
    bool _1792 = !_1142;
    float _1794 = _1792 ? _177 : as_type<float>(_1648);
    float _1796 = floor(_1244);
    bool _1798 = !_1146;
    float _1800 = _1798 ? _173 : as_type<float>(_1686);
    bool _1802 = _978 == 0;
    bool _1804 = _978 == 0;
    bool _1806 = _892 == 0;
    int _1808 = ~_1764;
    int _1810 = _1808 + _1780;
    int _1812 = _1810 + 1;
    bool _1814 = !_1802;
    int _1816 = _1814 ? _1784 : (-1);
    bool _1818 = !_1806;
    int _1820 = _1818 ? _1790 : (-1);
    bool _1822 = !_1804;
    int _1824 = _1822 ? _1812 : (-1);
    int _1826 = _1644 ? 0 : 1;
    bool _1828 = !_1786;
    int _1830 = _1828 ? 0 : (-1);
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1834 = _1832 != 0;
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1838 = _1836 != 0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1842 = _1840 != 0;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1844;
    bool _1848 = _1746 > 0.0;
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1854 = _1746 >= 0.0;
    bool _1856 = isnan(_1746);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan(0.0);
    bool _1862 = _1858 || _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1864;
    int _1868 = ~_1826;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1878 = _1872;
    if (!_1634)
    {
        int _1880 = ~_1826;
        int _1882 = _1880 + 1;
        _1878 = _1882;
    }
    int _1884 = _1878;
    float _1886 = fma(_1866, _1472, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1888 = fma(_1876, _1496, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1890 = !_1834;
    float _1892 = _1890 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1894 = fma(_1852, _1496, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1896 = _1796 > 0.0;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1898;
    bool _1902 = _1796 >= 0.0;
    bool _1904 = isnan(_1796);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.0);
    bool _1910 = _1906 || _1908;
    float _1912 = fma(_1846, _1472, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1918;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1926;
    float _1930 = fma(_1916, _1498, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1932;
    float _1936 = fma(_1924, _1498, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1938 = fma(_1928, _1558, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1940 = fma(_1900, _1480, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1942 = fma(_1934, _1558, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _1944 = _1910 ? 0 : 1;
    float _1946 = fma(_1920, _1480, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1948 = _892 == 0;
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1952 = _1950 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _1954 = _1400 ^ _892;
    float _1956 = _1230 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1962 = _1228 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    uint _1964 = uint(int(uint(_1954) >> uint(31)));
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1968 = _1956 + _1966;
    float _1970 = fma(_1952, _1520, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1972 = fma(_1960, _1520, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _1974 = ~_1830;
    int _1976 = _1678 + _1974;
    int _1978 = _1976 + 1;
    float _1980 = _1234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1984 = _1962 + _1982;
    float _1986 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1988 = ~int(_1964);
    int _1990 = _1988 + 1;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1994 = _1980 + _1992;
    int _1996 = ~_1944;
    int _1998 = _1996 + 1;
    int _2000 = _1998 + 1;
    float _2002 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1986);
    int _2004 = _1978 ^ _1990;
    float _2006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2008 = _2000;
    float _2010 = _1892;
    if (!_1896)
    {
        int _2012 = ~_1944;
        int _2014 = _2012 + 1;
        _2008 = _2014;
    }
    int _2016 = _2008;
    float _2018 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2002);
    int _2020 = ~_1990;
    int _2022 = _2020 + _2004;
    int _2024 = _2022 + 1;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2028 = _2018 >= 0.0;
    float _2030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2032 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2026);
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2036 = !_1948;
    int _2038 = _2036 ? _2024 : (-1);
    float _2040 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2032);
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2044 = float(_1816);
    float _2046 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2034);
    int _2048 = abs(as_type<int>(_1892));
    float _2050 = -_2042;
    float _2052 = fma(_1728, 2.0, _2050);
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2056 = fma(_366, _2044, _994);
    int _2058 = _2016;
    if (_2028)
    {
        _2010 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2060 = _2010;
    float _2062 = float(_1820);
    float _2064 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2066 = -_137;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2052);
    float _2070 = fma(_1752, -2.0, _2054);
    float _2072 = float(_2016);
    if (_2028)
    {
        float _2074 = _2060 * 5.0;
        _2058 = as_type<int>(_2074);
    }
    int _2076 = _2058;
    float _2078 = fma(_2064, _2062, _2068);
    float _2080 = _1652 + 0.5;
    float _2082 = float(_2038);
    float _2084 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2070);
    bool _2086 = !_1138;
    float _2088 = _2086 ? _177 : as_type<float>(_1618);
    float _2090 = fma(_366, _2080, _2056);
    float _2092 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2094 = float(_1824);
    float _2096 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2098 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1180);
    float _2100 = -_2084;
    float _2102 = fma(_2092, _2082, _2100);
    float _2104 = _2088 + (-0.5);
    float _2106 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2046);
    if (_2028)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6880 = as_type<float>(_2076);
        out.gl_Position.z = _6880;
    }
    float _2108 = -_2098;
    float _2110 = fma(_2096, _2094, _2108);
    float _2112 = _1800 + 0.5;
    float _2114 = -_2092;
    float _2116 = fma(_2114, _2104, _2102);
    float _2118 = -_2106;
    float _2120 = _2118 + 1.0;
    float _2122 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2124 = log2(_2122);
    float _2126 = fma(_2064, _2112, _2078);
    float _2128 = float(_2048);
    float _2130 = fma(_2088, _2120, _2116);
    float _2132 = _1968 * _1968;
    bool _2134 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2136 = isnan(_207);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    if (_2028)
    {
        out.m_49.x = 0.0;
    }
    float _2146 = _1794 + (-0.5);
    float _2148 = -_1740;
    float _2150 = _2148 + 1.0;
    bool _2152 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2154 = isnan(_207);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = -_2144;
    float _2166 = _2164 + 1.0;
    float _2168 = -_2096;
    float _2170 = fma(_2168, _2146, _2110);
    float _2172 = -_2040;
    float _2174 = _2172 + 1.0;
    float _2176 = -_2150;
    float _2178 = fma(_1652, _2176, _2090);
    bool _2180 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2182 = isnan(_207);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2188 = _2184 || _2186;
    float _2190 = float(_2188);
    float _2192 = fma(_1794, _1682, _2170);
    float _2194 = -_2174;
    float _2196 = fma(_1800, _2194, _2126);
    float _2198 = fma(_1984, _1984, _2132);
    float _2200 = -_2162;
    float _2202 = _2200 + 1.0;
    float _2204 = -_2190;
    float _2206 = _2204 + 1.0;
    bool _2208 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2210 = isnan(_207);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2216 = _2212 || _2214;
    float _2218 = float(_2216);
    out.m_62.x = _2178;
    out.m_62.y = _2192;
    out.m_62.z = _2196;
    out.m_62.w = _2130;
    float _2220 = fma(_1994, _1994, _2198);
    float _2222 = _2162 * _2206;
    bool _2224 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2226 = isnan(_207);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = in.m_64.x;
    float _2238 = in.m_64.y;
    float _2240 = in.m_64.z;
    float _2242 = rsqrt(_2220);
    float _2244 = _2144 * _2202;
    bool _2246 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2248 = isnan(_207);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2254 = _2250 || _2252;
    float _2256 = float(_2254);
    float _2258 = _2234 * _2166;
    bool _2260 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2262 = isnan(_207);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = -_2234;
    float _2274 = _2272 + 1.0;
    float _2276 = -_2256;
    float _2278 = _2276 + 1.0;
    float _2280 = _2128 * _2072;
    float _2282 = _2124 * _137;
    float _2284 = -_2270;
    float _2286 = _2284 + 1.0;
    float _2288 = _2270 * _2278;
    bool _2290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2292 = isnan(1.0);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2298 = _2294 || _2296;
    float _2300 = exp2(_2282);
    float _2302 = _2256 * _2274;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2316 = 1.0 + _2314;
    float _2318 = _2218 * _2286;
    bool _2320 = !_1838;
    int _2322 = _2320 ? 0 : 1;
    float _2324 = _1968 * _2242;
    bool _2326 = !_1842;
    int _2328 = _2326 ? 0 : 1;
    float _2330 = _1984 * _2242;
    if (_2028)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2332 = -_2324;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1956);
    float _2336 = 1.0 / _2316;
    float _2338 = _1994 * _2242;
    float _2340 = -_2330;
    float _2342 = fma(_2340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2346 = _2334 + _2344;
    int _2348 = abs(_2322);
    float _2350 = -_2338;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1980);
    float _2354 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2356 = _2342 + _2354;
    float _2358 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2360 = -_2300;
    float _2362 = _2360 + 1.0;
    float _2364 = float(_1884);
    float _2366 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2368 = _2352 + _2366;
    float _2370 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2358);
    float _2372 = float(_2348);
    float _2374 = _2280 * (-2.0);
    float _2376 = _2312 ? _2362 : 0.0;
    float _2378 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2370);
    float _2380 = _1886 * _2318;
    float _2382 = _2372 * _2364;
    float _2384 = _1912 * _2318;
    float _2386 = _2342;
    if (_2298)
    {
        float _2388 = _2376 * _2336;
        _141 = _2388;
    }
    float _2390 = _141;
    float _2392 = fma(_2374, _2236, _2236);
    bool _2394 = _2378 >= 0.0;
    float _2396 = _2382 * (-2.0);
    float _2398 = fma(_1578, _2374, _1578);
    float _2400 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2392);
    int _2402 = abs(_2328);
    float _2404 = fma(_2396, _2238, _2238);
    float _2406 = fma(_1696, _2396, _1696);
    float _2408 = fma(_2398, _2390, _2400);
    float _2410 = -_2218;
    float _2412 = _2410 + 1.0;
    float _2414 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2404);
    int _2416 = _1862 ? 0 : 1;
    float _2418 = _2408 * 0.15915493667125701904296875;
    float _2420 = fma(_2406, _2390, _2414);
    float _2422 = _2396;
    if (_2394)
    {
        _2422 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2424 = _2422;
    float _2426 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2380);
    float _2428 = _2418 * 6.283185482025146484375;
    float _2430 = sin(_2428);
    int _2432 = ~_2416;
    int _2434 = _2432 + 1;
    int _2436 = _2434 + 1;
    int _2438 = as_type<int>(_2424);
    int _2440 = _2436;
    if (_2394)
    {
        out.m_49.x = 0.0;
    }
    if (_2394)
    {
        float _2442 = _2424 * 5.0;
        _2438 = as_type<int>(_2442);
    }
    int _2444 = _2438;
    if (!_1848)
    {
        int _2446 = ~_2416;
        int _2448 = _2446 + 1;
        _2440 = _2448;
    }
    int _2450 = _2440;
    float _2452 = _2418 * 6.283185482025146484375;
    float _2454 = cos(_2452);
    if (_2394)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7395 = as_type<float>(_2444);
        out.gl_Position.z = _7395;
    }
    float _2456 = float(_2450);
    float _2458 = float(_2402);
    if (_2394)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2460 = -_1956;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2464 = -_1962;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2468 = _2458 * _2456;
    float _2470 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2384);
    float _2472 = _2462 * _2462;
    float _2474 = -_1980;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2478 = _2468 * (-2.0);
    float _2480 = fma(_1888, _2288, _2426);
    float _2482 = fma(_2466, _2466, _2472);
    float _2484 = fma(_1894, _2288, _2470);
    float _2486 = fma(_2478, _2240, _2240);
    float _2488 = fma(_1940, _2302, _2480);
    float _2490 = fma(_2476, _2476, _2482);
    float _2492 = fma(_1946, _2302, _2484);
    float _2494 = in.m_66.x;
    float _2496 = in.m_66.y;
    float _2498 = fma(_1586, _2478, _1586);
    float _2500 = rsqrt(_2490);
    float _2502 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2486);
    float _2504 = -_2324;
    float _2506 = fma(_2504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1968);
    float _2508 = -_2330;
    float _2510 = fma(_2508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1984);
    float _2512 = fma(_1930, _2258, _2488);
    float _2514 = fma(_2498, _2390, _2502);
    float _2516 = _2506 * _2506;
    float _2518 = fma(_1936, _2258, _2492);
    float _2520 = -_2338;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1994);
    float _2524 = fma(_1938, _2244, _2512);
    float _2526 = fma(_2510, _2510, _2516);
    float _2528 = fma(_1942, _2244, _2518);
    float _2530 = _2420 * 0.15915493667125701904296875;
    float _2532 = fma(_1970, _2222, _2524);
    float _2534 = fma(_2522, _2522, _2526);
    float _2536 = fma(_1972, _2222, _2528);
    float _2538 = _2466 * _2500;
    float _2540 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[149].x, _2532);
    float _2542 = _2476 * _2500;
    float _2544 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[149].y, _2536);
    float _2546 = sqrt(_2534);
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2550 = _2538 * _2548;
    float _2552 = _2462 * _2500;
    float _2554 = _2544 * _2496;
    float _2556 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2558 = _2542 * _2556;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2562 = -_2550;
    float _2564 = fma(_2542, _2560, _2562);
    float _2566 = _2514 * 0.15915493667125701904296875;
    float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2570 = _2552 * _2568;
    float _2572 = _2530 * 6.283185482025146484375;
    float _2574 = sin(_2572);
    float _2576 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2578 = -_2558;
    float _2580 = fma(_2552, _2576, _2578);
    float _2582 = _2564 * _2564;
    float _2584 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2586 = -_2570;
    float _2588 = fma(_2538, _2584, _2586);
    float _2590 = _2540 * _2494;
    float _2592 = _2554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2594 = fma(_2580, _2580, _2582);
    float _2596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _2598 = _2530 * 6.283185482025146484375;
    float _2600 = cos(_2598);
    float _2602 = _2242 * _2546;
    float _2604 = fma(_2588, _2588, _2594);
    float _2606 = _2590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _2608 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2610 = isnan(0.5);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2616 = _2612 || _2614;
    float _2618 = _2602 * _2606;
    float _2620 = _2566 * 6.283185482025146484375;
    float _2622 = sin(_2620);
    float _2624 = _2430 * _2574;
    float _2626 = _2454 * _2574;
    bool _2628 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2630 = isnan(0.5);
    bool _2632 = _2628 || _2630;
    bool _2634 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2636 = _2632 || _2634;
    float _2638 = _2566 * 6.283185482025146484375;
    float _2640 = cos(_2638);
    float _2642 = _2454 * _2600;
    float _2644 = _2430 * _2600;
    float _2646 = rsqrt(_2604);
    float _2648 = fma(_2622, _2642, _2624);
    float _2650 = fma(_2622, _2624, _2642);
    float _2652 = _2602 * _2592;
    float _2654 = -_2626;
    float _2656 = fma(_2622, _2644, _2654);
    float _2658 = -_2644;
    float _2660 = fma(_2622, _2626, _2658);
    float _2662 = _2596 * _2652;
    float _2664 = _2454 * _2640;
    float _2666 = _2600 * _2640;
    float _2668 = _2430 * _2640;
    float _2670 = _2574 * _2640;
    float _2672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _2674 = _2664 * _2662;
    float _2676 = _2602 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2678 = _2676 * 0.5;
    float _2680 = -_2662;
    float _2682 = _2622 * _2680;
    float _2684 = _2672 * _2618;
    float _2686 = _2580 * _2646;
    float _2688 = _2564 * _2646;
    float _2690 = _2668 * _2662;
    float _2692 = fma(_2648, _2684, _2674);
    float _2694 = _2552 * _2686;
    float _2696 = _2588 * _2646;
    float _2698 = fma(_2666, _2684, _2682);
    float _2700 = fma(_2660, _2678, _2692);
    float _2702 = _2542 * _2688;
    float _2704 = -_2694;
    float _2706 = fma(_2538, _2688, _2704);
    float _2708 = fma(_2656, _2684, _2690);
    float _2710 = fma(_2670, _2678, _2698);
    float _2712 = -_2702;
    float _2714 = fma(_2552, _2696, _2712);
    float _2716 = _2706 * _2700;
    float _2718 = fma(_2650, _2678, _2708);
    float _2720 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2722 = _2714 * _2700;
    float _2724 = fma(_2696, _2710, _2716);
    float _2726 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2728 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2720);
    float _2730 = fma(_2686, _2710, _2722);
    float _2732 = fma(_2542, _2718, _2724);
    float _2734 = _2538 * _2696;
    float _2736 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2728);
    float _2738 = fma(_2538, _2718, _2730);
    float _2740 = _1980 + _2732;
    float _2742 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2726);
    float _2744 = _2736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2746 = _1962 + _2738;
    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2750 = _2740 + _2748;
    float _2752 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2742);
    float _2754 = 1.0 / _2744;
    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2758 = _2746 + _2756;
    float _2760 = _2750 * _2750;
    float _2762 = _2752 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2764 = -_2734;
    float _2766 = fma(_2542, _2686, _2764);
    float _2768 = fma(_2758, _2758, _2760);
    float _2770 = _2762 + _2744;
    float _2772 = _2766 * _2700;
    float _2774 = sqrt(_2768);
    float _2776 = fma(_2688, _2710, _2772);
    float _2778 = _2770 * _2754;
    float _2780 = _2778 * 0.5;
    float _2782 = fma(_2552, _2718, _2776);
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2786 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2784);
    float _2788 = _1956 + _2782;
    bool _2790 = _2774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2792 = 1.0 / _2786;
    float _2794 = _2772;
    float _2796 = _2746;
    float _2798 = _2740;
    float _2800 = _2710;
    float _2802 = _2754;
    if (!_2790)
    {
        _2794 = _2746;
    }
    float _2804 = _2794;
    float _2806 = _2804;
    if (!_2790)
    {
        _2796 = _2788;
    }
    float _2808 = _2796;
    bool _2810 = !_2790;
    float _2812 = _2808;
    if (!_2810)
    {
        float _2814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2818 = _2774 + _2816;
        float _2820 = rsqrt(_2768);
        float _2822 = _2818 * _2814;
        float _2824 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2826 = _2822 * 0.15915493667125701904296875;
        float _2828 = _2826 * 6.283185482025146484375;
        float _2830 = cos(_2828);
        float _2832 = _2826 * 6.283185482025146484375;
        float _2834 = sin(_2832);
        float _2836 = _2830 + (-1.0);
        float _2838 = fma(_2834, _2824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2840 = _2836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2842 = _2820 * _2838;
        float _2844 = fma(_2788, _2830, _2840);
        float _2846 = fma(_2758, _2842, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2848 = fma(_2750, _2842, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2798 = _2848;
        _2806 = _2846;
        _2812 = _2844;
        _2800 = _2842;
    }
    float _2850 = _2798;
    float _2852 = _2806;
    float _2854 = _2812;
    float _2856 = _2800;
    float _2858 = -_2338;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2850);
    float _2862 = -_2330;
    float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2852);
    float _2866 = -_2324;
    float _2868 = fma(_2866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2854);
    float _2870 = _2856;
    float _2872 = _2868;
    float _2874 = _2864;
    float _2876 = _2860;
    float _2878 = _2850;
    if (_2636)
    {
        _2870 = 1.0;
    }
    float _2880 = _2870;
    float _2882 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2884 = _2792 * _2882;
    float _2886 = _2880;
    if (!_2616)
    {
        float _2888 = _2346 * _2346;
        float _2890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2892 = -_1980;
        float _2894 = _2892 + _2850;
        float _2896 = -_1956;
        float _2898 = _2896 + _2854;
        float _2900 = fma(_2356, _2356, _2888);
        float _2902 = -_1962;
        float _2904 = _2902 + _2852;
        float _2906 = fma(_2368, _2368, _2900);
        float _2908 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2910 = sqrt(_2906);
        float _2912 = 1.0 / _2602;
        float _2914 = _2908 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2916 = precise::min(_2910, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2918 = _2916 * _2890;
        float _2920 = _2918 * _2912;
        float _2922 = _2914 * _2920;
        float _2924 = _2894 * _2920;
        float _2926 = fma(_2898, _2922, _2334);
        float _2928 = fma(_2904, _2922, _2342);
        float _2930 = fma(_2914, _2924, _2352);
        _2872 = _2926;
        _2874 = _2928;
        _2876 = _2930;
        _2878 = _2924;
    }
    float _2932 = _2872;
    float _2934 = _2874;
    float _2936 = _2876;
    float _2938 = _2878;
    float _2940 = _2938;
    if (!_2636)
    {
        float _2942 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2944 = _2942 * 0.15915493667125701904296875;
        float _2946 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2948 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2950 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2948;
        float _2952 = _2944 * 6.283185482025146484375;
        float _2954 = cos(_2952);
        float _2956 = _2946 * 0.15915493667125701904296875;
        float _2958 = _2944 * 6.283185482025146484375;
        float _2960 = sin(_2958);
        float _2962 = 1.0 / _2954;
        float _2964 = _2956 * 6.283185482025146484375;
        float _2966 = cos(_2964);
        float _2968 = _2960 * _2962;
        float _2970 = _2956 * 6.283185482025146484375;
        float _2972 = sin(_2970);
        float _2974 = _2966 * _2968;
        float _2976 = 1.0 / _2950;
        float _2978 = 1.0 / _2974;
        float _2980 = _2972 * _2978;
        float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2984 = fma(_2884, _2980, _2982);
        float _2986 = _2984 * _2976;
        float _2988 = precise::clamp(_2986, 0.0, 1.0);
        _2940 = _2944;
        _2886 = _2988;
    }
    float _2990 = _2940;
    float _2992 = _2886;
    float _2994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2996 = _2932 + _2994;
    float _2998 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3000 = _2934 + _2998;
    float _3002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3004 = _2936 + _3002;
    float _3006 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3008 = _2996 * _2996;
    float _3010 = fma(_3000, _3000, _3008);
    float _3012 = fma(_3004, _3004, _3010);
    float _3014 = rsqrt(_3012);
    float _3016 = sqrt(_3012);
    float _3018 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3020 = _3000 * _3018;
    float _3022 = _3004 * _3018;
    float _3024 = _3020 * _3020;
    float _3026 = _3022 * _3022;
    float _3028 = _3024 + _3026;
    float _3030 = sqrt(_3028);
    bool _3032 = _3030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3036 = _3030 + _3034;
    float _3038 = _3004;
    float _3040 = _3028;
    float _3042 = _3036;
    float _3044 = _3008;
    float _3046 = _3020;
    if (_3032)
    {
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3038 = _3048;
    }
    float _3050 = _3038;
    if (_3032)
    {
        float _3052 = rsqrt(_3028);
        _3040 = _3052;
    }
    float _3054 = _3040;
    float _3056 = _3054;
    if (_3032)
    {
        float _3058 = _3036 * _3050;
        _3042 = _3058;
    }
    float _3060 = _3042;
    if (_3032)
    {
        float _3062 = _3060 * 0.15915493667125701904296875;
        _3044 = _3062;
    }
    float _3064 = _3044;
    float _3066 = _3050;
    float _3068 = _3064;
    if (_3032)
    {
        float _3070 = _3064 * 6.283185482025146484375;
        float _3072 = sin(_3070);
        _3066 = _3072;
    }
    float _3074 = _3066;
    float _3076 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3078 = precise::max(0.0, _3076);
    float _3080 = _2990;
    float _3082 = _3078;
    if (_3032)
    {
        float _3084 = _3064 * 6.283185482025146484375;
        float _3086 = cos(_3084);
        _3080 = _3086;
    }
    float _3088 = _3080;
    float _3090 = -_3018;
    float _3092 = -_3078;
    float _3094 = fma(_2996, _3090, _3092);
    float _3096 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3032)
    {
        float _3098 = _3094 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3082 = _3098;
    }
    float _3100 = _3082;
    if (!_3032)
    {
        _3068 = _3094;
    }
    float _3102 = _3068;
    float _3104 = _3074;
    float _3106 = _3102;
    if (_3032)
    {
        float _3108 = fma(_3074, _3100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3104 = _3108;
    }
    float _3110 = _3104;
    float _3112 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3114 = _3110;
    if (_3032)
    {
        float _3116 = _3088 + (-1.0);
        _3096 = _3116;
    }
    float _3118 = _3096;
    if (_3032)
    {
        float _3120 = _3054 * _3110;
        _2802 = _3120;
    }
    float _3122 = _2802;
    if (!_3032)
    {
        _3114 = _3022;
    }
    float _3124 = _3114;
    float _3126 = _3124;
    if (_3032)
    {
        float _3128 = _3118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2386 = _3128;
    }
    float _3130 = _2386;
    float _3132 = _3130;
    if (_3032)
    {
        float _3134 = _3020 * _3122;
        _3046 = _3134;
    }
    float _3136 = _3046;
    if (!_3032)
    {
        _3056 = _3024;
    }
    float _3138 = _3056;
    float _3140 = _3138;
    if (_3032)
    {
        float _3142 = _3022 * _3122;
        _3126 = _3142;
    }
    float _3144 = _3126;
    if (_3032)
    {
        float _3146 = fma(_3094, _3088, _3130);
        _3106 = _3146;
    }
    float _3148 = _3106;
    if (_3032)
    {
        float _3150 = _3136 * _3136;
        _3140 = _3150;
    }
    float _3152 = _3140;
    if (!_3032)
    {
        _3132 = _3026;
    }
    float _3154 = _3132;
    float _3156 = _3154;
    if (_3032)
    {
        float _3158 = _3144 * _3144;
        _3156 = _3158;
    }
    float _3160 = _3156;
    float _3162 = fma(_3148, _3148, _3152);
    float _3164 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3166 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3168 = _3162 + _3160;
    float _3170 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3164);
    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3174 = fma(_3016, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3172);
    float _3176 = precise::clamp(_3174, 0.0, 1.0);
    float _3178 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3180 = rsqrt(_3168);
    float _3182 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3170);
    float _3184 = -_3176;
    float _3186 = _3184 + 1.0;
    float _3188 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3006);
    float _3190 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3192 = abs(_3186);
    float _3194 = log2(_3192);
    float _3196 = _3190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3198 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3166);
    float _3200 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3202 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3188);
    float _3204 = -_3196;
    float _3206 = fma(_3204, _3178, 1.0);
    float _3208 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3210 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3198);
    float _3212 = _3180 * _3136;
    float _3214 = _3180 * _3148;
    float _3216 = _3180 * _3144;
    float _3218 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3208);
    float _3220 = _3210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3222 = floor(_3112);
    float _3224 = _3212 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3226 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3218);
    float _3228 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3230 = _3202 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3232 = -_3224;
    float _3234 = fma(_3214, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3232);
    float _3236 = _3226 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3238 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3240 = floor(_3200);
    float _3242 = -_3216;
    float _3244 = fma(_3242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3234);
    float _3246 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3228);
    float _3248 = fma(_3244, -0.5, 0.5);
    float _3250 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3246);
    float _3252 = fma(_3244, 0.5, 0.5);
    float _3254 = log2(_3206);
    float _3256 = _3214 + 1.0;
    float _3258 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3250);
    float _3260 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3262 = exp2(_3238);
    float _3264 = -_3222;
    float _3266 = _3112 + _3264;
    float _3268 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3270 = -_3240;
    float _3272 = _3200 + _3270;
    float _3274 = fma(_3252, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3276 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3260);
    float _3278 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3268);
    float _3280 = 1.0 / _3258;
    float _3282 = fma(_3252, _3274, -0.212114393711090087890625);
    float _3284 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3278);
    float _3286 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3276);
    float _3288 = _3254 * 0.693147182464599609375;
    float _3290 = sqrt(_3248);
    float _3292 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3284);
    float _3294 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3286);
    float _3296 = -_3214;
    float _3298 = fma(_3262, _3256, _3296);
    float2 _8744 = float2(_3266, _3272);
    float _3300 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8744, float2(0.0), isnan(_8744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8744, float2(0.0), isnan(_8744)), level(0.0)).x;
    float _3302 = fma(_3252, _3282, 1.570728778839111328125);
    float _3304 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3306 = fma(_3298, 0.5, 0.5);
    float _3308 = _3292 * _3280;
    float _3310 = _3294 * _3280;
    float _3312 = fma(_3308, 0.5, 0.5);
    float _3314 = fma(_3310, -0.5, 0.5);
    float _3316 = _3290 * 0.636619746685028076171875;
    float _3318 = -_3302;
    float _3320 = fma(_3316, _3318, 1.0);
    float3 _8783 = float3(_3312, _3314, _3304);
    float _3322 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8783, float3(0.0), isnan(_8783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8783, float3(0.0), isnan(_8783)), level(0.0)).x;
    float3 _8794 = float3(_3312, _3314, _3304);
    float4 _3325 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8794, float3(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8794, float3(0.0), isnan(_8794)), level(0.0)).xyzw;
    float _3327 = _3325.x;
    float _3329 = _3325.y;
    float _3331 = _3325.z;
    float _3333 = _3325.w;
    float2 _8810 = float2(_3320, _3306);
    float3 _3337 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8810, float2(0.0), isnan(_8810)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8810, float2(0.0), isnan(_8810)), level(0.0)).xyz;
    float _3339 = _3337.x;
    float _3341 = _3337.y;
    float _3343 = _3337.z;
    float _3345 = abs(_2884);
    float _3347 = log2(_3345);
    float _3349 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3351 = _2664 * _2714;
    float _3353 = _2660 * _2714;
    float _3355 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3357 = _2648 * _2766;
    float _3359 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3361 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3363 = isnan(_3016);
    bool _3365 = _3361 || _3363;
    bool _3367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3369 = _3365 || _3367;
    float _3371 = _2648 * _2714;
    float _3373 = _2648 * _2706;
    float _3375 = _2660 * _2766;
    float _3377 = _2660 * _2706;
    float _3379 = fma(_2666, _2686, _3371);
    float _3381 = fma(_2666, _2696, _3373);
    float _3383 = fma(_3349, _3349, 1.0);
    float _3385 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3387 = fma(_2666, _2688, _3357);
    float _3389 = fma(_2670, _2686, _3353);
    float _3391 = exp2(_3355);
    float _3393 = fma(_2656, _2538, _3379);
    float _3395 = fma(_2656, _2552, _3387);
    float _3397 = in.m_68.x;
    float _3399 = exp2(_3385);
    float _3401 = rsqrt(_3383);
    float _3403 = -_3391;
    float _3405 = _3403 + 1.0;
    float _3407 = fma(_3399, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3409 = precise::clamp(_3407, 0.0, 1.0);
    float _3411 = _2664 * _2766;
    float _3413 = fma(_3409, -2.0, 3.0);
    float _3415 = _3409 * _3409;
    float _3417 = _3415 * _3413;
    float _3419 = _2664 * _2706;
    float _3421 = -_2622;
    float _3423 = fma(_3421, _2686, _3351);
    float _3425 = -_2622;
    float _3427 = fma(_3425, _2688, _3411);
    float _3429 = fma(_2670, _2688, _3375);
    float _3431 = -_2622;
    float _3433 = fma(_3431, _2696, _3419);
    float _3435 = -_3417;
    float _3437 = _3435 + 1.0;
    float _3439 = fma(_2670, _2696, _3377);
    bool _3441 = _2884 <= 8000.0;
    bool _3443 = isnan(_2884);
    bool _3445 = _3441 || _3443;
    bool _3447 = isnan(8000.0);
    bool _3449 = _3445 || _3447;
    float _3451 = float(_3449);
    float _3453 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3455 = fma(_3437, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3417);
    float _3457 = fma(_2668, _2538, _3423);
    float _3459 = fma(_2668, _2552, _3427);
    float _3461 = fma(_2668, _2542, _3433);
    float _3463 = fma(_2650, _2552, _3429);
    float _3465 = fma(_2650, _2538, _3389);
    float _3467 = _3349 * _3401;
    float _3469 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3453);
    float _3471 = _3451 * _3455;
    float _3473 = _3349 * _3457;
    float _3475 = -_3465;
    float _3477 = _3467 * _3475;
    float _3479 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3469);
    float _3481 = fma(_2650, _2542, _3439);
    float _3483 = fma(_2656, _2542, _3381);
    float _3485 = fma(_3401, _3457, _3477);
    float _3487 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3479);
    float _3489 = _3349 * _3459;
    float _3491 = _3349 * _3461;
    float _3493 = -_3463;
    float _3495 = _3467 * _3493;
    float _3497 = -_3481;
    float _3499 = _3467 * _3497;
    out.m_70.x = _3393;
    out.m_70.y = _3395;
    out.m_70.z = _3483;
    float _3501 = fma(_3359, _3483, _3491);
    float _3503 = fma(_3359, _3393, _3473);
    float _3505 = fma(_3401, _3459, _3495);
    float _3507 = fma(_3401, _3461, _3499);
    float _3509 = _3471 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3511 = _3487 + _3258;
    float _3513 = _3292 + _3258;
    float _3515 = fma(_3359, _3395, _3489);
    float _3517 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3519 = _3511 * 0.5;
    float _3521 = _3258 * 0.5;
    float _3523 = _3481 + _3501;
    float _3525 = _3513 * 0.5;
    float _3527 = fma(_3294, -0.5, _3521);
    out.gl_Position.x = _3292;
    out.gl_Position.y = _3294;
    out.gl_Position.z = _3487;
    out.gl_Position.w = _3258;
    float _3529 = _3465 + _3503;
    float _3531 = _3463 + _3515;
    out.m_72.x = _3525;
    out.m_72.y = _3527;
    out.m_72.z = _3519;
    out.m_72.w = _3258;
    out.m_74.x = _3529;
    out.m_74.y = _3531;
    out.m_74.z = _3523;
    out.m_76.x = _3485;
    out.m_76.y = _3505;
    out.m_76.z = _3507;
    float _3533 = -_3517;
    float _3535 = _3533 + 1.0;
    float _3537 = _3258;
    float _3539 = _3487;
    float _3541 = _3294;
    float _3543 = _3485;
    float _3545 = _3517;
    float _3547 = _3535;
    if (!_3369)
    {
        _3537 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3549 = _3537;
    float _3551 = _3549;
    float _3553 = _3549;
    if (!_3369)
    {
        _3539 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3555 = _3539;
    float _3557 = _3555;
    float _3559 = _3555;
    if (!_3369)
    {
        _3541 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3561 = _3541;
    float _3563 = _2992 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3565 = _3561;
    float _3567 = _3561;
    if (!_3369)
    {
        _3543 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3569 = _3543;
    float _3571 = -_3300;
    float _3573 = _3571 + 1.0;
    float _3575 = _3573 * _3509;
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = -_3577;
    float _3581 = fma(_3579, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3583 = _3581 * _3397;
    float _3585 = _3583 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3587 = _3517 * _3322;
    float _3589 = _3333 * _3535;
    float _3591 = _3569;
    float _3593 = _3569;
    if (!_3369)
    {
        _3545 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3595 = _3545;
    out.m_78.x = _3585;
    float _3597 = _3333 * _3587;
    float _3599 = _3343 * _3587;
    float _3601 = _3595;
    float _3603 = _3595;
    if (!_3369)
    {
        _3547 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3605 = _3547;
    float _3607 = fma(_3339, _3597, _3327);
    float _3609 = fma(_3341, _3597, _3329);
    float _3611 = fma(_3333, _3599, _3331);
    out.m_80.x = _3607;
    out.m_80.y = _3609;
    out.m_80.z = _3611;
    out.m_80.w = _3589;
    bool _3613 = !_3369;
    float _3615 = _3605;
    float _3617 = _3605;
    if (!_3613)
    {
        bool _3619 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3621 = isnan(_3016);
        bool _3623 = _3619 || _3621;
        bool _3625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3627 = _3623 || _3625;
        if (!_3627)
        {
            float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3631 = _3016 + _3629;
            float _3633 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3635 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3633;
            float _3637 = 1.0 / _3635;
            float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3647 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3649 = _3647 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3657 = _3655 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3659 = _3631 * _3637;
            float _3661 = precise::clamp(_3659, 0.0, 1.0);
            float _3663 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3665 = _3663 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3667 = fma(_3661, _3641, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3669 = fma(_3661, _3665, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3671 = fma(_3661, _3645, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3673 = fma(_3661, _3649, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3675 = fma(_3661, _3653, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3677 = fma(_3661, _3657, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3593 = _3669;
            _3567 = _3675;
            _3603 = _3667;
            _3559 = _3673;
            _3553 = _3671;
            _3617 = _3677;
            _3679 = true;
        }
        else
        {
            bool _3681 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3683 = isnan(_3016);
            bool _3685 = _3681 || _3683;
            bool _3687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3689 = _3685 || _3687;
            if (!_3689)
            {
                _3601 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3691 = _3601;
            _3603 = _3691;
            if (!_3689)
            {
                _3591 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3693 = _3591;
            _3593 = _3693;
            if (!_3689)
            {
                _3551 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3695 = _3551;
            _3553 = _3695;
            if (!_3689)
            {
                _3557 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3697 = _3557;
            _3559 = _3697;
            if (!_3689)
            {
                _3565 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3699 = _3565;
            _3567 = _3699;
            if (!_3689)
            {
                _3615 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3701 = _3615;
            bool _3703 = !_3689;
            _3617 = _3701;
            if (!_3703)
            {
                bool _3705 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3707 = isnan(_3016);
                bool _3709 = _3705 || _3707;
                bool _3711 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3713 = _3709 || _3711;
                if (!_3713)
                {
                    float _3715 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3717 = _3016 + _3715;
                    float _3719 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3721 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3719;
                    float _3723 = 1.0 / _3721;
                    float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3733 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3735 = _3733 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3739 = _3737 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3741 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3743 = _3741 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3745 = _3717 * _3723;
                    float _3747 = precise::clamp(_3745, 0.0, 1.0);
                    float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3751 = _3749 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3753 = fma(_3747, _3727, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3755 = fma(_3747, _3751, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3757 = fma(_3747, _3731, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3759 = fma(_3747, _3735, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3761 = fma(_3747, _3739, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3763 = fma(_3747, _3743, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3593 = _3755;
                    _3567 = _3761;
                    _3603 = _3753;
                    _3559 = _3759;
                    _3553 = _3757;
                    _3617 = _3763;
                    _3679 = true;
                }
                else
                {
                    _3593 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3567 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3603 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3559 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3553 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3617 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3679 = false;
    float _3765 = _3593;
    float _3767 = _3567;
    float _3769 = _3603;
    float _3771 = _3559;
    float _3773 = _3553;
    float _3775 = _3617;
    float _3777 = fma(_3531, -0.5, 0.5);
    float _3779 = precise::clamp(_3777, 0.0, 1.0);
    float _3781 = -_3765;
    float _3783 = _3781 + _3767;
    float _3785 = _3563 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3787 = -_3769;
    float _3789 = _3787 + _3771;
    out.m_82.x = 0.0;
    float _3791 = fma(_3779, _3783, _3765);
    float _3793 = fma(_3779, _3789, _3769);
    out.m_49.x = _3785;
    float _3795 = -_3773;
    float _3797 = _3795 + _3775;
    float _3799 = _3791 * 0.586610972881317138671875;
    bool _3801 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3803 = fma(_3779, _3797, _3773);
    float _3805 = fma(_3793, 0.298911988735198974609375, _3799);
    bool _3807 = _2992 > 0.0;
    bool _3809 = isnan(_2992);
    bool _3811 = _3807 || _3809;
    bool _3813 = isnan(0.0);
    bool _3815 = _3811 || _3813;
    float _3817 = fma(_3803, 0.114477999508380889892578125, _3805);
    float _3819 = -_3817;
    float _3821 = _3793 + _3819;
    float _3823 = -_3817;
    float _3825 = _3791 + _3823;
    float _3827 = -_3817;
    float _3829 = _3803 + _3827;
    float _3831 = fma(_3821, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3817);
    float _3833 = fma(_3825, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3817);
    float _3835 = fma(_3829, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3817);
    bool _3837 = !_3801;
    if (!_3837)
    {
        float _3839 = -_2932;
        float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3843 = -_2934;
        float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3847 = -_2936;
        float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3851 = _3841 * _3841;
        float _3853 = fma(_3845, _3845, _3851);
        float _3855 = fma(_3849, _3849, _3853);
        float _3857 = sqrt(_3855);
        float _3859 = rsqrt(_3855);
        float _3861 = -_3857;
        float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3865 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3867 = precise::clamp(_3865, 0.0, 1.0);
        float _3869 = _3845 * _3859;
        float _3871 = _3841 * _3859;
        float _3873 = abs(_3867);
        float _3875 = log2(_3873);
        float _3877 = _3849 * _3859;
        float _3879 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3881 = _3531 * _3871;
        float _3883 = -_3871;
        float _3885 = -_3879;
        float _3887 = fma(_3883, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3885);
        float _3889 = fma(_3529, _3869, _3881);
        float _3891 = -_3877;
        float _3893 = fma(_3891, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3887);
        float _3895 = fma(_3523, _3877, _3889);
        float _3897 = precise::clamp(_3895, 0.0, 1.0);
        float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3901 = _3893 + _3899;
        float _3903 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3905 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3907 = precise::clamp(_3905, 0.0, 1.0);
        float _3909 = exp2(_3903);
        float _3911 = _3909 * _3907;
        float _3913 = _3897 * _3911;
        float _3915 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3917 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3919 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3915;
        out.m_82.y = _3917;
        out.m_82.z = _3919;
    }
    out.m_84.x = _3831;
    out.m_84.y = _3833;
    out.m_84.z = _3835;
    if (_3815)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3921 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3921;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3679 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3978 = as_type<float>(_119);
        out.gl_Position.z = _3978;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    float _141 = _137;
    if (_133)
    {
        float _143 = float(_103);
        _139 = _143;
    }
    float _145 = _139;
    bool _147 = _137 >= _145;
    bool _149 = !_133;
    bool _151 = _147 || _149;
    if (_151)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _113;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4047 = as_type<float>(_157);
        out.gl_Position.z = _4047;
    }
    if (_151)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _163 = as_type<int>(_159) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_159) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _197;
    if (!_179)
    {
        float _181 = in.m_56.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_103);
        float _203 = 1.0 / _201;
        float _205 = _137 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _211 = int(_209);
    float _213 = float(_103);
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _217 = _215 != 0;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _221 = int(_219);
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _225 = float(_211);
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _229 = int(_227);
    float _231 = 0.0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_217)
    {
        float _235 = in.m_56.x;
        _231 = _235;
    }
    float _237 = _231;
    float _239 = _237;
    if (!_217)
    {
        float _241 = in.m_56.y;
        _239 = _241;
    }
    float _243 = _239;
    float _245 = float(_221);
    float _247 = 1.0 / _225;
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _251 = int(_249);
    float _253 = float(uint(_229));
    int _255 = ~_229;
    int _257 = _255 + 1;
    bool _259 = _229 == 0;
    float _261 = 1.0 / _245;
    float _263 = _247 * _137;
    float _265 = 1.0 / _253;
    float _267 = float(uint(_251));
    int _269 = ~_251;
    int _271 = _269 + 1;
    float _273 = trunc(_263);
    int _275 = int(_273);
    float _277 = _261 * _137;
    float _279 = 1.0 / _267;
    int _281 = as_type<int>(_265) + (-2);
    float _283 = trunc(_277);
    int _285 = int(_283);
    float _287 = float(uint(_275));
    float _289 = as_type<float>(_281) * _287;
    int _291 = as_type<int>(_279) + (-2);
    float _293 = 1.0 / _213;
    float _295 = float(uint(_285));
    float _297 = trunc(_289);
    float _299 = precise::max(_297, 0.0);
    uint _302 = uint(_299);
    float _304 = as_type<float>(_291) * _295;
    float _306 = in.m_56.x;
    float _308 = in.m_56.y;
    float _310 = in.m_56.z;
    float _312 = in.m_56.w;
    float _314 = trunc(_304);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    float _320 = _293 * _137;
    int _322 = _257 * int(_302);
    int _324 = _322 + _275;
    float _326 = _304;
    if (_217)
    {
        _326 = 1.0;
    }
    float _328 = _326;
    float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _332 = _328;
    if (!_217)
    {
        _332 = 7.345489978790283203125;
    }
    float _334 = _332;
    float _336 = float(uint(_324));
    int _338 = _271 * int(_318);
    int _340 = _338 + _285;
    float _342 = as_type<float>(_281) * _336;
    float _344 = float(uint(_340));
    float _346 = trunc(_342);
    float _348 = precise::max(_346, 0.0);
    uint _350 = uint(_348);
    float _352 = as_type<float>(_340);
    if (_217)
    {
        _352 = 1.0;
    }
    float _354 = _352;
    float _356 = _334 * _306;
    float _358 = _354;
    if (!_217)
    {
        _358 = 1.2345600128173828125;
    }
    float _360 = _358;
    float _362 = as_type<float>(_291) * _344;
    float _364 = _308 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _366 = _330 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _368 = _243 * _360;
    int _370 = ~_229;
    int _372 = _370 + 1;
    float _374 = trunc(_362);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    float _380 = float(_229);
    int _382 = int(_302) + int(_350);
    float _384 = floor(_368);
    int _386 = ~_251;
    int _388 = _386 + 1;
    int _390 = _372 * _382;
    int _392 = _390 + _275;
    float _394 = float(_275);
    float _396 = floor(_356);
    int _398 = int(_318) + int(_378);
    bool _400 = uint(_392) >= uint(_229);
    float _402 = float(_251);
    int _404 = _388 * _398;
    int _406 = _404 + _285;
    float _408 = float(_285);
    float _410 = -_384;
    float _412 = _368 + _410;
    bool _414 = !_400;
    int _416 = _414 ? 0 : (-1);
    bool _418 = uint(_406) >= uint(_251);
    float _420 = _412 * _402;
    int _422 = ~_382;
    int _424 = _422 + _416;
    int _426 = _424 + 1;
    float _428 = -_396;
    float _430 = _356 + _428;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _434 = _432 != 0;
    float _436 = _380 * _320;
    bool _438 = _394 >= _380;
    bool _440 = isnan(_394);
    bool _442 = _438 || _440;
    bool _444 = isnan(_380);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = _430 * _380;
    bool _452 = !_434;
    int _454 = _452 ? 0 : 1;
    bool _456 = _408 >= _402;
    bool _458 = isnan(_408);
    bool _460 = _456 || _458;
    bool _462 = isnan(_402);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = trunc(_448);
    int _470 = int(_468);
    int _472 = abs(_454);
    int _474 = _229 * _426;
    int _476 = _474 + _275;
    bool _478 = !_418;
    int _480 = _478 ? 0 : (-1);
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _484 = _482 != 0;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _492 = _490 != 0;
    float _494 = trunc(_466);
    int _496 = int(_494);
    int _498 = ~_398;
    int _500 = _498 + _480;
    int _502 = _500 + 1;
    float _504 = _402 * _320;
    bool _506 = !_488;
    int _508 = _506 ? 0 : 1;
    int _510 = _251 * _502;
    int _512 = _510 + _285;
    bool _514 = _251 == 0;
    float _516 = trunc(_436);
    int _518 = int(_516);
    int _520 = ~_470;
    int _522 = _520 + 1;
    int _524 = _522 + 1;
    bool _526 = !_259;
    int _528 = _526 ? _476 : (-1);
    int _530 = abs(_508);
    bool _532 = !_514;
    int _534 = _532 ? _512 : (-1);
    int _536 = _528 * _524;
    int _538 = ~_496;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = trunc(_450);
    int _546 = int(_544);
    int _548 = _229 + (-1);
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _552 = _550 != 0;
    int _554 = _534 * _542;
    bool _556 = !_484;
    int _558 = _556 ? 0 : 1;
    int _560 = _470 * _548;
    int _562 = _560 + _536;
    bool _564 = !_552;
    int _566 = _564 ? 0 : 1;
    float _568 = trunc(_420);
    int _570 = int(_568);
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _574 = _572 != 0;
    int _576 = _562 * _530;
    int _578 = abs(_566);
    int _580 = _251 + (-1);
    bool _582 = !_574;
    int _584 = _582 ? 0 : 1;
    int _586 = _546 * _472;
    int _588 = _586 + _275;
    int _590 = abs(_558);
    int _592 = _496 * _580;
    int _594 = _592 + _554;
    bool _596 = !_492;
    int _598 = _596 ? 0 : 1;
    float _600 = trunc(_504);
    int _602 = int(_600);
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _618 = _616 != 0;
    int _620 = _518 * _590;
    int _622 = _620 + _576;
    int _624 = abs(_598);
    int _626 = _570 * _578;
    int _628 = _626 + _285;
    int _630 = abs(_584);
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    bool _636 = !_606;
    int _638 = _636 ? 0 : 1;
    int _640 = _588 * _624;
    int _642 = _640 + _622;
    int _644 = abs(_634);
    bool _646 = !_614;
    int _648 = _646 ? 0 : 1;
    int _650 = _546 * _630;
    int _652 = _650 + _642;
    int _654 = abs(_638);
    bool _656 = !_618;
    int _658 = _656 ? 0 : 1;
    int _660 = abs(_648);
    int _662 = _594 * _644;
    int _664 = abs(_658);
    float _666 = float(uint(_652));
    int _668 = _602 * _654;
    int _670 = _668 + _662;
    float _672 = as_type<float>(_281) * _666;
    int _674 = ~_251;
    int _676 = _674 + 1;
    int _678 = _628 * _660;
    int _680 = _678 + _670;
    float _682 = float(uint(_588));
    bool _684 = _229 == 0;
    float _686 = trunc(_672);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = _570 * _664;
    int _694 = _692 + _680;
    float _696 = as_type<float>(_281) * _682;
    int _698 = ~_229;
    int _700 = _698 + 1;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _704 = _702 != 0;
    float _706 = float(uint(_694));
    float _708 = trunc(_696);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    float _714 = as_type<float>(_291) * _706;
    int _716 = ~_229;
    int _718 = _716 + 1;
    int _720 = _700 * int(_690);
    int _722 = _720 + _652;
    float _724 = trunc(_714);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    if (_704)
    {
        _233 = 0;
    }
    int _730 = _233;
    int _732 = _730;
    if (!_704)
    {
        _732 = 1;
    }
    int _734 = _732;
    float _736 = float(uint(_722));
    int _738 = _718 * int(_712);
    int _740 = _738 + _588;
    bool _742 = _308 > 0.5;
    float _744 = as_type<float>(_281) * _736;
    float _746 = float(uint(_740));
    float _748 = trunc(_744);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    int _754 = _676 * int(_728);
    int _756 = _754 + _694;
    float _758 = as_type<float>(_281) * _746;
    int _760 = ~_229;
    int _762 = _760 + 1;
    float _764 = float(uint(_756));
    float _766 = trunc(_758);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = ~_229;
    int _774 = _772 + 1;
    float _776 = as_type<float>(_291) * _764;
    int _778 = int(_690) + int(_752);
    float _780 = trunc(_776);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = float(uint(_628));
    int _788 = _762 * _778;
    int _790 = _788 + _652;
    int _792 = ~_251;
    int _794 = _792 + 1;
    float _796 = as_type<float>(_291) * _786;
    int _798 = int(_712) + int(_770);
    bool _800 = uint(_790) >= uint(_229);
    float _802 = trunc(_796);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = ~_251;
    int _810 = _808 + 1;
    bool _812 = !_800;
    int _814 = _812 ? 0 : (-1);
    int _816 = int(_728) + int(_784);
    int _818 = ~_778;
    int _820 = _818 + _814;
    int _822 = _820 + 1;
    int _824 = _229 * _822;
    int _826 = _824 + _652;
    int _828 = _774 * _798;
    int _830 = _828 + _588;
    int _832 = _810 * _816;
    int _834 = _832 + _694;
    bool _836 = !_684;
    int _838 = _836 ? _826 : (-1);
    int _840 = _794 * int(_806);
    int _842 = _840 + _628;
    bool _844 = uint(_830) >= uint(_229);
    bool _846 = uint(_834) >= uint(_251);
    int _848 = _838 & 3;
    bool _850 = _848 != 0;
    bool _852 = !_846;
    int _854 = _852 ? 0 : (-1);
    int _856 = _838 & 3;
    bool _858 = _856 != 0;
    bool _860 = !_844;
    int _862 = _860 ? 0 : (-1);
    bool _864 = uint(_848) > 1u;
    float _866 = float(uint(_842));
    int _868 = ~_816;
    int _870 = _868 + _854;
    int _872 = _870 + 1;
    int _874 = _858 ? 0 : 1;
    float _876 = as_type<float>(_291) * _866;
    bool _878 = _848 != 3;
    int _880 = _251 * _872;
    int _882 = _880 + _694;
    int _884 = ~_798;
    int _886 = _884 + _862;
    int _888 = _886 + 1;
    float _890 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _892 = int(_890);
    bool _894 = uint(_848) >= 2u;
    int _896 = ~_874;
    int _898 = _896 + 1;
    int _900 = _898 + 1;
    int _902 = _229 * _888;
    int _904 = _902 + _588;
    int _906 = _894 ? 0 : 1;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _910 = _908 != 0;
    float _912 = trunc(_876);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    bool _918 = !_514;
    int _920 = _918 ? _882 : (-1);
    int _922 = _900;
    if (!_864)
    {
        int _924 = ~_874;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    int _930 = _838 >> 31;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _934 = _932 != 0;
    bool _936 = !_910;
    int _938 = _936 ? 0 : 1;
    bool _940 = !_684;
    int _942 = _940 ? _904 : (-1);
    bool _944 = !_850;
    int _946 = _944 ? 0 : 1;
    int _948 = ~_906;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = _920 & 3;
    bool _956 = _954 != 0;
    int _958 = _920 & 3;
    bool _960 = _958 != 0;
    bool _962 = _848 != 3;
    int _964 = _952;
    if (_878)
    {
        int _966 = ~_906;
        int _968 = _966 + 1;
        _964 = _968;
    }
    int _970 = _964;
    float _972 = _306 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _974 = _312 > 0.5;
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _978 = int(_976);
    int _980 = _930 & 3;
    float _982 = -_223;
    float _984 = fma(_972, 2.0, _982);
    bool _986 = !_934;
    int _988 = _986 ? 0 : 1;
    bool _990 = uint(_954) > 1u;
    float _992 = -_137;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[76].x, _984);
    int _996 = _960 ? 0 : 1;
    bool _998 = !_962;
    int _1000 = _998 ? 0 : (-1);
    bool _1002 = !_956;
    int _1004 = _1002 ? 0 : 1;
    bool _1006 = uint(_954) >= 2u;
    bool _1008 = _954 != 3;
    bool _1010 = _954 != 3;
    int _1012 = _838 + _980;
    int _1014 = _920 >> 31;
    int _1016 = _1012 >> 2;
    int _1018 = _1014 & 3;
    int _1020 = _1016 << 4;
    int _1022 = _1020 + 368;
    int _1024 = ~_996;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    int _1030 = _1028;
    if (!_990)
    {
        int _1032 = ~_996;
        int _1034 = _1032 + 1;
        _1030 = _1034;
    }
    int _1036 = _1030;
    uint _1038 = uint(int(uint(_1022) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[int(_1048)][_1050];
    int _1054 = _920 + _1018;
    int _1056 = int(_806) + int(_916);
    int _1058 = ~_251;
    int _1060 = _1058 + 1;
    int _1062 = _1054 >> 2;
    int _1064 = _1006 ? 0 : 1;
    int _1066 = _1060 * _1056;
    int _1068 = _1066 + _628;
    int _1070 = _1062 << 4;
    int _1072 = _1070 + 512;
    int _1074 = ~_1064;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    int _1080 = _1078;
    if (_1008)
    {
        int _1082 = ~_1064;
        int _1084 = _1082 + 1;
        _1080 = _1084;
    }
    int _1086 = _1080;
    uint _1088 = uint(int(uint(_1072) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[int(_1098)][_1100];
    bool _1104 = uint(_1068) >= uint(_251);
    bool _1106 = !_1104;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1112 = _1110 != 0;
    int _1114 = _1072 + 8;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[int(_1126)][_1128];
    bool _1132 = !_1010;
    int _1134 = _1132 ? 0 : (-1);
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1146 = _1144 != 0;
    int _1148 = _1022 + 8;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
    int _1154 = int(_1150) & 3;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[int(_1152)][_1154];
    int _1158 = int(_1150) + 1;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    int _1162 = _1158 & 3;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[int(_1160)][_1162];
    float _1166 = in.m_46.x;
    float _1168 = in.m_46.y;
    float _1170 = in.m_46.z;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1176 = abs(_928);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1180 = fma(_364, -2.0, _1172);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1184 = ~_1176;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1192 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1196 = abs(_946);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1200 = _1188 * as_type<int>(_1052);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1206 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1208 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1210 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1212;
    float _1216 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1206);
    float _1218 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1208);
    float _1220 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1210);
    int _1222 = abs(_1036);
    out.m_58.x = _1190;
    out.m_58.y = _1192;
    out.m_58.z = _1194;
    out.m_58.w = _1198;
    int _1224 = abs(_1004);
    float _1226 = 1.0 / _1214;
    float _1228 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1216);
    float _1230 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1218);
    int _1232 = abs(_970);
    float _1234 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1220);
    float _1236 = 1.0 / _1204;
    int _1238 = ~_1056;
    int _1240 = _1238 + _1108;
    int _1242 = _1240 + 1;
    float _1244 = _310 * 2.0;
    int _1246 = ~_1224;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    int _1252 = ~_1222;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1258;
    int _1262 = ~_1196;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    int _1268 = _251 * _1242;
    int _1270 = _1268 + _628;
    int _1272 = _1256 * as_type<int>(_1102);
    float _1274 = float(uint(_978));
    float _1276 = 1.0 / _1260;
    int _1278 = ~_1232;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    int _1284 = _1266 * as_type<int>(_1044);
    int _1286 = _1284 + _1200;
    int _1288 = abs(_938);
    int _1290 = _1250 * as_type<int>(_1094);
    int _1292 = _1290 + _1272;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1298 = _1282 * as_type<int>(_1156);
    int _1300 = _1298 + _1286;
    int _1302 = abs(_1086);
    float _1304 = 1.0 / _1274;
    int _1306 = abs(_1000);
    int _1308 = abs(_1134);
    int _1310 = ~_1306;
    int _1312 = _1310 + 1;
    int _1314 = _1312 + 1;
    int _1316 = ~_1302;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = 1.0 / _1296;
    float _1324 = float(uint(_892));
    int _1326 = _1314 * as_type<int>(_1164);
    int _1328 = _1326 + _1300;
    int _1330 = ~_1288;
    int _1332 = _1330 + 1;
    int _1334 = _1332 + 1;
    int _1336 = _1320 * as_type<int>(_1122);
    int _1338 = _1336 + _1292;
    int _1340 = abs(_988);
    int _1342 = _1328 * _1334;
    int _1344 = ~_1308;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = 1.0 / _1324;
    int _1352 = as_type<int>(_1304) + (-2);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1354;
    int _1358 = abs(_978);
    int _1360 = _1348 * as_type<int>(_1130);
    int _1362 = _1360 + _1338;
    int _1364 = _942 * _1288;
    int _1366 = _1364 + _1342;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    int _1372 = ~_1340;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1380 = float(uint(_1366));
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1384 = float(uint(_1358));
    int _1386 = _1362 * _1376;
    bool _1388 = !_514;
    int _1390 = _1388 ? _1270 : (-1);
    float _1392 = as_type<float>(_1352) * _1380;
    float _1394 = 1.0 / _1384;
    float _1396 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1398 = _1390 * _1340;
    int _1400 = _1398 + _1386;
    int _1402 = as_type<int>(_1350) + (-2);
    float _1404 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1408 = ~_978;
    int _1410 = _1408 + 1;
    float _1412 = trunc(_1392);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    int _1418 = abs(_892);
    float _1420 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = float(uint(_1400));
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1426 = _207 + _1424;
    float _1428 = float(uint(_1418));
    out.m_60.x = _1396;
    out.m_60.y = _1420;
    out.m_60.z = _1404;
    float _1430 = as_type<float>(_1402) * _1422;
    int _1432 = abs(_1366);
    float _1434 = 1.0 / _1370;
    int _1436 = as_type<int>(_1394) + (-2);
    int _1438 = ~_892;
    int _1440 = _1438 + 1;
    float _1442 = 1.0 / _1428;
    int _1444 = _1410 * int(_1416);
    int _1446 = _1444 + _1366;
    float _1448 = float(uint(_1432));
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1452 = _207 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1456 = _207 + _1454;
    int _1458 = ~_1418;
    int _1460 = _1458 + 1;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1464 = float(uint(_1446));
    float _1466 = trunc(_1430);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    float _1472 = _1426 * _1226;
    int _1474 = abs(_1400);
    float _1476 = as_type<float>(_1436) * _1448;
    float _1478 = as_type<float>(_1352) * _1464;
    float _1480 = _1452 * _1276;
    float _1482 = float(uint(_1474));
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1486 = _207 + _1484;
    int _1488 = as_type<int>(_1442) + (-2);
    float _1490 = trunc(_1476);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    float _1496 = _1456 * _1236;
    float _1498 = _1486 * _1322;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1502 = _207 + _1500;
    float _1504 = as_type<float>(_1488) * _1482;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1508 = _207 + _1506;
    int _1510 = _1440 * int(_1470);
    int _1512 = _1510 + _1400;
    float _1514 = trunc(_1478);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    float _1520 = _1502 * _1434;
    int _1522 = ~_1418;
    int _1524 = _1522 + 1;
    float _1526 = float(uint(_1512));
    float _1528 = 1.0 / _1356;
    int _1530 = ~_1358;
    int _1532 = _1530 + 1;
    float _1534 = as_type<float>(_1402) * _1526;
    float _1536 = _306 * 2.0;
    int _1538 = ~_978;
    int _1540 = _1538 + 1;
    int _1542 = _1532 * int(_1494);
    int _1544 = _1542 + _1432;
    float _1546 = trunc(_1504);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = int(_1416) + int(_1518);
    float _1554 = _310 + _306;
    float _1556 = float(uint(_1544));
    float _1558 = _1508 * _1528;
    float _1560 = _306 + _308;
    float _1562 = trunc(_1534);
    float _1564 = precise::max(_1562, 0.0);
    uint _1566 = uint(_1564);
    float _1568 = as_type<float>(_1436) * _1556;
    float _1570 = _1554 + (-1.0);
    float _1572 = _1560 + (-1.0);
    int _1574 = _1524 * int(_1550);
    int _1576 = _1574 + _1474;
    float _1578 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1580 = trunc(_1568);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1588 = ~_892;
    int _1590 = _1588 + 1;
    float _1592 = float(uint(_1576));
    int _1594 = _1540 * _1552;
    int _1596 = _1594 + _1366;
    float _1598 = floor(_1536);
    float _1600 = as_type<float>(_1488) * _1592;
    bool _1602 = uint(_1596) >= uint(_978);
    bool _1604 = !_1602;
    int _1606 = _1604 ? 0 : (-1);
    float _1608 = trunc(_1600);
    float _1610 = precise::max(_1608, 0.0);
    uint _1612 = uint(_1610);
    int _1614 = int(_1470) + int(_1566);
    float _1616 = -_177;
    int _1618 = _974 ? as_type<int>(_1616) : as_type<int>(_177);
    bool _1620 = _306 > 0.5;
    int _1622 = _1590 * _1614;
    int _1624 = _1622 + _1400;
    int _1626 = ~_1358;
    int _1628 = _1626 + 1;
    float _1630 = -_173;
    int _1632 = _1620 ? as_type<int>(_1630) : as_type<int>(_173);
    bool _1634 = _1598 > 0.0;
    bool _1636 = _1598 >= 0.0;
    bool _1638 = isnan(_1598);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan(0.0);
    bool _1644 = _1640 || _1642;
    float _1646 = -_177;
    int _1648 = _742 ? as_type<int>(_1646) : as_type<int>(_177);
    bool _1650 = !_1112;
    float _1652 = _1650 ? _173 : as_type<float>(_1632);
    int _1654 = int(_1494) + int(_1584);
    float _1656 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1462);
    bool _1658 = uint(_1624) >= uint(_892);
    bool _1660 = _734 != 1;
    int _1662 = _1628 * _1654;
    int _1664 = _1662 + _1432;
    bool _1666 = !_1658;
    int _1668 = _1666 ? 0 : (-1);
    float _1670 = _310 + _308;
    bool _1672 = _310 > 0.5;
    float _1674 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1656);
    float _1676 = _1670 + (-1.0);
    int _1678 = int(_1550) + int(_1612);
    float _1680 = -_1674;
    float _1682 = _1680 + 1.0;
    float _1684 = -_173;
    int _1686 = _1672 ? as_type<int>(_1684) : as_type<int>(_173);
    int _1688 = _1460 * _1678;
    int _1690 = _1688 + _1474;
    bool _1692 = uint(_1664) >= uint(_1358);
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1696 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1698 = as_type<float>(_1358);
    float _1700 = as_type<float>(_1474);
    float _1702 = as_type<float>(_1540);
    float _1704 = as_type<float>(_1612);
    if (!_1660)
    {
        _1698 = _308;
    }
    float _1706 = _1698;
    float _1708 = _306 + (-0.5);
    float _1710 = _1706;
    if (!_1660)
    {
        _1700 = _308;
    }
    float _1712 = _1700;
    float _1714 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1694);
    float _1716 = _1712;
    if (_1660)
    {
        _1710 = _306;
    }
    float _1718 = _1710;
    float _1720 = _310 + (-0.5);
    if (_1660)
    {
        _1716 = _306;
    }
    float _1722 = _1716;
    float _1724 = _308 + (-0.5);
    if (!_1660)
    {
        _1702 = _310;
    }
    float _1726 = _1702;
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1730 = _1726;
    if (!_1660)
    {
        _1704 = _310;
    }
    float _1732 = _1704;
    float _1734 = _308 * 2.0;
    float _1736 = _1732;
    if (_1660)
    {
        _1730 = _308;
    }
    float _1738 = _1730;
    float _1740 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1714);
    if (_1660)
    {
        _1736 = _308;
    }
    float _1742 = _1736;
    int _1744 = _1366 ^ _978;
    float _1746 = floor(_1734);
    bool _1748 = !_1692;
    int _1750 = _1748 ? 0 : (-1);
    float _1752 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    uint _1754 = uint(int(uint(_1744) >> uint(31)));
    int _1756 = ~_1750;
    int _1758 = _1654 + _1756;
    int _1760 = _1758 + 1;
    int _1762 = ~int(_1754);
    int _1764 = _1762 + 1;
    float _1766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1768 = ~_1552;
    int _1770 = _1768 + _1606;
    int _1772 = _1770 + 1;
    int _1774 = ~_1614;
    int _1776 = _1774 + _1668;
    int _1778 = _1776 + 1;
    int _1780 = _1760 ^ _1764;
    int _1782 = _978 * _1772;
    int _1784 = _1782 + _1366;
    bool _1786 = uint(_1690) >= uint(_1418);
    int _1788 = _892 * _1778;
    int _1790 = _1788 + _1400;
    bool _1792 = !_1142;
    float _1794 = _1792 ? _177 : as_type<float>(_1648);
    float _1796 = floor(_1244);
    bool _1798 = !_1146;
    float _1800 = _1798 ? _173 : as_type<float>(_1686);
    bool _1802 = _978 == 0;
    bool _1804 = _978 == 0;
    bool _1806 = _892 == 0;
    int _1808 = ~_1764;
    int _1810 = _1808 + _1780;
    int _1812 = _1810 + 1;
    bool _1814 = !_1802;
    int _1816 = _1814 ? _1784 : (-1);
    bool _1818 = !_1806;
    int _1820 = _1818 ? _1790 : (-1);
    bool _1822 = !_1804;
    int _1824 = _1822 ? _1812 : (-1);
    int _1826 = _1644 ? 0 : 1;
    bool _1828 = !_1786;
    int _1830 = _1828 ? 0 : (-1);
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1834 = _1832 != 0;
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1838 = _1836 != 0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1842 = _1840 != 0;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1844;
    bool _1848 = _1746 > 0.0;
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1854 = _1746 >= 0.0;
    bool _1856 = isnan(_1746);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan(0.0);
    bool _1862 = _1858 || _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1864;
    int _1868 = ~_1826;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1878 = _1872;
    if (!_1634)
    {
        int _1880 = ~_1826;
        int _1882 = _1880 + 1;
        _1878 = _1882;
    }
    int _1884 = _1878;
    float _1886 = fma(_1866, _1472, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1888 = fma(_1876, _1496, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1890 = !_1834;
    float _1892 = _1890 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1894 = fma(_1852, _1496, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1896 = _1796 > 0.0;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1898;
    bool _1902 = _1796 >= 0.0;
    bool _1904 = isnan(_1796);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.0);
    bool _1910 = _1906 || _1908;
    float _1912 = fma(_1846, _1472, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1918;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1926;
    float _1930 = fma(_1916, _1498, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1932;
    float _1936 = fma(_1924, _1498, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1938 = fma(_1928, _1558, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1940 = fma(_1900, _1480, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1942 = fma(_1934, _1558, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _1944 = _1910 ? 0 : 1;
    float _1946 = fma(_1920, _1480, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1948 = _892 == 0;
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1952 = _1950 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _1954 = _1400 ^ _892;
    float _1956 = _1230 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1962 = _1228 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    uint _1964 = uint(int(uint(_1954) >> uint(31)));
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1968 = _1956 + _1966;
    float _1970 = fma(_1952, _1520, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1972 = fma(_1960, _1520, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _1974 = ~_1830;
    int _1976 = _1678 + _1974;
    int _1978 = _1976 + 1;
    float _1980 = _1234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1984 = _1962 + _1982;
    float _1986 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1988 = ~int(_1964);
    int _1990 = _1988 + 1;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1994 = _1980 + _1992;
    int _1996 = ~_1944;
    int _1998 = _1996 + 1;
    int _2000 = _1998 + 1;
    float _2002 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1986);
    int _2004 = _1978 ^ _1990;
    float _2006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2008 = _2000;
    float _2010 = _1892;
    if (!_1896)
    {
        int _2012 = ~_1944;
        int _2014 = _2012 + 1;
        _2008 = _2014;
    }
    int _2016 = _2008;
    float _2018 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2002);
    int _2020 = ~_1990;
    int _2022 = _2020 + _2004;
    int _2024 = _2022 + 1;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2028 = _2018 >= 0.0;
    float _2030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2032 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2026);
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2036 = !_1948;
    int _2038 = _2036 ? _2024 : (-1);
    float _2040 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2032);
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2044 = float(_1816);
    float _2046 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2034);
    int _2048 = abs(as_type<int>(_1892));
    float _2050 = -_2042;
    float _2052 = fma(_1728, 2.0, _2050);
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2056 = fma(_366, _2044, _994);
    int _2058 = _2016;
    if (_2028)
    {
        _2010 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2060 = _2010;
    float _2062 = float(_1820);
    float _2064 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2066 = -_137;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2052);
    float _2070 = fma(_1752, -2.0, _2054);
    float _2072 = float(_2016);
    if (_2028)
    {
        float _2074 = _2060 * 5.0;
        _2058 = as_type<int>(_2074);
    }
    int _2076 = _2058;
    float _2078 = fma(_2064, _2062, _2068);
    float _2080 = _1652 + 0.5;
    float _2082 = float(_2038);
    float _2084 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2070);
    bool _2086 = !_1138;
    float _2088 = _2086 ? _177 : as_type<float>(_1618);
    float _2090 = fma(_366, _2080, _2056);
    float _2092 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2094 = float(_1824);
    float _2096 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2098 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1180);
    float _2100 = -_2084;
    float _2102 = fma(_2092, _2082, _2100);
    float _2104 = _2088 + (-0.5);
    float _2106 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2046);
    if (_2028)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6880 = as_type<float>(_2076);
        out.gl_Position.z = _6880;
    }
    float _2108 = -_2098;
    float _2110 = fma(_2096, _2094, _2108);
    float _2112 = _1800 + 0.5;
    float _2114 = -_2092;
    float _2116 = fma(_2114, _2104, _2102);
    float _2118 = -_2106;
    float _2120 = _2118 + 1.0;
    float _2122 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2124 = log2(_2122);
    float _2126 = fma(_2064, _2112, _2078);
    float _2128 = float(_2048);
    float _2130 = fma(_2088, _2120, _2116);
    float _2132 = _1968 * _1968;
    bool _2134 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2136 = isnan(_207);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    if (_2028)
    {
        out.m_49.x = 0.0;
    }
    float _2146 = _1794 + (-0.5);
    float _2148 = -_1740;
    float _2150 = _2148 + 1.0;
    bool _2152 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2154 = isnan(_207);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = -_2144;
    float _2166 = _2164 + 1.0;
    float _2168 = -_2096;
    float _2170 = fma(_2168, _2146, _2110);
    float _2172 = -_2040;
    float _2174 = _2172 + 1.0;
    float _2176 = -_2150;
    float _2178 = fma(_1652, _2176, _2090);
    bool _2180 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2182 = isnan(_207);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2188 = _2184 || _2186;
    float _2190 = float(_2188);
    float _2192 = fma(_1794, _1682, _2170);
    float _2194 = -_2174;
    float _2196 = fma(_1800, _2194, _2126);
    float _2198 = fma(_1984, _1984, _2132);
    float _2200 = -_2162;
    float _2202 = _2200 + 1.0;
    float _2204 = -_2190;
    float _2206 = _2204 + 1.0;
    bool _2208 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2210 = isnan(_207);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2216 = _2212 || _2214;
    float _2218 = float(_2216);
    out.m_62.x = _2178;
    out.m_62.y = _2192;
    out.m_62.z = _2196;
    out.m_62.w = _2130;
    float _2220 = fma(_1994, _1994, _2198);
    float _2222 = _2162 * _2206;
    bool _2224 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2226 = isnan(_207);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = in.m_64.x;
    float _2238 = in.m_64.y;
    float _2240 = in.m_64.z;
    float _2242 = rsqrt(_2220);
    float _2244 = _2144 * _2202;
    bool _2246 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2248 = isnan(_207);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2254 = _2250 || _2252;
    float _2256 = float(_2254);
    float _2258 = _2234 * _2166;
    bool _2260 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2262 = isnan(_207);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = -_2234;
    float _2274 = _2272 + 1.0;
    float _2276 = -_2256;
    float _2278 = _2276 + 1.0;
    float _2280 = _2128 * _2072;
    float _2282 = _2124 * _137;
    float _2284 = -_2270;
    float _2286 = _2284 + 1.0;
    float _2288 = _2270 * _2278;
    bool _2290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2292 = isnan(1.0);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2298 = _2294 || _2296;
    float _2300 = exp2(_2282);
    float _2302 = _2256 * _2274;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2316 = 1.0 + _2314;
    float _2318 = _2218 * _2286;
    bool _2320 = !_1838;
    int _2322 = _2320 ? 0 : 1;
    float _2324 = _1968 * _2242;
    bool _2326 = !_1842;
    int _2328 = _2326 ? 0 : 1;
    float _2330 = _1984 * _2242;
    if (_2028)
    {
        return out;
    }
    float _2332 = -_2324;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1956);
    float _2336 = 1.0 / _2316;
    float _2338 = _1994 * _2242;
    float _2340 = -_2330;
    float _2342 = fma(_2340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2346 = _2334 + _2344;
    int _2348 = abs(_2322);
    float _2350 = -_2338;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1980);
    float _2354 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2356 = _2342 + _2354;
    float _2358 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2360 = -_2300;
    float _2362 = _2360 + 1.0;
    float _2364 = float(_1884);
    float _2366 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2368 = _2352 + _2366;
    float _2370 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2358);
    float _2372 = float(_2348);
    float _2374 = _2280 * (-2.0);
    float _2376 = _2312 ? _2362 : 0.0;
    float _2378 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2370);
    float _2380 = _1886 * _2318;
    float _2382 = _2372 * _2364;
    float _2384 = _1912 * _2318;
    float _2386 = _2342;
    if (_2298)
    {
        float _2388 = _2376 * _2336;
        _141 = _2388;
    }
    float _2390 = _141;
    float _2392 = fma(_2374, _2236, _2236);
    bool _2394 = _2378 >= 0.0;
    float _2396 = _2382 * (-2.0);
    float _2398 = fma(_1578, _2374, _1578);
    float _2400 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2392);
    int _2402 = abs(_2328);
    float _2404 = fma(_2396, _2238, _2238);
    float _2406 = fma(_1696, _2396, _1696);
    float _2408 = fma(_2398, _2390, _2400);
    float _2410 = -_2218;
    float _2412 = _2410 + 1.0;
    float _2414 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2404);
    int _2416 = _1862 ? 0 : 1;
    float _2418 = _2408 * 0.15915493667125701904296875;
    float _2420 = fma(_2406, _2390, _2414);
    float _2422 = _2396;
    if (_2394)
    {
        _2422 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2424 = _2422;
    float _2426 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2380);
    float _2428 = _2418 * 6.283185482025146484375;
    float _2430 = sin(_2428);
    int _2432 = ~_2416;
    int _2434 = _2432 + 1;
    int _2436 = _2434 + 1;
    int _2438 = as_type<int>(_2424);
    int _2440 = _2436;
    if (_2394)
    {
        out.m_49.x = 0.0;
    }
    if (_2394)
    {
        float _2442 = _2424 * 5.0;
        _2438 = as_type<int>(_2442);
    }
    int _2444 = _2438;
    if (!_1848)
    {
        int _2446 = ~_2416;
        int _2448 = _2446 + 1;
        _2440 = _2448;
    }
    int _2450 = _2440;
    float _2452 = _2418 * 6.283185482025146484375;
    float _2454 = cos(_2452);
    if (_2394)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7395 = as_type<float>(_2444);
        out.gl_Position.z = _7395;
    }
    float _2456 = float(_2450);
    float _2458 = float(_2402);
    if (_2394)
    {
        return out;
    }
    float _2460 = -_1956;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2464 = -_1962;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2468 = _2458 * _2456;
    float _2470 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2384);
    float _2472 = _2462 * _2462;
    float _2474 = -_1980;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2478 = _2468 * (-2.0);
    float _2480 = fma(_1888, _2288, _2426);
    float _2482 = fma(_2466, _2466, _2472);
    float _2484 = fma(_1894, _2288, _2470);
    float _2486 = fma(_2478, _2240, _2240);
    float _2488 = fma(_1940, _2302, _2480);
    float _2490 = fma(_2476, _2476, _2482);
    float _2492 = fma(_1946, _2302, _2484);
    float _2494 = in.m_66.x;
    float _2496 = in.m_66.y;
    float _2498 = fma(_1586, _2478, _1586);
    float _2500 = rsqrt(_2490);
    float _2502 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2486);
    float _2504 = -_2324;
    float _2506 = fma(_2504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1968);
    float _2508 = -_2330;
    float _2510 = fma(_2508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1984);
    float _2512 = fma(_1930, _2258, _2488);
    float _2514 = fma(_2498, _2390, _2502);
    float _2516 = _2506 * _2506;
    float _2518 = fma(_1936, _2258, _2492);
    float _2520 = -_2338;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1994);
    float _2524 = fma(_1938, _2244, _2512);
    float _2526 = fma(_2510, _2510, _2516);
    float _2528 = fma(_1942, _2244, _2518);
    float _2530 = _2420 * 0.15915493667125701904296875;
    float _2532 = fma(_1970, _2222, _2524);
    float _2534 = fma(_2522, _2522, _2526);
    float _2536 = fma(_1972, _2222, _2528);
    float _2538 = _2466 * _2500;
    float _2540 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[149].x, _2532);
    float _2542 = _2476 * _2500;
    float _2544 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[149].y, _2536);
    float _2546 = sqrt(_2534);
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2550 = _2538 * _2548;
    float _2552 = _2462 * _2500;
    float _2554 = _2544 * _2496;
    float _2556 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2558 = _2542 * _2556;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2562 = -_2550;
    float _2564 = fma(_2542, _2560, _2562);
    float _2566 = _2514 * 0.15915493667125701904296875;
    float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2570 = _2552 * _2568;
    float _2572 = _2530 * 6.283185482025146484375;
    float _2574 = sin(_2572);
    float _2576 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2578 = -_2558;
    float _2580 = fma(_2552, _2576, _2578);
    float _2582 = _2564 * _2564;
    float _2584 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2586 = -_2570;
    float _2588 = fma(_2538, _2584, _2586);
    float _2590 = _2540 * _2494;
    float _2592 = _2554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2594 = fma(_2580, _2580, _2582);
    float _2596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _2598 = _2530 * 6.283185482025146484375;
    float _2600 = cos(_2598);
    float _2602 = _2242 * _2546;
    float _2604 = fma(_2588, _2588, _2594);
    float _2606 = _2590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _2608 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2610 = isnan(0.5);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2616 = _2612 || _2614;
    float _2618 = _2602 * _2606;
    float _2620 = _2566 * 6.283185482025146484375;
    float _2622 = sin(_2620);
    float _2624 = _2430 * _2574;
    float _2626 = _2454 * _2574;
    bool _2628 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2630 = isnan(0.5);
    bool _2632 = _2628 || _2630;
    bool _2634 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2636 = _2632 || _2634;
    float _2638 = _2566 * 6.283185482025146484375;
    float _2640 = cos(_2638);
    float _2642 = _2454 * _2600;
    float _2644 = _2430 * _2600;
    float _2646 = rsqrt(_2604);
    float _2648 = fma(_2622, _2642, _2624);
    float _2650 = fma(_2622, _2624, _2642);
    float _2652 = _2602 * _2592;
    float _2654 = -_2626;
    float _2656 = fma(_2622, _2644, _2654);
    float _2658 = -_2644;
    float _2660 = fma(_2622, _2626, _2658);
    float _2662 = _2596 * _2652;
    float _2664 = _2454 * _2640;
    float _2666 = _2600 * _2640;
    float _2668 = _2430 * _2640;
    float _2670 = _2574 * _2640;
    float _2672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _2674 = _2664 * _2662;
    float _2676 = _2602 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2678 = _2676 * 0.5;
    float _2680 = -_2662;
    float _2682 = _2622 * _2680;
    float _2684 = _2672 * _2618;
    float _2686 = _2580 * _2646;
    float _2688 = _2564 * _2646;
    float _2690 = _2668 * _2662;
    float _2692 = fma(_2648, _2684, _2674);
    float _2694 = _2552 * _2686;
    float _2696 = _2588 * _2646;
    float _2698 = fma(_2666, _2684, _2682);
    float _2700 = fma(_2660, _2678, _2692);
    float _2702 = _2542 * _2688;
    float _2704 = -_2694;
    float _2706 = fma(_2538, _2688, _2704);
    float _2708 = fma(_2656, _2684, _2690);
    float _2710 = fma(_2670, _2678, _2698);
    float _2712 = -_2702;
    float _2714 = fma(_2552, _2696, _2712);
    float _2716 = _2706 * _2700;
    float _2718 = fma(_2650, _2678, _2708);
    float _2720 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2722 = _2714 * _2700;
    float _2724 = fma(_2696, _2710, _2716);
    float _2726 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2728 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2720);
    float _2730 = fma(_2686, _2710, _2722);
    float _2732 = fma(_2542, _2718, _2724);
    float _2734 = _2538 * _2696;
    float _2736 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2728);
    float _2738 = fma(_2538, _2718, _2730);
    float _2740 = _1980 + _2732;
    float _2742 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2726);
    float _2744 = _2736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2746 = _1962 + _2738;
    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2750 = _2740 + _2748;
    float _2752 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2742);
    float _2754 = 1.0 / _2744;
    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2758 = _2746 + _2756;
    float _2760 = _2750 * _2750;
    float _2762 = _2752 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2764 = -_2734;
    float _2766 = fma(_2542, _2686, _2764);
    float _2768 = fma(_2758, _2758, _2760);
    float _2770 = _2762 + _2744;
    float _2772 = _2766 * _2700;
    float _2774 = sqrt(_2768);
    float _2776 = fma(_2688, _2710, _2772);
    float _2778 = _2770 * _2754;
    float _2780 = _2778 * 0.5;
    float _2782 = fma(_2552, _2718, _2776);
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2786 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2784);
    float _2788 = _1956 + _2782;
    bool _2790 = _2774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2792 = 1.0 / _2786;
    float _2794 = _2772;
    float _2796 = _2746;
    float _2798 = _2740;
    float _2800 = _2710;
    float _2802 = _2754;
    if (!_2790)
    {
        _2794 = _2746;
    }
    float _2804 = _2794;
    float _2806 = _2804;
    if (!_2790)
    {
        _2796 = _2788;
    }
    float _2808 = _2796;
    bool _2810 = !_2790;
    float _2812 = _2808;
    if (!_2810)
    {
        float _2814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2818 = _2774 + _2816;
        float _2820 = rsqrt(_2768);
        float _2822 = _2818 * _2814;
        float _2824 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2826 = _2822 * 0.15915493667125701904296875;
        float _2828 = _2826 * 6.283185482025146484375;
        float _2830 = cos(_2828);
        float _2832 = _2826 * 6.283185482025146484375;
        float _2834 = sin(_2832);
        float _2836 = _2830 + (-1.0);
        float _2838 = fma(_2834, _2824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2840 = _2836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2842 = _2820 * _2838;
        float _2844 = fma(_2788, _2830, _2840);
        float _2846 = fma(_2758, _2842, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2848 = fma(_2750, _2842, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2798 = _2848;
        _2806 = _2846;
        _2812 = _2844;
        _2800 = _2842;
    }
    float _2850 = _2798;
    float _2852 = _2806;
    float _2854 = _2812;
    float _2856 = _2800;
    float _2858 = -_2338;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2850);
    float _2862 = -_2330;
    float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2852);
    float _2866 = -_2324;
    float _2868 = fma(_2866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2854);
    float _2870 = _2856;
    float _2872 = _2868;
    float _2874 = _2864;
    float _2876 = _2860;
    float _2878 = _2850;
    if (_2636)
    {
        _2870 = 1.0;
    }
    float _2880 = _2870;
    float _2882 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2884 = _2792 * _2882;
    float _2886 = _2880;
    if (!_2616)
    {
        float _2888 = _2346 * _2346;
        float _2890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2892 = -_1980;
        float _2894 = _2892 + _2850;
        float _2896 = -_1956;
        float _2898 = _2896 + _2854;
        float _2900 = fma(_2356, _2356, _2888);
        float _2902 = -_1962;
        float _2904 = _2902 + _2852;
        float _2906 = fma(_2368, _2368, _2900);
        float _2908 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2910 = sqrt(_2906);
        float _2912 = 1.0 / _2602;
        float _2914 = _2908 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2916 = precise::min(_2910, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2918 = _2916 * _2890;
        float _2920 = _2918 * _2912;
        float _2922 = _2914 * _2920;
        float _2924 = _2894 * _2920;
        float _2926 = fma(_2898, _2922, _2334);
        float _2928 = fma(_2904, _2922, _2342);
        float _2930 = fma(_2914, _2924, _2352);
        _2872 = _2926;
        _2874 = _2928;
        _2876 = _2930;
        _2878 = _2924;
    }
    float _2932 = _2872;
    float _2934 = _2874;
    float _2936 = _2876;
    float _2938 = _2878;
    float _2940 = _2938;
    if (!_2636)
    {
        float _2942 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2944 = _2942 * 0.15915493667125701904296875;
        float _2946 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2948 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2950 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2948;
        float _2952 = _2944 * 6.283185482025146484375;
        float _2954 = cos(_2952);
        float _2956 = _2946 * 0.15915493667125701904296875;
        float _2958 = _2944 * 6.283185482025146484375;
        float _2960 = sin(_2958);
        float _2962 = 1.0 / _2954;
        float _2964 = _2956 * 6.283185482025146484375;
        float _2966 = cos(_2964);
        float _2968 = _2960 * _2962;
        float _2970 = _2956 * 6.283185482025146484375;
        float _2972 = sin(_2970);
        float _2974 = _2966 * _2968;
        float _2976 = 1.0 / _2950;
        float _2978 = 1.0 / _2974;
        float _2980 = _2972 * _2978;
        float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2984 = fma(_2884, _2980, _2982);
        float _2986 = _2984 * _2976;
        float _2988 = precise::clamp(_2986, 0.0, 1.0);
        _2940 = _2944;
        _2886 = _2988;
    }
    float _2990 = _2940;
    float _2992 = _2886;
    float _2994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2996 = _2932 + _2994;
    float _2998 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3000 = _2934 + _2998;
    float _3002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3004 = _2936 + _3002;
    float _3006 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3008 = _2996 * _2996;
    float _3010 = fma(_3000, _3000, _3008);
    float _3012 = fma(_3004, _3004, _3010);
    float _3014 = rsqrt(_3012);
    float _3016 = sqrt(_3012);
    float _3018 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3020 = _3000 * _3018;
    float _3022 = _3004 * _3018;
    float _3024 = _3020 * _3020;
    float _3026 = _3022 * _3022;
    float _3028 = _3024 + _3026;
    float _3030 = sqrt(_3028);
    bool _3032 = _3030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3036 = _3030 + _3034;
    float _3038 = _3004;
    float _3040 = _3028;
    float _3042 = _3036;
    float _3044 = _3008;
    float _3046 = _3020;
    if (_3032)
    {
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3038 = _3048;
    }
    float _3050 = _3038;
    if (_3032)
    {
        float _3052 = rsqrt(_3028);
        _3040 = _3052;
    }
    float _3054 = _3040;
    float _3056 = _3054;
    if (_3032)
    {
        float _3058 = _3036 * _3050;
        _3042 = _3058;
    }
    float _3060 = _3042;
    if (_3032)
    {
        float _3062 = _3060 * 0.15915493667125701904296875;
        _3044 = _3062;
    }
    float _3064 = _3044;
    float _3066 = _3050;
    float _3068 = _3064;
    if (_3032)
    {
        float _3070 = _3064 * 6.283185482025146484375;
        float _3072 = sin(_3070);
        _3066 = _3072;
    }
    float _3074 = _3066;
    float _3076 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3078 = precise::max(0.0, _3076);
    float _3080 = _2990;
    float _3082 = _3078;
    if (_3032)
    {
        float _3084 = _3064 * 6.283185482025146484375;
        float _3086 = cos(_3084);
        _3080 = _3086;
    }
    float _3088 = _3080;
    float _3090 = -_3018;
    float _3092 = -_3078;
    float _3094 = fma(_2996, _3090, _3092);
    float _3096 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3032)
    {
        float _3098 = _3094 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3082 = _3098;
    }
    float _3100 = _3082;
    if (!_3032)
    {
        _3068 = _3094;
    }
    float _3102 = _3068;
    float _3104 = _3074;
    float _3106 = _3102;
    if (_3032)
    {
        float _3108 = fma(_3074, _3100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3104 = _3108;
    }
    float _3110 = _3104;
    float _3112 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3114 = _3110;
    if (_3032)
    {
        float _3116 = _3088 + (-1.0);
        _3096 = _3116;
    }
    float _3118 = _3096;
    if (_3032)
    {
        float _3120 = _3054 * _3110;
        _2802 = _3120;
    }
    float _3122 = _2802;
    if (!_3032)
    {
        _3114 = _3022;
    }
    float _3124 = _3114;
    float _3126 = _3124;
    if (_3032)
    {
        float _3128 = _3118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2386 = _3128;
    }
    float _3130 = _2386;
    float _3132 = _3130;
    if (_3032)
    {
        float _3134 = _3020 * _3122;
        _3046 = _3134;
    }
    float _3136 = _3046;
    if (!_3032)
    {
        _3056 = _3024;
    }
    float _3138 = _3056;
    float _3140 = _3138;
    if (_3032)
    {
        float _3142 = _3022 * _3122;
        _3126 = _3142;
    }
    float _3144 = _3126;
    if (_3032)
    {
        float _3146 = fma(_3094, _3088, _3130);
        _3106 = _3146;
    }
    float _3148 = _3106;
    if (_3032)
    {
        float _3150 = _3136 * _3136;
        _3140 = _3150;
    }
    float _3152 = _3140;
    if (!_3032)
    {
        _3132 = _3026;
    }
    float _3154 = _3132;
    float _3156 = _3154;
    if (_3032)
    {
        float _3158 = _3144 * _3144;
        _3156 = _3158;
    }
    float _3160 = _3156;
    float _3162 = fma(_3148, _3148, _3152);
    float _3164 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3166 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3168 = _3162 + _3160;
    float _3170 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3164);
    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3174 = fma(_3016, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3172);
    float _3176 = precise::clamp(_3174, 0.0, 1.0);
    float _3178 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3180 = rsqrt(_3168);
    float _3182 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3170);
    float _3184 = -_3176;
    float _3186 = _3184 + 1.0;
    float _3188 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3006);
    float _3190 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3192 = abs(_3186);
    float _3194 = log2(_3192);
    float _3196 = _3190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3198 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3166);
    float _3200 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3202 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3188);
    float _3204 = -_3196;
    float _3206 = fma(_3204, _3178, 1.0);
    float _3208 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3210 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3198);
    float _3212 = _3180 * _3136;
    float _3214 = _3180 * _3148;
    float _3216 = _3180 * _3144;
    float _3218 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3208);
    float _3220 = _3210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3222 = floor(_3112);
    float _3224 = _3212 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3226 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3218);
    float _3228 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3230 = _3202 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3232 = -_3224;
    float _3234 = fma(_3214, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3232);
    float _3236 = _3226 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3238 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3240 = floor(_3200);
    float _3242 = -_3216;
    float _3244 = fma(_3242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3234);
    float _3246 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3228);
    float _3248 = fma(_3244, -0.5, 0.5);
    float _3250 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3246);
    float _3252 = fma(_3244, 0.5, 0.5);
    float _3254 = log2(_3206);
    float _3256 = _3214 + 1.0;
    float _3258 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3250);
    float _3260 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3262 = exp2(_3238);
    float _3264 = -_3222;
    float _3266 = _3112 + _3264;
    float _3268 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3270 = -_3240;
    float _3272 = _3200 + _3270;
    float _3274 = fma(_3252, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3276 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3260);
    float _3278 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3268);
    float _3280 = 1.0 / _3258;
    float _3282 = fma(_3252, _3274, -0.212114393711090087890625);
    float _3284 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3278);
    float _3286 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3276);
    float _3288 = _3254 * 0.693147182464599609375;
    float _3290 = sqrt(_3248);
    float _3292 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3284);
    float _3294 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3286);
    float _3296 = -_3214;
    float _3298 = fma(_3262, _3256, _3296);
    float2 _8744 = float2(_3266, _3272);
    float _3300 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8744, float2(0.0), isnan(_8744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8744, float2(0.0), isnan(_8744)), level(0.0)).x;
    float _3302 = fma(_3252, _3282, 1.570728778839111328125);
    float _3304 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3306 = fma(_3298, 0.5, 0.5);
    float _3308 = _3292 * _3280;
    float _3310 = _3294 * _3280;
    float _3312 = fma(_3308, 0.5, 0.5);
    float _3314 = fma(_3310, -0.5, 0.5);
    float _3316 = _3290 * 0.636619746685028076171875;
    float _3318 = -_3302;
    float _3320 = fma(_3316, _3318, 1.0);
    float3 _8783 = float3(_3312, _3314, _3304);
    float _3322 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8783, float3(0.0), isnan(_8783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8783, float3(0.0), isnan(_8783)), level(0.0)).x;
    float3 _8794 = float3(_3312, _3314, _3304);
    float4 _3325 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8794, float3(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8794, float3(0.0), isnan(_8794)), level(0.0)).xyzw;
    float _3327 = _3325.x;
    float _3329 = _3325.y;
    float _3331 = _3325.z;
    float _3333 = _3325.w;
    float2 _8810 = float2(_3320, _3306);
    float3 _3337 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8810, float2(0.0), isnan(_8810)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8810, float2(0.0), isnan(_8810)), level(0.0)).xyz;
    float _3339 = _3337.x;
    float _3341 = _3337.y;
    float _3343 = _3337.z;
    float _3345 = abs(_2884);
    float _3347 = log2(_3345);
    float _3349 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3351 = _2664 * _2714;
    float _3353 = _2660 * _2714;
    float _3355 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3357 = _2648 * _2766;
    float _3359 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3361 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3363 = isnan(_3016);
    bool _3365 = _3361 || _3363;
    bool _3367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3369 = _3365 || _3367;
    float _3371 = _2648 * _2714;
    float _3373 = _2648 * _2706;
    float _3375 = _2660 * _2766;
    float _3377 = _2660 * _2706;
    float _3379 = fma(_2666, _2686, _3371);
    float _3381 = fma(_2666, _2696, _3373);
    float _3383 = fma(_3349, _3349, 1.0);
    float _3385 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3387 = fma(_2666, _2688, _3357);
    float _3389 = fma(_2670, _2686, _3353);
    float _3391 = exp2(_3355);
    float _3393 = fma(_2656, _2538, _3379);
    float _3395 = fma(_2656, _2552, _3387);
    float _3397 = in.m_68.x;
    float _3399 = exp2(_3385);
    float _3401 = rsqrt(_3383);
    float _3403 = -_3391;
    float _3405 = _3403 + 1.0;
    float _3407 = fma(_3399, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3409 = precise::clamp(_3407, 0.0, 1.0);
    float _3411 = _2664 * _2766;
    float _3413 = fma(_3409, -2.0, 3.0);
    float _3415 = _3409 * _3409;
    float _3417 = _3415 * _3413;
    float _3419 = _2664 * _2706;
    float _3421 = -_2622;
    float _3423 = fma(_3421, _2686, _3351);
    float _3425 = -_2622;
    float _3427 = fma(_3425, _2688, _3411);
    float _3429 = fma(_2670, _2688, _3375);
    float _3431 = -_2622;
    float _3433 = fma(_3431, _2696, _3419);
    float _3435 = -_3417;
    float _3437 = _3435 + 1.0;
    float _3439 = fma(_2670, _2696, _3377);
    bool _3441 = _2884 <= 8000.0;
    bool _3443 = isnan(_2884);
    bool _3445 = _3441 || _3443;
    bool _3447 = isnan(8000.0);
    bool _3449 = _3445 || _3447;
    float _3451 = float(_3449);
    float _3453 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3455 = fma(_3437, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3417);
    float _3457 = fma(_2668, _2538, _3423);
    float _3459 = fma(_2668, _2552, _3427);
    float _3461 = fma(_2668, _2542, _3433);
    float _3463 = fma(_2650, _2552, _3429);
    float _3465 = fma(_2650, _2538, _3389);
    float _3467 = _3349 * _3401;
    float _3469 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3453);
    float _3471 = _3451 * _3455;
    float _3473 = _3349 * _3457;
    float _3475 = -_3465;
    float _3477 = _3467 * _3475;
    float _3479 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3469);
    float _3481 = fma(_2650, _2542, _3439);
    float _3483 = fma(_2656, _2542, _3381);
    float _3485 = fma(_3401, _3457, _3477);
    float _3487 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3479);
    float _3489 = _3349 * _3459;
    float _3491 = _3349 * _3461;
    float _3493 = -_3463;
    float _3495 = _3467 * _3493;
    float _3497 = -_3481;
    float _3499 = _3467 * _3497;
    out.m_70.x = _3393;
    out.m_70.y = _3395;
    out.m_70.z = _3483;
    float _3501 = fma(_3359, _3483, _3491);
    float _3503 = fma(_3359, _3393, _3473);
    float _3505 = fma(_3401, _3459, _3495);
    float _3507 = fma(_3401, _3461, _3499);
    float _3509 = _3471 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3511 = _3487 + _3258;
    float _3513 = _3292 + _3258;
    float _3515 = fma(_3359, _3395, _3489);
    float _3517 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3519 = _3511 * 0.5;
    float _3521 = _3258 * 0.5;
    float _3523 = _3481 + _3501;
    float _3525 = _3513 * 0.5;
    float _3527 = fma(_3294, -0.5, _3521);
    out.gl_Position.x = _3292;
    out.gl_Position.y = _3294;
    out.gl_Position.z = _3487;
    out.gl_Position.w = _3258;
    float _3529 = _3465 + _3503;
    float _3531 = _3463 + _3515;
    out.m_72.x = _3525;
    out.m_72.y = _3527;
    out.m_72.z = _3519;
    out.m_72.w = _3258;
    out.m_74.x = _3529;
    out.m_74.y = _3531;
    out.m_74.z = _3523;
    out.m_76.x = _3485;
    out.m_76.y = _3505;
    out.m_76.z = _3507;
    float _3533 = -_3517;
    float _3535 = _3533 + 1.0;
    float _3537 = _3258;
    float _3539 = _3487;
    float _3541 = _3294;
    float _3543 = _3485;
    float _3545 = _3517;
    float _3547 = _3535;
    if (!_3369)
    {
        _3537 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3549 = _3537;
    float _3551 = _3549;
    float _3553 = _3549;
    if (!_3369)
    {
        _3539 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3555 = _3539;
    float _3557 = _3555;
    float _3559 = _3555;
    if (!_3369)
    {
        _3541 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3561 = _3541;
    float _3563 = _2992 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3565 = _3561;
    float _3567 = _3561;
    if (!_3369)
    {
        _3543 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3569 = _3543;
    float _3571 = -_3300;
    float _3573 = _3571 + 1.0;
    float _3575 = _3573 * _3509;
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = -_3577;
    float _3581 = fma(_3579, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3583 = _3581 * _3397;
    float _3585 = _3583 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3587 = _3517 * _3322;
    float _3589 = _3333 * _3535;
    float _3591 = _3569;
    float _3593 = _3569;
    if (!_3369)
    {
        _3545 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3595 = _3545;
    out.m_78.x = _3585;
    float _3597 = _3333 * _3587;
    float _3599 = _3343 * _3587;
    float _3601 = _3595;
    float _3603 = _3595;
    if (!_3369)
    {
        _3547 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3605 = _3547;
    float _3607 = fma(_3339, _3597, _3327);
    float _3609 = fma(_3341, _3597, _3329);
    float _3611 = fma(_3333, _3599, _3331);
    out.m_80.x = _3607;
    out.m_80.y = _3609;
    out.m_80.z = _3611;
    out.m_80.w = _3589;
    bool _3613 = !_3369;
    float _3615 = _3605;
    float _3617 = _3605;
    if (!_3613)
    {
        bool _3619 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3621 = isnan(_3016);
        bool _3623 = _3619 || _3621;
        bool _3625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3627 = _3623 || _3625;
        if (!_3627)
        {
            float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3631 = _3016 + _3629;
            float _3633 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3635 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3633;
            float _3637 = 1.0 / _3635;
            float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3647 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3649 = _3647 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3657 = _3655 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3659 = _3631 * _3637;
            float _3661 = precise::clamp(_3659, 0.0, 1.0);
            float _3663 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3665 = _3663 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3667 = fma(_3661, _3641, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3669 = fma(_3661, _3665, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3671 = fma(_3661, _3645, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3673 = fma(_3661, _3649, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3675 = fma(_3661, _3653, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3677 = fma(_3661, _3657, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3593 = _3669;
            _3567 = _3675;
            _3603 = _3667;
            _3559 = _3673;
            _3553 = _3671;
            _3617 = _3677;
            _3679 = true;
        }
        else
        {
            bool _3681 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3683 = isnan(_3016);
            bool _3685 = _3681 || _3683;
            bool _3687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3689 = _3685 || _3687;
            if (!_3689)
            {
                _3601 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3691 = _3601;
            _3603 = _3691;
            if (!_3689)
            {
                _3591 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3693 = _3591;
            _3593 = _3693;
            if (!_3689)
            {
                _3551 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3695 = _3551;
            _3553 = _3695;
            if (!_3689)
            {
                _3557 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3697 = _3557;
            _3559 = _3697;
            if (!_3689)
            {
                _3565 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3699 = _3565;
            _3567 = _3699;
            if (!_3689)
            {
                _3615 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3701 = _3615;
            bool _3703 = !_3689;
            _3617 = _3701;
            if (!_3703)
            {
                bool _3705 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3707 = isnan(_3016);
                bool _3709 = _3705 || _3707;
                bool _3711 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3713 = _3709 || _3711;
                if (!_3713)
                {
                    float _3715 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3717 = _3016 + _3715;
                    float _3719 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3721 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3719;
                    float _3723 = 1.0 / _3721;
                    float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3733 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3735 = _3733 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3739 = _3737 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3741 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3743 = _3741 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3745 = _3717 * _3723;
                    float _3747 = precise::clamp(_3745, 0.0, 1.0);
                    float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3751 = _3749 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3753 = fma(_3747, _3727, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3755 = fma(_3747, _3751, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3757 = fma(_3747, _3731, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3759 = fma(_3747, _3735, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3761 = fma(_3747, _3739, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3763 = fma(_3747, _3743, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3593 = _3755;
                    _3567 = _3761;
                    _3603 = _3753;
                    _3559 = _3759;
                    _3553 = _3757;
                    _3617 = _3763;
                    _3679 = true;
                }
                else
                {
                    _3593 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3567 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3603 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3559 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3553 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3617 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3679 = false;
    float _3765 = _3593;
    float _3767 = _3567;
    float _3769 = _3603;
    float _3771 = _3559;
    float _3773 = _3553;
    float _3775 = _3617;
    float _3777 = fma(_3531, -0.5, 0.5);
    float _3779 = precise::clamp(_3777, 0.0, 1.0);
    float _3781 = -_3765;
    float _3783 = _3781 + _3767;
    float _3785 = _3563 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3787 = -_3769;
    float _3789 = _3787 + _3771;
    out.m_82.x = 0.0;
    float _3791 = fma(_3779, _3783, _3765);
    float _3793 = fma(_3779, _3789, _3769);
    out.m_49.x = _3785;
    float _3795 = -_3773;
    float _3797 = _3795 + _3775;
    float _3799 = _3791 * 0.586610972881317138671875;
    bool _3801 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3803 = fma(_3779, _3797, _3773);
    float _3805 = fma(_3793, 0.298911988735198974609375, _3799);
    bool _3807 = _2992 > 0.0;
    bool _3809 = isnan(_2992);
    bool _3811 = _3807 || _3809;
    bool _3813 = isnan(0.0);
    bool _3815 = _3811 || _3813;
    float _3817 = fma(_3803, 0.114477999508380889892578125, _3805);
    float _3819 = -_3817;
    float _3821 = _3793 + _3819;
    float _3823 = -_3817;
    float _3825 = _3791 + _3823;
    float _3827 = -_3817;
    float _3829 = _3803 + _3827;
    float _3831 = fma(_3821, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3817);
    float _3833 = fma(_3825, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3817);
    float _3835 = fma(_3829, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3817);
    bool _3837 = !_3801;
    if (!_3837)
    {
        float _3839 = -_2932;
        float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3843 = -_2934;
        float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3847 = -_2936;
        float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3851 = _3841 * _3841;
        float _3853 = fma(_3845, _3845, _3851);
        float _3855 = fma(_3849, _3849, _3853);
        float _3857 = sqrt(_3855);
        float _3859 = rsqrt(_3855);
        float _3861 = -_3857;
        float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3865 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3867 = precise::clamp(_3865, 0.0, 1.0);
        float _3869 = _3845 * _3859;
        float _3871 = _3841 * _3859;
        float _3873 = abs(_3867);
        float _3875 = log2(_3873);
        float _3877 = _3849 * _3859;
        float _3879 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3881 = _3531 * _3871;
        float _3883 = -_3871;
        float _3885 = -_3879;
        float _3887 = fma(_3883, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3885);
        float _3889 = fma(_3529, _3869, _3881);
        float _3891 = -_3877;
        float _3893 = fma(_3891, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3887);
        float _3895 = fma(_3523, _3877, _3889);
        float _3897 = precise::clamp(_3895, 0.0, 1.0);
        float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3901 = _3893 + _3899;
        float _3903 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3905 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3907 = precise::clamp(_3905, 0.0, 1.0);
        float _3909 = exp2(_3903);
        float _3911 = _3909 * _3907;
        float _3913 = _3897 * _3911;
        float _3915 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3917 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3919 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3915;
        out.m_82.y = _3917;
        out.m_82.z = _3919;
    }
    out.m_84.x = _3831;
    out.m_84.y = _3833;
    out.m_84.z = _3835;
    if (_3815)
    {
        return out;
    }
    float _3921 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3921;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3679 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3978 = as_type<float>(_119);
        out.gl_Position.z = _3978;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    float _141 = _137;
    if (_133)
    {
        float _143 = float(_103);
        _139 = _143;
    }
    float _145 = _139;
    bool _147 = _137 >= _145;
    bool _149 = !_133;
    bool _151 = _147 || _149;
    if (_151)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _113;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4047 = as_type<float>(_157);
        out.gl_Position.z = _4047;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _163 = as_type<int>(_159) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_159) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _197;
    if (!_179)
    {
        float _181 = in.m_56.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_103);
        float _203 = 1.0 / _201;
        float _205 = _137 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _211 = int(_209);
    float _213 = float(_103);
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _217 = _215 != 0;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _221 = int(_219);
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _225 = float(_211);
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _229 = int(_227);
    float _231 = 0.0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_217)
    {
        float _235 = in.m_56.x;
        _231 = _235;
    }
    float _237 = _231;
    float _239 = _237;
    if (!_217)
    {
        float _241 = in.m_56.y;
        _239 = _241;
    }
    float _243 = _239;
    float _245 = float(_221);
    float _247 = 1.0 / _225;
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _251 = int(_249);
    float _253 = float(uint(_229));
    int _255 = ~_229;
    int _257 = _255 + 1;
    bool _259 = _229 == 0;
    float _261 = 1.0 / _245;
    float _263 = _247 * _137;
    float _265 = 1.0 / _253;
    float _267 = float(uint(_251));
    int _269 = ~_251;
    int _271 = _269 + 1;
    float _273 = trunc(_263);
    int _275 = int(_273);
    float _277 = _261 * _137;
    float _279 = 1.0 / _267;
    int _281 = as_type<int>(_265) + (-2);
    float _283 = trunc(_277);
    int _285 = int(_283);
    float _287 = float(uint(_275));
    float _289 = as_type<float>(_281) * _287;
    int _291 = as_type<int>(_279) + (-2);
    float _293 = 1.0 / _213;
    float _295 = float(uint(_285));
    float _297 = trunc(_289);
    float _299 = precise::max(_297, 0.0);
    uint _302 = uint(_299);
    float _304 = as_type<float>(_291) * _295;
    float _306 = in.m_56.x;
    float _308 = in.m_56.y;
    float _310 = in.m_56.z;
    float _312 = in.m_56.w;
    float _314 = trunc(_304);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    float _320 = _293 * _137;
    int _322 = _257 * int(_302);
    int _324 = _322 + _275;
    float _326 = _304;
    if (_217)
    {
        _326 = 1.0;
    }
    float _328 = _326;
    float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _332 = _328;
    if (!_217)
    {
        _332 = 7.345489978790283203125;
    }
    float _334 = _332;
    float _336 = float(uint(_324));
    int _338 = _271 * int(_318);
    int _340 = _338 + _285;
    float _342 = as_type<float>(_281) * _336;
    float _344 = float(uint(_340));
    float _346 = trunc(_342);
    float _348 = precise::max(_346, 0.0);
    uint _350 = uint(_348);
    float _352 = as_type<float>(_340);
    if (_217)
    {
        _352 = 1.0;
    }
    float _354 = _352;
    float _356 = _334 * _306;
    float _358 = _354;
    if (!_217)
    {
        _358 = 1.2345600128173828125;
    }
    float _360 = _358;
    float _362 = as_type<float>(_291) * _344;
    float _364 = _308 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _366 = _330 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _368 = _243 * _360;
    int _370 = ~_229;
    int _372 = _370 + 1;
    float _374 = trunc(_362);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    float _380 = float(_229);
    int _382 = int(_302) + int(_350);
    float _384 = floor(_368);
    int _386 = ~_251;
    int _388 = _386 + 1;
    int _390 = _372 * _382;
    int _392 = _390 + _275;
    float _394 = float(_275);
    float _396 = floor(_356);
    int _398 = int(_318) + int(_378);
    bool _400 = uint(_392) >= uint(_229);
    float _402 = float(_251);
    int _404 = _388 * _398;
    int _406 = _404 + _285;
    float _408 = float(_285);
    float _410 = -_384;
    float _412 = _368 + _410;
    bool _414 = !_400;
    int _416 = _414 ? 0 : (-1);
    bool _418 = uint(_406) >= uint(_251);
    float _420 = _412 * _402;
    int _422 = ~_382;
    int _424 = _422 + _416;
    int _426 = _424 + 1;
    float _428 = -_396;
    float _430 = _356 + _428;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _434 = _432 != 0;
    float _436 = _380 * _320;
    bool _438 = _394 >= _380;
    bool _440 = isnan(_394);
    bool _442 = _438 || _440;
    bool _444 = isnan(_380);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = _430 * _380;
    bool _452 = !_434;
    int _454 = _452 ? 0 : 1;
    bool _456 = _408 >= _402;
    bool _458 = isnan(_408);
    bool _460 = _456 || _458;
    bool _462 = isnan(_402);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = trunc(_448);
    int _470 = int(_468);
    int _472 = abs(_454);
    int _474 = _229 * _426;
    int _476 = _474 + _275;
    bool _478 = !_418;
    int _480 = _478 ? 0 : (-1);
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _484 = _482 != 0;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _492 = _490 != 0;
    float _494 = trunc(_466);
    int _496 = int(_494);
    int _498 = ~_398;
    int _500 = _498 + _480;
    int _502 = _500 + 1;
    float _504 = _402 * _320;
    bool _506 = !_488;
    int _508 = _506 ? 0 : 1;
    int _510 = _251 * _502;
    int _512 = _510 + _285;
    bool _514 = _251 == 0;
    float _516 = trunc(_436);
    int _518 = int(_516);
    int _520 = ~_470;
    int _522 = _520 + 1;
    int _524 = _522 + 1;
    bool _526 = !_259;
    int _528 = _526 ? _476 : (-1);
    int _530 = abs(_508);
    bool _532 = !_514;
    int _534 = _532 ? _512 : (-1);
    int _536 = _528 * _524;
    int _538 = ~_496;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = trunc(_450);
    int _546 = int(_544);
    int _548 = _229 + (-1);
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _552 = _550 != 0;
    int _554 = _534 * _542;
    bool _556 = !_484;
    int _558 = _556 ? 0 : 1;
    int _560 = _470 * _548;
    int _562 = _560 + _536;
    bool _564 = !_552;
    int _566 = _564 ? 0 : 1;
    float _568 = trunc(_420);
    int _570 = int(_568);
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _574 = _572 != 0;
    int _576 = _562 * _530;
    int _578 = abs(_566);
    int _580 = _251 + (-1);
    bool _582 = !_574;
    int _584 = _582 ? 0 : 1;
    int _586 = _546 * _472;
    int _588 = _586 + _275;
    int _590 = abs(_558);
    int _592 = _496 * _580;
    int _594 = _592 + _554;
    bool _596 = !_492;
    int _598 = _596 ? 0 : 1;
    float _600 = trunc(_504);
    int _602 = int(_600);
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _618 = _616 != 0;
    int _620 = _518 * _590;
    int _622 = _620 + _576;
    int _624 = abs(_598);
    int _626 = _570 * _578;
    int _628 = _626 + _285;
    int _630 = abs(_584);
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    bool _636 = !_606;
    int _638 = _636 ? 0 : 1;
    int _640 = _588 * _624;
    int _642 = _640 + _622;
    int _644 = abs(_634);
    bool _646 = !_614;
    int _648 = _646 ? 0 : 1;
    int _650 = _546 * _630;
    int _652 = _650 + _642;
    int _654 = abs(_638);
    bool _656 = !_618;
    int _658 = _656 ? 0 : 1;
    int _660 = abs(_648);
    int _662 = _594 * _644;
    int _664 = abs(_658);
    float _666 = float(uint(_652));
    int _668 = _602 * _654;
    int _670 = _668 + _662;
    float _672 = as_type<float>(_281) * _666;
    int _674 = ~_251;
    int _676 = _674 + 1;
    int _678 = _628 * _660;
    int _680 = _678 + _670;
    float _682 = float(uint(_588));
    bool _684 = _229 == 0;
    float _686 = trunc(_672);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = _570 * _664;
    int _694 = _692 + _680;
    float _696 = as_type<float>(_281) * _682;
    int _698 = ~_229;
    int _700 = _698 + 1;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _704 = _702 != 0;
    float _706 = float(uint(_694));
    float _708 = trunc(_696);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    float _714 = as_type<float>(_291) * _706;
    int _716 = ~_229;
    int _718 = _716 + 1;
    int _720 = _700 * int(_690);
    int _722 = _720 + _652;
    float _724 = trunc(_714);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    if (_704)
    {
        _233 = 0;
    }
    int _730 = _233;
    int _732 = _730;
    if (!_704)
    {
        _732 = 1;
    }
    int _734 = _732;
    float _736 = float(uint(_722));
    int _738 = _718 * int(_712);
    int _740 = _738 + _588;
    bool _742 = _308 > 0.5;
    float _744 = as_type<float>(_281) * _736;
    float _746 = float(uint(_740));
    float _748 = trunc(_744);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    int _754 = _676 * int(_728);
    int _756 = _754 + _694;
    float _758 = as_type<float>(_281) * _746;
    int _760 = ~_229;
    int _762 = _760 + 1;
    float _764 = float(uint(_756));
    float _766 = trunc(_758);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = ~_229;
    int _774 = _772 + 1;
    float _776 = as_type<float>(_291) * _764;
    int _778 = int(_690) + int(_752);
    float _780 = trunc(_776);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = float(uint(_628));
    int _788 = _762 * _778;
    int _790 = _788 + _652;
    int _792 = ~_251;
    int _794 = _792 + 1;
    float _796 = as_type<float>(_291) * _786;
    int _798 = int(_712) + int(_770);
    bool _800 = uint(_790) >= uint(_229);
    float _802 = trunc(_796);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = ~_251;
    int _810 = _808 + 1;
    bool _812 = !_800;
    int _814 = _812 ? 0 : (-1);
    int _816 = int(_728) + int(_784);
    int _818 = ~_778;
    int _820 = _818 + _814;
    int _822 = _820 + 1;
    int _824 = _229 * _822;
    int _826 = _824 + _652;
    int _828 = _774 * _798;
    int _830 = _828 + _588;
    int _832 = _810 * _816;
    int _834 = _832 + _694;
    bool _836 = !_684;
    int _838 = _836 ? _826 : (-1);
    int _840 = _794 * int(_806);
    int _842 = _840 + _628;
    bool _844 = uint(_830) >= uint(_229);
    bool _846 = uint(_834) >= uint(_251);
    int _848 = _838 & 3;
    bool _850 = _848 != 0;
    bool _852 = !_846;
    int _854 = _852 ? 0 : (-1);
    int _856 = _838 & 3;
    bool _858 = _856 != 0;
    bool _860 = !_844;
    int _862 = _860 ? 0 : (-1);
    bool _864 = uint(_848) > 1u;
    float _866 = float(uint(_842));
    int _868 = ~_816;
    int _870 = _868 + _854;
    int _872 = _870 + 1;
    int _874 = _858 ? 0 : 1;
    float _876 = as_type<float>(_291) * _866;
    bool _878 = _848 != 3;
    int _880 = _251 * _872;
    int _882 = _880 + _694;
    int _884 = ~_798;
    int _886 = _884 + _862;
    int _888 = _886 + 1;
    float _890 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _892 = int(_890);
    bool _894 = uint(_848) >= 2u;
    int _896 = ~_874;
    int _898 = _896 + 1;
    int _900 = _898 + 1;
    int _902 = _229 * _888;
    int _904 = _902 + _588;
    int _906 = _894 ? 0 : 1;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _910 = _908 != 0;
    float _912 = trunc(_876);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    bool _918 = !_514;
    int _920 = _918 ? _882 : (-1);
    int _922 = _900;
    if (!_864)
    {
        int _924 = ~_874;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    int _930 = _838 >> 31;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _934 = _932 != 0;
    bool _936 = !_910;
    int _938 = _936 ? 0 : 1;
    bool _940 = !_684;
    int _942 = _940 ? _904 : (-1);
    bool _944 = !_850;
    int _946 = _944 ? 0 : 1;
    int _948 = ~_906;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = _920 & 3;
    bool _956 = _954 != 0;
    int _958 = _920 & 3;
    bool _960 = _958 != 0;
    bool _962 = _848 != 3;
    int _964 = _952;
    if (_878)
    {
        int _966 = ~_906;
        int _968 = _966 + 1;
        _964 = _968;
    }
    int _970 = _964;
    float _972 = _306 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _974 = _312 > 0.5;
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _978 = int(_976);
    int _980 = _930 & 3;
    float _982 = -_223;
    float _984 = fma(_972, 2.0, _982);
    bool _986 = !_934;
    int _988 = _986 ? 0 : 1;
    bool _990 = uint(_954) > 1u;
    float _992 = -_137;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[76].x, _984);
    int _996 = _960 ? 0 : 1;
    bool _998 = !_962;
    int _1000 = _998 ? 0 : (-1);
    bool _1002 = !_956;
    int _1004 = _1002 ? 0 : 1;
    bool _1006 = uint(_954) >= 2u;
    bool _1008 = _954 != 3;
    bool _1010 = _954 != 3;
    int _1012 = _838 + _980;
    int _1014 = _920 >> 31;
    int _1016 = _1012 >> 2;
    int _1018 = _1014 & 3;
    int _1020 = _1016 << 4;
    int _1022 = _1020 + 368;
    int _1024 = ~_996;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    int _1030 = _1028;
    if (!_990)
    {
        int _1032 = ~_996;
        int _1034 = _1032 + 1;
        _1030 = _1034;
    }
    int _1036 = _1030;
    uint _1038 = uint(int(uint(_1022) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[int(_1048)][_1050];
    int _1054 = _920 + _1018;
    int _1056 = int(_806) + int(_916);
    int _1058 = ~_251;
    int _1060 = _1058 + 1;
    int _1062 = _1054 >> 2;
    int _1064 = _1006 ? 0 : 1;
    int _1066 = _1060 * _1056;
    int _1068 = _1066 + _628;
    int _1070 = _1062 << 4;
    int _1072 = _1070 + 512;
    int _1074 = ~_1064;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    int _1080 = _1078;
    if (_1008)
    {
        int _1082 = ~_1064;
        int _1084 = _1082 + 1;
        _1080 = _1084;
    }
    int _1086 = _1080;
    uint _1088 = uint(int(uint(_1072) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[int(_1098)][_1100];
    bool _1104 = uint(_1068) >= uint(_251);
    bool _1106 = !_1104;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1112 = _1110 != 0;
    int _1114 = _1072 + 8;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[int(_1126)][_1128];
    bool _1132 = !_1010;
    int _1134 = _1132 ? 0 : (-1);
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1146 = _1144 != 0;
    int _1148 = _1022 + 8;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
    int _1154 = int(_1150) & 3;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[int(_1152)][_1154];
    int _1158 = int(_1150) + 1;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    int _1162 = _1158 & 3;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[int(_1160)][_1162];
    float _1166 = in.m_46.x;
    float _1168 = in.m_46.y;
    float _1170 = in.m_46.z;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1176 = abs(_928);
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1180 = fma(_364, -2.0, _1172);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1184 = ~_1176;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1192 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1196 = abs(_946);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1200 = _1188 * as_type<int>(_1052);
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1206 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1208 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1210 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1212;
    float _1216 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1206);
    float _1218 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1208);
    float _1220 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1210);
    int _1222 = abs(_1036);
    out.m_58.x = _1190;
    out.m_58.y = _1192;
    out.m_58.z = _1194;
    out.m_58.w = _1198;
    int _1224 = abs(_1004);
    float _1226 = 1.0 / _1214;
    float _1228 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1216);
    float _1230 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1218);
    int _1232 = abs(_970);
    float _1234 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1220);
    float _1236 = 1.0 / _1204;
    int _1238 = ~_1056;
    int _1240 = _1238 + _1108;
    int _1242 = _1240 + 1;
    float _1244 = _310 * 2.0;
    int _1246 = ~_1224;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    int _1252 = ~_1222;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1258;
    int _1262 = ~_1196;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    int _1268 = _251 * _1242;
    int _1270 = _1268 + _628;
    int _1272 = _1256 * as_type<int>(_1102);
    float _1274 = float(uint(_978));
    float _1276 = 1.0 / _1260;
    int _1278 = ~_1232;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    int _1284 = _1266 * as_type<int>(_1044);
    int _1286 = _1284 + _1200;
    int _1288 = abs(_938);
    int _1290 = _1250 * as_type<int>(_1094);
    int _1292 = _1290 + _1272;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1298 = _1282 * as_type<int>(_1156);
    int _1300 = _1298 + _1286;
    int _1302 = abs(_1086);
    float _1304 = 1.0 / _1274;
    int _1306 = abs(_1000);
    int _1308 = abs(_1134);
    int _1310 = ~_1306;
    int _1312 = _1310 + 1;
    int _1314 = _1312 + 1;
    int _1316 = ~_1302;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = 1.0 / _1296;
    float _1324 = float(uint(_892));
    int _1326 = _1314 * as_type<int>(_1164);
    int _1328 = _1326 + _1300;
    int _1330 = ~_1288;
    int _1332 = _1330 + 1;
    int _1334 = _1332 + 1;
    int _1336 = _1320 * as_type<int>(_1122);
    int _1338 = _1336 + _1292;
    int _1340 = abs(_988);
    int _1342 = _1328 * _1334;
    int _1344 = ~_1308;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = 1.0 / _1324;
    int _1352 = as_type<int>(_1304) + (-2);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1354;
    int _1358 = abs(_978);
    int _1360 = _1348 * as_type<int>(_1130);
    int _1362 = _1360 + _1338;
    int _1364 = _942 * _1288;
    int _1366 = _1364 + _1342;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    int _1372 = ~_1340;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1380 = float(uint(_1366));
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1384 = float(uint(_1358));
    int _1386 = _1362 * _1376;
    bool _1388 = !_514;
    int _1390 = _1388 ? _1270 : (-1);
    float _1392 = as_type<float>(_1352) * _1380;
    float _1394 = 1.0 / _1384;
    float _1396 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1398 = _1390 * _1340;
    int _1400 = _1398 + _1386;
    int _1402 = as_type<int>(_1350) + (-2);
    float _1404 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1408 = ~_978;
    int _1410 = _1408 + 1;
    float _1412 = trunc(_1392);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    int _1418 = abs(_892);
    float _1420 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = float(uint(_1400));
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1426 = _207 + _1424;
    float _1428 = float(uint(_1418));
    out.m_60.x = _1396;
    out.m_60.y = _1420;
    out.m_60.z = _1404;
    float _1430 = as_type<float>(_1402) * _1422;
    int _1432 = abs(_1366);
    float _1434 = 1.0 / _1370;
    int _1436 = as_type<int>(_1394) + (-2);
    int _1438 = ~_892;
    int _1440 = _1438 + 1;
    float _1442 = 1.0 / _1428;
    int _1444 = _1410 * int(_1416);
    int _1446 = _1444 + _1366;
    float _1448 = float(uint(_1432));
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1452 = _207 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1456 = _207 + _1454;
    int _1458 = ~_1418;
    int _1460 = _1458 + 1;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1464 = float(uint(_1446));
    float _1466 = trunc(_1430);
    float _1468 = precise::max(_1466, 0.0);
    uint _1470 = uint(_1468);
    float _1472 = _1426 * _1226;
    int _1474 = abs(_1400);
    float _1476 = as_type<float>(_1436) * _1448;
    float _1478 = as_type<float>(_1352) * _1464;
    float _1480 = _1452 * _1276;
    float _1482 = float(uint(_1474));
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1486 = _207 + _1484;
    int _1488 = as_type<int>(_1442) + (-2);
    float _1490 = trunc(_1476);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    float _1496 = _1456 * _1236;
    float _1498 = _1486 * _1322;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1502 = _207 + _1500;
    float _1504 = as_type<float>(_1488) * _1482;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1508 = _207 + _1506;
    int _1510 = _1440 * int(_1470);
    int _1512 = _1510 + _1400;
    float _1514 = trunc(_1478);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    float _1520 = _1502 * _1434;
    int _1522 = ~_1418;
    int _1524 = _1522 + 1;
    float _1526 = float(uint(_1512));
    float _1528 = 1.0 / _1356;
    int _1530 = ~_1358;
    int _1532 = _1530 + 1;
    float _1534 = as_type<float>(_1402) * _1526;
    float _1536 = _306 * 2.0;
    int _1538 = ~_978;
    int _1540 = _1538 + 1;
    int _1542 = _1532 * int(_1494);
    int _1544 = _1542 + _1432;
    float _1546 = trunc(_1504);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = int(_1416) + int(_1518);
    float _1554 = _310 + _306;
    float _1556 = float(uint(_1544));
    float _1558 = _1508 * _1528;
    float _1560 = _306 + _308;
    float _1562 = trunc(_1534);
    float _1564 = precise::max(_1562, 0.0);
    uint _1566 = uint(_1564);
    float _1568 = as_type<float>(_1436) * _1556;
    float _1570 = _1554 + (-1.0);
    float _1572 = _1560 + (-1.0);
    int _1574 = _1524 * int(_1550);
    int _1576 = _1574 + _1474;
    float _1578 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1580 = trunc(_1568);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1588 = ~_892;
    int _1590 = _1588 + 1;
    float _1592 = float(uint(_1576));
    int _1594 = _1540 * _1552;
    int _1596 = _1594 + _1366;
    float _1598 = floor(_1536);
    float _1600 = as_type<float>(_1488) * _1592;
    bool _1602 = uint(_1596) >= uint(_978);
    bool _1604 = !_1602;
    int _1606 = _1604 ? 0 : (-1);
    float _1608 = trunc(_1600);
    float _1610 = precise::max(_1608, 0.0);
    uint _1612 = uint(_1610);
    int _1614 = int(_1470) + int(_1566);
    float _1616 = -_177;
    int _1618 = _974 ? as_type<int>(_1616) : as_type<int>(_177);
    bool _1620 = _306 > 0.5;
    int _1622 = _1590 * _1614;
    int _1624 = _1622 + _1400;
    int _1626 = ~_1358;
    int _1628 = _1626 + 1;
    float _1630 = -_173;
    int _1632 = _1620 ? as_type<int>(_1630) : as_type<int>(_173);
    bool _1634 = _1598 > 0.0;
    bool _1636 = _1598 >= 0.0;
    bool _1638 = isnan(_1598);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan(0.0);
    bool _1644 = _1640 || _1642;
    float _1646 = -_177;
    int _1648 = _742 ? as_type<int>(_1646) : as_type<int>(_177);
    bool _1650 = !_1112;
    float _1652 = _1650 ? _173 : as_type<float>(_1632);
    int _1654 = int(_1494) + int(_1584);
    float _1656 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1462);
    bool _1658 = uint(_1624) >= uint(_892);
    bool _1660 = _734 != 1;
    int _1662 = _1628 * _1654;
    int _1664 = _1662 + _1432;
    bool _1666 = !_1658;
    int _1668 = _1666 ? 0 : (-1);
    float _1670 = _310 + _308;
    bool _1672 = _310 > 0.5;
    float _1674 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1656);
    float _1676 = _1670 + (-1.0);
    int _1678 = int(_1550) + int(_1612);
    float _1680 = -_1674;
    float _1682 = _1680 + 1.0;
    float _1684 = -_173;
    int _1686 = _1672 ? as_type<int>(_1684) : as_type<int>(_173);
    int _1688 = _1460 * _1678;
    int _1690 = _1688 + _1474;
    bool _1692 = uint(_1664) >= uint(_1358);
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1696 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1698 = as_type<float>(_1358);
    float _1700 = as_type<float>(_1474);
    float _1702 = as_type<float>(_1540);
    float _1704 = as_type<float>(_1612);
    if (!_1660)
    {
        _1698 = _308;
    }
    float _1706 = _1698;
    float _1708 = _306 + (-0.5);
    float _1710 = _1706;
    if (!_1660)
    {
        _1700 = _308;
    }
    float _1712 = _1700;
    float _1714 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1694);
    float _1716 = _1712;
    if (_1660)
    {
        _1710 = _306;
    }
    float _1718 = _1710;
    float _1720 = _310 + (-0.5);
    if (_1660)
    {
        _1716 = _306;
    }
    float _1722 = _1716;
    float _1724 = _308 + (-0.5);
    if (!_1660)
    {
        _1702 = _310;
    }
    float _1726 = _1702;
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1730 = _1726;
    if (!_1660)
    {
        _1704 = _310;
    }
    float _1732 = _1704;
    float _1734 = _308 * 2.0;
    float _1736 = _1732;
    if (_1660)
    {
        _1730 = _308;
    }
    float _1738 = _1730;
    float _1740 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1714);
    if (_1660)
    {
        _1736 = _308;
    }
    float _1742 = _1736;
    int _1744 = _1366 ^ _978;
    float _1746 = floor(_1734);
    bool _1748 = !_1692;
    int _1750 = _1748 ? 0 : (-1);
    float _1752 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    uint _1754 = uint(int(uint(_1744) >> uint(31)));
    int _1756 = ~_1750;
    int _1758 = _1654 + _1756;
    int _1760 = _1758 + 1;
    int _1762 = ~int(_1754);
    int _1764 = _1762 + 1;
    float _1766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1768 = ~_1552;
    int _1770 = _1768 + _1606;
    int _1772 = _1770 + 1;
    int _1774 = ~_1614;
    int _1776 = _1774 + _1668;
    int _1778 = _1776 + 1;
    int _1780 = _1760 ^ _1764;
    int _1782 = _978 * _1772;
    int _1784 = _1782 + _1366;
    bool _1786 = uint(_1690) >= uint(_1418);
    int _1788 = _892 * _1778;
    int _1790 = _1788 + _1400;
    bool _1792 = !_1142;
    float _1794 = _1792 ? _177 : as_type<float>(_1648);
    float _1796 = floor(_1244);
    bool _1798 = !_1146;
    float _1800 = _1798 ? _173 : as_type<float>(_1686);
    bool _1802 = _978 == 0;
    bool _1804 = _978 == 0;
    bool _1806 = _892 == 0;
    int _1808 = ~_1764;
    int _1810 = _1808 + _1780;
    int _1812 = _1810 + 1;
    bool _1814 = !_1802;
    int _1816 = _1814 ? _1784 : (-1);
    bool _1818 = !_1806;
    int _1820 = _1818 ? _1790 : (-1);
    bool _1822 = !_1804;
    int _1824 = _1822 ? _1812 : (-1);
    int _1826 = _1644 ? 0 : 1;
    bool _1828 = !_1786;
    int _1830 = _1828 ? 0 : (-1);
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1834 = _1832 != 0;
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1838 = _1836 != 0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1842 = _1840 != 0;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1844;
    bool _1848 = _1746 > 0.0;
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1854 = _1746 >= 0.0;
    bool _1856 = isnan(_1746);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan(0.0);
    bool _1862 = _1858 || _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1864;
    int _1868 = ~_1826;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1878 = _1872;
    if (!_1634)
    {
        int _1880 = ~_1826;
        int _1882 = _1880 + 1;
        _1878 = _1882;
    }
    int _1884 = _1878;
    float _1886 = fma(_1866, _1472, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1888 = fma(_1876, _1496, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1890 = !_1834;
    float _1892 = _1890 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1894 = fma(_1852, _1496, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1896 = _1796 > 0.0;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1898;
    bool _1902 = _1796 >= 0.0;
    bool _1904 = isnan(_1796);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.0);
    bool _1910 = _1906 || _1908;
    float _1912 = fma(_1846, _1472, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1918;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1926;
    float _1930 = fma(_1916, _1498, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1932;
    float _1936 = fma(_1924, _1498, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1938 = fma(_1928, _1558, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1940 = fma(_1900, _1480, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1942 = fma(_1934, _1558, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _1944 = _1910 ? 0 : 1;
    float _1946 = fma(_1920, _1480, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1948 = _892 == 0;
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1952 = _1950 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _1954 = _1400 ^ _892;
    float _1956 = _1230 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1962 = _1228 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    uint _1964 = uint(int(uint(_1954) >> uint(31)));
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1968 = _1956 + _1966;
    float _1970 = fma(_1952, _1520, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1972 = fma(_1960, _1520, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _1974 = ~_1830;
    int _1976 = _1678 + _1974;
    int _1978 = _1976 + 1;
    float _1980 = _1234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1984 = _1962 + _1982;
    float _1986 = _1968 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1988 = ~int(_1964);
    int _1990 = _1988 + 1;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1994 = _1980 + _1992;
    int _1996 = ~_1944;
    int _1998 = _1996 + 1;
    int _2000 = _1998 + 1;
    float _2002 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1986);
    int _2004 = _1978 ^ _1990;
    float _2006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2008 = _2000;
    float _2010 = _1892;
    if (!_1896)
    {
        int _2012 = ~_1944;
        int _2014 = _2012 + 1;
        _2008 = _2014;
    }
    int _2016 = _2008;
    float _2018 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2002);
    int _2020 = ~_1990;
    int _2022 = _2020 + _2004;
    int _2024 = _2022 + 1;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2028 = _2018 >= 0.0;
    float _2030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2032 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2026);
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2036 = !_1948;
    int _2038 = _2036 ? _2024 : (-1);
    float _2040 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2032);
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2044 = float(_1816);
    float _2046 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2034);
    int _2048 = abs(as_type<int>(_1892));
    float _2050 = -_2042;
    float _2052 = fma(_1728, 2.0, _2050);
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2056 = fma(_366, _2044, _994);
    int _2058 = _2016;
    if (_2028)
    {
        _2010 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2060 = _2010;
    float _2062 = float(_1820);
    float _2064 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2066 = -_137;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2052);
    float _2070 = fma(_1752, -2.0, _2054);
    float _2072 = float(_2016);
    if (_2028)
    {
        float _2074 = _2060 * 5.0;
        _2058 = as_type<int>(_2074);
    }
    int _2076 = _2058;
    float _2078 = fma(_2064, _2062, _2068);
    float _2080 = _1652 + 0.5;
    float _2082 = float(_2038);
    float _2084 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2070);
    bool _2086 = !_1138;
    float _2088 = _2086 ? _177 : as_type<float>(_1618);
    float _2090 = fma(_366, _2080, _2056);
    float _2092 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2094 = float(_1824);
    float _2096 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2098 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1180);
    float _2100 = -_2084;
    float _2102 = fma(_2092, _2082, _2100);
    float _2104 = _2088 + (-0.5);
    float _2106 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2046);
    if (_2028)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6880 = as_type<float>(_2076);
        out.gl_Position.z = _6880;
    }
    float _2108 = -_2098;
    float _2110 = fma(_2096, _2094, _2108);
    float _2112 = _1800 + 0.5;
    float _2114 = -_2092;
    float _2116 = fma(_2114, _2104, _2102);
    float _2118 = -_2106;
    float _2120 = _2118 + 1.0;
    float _2122 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2124 = log2(_2122);
    float _2126 = fma(_2064, _2112, _2078);
    float _2128 = float(_2048);
    float _2130 = fma(_2088, _2120, _2116);
    float _2132 = _1968 * _1968;
    bool _2134 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2136 = isnan(_207);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    if (_2028)
    {
        out.m_49.x = 0.0;
    }
    float _2146 = _1794 + (-0.5);
    float _2148 = -_1740;
    float _2150 = _2148 + 1.0;
    bool _2152 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2154 = isnan(_207);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = -_2144;
    float _2166 = _2164 + 1.0;
    float _2168 = -_2096;
    float _2170 = fma(_2168, _2146, _2110);
    float _2172 = -_2040;
    float _2174 = _2172 + 1.0;
    float _2176 = -_2150;
    float _2178 = fma(_1652, _2176, _2090);
    bool _2180 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2182 = isnan(_207);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2188 = _2184 || _2186;
    float _2190 = float(_2188);
    float _2192 = fma(_1794, _1682, _2170);
    float _2194 = -_2174;
    float _2196 = fma(_1800, _2194, _2126);
    float _2198 = fma(_1984, _1984, _2132);
    float _2200 = -_2162;
    float _2202 = _2200 + 1.0;
    float _2204 = -_2190;
    float _2206 = _2204 + 1.0;
    bool _2208 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2210 = isnan(_207);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2216 = _2212 || _2214;
    float _2218 = float(_2216);
    out.m_62.x = _2178;
    out.m_62.y = _2192;
    out.m_62.z = _2196;
    out.m_62.w = _2130;
    float _2220 = fma(_1994, _1994, _2198);
    float _2222 = _2162 * _2206;
    bool _2224 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2226 = isnan(_207);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = in.m_64.x;
    float _2238 = in.m_64.y;
    float _2240 = in.m_64.z;
    float _2242 = rsqrt(_2220);
    float _2244 = _2144 * _2202;
    bool _2246 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2248 = isnan(_207);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2254 = _2250 || _2252;
    float _2256 = float(_2254);
    float _2258 = _2234 * _2166;
    bool _2260 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2262 = isnan(_207);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = -_2234;
    float _2274 = _2272 + 1.0;
    float _2276 = -_2256;
    float _2278 = _2276 + 1.0;
    float _2280 = _2128 * _2072;
    float _2282 = _2124 * _137;
    float _2284 = -_2270;
    float _2286 = _2284 + 1.0;
    float _2288 = _2270 * _2278;
    bool _2290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2292 = isnan(1.0);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2298 = _2294 || _2296;
    float _2300 = exp2(_2282);
    float _2302 = _2256 * _2274;
    bool _2304 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(0.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2316 = 1.0 + _2314;
    float _2318 = _2218 * _2286;
    bool _2320 = !_1838;
    int _2322 = _2320 ? 0 : 1;
    float _2324 = _1968 * _2242;
    bool _2326 = !_1842;
    int _2328 = _2326 ? 0 : 1;
    float _2330 = _1984 * _2242;
    if (_2028)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2332 = -_2324;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1956);
    float _2336 = 1.0 / _2316;
    float _2338 = _1994 * _2242;
    float _2340 = -_2330;
    float _2342 = fma(_2340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2346 = _2334 + _2344;
    int _2348 = abs(_2322);
    float _2350 = -_2338;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1980);
    float _2354 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2356 = _2342 + _2354;
    float _2358 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2360 = -_2300;
    float _2362 = _2360 + 1.0;
    float _2364 = float(_1884);
    float _2366 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2368 = _2352 + _2366;
    float _2370 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2358);
    float _2372 = float(_2348);
    float _2374 = _2280 * (-2.0);
    float _2376 = _2312 ? _2362 : 0.0;
    float _2378 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2370);
    float _2380 = _1886 * _2318;
    float _2382 = _2372 * _2364;
    float _2384 = _1912 * _2318;
    float _2386 = _2342;
    if (_2298)
    {
        float _2388 = _2376 * _2336;
        _141 = _2388;
    }
    float _2390 = _141;
    float _2392 = fma(_2374, _2236, _2236);
    bool _2394 = _2378 >= 0.0;
    float _2396 = _2382 * (-2.0);
    float _2398 = fma(_1578, _2374, _1578);
    float _2400 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2392);
    int _2402 = abs(_2328);
    float _2404 = fma(_2396, _2238, _2238);
    float _2406 = fma(_1696, _2396, _1696);
    float _2408 = fma(_2398, _2390, _2400);
    float _2410 = -_2218;
    float _2412 = _2410 + 1.0;
    float _2414 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2404);
    int _2416 = _1862 ? 0 : 1;
    float _2418 = _2408 * 0.15915493667125701904296875;
    float _2420 = fma(_2406, _2390, _2414);
    float _2422 = _2396;
    if (_2394)
    {
        _2422 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2424 = _2422;
    float _2426 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2380);
    float _2428 = _2418 * 6.283185482025146484375;
    float _2430 = sin(_2428);
    int _2432 = ~_2416;
    int _2434 = _2432 + 1;
    int _2436 = _2434 + 1;
    int _2438 = as_type<int>(_2424);
    int _2440 = _2436;
    if (_2394)
    {
        out.m_49.x = 0.0;
    }
    if (_2394)
    {
        float _2442 = _2424 * 5.0;
        _2438 = as_type<int>(_2442);
    }
    int _2444 = _2438;
    if (!_1848)
    {
        int _2446 = ~_2416;
        int _2448 = _2446 + 1;
        _2440 = _2448;
    }
    int _2450 = _2440;
    float _2452 = _2418 * 6.283185482025146484375;
    float _2454 = cos(_2452);
    if (_2394)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7395 = as_type<float>(_2444);
        out.gl_Position.z = _7395;
    }
    float _2456 = float(_2450);
    float _2458 = float(_2402);
    if (_2394)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2460 = -_1956;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2464 = -_1962;
    float _2466 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2468 = _2458 * _2456;
    float _2470 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2384);
    float _2472 = _2462 * _2462;
    float _2474 = -_1980;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2478 = _2468 * (-2.0);
    float _2480 = fma(_1888, _2288, _2426);
    float _2482 = fma(_2466, _2466, _2472);
    float _2484 = fma(_1894, _2288, _2470);
    float _2486 = fma(_2478, _2240, _2240);
    float _2488 = fma(_1940, _2302, _2480);
    float _2490 = fma(_2476, _2476, _2482);
    float _2492 = fma(_1946, _2302, _2484);
    float _2494 = in.m_66.x;
    float _2496 = in.m_66.y;
    float _2498 = fma(_1586, _2478, _1586);
    float _2500 = rsqrt(_2490);
    float _2502 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2486);
    float _2504 = -_2324;
    float _2506 = fma(_2504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1968);
    float _2508 = -_2330;
    float _2510 = fma(_2508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1984);
    float _2512 = fma(_1930, _2258, _2488);
    float _2514 = fma(_2498, _2390, _2502);
    float _2516 = _2506 * _2506;
    float _2518 = fma(_1936, _2258, _2492);
    float _2520 = -_2338;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1994);
    float _2524 = fma(_1938, _2244, _2512);
    float _2526 = fma(_2510, _2510, _2516);
    float _2528 = fma(_1942, _2244, _2518);
    float _2530 = _2420 * 0.15915493667125701904296875;
    float _2532 = fma(_1970, _2222, _2524);
    float _2534 = fma(_2522, _2522, _2526);
    float _2536 = fma(_1972, _2222, _2528);
    float _2538 = _2466 * _2500;
    float _2540 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[149].x, _2532);
    float _2542 = _2476 * _2500;
    float _2544 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[149].y, _2536);
    float _2546 = sqrt(_2534);
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2550 = _2538 * _2548;
    float _2552 = _2462 * _2500;
    float _2554 = _2544 * _2496;
    float _2556 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2558 = _2542 * _2556;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2562 = -_2550;
    float _2564 = fma(_2542, _2560, _2562);
    float _2566 = _2514 * 0.15915493667125701904296875;
    float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2570 = _2552 * _2568;
    float _2572 = _2530 * 6.283185482025146484375;
    float _2574 = sin(_2572);
    float _2576 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2578 = -_2558;
    float _2580 = fma(_2552, _2576, _2578);
    float _2582 = _2564 * _2564;
    float _2584 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2586 = -_2570;
    float _2588 = fma(_2538, _2584, _2586);
    float _2590 = _2540 * _2494;
    float _2592 = _2554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2594 = fma(_2580, _2580, _2582);
    float _2596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _2598 = _2530 * 6.283185482025146484375;
    float _2600 = cos(_2598);
    float _2602 = _2242 * _2546;
    float _2604 = fma(_2588, _2588, _2594);
    float _2606 = _2590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _2608 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2610 = isnan(0.5);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2616 = _2612 || _2614;
    float _2618 = _2602 * _2606;
    float _2620 = _2566 * 6.283185482025146484375;
    float _2622 = sin(_2620);
    float _2624 = _2430 * _2574;
    float _2626 = _2454 * _2574;
    bool _2628 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2630 = isnan(0.5);
    bool _2632 = _2628 || _2630;
    bool _2634 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2636 = _2632 || _2634;
    float _2638 = _2566 * 6.283185482025146484375;
    float _2640 = cos(_2638);
    float _2642 = _2454 * _2600;
    float _2644 = _2430 * _2600;
    float _2646 = rsqrt(_2604);
    float _2648 = fma(_2622, _2642, _2624);
    float _2650 = fma(_2622, _2624, _2642);
    float _2652 = _2602 * _2592;
    float _2654 = -_2626;
    float _2656 = fma(_2622, _2644, _2654);
    float _2658 = -_2644;
    float _2660 = fma(_2622, _2626, _2658);
    float _2662 = _2596 * _2652;
    float _2664 = _2454 * _2640;
    float _2666 = _2600 * _2640;
    float _2668 = _2430 * _2640;
    float _2670 = _2574 * _2640;
    float _2672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _2674 = _2664 * _2662;
    float _2676 = _2602 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2678 = _2676 * 0.5;
    float _2680 = -_2662;
    float _2682 = _2622 * _2680;
    float _2684 = _2672 * _2618;
    float _2686 = _2580 * _2646;
    float _2688 = _2564 * _2646;
    float _2690 = _2668 * _2662;
    float _2692 = fma(_2648, _2684, _2674);
    float _2694 = _2552 * _2686;
    float _2696 = _2588 * _2646;
    float _2698 = fma(_2666, _2684, _2682);
    float _2700 = fma(_2660, _2678, _2692);
    float _2702 = _2542 * _2688;
    float _2704 = -_2694;
    float _2706 = fma(_2538, _2688, _2704);
    float _2708 = fma(_2656, _2684, _2690);
    float _2710 = fma(_2670, _2678, _2698);
    float _2712 = -_2702;
    float _2714 = fma(_2552, _2696, _2712);
    float _2716 = _2706 * _2700;
    float _2718 = fma(_2650, _2678, _2708);
    float _2720 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2722 = _2714 * _2700;
    float _2724 = fma(_2696, _2710, _2716);
    float _2726 = _2334 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2728 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2720);
    float _2730 = fma(_2686, _2710, _2722);
    float _2732 = fma(_2542, _2718, _2724);
    float _2734 = _2538 * _2696;
    float _2736 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2728);
    float _2738 = fma(_2538, _2718, _2730);
    float _2740 = _1980 + _2732;
    float _2742 = fma(_2342, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2726);
    float _2744 = _2736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2746 = _1962 + _2738;
    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2750 = _2740 + _2748;
    float _2752 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2742);
    float _2754 = 1.0 / _2744;
    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2758 = _2746 + _2756;
    float _2760 = _2750 * _2750;
    float _2762 = _2752 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2764 = -_2734;
    float _2766 = fma(_2542, _2686, _2764);
    float _2768 = fma(_2758, _2758, _2760);
    float _2770 = _2762 + _2744;
    float _2772 = _2766 * _2700;
    float _2774 = sqrt(_2768);
    float _2776 = fma(_2688, _2710, _2772);
    float _2778 = _2770 * _2754;
    float _2780 = _2778 * 0.5;
    float _2782 = fma(_2552, _2718, _2776);
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2786 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2784);
    float _2788 = _1956 + _2782;
    bool _2790 = _2774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2792 = 1.0 / _2786;
    float _2794 = _2772;
    float _2796 = _2746;
    float _2798 = _2740;
    float _2800 = _2710;
    float _2802 = _2754;
    if (!_2790)
    {
        _2794 = _2746;
    }
    float _2804 = _2794;
    float _2806 = _2804;
    if (!_2790)
    {
        _2796 = _2788;
    }
    float _2808 = _2796;
    bool _2810 = !_2790;
    float _2812 = _2808;
    if (!_2810)
    {
        float _2814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2818 = _2774 + _2816;
        float _2820 = rsqrt(_2768);
        float _2822 = _2818 * _2814;
        float _2824 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2826 = _2822 * 0.15915493667125701904296875;
        float _2828 = _2826 * 6.283185482025146484375;
        float _2830 = cos(_2828);
        float _2832 = _2826 * 6.283185482025146484375;
        float _2834 = sin(_2832);
        float _2836 = _2830 + (-1.0);
        float _2838 = fma(_2834, _2824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2840 = _2836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2842 = _2820 * _2838;
        float _2844 = fma(_2788, _2830, _2840);
        float _2846 = fma(_2758, _2842, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2848 = fma(_2750, _2842, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2798 = _2848;
        _2806 = _2846;
        _2812 = _2844;
        _2800 = _2842;
    }
    float _2850 = _2798;
    float _2852 = _2806;
    float _2854 = _2812;
    float _2856 = _2800;
    float _2858 = -_2338;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2850);
    float _2862 = -_2330;
    float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2852);
    float _2866 = -_2324;
    float _2868 = fma(_2866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2854);
    float _2870 = _2856;
    float _2872 = _2868;
    float _2874 = _2864;
    float _2876 = _2860;
    float _2878 = _2850;
    if (_2636)
    {
        _2870 = 1.0;
    }
    float _2880 = _2870;
    float _2882 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2884 = _2792 * _2882;
    float _2886 = _2880;
    if (!_2616)
    {
        float _2888 = _2346 * _2346;
        float _2890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2892 = -_1980;
        float _2894 = _2892 + _2850;
        float _2896 = -_1956;
        float _2898 = _2896 + _2854;
        float _2900 = fma(_2356, _2356, _2888);
        float _2902 = -_1962;
        float _2904 = _2902 + _2852;
        float _2906 = fma(_2368, _2368, _2900);
        float _2908 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2910 = sqrt(_2906);
        float _2912 = 1.0 / _2602;
        float _2914 = _2908 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2916 = precise::min(_2910, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2918 = _2916 * _2890;
        float _2920 = _2918 * _2912;
        float _2922 = _2914 * _2920;
        float _2924 = _2894 * _2920;
        float _2926 = fma(_2898, _2922, _2334);
        float _2928 = fma(_2904, _2922, _2342);
        float _2930 = fma(_2914, _2924, _2352);
        _2872 = _2926;
        _2874 = _2928;
        _2876 = _2930;
        _2878 = _2924;
    }
    float _2932 = _2872;
    float _2934 = _2874;
    float _2936 = _2876;
    float _2938 = _2878;
    float _2940 = _2938;
    if (!_2636)
    {
        float _2942 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2944 = _2942 * 0.15915493667125701904296875;
        float _2946 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2948 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2950 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2948;
        float _2952 = _2944 * 6.283185482025146484375;
        float _2954 = cos(_2952);
        float _2956 = _2946 * 0.15915493667125701904296875;
        float _2958 = _2944 * 6.283185482025146484375;
        float _2960 = sin(_2958);
        float _2962 = 1.0 / _2954;
        float _2964 = _2956 * 6.283185482025146484375;
        float _2966 = cos(_2964);
        float _2968 = _2960 * _2962;
        float _2970 = _2956 * 6.283185482025146484375;
        float _2972 = sin(_2970);
        float _2974 = _2966 * _2968;
        float _2976 = 1.0 / _2950;
        float _2978 = 1.0 / _2974;
        float _2980 = _2972 * _2978;
        float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2984 = fma(_2884, _2980, _2982);
        float _2986 = _2984 * _2976;
        float _2988 = precise::clamp(_2986, 0.0, 1.0);
        _2940 = _2944;
        _2886 = _2988;
    }
    float _2990 = _2940;
    float _2992 = _2886;
    float _2994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2996 = _2932 + _2994;
    float _2998 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3000 = _2934 + _2998;
    float _3002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3004 = _2936 + _3002;
    float _3006 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3008 = _2996 * _2996;
    float _3010 = fma(_3000, _3000, _3008);
    float _3012 = fma(_3004, _3004, _3010);
    float _3014 = rsqrt(_3012);
    float _3016 = sqrt(_3012);
    float _3018 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3020 = _3000 * _3018;
    float _3022 = _3004 * _3018;
    float _3024 = _3020 * _3020;
    float _3026 = _3022 * _3022;
    float _3028 = _3024 + _3026;
    float _3030 = sqrt(_3028);
    bool _3032 = _3030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3036 = _3030 + _3034;
    float _3038 = _3004;
    float _3040 = _3028;
    float _3042 = _3036;
    float _3044 = _3008;
    float _3046 = _3020;
    if (_3032)
    {
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3038 = _3048;
    }
    float _3050 = _3038;
    if (_3032)
    {
        float _3052 = rsqrt(_3028);
        _3040 = _3052;
    }
    float _3054 = _3040;
    float _3056 = _3054;
    if (_3032)
    {
        float _3058 = _3036 * _3050;
        _3042 = _3058;
    }
    float _3060 = _3042;
    if (_3032)
    {
        float _3062 = _3060 * 0.15915493667125701904296875;
        _3044 = _3062;
    }
    float _3064 = _3044;
    float _3066 = _3050;
    float _3068 = _3064;
    if (_3032)
    {
        float _3070 = _3064 * 6.283185482025146484375;
        float _3072 = sin(_3070);
        _3066 = _3072;
    }
    float _3074 = _3066;
    float _3076 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3078 = precise::max(0.0, _3076);
    float _3080 = _2990;
    float _3082 = _3078;
    if (_3032)
    {
        float _3084 = _3064 * 6.283185482025146484375;
        float _3086 = cos(_3084);
        _3080 = _3086;
    }
    float _3088 = _3080;
    float _3090 = -_3018;
    float _3092 = -_3078;
    float _3094 = fma(_2996, _3090, _3092);
    float _3096 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3032)
    {
        float _3098 = _3094 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3082 = _3098;
    }
    float _3100 = _3082;
    if (!_3032)
    {
        _3068 = _3094;
    }
    float _3102 = _3068;
    float _3104 = _3074;
    float _3106 = _3102;
    if (_3032)
    {
        float _3108 = fma(_3074, _3100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3104 = _3108;
    }
    float _3110 = _3104;
    float _3112 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3114 = _3110;
    if (_3032)
    {
        float _3116 = _3088 + (-1.0);
        _3096 = _3116;
    }
    float _3118 = _3096;
    if (_3032)
    {
        float _3120 = _3054 * _3110;
        _2802 = _3120;
    }
    float _3122 = _2802;
    if (!_3032)
    {
        _3114 = _3022;
    }
    float _3124 = _3114;
    float _3126 = _3124;
    if (_3032)
    {
        float _3128 = _3118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2386 = _3128;
    }
    float _3130 = _2386;
    float _3132 = _3130;
    if (_3032)
    {
        float _3134 = _3020 * _3122;
        _3046 = _3134;
    }
    float _3136 = _3046;
    if (!_3032)
    {
        _3056 = _3024;
    }
    float _3138 = _3056;
    float _3140 = _3138;
    if (_3032)
    {
        float _3142 = _3022 * _3122;
        _3126 = _3142;
    }
    float _3144 = _3126;
    if (_3032)
    {
        float _3146 = fma(_3094, _3088, _3130);
        _3106 = _3146;
    }
    float _3148 = _3106;
    if (_3032)
    {
        float _3150 = _3136 * _3136;
        _3140 = _3150;
    }
    float _3152 = _3140;
    if (!_3032)
    {
        _3132 = _3026;
    }
    float _3154 = _3132;
    float _3156 = _3154;
    if (_3032)
    {
        float _3158 = _3144 * _3144;
        _3156 = _3158;
    }
    float _3160 = _3156;
    float _3162 = fma(_3148, _3148, _3152);
    float _3164 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3166 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3168 = _3162 + _3160;
    float _3170 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3164);
    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3174 = fma(_3016, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3172);
    float _3176 = precise::clamp(_3174, 0.0, 1.0);
    float _3178 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3180 = rsqrt(_3168);
    float _3182 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3170);
    float _3184 = -_3176;
    float _3186 = _3184 + 1.0;
    float _3188 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3006);
    float _3190 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3192 = abs(_3186);
    float _3194 = log2(_3192);
    float _3196 = _3190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3198 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3166);
    float _3200 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3202 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3188);
    float _3204 = -_3196;
    float _3206 = fma(_3204, _3178, 1.0);
    float _3208 = _2932 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3210 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3198);
    float _3212 = _3180 * _3136;
    float _3214 = _3180 * _3148;
    float _3216 = _3180 * _3144;
    float _3218 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3208);
    float _3220 = _3210 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3222 = floor(_3112);
    float _3224 = _3212 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3226 = fma(_2936, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3218);
    float _3228 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3230 = _3202 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3232 = -_3224;
    float _3234 = fma(_3214, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3232);
    float _3236 = _3226 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3238 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3240 = floor(_3200);
    float _3242 = -_3216;
    float _3244 = fma(_3242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3234);
    float _3246 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3228);
    float _3248 = fma(_3244, -0.5, 0.5);
    float _3250 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3246);
    float _3252 = fma(_3244, 0.5, 0.5);
    float _3254 = log2(_3206);
    float _3256 = _3214 + 1.0;
    float _3258 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3250);
    float _3260 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3262 = exp2(_3238);
    float _3264 = -_3222;
    float _3266 = _3112 + _3264;
    float _3268 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3270 = -_3240;
    float _3272 = _3200 + _3270;
    float _3274 = fma(_3252, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3276 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3260);
    float _3278 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3268);
    float _3280 = 1.0 / _3258;
    float _3282 = fma(_3252, _3274, -0.212114393711090087890625);
    float _3284 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3278);
    float _3286 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3276);
    float _3288 = _3254 * 0.693147182464599609375;
    float _3290 = sqrt(_3248);
    float _3292 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3284);
    float _3294 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3286);
    float _3296 = -_3214;
    float _3298 = fma(_3262, _3256, _3296);
    float2 _8744 = float2(_3266, _3272);
    float _3300 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8744, float2(0.0), isnan(_8744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8744, float2(0.0), isnan(_8744)), level(0.0)).x;
    float _3302 = fma(_3252, _3282, 1.570728778839111328125);
    float _3304 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3306 = fma(_3298, 0.5, 0.5);
    float _3308 = _3292 * _3280;
    float _3310 = _3294 * _3280;
    float _3312 = fma(_3308, 0.5, 0.5);
    float _3314 = fma(_3310, -0.5, 0.5);
    float _3316 = _3290 * 0.636619746685028076171875;
    float _3318 = -_3302;
    float _3320 = fma(_3316, _3318, 1.0);
    float3 _8783 = float3(_3312, _3314, _3304);
    float _3322 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8783, float3(0.0), isnan(_8783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8783, float3(0.0), isnan(_8783)), level(0.0)).x;
    float3 _8794 = float3(_3312, _3314, _3304);
    float4 _3325 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8794, float3(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8794, float3(0.0), isnan(_8794)), level(0.0)).xyzw;
    float _3327 = _3325.x;
    float _3329 = _3325.y;
    float _3331 = _3325.z;
    float _3333 = _3325.w;
    float2 _8810 = float2(_3320, _3306);
    float3 _3337 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8810, float2(0.0), isnan(_8810)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8810, float2(0.0), isnan(_8810)), level(0.0)).xyz;
    float _3339 = _3337.x;
    float _3341 = _3337.y;
    float _3343 = _3337.z;
    float _3345 = abs(_2884);
    float _3347 = log2(_3345);
    float _3349 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3351 = _2664 * _2714;
    float _3353 = _2660 * _2714;
    float _3355 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3357 = _2648 * _2766;
    float _3359 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3361 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3363 = isnan(_3016);
    bool _3365 = _3361 || _3363;
    bool _3367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3369 = _3365 || _3367;
    float _3371 = _2648 * _2714;
    float _3373 = _2648 * _2706;
    float _3375 = _2660 * _2766;
    float _3377 = _2660 * _2706;
    float _3379 = fma(_2666, _2686, _3371);
    float _3381 = fma(_2666, _2696, _3373);
    float _3383 = fma(_3349, _3349, 1.0);
    float _3385 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3387 = fma(_2666, _2688, _3357);
    float _3389 = fma(_2670, _2686, _3353);
    float _3391 = exp2(_3355);
    float _3393 = fma(_2656, _2538, _3379);
    float _3395 = fma(_2656, _2552, _3387);
    float _3397 = in.m_68.x;
    float _3399 = exp2(_3385);
    float _3401 = rsqrt(_3383);
    float _3403 = -_3391;
    float _3405 = _3403 + 1.0;
    float _3407 = fma(_3399, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3409 = precise::clamp(_3407, 0.0, 1.0);
    float _3411 = _2664 * _2766;
    float _3413 = fma(_3409, -2.0, 3.0);
    float _3415 = _3409 * _3409;
    float _3417 = _3415 * _3413;
    float _3419 = _2664 * _2706;
    float _3421 = -_2622;
    float _3423 = fma(_3421, _2686, _3351);
    float _3425 = -_2622;
    float _3427 = fma(_3425, _2688, _3411);
    float _3429 = fma(_2670, _2688, _3375);
    float _3431 = -_2622;
    float _3433 = fma(_3431, _2696, _3419);
    float _3435 = -_3417;
    float _3437 = _3435 + 1.0;
    float _3439 = fma(_2670, _2696, _3377);
    bool _3441 = _2884 <= 8000.0;
    bool _3443 = isnan(_2884);
    bool _3445 = _3441 || _3443;
    bool _3447 = isnan(8000.0);
    bool _3449 = _3445 || _3447;
    float _3451 = float(_3449);
    float _3453 = _3220 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3455 = fma(_3437, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3417);
    float _3457 = fma(_2668, _2538, _3423);
    float _3459 = fma(_2668, _2552, _3427);
    float _3461 = fma(_2668, _2542, _3433);
    float _3463 = fma(_2650, _2552, _3429);
    float _3465 = fma(_2650, _2538, _3389);
    float _3467 = _3349 * _3401;
    float _3469 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3453);
    float _3471 = _3451 * _3455;
    float _3473 = _3349 * _3457;
    float _3475 = -_3465;
    float _3477 = _3467 * _3475;
    float _3479 = fma(_3190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3469);
    float _3481 = fma(_2650, _2542, _3439);
    float _3483 = fma(_2656, _2542, _3381);
    float _3485 = fma(_3401, _3457, _3477);
    float _3487 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3479);
    float _3489 = _3349 * _3459;
    float _3491 = _3349 * _3461;
    float _3493 = -_3463;
    float _3495 = _3467 * _3493;
    float _3497 = -_3481;
    float _3499 = _3467 * _3497;
    out.m_70.x = _3393;
    out.m_70.y = _3395;
    out.m_70.z = _3483;
    float _3501 = fma(_3359, _3483, _3491);
    float _3503 = fma(_3359, _3393, _3473);
    float _3505 = fma(_3401, _3459, _3495);
    float _3507 = fma(_3401, _3461, _3499);
    float _3509 = _3471 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3511 = _3487 + _3258;
    float _3513 = _3292 + _3258;
    float _3515 = fma(_3359, _3395, _3489);
    float _3517 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3519 = _3511 * 0.5;
    float _3521 = _3258 * 0.5;
    float _3523 = _3481 + _3501;
    float _3525 = _3513 * 0.5;
    float _3527 = fma(_3294, -0.5, _3521);
    out.gl_Position.x = _3292;
    out.gl_Position.y = _3294;
    out.gl_Position.z = _3487;
    out.gl_Position.w = _3258;
    float _3529 = _3465 + _3503;
    float _3531 = _3463 + _3515;
    out.m_72.x = _3525;
    out.m_72.y = _3527;
    out.m_72.z = _3519;
    out.m_72.w = _3258;
    out.m_74.x = _3529;
    out.m_74.y = _3531;
    out.m_74.z = _3523;
    out.m_76.x = _3485;
    out.m_76.y = _3505;
    out.m_76.z = _3507;
    float _3533 = -_3517;
    float _3535 = _3533 + 1.0;
    float _3537 = _3258;
    float _3539 = _3487;
    float _3541 = _3294;
    float _3543 = _3485;
    float _3545 = _3517;
    float _3547 = _3535;
    if (!_3369)
    {
        _3537 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3549 = _3537;
    float _3551 = _3549;
    float _3553 = _3549;
    if (!_3369)
    {
        _3539 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3555 = _3539;
    float _3557 = _3555;
    float _3559 = _3555;
    if (!_3369)
    {
        _3541 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3561 = _3541;
    float _3563 = _2992 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3565 = _3561;
    float _3567 = _3561;
    if (!_3369)
    {
        _3543 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3569 = _3543;
    float _3571 = -_3300;
    float _3573 = _3571 + 1.0;
    float _3575 = _3573 * _3509;
    float _3577 = precise::clamp(_3575, 0.0, 1.0);
    float _3579 = -_3577;
    float _3581 = fma(_3579, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3583 = _3581 * _3397;
    float _3585 = _3583 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3587 = _3517 * _3322;
    float _3589 = _3333 * _3535;
    float _3591 = _3569;
    float _3593 = _3569;
    if (!_3369)
    {
        _3545 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3595 = _3545;
    out.m_78.x = _3585;
    float _3597 = _3333 * _3587;
    float _3599 = _3343 * _3587;
    float _3601 = _3595;
    float _3603 = _3595;
    if (!_3369)
    {
        _3547 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3605 = _3547;
    float _3607 = fma(_3339, _3597, _3327);
    float _3609 = fma(_3341, _3597, _3329);
    float _3611 = fma(_3333, _3599, _3331);
    out.m_80.x = _3607;
    out.m_80.y = _3609;
    out.m_80.z = _3611;
    out.m_80.w = _3589;
    bool _3613 = !_3369;
    float _3615 = _3605;
    float _3617 = _3605;
    if (!_3613)
    {
        bool _3619 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3621 = isnan(_3016);
        bool _3623 = _3619 || _3621;
        bool _3625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3627 = _3623 || _3625;
        if (!_3627)
        {
            float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3631 = _3016 + _3629;
            float _3633 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3635 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3633;
            float _3637 = 1.0 / _3635;
            float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3647 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3649 = _3647 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3657 = _3655 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3659 = _3631 * _3637;
            float _3661 = precise::clamp(_3659, 0.0, 1.0);
            float _3663 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3665 = _3663 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3667 = fma(_3661, _3641, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3669 = fma(_3661, _3665, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3671 = fma(_3661, _3645, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3673 = fma(_3661, _3649, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3675 = fma(_3661, _3653, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3677 = fma(_3661, _3657, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3593 = _3669;
            _3567 = _3675;
            _3603 = _3667;
            _3559 = _3673;
            _3553 = _3671;
            _3617 = _3677;
            _3679 = true;
        }
        else
        {
            bool _3681 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3683 = isnan(_3016);
            bool _3685 = _3681 || _3683;
            bool _3687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3689 = _3685 || _3687;
            if (!_3689)
            {
                _3601 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3691 = _3601;
            _3603 = _3691;
            if (!_3689)
            {
                _3591 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3693 = _3591;
            _3593 = _3693;
            if (!_3689)
            {
                _3551 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3695 = _3551;
            _3553 = _3695;
            if (!_3689)
            {
                _3557 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3697 = _3557;
            _3559 = _3697;
            if (!_3689)
            {
                _3565 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3699 = _3565;
            _3567 = _3699;
            if (!_3689)
            {
                _3615 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3701 = _3615;
            bool _3703 = !_3689;
            _3617 = _3701;
            if (!_3703)
            {
                bool _3705 = _3016 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3707 = isnan(_3016);
                bool _3709 = _3705 || _3707;
                bool _3711 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3713 = _3709 || _3711;
                if (!_3713)
                {
                    float _3715 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3717 = _3016 + _3715;
                    float _3719 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3721 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3719;
                    float _3723 = 1.0 / _3721;
                    float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3733 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3735 = _3733 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3737 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3739 = _3737 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3741 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3743 = _3741 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3745 = _3717 * _3723;
                    float _3747 = precise::clamp(_3745, 0.0, 1.0);
                    float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3751 = _3749 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3753 = fma(_3747, _3727, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3755 = fma(_3747, _3751, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3757 = fma(_3747, _3731, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3759 = fma(_3747, _3735, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3761 = fma(_3747, _3739, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3763 = fma(_3747, _3743, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3593 = _3755;
                    _3567 = _3761;
                    _3603 = _3753;
                    _3559 = _3759;
                    _3553 = _3757;
                    _3617 = _3763;
                    _3679 = true;
                }
                else
                {
                    _3593 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3567 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3603 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3559 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3553 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3617 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3679 = false;
    float _3765 = _3593;
    float _3767 = _3567;
    float _3769 = _3603;
    float _3771 = _3559;
    float _3773 = _3553;
    float _3775 = _3617;
    float _3777 = fma(_3531, -0.5, 0.5);
    float _3779 = precise::clamp(_3777, 0.0, 1.0);
    float _3781 = -_3765;
    float _3783 = _3781 + _3767;
    float _3785 = _3563 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3787 = -_3769;
    float _3789 = _3787 + _3771;
    out.m_82.x = 0.0;
    float _3791 = fma(_3779, _3783, _3765);
    float _3793 = fma(_3779, _3789, _3769);
    out.m_49.x = _3785;
    float _3795 = -_3773;
    float _3797 = _3795 + _3775;
    float _3799 = _3791 * 0.586610972881317138671875;
    bool _3801 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3803 = fma(_3779, _3797, _3773);
    float _3805 = fma(_3793, 0.298911988735198974609375, _3799);
    bool _3807 = _2992 > 0.0;
    bool _3809 = isnan(_2992);
    bool _3811 = _3807 || _3809;
    bool _3813 = isnan(0.0);
    bool _3815 = _3811 || _3813;
    float _3817 = fma(_3803, 0.114477999508380889892578125, _3805);
    float _3819 = -_3817;
    float _3821 = _3793 + _3819;
    float _3823 = -_3817;
    float _3825 = _3791 + _3823;
    float _3827 = -_3817;
    float _3829 = _3803 + _3827;
    float _3831 = fma(_3821, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3817);
    float _3833 = fma(_3825, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3817);
    float _3835 = fma(_3829, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3817);
    bool _3837 = !_3801;
    if (!_3837)
    {
        float _3839 = -_2932;
        float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3843 = -_2934;
        float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3847 = -_2936;
        float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3851 = _3841 * _3841;
        float _3853 = fma(_3845, _3845, _3851);
        float _3855 = fma(_3849, _3849, _3853);
        float _3857 = sqrt(_3855);
        float _3859 = rsqrt(_3855);
        float _3861 = -_3857;
        float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3865 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3867 = precise::clamp(_3865, 0.0, 1.0);
        float _3869 = _3845 * _3859;
        float _3871 = _3841 * _3859;
        float _3873 = abs(_3867);
        float _3875 = log2(_3873);
        float _3877 = _3849 * _3859;
        float _3879 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3881 = _3531 * _3871;
        float _3883 = -_3871;
        float _3885 = -_3879;
        float _3887 = fma(_3883, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3885);
        float _3889 = fma(_3529, _3869, _3881);
        float _3891 = -_3877;
        float _3893 = fma(_3891, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3887);
        float _3895 = fma(_3523, _3877, _3889);
        float _3897 = precise::clamp(_3895, 0.0, 1.0);
        float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3901 = _3893 + _3899;
        float _3903 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3905 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3907 = precise::clamp(_3905, 0.0, 1.0);
        float _3909 = exp2(_3903);
        float _3911 = _3909 * _3907;
        float _3913 = _3897 * _3911;
        float _3915 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3917 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3919 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3915;
        out.m_82.y = _3917;
        out.m_82.z = _3919;
    }
    out.m_84.x = _3831;
    out.m_84.y = _3833;
    out.m_84.z = _3835;
    if (_3815)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3921 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3921;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

