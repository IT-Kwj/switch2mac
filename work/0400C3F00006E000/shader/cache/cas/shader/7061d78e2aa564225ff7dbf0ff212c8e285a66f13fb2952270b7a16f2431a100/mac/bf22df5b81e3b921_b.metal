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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
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
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_90 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_53 [[user(locn13)]];
    float4 m_66 [[user(locn14)]];
    float4 m_60 [[user(locn15)]];
    float4 m_76 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5097 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5344 = as_type<float>(_125);
        out.gl_Position.z = _5344;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    if (_141)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5417 = as_type<float>(_163);
        out.gl_Position.z = _5417;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _167 = int(_165);
    float _169 = in.m_51.y;
    float _171 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_51.z;
    float _175 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _177 = int(_175);
    float _179 = in.m_51.w;
    float _181 = float(_167);
    float _183 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _185 = int(_183);
    float _187 = float(uint(_177));
    float _189 = 1.0 / _181;
    int _191 = ~_177;
    int _193 = _191 + 1;
    float _195 = 1.0 / _187;
    float _197 = float(_185);
    float _199 = _145 * _189;
    float _201 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _203 = int(_201);
    int _205 = as_type<int>(_195) + (-2);
    float _207 = trunc(_199);
    int _209 = int(_207);
    bool _211 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _215 = _211 || _213;
    bool _217 = isnan(1.0);
    bool _219 = _215 || _217;
    float _221 = 1.0 / _197;
    float _223 = float(uint(_203));
    int _225 = ~_203;
    int _227 = _225 + 1;
    float _229 = float(uint(_209));
    float _231 = 1.0 / _223;
    float _233 = 0.0;
    float _235 = _171;
    if (!_219)
    {
        float _237 = _171 * _171;
        float _239 = _237 * 0.5;
        _233 = _239;
    }
    float _241 = _233;
    float _243 = as_type<float>(_205) * _229;
    float _245 = _241;
    if (!_219)
    {
        float _247 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _247;
    }
    float _249 = _245;
    float _251 = _145 * _221;
    float _253 = trunc(_243);
    float _255 = precise::max(_253, 0.0);
    uint _258 = uint(_255);
    float _260 = as_type<float>(int(gl_VertexIndex));
    float _262 = trunc(_251);
    int _264 = int(_262);
    int _266 = as_type<int>(_231) + (-2);
    int _268 = _193 * int(_258);
    int _270 = _268 + _209;
    float _272 = float(uint(_270));
    float _274 = float(uint(_264));
    float _276 = as_type<float>(_205) * _272;
    int _278 = as_type<int>(_260) & 1;
    bool _280 = _278 != 0;
    int _282 = as_type<int>(_260) & 2;
    bool _284 = _282 != 0;
    float _286 = as_type<float>(_266) * _274;
    float _288 = trunc(_276);
    float _290 = precise::max(_288, 0.0);
    uint _292 = uint(_290);
    bool _294 = !_280;
    float _296 = _294 ? (-0.5) : 0.5;
    bool _298 = !_284;
    float _300 = _298 ? (-0.5) : 0.5;
    float _302 = trunc(_286);
    float _304 = precise::max(_302, 0.0);
    uint _306 = uint(_304);
    bool _308 = !_219;
    float _310 = _249;
    if (!_308)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = _171 * _314;
        float _324 = 1.0 / _318;
        float _326 = _320 * 0.693147182464599609375;
        float _328 = exp2(_322);
        float _330 = 1.0 / _326;
        float _332 = _328 + (-1.0);
        float _334 = -_332;
        float _336 = fma(_334, _330, _171);
        float _338 = _336 * _324;
        float _340 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _310 = _340;
    }
    float _342 = _310;
    bool _344 = !_219;
    if (!_344)
    {
        float _346 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _348 = log2(_346);
        float _350 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _352 = _350 + 1.0;
        float _354 = 1.0 / _352;
        float _356 = _171 * _348;
        float _358 = exp2(_356);
        float _360 = -_358;
        float _362 = _360 + 1.0;
        float _364 = _362 * _354;
        _235 = _364;
    }
    float _366 = _235;
    float _368 = 0.0;
    if (!_219)
    {
        float _370 = _145 * _145;
        float _372 = _370 * 0.5;
        _368 = _372;
    }
    float _374 = _368;
    int _376 = _227 * int(_306);
    int _378 = _376 + _264;
    bool _380 = _169 > 0.5;
    float _382 = _374;
    if (!_219)
    {
        float _384 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _382 = _384;
    }
    float _386 = _382;
    int _388 = int(_258) + int(_292);
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _392 = _390 != 0;
    int _394 = ~_177;
    int _396 = _394 + 1;
    float _398 = 0.0;
    float _400 = _386;
    if (!_219)
    {
        _398 = _145;
    }
    float _402 = _398;
    float _404 = float(uint(_378));
    bool _406 = !_219;
    float _408 = _402;
    if (!_406)
    {
        float _410 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _412 = log2(_410);
        float _414 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _416 = _414 + 1.0;
        float _418 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _420 = _145 * _412;
        float _422 = 1.0 / _416;
        float _424 = _418 * 0.693147182464599609375;
        float _426 = exp2(_420);
        float _428 = 1.0 / _424;
        float _430 = _426 + (-1.0);
        float _432 = -_430;
        float _434 = fma(_432, _428, _145);
        float _436 = _434 * _422;
        float _438 = _436 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _400 = _438;
    }
    float _440 = _400;
    bool _442 = !_219;
    if (!_442)
    {
        float _444 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _446 = log2(_444);
        float _448 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _450 = _448 + 1.0;
        float _452 = 1.0 / _450;
        float _454 = _145 * _446;
        float _456 = exp2(_454);
        float _458 = -_456;
        float _460 = _458 + 1.0;
        float _462 = _460 * _452;
        _408 = _462;
    }
    float _464 = _408;
    float _466 = as_type<float>(_266) * _404;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _474 = _472 != 0;
    int _476 = _396 * _388;
    int _478 = _476 + _209;
    bool _480 = _173 > 0.5;
    float _482 = trunc(_466);
    float _484 = precise::max(_482, 0.0);
    uint _486 = uint(_484);
    float _488 = -_296;
    int _490 = _380 ? as_type<int>(_488) : as_type<int>(_296);
    float _492 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _504 = _502 != 0;
    float _506 = _131 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _508 = !_392;
    int _510 = _508 ? 0 : 1;
    float _512 = in.m_58.w;
    float _514 = -_300;
    int _516 = _480 ? as_type<int>(_514) : as_type<int>(_300);
    bool _518 = uint(_478) >= uint(_177);
    int _520 = ~_203;
    int _522 = _520 + 1;
    bool _524 = !_500;
    float _526 = _524 ? _296 : as_type<float>(_490);
    bool _528 = !_504;
    float _530 = _528 ? _300 : as_type<float>(_516);
    bool _532 = !_518;
    int _534 = _532 ? 0 : (-1);
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _546 = _544 != 0;
    int _548 = int(_306) + int(_486);
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _552 = _550 != 0;
    bool _554 = !_552;
    int _556 = _554 ? 0 : 1;
    bool _558 = _179 > 0.5;
    int _560 = _522 * _548;
    int _562 = _560 + _264;
    bool _564 = !_470;
    int _566 = _564 ? 0 : 1;
    float _568 = -_300;
    int _570 = _558 ? as_type<int>(_568) : as_type<int>(_300);
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _574 = _572 != 0;
    bool _576 = uint(_562) >= uint(_203);
    bool _578 = !_474;
    int _580 = _578 ? 0 : 1;
    bool _582 = !_496;
    float _584 = _582 ? _300 : as_type<float>(_570);
    bool _586 = !_574;
    int _588 = _586 ? 0 : 1;
    bool _590 = !_576;
    int _592 = _590 ? 0 : (-1);
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _596 = _594 != 0;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _600 = _598 != 0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _608 = _606 != 0;
    float _610 = float(_109);
    bool _612 = !_600;
    int _614 = _612 ? 0 : 1;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _618 = _616 != 0;
    float _620 = 1.0 / _610;
    float _622 = float(_177);
    float _624 = float(_209);
    int _626 = ~_388;
    int _628 = _626 + _534;
    int _630 = _628 + 1;
    bool _632 = _624 >= _622;
    bool _634 = isnan(_624);
    bool _636 = _632 || _634;
    bool _638 = isnan(_622);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    bool _644 = !_542;
    int _646 = _644 ? 0 : 1;
    bool _648 = !_538;
    int _650 = _648 ? 0 : 1;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_618)
    {
        _652 = 1.0;
    }
    float _654 = _652;
    float _656 = trunc(_642);
    int _658 = int(_656);
    float _660 = _654;
    if (!_618)
    {
        _660 = 7.345489978790283203125;
    }
    float _662 = _660;
    float _664 = _145 * _620;
    bool _666 = !_596;
    int _668 = _666 ? 0 : 1;
    bool _670 = _177 == 0;
    float _672 = _662 * _131;
    int _674 = abs(_646);
    bool _676 = !_546;
    int _678 = _676 ? 0 : 1;
    float _680 = floor(_672);
    int _682 = ~_548;
    int _684 = _682 + _592;
    int _686 = _684 + 1;
    int _688 = abs(_678);
    bool _690 = _203 == 0;
    bool _692 = !_604;
    int _694 = _692 ? 0 : 1;
    int _696 = abs(_668);
    int _698 = abs(_694);
    bool _700 = _169 > 0.5;
    float _702 = -_680;
    float _704 = _672 + _702;
    int _706 = _177 + (-1);
    float _708 = -_300;
    int _710 = _700 ? as_type<int>(_708) : as_type<int>(_300);
    float _712 = _704 * _622;
    int _714 = _177 * _630;
    int _716 = _714 + _209;
    float _718 = _622 * _664;
    int _720 = abs(_510);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _724 = ~_658;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    float _730 = trunc(_712);
    int _732 = int(_730);
    bool _734 = !_670;
    int _736 = _734 ? _716 : (-1);
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _740 = _738 != 0;
    int _742 = _736 * _728;
    int _744 = abs(_650);
    float _746 = trunc(_718);
    int _748 = int(_746);
    int _750 = _658 * _706;
    int _752 = _750 + _742;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _756 = as_type<float>(_742);
    float _758 = as_type<float>(_706);
    if (_618)
    {
        _756 = 1.0;
    }
    float _760 = _756;
    int _762 = _752 * _674;
    float _764 = _760;
    if (_618)
    {
        _758 = _131;
    }
    float _766 = _758;
    int _768 = _732 * _720;
    int _770 = _768 + _209;
    float _772 = _766;
    if (!_618)
    {
        _764 = 1.2345600128173828125;
    }
    float _774 = _764;
    if (!_618)
    {
        _772 = _169;
    }
    float _776 = _772;
    float _778 = float(_203);
    int _780 = _748 * _744;
    int _782 = _780 + _762;
    int _784 = abs(_556);
    float _786 = _774 * _776;
    int _788 = _770 * _688;
    int _790 = _788 + _782;
    float _792 = float(_264);
    float _794 = floor(_786);
    float _796 = _778 * _664;
    int _798 = _732 * _784;
    int _800 = _798 + _790;
    bool _802 = _792 >= _778;
    bool _804 = isnan(_792);
    bool _806 = _802 || _804;
    bool _808 = isnan(_778);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = (*spvDescriptorSet0.vp_c10)._m0[8].w * 0.00999999977648258209228515625;
    float _816 = float(uint(_800));
    float _818 = trunc(_796);
    int _820 = int(_818);
    float _822 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _814);
    float _824 = as_type<float>(_205) * _816;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _826;
    float _830 = trunc(_812);
    int _832 = int(_830);
    float _834 = -_794;
    float _836 = _786 + _834;
    int _838 = ~_177;
    int _840 = _838 + 1;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _850 = _836 * _778;
    int _852 = _203 * _686;
    int _854 = _852 + _264;
    int _856 = abs(_588);
    float _858 = trunc(_824);
    float _860 = precise::max(_858, 0.0);
    uint _862 = uint(_860);
    bool _864 = !_690;
    int _866 = _864 ? _854 : (-1);
    bool _868 = _173 > 0.5;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _874 = trunc(_850);
    int _876 = int(_874);
    int _878 = ~_832;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    int _884 = abs(_614);
    int _886 = _866 * _882;
    int _888 = _203 + (-1);
    int _890 = _840 * int(_862);
    int _892 = _890 + _800;
    float _894 = 1.0 / _848;
    int _896 = _832 * _888;
    int _898 = _896 + _886;
    float _900 = float(uint(_892));
    int _902 = _898 * _884;
    float _904 = float(uint(_770));
    float _906 = as_type<float>(_205) * _900;
    int _908 = _876 * _856;
    int _910 = _908 + _264;
    bool _912 = !_608;
    int _914 = _912 ? 0 : 1;
    int _916 = _820 * _696;
    int _918 = _916 + _902;
    float _920 = as_type<float>(_205) * _904;
    float _922 = trunc(_906);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = abs(_914);
    int _930 = _910 * _698;
    int _932 = _930 + _918;
    int _934 = ~_177;
    int _936 = _934 + 1;
    int _938 = ~_203;
    int _940 = _938 + 1;
    int _942 = _876 * _928;
    int _944 = _942 + _932;
    float _946 = trunc(_920);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    int _952 = abs(_580);
    float _954 = float(uint(_944));
    int _956 = int(_862) + int(_926);
    float _958 = 1.0 / _872;
    float _960 = as_type<float>(_266) * _954;
    int _962 = _936 * _956;
    int _964 = _962 + _800;
    float _966 = trunc(_960);
    float _968 = precise::max(_966, 0.0);
    uint _970 = uint(_968);
    int _972 = _936 * int(_950);
    int _974 = _972 + _770;
    bool _976 = uint(_964) >= uint(_177);
    float _978 = float(uint(_974));
    bool _980 = !_976;
    int _982 = _980 ? 0 : (-1);
    float _984 = as_type<float>(_205) * _978;
    int _986 = ~_956;
    int _988 = _986 + _982;
    int _990 = _988 + 1;
    int _992 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _994 = _992 != 0;
    int _996 = _940 * int(_970);
    int _998 = _996 + _944;
    int _1000 = _177 * _990;
    int _1002 = _1000 + _800;
    bool _1004 = !_994;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = trunc(_984);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    float _1014 = float(uint(_998));
    int _1016 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1018 = _1016 != 0;
    bool _1020 = !_670;
    int _1022 = _1020 ? _1002 : (-1);
    float _1024 = as_type<float>(_266) * _1014;
    bool _1026 = !_1018;
    float _1028 = _1026 ? _300 : as_type<float>(_710);
    int _1030 = _1022 & 3;
    bool _1032 = _1030 != 0;
    float _1034 = trunc(_1024);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    int _1040 = _1022 & 3;
    bool _1042 = _1040 != 0;
    int _1044 = _1032 ? 0 : 1;
    bool _1046 = uint(_1040) > 1u;
    float _1048 = float(uint(_910));
    int _1050 = ~_177;
    int _1052 = _1050 + 1;
    int _1054 = int(_950) + int(_1012);
    float _1056 = as_type<float>(_266) * _1048;
    int _1058 = ~_1044;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    int _1064 = ~_203;
    int _1066 = _1064 + 1;
    float _1068 = trunc(_1056);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    int _1074 = _1052 * _1054;
    int _1076 = _1074 + _770;
    int _1078 = _1062;
    if (!_1046)
    {
        int _1080 = ~_1044;
        int _1082 = _1080 + 1;
        _1078 = _1082;
    }
    int _1084 = _1078;
    bool _1086 = uint(_1040) >= 2u;
    int _1088 = int(_970) + int(_1038);
    int _1090 = _1086 ? 0 : 1;
    float _1092 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _1094 = uint(_1076) >= uint(_177);
    int _1096 = _1066 * _1088;
    int _1098 = _1096 + _944;
    int _1100 = ~_203;
    int _1102 = _1100 + 1;
    bool _1104 = !_1042;
    int _1106 = _1104 ? 0 : 1;
    bool _1108 = !_1094;
    int _1110 = _1108 ? 0 : (-1);
    bool _1112 = uint(_1098) >= uint(_203);
    int _1114 = _1102 * int(_1072);
    int _1116 = _1114 + _910;
    int _1118 = ~_1054;
    int _1120 = _1118 + _1110;
    int _1122 = _1120 + 1;
    bool _1124 = !_1112;
    int _1126 = _1124 ? 0 : (-1);
    bool _1128 = _1040 != 3;
    float _1130 = float(uint(_1116));
    int _1132 = ~_1088;
    int _1134 = _1132 + _1126;
    int _1136 = _1134 + 1;
    int _1138 = _177 * _1122;
    int _1140 = _1138 + _770;
    int _1142 = ~_1090;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = as_type<float>(_266) * _1130;
    float _1150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _1152 = _203 * _1136;
    int _1154 = _1152 + _944;
    bool _1156 = !_670;
    int _1158 = _1156 ? _1140 : (-1);
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1162 = _1160 != 0;
    int _1164 = _1146;
    if (_1128)
    {
        int _1166 = ~_1090;
        int _1168 = _1166 + 1;
        _1164 = _1168;
    }
    int _1170 = _1164;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1174 = _1172 != 0;
    float _1176 = trunc(_1148);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    bool _1182 = !_690;
    int _1184 = _1182 ? _1154 : (-1);
    bool _1186 = !_1174;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = _1184 & 3;
    bool _1192 = _1190 != 0;
    bool _1194 = !_1162;
    int _1196 = _1194 ? 0 : 1;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    bool _1200 = uint(_1190) > 1u;
    float _1202 = _1092 * _1150;
    int _1204 = _1184 & 3;
    bool _1206 = _1204 != 0;
    bool _1208 = !_1192;
    int _1210 = _1208 ? 0 : 1;
    bool _1212 = _1040 != 3;
    int _1214 = _1206 ? 0 : 1;
    int _1216 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1218 = _1216 != 0;
    int _1220 = _1022 >> 31;
    int _1222 = ~_1214;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _492 * _1198;
    int _1230 = _1226;
    if (!_1200)
    {
        int _1232 = ~_1214;
        int _1234 = _1232 + 1;
        _1230 = _1234;
    }
    int _1236 = _1230;
    int _1238 = _1184 >> 31;
    int _1240 = _1220 & 3;
    int _1242 = _1238 & 3;
    int _1244 = _1022 + _1240;
    int _1246 = int(_1072) + int(_1180);
    int _1248 = _1184 + _1242;
    float _1250 = _131 * 2.0;
    int _1252 = _1244 >> 2;
    int _1254 = ~_203;
    int _1256 = _1254 + 1;
    float _1258 = floor(_1250);
    bool _1260 = uint(_1190) >= 2u;
    int _1262 = _1252 << 4;
    int _1264 = _1262 + 368;
    int _1266 = _1256 * _1246;
    int _1268 = _1266 + _910;
    int _1270 = _1260 ? 0 : 1;
    bool _1272 = _1190 != 3;
    uint _1274 = uint(int(uint(_1264) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[int(_1284)][_1286];
    int _1290 = _1248 >> 2;
    float _1292 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1294 = int(_1292);
    bool _1296 = !_1272;
    int _1298 = _1296 ? 0 : (-1);
    bool _1300 = uint(_1268) >= uint(_203);
    float _1302 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1304 = _1290 << 4;
    int _1306 = _1304 + 512;
    bool _1308 = !_1300;
    int _1310 = _1308 ? 0 : (-1);
    float _1312 = -_754;
    float _1314 = fma(_1302, 2.0, _1312);
    bool _1316 = _1190 != 3;
    int _1318 = ~_1246;
    int _1320 = _1318 + _1310;
    int _1322 = _1320 + 1;
    uint _1324 = uint(int(uint(_1306) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[int(_1334)][_1336];
    float _1340 = -_145;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1314);
    bool _1344 = !_1212;
    int _1346 = _1344 ? 0 : (-1);
    int _1348 = _203 * _1322;
    int _1350 = _1348 + _910;
    bool _1352 = _1258 >= 0.0;
    bool _1354 = isnan(_1258);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan(0.0);
    bool _1360 = _1356 || _1358;
    float _1362 = -_506;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1366 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1368 = _1264 + 8;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[int(_1380)][_1382];
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1390 = fma(_1366, -2.0, _722);
    int _1392 = ~_1270;
    int _1394 = _1392 + 1;
    int _1396 = _1394 + 1;
    int _1398 = _1396;
    if (_1316)
    {
        int _1400 = ~_1270;
        int _1402 = _1400 + 1;
        _1398 = _1402;
    }
    int _1404 = _1398;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1410 = _1258 > 0.0;
    float _1412 = 1.0 / _1388;
    int _1414 = abs(_1084);
    float _1416 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1390);
    int _1418 = _1306 + 8;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    uint _1422 = uint(int(uint(int(_1420)) >> uint(2)));
    int _1424 = int(_1420) & 3;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[int(_1422)][_1424];
    int _1428 = int(_1420) + 1;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    int _1432 = _1428 & 3;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[int(_1430)][_1432];
    int _1436 = abs(_1106);
    int _1438 = abs(_1236);
    float _1440 = 1.0 / _1408;
    int _1442 = ~_1414;
    int _1444 = _1442 + 1;
    int _1446 = _1444 + 1;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1450 = _1448 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1452 = ~_1436;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    int _1458 = ~_1438;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    int _1464 = abs(_1298);
    int _1466 = _1446 * as_type<int>(_1288);
    int _1468 = abs(_1170);
    float _1470 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1472 = int(_1470);
    bool _1474 = !_690;
    int _1476 = _1474 ? _1350 : (-1);
    int _1478 = _1456 * as_type<int>(_1280);
    int _1480 = _1478 + _1466;
    int _1482 = abs(_1210);
    float _1484 = _844 * _1412;
    int _1486 = ~_1468;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    float _1492 = _828 * _1440;
    float _1494 = 1.0 / _1450;
    float _1496 = float(uint(_1294));
    int _1498 = ~_1482;
    int _1500 = _1498 + 1;
    int _1502 = _1500 + 1;
    int _1504 = _1462 * as_type<int>(_1338);
    int _1506 = _1502 * as_type<int>(_1330);
    int _1508 = _1506 + _1504;
    float _1510 = 1.0 / _1496;
    int _1512 = abs(_1404);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _1518 = _1490 * as_type<int>(_1376);
    int _1520 = _1518 + _1480;
    int _1522 = abs(_1346);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1524;
    int _1528 = abs(_1188);
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1534 = ~_1522;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    float _1540 = 1.0 / _1516;
    int _1542 = ~_1528;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    float _1548 = _1526 * _1494;
    int _1550 = abs(_1294);
    int _1552 = _1538 * as_type<int>(_1384);
    int _1554 = _1552 + _1520;
    int _1556 = ~_1512;
    int _1558 = _1556 + 1;
    int _1560 = _1558 + 1;
    float _1562 = _1532 * _894;
    float _1564 = float(uint(_1550));
    int _1566 = _1554 * _1546;
    int _1568 = _1560 * as_type<int>(_1426);
    int _1570 = _1568 + _1508;
    int _1572 = _1158 * _1528;
    int _1574 = _1572 + _1566;
    float _1576 = 1.0 / _1564;
    int _1578 = abs(_1196);
    int _1580 = ~_1464;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1590 = as_type<int>(_1510) + (-2);
    float _1592 = float(uint(_1574));
    int _1594 = _1584 * as_type<int>(_1434);
    int _1596 = _1594 + _1570;
    float _1598 = float(uint(_1472));
    float _1600 = 1.0 / _1588;
    int _1602 = ~_1578;
    int _1604 = _1602 + 1;
    int _1606 = _1604 + 1;
    float _1608 = as_type<float>(_1590) * _1592;
    int _1610 = abs(_1574);
    int _1612 = abs(_1472);
    int _1614 = _1596 * _1606;
    int _1616 = as_type<int>(_1576) + (-2);
    float _1618 = 1.0 / _1598;
    float _1620 = float(uint(_1612));
    int _1622 = _1476 * _1578;
    int _1624 = _1622 + _1614;
    float _1626 = float(uint(_1610));
    int _1628 = ~_1294;
    int _1630 = _1628 + 1;
    float _1632 = float(uint(_1624));
    float _1634 = trunc(_1608);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = as_type<float>(_1616) * _1626;
    int _1642 = abs(_1624);
    int _1644 = ~_1550;
    int _1646 = _1644 + 1;
    float _1648 = 1.0 / _1620;
    int _1650 = as_type<int>(_1618) + (-2);
    float _1652 = in.m_49.x;
    float _1654 = in.m_49.y;
    float _1656 = in.m_49.z;
    bool _1658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1660 = as_type<float>(_1650) * _1632;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1662;
    float _1666 = trunc(_1640);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    int _1672 = _1630 * int(_1638);
    int _1674 = _1672 + _1574;
    float _1676 = in.m_44.x;
    float _1678 = in.m_44.y;
    float _1680 = in.m_44.z;
    float _1682 = _1664 * _1540;
    float _1684 = float(uint(_1674));
    float _1686 = trunc(_1660);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    float _1692 = as_type<float>(_1590) * _1684;
    int _1694 = as_type<int>(_1648) + (-2);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1700 = float(uint(_1642));
    int _1702 = _1646 * int(_1670);
    int _1704 = _1702 + _1610;
    float _1706 = trunc(_1692);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    float _1712 = as_type<float>(_1694) * _1700;
    float _1714 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1716 = float(uint(_1704));
    float _1718 = _1698 * _958;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1720;
    float _1724 = fma(_366, _1656, _1714);
    int _1726 = ~_1472;
    int _1728 = _1726 + 1;
    float _1730 = trunc(_1712);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    float _1736 = as_type<float>(_1616) * _1716;
    float _1738 = _1722 * _1600;
    float _1740 = fma(_1724, _512, _1680);
    int _1742 = ~_1612;
    int _1744 = _1742 + 1;
    float _1746 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _1748 = trunc(_1736);
    float _1750 = precise::max(_1748, 0.0);
    uint _1752 = uint(_1750);
    int _1754 = _1728 * int(_1690);
    int _1756 = _1754 + _1624;
    int _1758 = int(_1638) + int(_1710);
    int _1760 = ~_1294;
    int _1762 = _1760 + 1;
    float _1764 = float(uint(_1756));
    int _1766 = _1744 * int(_1734);
    int _1768 = _1766 + _1642;
    int _1770 = ~_1550;
    int _1772 = _1770 + 1;
    int _1774 = _1762 * _1758;
    int _1776 = _1774 + _1574;
    float _1778 = as_type<float>(_1650) * _1764;
    float _1780 = -_1740;
    float _1782 = precise::max(0.0, _1780);
    float _1784 = float(uint(_1768));
    int _1786 = int(_1670) + int(_1752);
    float _1788 = trunc(_1778);
    float _1790 = precise::max(_1788, 0.0);
    uint _1792 = uint(_1790);
    float _1794 = as_type<float>(_1694) * _1784;
    float _1796 = -_296;
    int _1798 = _868 ? as_type<int>(_1796) : as_type<int>(_296);
    bool _1800 = uint(_1776) >= uint(_1294);
    int _1802 = _1772 * _1786;
    int _1804 = _1802 + _1610;
    float _1806 = precise::min(_1746, _1782);
    float _1808 = trunc(_1794);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    bool _1814 = !_1800;
    int _1816 = _1814 ? 0 : (-1);
    int _1818 = _1694;
    int _1820 = as_type<int>(_1778);
    float _1822 = _1794;
    float _1824 = as_type<float>(_1804);
    if (_618)
    {
        _1818 = 0;
    }
    int _1826 = _1818;
    int _1828 = _1826;
    if (_618)
    {
        _1820 = 0;
    }
    int _1830 = _1820;
    int _1832 = _1830;
    if (!_618)
    {
        _1828 = 1;
    }
    int _1834 = _1828;
    float _1836 = 1.0 / _1746;
    int _1838 = ~_1758;
    int _1840 = _1838 + _1816;
    int _1842 = _1840 + 1;
    if (!_618)
    {
        _1832 = 2;
    }
    int _1844 = _1832;
    bool _1846 = uint(_1804) >= uint(_1550);
    int _1848 = _1294 * _1842;
    int _1850 = _1848 + _1574;
    int _1852 = int(_1690) + int(_1792);
    float _1854 = as_type<float>(_1758);
    float _1856 = as_type<float>(_1850);
    float _1858 = as_type<float>(_1852);
    float _1860 = as_type<float>(_1844);
    if (_1658)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1854 = _1862;
    }
    float _1864 = _1854;
    bool _1866 = !_1846;
    int _1868 = _1866 ? 0 : (-1);
    float _1870 = _173 * 2.0;
    bool _1872 = _1294 == 0;
    bool _1874 = _1834 != 1;
    int _1876 = ~_1472;
    int _1878 = _1876 + 1;
    float _1880 = _1806 * _1836;
    bool _1882 = !_1872;
    int _1884 = _1882 ? _1850 : (-1);
    float _1886 = _1880;
    if (_1658)
    {
        float _1888 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1856 = _1888;
    }
    float _1890 = _1856;
    int _1892 = int(_1734) + int(_1812);
    float _1894 = floor(_1870);
    int _1896 = ~_1612;
    int _1898 = _1896 + 1;
    int _1900 = _1878 * _1852;
    int _1902 = _1900 + _1624;
    bool _1904 = _131 > 0.5;
    float _1906 = _1890;
    float _1908 = as_type<float>(_1898);
    if (_1658)
    {
        float _1910 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1880);
        _1906 = _1910;
    }
    float _1912 = _1906;
    bool _1914 = !_740;
    float _1916 = _1914 ? _296 : as_type<float>(_1798);
    int _1918 = _1898 * _1892;
    int _1920 = _1918 + _1642;
    float _1922 = -_296;
    int _1924 = _1904 ? as_type<int>(_1922) : as_type<int>(_296);
    float _1926 = as_type<float>(_1920);
    if (_1658)
    {
        float _1928 = _1912 * _1864;
        _1908 = _1928;
    }
    float _1930 = _1908;
    bool _1932 = uint(_1902) >= uint(_1472);
    float _1934 = _131 + _169;
    bool _1936 = _1844 != 2;
    float _1938 = as_type<float>(_1772);
    if (_1658)
    {
        float _1940 = floor(_1930);
        _1938 = _1940;
    }
    float _1942 = _1938;
    bool _1944 = !_1932;
    int _1946 = _1944 ? 0 : (-1);
    float _1948 = _1934 + (-1.0);
    bool _1950 = uint(_1920) >= uint(_1612);
    float _1952 = _131 + _173;
    bool _1954 = !_1218;
    float _1956 = _1954 ? _296 : as_type<float>(_1924);
    float _1958 = _1870 + (-1.0);
    float _1960 = _1952 + (-1.0);
    bool _1962 = !_1950;
    int _1964 = _1962 ? 0 : (-1);
    out.m_60.x = _1880;
    bool _1966 = _1894 > 0.0;
    float _1968 = fma(_1948, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1970 = _1894 >= 0.0;
    bool _1972 = isnan(_1894);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan(0.0);
    bool _1978 = _1974 || _1976;
    float _1980 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1982 = ~_1852;
    int _1984 = _1982 + _1946;
    int _1986 = _1984 + 1;
    float _1988 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1202);
    float _1990 = _1948;
    float _1992 = _1952;
    if (_1936)
    {
        _1990 = _131;
    }
    float _1994 = _1990;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    float _1998 = _1994;
    if (_1936)
    {
        _1926 = _169;
    }
    float _2000 = _1926;
    int _2002 = _1472 * _1986;
    int _2004 = _2002 + _1624;
    float _2006 = 0.0;
    float _2008 = _2000;
    if (_1936)
    {
        _2006 = _173;
    }
    float _2010 = _2006;
    float _2012 = floor(_1988);
    float _2014 = _2010;
    if (!_1936)
    {
        _1998 = _173;
    }
    float _2016 = _1998;
    if (!_1936)
    {
        _2008 = _131;
    }
    float _2018 = _2008;
    if (!_1936)
    {
        _2014 = _169;
    }
    float _2020 = _2014;
    float _2022 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2024 = _1574 ^ _1294;
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2028 = _1472 == 0;
    if (!_1658)
    {
        _1858 = _1880;
    }
    float _2030 = _1858;
    float _2032 = _2030;
    if (_1658)
    {
        float _2034 = -_1942;
        float _2036 = _1930 + _2034;
        _2032 = _2036;
    }
    float _2038 = _2032;
    uint _2040 = uint(int(uint(_2024) >> uint(31)));
    bool _2042 = !_2028;
    int _2044 = _2042 ? _2004 : (-1);
    float _2046 = _1996 * 0.15915493667125701904296875;
    int _2048 = ~_1868;
    int _2050 = _1786 + _2048;
    int _2052 = _2050 + 1;
    int _2054 = ~int(_2040);
    int _2056 = _2054 + 1;
    float _2058 = _2046 * 6.283185482025146484375;
    float _2060 = sin(_2058);
    bool _2062 = _1472 == 0;
    int _2064 = _2052 ^ _2056;
    int _2066 = _1624 ^ _1472;
    int _2068 = ~_1964;
    int _2070 = _1892 + _2068;
    int _2072 = _2070 + 1;
    float _2074 = _2046 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    int _2078 = ~_2056;
    int _2080 = _2078 + _2064;
    int _2082 = _2080 + 1;
    float _2084 = -_2012;
    float _2086 = _1988 + _2084;
    bool _2088 = _1294 == 0;
    float _2090 = _1988 * 6.283185482025146484375;
    float _2092 = _173 + _169;
    float _2094 = _2090 * 0.15915493667125701904296875;
    float _2096 = _2092 + (-1.0);
    uint _2098 = uint(int(uint(_2066) >> uint(31)));
    float _2100 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2102 = ~int(_2098);
    int _2104 = _2102 + 1;
    float _2106 = _169 * 2.0;
    float _2108 = _2076 * _2076;
    if (!_1874)
    {
        _1822 = _169;
    }
    float _2110 = _1822;
    float _2112 = _2094 * 6.283185482025146484375;
    float _2114 = cos(_2112);
    int _2116 = _2072 ^ _2104;
    float _2118 = fma(_2060, _2060, _2108);
    float _2120 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _2122 = 1.0 + _2120;
    float _2124 = _2110;
    if (!_1874)
    {
        _1860 = _2110;
    }
    float _2126 = _1860;
    float _2128 = fma(_179, 2.0, -1.0);
    int _2130 = ~_2104;
    int _2132 = _2130 + _2116;
    int _2134 = _2132 + 1;
    float _2136 = -(*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _2138 = 1.0 + _2136;
    float _2140 = rsqrt(_2118);
    float _2142 = _2126;
    if (!_1874)
    {
        _1824 = _173;
    }
    float _2144 = _1824;
    float _2146 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2148 = _2144;
    if (!_1874)
    {
        _1992 = _173;
    }
    float _2150 = _1992;
    bool _2152 = !_2062;
    int _2154 = _2152 ? _2134 : (-1);
    float _2156 = floor(_2106);
    float _2158 = _2150;
    if (_1874)
    {
        _2142 = _131;
    }
    float _2160 = _2142;
    if (_1874)
    {
        _2124 = _131;
    }
    float _2162 = _2124;
    if (_1874)
    {
        _2148 = _169;
    }
    float _2164 = _2148;
    if (_1874)
    {
        _2158 = _169;
    }
    float _2166 = _2158;
    float _2168 = _2060 * _2140;
    bool _2170 = !_2088;
    int _2172 = _2170 ? _2082 : (-1);
    float _2174 = _2076 * _2140;
    float _2176 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2180 = _2178 != 0;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2184 = _2182 != 0;
    int _2186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2188 = _2186 != 0;
    float _2190 = _2146 * _2122;
    int _2192 = _1360 ? 0 : 1;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2196 = _2156 >= 0.0;
    bool _2198 = isnan(_2156);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan(0.0);
    bool _2204 = _2200 || _2202;
    float _2206 = -_2190;
    float _2208 = _2146 + _2206;
    int _2210 = ~_2192;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    float _2216 = -_2194;
    float _2218 = fma(_2022, 2.0, _2216);
    int _2220 = _2214;
    if (!_1410)
    {
        int _2222 = ~_2192;
        int _2224 = _2222 + 1;
        _2220 = _2224;
    }
    int _2226 = _2220;
    float _2228 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _2230 = _2156 > 0.0;
    float _2232 = fma(_2208, _169, _2190);
    bool _2234 = _2086 < 0.5;
    float _2236 = float(_2234);
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2240 = fma(_2114, 0.5, 0.5);
    float _2242 = fma(_366, _1654, _2176);
    float _2244 = fma(_366, _1652, _2228);
    float _2246 = fma(_2162, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2238);
    float _2248 = -_2086;
    float _2250 = fma(_2248, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2252 = -_2236;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2256 = -_2240;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2260 = fma(_2242, _512, _1678);
    float _2262 = fma(_2244, _512, _1676);
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _2266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _2268 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2270 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2272 = _1364 * _1880;
    float _2274 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[89].z, _2264);
    float _2276 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2268);
    float _2278 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2270);
    float _2280 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[193].y, _822);
    float _2282 = precise::max(0.0, _2272);
    float _2284 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2286 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2278);
    float _2288 = _2280 * 0.15915493667125701904296875;
    float _2290 = precise::min(_2282, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2294 = _2038 + _2292;
    bool _2296 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2298 = isnan(_2038);
    bool _2300 = _2296 || _2298;
    bool _2302 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2304 = _2300 || _2302;
    float _2306 = float(_2304);
    float _2308 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2284);
    float _2310 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2276);
    float _2312 = _2290 * _2266;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2316 = _2038 + _2314;
    float _2318 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2320 = _2038 + _2318;
    float _2322 = _2288 * 6.283185482025146484375;
    float _2324 = sin(_2322);
    float _2326 = fma(_1484, _2294, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2328 = fma(_1548, _2316, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2330 = fma(_1718, _2320, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2332 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2334 = isnan(_2038);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    float _2344 = -_2306;
    float _2346 = _2344 + 1.0;
    float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2350 = _2038 + _2348;
    float _2352 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2308);
    float _2354 = abs(_2312);
    float _2356 = log2(_2354);
    float _2358 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2360 = _2038 + _2358;
    float _2362 = -_2342;
    float _2364 = _2362 + 1.0;
    float _2366 = _2342 * _2346;
    float _2368 = fma(_1492, _2350, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2370 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2372 = isnan(_2038);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2378 = _2374 || _2376;
    float _2380 = float(_2378);
    float _2382 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2384 = _2038 + _2382;
    float _2386 = fma(_1682, _2360, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2388 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    bool _2390 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2392 = isnan(_2038);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = fma(_1562, _2384, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2404 = -_2380;
    float _2406 = _2404 + 1.0;
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2410 = _2038 + _2408;
    bool _2412 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2414 = isnan(_2038);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = _2400 * _2364;
    float _2426 = -_2400;
    float _2428 = _2426 + 1.0;
    float _2430 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[192].w;
    bool _2432 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2434 = isnan(_2038);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2440 = _2436 || _2438;
    float _2442 = float(_2440);
    float _2444 = fma(_1738, _2410, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2446 = _2380 * _2428;
    float _2448 = -_2232;
    float _2450 = _2168 * _2448;
    float _2452 = -_2388;
    float _2454 = _2174 * _2452;
    float _2456 = exp2(_2430);
    float _2458 = _2442 * _2406;
    float _2460 = -_2442;
    float _2462 = _2460 + 1.0;
    float _2464 = fma(_1364, _2450, _2454);
    bool _2466 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2468 = isnan(_2038);
    bool _2470 = _2466 || _2468;
    bool _2472 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2474 = _2470 || _2472;
    float _2476 = float(_2474);
    float _2478 = -_2232;
    float _2480 = _2174 * _2478;
    float _2482 = _2422 * _2462;
    bool _2484 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2486 = isnan(_2038);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = _1880 * _2464;
    float _2498 = -_2422;
    float _2500 = _2498 + 1.0;
    float _2502 = _2368 * _2482;
    float _2504 = _2168 * _2388;
    float _2506 = _2286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2508 = -_145;
    float _2510 = fma(_2508, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2218);
    float _2512 = fma(_2500, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2502);
    float _2514 = fma(_1364, _2480, _2504);
    float _2516 = _2456 * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2518 = -_2476;
    float _2520 = _2518 + 1.0;
    float _2522 = fma(_2326, _2458, _2512);
    float _2524 = _1880 * _2514;
    float _2526 = -_2168;
    float _2528 = fma(_2526, _2516, _2496);
    float _2530 = -_2494;
    float _2532 = _2530 + 1.0;
    float _2534 = fma(_2328, _2446, _2522);
    float _2536 = -_2174;
    float _2538 = fma(_2536, _2516, _2524);
    float _2540 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2528);
    float _2542 = _2476 * _2532;
    int _2544 = abs(_566);
    float _2546 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2538);
    float _2548 = in.m_58.x;
    float _2550 = fma(_2402, _2424, _2534);
    float _2552 = _2310 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2554 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[192].y, _2506);
    float _2556 = _2306 * _2520;
    float _2558 = fma(_2386, _2366, _2550);
    float _2560 = _2352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2562 = _2540 + _2552;
    int _2564 = abs(_1006);
    float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2568 = _2554 + _2566;
    float _2570 = float(_2544);
    float _2572 = fma(_2330, _2556, _2558);
    float _2574 = _2546 + _2560;
    float _2576 = _2568 * _2568;
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2580 = _2562 + _2578;
    float _2582 = float(_2564);
    float _2584 = abs(_2250);
    float _2586 = _2570 * _2584;
    float _2588 = fma(_2444, _2542, _2572);
    float _2590 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[89].x, _2274);
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2594 = _2574 + _2592;
    float _2596 = fma(_2580, _2580, _2576);
    float _2598 = fma(_2582, _2258, _2586);
    float _2600 = -_1880;
    float _2602 = _2600 + 1.0;
    float _2604 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2588);
    float _2606 = fma(_2594, _2594, _2596);
    float _2608 = _2548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2610 = _2590 * (-0.15915493667125701904296875);
    float _2612 = float(_952);
    float _2614 = sqrt(_2606);
    bool _2616 = _2602 >= 0.001000000047497451305389404296875;
    bool _2618 = isnan(_2602);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan(0.001000000047497451305389404296875);
    bool _2624 = _2620 || _2622;
    float _2626 = float(_2624);
    float _2628 = _2608 * _2604;
    float _2630 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2632 = abs(_2254);
    float _2634 = fma(_2612, _2632, _2598);
    float _2636 = _2628 * _2626;
    float _2638 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2630);
    float _2640 = _2610 * 6.283185482025146484375;
    float _2642 = sin(_2640);
    float _2644 = _2634 * _2636;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2648 = _2160 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2650 = _2644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2654 = rsqrt(_2606);
    float _2656 = _2614 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2660 = -_2646;
    float _2662 = fma(_2648, 2.0, _2660);
    float _2664 = fma(_2026, -2.0, _2652);
    float _2666 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2668 = precise::min(_2658, _2656);
    float _2670 = _2610 * 6.283185482025146484375;
    float _2672 = cos(_2670);
    float _2674 = _530 * _2642;
    float _2676 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2678 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2666);
    float _2680 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2664);
    float _2682 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2676);
    float _2684 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2678);
    float _2686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2688 = _2568 * _2654;
    float _2690 = _2580 * _2654;
    float _2692 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2682);
    float _2694 = -_2684;
    float _2696 = _2694 + 1.0;
    float _2698 = _2688 * _2668;
    float _2700 = -_2688;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2568);
    float _2704 = -_2690;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2580);
    float _2708 = _530 * _2672;
    float _2710 = -_2674;
    float _2712 = fma(_526, _2672, _2710);
    float _2714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2716 = _2690 * _2668;
    float _2718 = -_2698;
    float _2720 = _2568 + _2718;
    float _2722 = _2712 + 0.5;
    float _2724 = fma(_526, _2642, _2708);
    float _2726 = -_2716;
    float _2728 = _2580 + _2726;
    float _2730 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2732 = _2720 * _2720;
    float _2734 = _2702 * _2702;
    float _2736 = _2724 + (-0.5);
    float _2738 = fma(_2730, _2722, _2510);
    float _2740 = _2594 * _2654;
    float _2742 = fma(_2728, _2728, _2732);
    float _2744 = fma(_2706, _2706, _2734);
    float _2746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2748 = _2740 * _2668;
    float _2750 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2752 = -_2740;
    float _2754 = fma(_2752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2594);
    float _2756 = -_2692;
    float _2758 = _2756 + 1.0;
    float _2760 = -_2748;
    float _2762 = _2594 + _2760;
    float _2764 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2766 = -_2750;
    float _2768 = -_2680;
    float _2770 = fma(_2766, _2736, _2768);
    float _2772 = fma(_2754, _2754, _2744);
    float _2774 = fma(_2762, _2762, _2742);
    float _2776 = -_2758;
    float _2778 = fma(_2712, _2776, _2738);
    float _2780 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2782 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2784 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2764);
    float _2786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2788 = fma(_2782, -2.0, _2780);
    float _2790 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2784);
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2794 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2796 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2800 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2804 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2806 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2808 = _2794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2810 = _2796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2812 = _2798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2814 = _2800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2816 = _2804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2818 = float(_1884);
    float _2820 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_62.x = _2806;
    out.m_62.y = _2808;
    out.m_62.z = _2810;
    float _2822 = fma(_2724, _2696, _2770);
    bool _2824 = !_2180;
    int _2826 = _2824 ? 0 : 1;
    float _2828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_64.x = _2812;
    out.m_64.y = _2814;
    out.m_64.z = _2816;
    float _2830 = float(_2172);
    float _2832 = _2786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2834 = float(_2154);
    out.m_66.x = _2778;
    out.m_66.y = _2822;
    bool _2836 = _2790 >= 0.0;
    float _2838 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2840 = sqrt(_2772);
    float _2842 = _1956 + 0.5;
    float _2844 = -_1416;
    float _2846 = fma(_2832, _2830, _2844);
    float _2848 = _1028 + (-0.5);
    float _2850 = fma(_2820, _2818, _1342);
    float _2852 = _584 + (-0.5);
    float _2854 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2856 = log2(_2854);
    float _2858 = fma(_2820, _2842, _2850);
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2862 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2788);
    float _2864 = -_2832;
    float _2866 = fma(_2864, _2848, _2846);
    float _2868 = float(_2044);
    float _2870 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2860);
    float _2872 = -_2862;
    float _2874 = fma(_2838, _2834, _2872);
    float _2876 = sqrt(_2774);
    float _2878 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_2836)
    {
        _2880 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2882 = _2880;
    float _2884 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2886 = -_145;
    float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2662);
    float _2890 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2878);
    float _2892 = -_2838;
    float _2894 = fma(_2892, _2852, _2874);
    float _2896 = _2654 * _2840;
    float _2898 = _145 * _2856;
    float _2900 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2890);
    float _2902 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2870);
    float _2904 = fma(_2884, _2868, _2888);
    float _2906 = _1916 + 0.5;
    float _2908 = -_2900;
    float _2910 = _2908 + 1.0;
    int _2912 = as_type<int>(_2900);
    if (_2836)
    {
        float _2914 = _2882 * 5.0;
        _2912 = as_type<int>(_2914);
    }
    int _2916 = _2912;
    float _2918 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2246);
    float _2920 = _2654 * _2876;
    float _2922 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2638);
    float _2924 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1228);
    float _2926 = -_2902;
    float _2928 = _2926 + 1.0;
    float _2930 = fma(_1028, _2910, _2866);
    float _2932 = fma(_2884, _2906, _2904);
    float _2934 = -_2918;
    float _2936 = _2934 + 1.0;
    float _2938 = -_2922;
    float _2940 = _2938 + 1.0;
    float _2942 = floor(_2924);
    float _2944 = _2920 * _2896;
    float _2946 = -_2928;
    float _2948 = fma(_1956, _2946, _2858);
    float _2950 = -_2936;
    float _2952 = fma(_1916, _2950, _2932);
    float _2954 = fma(_584, _2940, _2894);
    float _2956 = _2650 * _2944;
    out.m_68.w = _2668;
    float _2958 = exp2(_2898);
    bool _2960 = !_2184;
    int _2962 = _2960 ? 0 : 1;
    float _2964 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2966 = 1.0 + _2964;
    if (_2836)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9529 = as_type<float>(_2916);
        out.gl_Position.z = _9529;
    }
    bool _2968 = !_2188;
    int _2970 = _2968 ? 0 : 1;
    bool _2972 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    out.m_70.x = _2948;
    out.m_70.y = _2930;
    out.m_70.z = _2952;
    out.m_70.w = _2954;
    if (_2836)
    {
        out.m_47.x = 0.0;
    }
    out.m_72.x = _2956;
    if (_2836)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2974 = -_2688;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2554);
    float _2978 = -_2690;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2562);
    float _2982 = 1.0 / _2966;
    float _2984 = -_2958;
    float _2986 = _2984 + 1.0;
    float _2988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2990 = _2976 + _2988;
    float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2994 = _2980 + _2992;
    float _2996 = -_2942;
    float _2998 = _2924 + _2996;
    float _3000 = _2924 * 6.283185482025146484375;
    float _3002 = _2990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3004 = -_2740;
    float _3006 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2574);
    bool _3008 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3010 = isnan(0.0);
    bool _3012 = _3008 || _3010;
    bool _3014 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3016 = _3012 || _3014;
    float _3018 = _2954;
    float _3020 = _3000;
    if (_2972)
    {
        float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _3018 = _3022;
    }
    float _3024 = _3018;
    float _3026 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3002);
    float _3028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3030 = _3006 + _3028;
    float _3032 = _3000 * 0.15915493667125701904296875;
    float _3034 = _3016 ? _2986 : 0.0;
    float _3036 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3026);
    int _3038 = _1978 ? 0 : 1;
    float _3040 = _3032 * 6.283185482025146484375;
    float _3042 = cos(_3040);
    float _3044 = _3034 * _2982;
    bool _3046 = _3036 >= 0.0;
    float _3048 = _2982;
    if (_2972)
    {
        float _3050 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _3048 = _3050;
    }
    float _3052 = _3048;
    float _3054 = _3052;
    if (_2972)
    {
        float _3056 = fma(_3052, (*spvDescriptorSet0.vp_c9)._m0[14].z, _1880);
        _3020 = _3056;
    }
    float _3058 = _3020;
    float _3060 = _2204 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3062 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3064 = (*spvDescriptorSet0.vp_c9)._m0[176].w + _3062;
    float _3066 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3068 = _3066 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[178].w + _3070;
    int _3074 = ~_3038;
    int _3076 = _3074 + 1;
    int _3078 = _3076 + 1;
    int _3080 = _3078;
    float _3082 = _3060;
    if (_2972)
    {
        float _3084 = _3058 * _3024;
        _3054 = _3084;
    }
    float _3086 = _3054;
    if (!_1966)
    {
        int _3088 = ~_3038;
        int _3090 = _3088 + 1;
        _3080 = _3090;
    }
    int _3092 = _3080;
    float _3094 = 1.0 / _3064;
    int _3096 = ~as_type<int>(_3060);
    int _3098 = _3096 + 1;
    int _3100 = _3098 + 1;
    float _3102 = fma(_3042, 0.5, 0.5);
    float _3104 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _3106 = _3100;
    if (!_2230)
    {
        int _3108 = ~as_type<int>(_3060);
        int _3110 = _3108 + 1;
        _3106 = _3110;
    }
    int _3112 = _3106;
    if (_3046)
    {
        out.m_47.x = 0.0;
    }
    if (_3046)
    {
        _3082 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3114 = _3082;
    float _3116 = 1.0 / _3068;
    float _3118 = -_2998;
    float _3120 = fma(_3118, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _3122 = _2998 < 0.5;
    float _3124 = float(_3122);
    float _3126 = -_3102;
    float _3128 = fma(_3126, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _3130 = as_type<int>(_3114);
    if (_3046)
    {
        float _3132 = _3114 * 5.0;
        _3130 = as_type<int>(_3132);
    }
    int _3134 = _3130;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3140 = -_3124;
    float _3142 = fma(_3140, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _3144 = 1.0 / _3072;
    float _3146 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (_3046)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9826 = as_type<float>(_3134);
        out.gl_Position.z = _9826;
    }
    float _3148 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _3150 = fma(_464, _1652, _3104);
    float _3152 = _2940;
    if (_2972)
    {
        float _3154 = floor(_3086);
        _3152 = _3154;
    }
    float _3156 = _3152;
    if (_3046)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3158 = -_2554;
    float _3160 = _3158 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3162 = -_2562;
    float _3164 = _3162 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3166 = fma(_464, _1654, _3146);
    float _3168 = -_2574;
    float _3170 = _3168 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3172 = _3160 * _3160;
    float _3174 = fma(_464, _1656, _3148);
    float _3176 = abs(_3120);
    float _3178 = _2570 * _3176;
    if (_2972)
    {
        float _3180 = -_3156;
        float _3182 = _3086 + _3180;
        _1886 = _3182;
    }
    float _3184 = _1886;
    float _3186 = fma(_3164, _3164, _3172);
    float _3188 = -_3166;
    float _3190 = _2242 + _3188;
    float _3192 = fma(_2582, _3128, _3178);
    float _3194 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3196 = _3184 + _3194;
    float _3198 = fma(_3170, _3170, _3186);
    float _3200 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3202 = _3184 + _3200;
    float _3204 = 1.0 / _3138;
    float _3206 = _3196 * _3144;
    float _3208 = -_3150;
    float _3210 = _2244 + _3208;
    float _3212 = _3190 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3214 = _3190 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3216 = _3202 * _3116;
    float _3218 = _3190 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3220 = fma(_3210, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3212);
    float _3222 = rsqrt(_3198);
    float _3224 = fma(_3210, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3214);
    float _3226 = fma(_3210, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3218);
    float _3228 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3230 = _3184 + _3228;
    float _3232 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3234 = _3184 + _3232;
    float _3236 = abs(_3142);
    float _3238 = fma(_2612, _3236, _3192);
    float _3240 = _3230 * _3094;
    float _3242 = _3234 * _3204;
    float _3244 = _131 + (-0.5);
    float _3246 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _3248 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3250 = _3164 * _3222;
    float _3252 = _3170 * _3222;
    float _3254 = -_3246;
    float _3256 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3254);
    float _3258 = -_3248;
    float _3260 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _3258);
    float _3262 = _3250 * _3250;
    float _3264 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3266 = (*spvDescriptorSet0.vp_c9)._m0[180].w + _3264;
    float _3268 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3270 = fma(_3252, _3252, _3262);
    float _3272 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _3274 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _3276 = -_3268;
    float _3278 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[1].y, _3276);
    float _3280 = 1.0 / _3266;
    float _3282 = -_3272;
    float _3284 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3282);
    float _3286 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3288 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _3290 = -_3274;
    float _3292 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _3290);
    float _3294 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3296 = -_3286;
    float _3298 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3296);
    float _3300 = _3160 * _3222;
    float _3302 = rsqrt(_3270);
    float _3304 = -_3288;
    float _3306 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3304);
    float _3308 = -_3294;
    float _3310 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3308);
    float _3312 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[1].w, _3278);
    float _3314 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3316 = _3314 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3318 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[1].w, _3310);
    float _3320 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3322 = (*spvDescriptorSet0.vp_c9)._m0[182].w + _3320;
    float _3324 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _3326 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _3328 = abs(_2962);
    float _3330 = _169 + (-0.5);
    float _3332 = float(_2226);
    float _3334 = _173 + (-0.5);
    float _3336 = float(_3328);
    float _3338 = _3252 * _3302;
    float _3340 = _3250 * _3302;
    float _3342 = 1.0 / _3316;
    float _3344 = -_3338;
    float _3346 = _3252 * _3344;
    float _3348 = _3300 * _3340;
    float _3350 = -_3338;
    float _3352 = _3300 * _3350;
    bool _3354 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3356 = isnan(1.0);
    bool _3358 = _3354 || _3356;
    bool _3360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3362 = _3358 || _3360;
    float _3364 = -_3346;
    float _3366 = fma(_3250, _3340, _3364);
    float _3368 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3370 = -_3326;
    float _3372 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3370);
    float _3374 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3376 = _3184 + _3374;
    float _3378 = _3366 * _3366;
    float _3380 = 1.0 / _3322;
    float _3382 = -_3368;
    float _3384 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3382);
    float _3386 = _3376 * _3280;
    float _3388 = fma(_3348, _3348, _3378);
    float _3390 = _3306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3392 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[1].w, _3384);
    float _3394 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3396 = _3184 + _3394;
    float _3398 = fma(_3352, _3352, _3388);
    float _3400 = -_3390;
    float _3402 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3400);
    float _3404 = fma(_3392, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3372);
    float _3406 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3408 = _3184 + _3406;
    float _3410 = rsqrt(_3398);
    float _3412 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3402);
    float _3414 = _3408 * _3342;
    float _3416 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3418 = -_3412;
    float _3420 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3404);
    float _3422 = _3396 * _3380;
    float _3424 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3426 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3424;
    float _3428 = -(*spvDescriptorSet0.vp_c9)._m0[175].z;
    float _3430 = (*spvDescriptorSet0.vp_c9)._m0[176].z + _3428;
    float _3432 = 1.0 / _3420;
    float _3434 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3436 = _3434 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3438 = -_3324;
    float _3440 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3438);
    float _3442 = fma(_3426, _3240, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3444 = fma(_3430, _3240, (*spvDescriptorSet0.vp_c9)._m0[175].z);
    float _3446 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _3448 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3440);
    float _3450 = _3366 * _3410;
    float _3452 = precise::clamp(_3450, 0.0, 1.0);
    float _3454 = -_3416;
    float _3456 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3454);
    float _3458 = -_3446;
    float _3460 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[0].y, _3458);
    float _3462 = -_3452;
    float _3464 = _3462 + 1.0;
    float _3466 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3456);
    float _3468 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3460);
    float _3470 = float(_3092);
    float _3472 = -(*spvDescriptorSet0.vp_c9)._m0[176].z;
    float _3474 = _3472 + (*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _3476 = fma(_3448, _3432, -1.0);
    float _3478 = _3464 * _3432;
    float _3480 = fma(_3436, _3216, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _3482 = fma(_3464, _3476, 1.0);
    float _3484 = _3468 * _3478;
    float _3486 = _3466 * _3478;
    float _3488 = _3482 * _3482;
    float _3490 = -(*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _3492 = (*spvDescriptorSet0.vp_c9)._m0[178].z + _3490;
    float _3494 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3496 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3494;
    float _3498 = fma(_3484, _3484, _3488);
    float _3500 = fma(_3474, _3216, (*spvDescriptorSet0.vp_c9)._m0[176].z);
    bool _3502 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3504 = isnan(_3184);
    bool _3506 = _3502 || _3504;
    bool _3508 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3510 = _3506 || _3508;
    float _3512 = float(_3510);
    float _3514 = fma(_3496, _3206, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3516 = fma(_3486, _3486, _3498);
    float _3518 = fma(_3492, _3206, (*spvDescriptorSet0.vp_c9)._m0[177].z);
    float _3520 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3522 = _3520 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[178].z;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[179].z;
    int _3528 = abs(_2826);
    float _3530 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3532 = _3530 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3534 = rsqrt(_3516);
    float _3536 = fma(_3522, _3242, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3538 = fma(_3526, _3242, (*spvDescriptorSet0.vp_c9)._m0[178].z);
    float _3540 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3542 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3540;
    float _3544 = -(*spvDescriptorSet0.vp_c9)._m0[180].z;
    float _3546 = _3544 + (*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _3548 = -(*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _3550 = (*spvDescriptorSet0.vp_c9)._m0[180].z + _3548;
    float _3552 = float(_3528);
    float _3554 = fma(_3532, _3414, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3556 = fma(_3542, _3386, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3558 = fma(_3546, _3414, (*spvDescriptorSet0.vp_c9)._m0[180].z);
    bool _3560 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3562 = isnan(_3184);
    bool _3564 = _3560 || _3562;
    bool _3566 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3568 = _3564 || _3566;
    float _3570 = float(_3568);
    float _3572 = _3552 * _3470;
    bool _3574 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3576 = isnan(_3184);
    bool _3578 = _3574 || _3576;
    bool _3580 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3582 = _3578 || _3580;
    float _3584 = float(_3582);
    float _3586 = fma(_3550, _3386, (*spvDescriptorSet0.vp_c9)._m0[179].z);
    float _3588 = _3336 * _3332;
    float _3590 = _3482 * _3534;
    float _3592 = _3484 * _3534;
    float _3594 = _3486 * _3534;
    bool _3596 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3598 = isnan(_3184);
    bool _3600 = _3596 || _3598;
    bool _3602 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3604 = _3600 || _3602;
    float _3606 = float(_3604);
    float _3608 = _3252 * _3590;
    float _3610 = -_3584;
    float _3612 = _3610 + 1.0;
    float _3614 = -_3594;
    float _3616 = _3250 * _3614;
    float _3618 = -_3570;
    float _3620 = _3618 + 1.0;
    float _3622 = -_3594;
    float _3624 = -_3608;
    float _3626 = fma(_3300, _3622, _3624);
    float _3628 = -_3592;
    float _3630 = _3300 * _3628;
    float _3632 = _3570 * _3612;
    float _3634 = -_3592;
    float _3636 = -_3616;
    float _3638 = fma(_3252, _3634, _3636);
    float _3640 = _3606 * _3620;
    bool _3642 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3644 = isnan(_3184);
    bool _3646 = _3642 || _3644;
    bool _3648 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3650 = _3646 || _3648;
    float _3652 = float(_3650);
    float _3654 = -_3606;
    float _3656 = _3654 + 1.0;
    float _3658 = _3638 * _3638;
    float _3660 = -_3630;
    float _3662 = fma(_3250, _3590, _3660);
    float _3664 = _3572 * (-2.0);
    float _3666 = _3652 * _3656;
    float _3668 = -_3652;
    float _3670 = _3668 + 1.0;
    float _3672 = fma(_3626, _3626, _3658);
    float _3674 = in.m_74.x;
    float _3676 = in.m_74.y;
    float _3678 = in.m_74.z;
    bool _3680 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3682 = isnan(_3184);
    bool _3684 = _3680 || _3682;
    bool _3686 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3688 = _3684 || _3686;
    float _3690 = float(_3688);
    float _3692 = -(*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _3694 = (*spvDescriptorSet0.vp_c9)._m0[182].z + _3692;
    float _3696 = fma(_3662, _3662, _3672);
    float _3698 = fma(_1968, _3664, _1968);
    float _3700 = _3690 * _3670;
    float _3702 = -_3690;
    float _3704 = _3702 + 1.0;
    bool _3706 = !_3362;
    float _3708 = _3706 ? _145 : _3044;
    float _3710 = rsqrt(_3696);
    float _3712 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3714 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3712;
    bool _3716 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3718 = isnan(_3184);
    bool _3720 = _3716 || _3718;
    bool _3722 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3724 = _3720 || _3722;
    float _3726 = float(_3724);
    float _3728 = _3512 * _3704;
    float _3730 = -_3512;
    float _3732 = _3730 + 1.0;
    float _3734 = fma(_3714, _3422, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3736 = fma(_3694, _3422, (*spvDescriptorSet0.vp_c9)._m0[181].z);
    bool _3738 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3740 = isnan(_3184);
    bool _3742 = _3738 || _3740;
    bool _3744 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3746 = _3742 || _3744;
    float _3748 = float(_3746);
    float _3750 = _3726 * _3732;
    float _3752 = -_3726;
    float _3754 = _3752 + 1.0;
    float _3756 = float(_3112);
    float _3758 = _3748 * _3754;
    float _3760 = fma(_3664, _3674, _3674);
    float _3762 = _3626 * _3710;
    float _3764 = _3662 * _3710;
    float _3766 = _3442 * _3758;
    float _3768 = fma(_3244, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3760);
    float _3770 = _3638 * _3710;
    float _3772 = _3252 * _3762;
    float _3774 = _3300 * _3764;
    float _3776 = fma(_3708, _3698, _3768);
    float _3778 = _3250 * _3770;
    float _3780 = -_3772;
    float _3782 = fma(_3250, _3764, _3780);
    float _3784 = _3444 * _3758;
    float _3786 = _3776 * 0.15915493667125701904296875;
    float _3788 = -_3774;
    float _3790 = fma(_3252, _3770, _3788);
    float _3792 = -_3778;
    float _3794 = fma(_3300, _3762, _3792);
    int _3796 = abs(_2970);
    float _3798 = _3588 * (-2.0);
    float _3800 = _3782 * _3782;
    float _3802 = in.m_58.y;
    float _3804 = _3786 * 6.283185482025146484375;
    float _3806 = sin(_3804);
    float _3808 = fma(_3798, _3676, _3676);
    float _3810 = fma(_3790, _3790, _3800);
    float _3812 = float(_3796);
    float _3814 = fma(_2100, _3798, _2100);
    float _3816 = fma(_3330, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3808);
    float _3818 = fma(_3794, _3794, _3810);
    float _3820 = -_3748;
    float _3822 = _3820 + 1.0;
    float _3824 = _3812 * _3756;
    float _3826 = _3786 * 6.283185482025146484375;
    float _3828 = cos(_3826);
    float _3830 = fma(_3708, _3814, _3816);
    float _3832 = fma(_3822, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3766);
    float _3834 = fma(_3822, (*spvDescriptorSet0.vp_c9)._m0[175].z, _3784);
    float _3836 = _3830 * 0.15915493667125701904296875;
    float _3838 = fma(_3480, _3750, _3832);
    float _3840 = fma(_3500, _3750, _3834);
    float _3842 = rsqrt(_3818);
    float _3844 = _3824 * (-2.0);
    float _3846 = fma(_3514, _3728, _3838);
    float _3848 = fma(_3518, _3728, _3840);
    float _3850 = fma(_3844, _3678, _3678);
    float _3852 = fma(_1980, _3844, _1980);
    float _3854 = _3802 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _3856 = _3836 * 6.283185482025146484375;
    float _3858 = sin(_3856);
    float _3860 = fma(_3334, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3850);
    float _3862 = fma(_3536, _3700, _3846);
    float _3864 = _3854 * _2604;
    float _3866 = fma(_3538, _3700, _3848);
    float _3868 = fma(_3708, _3852, _3860);
    float _3870 = fma(_3556, _3666, _3862);
    float _3872 = _3864 * _2626;
    float _3874 = _3794 * _3842;
    float _3876 = _3790 * _3842;
    float _3878 = _3782 * _3842;
    float _3880 = _3868 * 0.15915493667125701904296875;
    float _3882 = _3250 * _3874;
    float _3884 = _3238 * _3872;
    float _3886 = _3252 * _3878;
    float _3888 = _3836 * 6.283185482025146484375;
    float _3890 = cos(_3888);
    float _3892 = -_3882;
    float _3894 = fma(_3252, _3876, _3892);
    float _3896 = _3300 * _3876;
    float _3898 = -_3886;
    float _3900 = fma(_3300, _3874, _3898);
    float _3902 = _3884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3904 = _3894 * _3894;
    float _3906 = -_3896;
    float _3908 = fma(_3250, _3878, _3906);
    float _3910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _300);
    float _3912 = _3880 * 6.283185482025146484375;
    float _3914 = cos(_3912);
    float _3916 = fma(_3900, _3900, _3904);
    float _3918 = _3902 * _2944;
    float _3920 = fma(_3586, _3666, _3866);
    float _3922 = _3806 * _3858;
    float _3924 = fma(_3908, _3908, _3916);
    float _3926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _296);
    float _3928 = _3918 * _3910;
    float _3930 = _3880 * 6.283185482025146484375;
    float _3932 = sin(_3930);
    float _3934 = _3828 * _3890;
    float _3936 = fma(_3554, _3640, _3870);
    float _3938 = fma(_3558, _3640, _3920);
    float _3940 = _2956 * _3926;
    float _3942 = _3806 * _3890;
    float _3944 = _3828 * _3858;
    float _3946 = fma(_3734, _3632, _3936);
    float _3948 = rsqrt(_3924);
    float _3950 = _3828 * _3914;
    float _3952 = _3806 * _3914;
    float _3954 = _3890 * _3914;
    float _3956 = fma(_3736, _3632, _3938);
    float _3958 = _3950 * _3928;
    float _3960 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3946);
    float _3962 = _300 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3964 = fma(_3932, _3934, _3922);
    float _3966 = -_3928;
    float _3968 = _3932 * _3966;
    float _3970 = -_3944;
    float _3972 = fma(_3932, _3942, _3970);
    float _3974 = _3952 * _3928;
    float _3976 = fma(_3964, _3940, _3958);
    float _3978 = fma(_3954, _3940, _3968);
    float _3980 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[182].z, _3956);
    float _3982 = fma(_3972, _3940, _3974);
    float _3984 = _3976 * _3874;
    float _3986 = _3908 * _3948;
    float _3988 = _3976 * _3876;
    float _3990 = _3900 * _3948;
    float _3992 = -_3942;
    float _3994 = fma(_3932, _3944, _3992);
    float _3996 = fma(_3978, _3986, _3984);
    float _3998 = _3894 * _3948;
    float _4000 = fma(_3978, _3990, _3988);
    float _4002 = _3960 + 1.0;
    float _4004 = fma(_3252, _3982, _3996);
    float _4006 = _3964 * _3876;
    float _4008 = fma(_3250, _3982, _4000);
    float _4010 = fma(_3932, _3922, _3934);
    float _4012 = _2574 + _4004;
    float _4014 = _3858 * _3914;
    float _4016 = _2562 + _4008;
    float _4018 = _2450 * _4002;
    float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4022 = _4012 + _4020;
    float _4024 = _3964 * _3878;
    float _4026 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4028 = _4016 + _4026;
    float _4030 = _3950 * _3876;
    float _4032 = _4022 * _4022;
    float _4034 = _3950 * _3878;
    float _4036 = _3964 * _3874;
    float _4038 = _3950 * _3874;
    float _4040 = fma(_4028, _4028, _4032);
    float _4042 = _3994 * _3874;
    float _4044 = fma(_3954, _3990, _4006);
    float _4046 = _3994 * _3878;
    float _4048 = sqrt(_4040);
    float _4050 = fma(_3962, _3962, 1.0);
    float _4052 = _3976 * _3878;
    float _4054 = _3994 * _3876;
    float _4056 = fma(_3954, _3998, _4024);
    float _4058 = fma(_3954, _3986, _4036);
    float _4060 = fma(_3978, _3998, _4052);
    float _4062 = -_3932;
    float _4064 = fma(_4062, _3998, _4034);
    float _4066 = rsqrt(_4050);
    float _4068 = fma(_4014, _3990, _4054);
    float _4070 = fma(_3300, _3982, _4060);
    float _4072 = fma(_4014, _3998, _4046);
    float _4074 = -_3932;
    float _4076 = fma(_4074, _3990, _4030);
    float _4078 = -_3932;
    float _4080 = fma(_4078, _3986, _4038);
    float _4082 = _2554 + _4070;
    float _4084 = fma(_4014, _3986, _4042);
    bool _4086 = _4048 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4088 = fma(_4010, _3250, _4068);
    float _4090 = fma(_4010, _3300, _4072);
    float _4092 = fma(_3952, _3250, _4076);
    float _4094 = fma(_3952, _3300, _4064);
    float _4096 = fma(_3952, _3252, _4080);
    float _4098 = fma(_4010, _3252, _4084);
    float _4100 = _4070;
    float _4102 = _4016;
    float _4104 = _4012;
    if (!_4086)
    {
        _4100 = _4082;
    }
    float _4106 = _4100;
    bool _4108 = !_4086;
    float _4110 = _4106;
    if (!_4108)
    {
        float _4112 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4114 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4116 = _4048 + _4114;
        float _4118 = _4082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4120 = rsqrt(_4040);
        float _4122 = _4116 * _4112;
        float _4124 = _4122 * 0.15915493667125701904296875;
        float _4126 = _4124 * 6.283185482025146484375;
        float _4128 = cos(_4126);
        float _4130 = _4124 * 6.283185482025146484375;
        float _4132 = sin(_4130);
        float _4134 = _4128 + (-1.0);
        float _4136 = _4134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4138 = fma(_4132, _4118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4140 = fma(_4082, _4128, _4136);
        float _4142 = _4120 * _4138;
        float _4144 = fma(_4028, _4142, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4146 = fma(_4022, _4142, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4110 = _4140;
        _4102 = _4144;
        _4104 = _4146;
    }
    float _4148 = _4110;
    float _4150 = _4102;
    float _4152 = _4104;
    float _4154 = -_2554;
    float _4156 = _4154 + _4148;
    float _4158 = fma(_3972, _3250, _4044);
    float _4160 = fma(_3972, _3300, _4056);
    float _4162 = fma(_3972, _3252, _4058);
    float _4164 = -_2562;
    float _4166 = _4164 + _4150;
    float _4168 = _4156 * _4156;
    float _4170 = -_2574;
    float _4172 = _4170 + _4152;
    float _4174 = _296 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4176 = _3962 * _4066;
    float _4178 = fma(_4166, _4166, _4168);
    float _4180 = _3962 * _4092;
    float _4182 = _3962 * _4094;
    float _4184 = _3962 * _4096;
    float _4186 = fma(_4172, _4172, _4178);
    float _4188 = -_4088;
    float _4190 = _4176 * _4188;
    float _4192 = -_4090;
    float _4194 = _4176 * _4192;
    float _4196 = -_4098;
    float _4198 = _4176 * _4196;
    float _4200 = sqrt(_4186);
    float _4202 = fma(_4174, _4158, _4180);
    float _4204 = fma(_4174, _4160, _4182);
    float _4206 = fma(_4174, _4162, _4184);
    float _4208 = fma(_4066, _4092, _4190);
    float _4210 = fma(_4066, _4094, _4194);
    float _4212 = fma(_4066, _4096, _4198);
    float _4214 = _4088 + _4202;
    float _4216 = _4090 + _4204;
    float _4218 = _4098 + _4206;
    float _4220 = _3980 + 1.0;
    out.m_76.x = _4208;
    out.m_76.y = _4210;
    out.m_76.z = _4212;
    float _4222 = -_3174;
    float _4224 = _1724 + _4222;
    float _4226 = _2480 * _4220;
    out.m_78.x = _4214;
    out.m_78.y = _4216;
    out.m_78.z = _4218;
    bool _4228 = _4200 > 0.0;
    float _4230 = fma(_4224, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3220);
    float _4232 = fma(_4224, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3226);
    out.m_80.x = _4158;
    out.m_80.y = _4160;
    out.m_80.z = _4162;
    float _4234 = -_2716;
    float _4236 = _2562 + _4234;
    float _4238 = fma(_4224, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3224);
    float _4240 = fma(_4018, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4230);
    float _4242 = -_2716;
    float _4244 = _4242 + _4150;
    float _4246 = -_2698;
    float _4248 = _4246 + _4148;
    float _4250 = -_2748;
    float _4252 = _4250 + _4152;
    float _4254 = -_2698;
    float _4256 = _2554 + _4254;
    float _4258 = -_2748;
    float _4260 = _2574 + _4258;
    float _4262 = fma(_4226, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4232);
    bool _4264 = !_4228;
    float _4266 = _4162;
    float _4268 = _4160;
    float _4270 = _4212;
    float _4272 = _4210;
    float _4274 = _4262;
    float _4276 = _4262;
    float _4278 = _4248;
    float _4280 = _4244;
    float _4282 = _4252;
    float _4284 = _4212;
    float _4286 = _4210;
    if (!_4264)
    {
        bool _4288 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4290 = _4208;
        if (_4288)
        {
            float _4292 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4290 = _4292;
        }
        float _4294 = _4290;
        if (_4288)
        {
            _4266 = _4240;
        }
        float _4296 = _4266;
        float _4298 = _4296;
        if (_4288)
        {
            _4268 = _4238;
        }
        float _4300 = _4268;
        float _4302 = _4294;
        float _4304 = _4300;
        if (_4288)
        {
            float _4306 = _4240 * _4294;
            _4270 = _4306;
        }
        float _4308 = _4270;
        float _4310 = _4308;
        if (_4288)
        {
            float _4312 = _4238 * _4294;
            _4272 = _4312;
        }
        float _4314 = _4272;
        float _4316 = _4314;
        if (_4288)
        {
            float _4318 = _4262 * _4294;
            _4302 = _4318;
        }
        float _4320 = _4302;
        float _4322 = _4320;
        if (!_4288)
        {
            bool _4324 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4326 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4328 = _4324 || _4326;
            bool _4330 = isnan(1.0);
            bool _4332 = _4328 || _4330;
            float _4334 = _145 + 1.0;
            float _4336 = _4334;
            if (!_4332)
            {
                float _4338 = _4334 * _4334;
                float _4340 = _4338 * 0.5;
                _4274 = _4340;
            }
            float _4342 = _4274;
            float _4344 = _4342;
            if (!_4332)
            {
                float _4346 = _4342 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4344 = _4346;
            }
            float _4348 = _4344;
            bool _4350 = !_4332;
            float _4352 = _4348;
            if (!_4350)
            {
                float _4354 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4356 = log2(_4354);
                float _4358 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4360 = _4358 + 1.0;
                float _4362 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4364 = _4356 * _4334;
                float _4366 = 1.0 / _4360;
                float _4368 = _4362 * 0.693147182464599609375;
                float _4370 = exp2(_4364);
                float _4372 = 1.0 / _4368;
                float _4374 = _4370 + (-1.0);
                float _4376 = -_4374;
                float _4378 = fma(_4376, _4372, _4334);
                float _4380 = _4378 * _4366;
                float _4382 = _4380 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4352 = _4382;
            }
            float _4384 = _4352;
            float _4386 = _4384 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4388 = _4384 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4390 = !_4332;
            if (!_4390)
            {
                float _4392 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4394 = log2(_4392);
                float _4396 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4398 = _4396 + 1.0;
                float _4400 = 1.0 / _4398;
                float _4402 = _4394 * _4334;
                float _4404 = exp2(_4402);
                float _4406 = -_4404;
                float _4408 = _4406 + 1.0;
                float _4410 = _4408 * _4400;
                _4336 = _4410;
            }
            float _4412 = _4336;
            float _4414 = fma(_4412, _1654, _4388);
            float _4416 = _4384 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4418 = fma(_4412, _1652, _4386);
            float _4420 = -_3166;
            float _4422 = _4420 + _4414;
            float _4424 = fma(_4412, _1656, _4416);
            float _4426 = -_3150;
            float _4428 = _4426 + _4418;
            float _4430 = _4422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4432 = _4422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4434 = _4422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4436 = -_3174;
            float _4438 = _4436 + _4424;
            float _4440 = fma(_4428, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4430);
            float _4442 = fma(_4428, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4432);
            float _4444 = fma(_4428, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4434);
            float _4446 = fma(_4438, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4440);
            float _4448 = fma(_4438, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4442);
            float _4450 = fma(_4438, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4444);
            _4304 = _4448;
            _4298 = _4446;
            _4276 = _4450;
            _4310 = _4446;
            _4316 = _4448;
            _4322 = _4450;
        }
        float _4452 = _4304;
        float _4454 = _4298;
        float _4456 = _4276;
        float _4458 = _4310;
        float _4460 = _4316;
        float _4462 = _4322;
        float _4464 = _4452 * _4452;
        float _4466 = rsqrt(_4186);
        float _4468 = fma(_4454, _4454, _4464);
        float _4470 = fma(_4456, _4456, _4468);
        float _4472 = sqrt(_4470);
        float _4474 = _4166 * _4466;
        float _4476 = _4156 * _4466;
        float _4478 = _4172 * _4466;
        bool _4480 = _4472 > 0.0;
        bool _4482 = !_4480;
        _4284 = _4458;
        _4286 = _4460;
        if (!_4482)
        {
            float _4484 = rsqrt(_4470);
            float _4486 = _4484 * _4452;
            float _4488 = _4484 * _4454;
            float _4490 = _4484 * _4456;
            float _4492 = _4476 * _4486;
            float _4494 = fma(_4474, _4488, _4492);
            float _4496 = fma(_4478, _4490, _4494);
            float _4498 = _4496 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4500 = fma(_4458, _4498, _4244);
            float _4502 = fma(_4460, _4498, _4248);
            float _4504 = fma(_4462, _4498, _4252);
            _4278 = _4502;
            _4280 = _4500;
            _4282 = _4504;
        }
    }
    float _4506 = _4278;
    float _4508 = _4280;
    float _4510 = _4282;
    float _4512 = _4284;
    float _4514 = _4286;
    float _4516 = -_2688;
    float _4518 = fma(_4516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4506);
    float _4520 = -_2690;
    float _4522 = fma(_4520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4508);
    float _4524 = -_2740;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4510);
    float _4528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4530 = _4518 + _4528;
    float _4532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4534 = _4522 + _4532;
    float _4536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4538 = _4526 + _4536;
    float _4540 = _4530 * _4530;
    float _4542 = fma(_4534, _4534, _4540);
    float _4544 = fma(_4538, _4538, _4542);
    float _4546 = rsqrt(_4544);
    float _4548 = _4546 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4550 = _4534 * _4548;
    float _4552 = _4538 * _4548;
    float _4554 = _4550 * _4550;
    float _4556 = _4552 * _4552;
    float _4558 = _4554 + _4556;
    float _4560 = sqrt(_4558);
    bool _4562 = _4560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4566 = _4560 + _4564;
    float _4568 = _4512;
    float _4570 = _4558;
    float _4572 = _4566;
    float _4574 = _4514;
    float _4576 = _4530;
    float _4578 = _4548;
    float _4580 = _4550;
    if (_4562)
    {
        float _4582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4568 = _4582;
    }
    float _4584 = _4568;
    if (_4562)
    {
        float _4586 = rsqrt(_4558);
        _4570 = _4586;
    }
    float _4588 = _4570;
    float _4590 = _4584;
    float _4592 = _4588;
    if (_4562)
    {
        float _4594 = _4566 * _4584;
        _4572 = _4594;
    }
    float _4596 = _4572;
    if (_4562)
    {
        float _4598 = _4596 * 0.15915493667125701904296875;
        _4574 = _4598;
    }
    float _4600 = _4574;
    float _4602 = _4538;
    if (_4562)
    {
        float _4604 = _4600 * 6.283185482025146484375;
        float _4606 = sin(_4604);
        _4602 = _4606;
    }
    float _4608 = _4602;
    float _4610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4612 = precise::max(0.0, _4610);
    float _4614 = _3150;
    if (_4562)
    {
        float _4616 = _4600 * 6.283185482025146484375;
        float _4618 = cos(_4616);
        _4614 = _4618;
    }
    float _4620 = _4614;
    float _4622 = -_4548;
    float _4624 = -_4612;
    float _4626 = fma(_4530, _4622, _4624);
    if (_4562)
    {
        float _4628 = _4626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4576 = _4628;
    }
    float _4630 = _4576;
    float _4632 = sqrt(_4544);
    float _4634 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4636 = _4608;
    float _4638 = _4630;
    if (_4562)
    {
        float _4640 = fma(_4608, _4630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4636 = _4640;
    }
    float _4642 = _4636;
    float _4644 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4634);
    float _4646 = _4642;
    float _4648 = _4620;
    if (_4562)
    {
        float _4650 = _4620 + (-1.0);
        _4638 = _4650;
    }
    float _4652 = _4638;
    float _4654 = _4652;
    if (_4562)
    {
        float _4656 = _4588 * _4642;
        _4578 = _4656;
    }
    float _4658 = _4578;
    if (!_4562)
    {
        _4646 = _4626;
    }
    float _4660 = _4646;
    float _4662 = _4660;
    if (_4562)
    {
        float _4664 = _4652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4590 = _4664;
    }
    float _4666 = _4590;
    if (_4562)
    {
        float _4668 = _4550 * _4658;
        _4580 = _4668;
    }
    float _4670 = _4580;
    if (!_4562)
    {
        _4654 = _4552;
    }
    float _4672 = _4654;
    float _4674 = _4672;
    if (_4562)
    {
        float _4676 = _4552 * _4658;
        _4674 = _4676;
    }
    float _4678 = _4674;
    if (!_4562)
    {
        _4592 = _4554;
    }
    float _4680 = _4592;
    float _4682 = _4680;
    if (_4562)
    {
        float _4684 = fma(_4626, _4620, _4666);
        _4662 = _4684;
    }
    float _4686 = _4662;
    if (_4562)
    {
        float _4688 = _4670 * _4670;
        _4682 = _4688;
    }
    float _4690 = _4682;
    if (!_4562)
    {
        _4648 = _4556;
    }
    float _4692 = _4648;
    float _4694 = _4692;
    if (_4562)
    {
        float _4696 = _4678 * _4678;
        _4694 = _4696;
    }
    float _4698 = _4694;
    float _4700 = fma(_4686, _4686, _4690);
    float _4702 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4704 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4706 = _4700 + _4698;
    float _4708 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4710 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4644);
    float _4712 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4714 = rsqrt(_4706);
    float _4716 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4708);
    float _4718 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4720 = fma(_4632, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4718);
    float _4722 = precise::clamp(_4720, 0.0, 1.0);
    float _4724 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4712);
    float _4726 = _4710 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4728 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4716);
    float _4730 = -_4722;
    float _4732 = _4730 + 1.0;
    float _4734 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4724);
    float _4736 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4704);
    float _4738 = _4728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4740 = abs(_4732);
    float _4742 = log2(_4740);
    float _4744 = _4734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4746 = _4726 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4748 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4750 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4736);
    float _4752 = _4714 * _4670;
    float _4754 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4748);
    float _4756 = _4714 * _4678;
    float _4758 = _4714 * _4686;
    float _4760 = _4752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4762 = -_4746;
    float _4764 = fma(_4762, _4702, 1.0);
    float _4766 = _4750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4768 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4754);
    float _4770 = -_4760;
    float _4772 = fma(_4758, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4770);
    float _4774 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4776 = _4742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4778 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4768);
    float _4780 = -_4756;
    float _4782 = fma(_4780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4772);
    float _4784 = log2(_4764);
    float _4786 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4788 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4774);
    float _4790 = fma(_4782, -0.5, 0.5);
    float _4792 = fma(_4782, 0.5, 0.5);
    float _4794 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4786);
    float _4796 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4788);
    float _4798 = _4758 + 1.0;
    float _4800 = 1.0 / _4778;
    float _4802 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4794);
    float _4804 = fma(_4792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4806 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4796);
    float _4808 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4802);
    float _4810 = fma(_4792, _4804, -0.212114393711090087890625);
    float _4812 = exp2(_4776);
    float _4814 = _4784 * 0.693147182464599609375;
    float _4816 = fma(_4792, _4810, 1.570728778839111328125);
    float _4818 = _4814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4820 = sqrt(_4790);
    float _4822 = _4808 * _4800;
    float _4824 = _4806 * _4800;
    float _4826 = fma(_4822, 0.5, 0.5);
    float _4828 = fma(_4824, -0.5, 0.5);
    float _4830 = -_4758;
    float _4832 = fma(_4812, _4798, _4830);
    float3 _12530 = float3(_4826, _4828, _4818);
    float _4834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12530, float3(0.0), isnan(_12530)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12530, float3(0.0), isnan(_12530)), level(0.0)).x;
    float _4836 = fma(_4832, 0.5, 0.5);
    float _4838 = _4820 * 0.636619746685028076171875;
    float _4840 = -_4816;
    float _4842 = fma(_4838, _4840, 1.0);
    float3 _12551 = float3(_4826, _4828, _4818);
    float4 _4845 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12551, float3(0.0), isnan(_12551)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12551, float3(0.0), isnan(_12551)), level(0.0)).xyzw;
    float _4847 = _4845.x;
    float _4849 = _4845.y;
    float _4851 = _4845.z;
    float _4853 = _4845.w;
    float2 _12568 = float2(_4842, _4836);
    float3 _4857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12568, float2(0.0), isnan(_12568)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12568, float2(0.0), isnan(_12568)), level(0.0)).xyz;
    float _4859 = _4857.x;
    float _4861 = _4857.y;
    float _4863 = _4857.z;
    float _4865 = -_2688;
    float _4867 = fma(_4865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4256);
    float _4869 = -_2690;
    float _4871 = fma(_4869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4236);
    float _4873 = -_2740;
    float _4875 = fma(_4873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4260);
    float _4877 = _4742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4879 = _4867 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4881 = _4808 + _4778;
    out.m_82.x = _4522;
    out.m_82.y = _4518;
    out.m_82.z = _4526;
    bool _4883 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4885 = isnan(_4632);
    bool _4887 = _4883 || _4885;
    bool _4889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4891 = _4887 || _4889;
    float _4893 = fma(_4871, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4879);
    float _4895 = exp2(_4877);
    out.m_84.x = _4871;
    out.m_84.y = _4867;
    out.m_84.z = _4875;
    float _4897 = fma(_4875, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4893);
    float _4899 = _4867 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4901 = _4897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4903 = fma(_4871, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4899);
    float _4905 = 1.0 / _4901;
    bool _4907 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4909 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4911 = _4907 || _4909;
    bool _4913 = isnan(0.5);
    bool _4915 = _4911 || _4913;
    float _4917 = fma(_4875, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4903);
    float _4919 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4921 = _4778 * 0.5;
    float _4923 = -_4895;
    float _4925 = _4923 + 1.0;
    float _4927 = _4917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4929 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4919);
    float _4931 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4933 = _4927 + _4901;
    float _4935 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4929);
    float _4937 = fma(_4806, -0.5, _4921);
    float _4939 = _4929;
    float _4941 = _4921;
    float _4943 = _4778;
    float _4945 = _4806;
    float _4947 = _4808;
    if (!_4915)
    {
        _4939 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4949 = _4939;
    float _4951 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4935);
    float _4953 = _4933 * _4905;
    float _4955 = _4953 * 0.5;
    float _4957 = _4949;
    float _4959 = _4951;
    if (!_4915)
    {
        _4941 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4961 = _4941;
    float _4963 = _4951 + _4778;
    if (!_4915)
    {
        float _4965 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4967 = fma(_4955, _4949, _4965);
        _4957 = _4967;
    }
    float _4969 = _4957;
    float _4971 = _4881 * 0.5;
    float _4973 = _4963 * 0.5;
    float _4975 = _4881;
    if (!_4915)
    {
        float _4977 = 1.0 / _4969;
        _4975 = _4977;
    }
    float _4979 = _4975;
    out.gl_Position.x = _4808;
    out.gl_Position.y = _4806;
    out.gl_Position.z = _4951;
    out.gl_Position.w = _4778;
    out.m_86.x = _4971;
    out.m_86.y = _4937;
    out.m_86.z = _4973;
    out.m_86.w = _4778;
    if (_4915)
    {
        _4943 = 1.0;
    }
    float _4981 = _4943;
    float _4983 = _4979;
    float _4985 = _4981;
    if (!_4915)
    {
        float _4987 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4989 = -_4961;
        float _4991 = fma(_4979, _4987, _4989);
        _4983 = _4991;
    }
    float _4993 = _4983;
    if (!_4891)
    {
        _4959 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4995 = _4959;
    float _4997 = _4995;
    float _4999 = _4995;
    if (!_4891)
    {
        _4945 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5001 = _4945;
    float _5003 = _5001;
    float _5005 = _5001;
    if (!_4891)
    {
        _4947 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5007 = _4947;
    float _5009 = _4931 * _4834;
    float _5011 = -_4931;
    float _5013 = _5011 + 1.0;
    float _5015 = _4853 * _5009;
    float _5017 = _4853 * _5013;
    float _5019 = _4863 * _5009;
    float _5021 = fma(_4859, _5015, _4847);
    float _5023 = _4847;
    float _5025 = _5007;
    float _5027 = _5007;
    if (!_4915)
    {
        float _5029 = -_4961;
        float _5031 = _5029 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _5023 = _5031;
    }
    float _5033 = _5023;
    float _5035 = fma(_4861, _5015, _4849);
    float _5037 = fma(_4853, _5019, _4851);
    float _5039 = _5033;
    if (!_4915)
    {
        float _5041 = 1.0 / _5033;
        _5039 = _5041;
    }
    float _5043 = _5039;
    out.m_88.x = _5021;
    out.m_88.y = _5035;
    out.m_88.z = _5037;
    out.m_88.w = _5017;
    if (!_4915)
    {
        float _5045 = _4993 * _5043;
        float _5047 = precise::clamp(_5045, 0.0, 1.0);
        _4985 = _5047;
    }
    float _5049 = _4985;
    float _5051 = _5049 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _5053 = !_4891;
    if (!_5053)
    {
        bool _5055 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5057 = isnan(_4632);
        bool _5059 = _5055 || _5057;
        bool _5061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5063 = _5059 || _5061;
        if (!_5063)
        {
            float _5065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5067 = _4632 + _5065;
            float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5069;
            float _5073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5075 = _5073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5077 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5079 = _5077 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5081 = 1.0 / _5071;
            float _5083 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5085 = _5083 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5087 = _5067 * _5081;
            float _5089 = precise::clamp(_5087, 0.0, 1.0);
            float _5091 = fma(_5089, _5075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5093 = fma(_5089, _5079, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5095 = fma(_5089, _5085, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5005 = _5093;
            _4999 = _5091;
            _5027 = _5095;
            _5097 = true;
        }
        else
        {
            bool _5099 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5101 = isnan(_4632);
            bool _5103 = _5099 || _5101;
            bool _5105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5107 = _5103 || _5105;
            if (!_5107)
            {
                _4997 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5109 = _4997;
            _4999 = _5109;
            if (!_5107)
            {
                _5003 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5111 = _5003;
            _5005 = _5111;
            if (!_5107)
            {
                _5025 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5113 = _5025;
            bool _5115 = !_5107;
            _5027 = _5113;
            if (!_5115)
            {
                bool _5117 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5119 = isnan(_4632);
                bool _5121 = _5117 || _5119;
                bool _5123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5125 = _5121 || _5123;
                if (!_5125)
                {
                    float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5129 = _4632 + _5127;
                    float _5131 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5133 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5131;
                    float _5135 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5137 = _5135 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5139 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5141 = _5139 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5143 = 1.0 / _5133;
                    float _5145 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5147 = _5145 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5149 = _5129 * _5143;
                    float _5151 = precise::clamp(_5149, 0.0, 1.0);
                    float _5153 = fma(_5151, _5137, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5155 = fma(_5151, _5141, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5157 = fma(_5151, _5147, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5005 = _5155;
                    _4999 = _5153;
                    _5027 = _5157;
                    _5097 = true;
                }
                else
                {
                    _5005 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4999 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5027 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5097 = false;
    float _5159 = _5005;
    float _5161 = _4999;
    float _5163 = _5027;
    float _5165 = _5051 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _5167 = _5159 * 0.586610972881317138671875;
    bool _5169 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5165;
    float _5171 = fma(_5161, 0.298911988735198974609375, _5167);
    bool _5173 = _5049 > 0.0;
    bool _5175 = isnan(_5049);
    bool _5177 = _5173 || _5175;
    bool _5179 = isnan(0.0);
    bool _5181 = _5177 || _5179;
    float _5183 = fma(_5163, 0.114477999508380889892578125, _5171);
    float _5185 = -_5183;
    float _5187 = _5185 + _5161;
    float _5189 = -_5183;
    float _5191 = _5189 + _5159;
    float _5193 = -_5183;
    float _5195 = _5193 + _5163;
    float _5197 = fma(_5187, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5183);
    float _5199 = fma(_5191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5183);
    float _5201 = fma(_5195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5183);
    bool _5203 = !_5169;
    if (!_5203)
    {
        float _5205 = -_4518;
        float _5207 = _5205 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5209 = -_4522;
        float _5211 = _5209 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5213 = -_4526;
        float _5215 = _5213 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5217 = _5207 * _5207;
        float _5219 = fma(_5211, _5211, _5217);
        float _5221 = fma(_5215, _5215, _5219);
        float _5223 = sqrt(_5221);
        float _5225 = rsqrt(_5221);
        float _5227 = -_5223;
        float _5229 = _5227 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5231 = _5229 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5233 = precise::clamp(_5231, 0.0, 1.0);
        float _5235 = _5211 * _5225;
        float _5237 = _5207 * _5225;
        float _5239 = abs(_5233);
        float _5241 = log2(_5239);
        float _5243 = _5215 * _5225;
        float _5245 = _5235 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5247 = _4216 * _5237;
        float _5249 = -_5237;
        float _5251 = -_5245;
        float _5253 = fma(_5249, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5251);
        float _5255 = fma(_4214, _5235, _5247);
        float _5257 = -_5243;
        float _5259 = fma(_5257, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5253);
        float _5261 = fma(_4218, _5243, _5255);
        float _5263 = precise::clamp(_5261, 0.0, 1.0);
        float _5265 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5267 = _5259 + _5265;
        float _5269 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5271 = _5267 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5273 = precise::clamp(_5271, 0.0, 1.0);
        float _5275 = exp2(_5269);
        float _5277 = _5275 * _5273;
        float _5279 = _5263 * _5277;
        float _5281 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5283 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5285 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _5281;
        out.m_90.y = _5283;
        out.m_90.z = _5285;
    }
    out.m_68.x = _5197;
    out.m_68.y = _5199;
    out.m_68.z = _5201;
    if (_5181)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _5287 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5287;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5097 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5344 = as_type<float>(_125);
        out.gl_Position.z = _5344;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    if (_141)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5417 = as_type<float>(_163);
        out.gl_Position.z = _5417;
    }
    if (_155)
    {
        return out;
    }
    float _165 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _167 = int(_165);
    float _169 = in.m_51.y;
    float _171 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_51.z;
    float _175 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _177 = int(_175);
    float _179 = in.m_51.w;
    float _181 = float(_167);
    float _183 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _185 = int(_183);
    float _187 = float(uint(_177));
    float _189 = 1.0 / _181;
    int _191 = ~_177;
    int _193 = _191 + 1;
    float _195 = 1.0 / _187;
    float _197 = float(_185);
    float _199 = _145 * _189;
    float _201 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _203 = int(_201);
    int _205 = as_type<int>(_195) + (-2);
    float _207 = trunc(_199);
    int _209 = int(_207);
    bool _211 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _215 = _211 || _213;
    bool _217 = isnan(1.0);
    bool _219 = _215 || _217;
    float _221 = 1.0 / _197;
    float _223 = float(uint(_203));
    int _225 = ~_203;
    int _227 = _225 + 1;
    float _229 = float(uint(_209));
    float _231 = 1.0 / _223;
    float _233 = 0.0;
    float _235 = _171;
    if (!_219)
    {
        float _237 = _171 * _171;
        float _239 = _237 * 0.5;
        _233 = _239;
    }
    float _241 = _233;
    float _243 = as_type<float>(_205) * _229;
    float _245 = _241;
    if (!_219)
    {
        float _247 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _247;
    }
    float _249 = _245;
    float _251 = _145 * _221;
    float _253 = trunc(_243);
    float _255 = precise::max(_253, 0.0);
    uint _258 = uint(_255);
    float _260 = as_type<float>(int(gl_VertexIndex));
    float _262 = trunc(_251);
    int _264 = int(_262);
    int _266 = as_type<int>(_231) + (-2);
    int _268 = _193 * int(_258);
    int _270 = _268 + _209;
    float _272 = float(uint(_270));
    float _274 = float(uint(_264));
    float _276 = as_type<float>(_205) * _272;
    int _278 = as_type<int>(_260) & 1;
    bool _280 = _278 != 0;
    int _282 = as_type<int>(_260) & 2;
    bool _284 = _282 != 0;
    float _286 = as_type<float>(_266) * _274;
    float _288 = trunc(_276);
    float _290 = precise::max(_288, 0.0);
    uint _292 = uint(_290);
    bool _294 = !_280;
    float _296 = _294 ? (-0.5) : 0.5;
    bool _298 = !_284;
    float _300 = _298 ? (-0.5) : 0.5;
    float _302 = trunc(_286);
    float _304 = precise::max(_302, 0.0);
    uint _306 = uint(_304);
    bool _308 = !_219;
    float _310 = _249;
    if (!_308)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = _171 * _314;
        float _324 = 1.0 / _318;
        float _326 = _320 * 0.693147182464599609375;
        float _328 = exp2(_322);
        float _330 = 1.0 / _326;
        float _332 = _328 + (-1.0);
        float _334 = -_332;
        float _336 = fma(_334, _330, _171);
        float _338 = _336 * _324;
        float _340 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _310 = _340;
    }
    float _342 = _310;
    bool _344 = !_219;
    if (!_344)
    {
        float _346 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _348 = log2(_346);
        float _350 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _352 = _350 + 1.0;
        float _354 = 1.0 / _352;
        float _356 = _171 * _348;
        float _358 = exp2(_356);
        float _360 = -_358;
        float _362 = _360 + 1.0;
        float _364 = _362 * _354;
        _235 = _364;
    }
    float _366 = _235;
    float _368 = 0.0;
    if (!_219)
    {
        float _370 = _145 * _145;
        float _372 = _370 * 0.5;
        _368 = _372;
    }
    float _374 = _368;
    int _376 = _227 * int(_306);
    int _378 = _376 + _264;
    bool _380 = _169 > 0.5;
    float _382 = _374;
    if (!_219)
    {
        float _384 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _382 = _384;
    }
    float _386 = _382;
    int _388 = int(_258) + int(_292);
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _392 = _390 != 0;
    int _394 = ~_177;
    int _396 = _394 + 1;
    float _398 = 0.0;
    float _400 = _386;
    if (!_219)
    {
        _398 = _145;
    }
    float _402 = _398;
    float _404 = float(uint(_378));
    bool _406 = !_219;
    float _408 = _402;
    if (!_406)
    {
        float _410 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _412 = log2(_410);
        float _414 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _416 = _414 + 1.0;
        float _418 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _420 = _145 * _412;
        float _422 = 1.0 / _416;
        float _424 = _418 * 0.693147182464599609375;
        float _426 = exp2(_420);
        float _428 = 1.0 / _424;
        float _430 = _426 + (-1.0);
        float _432 = -_430;
        float _434 = fma(_432, _428, _145);
        float _436 = _434 * _422;
        float _438 = _436 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _400 = _438;
    }
    float _440 = _400;
    bool _442 = !_219;
    if (!_442)
    {
        float _444 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _446 = log2(_444);
        float _448 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _450 = _448 + 1.0;
        float _452 = 1.0 / _450;
        float _454 = _145 * _446;
        float _456 = exp2(_454);
        float _458 = -_456;
        float _460 = _458 + 1.0;
        float _462 = _460 * _452;
        _408 = _462;
    }
    float _464 = _408;
    float _466 = as_type<float>(_266) * _404;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _474 = _472 != 0;
    int _476 = _396 * _388;
    int _478 = _476 + _209;
    bool _480 = _173 > 0.5;
    float _482 = trunc(_466);
    float _484 = precise::max(_482, 0.0);
    uint _486 = uint(_484);
    float _488 = -_296;
    int _490 = _380 ? as_type<int>(_488) : as_type<int>(_296);
    float _492 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _504 = _502 != 0;
    float _506 = _131 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _508 = !_392;
    int _510 = _508 ? 0 : 1;
    float _512 = in.m_58.w;
    float _514 = -_300;
    int _516 = _480 ? as_type<int>(_514) : as_type<int>(_300);
    bool _518 = uint(_478) >= uint(_177);
    int _520 = ~_203;
    int _522 = _520 + 1;
    bool _524 = !_500;
    float _526 = _524 ? _296 : as_type<float>(_490);
    bool _528 = !_504;
    float _530 = _528 ? _300 : as_type<float>(_516);
    bool _532 = !_518;
    int _534 = _532 ? 0 : (-1);
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _546 = _544 != 0;
    int _548 = int(_306) + int(_486);
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _552 = _550 != 0;
    bool _554 = !_552;
    int _556 = _554 ? 0 : 1;
    bool _558 = _179 > 0.5;
    int _560 = _522 * _548;
    int _562 = _560 + _264;
    bool _564 = !_470;
    int _566 = _564 ? 0 : 1;
    float _568 = -_300;
    int _570 = _558 ? as_type<int>(_568) : as_type<int>(_300);
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _574 = _572 != 0;
    bool _576 = uint(_562) >= uint(_203);
    bool _578 = !_474;
    int _580 = _578 ? 0 : 1;
    bool _582 = !_496;
    float _584 = _582 ? _300 : as_type<float>(_570);
    bool _586 = !_574;
    int _588 = _586 ? 0 : 1;
    bool _590 = !_576;
    int _592 = _590 ? 0 : (-1);
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _596 = _594 != 0;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _600 = _598 != 0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _608 = _606 != 0;
    float _610 = float(_109);
    bool _612 = !_600;
    int _614 = _612 ? 0 : 1;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _618 = _616 != 0;
    float _620 = 1.0 / _610;
    float _622 = float(_177);
    float _624 = float(_209);
    int _626 = ~_388;
    int _628 = _626 + _534;
    int _630 = _628 + 1;
    bool _632 = _624 >= _622;
    bool _634 = isnan(_624);
    bool _636 = _632 || _634;
    bool _638 = isnan(_622);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    bool _644 = !_542;
    int _646 = _644 ? 0 : 1;
    bool _648 = !_538;
    int _650 = _648 ? 0 : 1;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_618)
    {
        _652 = 1.0;
    }
    float _654 = _652;
    float _656 = trunc(_642);
    int _658 = int(_656);
    float _660 = _654;
    if (!_618)
    {
        _660 = 7.345489978790283203125;
    }
    float _662 = _660;
    float _664 = _145 * _620;
    bool _666 = !_596;
    int _668 = _666 ? 0 : 1;
    bool _670 = _177 == 0;
    float _672 = _662 * _131;
    int _674 = abs(_646);
    bool _676 = !_546;
    int _678 = _676 ? 0 : 1;
    float _680 = floor(_672);
    int _682 = ~_548;
    int _684 = _682 + _592;
    int _686 = _684 + 1;
    int _688 = abs(_678);
    bool _690 = _203 == 0;
    bool _692 = !_604;
    int _694 = _692 ? 0 : 1;
    int _696 = abs(_668);
    int _698 = abs(_694);
    bool _700 = _169 > 0.5;
    float _702 = -_680;
    float _704 = _672 + _702;
    int _706 = _177 + (-1);
    float _708 = -_300;
    int _710 = _700 ? as_type<int>(_708) : as_type<int>(_300);
    float _712 = _704 * _622;
    int _714 = _177 * _630;
    int _716 = _714 + _209;
    float _718 = _622 * _664;
    int _720 = abs(_510);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _724 = ~_658;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    float _730 = trunc(_712);
    int _732 = int(_730);
    bool _734 = !_670;
    int _736 = _734 ? _716 : (-1);
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _740 = _738 != 0;
    int _742 = _736 * _728;
    int _744 = abs(_650);
    float _746 = trunc(_718);
    int _748 = int(_746);
    int _750 = _658 * _706;
    int _752 = _750 + _742;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _756 = as_type<float>(_742);
    float _758 = as_type<float>(_706);
    if (_618)
    {
        _756 = 1.0;
    }
    float _760 = _756;
    int _762 = _752 * _674;
    float _764 = _760;
    if (_618)
    {
        _758 = _131;
    }
    float _766 = _758;
    int _768 = _732 * _720;
    int _770 = _768 + _209;
    float _772 = _766;
    if (!_618)
    {
        _764 = 1.2345600128173828125;
    }
    float _774 = _764;
    if (!_618)
    {
        _772 = _169;
    }
    float _776 = _772;
    float _778 = float(_203);
    int _780 = _748 * _744;
    int _782 = _780 + _762;
    int _784 = abs(_556);
    float _786 = _774 * _776;
    int _788 = _770 * _688;
    int _790 = _788 + _782;
    float _792 = float(_264);
    float _794 = floor(_786);
    float _796 = _778 * _664;
    int _798 = _732 * _784;
    int _800 = _798 + _790;
    bool _802 = _792 >= _778;
    bool _804 = isnan(_792);
    bool _806 = _802 || _804;
    bool _808 = isnan(_778);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = (*spvDescriptorSet0.vp_c10)._m0[8].w * 0.00999999977648258209228515625;
    float _816 = float(uint(_800));
    float _818 = trunc(_796);
    int _820 = int(_818);
    float _822 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _814);
    float _824 = as_type<float>(_205) * _816;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _826;
    float _830 = trunc(_812);
    int _832 = int(_830);
    float _834 = -_794;
    float _836 = _786 + _834;
    int _838 = ~_177;
    int _840 = _838 + 1;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _850 = _836 * _778;
    int _852 = _203 * _686;
    int _854 = _852 + _264;
    int _856 = abs(_588);
    float _858 = trunc(_824);
    float _860 = precise::max(_858, 0.0);
    uint _862 = uint(_860);
    bool _864 = !_690;
    int _866 = _864 ? _854 : (-1);
    bool _868 = _173 > 0.5;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _874 = trunc(_850);
    int _876 = int(_874);
    int _878 = ~_832;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    int _884 = abs(_614);
    int _886 = _866 * _882;
    int _888 = _203 + (-1);
    int _890 = _840 * int(_862);
    int _892 = _890 + _800;
    float _894 = 1.0 / _848;
    int _896 = _832 * _888;
    int _898 = _896 + _886;
    float _900 = float(uint(_892));
    int _902 = _898 * _884;
    float _904 = float(uint(_770));
    float _906 = as_type<float>(_205) * _900;
    int _908 = _876 * _856;
    int _910 = _908 + _264;
    bool _912 = !_608;
    int _914 = _912 ? 0 : 1;
    int _916 = _820 * _696;
    int _918 = _916 + _902;
    float _920 = as_type<float>(_205) * _904;
    float _922 = trunc(_906);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = abs(_914);
    int _930 = _910 * _698;
    int _932 = _930 + _918;
    int _934 = ~_177;
    int _936 = _934 + 1;
    int _938 = ~_203;
    int _940 = _938 + 1;
    int _942 = _876 * _928;
    int _944 = _942 + _932;
    float _946 = trunc(_920);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    int _952 = abs(_580);
    float _954 = float(uint(_944));
    int _956 = int(_862) + int(_926);
    float _958 = 1.0 / _872;
    float _960 = as_type<float>(_266) * _954;
    int _962 = _936 * _956;
    int _964 = _962 + _800;
    float _966 = trunc(_960);
    float _968 = precise::max(_966, 0.0);
    uint _970 = uint(_968);
    int _972 = _936 * int(_950);
    int _974 = _972 + _770;
    bool _976 = uint(_964) >= uint(_177);
    float _978 = float(uint(_974));
    bool _980 = !_976;
    int _982 = _980 ? 0 : (-1);
    float _984 = as_type<float>(_205) * _978;
    int _986 = ~_956;
    int _988 = _986 + _982;
    int _990 = _988 + 1;
    int _992 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _994 = _992 != 0;
    int _996 = _940 * int(_970);
    int _998 = _996 + _944;
    int _1000 = _177 * _990;
    int _1002 = _1000 + _800;
    bool _1004 = !_994;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = trunc(_984);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    float _1014 = float(uint(_998));
    int _1016 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1018 = _1016 != 0;
    bool _1020 = !_670;
    int _1022 = _1020 ? _1002 : (-1);
    float _1024 = as_type<float>(_266) * _1014;
    bool _1026 = !_1018;
    float _1028 = _1026 ? _300 : as_type<float>(_710);
    int _1030 = _1022 & 3;
    bool _1032 = _1030 != 0;
    float _1034 = trunc(_1024);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    int _1040 = _1022 & 3;
    bool _1042 = _1040 != 0;
    int _1044 = _1032 ? 0 : 1;
    bool _1046 = uint(_1040) > 1u;
    float _1048 = float(uint(_910));
    int _1050 = ~_177;
    int _1052 = _1050 + 1;
    int _1054 = int(_950) + int(_1012);
    float _1056 = as_type<float>(_266) * _1048;
    int _1058 = ~_1044;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    int _1064 = ~_203;
    int _1066 = _1064 + 1;
    float _1068 = trunc(_1056);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    int _1074 = _1052 * _1054;
    int _1076 = _1074 + _770;
    int _1078 = _1062;
    if (!_1046)
    {
        int _1080 = ~_1044;
        int _1082 = _1080 + 1;
        _1078 = _1082;
    }
    int _1084 = _1078;
    bool _1086 = uint(_1040) >= 2u;
    int _1088 = int(_970) + int(_1038);
    int _1090 = _1086 ? 0 : 1;
    float _1092 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _1094 = uint(_1076) >= uint(_177);
    int _1096 = _1066 * _1088;
    int _1098 = _1096 + _944;
    int _1100 = ~_203;
    int _1102 = _1100 + 1;
    bool _1104 = !_1042;
    int _1106 = _1104 ? 0 : 1;
    bool _1108 = !_1094;
    int _1110 = _1108 ? 0 : (-1);
    bool _1112 = uint(_1098) >= uint(_203);
    int _1114 = _1102 * int(_1072);
    int _1116 = _1114 + _910;
    int _1118 = ~_1054;
    int _1120 = _1118 + _1110;
    int _1122 = _1120 + 1;
    bool _1124 = !_1112;
    int _1126 = _1124 ? 0 : (-1);
    bool _1128 = _1040 != 3;
    float _1130 = float(uint(_1116));
    int _1132 = ~_1088;
    int _1134 = _1132 + _1126;
    int _1136 = _1134 + 1;
    int _1138 = _177 * _1122;
    int _1140 = _1138 + _770;
    int _1142 = ~_1090;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = as_type<float>(_266) * _1130;
    float _1150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _1152 = _203 * _1136;
    int _1154 = _1152 + _944;
    bool _1156 = !_670;
    int _1158 = _1156 ? _1140 : (-1);
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1162 = _1160 != 0;
    int _1164 = _1146;
    if (_1128)
    {
        int _1166 = ~_1090;
        int _1168 = _1166 + 1;
        _1164 = _1168;
    }
    int _1170 = _1164;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1174 = _1172 != 0;
    float _1176 = trunc(_1148);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    bool _1182 = !_690;
    int _1184 = _1182 ? _1154 : (-1);
    bool _1186 = !_1174;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = _1184 & 3;
    bool _1192 = _1190 != 0;
    bool _1194 = !_1162;
    int _1196 = _1194 ? 0 : 1;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    bool _1200 = uint(_1190) > 1u;
    float _1202 = _1092 * _1150;
    int _1204 = _1184 & 3;
    bool _1206 = _1204 != 0;
    bool _1208 = !_1192;
    int _1210 = _1208 ? 0 : 1;
    bool _1212 = _1040 != 3;
    int _1214 = _1206 ? 0 : 1;
    int _1216 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1218 = _1216 != 0;
    int _1220 = _1022 >> 31;
    int _1222 = ~_1214;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _492 * _1198;
    int _1230 = _1226;
    if (!_1200)
    {
        int _1232 = ~_1214;
        int _1234 = _1232 + 1;
        _1230 = _1234;
    }
    int _1236 = _1230;
    int _1238 = _1184 >> 31;
    int _1240 = _1220 & 3;
    int _1242 = _1238 & 3;
    int _1244 = _1022 + _1240;
    int _1246 = int(_1072) + int(_1180);
    int _1248 = _1184 + _1242;
    float _1250 = _131 * 2.0;
    int _1252 = _1244 >> 2;
    int _1254 = ~_203;
    int _1256 = _1254 + 1;
    float _1258 = floor(_1250);
    bool _1260 = uint(_1190) >= 2u;
    int _1262 = _1252 << 4;
    int _1264 = _1262 + 368;
    int _1266 = _1256 * _1246;
    int _1268 = _1266 + _910;
    int _1270 = _1260 ? 0 : 1;
    bool _1272 = _1190 != 3;
    uint _1274 = uint(int(uint(_1264) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[int(_1284)][_1286];
    int _1290 = _1248 >> 2;
    float _1292 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1294 = int(_1292);
    bool _1296 = !_1272;
    int _1298 = _1296 ? 0 : (-1);
    bool _1300 = uint(_1268) >= uint(_203);
    float _1302 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1304 = _1290 << 4;
    int _1306 = _1304 + 512;
    bool _1308 = !_1300;
    int _1310 = _1308 ? 0 : (-1);
    float _1312 = -_754;
    float _1314 = fma(_1302, 2.0, _1312);
    bool _1316 = _1190 != 3;
    int _1318 = ~_1246;
    int _1320 = _1318 + _1310;
    int _1322 = _1320 + 1;
    uint _1324 = uint(int(uint(_1306) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[int(_1334)][_1336];
    float _1340 = -_145;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1314);
    bool _1344 = !_1212;
    int _1346 = _1344 ? 0 : (-1);
    int _1348 = _203 * _1322;
    int _1350 = _1348 + _910;
    bool _1352 = _1258 >= 0.0;
    bool _1354 = isnan(_1258);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan(0.0);
    bool _1360 = _1356 || _1358;
    float _1362 = -_506;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1366 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1368 = _1264 + 8;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[int(_1380)][_1382];
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1390 = fma(_1366, -2.0, _722);
    int _1392 = ~_1270;
    int _1394 = _1392 + 1;
    int _1396 = _1394 + 1;
    int _1398 = _1396;
    if (_1316)
    {
        int _1400 = ~_1270;
        int _1402 = _1400 + 1;
        _1398 = _1402;
    }
    int _1404 = _1398;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1410 = _1258 > 0.0;
    float _1412 = 1.0 / _1388;
    int _1414 = abs(_1084);
    float _1416 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1390);
    int _1418 = _1306 + 8;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    uint _1422 = uint(int(uint(int(_1420)) >> uint(2)));
    int _1424 = int(_1420) & 3;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[int(_1422)][_1424];
    int _1428 = int(_1420) + 1;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    int _1432 = _1428 & 3;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[int(_1430)][_1432];
    int _1436 = abs(_1106);
    int _1438 = abs(_1236);
    float _1440 = 1.0 / _1408;
    int _1442 = ~_1414;
    int _1444 = _1442 + 1;
    int _1446 = _1444 + 1;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1450 = _1448 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1452 = ~_1436;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    int _1458 = ~_1438;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    int _1464 = abs(_1298);
    int _1466 = _1446 * as_type<int>(_1288);
    int _1468 = abs(_1170);
    float _1470 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1472 = int(_1470);
    bool _1474 = !_690;
    int _1476 = _1474 ? _1350 : (-1);
    int _1478 = _1456 * as_type<int>(_1280);
    int _1480 = _1478 + _1466;
    int _1482 = abs(_1210);
    float _1484 = _844 * _1412;
    int _1486 = ~_1468;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    float _1492 = _828 * _1440;
    float _1494 = 1.0 / _1450;
    float _1496 = float(uint(_1294));
    int _1498 = ~_1482;
    int _1500 = _1498 + 1;
    int _1502 = _1500 + 1;
    int _1504 = _1462 * as_type<int>(_1338);
    int _1506 = _1502 * as_type<int>(_1330);
    int _1508 = _1506 + _1504;
    float _1510 = 1.0 / _1496;
    int _1512 = abs(_1404);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _1518 = _1490 * as_type<int>(_1376);
    int _1520 = _1518 + _1480;
    int _1522 = abs(_1346);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1524;
    int _1528 = abs(_1188);
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1534 = ~_1522;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    float _1540 = 1.0 / _1516;
    int _1542 = ~_1528;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    float _1548 = _1526 * _1494;
    int _1550 = abs(_1294);
    int _1552 = _1538 * as_type<int>(_1384);
    int _1554 = _1552 + _1520;
    int _1556 = ~_1512;
    int _1558 = _1556 + 1;
    int _1560 = _1558 + 1;
    float _1562 = _1532 * _894;
    float _1564 = float(uint(_1550));
    int _1566 = _1554 * _1546;
    int _1568 = _1560 * as_type<int>(_1426);
    int _1570 = _1568 + _1508;
    int _1572 = _1158 * _1528;
    int _1574 = _1572 + _1566;
    float _1576 = 1.0 / _1564;
    int _1578 = abs(_1196);
    int _1580 = ~_1464;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1590 = as_type<int>(_1510) + (-2);
    float _1592 = float(uint(_1574));
    int _1594 = _1584 * as_type<int>(_1434);
    int _1596 = _1594 + _1570;
    float _1598 = float(uint(_1472));
    float _1600 = 1.0 / _1588;
    int _1602 = ~_1578;
    int _1604 = _1602 + 1;
    int _1606 = _1604 + 1;
    float _1608 = as_type<float>(_1590) * _1592;
    int _1610 = abs(_1574);
    int _1612 = abs(_1472);
    int _1614 = _1596 * _1606;
    int _1616 = as_type<int>(_1576) + (-2);
    float _1618 = 1.0 / _1598;
    float _1620 = float(uint(_1612));
    int _1622 = _1476 * _1578;
    int _1624 = _1622 + _1614;
    float _1626 = float(uint(_1610));
    int _1628 = ~_1294;
    int _1630 = _1628 + 1;
    float _1632 = float(uint(_1624));
    float _1634 = trunc(_1608);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = as_type<float>(_1616) * _1626;
    int _1642 = abs(_1624);
    int _1644 = ~_1550;
    int _1646 = _1644 + 1;
    float _1648 = 1.0 / _1620;
    int _1650 = as_type<int>(_1618) + (-2);
    float _1652 = in.m_49.x;
    float _1654 = in.m_49.y;
    float _1656 = in.m_49.z;
    bool _1658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1660 = as_type<float>(_1650) * _1632;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1662;
    float _1666 = trunc(_1640);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    int _1672 = _1630 * int(_1638);
    int _1674 = _1672 + _1574;
    float _1676 = in.m_44.x;
    float _1678 = in.m_44.y;
    float _1680 = in.m_44.z;
    float _1682 = _1664 * _1540;
    float _1684 = float(uint(_1674));
    float _1686 = trunc(_1660);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    float _1692 = as_type<float>(_1590) * _1684;
    int _1694 = as_type<int>(_1648) + (-2);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1700 = float(uint(_1642));
    int _1702 = _1646 * int(_1670);
    int _1704 = _1702 + _1610;
    float _1706 = trunc(_1692);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    float _1712 = as_type<float>(_1694) * _1700;
    float _1714 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1716 = float(uint(_1704));
    float _1718 = _1698 * _958;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1720;
    float _1724 = fma(_366, _1656, _1714);
    int _1726 = ~_1472;
    int _1728 = _1726 + 1;
    float _1730 = trunc(_1712);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    float _1736 = as_type<float>(_1616) * _1716;
    float _1738 = _1722 * _1600;
    float _1740 = fma(_1724, _512, _1680);
    int _1742 = ~_1612;
    int _1744 = _1742 + 1;
    float _1746 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _1748 = trunc(_1736);
    float _1750 = precise::max(_1748, 0.0);
    uint _1752 = uint(_1750);
    int _1754 = _1728 * int(_1690);
    int _1756 = _1754 + _1624;
    int _1758 = int(_1638) + int(_1710);
    int _1760 = ~_1294;
    int _1762 = _1760 + 1;
    float _1764 = float(uint(_1756));
    int _1766 = _1744 * int(_1734);
    int _1768 = _1766 + _1642;
    int _1770 = ~_1550;
    int _1772 = _1770 + 1;
    int _1774 = _1762 * _1758;
    int _1776 = _1774 + _1574;
    float _1778 = as_type<float>(_1650) * _1764;
    float _1780 = -_1740;
    float _1782 = precise::max(0.0, _1780);
    float _1784 = float(uint(_1768));
    int _1786 = int(_1670) + int(_1752);
    float _1788 = trunc(_1778);
    float _1790 = precise::max(_1788, 0.0);
    uint _1792 = uint(_1790);
    float _1794 = as_type<float>(_1694) * _1784;
    float _1796 = -_296;
    int _1798 = _868 ? as_type<int>(_1796) : as_type<int>(_296);
    bool _1800 = uint(_1776) >= uint(_1294);
    int _1802 = _1772 * _1786;
    int _1804 = _1802 + _1610;
    float _1806 = precise::min(_1746, _1782);
    float _1808 = trunc(_1794);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    bool _1814 = !_1800;
    int _1816 = _1814 ? 0 : (-1);
    int _1818 = _1694;
    int _1820 = as_type<int>(_1778);
    float _1822 = _1794;
    float _1824 = as_type<float>(_1804);
    if (_618)
    {
        _1818 = 0;
    }
    int _1826 = _1818;
    int _1828 = _1826;
    if (_618)
    {
        _1820 = 0;
    }
    int _1830 = _1820;
    int _1832 = _1830;
    if (!_618)
    {
        _1828 = 1;
    }
    int _1834 = _1828;
    float _1836 = 1.0 / _1746;
    int _1838 = ~_1758;
    int _1840 = _1838 + _1816;
    int _1842 = _1840 + 1;
    if (!_618)
    {
        _1832 = 2;
    }
    int _1844 = _1832;
    bool _1846 = uint(_1804) >= uint(_1550);
    int _1848 = _1294 * _1842;
    int _1850 = _1848 + _1574;
    int _1852 = int(_1690) + int(_1792);
    float _1854 = as_type<float>(_1758);
    float _1856 = as_type<float>(_1850);
    float _1858 = as_type<float>(_1852);
    float _1860 = as_type<float>(_1844);
    if (_1658)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1854 = _1862;
    }
    float _1864 = _1854;
    bool _1866 = !_1846;
    int _1868 = _1866 ? 0 : (-1);
    float _1870 = _173 * 2.0;
    bool _1872 = _1294 == 0;
    bool _1874 = _1834 != 1;
    int _1876 = ~_1472;
    int _1878 = _1876 + 1;
    float _1880 = _1806 * _1836;
    bool _1882 = !_1872;
    int _1884 = _1882 ? _1850 : (-1);
    float _1886 = _1880;
    if (_1658)
    {
        float _1888 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1856 = _1888;
    }
    float _1890 = _1856;
    int _1892 = int(_1734) + int(_1812);
    float _1894 = floor(_1870);
    int _1896 = ~_1612;
    int _1898 = _1896 + 1;
    int _1900 = _1878 * _1852;
    int _1902 = _1900 + _1624;
    bool _1904 = _131 > 0.5;
    float _1906 = _1890;
    float _1908 = as_type<float>(_1898);
    if (_1658)
    {
        float _1910 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1880);
        _1906 = _1910;
    }
    float _1912 = _1906;
    bool _1914 = !_740;
    float _1916 = _1914 ? _296 : as_type<float>(_1798);
    int _1918 = _1898 * _1892;
    int _1920 = _1918 + _1642;
    float _1922 = -_296;
    int _1924 = _1904 ? as_type<int>(_1922) : as_type<int>(_296);
    float _1926 = as_type<float>(_1920);
    if (_1658)
    {
        float _1928 = _1912 * _1864;
        _1908 = _1928;
    }
    float _1930 = _1908;
    bool _1932 = uint(_1902) >= uint(_1472);
    float _1934 = _131 + _169;
    bool _1936 = _1844 != 2;
    float _1938 = as_type<float>(_1772);
    if (_1658)
    {
        float _1940 = floor(_1930);
        _1938 = _1940;
    }
    float _1942 = _1938;
    bool _1944 = !_1932;
    int _1946 = _1944 ? 0 : (-1);
    float _1948 = _1934 + (-1.0);
    bool _1950 = uint(_1920) >= uint(_1612);
    float _1952 = _131 + _173;
    bool _1954 = !_1218;
    float _1956 = _1954 ? _296 : as_type<float>(_1924);
    float _1958 = _1870 + (-1.0);
    float _1960 = _1952 + (-1.0);
    bool _1962 = !_1950;
    int _1964 = _1962 ? 0 : (-1);
    out.m_60.x = _1880;
    bool _1966 = _1894 > 0.0;
    float _1968 = fma(_1948, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1970 = _1894 >= 0.0;
    bool _1972 = isnan(_1894);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan(0.0);
    bool _1978 = _1974 || _1976;
    float _1980 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1982 = ~_1852;
    int _1984 = _1982 + _1946;
    int _1986 = _1984 + 1;
    float _1988 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1202);
    float _1990 = _1948;
    float _1992 = _1952;
    if (_1936)
    {
        _1990 = _131;
    }
    float _1994 = _1990;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    float _1998 = _1994;
    if (_1936)
    {
        _1926 = _169;
    }
    float _2000 = _1926;
    int _2002 = _1472 * _1986;
    int _2004 = _2002 + _1624;
    float _2006 = 0.0;
    float _2008 = _2000;
    if (_1936)
    {
        _2006 = _173;
    }
    float _2010 = _2006;
    float _2012 = floor(_1988);
    float _2014 = _2010;
    if (!_1936)
    {
        _1998 = _173;
    }
    float _2016 = _1998;
    if (!_1936)
    {
        _2008 = _131;
    }
    float _2018 = _2008;
    if (!_1936)
    {
        _2014 = _169;
    }
    float _2020 = _2014;
    float _2022 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2024 = _1574 ^ _1294;
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2028 = _1472 == 0;
    if (!_1658)
    {
        _1858 = _1880;
    }
    float _2030 = _1858;
    float _2032 = _2030;
    if (_1658)
    {
        float _2034 = -_1942;
        float _2036 = _1930 + _2034;
        _2032 = _2036;
    }
    float _2038 = _2032;
    uint _2040 = uint(int(uint(_2024) >> uint(31)));
    bool _2042 = !_2028;
    int _2044 = _2042 ? _2004 : (-1);
    float _2046 = _1996 * 0.15915493667125701904296875;
    int _2048 = ~_1868;
    int _2050 = _1786 + _2048;
    int _2052 = _2050 + 1;
    int _2054 = ~int(_2040);
    int _2056 = _2054 + 1;
    float _2058 = _2046 * 6.283185482025146484375;
    float _2060 = sin(_2058);
    bool _2062 = _1472 == 0;
    int _2064 = _2052 ^ _2056;
    int _2066 = _1624 ^ _1472;
    int _2068 = ~_1964;
    int _2070 = _1892 + _2068;
    int _2072 = _2070 + 1;
    float _2074 = _2046 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    int _2078 = ~_2056;
    int _2080 = _2078 + _2064;
    int _2082 = _2080 + 1;
    float _2084 = -_2012;
    float _2086 = _1988 + _2084;
    bool _2088 = _1294 == 0;
    float _2090 = _1988 * 6.283185482025146484375;
    float _2092 = _173 + _169;
    float _2094 = _2090 * 0.15915493667125701904296875;
    float _2096 = _2092 + (-1.0);
    uint _2098 = uint(int(uint(_2066) >> uint(31)));
    float _2100 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2102 = ~int(_2098);
    int _2104 = _2102 + 1;
    float _2106 = _169 * 2.0;
    float _2108 = _2076 * _2076;
    if (!_1874)
    {
        _1822 = _169;
    }
    float _2110 = _1822;
    float _2112 = _2094 * 6.283185482025146484375;
    float _2114 = cos(_2112);
    int _2116 = _2072 ^ _2104;
    float _2118 = fma(_2060, _2060, _2108);
    float _2120 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _2122 = 1.0 + _2120;
    float _2124 = _2110;
    if (!_1874)
    {
        _1860 = _2110;
    }
    float _2126 = _1860;
    float _2128 = fma(_179, 2.0, -1.0);
    int _2130 = ~_2104;
    int _2132 = _2130 + _2116;
    int _2134 = _2132 + 1;
    float _2136 = -(*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _2138 = 1.0 + _2136;
    float _2140 = rsqrt(_2118);
    float _2142 = _2126;
    if (!_1874)
    {
        _1824 = _173;
    }
    float _2144 = _1824;
    float _2146 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2148 = _2144;
    if (!_1874)
    {
        _1992 = _173;
    }
    float _2150 = _1992;
    bool _2152 = !_2062;
    int _2154 = _2152 ? _2134 : (-1);
    float _2156 = floor(_2106);
    float _2158 = _2150;
    if (_1874)
    {
        _2142 = _131;
    }
    float _2160 = _2142;
    if (_1874)
    {
        _2124 = _131;
    }
    float _2162 = _2124;
    if (_1874)
    {
        _2148 = _169;
    }
    float _2164 = _2148;
    if (_1874)
    {
        _2158 = _169;
    }
    float _2166 = _2158;
    float _2168 = _2060 * _2140;
    bool _2170 = !_2088;
    int _2172 = _2170 ? _2082 : (-1);
    float _2174 = _2076 * _2140;
    float _2176 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2180 = _2178 != 0;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2184 = _2182 != 0;
    int _2186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2188 = _2186 != 0;
    float _2190 = _2146 * _2122;
    int _2192 = _1360 ? 0 : 1;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2196 = _2156 >= 0.0;
    bool _2198 = isnan(_2156);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan(0.0);
    bool _2204 = _2200 || _2202;
    float _2206 = -_2190;
    float _2208 = _2146 + _2206;
    int _2210 = ~_2192;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    float _2216 = -_2194;
    float _2218 = fma(_2022, 2.0, _2216);
    int _2220 = _2214;
    if (!_1410)
    {
        int _2222 = ~_2192;
        int _2224 = _2222 + 1;
        _2220 = _2224;
    }
    int _2226 = _2220;
    float _2228 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _2230 = _2156 > 0.0;
    float _2232 = fma(_2208, _169, _2190);
    bool _2234 = _2086 < 0.5;
    float _2236 = float(_2234);
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2240 = fma(_2114, 0.5, 0.5);
    float _2242 = fma(_366, _1654, _2176);
    float _2244 = fma(_366, _1652, _2228);
    float _2246 = fma(_2162, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2238);
    float _2248 = -_2086;
    float _2250 = fma(_2248, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2252 = -_2236;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2256 = -_2240;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2260 = fma(_2242, _512, _1678);
    float _2262 = fma(_2244, _512, _1676);
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _2266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _2268 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2270 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2272 = _1364 * _1880;
    float _2274 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[89].z, _2264);
    float _2276 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2268);
    float _2278 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2270);
    float _2280 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[193].y, _822);
    float _2282 = precise::max(0.0, _2272);
    float _2284 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2286 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2278);
    float _2288 = _2280 * 0.15915493667125701904296875;
    float _2290 = precise::min(_2282, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2294 = _2038 + _2292;
    bool _2296 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2298 = isnan(_2038);
    bool _2300 = _2296 || _2298;
    bool _2302 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2304 = _2300 || _2302;
    float _2306 = float(_2304);
    float _2308 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2284);
    float _2310 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2276);
    float _2312 = _2290 * _2266;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2316 = _2038 + _2314;
    float _2318 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2320 = _2038 + _2318;
    float _2322 = _2288 * 6.283185482025146484375;
    float _2324 = sin(_2322);
    float _2326 = fma(_1484, _2294, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2328 = fma(_1548, _2316, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2330 = fma(_1718, _2320, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2332 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2334 = isnan(_2038);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    float _2344 = -_2306;
    float _2346 = _2344 + 1.0;
    float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2350 = _2038 + _2348;
    float _2352 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2308);
    float _2354 = abs(_2312);
    float _2356 = log2(_2354);
    float _2358 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2360 = _2038 + _2358;
    float _2362 = -_2342;
    float _2364 = _2362 + 1.0;
    float _2366 = _2342 * _2346;
    float _2368 = fma(_1492, _2350, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2370 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2372 = isnan(_2038);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2378 = _2374 || _2376;
    float _2380 = float(_2378);
    float _2382 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2384 = _2038 + _2382;
    float _2386 = fma(_1682, _2360, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2388 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    bool _2390 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2392 = isnan(_2038);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = fma(_1562, _2384, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2404 = -_2380;
    float _2406 = _2404 + 1.0;
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2410 = _2038 + _2408;
    bool _2412 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2414 = isnan(_2038);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = _2400 * _2364;
    float _2426 = -_2400;
    float _2428 = _2426 + 1.0;
    float _2430 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[192].w;
    bool _2432 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2434 = isnan(_2038);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2440 = _2436 || _2438;
    float _2442 = float(_2440);
    float _2444 = fma(_1738, _2410, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2446 = _2380 * _2428;
    float _2448 = -_2232;
    float _2450 = _2168 * _2448;
    float _2452 = -_2388;
    float _2454 = _2174 * _2452;
    float _2456 = exp2(_2430);
    float _2458 = _2442 * _2406;
    float _2460 = -_2442;
    float _2462 = _2460 + 1.0;
    float _2464 = fma(_1364, _2450, _2454);
    bool _2466 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2468 = isnan(_2038);
    bool _2470 = _2466 || _2468;
    bool _2472 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2474 = _2470 || _2472;
    float _2476 = float(_2474);
    float _2478 = -_2232;
    float _2480 = _2174 * _2478;
    float _2482 = _2422 * _2462;
    bool _2484 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2486 = isnan(_2038);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = _1880 * _2464;
    float _2498 = -_2422;
    float _2500 = _2498 + 1.0;
    float _2502 = _2368 * _2482;
    float _2504 = _2168 * _2388;
    float _2506 = _2286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2508 = -_145;
    float _2510 = fma(_2508, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2218);
    float _2512 = fma(_2500, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2502);
    float _2514 = fma(_1364, _2480, _2504);
    float _2516 = _2456 * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2518 = -_2476;
    float _2520 = _2518 + 1.0;
    float _2522 = fma(_2326, _2458, _2512);
    float _2524 = _1880 * _2514;
    float _2526 = -_2168;
    float _2528 = fma(_2526, _2516, _2496);
    float _2530 = -_2494;
    float _2532 = _2530 + 1.0;
    float _2534 = fma(_2328, _2446, _2522);
    float _2536 = -_2174;
    float _2538 = fma(_2536, _2516, _2524);
    float _2540 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2528);
    float _2542 = _2476 * _2532;
    int _2544 = abs(_566);
    float _2546 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2538);
    float _2548 = in.m_58.x;
    float _2550 = fma(_2402, _2424, _2534);
    float _2552 = _2310 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2554 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[192].y, _2506);
    float _2556 = _2306 * _2520;
    float _2558 = fma(_2386, _2366, _2550);
    float _2560 = _2352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2562 = _2540 + _2552;
    int _2564 = abs(_1006);
    float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2568 = _2554 + _2566;
    float _2570 = float(_2544);
    float _2572 = fma(_2330, _2556, _2558);
    float _2574 = _2546 + _2560;
    float _2576 = _2568 * _2568;
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2580 = _2562 + _2578;
    float _2582 = float(_2564);
    float _2584 = abs(_2250);
    float _2586 = _2570 * _2584;
    float _2588 = fma(_2444, _2542, _2572);
    float _2590 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[89].x, _2274);
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2594 = _2574 + _2592;
    float _2596 = fma(_2580, _2580, _2576);
    float _2598 = fma(_2582, _2258, _2586);
    float _2600 = -_1880;
    float _2602 = _2600 + 1.0;
    float _2604 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2588);
    float _2606 = fma(_2594, _2594, _2596);
    float _2608 = _2548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2610 = _2590 * (-0.15915493667125701904296875);
    float _2612 = float(_952);
    float _2614 = sqrt(_2606);
    bool _2616 = _2602 >= 0.001000000047497451305389404296875;
    bool _2618 = isnan(_2602);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan(0.001000000047497451305389404296875);
    bool _2624 = _2620 || _2622;
    float _2626 = float(_2624);
    float _2628 = _2608 * _2604;
    float _2630 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2632 = abs(_2254);
    float _2634 = fma(_2612, _2632, _2598);
    float _2636 = _2628 * _2626;
    float _2638 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2630);
    float _2640 = _2610 * 6.283185482025146484375;
    float _2642 = sin(_2640);
    float _2644 = _2634 * _2636;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2648 = _2160 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2650 = _2644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2654 = rsqrt(_2606);
    float _2656 = _2614 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2660 = -_2646;
    float _2662 = fma(_2648, 2.0, _2660);
    float _2664 = fma(_2026, -2.0, _2652);
    float _2666 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2668 = precise::min(_2658, _2656);
    float _2670 = _2610 * 6.283185482025146484375;
    float _2672 = cos(_2670);
    float _2674 = _530 * _2642;
    float _2676 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2678 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2666);
    float _2680 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2664);
    float _2682 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2676);
    float _2684 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2678);
    float _2686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2688 = _2568 * _2654;
    float _2690 = _2580 * _2654;
    float _2692 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2682);
    float _2694 = -_2684;
    float _2696 = _2694 + 1.0;
    float _2698 = _2688 * _2668;
    float _2700 = -_2688;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2568);
    float _2704 = -_2690;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2580);
    float _2708 = _530 * _2672;
    float _2710 = -_2674;
    float _2712 = fma(_526, _2672, _2710);
    float _2714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2716 = _2690 * _2668;
    float _2718 = -_2698;
    float _2720 = _2568 + _2718;
    float _2722 = _2712 + 0.5;
    float _2724 = fma(_526, _2642, _2708);
    float _2726 = -_2716;
    float _2728 = _2580 + _2726;
    float _2730 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2732 = _2720 * _2720;
    float _2734 = _2702 * _2702;
    float _2736 = _2724 + (-0.5);
    float _2738 = fma(_2730, _2722, _2510);
    float _2740 = _2594 * _2654;
    float _2742 = fma(_2728, _2728, _2732);
    float _2744 = fma(_2706, _2706, _2734);
    float _2746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2748 = _2740 * _2668;
    float _2750 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2752 = -_2740;
    float _2754 = fma(_2752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2594);
    float _2756 = -_2692;
    float _2758 = _2756 + 1.0;
    float _2760 = -_2748;
    float _2762 = _2594 + _2760;
    float _2764 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2766 = -_2750;
    float _2768 = -_2680;
    float _2770 = fma(_2766, _2736, _2768);
    float _2772 = fma(_2754, _2754, _2744);
    float _2774 = fma(_2762, _2762, _2742);
    float _2776 = -_2758;
    float _2778 = fma(_2712, _2776, _2738);
    float _2780 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2782 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2784 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2764);
    float _2786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2788 = fma(_2782, -2.0, _2780);
    float _2790 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2784);
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2794 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2796 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2800 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2804 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2806 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2808 = _2794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2810 = _2796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2812 = _2798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2814 = _2800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2816 = _2804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2818 = float(_1884);
    float _2820 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_62.x = _2806;
    out.m_62.y = _2808;
    out.m_62.z = _2810;
    float _2822 = fma(_2724, _2696, _2770);
    bool _2824 = !_2180;
    int _2826 = _2824 ? 0 : 1;
    float _2828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_64.x = _2812;
    out.m_64.y = _2814;
    out.m_64.z = _2816;
    float _2830 = float(_2172);
    float _2832 = _2786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2834 = float(_2154);
    out.m_66.x = _2778;
    out.m_66.y = _2822;
    bool _2836 = _2790 >= 0.0;
    float _2838 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2840 = sqrt(_2772);
    float _2842 = _1956 + 0.5;
    float _2844 = -_1416;
    float _2846 = fma(_2832, _2830, _2844);
    float _2848 = _1028 + (-0.5);
    float _2850 = fma(_2820, _2818, _1342);
    float _2852 = _584 + (-0.5);
    float _2854 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2856 = log2(_2854);
    float _2858 = fma(_2820, _2842, _2850);
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2862 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2788);
    float _2864 = -_2832;
    float _2866 = fma(_2864, _2848, _2846);
    float _2868 = float(_2044);
    float _2870 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2860);
    float _2872 = -_2862;
    float _2874 = fma(_2838, _2834, _2872);
    float _2876 = sqrt(_2774);
    float _2878 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_2836)
    {
        _2880 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2882 = _2880;
    float _2884 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2886 = -_145;
    float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2662);
    float _2890 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2878);
    float _2892 = -_2838;
    float _2894 = fma(_2892, _2852, _2874);
    float _2896 = _2654 * _2840;
    float _2898 = _145 * _2856;
    float _2900 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2890);
    float _2902 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2870);
    float _2904 = fma(_2884, _2868, _2888);
    float _2906 = _1916 + 0.5;
    float _2908 = -_2900;
    float _2910 = _2908 + 1.0;
    int _2912 = as_type<int>(_2900);
    if (_2836)
    {
        float _2914 = _2882 * 5.0;
        _2912 = as_type<int>(_2914);
    }
    int _2916 = _2912;
    float _2918 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2246);
    float _2920 = _2654 * _2876;
    float _2922 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2638);
    float _2924 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1228);
    float _2926 = -_2902;
    float _2928 = _2926 + 1.0;
    float _2930 = fma(_1028, _2910, _2866);
    float _2932 = fma(_2884, _2906, _2904);
    float _2934 = -_2918;
    float _2936 = _2934 + 1.0;
    float _2938 = -_2922;
    float _2940 = _2938 + 1.0;
    float _2942 = floor(_2924);
    float _2944 = _2920 * _2896;
    float _2946 = -_2928;
    float _2948 = fma(_1956, _2946, _2858);
    float _2950 = -_2936;
    float _2952 = fma(_1916, _2950, _2932);
    float _2954 = fma(_584, _2940, _2894);
    float _2956 = _2650 * _2944;
    out.m_68.w = _2668;
    float _2958 = exp2(_2898);
    bool _2960 = !_2184;
    int _2962 = _2960 ? 0 : 1;
    float _2964 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2966 = 1.0 + _2964;
    if (_2836)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9529 = as_type<float>(_2916);
        out.gl_Position.z = _9529;
    }
    bool _2968 = !_2188;
    int _2970 = _2968 ? 0 : 1;
    bool _2972 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    out.m_70.x = _2948;
    out.m_70.y = _2930;
    out.m_70.z = _2952;
    out.m_70.w = _2954;
    if (_2836)
    {
        out.m_47.x = 0.0;
    }
    out.m_72.x = _2956;
    if (_2836)
    {
        return out;
    }
    float _2974 = -_2688;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2554);
    float _2978 = -_2690;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2562);
    float _2982 = 1.0 / _2966;
    float _2984 = -_2958;
    float _2986 = _2984 + 1.0;
    float _2988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2990 = _2976 + _2988;
    float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2994 = _2980 + _2992;
    float _2996 = -_2942;
    float _2998 = _2924 + _2996;
    float _3000 = _2924 * 6.283185482025146484375;
    float _3002 = _2990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3004 = -_2740;
    float _3006 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2574);
    bool _3008 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3010 = isnan(0.0);
    bool _3012 = _3008 || _3010;
    bool _3014 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3016 = _3012 || _3014;
    float _3018 = _2954;
    float _3020 = _3000;
    if (_2972)
    {
        float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _3018 = _3022;
    }
    float _3024 = _3018;
    float _3026 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3002);
    float _3028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3030 = _3006 + _3028;
    float _3032 = _3000 * 0.15915493667125701904296875;
    float _3034 = _3016 ? _2986 : 0.0;
    float _3036 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3026);
    int _3038 = _1978 ? 0 : 1;
    float _3040 = _3032 * 6.283185482025146484375;
    float _3042 = cos(_3040);
    float _3044 = _3034 * _2982;
    bool _3046 = _3036 >= 0.0;
    float _3048 = _2982;
    if (_2972)
    {
        float _3050 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _3048 = _3050;
    }
    float _3052 = _3048;
    float _3054 = _3052;
    if (_2972)
    {
        float _3056 = fma(_3052, (*spvDescriptorSet0.vp_c9)._m0[14].z, _1880);
        _3020 = _3056;
    }
    float _3058 = _3020;
    float _3060 = _2204 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3062 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3064 = (*spvDescriptorSet0.vp_c9)._m0[176].w + _3062;
    float _3066 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3068 = _3066 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[178].w + _3070;
    int _3074 = ~_3038;
    int _3076 = _3074 + 1;
    int _3078 = _3076 + 1;
    int _3080 = _3078;
    float _3082 = _3060;
    if (_2972)
    {
        float _3084 = _3058 * _3024;
        _3054 = _3084;
    }
    float _3086 = _3054;
    if (!_1966)
    {
        int _3088 = ~_3038;
        int _3090 = _3088 + 1;
        _3080 = _3090;
    }
    int _3092 = _3080;
    float _3094 = 1.0 / _3064;
    int _3096 = ~as_type<int>(_3060);
    int _3098 = _3096 + 1;
    int _3100 = _3098 + 1;
    float _3102 = fma(_3042, 0.5, 0.5);
    float _3104 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _3106 = _3100;
    if (!_2230)
    {
        int _3108 = ~as_type<int>(_3060);
        int _3110 = _3108 + 1;
        _3106 = _3110;
    }
    int _3112 = _3106;
    if (_3046)
    {
        out.m_47.x = 0.0;
    }
    if (_3046)
    {
        _3082 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3114 = _3082;
    float _3116 = 1.0 / _3068;
    float _3118 = -_2998;
    float _3120 = fma(_3118, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _3122 = _2998 < 0.5;
    float _3124 = float(_3122);
    float _3126 = -_3102;
    float _3128 = fma(_3126, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _3130 = as_type<int>(_3114);
    if (_3046)
    {
        float _3132 = _3114 * 5.0;
        _3130 = as_type<int>(_3132);
    }
    int _3134 = _3130;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3140 = -_3124;
    float _3142 = fma(_3140, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _3144 = 1.0 / _3072;
    float _3146 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (_3046)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9826 = as_type<float>(_3134);
        out.gl_Position.z = _9826;
    }
    float _3148 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _3150 = fma(_464, _1652, _3104);
    float _3152 = _2940;
    if (_2972)
    {
        float _3154 = floor(_3086);
        _3152 = _3154;
    }
    float _3156 = _3152;
    if (_3046)
    {
        return out;
    }
    float _3158 = -_2554;
    float _3160 = _3158 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3162 = -_2562;
    float _3164 = _3162 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3166 = fma(_464, _1654, _3146);
    float _3168 = -_2574;
    float _3170 = _3168 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3172 = _3160 * _3160;
    float _3174 = fma(_464, _1656, _3148);
    float _3176 = abs(_3120);
    float _3178 = _2570 * _3176;
    if (_2972)
    {
        float _3180 = -_3156;
        float _3182 = _3086 + _3180;
        _1886 = _3182;
    }
    float _3184 = _1886;
    float _3186 = fma(_3164, _3164, _3172);
    float _3188 = -_3166;
    float _3190 = _2242 + _3188;
    float _3192 = fma(_2582, _3128, _3178);
    float _3194 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3196 = _3184 + _3194;
    float _3198 = fma(_3170, _3170, _3186);
    float _3200 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3202 = _3184 + _3200;
    float _3204 = 1.0 / _3138;
    float _3206 = _3196 * _3144;
    float _3208 = -_3150;
    float _3210 = _2244 + _3208;
    float _3212 = _3190 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3214 = _3190 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3216 = _3202 * _3116;
    float _3218 = _3190 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3220 = fma(_3210, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3212);
    float _3222 = rsqrt(_3198);
    float _3224 = fma(_3210, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3214);
    float _3226 = fma(_3210, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3218);
    float _3228 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3230 = _3184 + _3228;
    float _3232 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3234 = _3184 + _3232;
    float _3236 = abs(_3142);
    float _3238 = fma(_2612, _3236, _3192);
    float _3240 = _3230 * _3094;
    float _3242 = _3234 * _3204;
    float _3244 = _131 + (-0.5);
    float _3246 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _3248 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3250 = _3164 * _3222;
    float _3252 = _3170 * _3222;
    float _3254 = -_3246;
    float _3256 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3254);
    float _3258 = -_3248;
    float _3260 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _3258);
    float _3262 = _3250 * _3250;
    float _3264 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3266 = (*spvDescriptorSet0.vp_c9)._m0[180].w + _3264;
    float _3268 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3270 = fma(_3252, _3252, _3262);
    float _3272 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _3274 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _3276 = -_3268;
    float _3278 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[1].y, _3276);
    float _3280 = 1.0 / _3266;
    float _3282 = -_3272;
    float _3284 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3282);
    float _3286 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3288 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _3290 = -_3274;
    float _3292 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _3290);
    float _3294 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3296 = -_3286;
    float _3298 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3296);
    float _3300 = _3160 * _3222;
    float _3302 = rsqrt(_3270);
    float _3304 = -_3288;
    float _3306 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3304);
    float _3308 = -_3294;
    float _3310 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3308);
    float _3312 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[1].w, _3278);
    float _3314 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3316 = _3314 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3318 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[1].w, _3310);
    float _3320 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3322 = (*spvDescriptorSet0.vp_c9)._m0[182].w + _3320;
    float _3324 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _3326 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _3328 = abs(_2962);
    float _3330 = _169 + (-0.5);
    float _3332 = float(_2226);
    float _3334 = _173 + (-0.5);
    float _3336 = float(_3328);
    float _3338 = _3252 * _3302;
    float _3340 = _3250 * _3302;
    float _3342 = 1.0 / _3316;
    float _3344 = -_3338;
    float _3346 = _3252 * _3344;
    float _3348 = _3300 * _3340;
    float _3350 = -_3338;
    float _3352 = _3300 * _3350;
    bool _3354 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3356 = isnan(1.0);
    bool _3358 = _3354 || _3356;
    bool _3360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3362 = _3358 || _3360;
    float _3364 = -_3346;
    float _3366 = fma(_3250, _3340, _3364);
    float _3368 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3370 = -_3326;
    float _3372 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3370);
    float _3374 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3376 = _3184 + _3374;
    float _3378 = _3366 * _3366;
    float _3380 = 1.0 / _3322;
    float _3382 = -_3368;
    float _3384 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3382);
    float _3386 = _3376 * _3280;
    float _3388 = fma(_3348, _3348, _3378);
    float _3390 = _3306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3392 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[1].w, _3384);
    float _3394 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3396 = _3184 + _3394;
    float _3398 = fma(_3352, _3352, _3388);
    float _3400 = -_3390;
    float _3402 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3400);
    float _3404 = fma(_3392, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3372);
    float _3406 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3408 = _3184 + _3406;
    float _3410 = rsqrt(_3398);
    float _3412 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3402);
    float _3414 = _3408 * _3342;
    float _3416 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3418 = -_3412;
    float _3420 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3404);
    float _3422 = _3396 * _3380;
    float _3424 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3426 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3424;
    float _3428 = -(*spvDescriptorSet0.vp_c9)._m0[175].z;
    float _3430 = (*spvDescriptorSet0.vp_c9)._m0[176].z + _3428;
    float _3432 = 1.0 / _3420;
    float _3434 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3436 = _3434 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3438 = -_3324;
    float _3440 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3438);
    float _3442 = fma(_3426, _3240, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3444 = fma(_3430, _3240, (*spvDescriptorSet0.vp_c9)._m0[175].z);
    float _3446 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _3448 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3440);
    float _3450 = _3366 * _3410;
    float _3452 = precise::clamp(_3450, 0.0, 1.0);
    float _3454 = -_3416;
    float _3456 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3454);
    float _3458 = -_3446;
    float _3460 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[0].y, _3458);
    float _3462 = -_3452;
    float _3464 = _3462 + 1.0;
    float _3466 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3456);
    float _3468 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3460);
    float _3470 = float(_3092);
    float _3472 = -(*spvDescriptorSet0.vp_c9)._m0[176].z;
    float _3474 = _3472 + (*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _3476 = fma(_3448, _3432, -1.0);
    float _3478 = _3464 * _3432;
    float _3480 = fma(_3436, _3216, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _3482 = fma(_3464, _3476, 1.0);
    float _3484 = _3468 * _3478;
    float _3486 = _3466 * _3478;
    float _3488 = _3482 * _3482;
    float _3490 = -(*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _3492 = (*spvDescriptorSet0.vp_c9)._m0[178].z + _3490;
    float _3494 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3496 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3494;
    float _3498 = fma(_3484, _3484, _3488);
    float _3500 = fma(_3474, _3216, (*spvDescriptorSet0.vp_c9)._m0[176].z);
    bool _3502 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3504 = isnan(_3184);
    bool _3506 = _3502 || _3504;
    bool _3508 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3510 = _3506 || _3508;
    float _3512 = float(_3510);
    float _3514 = fma(_3496, _3206, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3516 = fma(_3486, _3486, _3498);
    float _3518 = fma(_3492, _3206, (*spvDescriptorSet0.vp_c9)._m0[177].z);
    float _3520 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3522 = _3520 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[178].z;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[179].z;
    int _3528 = abs(_2826);
    float _3530 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3532 = _3530 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3534 = rsqrt(_3516);
    float _3536 = fma(_3522, _3242, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3538 = fma(_3526, _3242, (*spvDescriptorSet0.vp_c9)._m0[178].z);
    float _3540 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3542 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3540;
    float _3544 = -(*spvDescriptorSet0.vp_c9)._m0[180].z;
    float _3546 = _3544 + (*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _3548 = -(*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _3550 = (*spvDescriptorSet0.vp_c9)._m0[180].z + _3548;
    float _3552 = float(_3528);
    float _3554 = fma(_3532, _3414, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3556 = fma(_3542, _3386, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3558 = fma(_3546, _3414, (*spvDescriptorSet0.vp_c9)._m0[180].z);
    bool _3560 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3562 = isnan(_3184);
    bool _3564 = _3560 || _3562;
    bool _3566 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3568 = _3564 || _3566;
    float _3570 = float(_3568);
    float _3572 = _3552 * _3470;
    bool _3574 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3576 = isnan(_3184);
    bool _3578 = _3574 || _3576;
    bool _3580 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3582 = _3578 || _3580;
    float _3584 = float(_3582);
    float _3586 = fma(_3550, _3386, (*spvDescriptorSet0.vp_c9)._m0[179].z);
    float _3588 = _3336 * _3332;
    float _3590 = _3482 * _3534;
    float _3592 = _3484 * _3534;
    float _3594 = _3486 * _3534;
    bool _3596 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3598 = isnan(_3184);
    bool _3600 = _3596 || _3598;
    bool _3602 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3604 = _3600 || _3602;
    float _3606 = float(_3604);
    float _3608 = _3252 * _3590;
    float _3610 = -_3584;
    float _3612 = _3610 + 1.0;
    float _3614 = -_3594;
    float _3616 = _3250 * _3614;
    float _3618 = -_3570;
    float _3620 = _3618 + 1.0;
    float _3622 = -_3594;
    float _3624 = -_3608;
    float _3626 = fma(_3300, _3622, _3624);
    float _3628 = -_3592;
    float _3630 = _3300 * _3628;
    float _3632 = _3570 * _3612;
    float _3634 = -_3592;
    float _3636 = -_3616;
    float _3638 = fma(_3252, _3634, _3636);
    float _3640 = _3606 * _3620;
    bool _3642 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3644 = isnan(_3184);
    bool _3646 = _3642 || _3644;
    bool _3648 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3650 = _3646 || _3648;
    float _3652 = float(_3650);
    float _3654 = -_3606;
    float _3656 = _3654 + 1.0;
    float _3658 = _3638 * _3638;
    float _3660 = -_3630;
    float _3662 = fma(_3250, _3590, _3660);
    float _3664 = _3572 * (-2.0);
    float _3666 = _3652 * _3656;
    float _3668 = -_3652;
    float _3670 = _3668 + 1.0;
    float _3672 = fma(_3626, _3626, _3658);
    float _3674 = in.m_74.x;
    float _3676 = in.m_74.y;
    float _3678 = in.m_74.z;
    bool _3680 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3682 = isnan(_3184);
    bool _3684 = _3680 || _3682;
    bool _3686 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3688 = _3684 || _3686;
    float _3690 = float(_3688);
    float _3692 = -(*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _3694 = (*spvDescriptorSet0.vp_c9)._m0[182].z + _3692;
    float _3696 = fma(_3662, _3662, _3672);
    float _3698 = fma(_1968, _3664, _1968);
    float _3700 = _3690 * _3670;
    float _3702 = -_3690;
    float _3704 = _3702 + 1.0;
    bool _3706 = !_3362;
    float _3708 = _3706 ? _145 : _3044;
    float _3710 = rsqrt(_3696);
    float _3712 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3714 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3712;
    bool _3716 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3718 = isnan(_3184);
    bool _3720 = _3716 || _3718;
    bool _3722 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3724 = _3720 || _3722;
    float _3726 = float(_3724);
    float _3728 = _3512 * _3704;
    float _3730 = -_3512;
    float _3732 = _3730 + 1.0;
    float _3734 = fma(_3714, _3422, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3736 = fma(_3694, _3422, (*spvDescriptorSet0.vp_c9)._m0[181].z);
    bool _3738 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3740 = isnan(_3184);
    bool _3742 = _3738 || _3740;
    bool _3744 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3746 = _3742 || _3744;
    float _3748 = float(_3746);
    float _3750 = _3726 * _3732;
    float _3752 = -_3726;
    float _3754 = _3752 + 1.0;
    float _3756 = float(_3112);
    float _3758 = _3748 * _3754;
    float _3760 = fma(_3664, _3674, _3674);
    float _3762 = _3626 * _3710;
    float _3764 = _3662 * _3710;
    float _3766 = _3442 * _3758;
    float _3768 = fma(_3244, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3760);
    float _3770 = _3638 * _3710;
    float _3772 = _3252 * _3762;
    float _3774 = _3300 * _3764;
    float _3776 = fma(_3708, _3698, _3768);
    float _3778 = _3250 * _3770;
    float _3780 = -_3772;
    float _3782 = fma(_3250, _3764, _3780);
    float _3784 = _3444 * _3758;
    float _3786 = _3776 * 0.15915493667125701904296875;
    float _3788 = -_3774;
    float _3790 = fma(_3252, _3770, _3788);
    float _3792 = -_3778;
    float _3794 = fma(_3300, _3762, _3792);
    int _3796 = abs(_2970);
    float _3798 = _3588 * (-2.0);
    float _3800 = _3782 * _3782;
    float _3802 = in.m_58.y;
    float _3804 = _3786 * 6.283185482025146484375;
    float _3806 = sin(_3804);
    float _3808 = fma(_3798, _3676, _3676);
    float _3810 = fma(_3790, _3790, _3800);
    float _3812 = float(_3796);
    float _3814 = fma(_2100, _3798, _2100);
    float _3816 = fma(_3330, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3808);
    float _3818 = fma(_3794, _3794, _3810);
    float _3820 = -_3748;
    float _3822 = _3820 + 1.0;
    float _3824 = _3812 * _3756;
    float _3826 = _3786 * 6.283185482025146484375;
    float _3828 = cos(_3826);
    float _3830 = fma(_3708, _3814, _3816);
    float _3832 = fma(_3822, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3766);
    float _3834 = fma(_3822, (*spvDescriptorSet0.vp_c9)._m0[175].z, _3784);
    float _3836 = _3830 * 0.15915493667125701904296875;
    float _3838 = fma(_3480, _3750, _3832);
    float _3840 = fma(_3500, _3750, _3834);
    float _3842 = rsqrt(_3818);
    float _3844 = _3824 * (-2.0);
    float _3846 = fma(_3514, _3728, _3838);
    float _3848 = fma(_3518, _3728, _3840);
    float _3850 = fma(_3844, _3678, _3678);
    float _3852 = fma(_1980, _3844, _1980);
    float _3854 = _3802 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _3856 = _3836 * 6.283185482025146484375;
    float _3858 = sin(_3856);
    float _3860 = fma(_3334, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3850);
    float _3862 = fma(_3536, _3700, _3846);
    float _3864 = _3854 * _2604;
    float _3866 = fma(_3538, _3700, _3848);
    float _3868 = fma(_3708, _3852, _3860);
    float _3870 = fma(_3556, _3666, _3862);
    float _3872 = _3864 * _2626;
    float _3874 = _3794 * _3842;
    float _3876 = _3790 * _3842;
    float _3878 = _3782 * _3842;
    float _3880 = _3868 * 0.15915493667125701904296875;
    float _3882 = _3250 * _3874;
    float _3884 = _3238 * _3872;
    float _3886 = _3252 * _3878;
    float _3888 = _3836 * 6.283185482025146484375;
    float _3890 = cos(_3888);
    float _3892 = -_3882;
    float _3894 = fma(_3252, _3876, _3892);
    float _3896 = _3300 * _3876;
    float _3898 = -_3886;
    float _3900 = fma(_3300, _3874, _3898);
    float _3902 = _3884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3904 = _3894 * _3894;
    float _3906 = -_3896;
    float _3908 = fma(_3250, _3878, _3906);
    float _3910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _300);
    float _3912 = _3880 * 6.283185482025146484375;
    float _3914 = cos(_3912);
    float _3916 = fma(_3900, _3900, _3904);
    float _3918 = _3902 * _2944;
    float _3920 = fma(_3586, _3666, _3866);
    float _3922 = _3806 * _3858;
    float _3924 = fma(_3908, _3908, _3916);
    float _3926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _296);
    float _3928 = _3918 * _3910;
    float _3930 = _3880 * 6.283185482025146484375;
    float _3932 = sin(_3930);
    float _3934 = _3828 * _3890;
    float _3936 = fma(_3554, _3640, _3870);
    float _3938 = fma(_3558, _3640, _3920);
    float _3940 = _2956 * _3926;
    float _3942 = _3806 * _3890;
    float _3944 = _3828 * _3858;
    float _3946 = fma(_3734, _3632, _3936);
    float _3948 = rsqrt(_3924);
    float _3950 = _3828 * _3914;
    float _3952 = _3806 * _3914;
    float _3954 = _3890 * _3914;
    float _3956 = fma(_3736, _3632, _3938);
    float _3958 = _3950 * _3928;
    float _3960 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3946);
    float _3962 = _300 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3964 = fma(_3932, _3934, _3922);
    float _3966 = -_3928;
    float _3968 = _3932 * _3966;
    float _3970 = -_3944;
    float _3972 = fma(_3932, _3942, _3970);
    float _3974 = _3952 * _3928;
    float _3976 = fma(_3964, _3940, _3958);
    float _3978 = fma(_3954, _3940, _3968);
    float _3980 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[182].z, _3956);
    float _3982 = fma(_3972, _3940, _3974);
    float _3984 = _3976 * _3874;
    float _3986 = _3908 * _3948;
    float _3988 = _3976 * _3876;
    float _3990 = _3900 * _3948;
    float _3992 = -_3942;
    float _3994 = fma(_3932, _3944, _3992);
    float _3996 = fma(_3978, _3986, _3984);
    float _3998 = _3894 * _3948;
    float _4000 = fma(_3978, _3990, _3988);
    float _4002 = _3960 + 1.0;
    float _4004 = fma(_3252, _3982, _3996);
    float _4006 = _3964 * _3876;
    float _4008 = fma(_3250, _3982, _4000);
    float _4010 = fma(_3932, _3922, _3934);
    float _4012 = _2574 + _4004;
    float _4014 = _3858 * _3914;
    float _4016 = _2562 + _4008;
    float _4018 = _2450 * _4002;
    float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4022 = _4012 + _4020;
    float _4024 = _3964 * _3878;
    float _4026 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4028 = _4016 + _4026;
    float _4030 = _3950 * _3876;
    float _4032 = _4022 * _4022;
    float _4034 = _3950 * _3878;
    float _4036 = _3964 * _3874;
    float _4038 = _3950 * _3874;
    float _4040 = fma(_4028, _4028, _4032);
    float _4042 = _3994 * _3874;
    float _4044 = fma(_3954, _3990, _4006);
    float _4046 = _3994 * _3878;
    float _4048 = sqrt(_4040);
    float _4050 = fma(_3962, _3962, 1.0);
    float _4052 = _3976 * _3878;
    float _4054 = _3994 * _3876;
    float _4056 = fma(_3954, _3998, _4024);
    float _4058 = fma(_3954, _3986, _4036);
    float _4060 = fma(_3978, _3998, _4052);
    float _4062 = -_3932;
    float _4064 = fma(_4062, _3998, _4034);
    float _4066 = rsqrt(_4050);
    float _4068 = fma(_4014, _3990, _4054);
    float _4070 = fma(_3300, _3982, _4060);
    float _4072 = fma(_4014, _3998, _4046);
    float _4074 = -_3932;
    float _4076 = fma(_4074, _3990, _4030);
    float _4078 = -_3932;
    float _4080 = fma(_4078, _3986, _4038);
    float _4082 = _2554 + _4070;
    float _4084 = fma(_4014, _3986, _4042);
    bool _4086 = _4048 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4088 = fma(_4010, _3250, _4068);
    float _4090 = fma(_4010, _3300, _4072);
    float _4092 = fma(_3952, _3250, _4076);
    float _4094 = fma(_3952, _3300, _4064);
    float _4096 = fma(_3952, _3252, _4080);
    float _4098 = fma(_4010, _3252, _4084);
    float _4100 = _4070;
    float _4102 = _4016;
    float _4104 = _4012;
    if (!_4086)
    {
        _4100 = _4082;
    }
    float _4106 = _4100;
    bool _4108 = !_4086;
    float _4110 = _4106;
    if (!_4108)
    {
        float _4112 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4114 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4116 = _4048 + _4114;
        float _4118 = _4082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4120 = rsqrt(_4040);
        float _4122 = _4116 * _4112;
        float _4124 = _4122 * 0.15915493667125701904296875;
        float _4126 = _4124 * 6.283185482025146484375;
        float _4128 = cos(_4126);
        float _4130 = _4124 * 6.283185482025146484375;
        float _4132 = sin(_4130);
        float _4134 = _4128 + (-1.0);
        float _4136 = _4134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4138 = fma(_4132, _4118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4140 = fma(_4082, _4128, _4136);
        float _4142 = _4120 * _4138;
        float _4144 = fma(_4028, _4142, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4146 = fma(_4022, _4142, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4110 = _4140;
        _4102 = _4144;
        _4104 = _4146;
    }
    float _4148 = _4110;
    float _4150 = _4102;
    float _4152 = _4104;
    float _4154 = -_2554;
    float _4156 = _4154 + _4148;
    float _4158 = fma(_3972, _3250, _4044);
    float _4160 = fma(_3972, _3300, _4056);
    float _4162 = fma(_3972, _3252, _4058);
    float _4164 = -_2562;
    float _4166 = _4164 + _4150;
    float _4168 = _4156 * _4156;
    float _4170 = -_2574;
    float _4172 = _4170 + _4152;
    float _4174 = _296 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4176 = _3962 * _4066;
    float _4178 = fma(_4166, _4166, _4168);
    float _4180 = _3962 * _4092;
    float _4182 = _3962 * _4094;
    float _4184 = _3962 * _4096;
    float _4186 = fma(_4172, _4172, _4178);
    float _4188 = -_4088;
    float _4190 = _4176 * _4188;
    float _4192 = -_4090;
    float _4194 = _4176 * _4192;
    float _4196 = -_4098;
    float _4198 = _4176 * _4196;
    float _4200 = sqrt(_4186);
    float _4202 = fma(_4174, _4158, _4180);
    float _4204 = fma(_4174, _4160, _4182);
    float _4206 = fma(_4174, _4162, _4184);
    float _4208 = fma(_4066, _4092, _4190);
    float _4210 = fma(_4066, _4094, _4194);
    float _4212 = fma(_4066, _4096, _4198);
    float _4214 = _4088 + _4202;
    float _4216 = _4090 + _4204;
    float _4218 = _4098 + _4206;
    float _4220 = _3980 + 1.0;
    out.m_76.x = _4208;
    out.m_76.y = _4210;
    out.m_76.z = _4212;
    float _4222 = -_3174;
    float _4224 = _1724 + _4222;
    float _4226 = _2480 * _4220;
    out.m_78.x = _4214;
    out.m_78.y = _4216;
    out.m_78.z = _4218;
    bool _4228 = _4200 > 0.0;
    float _4230 = fma(_4224, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3220);
    float _4232 = fma(_4224, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3226);
    out.m_80.x = _4158;
    out.m_80.y = _4160;
    out.m_80.z = _4162;
    float _4234 = -_2716;
    float _4236 = _2562 + _4234;
    float _4238 = fma(_4224, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3224);
    float _4240 = fma(_4018, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4230);
    float _4242 = -_2716;
    float _4244 = _4242 + _4150;
    float _4246 = -_2698;
    float _4248 = _4246 + _4148;
    float _4250 = -_2748;
    float _4252 = _4250 + _4152;
    float _4254 = -_2698;
    float _4256 = _2554 + _4254;
    float _4258 = -_2748;
    float _4260 = _2574 + _4258;
    float _4262 = fma(_4226, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4232);
    bool _4264 = !_4228;
    float _4266 = _4162;
    float _4268 = _4160;
    float _4270 = _4212;
    float _4272 = _4210;
    float _4274 = _4262;
    float _4276 = _4262;
    float _4278 = _4248;
    float _4280 = _4244;
    float _4282 = _4252;
    float _4284 = _4212;
    float _4286 = _4210;
    if (!_4264)
    {
        bool _4288 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4290 = _4208;
        if (_4288)
        {
            float _4292 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4290 = _4292;
        }
        float _4294 = _4290;
        if (_4288)
        {
            _4266 = _4240;
        }
        float _4296 = _4266;
        float _4298 = _4296;
        if (_4288)
        {
            _4268 = _4238;
        }
        float _4300 = _4268;
        float _4302 = _4294;
        float _4304 = _4300;
        if (_4288)
        {
            float _4306 = _4240 * _4294;
            _4270 = _4306;
        }
        float _4308 = _4270;
        float _4310 = _4308;
        if (_4288)
        {
            float _4312 = _4238 * _4294;
            _4272 = _4312;
        }
        float _4314 = _4272;
        float _4316 = _4314;
        if (_4288)
        {
            float _4318 = _4262 * _4294;
            _4302 = _4318;
        }
        float _4320 = _4302;
        float _4322 = _4320;
        if (!_4288)
        {
            bool _4324 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4326 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4328 = _4324 || _4326;
            bool _4330 = isnan(1.0);
            bool _4332 = _4328 || _4330;
            float _4334 = _145 + 1.0;
            float _4336 = _4334;
            if (!_4332)
            {
                float _4338 = _4334 * _4334;
                float _4340 = _4338 * 0.5;
                _4274 = _4340;
            }
            float _4342 = _4274;
            float _4344 = _4342;
            if (!_4332)
            {
                float _4346 = _4342 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4344 = _4346;
            }
            float _4348 = _4344;
            bool _4350 = !_4332;
            float _4352 = _4348;
            if (!_4350)
            {
                float _4354 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4356 = log2(_4354);
                float _4358 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4360 = _4358 + 1.0;
                float _4362 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4364 = _4356 * _4334;
                float _4366 = 1.0 / _4360;
                float _4368 = _4362 * 0.693147182464599609375;
                float _4370 = exp2(_4364);
                float _4372 = 1.0 / _4368;
                float _4374 = _4370 + (-1.0);
                float _4376 = -_4374;
                float _4378 = fma(_4376, _4372, _4334);
                float _4380 = _4378 * _4366;
                float _4382 = _4380 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4352 = _4382;
            }
            float _4384 = _4352;
            float _4386 = _4384 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4388 = _4384 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4390 = !_4332;
            if (!_4390)
            {
                float _4392 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4394 = log2(_4392);
                float _4396 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4398 = _4396 + 1.0;
                float _4400 = 1.0 / _4398;
                float _4402 = _4394 * _4334;
                float _4404 = exp2(_4402);
                float _4406 = -_4404;
                float _4408 = _4406 + 1.0;
                float _4410 = _4408 * _4400;
                _4336 = _4410;
            }
            float _4412 = _4336;
            float _4414 = fma(_4412, _1654, _4388);
            float _4416 = _4384 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4418 = fma(_4412, _1652, _4386);
            float _4420 = -_3166;
            float _4422 = _4420 + _4414;
            float _4424 = fma(_4412, _1656, _4416);
            float _4426 = -_3150;
            float _4428 = _4426 + _4418;
            float _4430 = _4422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4432 = _4422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4434 = _4422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4436 = -_3174;
            float _4438 = _4436 + _4424;
            float _4440 = fma(_4428, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4430);
            float _4442 = fma(_4428, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4432);
            float _4444 = fma(_4428, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4434);
            float _4446 = fma(_4438, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4440);
            float _4448 = fma(_4438, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4442);
            float _4450 = fma(_4438, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4444);
            _4304 = _4448;
            _4298 = _4446;
            _4276 = _4450;
            _4310 = _4446;
            _4316 = _4448;
            _4322 = _4450;
        }
        float _4452 = _4304;
        float _4454 = _4298;
        float _4456 = _4276;
        float _4458 = _4310;
        float _4460 = _4316;
        float _4462 = _4322;
        float _4464 = _4452 * _4452;
        float _4466 = rsqrt(_4186);
        float _4468 = fma(_4454, _4454, _4464);
        float _4470 = fma(_4456, _4456, _4468);
        float _4472 = sqrt(_4470);
        float _4474 = _4166 * _4466;
        float _4476 = _4156 * _4466;
        float _4478 = _4172 * _4466;
        bool _4480 = _4472 > 0.0;
        bool _4482 = !_4480;
        _4284 = _4458;
        _4286 = _4460;
        if (!_4482)
        {
            float _4484 = rsqrt(_4470);
            float _4486 = _4484 * _4452;
            float _4488 = _4484 * _4454;
            float _4490 = _4484 * _4456;
            float _4492 = _4476 * _4486;
            float _4494 = fma(_4474, _4488, _4492);
            float _4496 = fma(_4478, _4490, _4494);
            float _4498 = _4496 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4500 = fma(_4458, _4498, _4244);
            float _4502 = fma(_4460, _4498, _4248);
            float _4504 = fma(_4462, _4498, _4252);
            _4278 = _4502;
            _4280 = _4500;
            _4282 = _4504;
        }
    }
    float _4506 = _4278;
    float _4508 = _4280;
    float _4510 = _4282;
    float _4512 = _4284;
    float _4514 = _4286;
    float _4516 = -_2688;
    float _4518 = fma(_4516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4506);
    float _4520 = -_2690;
    float _4522 = fma(_4520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4508);
    float _4524 = -_2740;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4510);
    float _4528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4530 = _4518 + _4528;
    float _4532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4534 = _4522 + _4532;
    float _4536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4538 = _4526 + _4536;
    float _4540 = _4530 * _4530;
    float _4542 = fma(_4534, _4534, _4540);
    float _4544 = fma(_4538, _4538, _4542);
    float _4546 = rsqrt(_4544);
    float _4548 = _4546 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4550 = _4534 * _4548;
    float _4552 = _4538 * _4548;
    float _4554 = _4550 * _4550;
    float _4556 = _4552 * _4552;
    float _4558 = _4554 + _4556;
    float _4560 = sqrt(_4558);
    bool _4562 = _4560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4566 = _4560 + _4564;
    float _4568 = _4512;
    float _4570 = _4558;
    float _4572 = _4566;
    float _4574 = _4514;
    float _4576 = _4530;
    float _4578 = _4548;
    float _4580 = _4550;
    if (_4562)
    {
        float _4582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4568 = _4582;
    }
    float _4584 = _4568;
    if (_4562)
    {
        float _4586 = rsqrt(_4558);
        _4570 = _4586;
    }
    float _4588 = _4570;
    float _4590 = _4584;
    float _4592 = _4588;
    if (_4562)
    {
        float _4594 = _4566 * _4584;
        _4572 = _4594;
    }
    float _4596 = _4572;
    if (_4562)
    {
        float _4598 = _4596 * 0.15915493667125701904296875;
        _4574 = _4598;
    }
    float _4600 = _4574;
    float _4602 = _4538;
    if (_4562)
    {
        float _4604 = _4600 * 6.283185482025146484375;
        float _4606 = sin(_4604);
        _4602 = _4606;
    }
    float _4608 = _4602;
    float _4610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4612 = precise::max(0.0, _4610);
    float _4614 = _3150;
    if (_4562)
    {
        float _4616 = _4600 * 6.283185482025146484375;
        float _4618 = cos(_4616);
        _4614 = _4618;
    }
    float _4620 = _4614;
    float _4622 = -_4548;
    float _4624 = -_4612;
    float _4626 = fma(_4530, _4622, _4624);
    if (_4562)
    {
        float _4628 = _4626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4576 = _4628;
    }
    float _4630 = _4576;
    float _4632 = sqrt(_4544);
    float _4634 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4636 = _4608;
    float _4638 = _4630;
    if (_4562)
    {
        float _4640 = fma(_4608, _4630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4636 = _4640;
    }
    float _4642 = _4636;
    float _4644 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4634);
    float _4646 = _4642;
    float _4648 = _4620;
    if (_4562)
    {
        float _4650 = _4620 + (-1.0);
        _4638 = _4650;
    }
    float _4652 = _4638;
    float _4654 = _4652;
    if (_4562)
    {
        float _4656 = _4588 * _4642;
        _4578 = _4656;
    }
    float _4658 = _4578;
    if (!_4562)
    {
        _4646 = _4626;
    }
    float _4660 = _4646;
    float _4662 = _4660;
    if (_4562)
    {
        float _4664 = _4652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4590 = _4664;
    }
    float _4666 = _4590;
    if (_4562)
    {
        float _4668 = _4550 * _4658;
        _4580 = _4668;
    }
    float _4670 = _4580;
    if (!_4562)
    {
        _4654 = _4552;
    }
    float _4672 = _4654;
    float _4674 = _4672;
    if (_4562)
    {
        float _4676 = _4552 * _4658;
        _4674 = _4676;
    }
    float _4678 = _4674;
    if (!_4562)
    {
        _4592 = _4554;
    }
    float _4680 = _4592;
    float _4682 = _4680;
    if (_4562)
    {
        float _4684 = fma(_4626, _4620, _4666);
        _4662 = _4684;
    }
    float _4686 = _4662;
    if (_4562)
    {
        float _4688 = _4670 * _4670;
        _4682 = _4688;
    }
    float _4690 = _4682;
    if (!_4562)
    {
        _4648 = _4556;
    }
    float _4692 = _4648;
    float _4694 = _4692;
    if (_4562)
    {
        float _4696 = _4678 * _4678;
        _4694 = _4696;
    }
    float _4698 = _4694;
    float _4700 = fma(_4686, _4686, _4690);
    float _4702 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4704 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4706 = _4700 + _4698;
    float _4708 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4710 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4644);
    float _4712 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4714 = rsqrt(_4706);
    float _4716 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4708);
    float _4718 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4720 = fma(_4632, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4718);
    float _4722 = precise::clamp(_4720, 0.0, 1.0);
    float _4724 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4712);
    float _4726 = _4710 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4728 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4716);
    float _4730 = -_4722;
    float _4732 = _4730 + 1.0;
    float _4734 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4724);
    float _4736 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4704);
    float _4738 = _4728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4740 = abs(_4732);
    float _4742 = log2(_4740);
    float _4744 = _4734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4746 = _4726 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4748 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4750 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4736);
    float _4752 = _4714 * _4670;
    float _4754 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4748);
    float _4756 = _4714 * _4678;
    float _4758 = _4714 * _4686;
    float _4760 = _4752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4762 = -_4746;
    float _4764 = fma(_4762, _4702, 1.0);
    float _4766 = _4750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4768 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4754);
    float _4770 = -_4760;
    float _4772 = fma(_4758, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4770);
    float _4774 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4776 = _4742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4778 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4768);
    float _4780 = -_4756;
    float _4782 = fma(_4780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4772);
    float _4784 = log2(_4764);
    float _4786 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4788 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4774);
    float _4790 = fma(_4782, -0.5, 0.5);
    float _4792 = fma(_4782, 0.5, 0.5);
    float _4794 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4786);
    float _4796 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4788);
    float _4798 = _4758 + 1.0;
    float _4800 = 1.0 / _4778;
    float _4802 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4794);
    float _4804 = fma(_4792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4806 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4796);
    float _4808 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4802);
    float _4810 = fma(_4792, _4804, -0.212114393711090087890625);
    float _4812 = exp2(_4776);
    float _4814 = _4784 * 0.693147182464599609375;
    float _4816 = fma(_4792, _4810, 1.570728778839111328125);
    float _4818 = _4814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4820 = sqrt(_4790);
    float _4822 = _4808 * _4800;
    float _4824 = _4806 * _4800;
    float _4826 = fma(_4822, 0.5, 0.5);
    float _4828 = fma(_4824, -0.5, 0.5);
    float _4830 = -_4758;
    float _4832 = fma(_4812, _4798, _4830);
    float3 _12530 = float3(_4826, _4828, _4818);
    float _4834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12530, float3(0.0), isnan(_12530)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12530, float3(0.0), isnan(_12530)), level(0.0)).x;
    float _4836 = fma(_4832, 0.5, 0.5);
    float _4838 = _4820 * 0.636619746685028076171875;
    float _4840 = -_4816;
    float _4842 = fma(_4838, _4840, 1.0);
    float3 _12551 = float3(_4826, _4828, _4818);
    float4 _4845 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12551, float3(0.0), isnan(_12551)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12551, float3(0.0), isnan(_12551)), level(0.0)).xyzw;
    float _4847 = _4845.x;
    float _4849 = _4845.y;
    float _4851 = _4845.z;
    float _4853 = _4845.w;
    float2 _12568 = float2(_4842, _4836);
    float3 _4857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12568, float2(0.0), isnan(_12568)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12568, float2(0.0), isnan(_12568)), level(0.0)).xyz;
    float _4859 = _4857.x;
    float _4861 = _4857.y;
    float _4863 = _4857.z;
    float _4865 = -_2688;
    float _4867 = fma(_4865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4256);
    float _4869 = -_2690;
    float _4871 = fma(_4869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4236);
    float _4873 = -_2740;
    float _4875 = fma(_4873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4260);
    float _4877 = _4742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4879 = _4867 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4881 = _4808 + _4778;
    out.m_82.x = _4522;
    out.m_82.y = _4518;
    out.m_82.z = _4526;
    bool _4883 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4885 = isnan(_4632);
    bool _4887 = _4883 || _4885;
    bool _4889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4891 = _4887 || _4889;
    float _4893 = fma(_4871, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4879);
    float _4895 = exp2(_4877);
    out.m_84.x = _4871;
    out.m_84.y = _4867;
    out.m_84.z = _4875;
    float _4897 = fma(_4875, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4893);
    float _4899 = _4867 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4901 = _4897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4903 = fma(_4871, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4899);
    float _4905 = 1.0 / _4901;
    bool _4907 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4909 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4911 = _4907 || _4909;
    bool _4913 = isnan(0.5);
    bool _4915 = _4911 || _4913;
    float _4917 = fma(_4875, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4903);
    float _4919 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4921 = _4778 * 0.5;
    float _4923 = -_4895;
    float _4925 = _4923 + 1.0;
    float _4927 = _4917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4929 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4919);
    float _4931 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4933 = _4927 + _4901;
    float _4935 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4929);
    float _4937 = fma(_4806, -0.5, _4921);
    float _4939 = _4929;
    float _4941 = _4921;
    float _4943 = _4778;
    float _4945 = _4806;
    float _4947 = _4808;
    if (!_4915)
    {
        _4939 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4949 = _4939;
    float _4951 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4935);
    float _4953 = _4933 * _4905;
    float _4955 = _4953 * 0.5;
    float _4957 = _4949;
    float _4959 = _4951;
    if (!_4915)
    {
        _4941 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4961 = _4941;
    float _4963 = _4951 + _4778;
    if (!_4915)
    {
        float _4965 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4967 = fma(_4955, _4949, _4965);
        _4957 = _4967;
    }
    float _4969 = _4957;
    float _4971 = _4881 * 0.5;
    float _4973 = _4963 * 0.5;
    float _4975 = _4881;
    if (!_4915)
    {
        float _4977 = 1.0 / _4969;
        _4975 = _4977;
    }
    float _4979 = _4975;
    out.gl_Position.x = _4808;
    out.gl_Position.y = _4806;
    out.gl_Position.z = _4951;
    out.gl_Position.w = _4778;
    out.m_86.x = _4971;
    out.m_86.y = _4937;
    out.m_86.z = _4973;
    out.m_86.w = _4778;
    if (_4915)
    {
        _4943 = 1.0;
    }
    float _4981 = _4943;
    float _4983 = _4979;
    float _4985 = _4981;
    if (!_4915)
    {
        float _4987 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4989 = -_4961;
        float _4991 = fma(_4979, _4987, _4989);
        _4983 = _4991;
    }
    float _4993 = _4983;
    if (!_4891)
    {
        _4959 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4995 = _4959;
    float _4997 = _4995;
    float _4999 = _4995;
    if (!_4891)
    {
        _4945 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5001 = _4945;
    float _5003 = _5001;
    float _5005 = _5001;
    if (!_4891)
    {
        _4947 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5007 = _4947;
    float _5009 = _4931 * _4834;
    float _5011 = -_4931;
    float _5013 = _5011 + 1.0;
    float _5015 = _4853 * _5009;
    float _5017 = _4853 * _5013;
    float _5019 = _4863 * _5009;
    float _5021 = fma(_4859, _5015, _4847);
    float _5023 = _4847;
    float _5025 = _5007;
    float _5027 = _5007;
    if (!_4915)
    {
        float _5029 = -_4961;
        float _5031 = _5029 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _5023 = _5031;
    }
    float _5033 = _5023;
    float _5035 = fma(_4861, _5015, _4849);
    float _5037 = fma(_4853, _5019, _4851);
    float _5039 = _5033;
    if (!_4915)
    {
        float _5041 = 1.0 / _5033;
        _5039 = _5041;
    }
    float _5043 = _5039;
    out.m_88.x = _5021;
    out.m_88.y = _5035;
    out.m_88.z = _5037;
    out.m_88.w = _5017;
    if (!_4915)
    {
        float _5045 = _4993 * _5043;
        float _5047 = precise::clamp(_5045, 0.0, 1.0);
        _4985 = _5047;
    }
    float _5049 = _4985;
    float _5051 = _5049 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _5053 = !_4891;
    if (!_5053)
    {
        bool _5055 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5057 = isnan(_4632);
        bool _5059 = _5055 || _5057;
        bool _5061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5063 = _5059 || _5061;
        if (!_5063)
        {
            float _5065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5067 = _4632 + _5065;
            float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5069;
            float _5073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5075 = _5073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5077 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5079 = _5077 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5081 = 1.0 / _5071;
            float _5083 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5085 = _5083 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5087 = _5067 * _5081;
            float _5089 = precise::clamp(_5087, 0.0, 1.0);
            float _5091 = fma(_5089, _5075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5093 = fma(_5089, _5079, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5095 = fma(_5089, _5085, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5005 = _5093;
            _4999 = _5091;
            _5027 = _5095;
            _5097 = true;
        }
        else
        {
            bool _5099 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5101 = isnan(_4632);
            bool _5103 = _5099 || _5101;
            bool _5105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5107 = _5103 || _5105;
            if (!_5107)
            {
                _4997 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5109 = _4997;
            _4999 = _5109;
            if (!_5107)
            {
                _5003 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5111 = _5003;
            _5005 = _5111;
            if (!_5107)
            {
                _5025 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5113 = _5025;
            bool _5115 = !_5107;
            _5027 = _5113;
            if (!_5115)
            {
                bool _5117 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5119 = isnan(_4632);
                bool _5121 = _5117 || _5119;
                bool _5123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5125 = _5121 || _5123;
                if (!_5125)
                {
                    float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5129 = _4632 + _5127;
                    float _5131 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5133 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5131;
                    float _5135 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5137 = _5135 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5139 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5141 = _5139 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5143 = 1.0 / _5133;
                    float _5145 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5147 = _5145 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5149 = _5129 * _5143;
                    float _5151 = precise::clamp(_5149, 0.0, 1.0);
                    float _5153 = fma(_5151, _5137, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5155 = fma(_5151, _5141, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5157 = fma(_5151, _5147, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5005 = _5155;
                    _4999 = _5153;
                    _5027 = _5157;
                    _5097 = true;
                }
                else
                {
                    _5005 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4999 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5027 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5097 = false;
    float _5159 = _5005;
    float _5161 = _4999;
    float _5163 = _5027;
    float _5165 = _5051 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _5167 = _5159 * 0.586610972881317138671875;
    bool _5169 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5165;
    float _5171 = fma(_5161, 0.298911988735198974609375, _5167);
    bool _5173 = _5049 > 0.0;
    bool _5175 = isnan(_5049);
    bool _5177 = _5173 || _5175;
    bool _5179 = isnan(0.0);
    bool _5181 = _5177 || _5179;
    float _5183 = fma(_5163, 0.114477999508380889892578125, _5171);
    float _5185 = -_5183;
    float _5187 = _5185 + _5161;
    float _5189 = -_5183;
    float _5191 = _5189 + _5159;
    float _5193 = -_5183;
    float _5195 = _5193 + _5163;
    float _5197 = fma(_5187, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5183);
    float _5199 = fma(_5191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5183);
    float _5201 = fma(_5195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5183);
    bool _5203 = !_5169;
    if (!_5203)
    {
        float _5205 = -_4518;
        float _5207 = _5205 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5209 = -_4522;
        float _5211 = _5209 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5213 = -_4526;
        float _5215 = _5213 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5217 = _5207 * _5207;
        float _5219 = fma(_5211, _5211, _5217);
        float _5221 = fma(_5215, _5215, _5219);
        float _5223 = sqrt(_5221);
        float _5225 = rsqrt(_5221);
        float _5227 = -_5223;
        float _5229 = _5227 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5231 = _5229 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5233 = precise::clamp(_5231, 0.0, 1.0);
        float _5235 = _5211 * _5225;
        float _5237 = _5207 * _5225;
        float _5239 = abs(_5233);
        float _5241 = log2(_5239);
        float _5243 = _5215 * _5225;
        float _5245 = _5235 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5247 = _4216 * _5237;
        float _5249 = -_5237;
        float _5251 = -_5245;
        float _5253 = fma(_5249, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5251);
        float _5255 = fma(_4214, _5235, _5247);
        float _5257 = -_5243;
        float _5259 = fma(_5257, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5253);
        float _5261 = fma(_4218, _5243, _5255);
        float _5263 = precise::clamp(_5261, 0.0, 1.0);
        float _5265 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5267 = _5259 + _5265;
        float _5269 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5271 = _5267 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5273 = precise::clamp(_5271, 0.0, 1.0);
        float _5275 = exp2(_5269);
        float _5277 = _5275 * _5273;
        float _5279 = _5263 * _5277;
        float _5281 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5283 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5285 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _5281;
        out.m_90.y = _5283;
        out.m_90.z = _5285;
    }
    out.m_68.x = _5197;
    out.m_68.y = _5199;
    out.m_68.z = _5201;
    if (_5181)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _5287 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5287;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5097 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5344 = as_type<float>(_125);
        out.gl_Position.z = _5344;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    if (_141)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5417 = as_type<float>(_163);
        out.gl_Position.z = _5417;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _167 = int(_165);
    float _169 = in.m_51.y;
    float _171 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_51.z;
    float _175 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _177 = int(_175);
    float _179 = in.m_51.w;
    float _181 = float(_167);
    float _183 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _185 = int(_183);
    float _187 = float(uint(_177));
    float _189 = 1.0 / _181;
    int _191 = ~_177;
    int _193 = _191 + 1;
    float _195 = 1.0 / _187;
    float _197 = float(_185);
    float _199 = _145 * _189;
    float _201 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _203 = int(_201);
    int _205 = as_type<int>(_195) + (-2);
    float _207 = trunc(_199);
    int _209 = int(_207);
    bool _211 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _215 = _211 || _213;
    bool _217 = isnan(1.0);
    bool _219 = _215 || _217;
    float _221 = 1.0 / _197;
    float _223 = float(uint(_203));
    int _225 = ~_203;
    int _227 = _225 + 1;
    float _229 = float(uint(_209));
    float _231 = 1.0 / _223;
    float _233 = 0.0;
    float _235 = _171;
    if (!_219)
    {
        float _237 = _171 * _171;
        float _239 = _237 * 0.5;
        _233 = _239;
    }
    float _241 = _233;
    float _243 = as_type<float>(_205) * _229;
    float _245 = _241;
    if (!_219)
    {
        float _247 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _247;
    }
    float _249 = _245;
    float _251 = _145 * _221;
    float _253 = trunc(_243);
    float _255 = precise::max(_253, 0.0);
    uint _258 = uint(_255);
    float _260 = as_type<float>(int(gl_VertexIndex));
    float _262 = trunc(_251);
    int _264 = int(_262);
    int _266 = as_type<int>(_231) + (-2);
    int _268 = _193 * int(_258);
    int _270 = _268 + _209;
    float _272 = float(uint(_270));
    float _274 = float(uint(_264));
    float _276 = as_type<float>(_205) * _272;
    int _278 = as_type<int>(_260) & 1;
    bool _280 = _278 != 0;
    int _282 = as_type<int>(_260) & 2;
    bool _284 = _282 != 0;
    float _286 = as_type<float>(_266) * _274;
    float _288 = trunc(_276);
    float _290 = precise::max(_288, 0.0);
    uint _292 = uint(_290);
    bool _294 = !_280;
    float _296 = _294 ? (-0.5) : 0.5;
    bool _298 = !_284;
    float _300 = _298 ? (-0.5) : 0.5;
    float _302 = trunc(_286);
    float _304 = precise::max(_302, 0.0);
    uint _306 = uint(_304);
    bool _308 = !_219;
    float _310 = _249;
    if (!_308)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = _171 * _314;
        float _324 = 1.0 / _318;
        float _326 = _320 * 0.693147182464599609375;
        float _328 = exp2(_322);
        float _330 = 1.0 / _326;
        float _332 = _328 + (-1.0);
        float _334 = -_332;
        float _336 = fma(_334, _330, _171);
        float _338 = _336 * _324;
        float _340 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _310 = _340;
    }
    float _342 = _310;
    bool _344 = !_219;
    if (!_344)
    {
        float _346 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _348 = log2(_346);
        float _350 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _352 = _350 + 1.0;
        float _354 = 1.0 / _352;
        float _356 = _171 * _348;
        float _358 = exp2(_356);
        float _360 = -_358;
        float _362 = _360 + 1.0;
        float _364 = _362 * _354;
        _235 = _364;
    }
    float _366 = _235;
    float _368 = 0.0;
    if (!_219)
    {
        float _370 = _145 * _145;
        float _372 = _370 * 0.5;
        _368 = _372;
    }
    float _374 = _368;
    int _376 = _227 * int(_306);
    int _378 = _376 + _264;
    bool _380 = _169 > 0.5;
    float _382 = _374;
    if (!_219)
    {
        float _384 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _382 = _384;
    }
    float _386 = _382;
    int _388 = int(_258) + int(_292);
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _392 = _390 != 0;
    int _394 = ~_177;
    int _396 = _394 + 1;
    float _398 = 0.0;
    float _400 = _386;
    if (!_219)
    {
        _398 = _145;
    }
    float _402 = _398;
    float _404 = float(uint(_378));
    bool _406 = !_219;
    float _408 = _402;
    if (!_406)
    {
        float _410 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _412 = log2(_410);
        float _414 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _416 = _414 + 1.0;
        float _418 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _420 = _145 * _412;
        float _422 = 1.0 / _416;
        float _424 = _418 * 0.693147182464599609375;
        float _426 = exp2(_420);
        float _428 = 1.0 / _424;
        float _430 = _426 + (-1.0);
        float _432 = -_430;
        float _434 = fma(_432, _428, _145);
        float _436 = _434 * _422;
        float _438 = _436 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _400 = _438;
    }
    float _440 = _400;
    bool _442 = !_219;
    if (!_442)
    {
        float _444 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _446 = log2(_444);
        float _448 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _450 = _448 + 1.0;
        float _452 = 1.0 / _450;
        float _454 = _145 * _446;
        float _456 = exp2(_454);
        float _458 = -_456;
        float _460 = _458 + 1.0;
        float _462 = _460 * _452;
        _408 = _462;
    }
    float _464 = _408;
    float _466 = as_type<float>(_266) * _404;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _474 = _472 != 0;
    int _476 = _396 * _388;
    int _478 = _476 + _209;
    bool _480 = _173 > 0.5;
    float _482 = trunc(_466);
    float _484 = precise::max(_482, 0.0);
    uint _486 = uint(_484);
    float _488 = -_296;
    int _490 = _380 ? as_type<int>(_488) : as_type<int>(_296);
    float _492 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _504 = _502 != 0;
    float _506 = _131 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _508 = !_392;
    int _510 = _508 ? 0 : 1;
    float _512 = in.m_58.w;
    float _514 = -_300;
    int _516 = _480 ? as_type<int>(_514) : as_type<int>(_300);
    bool _518 = uint(_478) >= uint(_177);
    int _520 = ~_203;
    int _522 = _520 + 1;
    bool _524 = !_500;
    float _526 = _524 ? _296 : as_type<float>(_490);
    bool _528 = !_504;
    float _530 = _528 ? _300 : as_type<float>(_516);
    bool _532 = !_518;
    int _534 = _532 ? 0 : (-1);
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _546 = _544 != 0;
    int _548 = int(_306) + int(_486);
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _552 = _550 != 0;
    bool _554 = !_552;
    int _556 = _554 ? 0 : 1;
    bool _558 = _179 > 0.5;
    int _560 = _522 * _548;
    int _562 = _560 + _264;
    bool _564 = !_470;
    int _566 = _564 ? 0 : 1;
    float _568 = -_300;
    int _570 = _558 ? as_type<int>(_568) : as_type<int>(_300);
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _574 = _572 != 0;
    bool _576 = uint(_562) >= uint(_203);
    bool _578 = !_474;
    int _580 = _578 ? 0 : 1;
    bool _582 = !_496;
    float _584 = _582 ? _300 : as_type<float>(_570);
    bool _586 = !_574;
    int _588 = _586 ? 0 : 1;
    bool _590 = !_576;
    int _592 = _590 ? 0 : (-1);
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _596 = _594 != 0;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _600 = _598 != 0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _608 = _606 != 0;
    float _610 = float(_109);
    bool _612 = !_600;
    int _614 = _612 ? 0 : 1;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _618 = _616 != 0;
    float _620 = 1.0 / _610;
    float _622 = float(_177);
    float _624 = float(_209);
    int _626 = ~_388;
    int _628 = _626 + _534;
    int _630 = _628 + 1;
    bool _632 = _624 >= _622;
    bool _634 = isnan(_624);
    bool _636 = _632 || _634;
    bool _638 = isnan(_622);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    bool _644 = !_542;
    int _646 = _644 ? 0 : 1;
    bool _648 = !_538;
    int _650 = _648 ? 0 : 1;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_618)
    {
        _652 = 1.0;
    }
    float _654 = _652;
    float _656 = trunc(_642);
    int _658 = int(_656);
    float _660 = _654;
    if (!_618)
    {
        _660 = 7.345489978790283203125;
    }
    float _662 = _660;
    float _664 = _145 * _620;
    bool _666 = !_596;
    int _668 = _666 ? 0 : 1;
    bool _670 = _177 == 0;
    float _672 = _662 * _131;
    int _674 = abs(_646);
    bool _676 = !_546;
    int _678 = _676 ? 0 : 1;
    float _680 = floor(_672);
    int _682 = ~_548;
    int _684 = _682 + _592;
    int _686 = _684 + 1;
    int _688 = abs(_678);
    bool _690 = _203 == 0;
    bool _692 = !_604;
    int _694 = _692 ? 0 : 1;
    int _696 = abs(_668);
    int _698 = abs(_694);
    bool _700 = _169 > 0.5;
    float _702 = -_680;
    float _704 = _672 + _702;
    int _706 = _177 + (-1);
    float _708 = -_300;
    int _710 = _700 ? as_type<int>(_708) : as_type<int>(_300);
    float _712 = _704 * _622;
    int _714 = _177 * _630;
    int _716 = _714 + _209;
    float _718 = _622 * _664;
    int _720 = abs(_510);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _724 = ~_658;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    float _730 = trunc(_712);
    int _732 = int(_730);
    bool _734 = !_670;
    int _736 = _734 ? _716 : (-1);
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _740 = _738 != 0;
    int _742 = _736 * _728;
    int _744 = abs(_650);
    float _746 = trunc(_718);
    int _748 = int(_746);
    int _750 = _658 * _706;
    int _752 = _750 + _742;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _756 = as_type<float>(_742);
    float _758 = as_type<float>(_706);
    if (_618)
    {
        _756 = 1.0;
    }
    float _760 = _756;
    int _762 = _752 * _674;
    float _764 = _760;
    if (_618)
    {
        _758 = _131;
    }
    float _766 = _758;
    int _768 = _732 * _720;
    int _770 = _768 + _209;
    float _772 = _766;
    if (!_618)
    {
        _764 = 1.2345600128173828125;
    }
    float _774 = _764;
    if (!_618)
    {
        _772 = _169;
    }
    float _776 = _772;
    float _778 = float(_203);
    int _780 = _748 * _744;
    int _782 = _780 + _762;
    int _784 = abs(_556);
    float _786 = _774 * _776;
    int _788 = _770 * _688;
    int _790 = _788 + _782;
    float _792 = float(_264);
    float _794 = floor(_786);
    float _796 = _778 * _664;
    int _798 = _732 * _784;
    int _800 = _798 + _790;
    bool _802 = _792 >= _778;
    bool _804 = isnan(_792);
    bool _806 = _802 || _804;
    bool _808 = isnan(_778);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = (*spvDescriptorSet0.vp_c10)._m0[8].w * 0.00999999977648258209228515625;
    float _816 = float(uint(_800));
    float _818 = trunc(_796);
    int _820 = int(_818);
    float _822 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _814);
    float _824 = as_type<float>(_205) * _816;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _826;
    float _830 = trunc(_812);
    int _832 = int(_830);
    float _834 = -_794;
    float _836 = _786 + _834;
    int _838 = ~_177;
    int _840 = _838 + 1;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _850 = _836 * _778;
    int _852 = _203 * _686;
    int _854 = _852 + _264;
    int _856 = abs(_588);
    float _858 = trunc(_824);
    float _860 = precise::max(_858, 0.0);
    uint _862 = uint(_860);
    bool _864 = !_690;
    int _866 = _864 ? _854 : (-1);
    bool _868 = _173 > 0.5;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _874 = trunc(_850);
    int _876 = int(_874);
    int _878 = ~_832;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    int _884 = abs(_614);
    int _886 = _866 * _882;
    int _888 = _203 + (-1);
    int _890 = _840 * int(_862);
    int _892 = _890 + _800;
    float _894 = 1.0 / _848;
    int _896 = _832 * _888;
    int _898 = _896 + _886;
    float _900 = float(uint(_892));
    int _902 = _898 * _884;
    float _904 = float(uint(_770));
    float _906 = as_type<float>(_205) * _900;
    int _908 = _876 * _856;
    int _910 = _908 + _264;
    bool _912 = !_608;
    int _914 = _912 ? 0 : 1;
    int _916 = _820 * _696;
    int _918 = _916 + _902;
    float _920 = as_type<float>(_205) * _904;
    float _922 = trunc(_906);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = abs(_914);
    int _930 = _910 * _698;
    int _932 = _930 + _918;
    int _934 = ~_177;
    int _936 = _934 + 1;
    int _938 = ~_203;
    int _940 = _938 + 1;
    int _942 = _876 * _928;
    int _944 = _942 + _932;
    float _946 = trunc(_920);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    int _952 = abs(_580);
    float _954 = float(uint(_944));
    int _956 = int(_862) + int(_926);
    float _958 = 1.0 / _872;
    float _960 = as_type<float>(_266) * _954;
    int _962 = _936 * _956;
    int _964 = _962 + _800;
    float _966 = trunc(_960);
    float _968 = precise::max(_966, 0.0);
    uint _970 = uint(_968);
    int _972 = _936 * int(_950);
    int _974 = _972 + _770;
    bool _976 = uint(_964) >= uint(_177);
    float _978 = float(uint(_974));
    bool _980 = !_976;
    int _982 = _980 ? 0 : (-1);
    float _984 = as_type<float>(_205) * _978;
    int _986 = ~_956;
    int _988 = _986 + _982;
    int _990 = _988 + 1;
    int _992 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _994 = _992 != 0;
    int _996 = _940 * int(_970);
    int _998 = _996 + _944;
    int _1000 = _177 * _990;
    int _1002 = _1000 + _800;
    bool _1004 = !_994;
    int _1006 = _1004 ? 0 : 1;
    float _1008 = trunc(_984);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    float _1014 = float(uint(_998));
    int _1016 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1018 = _1016 != 0;
    bool _1020 = !_670;
    int _1022 = _1020 ? _1002 : (-1);
    float _1024 = as_type<float>(_266) * _1014;
    bool _1026 = !_1018;
    float _1028 = _1026 ? _300 : as_type<float>(_710);
    int _1030 = _1022 & 3;
    bool _1032 = _1030 != 0;
    float _1034 = trunc(_1024);
    float _1036 = precise::max(_1034, 0.0);
    uint _1038 = uint(_1036);
    int _1040 = _1022 & 3;
    bool _1042 = _1040 != 0;
    int _1044 = _1032 ? 0 : 1;
    bool _1046 = uint(_1040) > 1u;
    float _1048 = float(uint(_910));
    int _1050 = ~_177;
    int _1052 = _1050 + 1;
    int _1054 = int(_950) + int(_1012);
    float _1056 = as_type<float>(_266) * _1048;
    int _1058 = ~_1044;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    int _1064 = ~_203;
    int _1066 = _1064 + 1;
    float _1068 = trunc(_1056);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    int _1074 = _1052 * _1054;
    int _1076 = _1074 + _770;
    int _1078 = _1062;
    if (!_1046)
    {
        int _1080 = ~_1044;
        int _1082 = _1080 + 1;
        _1078 = _1082;
    }
    int _1084 = _1078;
    bool _1086 = uint(_1040) >= 2u;
    int _1088 = int(_970) + int(_1038);
    int _1090 = _1086 ? 0 : 1;
    float _1092 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _1094 = uint(_1076) >= uint(_177);
    int _1096 = _1066 * _1088;
    int _1098 = _1096 + _944;
    int _1100 = ~_203;
    int _1102 = _1100 + 1;
    bool _1104 = !_1042;
    int _1106 = _1104 ? 0 : 1;
    bool _1108 = !_1094;
    int _1110 = _1108 ? 0 : (-1);
    bool _1112 = uint(_1098) >= uint(_203);
    int _1114 = _1102 * int(_1072);
    int _1116 = _1114 + _910;
    int _1118 = ~_1054;
    int _1120 = _1118 + _1110;
    int _1122 = _1120 + 1;
    bool _1124 = !_1112;
    int _1126 = _1124 ? 0 : (-1);
    bool _1128 = _1040 != 3;
    float _1130 = float(uint(_1116));
    int _1132 = ~_1088;
    int _1134 = _1132 + _1126;
    int _1136 = _1134 + 1;
    int _1138 = _177 * _1122;
    int _1140 = _1138 + _770;
    int _1142 = ~_1090;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = as_type<float>(_266) * _1130;
    float _1150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _1152 = _203 * _1136;
    int _1154 = _1152 + _944;
    bool _1156 = !_670;
    int _1158 = _1156 ? _1140 : (-1);
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1162 = _1160 != 0;
    int _1164 = _1146;
    if (_1128)
    {
        int _1166 = ~_1090;
        int _1168 = _1166 + 1;
        _1164 = _1168;
    }
    int _1170 = _1164;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1174 = _1172 != 0;
    float _1176 = trunc(_1148);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    bool _1182 = !_690;
    int _1184 = _1182 ? _1154 : (-1);
    bool _1186 = !_1174;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = _1184 & 3;
    bool _1192 = _1190 != 0;
    bool _1194 = !_1162;
    int _1196 = _1194 ? 0 : 1;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    bool _1200 = uint(_1190) > 1u;
    float _1202 = _1092 * _1150;
    int _1204 = _1184 & 3;
    bool _1206 = _1204 != 0;
    bool _1208 = !_1192;
    int _1210 = _1208 ? 0 : 1;
    bool _1212 = _1040 != 3;
    int _1214 = _1206 ? 0 : 1;
    int _1216 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1218 = _1216 != 0;
    int _1220 = _1022 >> 31;
    int _1222 = ~_1214;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _492 * _1198;
    int _1230 = _1226;
    if (!_1200)
    {
        int _1232 = ~_1214;
        int _1234 = _1232 + 1;
        _1230 = _1234;
    }
    int _1236 = _1230;
    int _1238 = _1184 >> 31;
    int _1240 = _1220 & 3;
    int _1242 = _1238 & 3;
    int _1244 = _1022 + _1240;
    int _1246 = int(_1072) + int(_1180);
    int _1248 = _1184 + _1242;
    float _1250 = _131 * 2.0;
    int _1252 = _1244 >> 2;
    int _1254 = ~_203;
    int _1256 = _1254 + 1;
    float _1258 = floor(_1250);
    bool _1260 = uint(_1190) >= 2u;
    int _1262 = _1252 << 4;
    int _1264 = _1262 + 368;
    int _1266 = _1256 * _1246;
    int _1268 = _1266 + _910;
    int _1270 = _1260 ? 0 : 1;
    bool _1272 = _1190 != 3;
    uint _1274 = uint(int(uint(_1264) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[int(_1284)][_1286];
    int _1290 = _1248 >> 2;
    float _1292 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1294 = int(_1292);
    bool _1296 = !_1272;
    int _1298 = _1296 ? 0 : (-1);
    bool _1300 = uint(_1268) >= uint(_203);
    float _1302 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1304 = _1290 << 4;
    int _1306 = _1304 + 512;
    bool _1308 = !_1300;
    int _1310 = _1308 ? 0 : (-1);
    float _1312 = -_754;
    float _1314 = fma(_1302, 2.0, _1312);
    bool _1316 = _1190 != 3;
    int _1318 = ~_1246;
    int _1320 = _1318 + _1310;
    int _1322 = _1320 + 1;
    uint _1324 = uint(int(uint(_1306) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[int(_1334)][_1336];
    float _1340 = -_145;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1314);
    bool _1344 = !_1212;
    int _1346 = _1344 ? 0 : (-1);
    int _1348 = _203 * _1322;
    int _1350 = _1348 + _910;
    bool _1352 = _1258 >= 0.0;
    bool _1354 = isnan(_1258);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan(0.0);
    bool _1360 = _1356 || _1358;
    float _1362 = -_506;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1366 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1368 = _1264 + 8;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[int(_1380)][_1382];
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1390 = fma(_1366, -2.0, _722);
    int _1392 = ~_1270;
    int _1394 = _1392 + 1;
    int _1396 = _1394 + 1;
    int _1398 = _1396;
    if (_1316)
    {
        int _1400 = ~_1270;
        int _1402 = _1400 + 1;
        _1398 = _1402;
    }
    int _1404 = _1398;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1410 = _1258 > 0.0;
    float _1412 = 1.0 / _1388;
    int _1414 = abs(_1084);
    float _1416 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1390);
    int _1418 = _1306 + 8;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    uint _1422 = uint(int(uint(int(_1420)) >> uint(2)));
    int _1424 = int(_1420) & 3;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[int(_1422)][_1424];
    int _1428 = int(_1420) + 1;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    int _1432 = _1428 & 3;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[int(_1430)][_1432];
    int _1436 = abs(_1106);
    int _1438 = abs(_1236);
    float _1440 = 1.0 / _1408;
    int _1442 = ~_1414;
    int _1444 = _1442 + 1;
    int _1446 = _1444 + 1;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1450 = _1448 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1452 = ~_1436;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    int _1458 = ~_1438;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    int _1464 = abs(_1298);
    int _1466 = _1446 * as_type<int>(_1288);
    int _1468 = abs(_1170);
    float _1470 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1472 = int(_1470);
    bool _1474 = !_690;
    int _1476 = _1474 ? _1350 : (-1);
    int _1478 = _1456 * as_type<int>(_1280);
    int _1480 = _1478 + _1466;
    int _1482 = abs(_1210);
    float _1484 = _844 * _1412;
    int _1486 = ~_1468;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    float _1492 = _828 * _1440;
    float _1494 = 1.0 / _1450;
    float _1496 = float(uint(_1294));
    int _1498 = ~_1482;
    int _1500 = _1498 + 1;
    int _1502 = _1500 + 1;
    int _1504 = _1462 * as_type<int>(_1338);
    int _1506 = _1502 * as_type<int>(_1330);
    int _1508 = _1506 + _1504;
    float _1510 = 1.0 / _1496;
    int _1512 = abs(_1404);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _1518 = _1490 * as_type<int>(_1376);
    int _1520 = _1518 + _1480;
    int _1522 = abs(_1346);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1524;
    int _1528 = abs(_1188);
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1534 = ~_1522;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    float _1540 = 1.0 / _1516;
    int _1542 = ~_1528;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    float _1548 = _1526 * _1494;
    int _1550 = abs(_1294);
    int _1552 = _1538 * as_type<int>(_1384);
    int _1554 = _1552 + _1520;
    int _1556 = ~_1512;
    int _1558 = _1556 + 1;
    int _1560 = _1558 + 1;
    float _1562 = _1532 * _894;
    float _1564 = float(uint(_1550));
    int _1566 = _1554 * _1546;
    int _1568 = _1560 * as_type<int>(_1426);
    int _1570 = _1568 + _1508;
    int _1572 = _1158 * _1528;
    int _1574 = _1572 + _1566;
    float _1576 = 1.0 / _1564;
    int _1578 = abs(_1196);
    int _1580 = ~_1464;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1590 = as_type<int>(_1510) + (-2);
    float _1592 = float(uint(_1574));
    int _1594 = _1584 * as_type<int>(_1434);
    int _1596 = _1594 + _1570;
    float _1598 = float(uint(_1472));
    float _1600 = 1.0 / _1588;
    int _1602 = ~_1578;
    int _1604 = _1602 + 1;
    int _1606 = _1604 + 1;
    float _1608 = as_type<float>(_1590) * _1592;
    int _1610 = abs(_1574);
    int _1612 = abs(_1472);
    int _1614 = _1596 * _1606;
    int _1616 = as_type<int>(_1576) + (-2);
    float _1618 = 1.0 / _1598;
    float _1620 = float(uint(_1612));
    int _1622 = _1476 * _1578;
    int _1624 = _1622 + _1614;
    float _1626 = float(uint(_1610));
    int _1628 = ~_1294;
    int _1630 = _1628 + 1;
    float _1632 = float(uint(_1624));
    float _1634 = trunc(_1608);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = as_type<float>(_1616) * _1626;
    int _1642 = abs(_1624);
    int _1644 = ~_1550;
    int _1646 = _1644 + 1;
    float _1648 = 1.0 / _1620;
    int _1650 = as_type<int>(_1618) + (-2);
    float _1652 = in.m_49.x;
    float _1654 = in.m_49.y;
    float _1656 = in.m_49.z;
    bool _1658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1660 = as_type<float>(_1650) * _1632;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1662;
    float _1666 = trunc(_1640);
    float _1668 = precise::max(_1666, 0.0);
    uint _1670 = uint(_1668);
    int _1672 = _1630 * int(_1638);
    int _1674 = _1672 + _1574;
    float _1676 = in.m_44.x;
    float _1678 = in.m_44.y;
    float _1680 = in.m_44.z;
    float _1682 = _1664 * _1540;
    float _1684 = float(uint(_1674));
    float _1686 = trunc(_1660);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    float _1692 = as_type<float>(_1590) * _1684;
    int _1694 = as_type<int>(_1648) + (-2);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1700 = float(uint(_1642));
    int _1702 = _1646 * int(_1670);
    int _1704 = _1702 + _1610;
    float _1706 = trunc(_1692);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    float _1712 = as_type<float>(_1694) * _1700;
    float _1714 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1716 = float(uint(_1704));
    float _1718 = _1698 * _958;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1720;
    float _1724 = fma(_366, _1656, _1714);
    int _1726 = ~_1472;
    int _1728 = _1726 + 1;
    float _1730 = trunc(_1712);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    float _1736 = as_type<float>(_1616) * _1716;
    float _1738 = _1722 * _1600;
    float _1740 = fma(_1724, _512, _1680);
    int _1742 = ~_1612;
    int _1744 = _1742 + 1;
    float _1746 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _1748 = trunc(_1736);
    float _1750 = precise::max(_1748, 0.0);
    uint _1752 = uint(_1750);
    int _1754 = _1728 * int(_1690);
    int _1756 = _1754 + _1624;
    int _1758 = int(_1638) + int(_1710);
    int _1760 = ~_1294;
    int _1762 = _1760 + 1;
    float _1764 = float(uint(_1756));
    int _1766 = _1744 * int(_1734);
    int _1768 = _1766 + _1642;
    int _1770 = ~_1550;
    int _1772 = _1770 + 1;
    int _1774 = _1762 * _1758;
    int _1776 = _1774 + _1574;
    float _1778 = as_type<float>(_1650) * _1764;
    float _1780 = -_1740;
    float _1782 = precise::max(0.0, _1780);
    float _1784 = float(uint(_1768));
    int _1786 = int(_1670) + int(_1752);
    float _1788 = trunc(_1778);
    float _1790 = precise::max(_1788, 0.0);
    uint _1792 = uint(_1790);
    float _1794 = as_type<float>(_1694) * _1784;
    float _1796 = -_296;
    int _1798 = _868 ? as_type<int>(_1796) : as_type<int>(_296);
    bool _1800 = uint(_1776) >= uint(_1294);
    int _1802 = _1772 * _1786;
    int _1804 = _1802 + _1610;
    float _1806 = precise::min(_1746, _1782);
    float _1808 = trunc(_1794);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    bool _1814 = !_1800;
    int _1816 = _1814 ? 0 : (-1);
    int _1818 = _1694;
    int _1820 = as_type<int>(_1778);
    float _1822 = _1794;
    float _1824 = as_type<float>(_1804);
    if (_618)
    {
        _1818 = 0;
    }
    int _1826 = _1818;
    int _1828 = _1826;
    if (_618)
    {
        _1820 = 0;
    }
    int _1830 = _1820;
    int _1832 = _1830;
    if (!_618)
    {
        _1828 = 1;
    }
    int _1834 = _1828;
    float _1836 = 1.0 / _1746;
    int _1838 = ~_1758;
    int _1840 = _1838 + _1816;
    int _1842 = _1840 + 1;
    if (!_618)
    {
        _1832 = 2;
    }
    int _1844 = _1832;
    bool _1846 = uint(_1804) >= uint(_1550);
    int _1848 = _1294 * _1842;
    int _1850 = _1848 + _1574;
    int _1852 = int(_1690) + int(_1792);
    float _1854 = as_type<float>(_1758);
    float _1856 = as_type<float>(_1850);
    float _1858 = as_type<float>(_1852);
    float _1860 = as_type<float>(_1844);
    if (_1658)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1854 = _1862;
    }
    float _1864 = _1854;
    bool _1866 = !_1846;
    int _1868 = _1866 ? 0 : (-1);
    float _1870 = _173 * 2.0;
    bool _1872 = _1294 == 0;
    bool _1874 = _1834 != 1;
    int _1876 = ~_1472;
    int _1878 = _1876 + 1;
    float _1880 = _1806 * _1836;
    bool _1882 = !_1872;
    int _1884 = _1882 ? _1850 : (-1);
    float _1886 = _1880;
    if (_1658)
    {
        float _1888 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1856 = _1888;
    }
    float _1890 = _1856;
    int _1892 = int(_1734) + int(_1812);
    float _1894 = floor(_1870);
    int _1896 = ~_1612;
    int _1898 = _1896 + 1;
    int _1900 = _1878 * _1852;
    int _1902 = _1900 + _1624;
    bool _1904 = _131 > 0.5;
    float _1906 = _1890;
    float _1908 = as_type<float>(_1898);
    if (_1658)
    {
        float _1910 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1880);
        _1906 = _1910;
    }
    float _1912 = _1906;
    bool _1914 = !_740;
    float _1916 = _1914 ? _296 : as_type<float>(_1798);
    int _1918 = _1898 * _1892;
    int _1920 = _1918 + _1642;
    float _1922 = -_296;
    int _1924 = _1904 ? as_type<int>(_1922) : as_type<int>(_296);
    float _1926 = as_type<float>(_1920);
    if (_1658)
    {
        float _1928 = _1912 * _1864;
        _1908 = _1928;
    }
    float _1930 = _1908;
    bool _1932 = uint(_1902) >= uint(_1472);
    float _1934 = _131 + _169;
    bool _1936 = _1844 != 2;
    float _1938 = as_type<float>(_1772);
    if (_1658)
    {
        float _1940 = floor(_1930);
        _1938 = _1940;
    }
    float _1942 = _1938;
    bool _1944 = !_1932;
    int _1946 = _1944 ? 0 : (-1);
    float _1948 = _1934 + (-1.0);
    bool _1950 = uint(_1920) >= uint(_1612);
    float _1952 = _131 + _173;
    bool _1954 = !_1218;
    float _1956 = _1954 ? _296 : as_type<float>(_1924);
    float _1958 = _1870 + (-1.0);
    float _1960 = _1952 + (-1.0);
    bool _1962 = !_1950;
    int _1964 = _1962 ? 0 : (-1);
    out.m_60.x = _1880;
    bool _1966 = _1894 > 0.0;
    float _1968 = fma(_1948, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1970 = _1894 >= 0.0;
    bool _1972 = isnan(_1894);
    bool _1974 = _1970 || _1972;
    bool _1976 = isnan(0.0);
    bool _1978 = _1974 || _1976;
    float _1980 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1982 = ~_1852;
    int _1984 = _1982 + _1946;
    int _1986 = _1984 + 1;
    float _1988 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1202);
    float _1990 = _1948;
    float _1992 = _1952;
    if (_1936)
    {
        _1990 = _131;
    }
    float _1994 = _1990;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    float _1998 = _1994;
    if (_1936)
    {
        _1926 = _169;
    }
    float _2000 = _1926;
    int _2002 = _1472 * _1986;
    int _2004 = _2002 + _1624;
    float _2006 = 0.0;
    float _2008 = _2000;
    if (_1936)
    {
        _2006 = _173;
    }
    float _2010 = _2006;
    float _2012 = floor(_1988);
    float _2014 = _2010;
    if (!_1936)
    {
        _1998 = _173;
    }
    float _2016 = _1998;
    if (!_1936)
    {
        _2008 = _131;
    }
    float _2018 = _2008;
    if (!_1936)
    {
        _2014 = _169;
    }
    float _2020 = _2014;
    float _2022 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2024 = _1574 ^ _1294;
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2028 = _1472 == 0;
    if (!_1658)
    {
        _1858 = _1880;
    }
    float _2030 = _1858;
    float _2032 = _2030;
    if (_1658)
    {
        float _2034 = -_1942;
        float _2036 = _1930 + _2034;
        _2032 = _2036;
    }
    float _2038 = _2032;
    uint _2040 = uint(int(uint(_2024) >> uint(31)));
    bool _2042 = !_2028;
    int _2044 = _2042 ? _2004 : (-1);
    float _2046 = _1996 * 0.15915493667125701904296875;
    int _2048 = ~_1868;
    int _2050 = _1786 + _2048;
    int _2052 = _2050 + 1;
    int _2054 = ~int(_2040);
    int _2056 = _2054 + 1;
    float _2058 = _2046 * 6.283185482025146484375;
    float _2060 = sin(_2058);
    bool _2062 = _1472 == 0;
    int _2064 = _2052 ^ _2056;
    int _2066 = _1624 ^ _1472;
    int _2068 = ~_1964;
    int _2070 = _1892 + _2068;
    int _2072 = _2070 + 1;
    float _2074 = _2046 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    int _2078 = ~_2056;
    int _2080 = _2078 + _2064;
    int _2082 = _2080 + 1;
    float _2084 = -_2012;
    float _2086 = _1988 + _2084;
    bool _2088 = _1294 == 0;
    float _2090 = _1988 * 6.283185482025146484375;
    float _2092 = _173 + _169;
    float _2094 = _2090 * 0.15915493667125701904296875;
    float _2096 = _2092 + (-1.0);
    uint _2098 = uint(int(uint(_2066) >> uint(31)));
    float _2100 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2102 = ~int(_2098);
    int _2104 = _2102 + 1;
    float _2106 = _169 * 2.0;
    float _2108 = _2076 * _2076;
    if (!_1874)
    {
        _1822 = _169;
    }
    float _2110 = _1822;
    float _2112 = _2094 * 6.283185482025146484375;
    float _2114 = cos(_2112);
    int _2116 = _2072 ^ _2104;
    float _2118 = fma(_2060, _2060, _2108);
    float _2120 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _2122 = 1.0 + _2120;
    float _2124 = _2110;
    if (!_1874)
    {
        _1860 = _2110;
    }
    float _2126 = _1860;
    float _2128 = fma(_179, 2.0, -1.0);
    int _2130 = ~_2104;
    int _2132 = _2130 + _2116;
    int _2134 = _2132 + 1;
    float _2136 = -(*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _2138 = 1.0 + _2136;
    float _2140 = rsqrt(_2118);
    float _2142 = _2126;
    if (!_1874)
    {
        _1824 = _173;
    }
    float _2144 = _1824;
    float _2146 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2148 = _2144;
    if (!_1874)
    {
        _1992 = _173;
    }
    float _2150 = _1992;
    bool _2152 = !_2062;
    int _2154 = _2152 ? _2134 : (-1);
    float _2156 = floor(_2106);
    float _2158 = _2150;
    if (_1874)
    {
        _2142 = _131;
    }
    float _2160 = _2142;
    if (_1874)
    {
        _2124 = _131;
    }
    float _2162 = _2124;
    if (_1874)
    {
        _2148 = _169;
    }
    float _2164 = _2148;
    if (_1874)
    {
        _2158 = _169;
    }
    float _2166 = _2158;
    float _2168 = _2060 * _2140;
    bool _2170 = !_2088;
    int _2172 = _2170 ? _2082 : (-1);
    float _2174 = _2076 * _2140;
    float _2176 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2180 = _2178 != 0;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2184 = _2182 != 0;
    int _2186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2188 = _2186 != 0;
    float _2190 = _2146 * _2122;
    int _2192 = _1360 ? 0 : 1;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2196 = _2156 >= 0.0;
    bool _2198 = isnan(_2156);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan(0.0);
    bool _2204 = _2200 || _2202;
    float _2206 = -_2190;
    float _2208 = _2146 + _2206;
    int _2210 = ~_2192;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    float _2216 = -_2194;
    float _2218 = fma(_2022, 2.0, _2216);
    int _2220 = _2214;
    if (!_1410)
    {
        int _2222 = ~_2192;
        int _2224 = _2222 + 1;
        _2220 = _2224;
    }
    int _2226 = _2220;
    float _2228 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _2230 = _2156 > 0.0;
    float _2232 = fma(_2208, _169, _2190);
    bool _2234 = _2086 < 0.5;
    float _2236 = float(_2234);
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2240 = fma(_2114, 0.5, 0.5);
    float _2242 = fma(_366, _1654, _2176);
    float _2244 = fma(_366, _1652, _2228);
    float _2246 = fma(_2162, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2238);
    float _2248 = -_2086;
    float _2250 = fma(_2248, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2252 = -_2236;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2256 = -_2240;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2260 = fma(_2242, _512, _1678);
    float _2262 = fma(_2244, _512, _1676);
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _2266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _2268 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2270 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2272 = _1364 * _1880;
    float _2274 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[89].z, _2264);
    float _2276 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2268);
    float _2278 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2270);
    float _2280 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[193].y, _822);
    float _2282 = precise::max(0.0, _2272);
    float _2284 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2286 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2278);
    float _2288 = _2280 * 0.15915493667125701904296875;
    float _2290 = precise::min(_2282, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2294 = _2038 + _2292;
    bool _2296 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2298 = isnan(_2038);
    bool _2300 = _2296 || _2298;
    bool _2302 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2304 = _2300 || _2302;
    float _2306 = float(_2304);
    float _2308 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2284);
    float _2310 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2276);
    float _2312 = _2290 * _2266;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2316 = _2038 + _2314;
    float _2318 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2320 = _2038 + _2318;
    float _2322 = _2288 * 6.283185482025146484375;
    float _2324 = sin(_2322);
    float _2326 = fma(_1484, _2294, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2328 = fma(_1548, _2316, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2330 = fma(_1718, _2320, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2332 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2334 = isnan(_2038);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    float _2344 = -_2306;
    float _2346 = _2344 + 1.0;
    float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2350 = _2038 + _2348;
    float _2352 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2308);
    float _2354 = abs(_2312);
    float _2356 = log2(_2354);
    float _2358 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2360 = _2038 + _2358;
    float _2362 = -_2342;
    float _2364 = _2362 + 1.0;
    float _2366 = _2342 * _2346;
    float _2368 = fma(_1492, _2350, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2370 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2372 = isnan(_2038);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2378 = _2374 || _2376;
    float _2380 = float(_2378);
    float _2382 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2384 = _2038 + _2382;
    float _2386 = fma(_1682, _2360, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2388 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    bool _2390 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2392 = isnan(_2038);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2398 = _2394 || _2396;
    float _2400 = float(_2398);
    float _2402 = fma(_1562, _2384, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2404 = -_2380;
    float _2406 = _2404 + 1.0;
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2410 = _2038 + _2408;
    bool _2412 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2414 = isnan(_2038);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = _2400 * _2364;
    float _2426 = -_2400;
    float _2428 = _2426 + 1.0;
    float _2430 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[192].w;
    bool _2432 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2434 = isnan(_2038);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2440 = _2436 || _2438;
    float _2442 = float(_2440);
    float _2444 = fma(_1738, _2410, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2446 = _2380 * _2428;
    float _2448 = -_2232;
    float _2450 = _2168 * _2448;
    float _2452 = -_2388;
    float _2454 = _2174 * _2452;
    float _2456 = exp2(_2430);
    float _2458 = _2442 * _2406;
    float _2460 = -_2442;
    float _2462 = _2460 + 1.0;
    float _2464 = fma(_1364, _2450, _2454);
    bool _2466 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2468 = isnan(_2038);
    bool _2470 = _2466 || _2468;
    bool _2472 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2474 = _2470 || _2472;
    float _2476 = float(_2474);
    float _2478 = -_2232;
    float _2480 = _2174 * _2478;
    float _2482 = _2422 * _2462;
    bool _2484 = _2038 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2486 = isnan(_2038);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = _1880 * _2464;
    float _2498 = -_2422;
    float _2500 = _2498 + 1.0;
    float _2502 = _2368 * _2482;
    float _2504 = _2168 * _2388;
    float _2506 = _2286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2508 = -_145;
    float _2510 = fma(_2508, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2218);
    float _2512 = fma(_2500, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2502);
    float _2514 = fma(_1364, _2480, _2504);
    float _2516 = _2456 * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2518 = -_2476;
    float _2520 = _2518 + 1.0;
    float _2522 = fma(_2326, _2458, _2512);
    float _2524 = _1880 * _2514;
    float _2526 = -_2168;
    float _2528 = fma(_2526, _2516, _2496);
    float _2530 = -_2494;
    float _2532 = _2530 + 1.0;
    float _2534 = fma(_2328, _2446, _2522);
    float _2536 = -_2174;
    float _2538 = fma(_2536, _2516, _2524);
    float _2540 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2528);
    float _2542 = _2476 * _2532;
    int _2544 = abs(_566);
    float _2546 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2538);
    float _2548 = in.m_58.x;
    float _2550 = fma(_2402, _2424, _2534);
    float _2552 = _2310 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2554 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[192].y, _2506);
    float _2556 = _2306 * _2520;
    float _2558 = fma(_2386, _2366, _2550);
    float _2560 = _2352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2562 = _2540 + _2552;
    int _2564 = abs(_1006);
    float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2568 = _2554 + _2566;
    float _2570 = float(_2544);
    float _2572 = fma(_2330, _2556, _2558);
    float _2574 = _2546 + _2560;
    float _2576 = _2568 * _2568;
    float _2578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2580 = _2562 + _2578;
    float _2582 = float(_2564);
    float _2584 = abs(_2250);
    float _2586 = _2570 * _2584;
    float _2588 = fma(_2444, _2542, _2572);
    float _2590 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[89].x, _2274);
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2594 = _2574 + _2592;
    float _2596 = fma(_2580, _2580, _2576);
    float _2598 = fma(_2582, _2258, _2586);
    float _2600 = -_1880;
    float _2602 = _2600 + 1.0;
    float _2604 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2588);
    float _2606 = fma(_2594, _2594, _2596);
    float _2608 = _2548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2610 = _2590 * (-0.15915493667125701904296875);
    float _2612 = float(_952);
    float _2614 = sqrt(_2606);
    bool _2616 = _2602 >= 0.001000000047497451305389404296875;
    bool _2618 = isnan(_2602);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan(0.001000000047497451305389404296875);
    bool _2624 = _2620 || _2622;
    float _2626 = float(_2624);
    float _2628 = _2608 * _2604;
    float _2630 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2632 = abs(_2254);
    float _2634 = fma(_2612, _2632, _2598);
    float _2636 = _2628 * _2626;
    float _2638 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2630);
    float _2640 = _2610 * 6.283185482025146484375;
    float _2642 = sin(_2640);
    float _2644 = _2634 * _2636;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2648 = _2160 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2650 = _2644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2654 = rsqrt(_2606);
    float _2656 = _2614 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2658 = _2650 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2660 = -_2646;
    float _2662 = fma(_2648, 2.0, _2660);
    float _2664 = fma(_2026, -2.0, _2652);
    float _2666 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2668 = precise::min(_2658, _2656);
    float _2670 = _2610 * 6.283185482025146484375;
    float _2672 = cos(_2670);
    float _2674 = _530 * _2642;
    float _2676 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2678 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2666);
    float _2680 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2664);
    float _2682 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2676);
    float _2684 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2678);
    float _2686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2688 = _2568 * _2654;
    float _2690 = _2580 * _2654;
    float _2692 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2682);
    float _2694 = -_2684;
    float _2696 = _2694 + 1.0;
    float _2698 = _2688 * _2668;
    float _2700 = -_2688;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2568);
    float _2704 = -_2690;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2580);
    float _2708 = _530 * _2672;
    float _2710 = -_2674;
    float _2712 = fma(_526, _2672, _2710);
    float _2714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2716 = _2690 * _2668;
    float _2718 = -_2698;
    float _2720 = _2568 + _2718;
    float _2722 = _2712 + 0.5;
    float _2724 = fma(_526, _2642, _2708);
    float _2726 = -_2716;
    float _2728 = _2580 + _2726;
    float _2730 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2732 = _2720 * _2720;
    float _2734 = _2702 * _2702;
    float _2736 = _2724 + (-0.5);
    float _2738 = fma(_2730, _2722, _2510);
    float _2740 = _2594 * _2654;
    float _2742 = fma(_2728, _2728, _2732);
    float _2744 = fma(_2706, _2706, _2734);
    float _2746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2748 = _2740 * _2668;
    float _2750 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2752 = -_2740;
    float _2754 = fma(_2752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2594);
    float _2756 = -_2692;
    float _2758 = _2756 + 1.0;
    float _2760 = -_2748;
    float _2762 = _2594 + _2760;
    float _2764 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2766 = -_2750;
    float _2768 = -_2680;
    float _2770 = fma(_2766, _2736, _2768);
    float _2772 = fma(_2754, _2754, _2744);
    float _2774 = fma(_2762, _2762, _2742);
    float _2776 = -_2758;
    float _2778 = fma(_2712, _2776, _2738);
    float _2780 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2782 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2784 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2764);
    float _2786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2788 = fma(_2782, -2.0, _2780);
    float _2790 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2784);
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2794 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2796 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2800 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2804 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2806 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2808 = _2794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2810 = _2796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2812 = _2798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2814 = _2800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2816 = _2804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2818 = float(_1884);
    float _2820 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_62.x = _2806;
    out.m_62.y = _2808;
    out.m_62.z = _2810;
    float _2822 = fma(_2724, _2696, _2770);
    bool _2824 = !_2180;
    int _2826 = _2824 ? 0 : 1;
    float _2828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_64.x = _2812;
    out.m_64.y = _2814;
    out.m_64.z = _2816;
    float _2830 = float(_2172);
    float _2832 = _2786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2834 = float(_2154);
    out.m_66.x = _2778;
    out.m_66.y = _2822;
    bool _2836 = _2790 >= 0.0;
    float _2838 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2840 = sqrt(_2772);
    float _2842 = _1956 + 0.5;
    float _2844 = -_1416;
    float _2846 = fma(_2832, _2830, _2844);
    float _2848 = _1028 + (-0.5);
    float _2850 = fma(_2820, _2818, _1342);
    float _2852 = _584 + (-0.5);
    float _2854 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2856 = log2(_2854);
    float _2858 = fma(_2820, _2842, _2850);
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2862 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2788);
    float _2864 = -_2832;
    float _2866 = fma(_2864, _2848, _2846);
    float _2868 = float(_2044);
    float _2870 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2860);
    float _2872 = -_2862;
    float _2874 = fma(_2838, _2834, _2872);
    float _2876 = sqrt(_2774);
    float _2878 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (_2836)
    {
        _2880 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2882 = _2880;
    float _2884 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2886 = -_145;
    float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2662);
    float _2890 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2878);
    float _2892 = -_2838;
    float _2894 = fma(_2892, _2852, _2874);
    float _2896 = _2654 * _2840;
    float _2898 = _145 * _2856;
    float _2900 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2890);
    float _2902 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2870);
    float _2904 = fma(_2884, _2868, _2888);
    float _2906 = _1916 + 0.5;
    float _2908 = -_2900;
    float _2910 = _2908 + 1.0;
    int _2912 = as_type<int>(_2900);
    if (_2836)
    {
        float _2914 = _2882 * 5.0;
        _2912 = as_type<int>(_2914);
    }
    int _2916 = _2912;
    float _2918 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2246);
    float _2920 = _2654 * _2876;
    float _2922 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2638);
    float _2924 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1228);
    float _2926 = -_2902;
    float _2928 = _2926 + 1.0;
    float _2930 = fma(_1028, _2910, _2866);
    float _2932 = fma(_2884, _2906, _2904);
    float _2934 = -_2918;
    float _2936 = _2934 + 1.0;
    float _2938 = -_2922;
    float _2940 = _2938 + 1.0;
    float _2942 = floor(_2924);
    float _2944 = _2920 * _2896;
    float _2946 = -_2928;
    float _2948 = fma(_1956, _2946, _2858);
    float _2950 = -_2936;
    float _2952 = fma(_1916, _2950, _2932);
    float _2954 = fma(_584, _2940, _2894);
    float _2956 = _2650 * _2944;
    out.m_68.w = _2668;
    float _2958 = exp2(_2898);
    bool _2960 = !_2184;
    int _2962 = _2960 ? 0 : 1;
    float _2964 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2966 = 1.0 + _2964;
    if (_2836)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9529 = as_type<float>(_2916);
        out.gl_Position.z = _9529;
    }
    bool _2968 = !_2188;
    int _2970 = _2968 ? 0 : 1;
    bool _2972 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    out.m_70.x = _2948;
    out.m_70.y = _2930;
    out.m_70.z = _2952;
    out.m_70.w = _2954;
    if (_2836)
    {
        out.m_47.x = 0.0;
    }
    out.m_72.x = _2956;
    if (_2836)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2974 = -_2688;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2554);
    float _2978 = -_2690;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2562);
    float _2982 = 1.0 / _2966;
    float _2984 = -_2958;
    float _2986 = _2984 + 1.0;
    float _2988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2990 = _2976 + _2988;
    float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2994 = _2980 + _2992;
    float _2996 = -_2942;
    float _2998 = _2924 + _2996;
    float _3000 = _2924 * 6.283185482025146484375;
    float _3002 = _2990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3004 = -_2740;
    float _3006 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2574);
    bool _3008 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3010 = isnan(0.0);
    bool _3012 = _3008 || _3010;
    bool _3014 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3016 = _3012 || _3014;
    float _3018 = _2954;
    float _3020 = _3000;
    if (_2972)
    {
        float _3022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _3018 = _3022;
    }
    float _3024 = _3018;
    float _3026 = fma(_2994, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3002);
    float _3028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3030 = _3006 + _3028;
    float _3032 = _3000 * 0.15915493667125701904296875;
    float _3034 = _3016 ? _2986 : 0.0;
    float _3036 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3026);
    int _3038 = _1978 ? 0 : 1;
    float _3040 = _3032 * 6.283185482025146484375;
    float _3042 = cos(_3040);
    float _3044 = _3034 * _2982;
    bool _3046 = _3036 >= 0.0;
    float _3048 = _2982;
    if (_2972)
    {
        float _3050 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _3048 = _3050;
    }
    float _3052 = _3048;
    float _3054 = _3052;
    if (_2972)
    {
        float _3056 = fma(_3052, (*spvDescriptorSet0.vp_c9)._m0[14].z, _1880);
        _3020 = _3056;
    }
    float _3058 = _3020;
    float _3060 = _2204 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3062 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3064 = (*spvDescriptorSet0.vp_c9)._m0[176].w + _3062;
    float _3066 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3068 = _3066 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[178].w + _3070;
    int _3074 = ~_3038;
    int _3076 = _3074 + 1;
    int _3078 = _3076 + 1;
    int _3080 = _3078;
    float _3082 = _3060;
    if (_2972)
    {
        float _3084 = _3058 * _3024;
        _3054 = _3084;
    }
    float _3086 = _3054;
    if (!_1966)
    {
        int _3088 = ~_3038;
        int _3090 = _3088 + 1;
        _3080 = _3090;
    }
    int _3092 = _3080;
    float _3094 = 1.0 / _3064;
    int _3096 = ~as_type<int>(_3060);
    int _3098 = _3096 + 1;
    int _3100 = _3098 + 1;
    float _3102 = fma(_3042, 0.5, 0.5);
    float _3104 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _3106 = _3100;
    if (!_2230)
    {
        int _3108 = ~as_type<int>(_3060);
        int _3110 = _3108 + 1;
        _3106 = _3110;
    }
    int _3112 = _3106;
    if (_3046)
    {
        out.m_47.x = 0.0;
    }
    if (_3046)
    {
        _3082 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3114 = _3082;
    float _3116 = 1.0 / _3068;
    float _3118 = -_2998;
    float _3120 = fma(_3118, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _3122 = _2998 < 0.5;
    float _3124 = float(_3122);
    float _3126 = -_3102;
    float _3128 = fma(_3126, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _3130 = as_type<int>(_3114);
    if (_3046)
    {
        float _3132 = _3114 * 5.0;
        _3130 = as_type<int>(_3132);
    }
    int _3134 = _3130;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3140 = -_3124;
    float _3142 = fma(_3140, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _3144 = 1.0 / _3072;
    float _3146 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (_3046)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9826 = as_type<float>(_3134);
        out.gl_Position.z = _9826;
    }
    float _3148 = _440 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _3150 = fma(_464, _1652, _3104);
    float _3152 = _2940;
    if (_2972)
    {
        float _3154 = floor(_3086);
        _3152 = _3154;
    }
    float _3156 = _3152;
    if (_3046)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3158 = -_2554;
    float _3160 = _3158 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3162 = -_2562;
    float _3164 = _3162 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3166 = fma(_464, _1654, _3146);
    float _3168 = -_2574;
    float _3170 = _3168 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3172 = _3160 * _3160;
    float _3174 = fma(_464, _1656, _3148);
    float _3176 = abs(_3120);
    float _3178 = _2570 * _3176;
    if (_2972)
    {
        float _3180 = -_3156;
        float _3182 = _3086 + _3180;
        _1886 = _3182;
    }
    float _3184 = _1886;
    float _3186 = fma(_3164, _3164, _3172);
    float _3188 = -_3166;
    float _3190 = _2242 + _3188;
    float _3192 = fma(_2582, _3128, _3178);
    float _3194 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3196 = _3184 + _3194;
    float _3198 = fma(_3170, _3170, _3186);
    float _3200 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3202 = _3184 + _3200;
    float _3204 = 1.0 / _3138;
    float _3206 = _3196 * _3144;
    float _3208 = -_3150;
    float _3210 = _2244 + _3208;
    float _3212 = _3190 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3214 = _3190 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3216 = _3202 * _3116;
    float _3218 = _3190 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3220 = fma(_3210, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3212);
    float _3222 = rsqrt(_3198);
    float _3224 = fma(_3210, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3214);
    float _3226 = fma(_3210, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3218);
    float _3228 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3230 = _3184 + _3228;
    float _3232 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3234 = _3184 + _3232;
    float _3236 = abs(_3142);
    float _3238 = fma(_2612, _3236, _3192);
    float _3240 = _3230 * _3094;
    float _3242 = _3234 * _3204;
    float _3244 = _131 + (-0.5);
    float _3246 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _3248 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3250 = _3164 * _3222;
    float _3252 = _3170 * _3222;
    float _3254 = -_3246;
    float _3256 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3254);
    float _3258 = -_3248;
    float _3260 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _3258);
    float _3262 = _3250 * _3250;
    float _3264 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3266 = (*spvDescriptorSet0.vp_c9)._m0[180].w + _3264;
    float _3268 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3270 = fma(_3252, _3252, _3262);
    float _3272 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _3274 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _3276 = -_3268;
    float _3278 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[1].y, _3276);
    float _3280 = 1.0 / _3266;
    float _3282 = -_3272;
    float _3284 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3282);
    float _3286 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3288 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _3290 = -_3274;
    float _3292 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _3290);
    float _3294 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3296 = -_3286;
    float _3298 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3296);
    float _3300 = _3160 * _3222;
    float _3302 = rsqrt(_3270);
    float _3304 = -_3288;
    float _3306 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3304);
    float _3308 = -_3294;
    float _3310 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3308);
    float _3312 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[1].w, _3278);
    float _3314 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3316 = _3314 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3318 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[1].w, _3310);
    float _3320 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3322 = (*spvDescriptorSet0.vp_c9)._m0[182].w + _3320;
    float _3324 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _3326 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _3328 = abs(_2962);
    float _3330 = _169 + (-0.5);
    float _3332 = float(_2226);
    float _3334 = _173 + (-0.5);
    float _3336 = float(_3328);
    float _3338 = _3252 * _3302;
    float _3340 = _3250 * _3302;
    float _3342 = 1.0 / _3316;
    float _3344 = -_3338;
    float _3346 = _3252 * _3344;
    float _3348 = _3300 * _3340;
    float _3350 = -_3338;
    float _3352 = _3300 * _3350;
    bool _3354 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3356 = isnan(1.0);
    bool _3358 = _3354 || _3356;
    bool _3360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3362 = _3358 || _3360;
    float _3364 = -_3346;
    float _3366 = fma(_3250, _3340, _3364);
    float _3368 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3370 = -_3326;
    float _3372 = fma(_3312, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3370);
    float _3374 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3376 = _3184 + _3374;
    float _3378 = _3366 * _3366;
    float _3380 = 1.0 / _3322;
    float _3382 = -_3368;
    float _3384 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3382);
    float _3386 = _3376 * _3280;
    float _3388 = fma(_3348, _3348, _3378);
    float _3390 = _3306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3392 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[1].w, _3384);
    float _3394 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3396 = _3184 + _3394;
    float _3398 = fma(_3352, _3352, _3388);
    float _3400 = -_3390;
    float _3402 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3400);
    float _3404 = fma(_3392, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3372);
    float _3406 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3408 = _3184 + _3406;
    float _3410 = rsqrt(_3398);
    float _3412 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3402);
    float _3414 = _3408 * _3342;
    float _3416 = _3284 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3418 = -_3412;
    float _3420 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3404);
    float _3422 = _3396 * _3380;
    float _3424 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3426 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3424;
    float _3428 = -(*spvDescriptorSet0.vp_c9)._m0[175].z;
    float _3430 = (*spvDescriptorSet0.vp_c9)._m0[176].z + _3428;
    float _3432 = 1.0 / _3420;
    float _3434 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3436 = _3434 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3438 = -_3324;
    float _3440 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3438);
    float _3442 = fma(_3426, _3240, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3444 = fma(_3430, _3240, (*spvDescriptorSet0.vp_c9)._m0[175].z);
    float _3446 = _3260 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _3448 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3440);
    float _3450 = _3366 * _3410;
    float _3452 = precise::clamp(_3450, 0.0, 1.0);
    float _3454 = -_3416;
    float _3456 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3454);
    float _3458 = -_3446;
    float _3460 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[0].y, _3458);
    float _3462 = -_3452;
    float _3464 = _3462 + 1.0;
    float _3466 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3456);
    float _3468 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[0].w, _3460);
    float _3470 = float(_3092);
    float _3472 = -(*spvDescriptorSet0.vp_c9)._m0[176].z;
    float _3474 = _3472 + (*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _3476 = fma(_3448, _3432, -1.0);
    float _3478 = _3464 * _3432;
    float _3480 = fma(_3436, _3216, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _3482 = fma(_3464, _3476, 1.0);
    float _3484 = _3468 * _3478;
    float _3486 = _3466 * _3478;
    float _3488 = _3482 * _3482;
    float _3490 = -(*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _3492 = (*spvDescriptorSet0.vp_c9)._m0[178].z + _3490;
    float _3494 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3496 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3494;
    float _3498 = fma(_3484, _3484, _3488);
    float _3500 = fma(_3474, _3216, (*spvDescriptorSet0.vp_c9)._m0[176].z);
    bool _3502 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3504 = isnan(_3184);
    bool _3506 = _3502 || _3504;
    bool _3508 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3510 = _3506 || _3508;
    float _3512 = float(_3510);
    float _3514 = fma(_3496, _3206, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3516 = fma(_3486, _3486, _3498);
    float _3518 = fma(_3492, _3206, (*spvDescriptorSet0.vp_c9)._m0[177].z);
    float _3520 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3522 = _3520 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[178].z;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[179].z;
    int _3528 = abs(_2826);
    float _3530 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3532 = _3530 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3534 = rsqrt(_3516);
    float _3536 = fma(_3522, _3242, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3538 = fma(_3526, _3242, (*spvDescriptorSet0.vp_c9)._m0[178].z);
    float _3540 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3542 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3540;
    float _3544 = -(*spvDescriptorSet0.vp_c9)._m0[180].z;
    float _3546 = _3544 + (*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _3548 = -(*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _3550 = (*spvDescriptorSet0.vp_c9)._m0[180].z + _3548;
    float _3552 = float(_3528);
    float _3554 = fma(_3532, _3414, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3556 = fma(_3542, _3386, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3558 = fma(_3546, _3414, (*spvDescriptorSet0.vp_c9)._m0[180].z);
    bool _3560 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3562 = isnan(_3184);
    bool _3564 = _3560 || _3562;
    bool _3566 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3568 = _3564 || _3566;
    float _3570 = float(_3568);
    float _3572 = _3552 * _3470;
    bool _3574 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3576 = isnan(_3184);
    bool _3578 = _3574 || _3576;
    bool _3580 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3582 = _3578 || _3580;
    float _3584 = float(_3582);
    float _3586 = fma(_3550, _3386, (*spvDescriptorSet0.vp_c9)._m0[179].z);
    float _3588 = _3336 * _3332;
    float _3590 = _3482 * _3534;
    float _3592 = _3484 * _3534;
    float _3594 = _3486 * _3534;
    bool _3596 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3598 = isnan(_3184);
    bool _3600 = _3596 || _3598;
    bool _3602 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3604 = _3600 || _3602;
    float _3606 = float(_3604);
    float _3608 = _3252 * _3590;
    float _3610 = -_3584;
    float _3612 = _3610 + 1.0;
    float _3614 = -_3594;
    float _3616 = _3250 * _3614;
    float _3618 = -_3570;
    float _3620 = _3618 + 1.0;
    float _3622 = -_3594;
    float _3624 = -_3608;
    float _3626 = fma(_3300, _3622, _3624);
    float _3628 = -_3592;
    float _3630 = _3300 * _3628;
    float _3632 = _3570 * _3612;
    float _3634 = -_3592;
    float _3636 = -_3616;
    float _3638 = fma(_3252, _3634, _3636);
    float _3640 = _3606 * _3620;
    bool _3642 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3644 = isnan(_3184);
    bool _3646 = _3642 || _3644;
    bool _3648 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3650 = _3646 || _3648;
    float _3652 = float(_3650);
    float _3654 = -_3606;
    float _3656 = _3654 + 1.0;
    float _3658 = _3638 * _3638;
    float _3660 = -_3630;
    float _3662 = fma(_3250, _3590, _3660);
    float _3664 = _3572 * (-2.0);
    float _3666 = _3652 * _3656;
    float _3668 = -_3652;
    float _3670 = _3668 + 1.0;
    float _3672 = fma(_3626, _3626, _3658);
    float _3674 = in.m_74.x;
    float _3676 = in.m_74.y;
    float _3678 = in.m_74.z;
    bool _3680 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3682 = isnan(_3184);
    bool _3684 = _3680 || _3682;
    bool _3686 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3688 = _3684 || _3686;
    float _3690 = float(_3688);
    float _3692 = -(*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _3694 = (*spvDescriptorSet0.vp_c9)._m0[182].z + _3692;
    float _3696 = fma(_3662, _3662, _3672);
    float _3698 = fma(_1968, _3664, _1968);
    float _3700 = _3690 * _3670;
    float _3702 = -_3690;
    float _3704 = _3702 + 1.0;
    bool _3706 = !_3362;
    float _3708 = _3706 ? _145 : _3044;
    float _3710 = rsqrt(_3696);
    float _3712 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3714 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3712;
    bool _3716 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3718 = isnan(_3184);
    bool _3720 = _3716 || _3718;
    bool _3722 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3724 = _3720 || _3722;
    float _3726 = float(_3724);
    float _3728 = _3512 * _3704;
    float _3730 = -_3512;
    float _3732 = _3730 + 1.0;
    float _3734 = fma(_3714, _3422, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3736 = fma(_3694, _3422, (*spvDescriptorSet0.vp_c9)._m0[181].z);
    bool _3738 = _3184 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3740 = isnan(_3184);
    bool _3742 = _3738 || _3740;
    bool _3744 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3746 = _3742 || _3744;
    float _3748 = float(_3746);
    float _3750 = _3726 * _3732;
    float _3752 = -_3726;
    float _3754 = _3752 + 1.0;
    float _3756 = float(_3112);
    float _3758 = _3748 * _3754;
    float _3760 = fma(_3664, _3674, _3674);
    float _3762 = _3626 * _3710;
    float _3764 = _3662 * _3710;
    float _3766 = _3442 * _3758;
    float _3768 = fma(_3244, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3760);
    float _3770 = _3638 * _3710;
    float _3772 = _3252 * _3762;
    float _3774 = _3300 * _3764;
    float _3776 = fma(_3708, _3698, _3768);
    float _3778 = _3250 * _3770;
    float _3780 = -_3772;
    float _3782 = fma(_3250, _3764, _3780);
    float _3784 = _3444 * _3758;
    float _3786 = _3776 * 0.15915493667125701904296875;
    float _3788 = -_3774;
    float _3790 = fma(_3252, _3770, _3788);
    float _3792 = -_3778;
    float _3794 = fma(_3300, _3762, _3792);
    int _3796 = abs(_2970);
    float _3798 = _3588 * (-2.0);
    float _3800 = _3782 * _3782;
    float _3802 = in.m_58.y;
    float _3804 = _3786 * 6.283185482025146484375;
    float _3806 = sin(_3804);
    float _3808 = fma(_3798, _3676, _3676);
    float _3810 = fma(_3790, _3790, _3800);
    float _3812 = float(_3796);
    float _3814 = fma(_2100, _3798, _2100);
    float _3816 = fma(_3330, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3808);
    float _3818 = fma(_3794, _3794, _3810);
    float _3820 = -_3748;
    float _3822 = _3820 + 1.0;
    float _3824 = _3812 * _3756;
    float _3826 = _3786 * 6.283185482025146484375;
    float _3828 = cos(_3826);
    float _3830 = fma(_3708, _3814, _3816);
    float _3832 = fma(_3822, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3766);
    float _3834 = fma(_3822, (*spvDescriptorSet0.vp_c9)._m0[175].z, _3784);
    float _3836 = _3830 * 0.15915493667125701904296875;
    float _3838 = fma(_3480, _3750, _3832);
    float _3840 = fma(_3500, _3750, _3834);
    float _3842 = rsqrt(_3818);
    float _3844 = _3824 * (-2.0);
    float _3846 = fma(_3514, _3728, _3838);
    float _3848 = fma(_3518, _3728, _3840);
    float _3850 = fma(_3844, _3678, _3678);
    float _3852 = fma(_1980, _3844, _1980);
    float _3854 = _3802 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _3856 = _3836 * 6.283185482025146484375;
    float _3858 = sin(_3856);
    float _3860 = fma(_3334, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3850);
    float _3862 = fma(_3536, _3700, _3846);
    float _3864 = _3854 * _2604;
    float _3866 = fma(_3538, _3700, _3848);
    float _3868 = fma(_3708, _3852, _3860);
    float _3870 = fma(_3556, _3666, _3862);
    float _3872 = _3864 * _2626;
    float _3874 = _3794 * _3842;
    float _3876 = _3790 * _3842;
    float _3878 = _3782 * _3842;
    float _3880 = _3868 * 0.15915493667125701904296875;
    float _3882 = _3250 * _3874;
    float _3884 = _3238 * _3872;
    float _3886 = _3252 * _3878;
    float _3888 = _3836 * 6.283185482025146484375;
    float _3890 = cos(_3888);
    float _3892 = -_3882;
    float _3894 = fma(_3252, _3876, _3892);
    float _3896 = _3300 * _3876;
    float _3898 = -_3886;
    float _3900 = fma(_3300, _3874, _3898);
    float _3902 = _3884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3904 = _3894 * _3894;
    float _3906 = -_3896;
    float _3908 = fma(_3250, _3878, _3906);
    float _3910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _300);
    float _3912 = _3880 * 6.283185482025146484375;
    float _3914 = cos(_3912);
    float _3916 = fma(_3900, _3900, _3904);
    float _3918 = _3902 * _2944;
    float _3920 = fma(_3586, _3666, _3866);
    float _3922 = _3806 * _3858;
    float _3924 = fma(_3908, _3908, _3916);
    float _3926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _296);
    float _3928 = _3918 * _3910;
    float _3930 = _3880 * 6.283185482025146484375;
    float _3932 = sin(_3930);
    float _3934 = _3828 * _3890;
    float _3936 = fma(_3554, _3640, _3870);
    float _3938 = fma(_3558, _3640, _3920);
    float _3940 = _2956 * _3926;
    float _3942 = _3806 * _3890;
    float _3944 = _3828 * _3858;
    float _3946 = fma(_3734, _3632, _3936);
    float _3948 = rsqrt(_3924);
    float _3950 = _3828 * _3914;
    float _3952 = _3806 * _3914;
    float _3954 = _3890 * _3914;
    float _3956 = fma(_3736, _3632, _3938);
    float _3958 = _3950 * _3928;
    float _3960 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3946);
    float _3962 = _300 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3964 = fma(_3932, _3934, _3922);
    float _3966 = -_3928;
    float _3968 = _3932 * _3966;
    float _3970 = -_3944;
    float _3972 = fma(_3932, _3942, _3970);
    float _3974 = _3952 * _3928;
    float _3976 = fma(_3964, _3940, _3958);
    float _3978 = fma(_3954, _3940, _3968);
    float _3980 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[182].z, _3956);
    float _3982 = fma(_3972, _3940, _3974);
    float _3984 = _3976 * _3874;
    float _3986 = _3908 * _3948;
    float _3988 = _3976 * _3876;
    float _3990 = _3900 * _3948;
    float _3992 = -_3942;
    float _3994 = fma(_3932, _3944, _3992);
    float _3996 = fma(_3978, _3986, _3984);
    float _3998 = _3894 * _3948;
    float _4000 = fma(_3978, _3990, _3988);
    float _4002 = _3960 + 1.0;
    float _4004 = fma(_3252, _3982, _3996);
    float _4006 = _3964 * _3876;
    float _4008 = fma(_3250, _3982, _4000);
    float _4010 = fma(_3932, _3922, _3934);
    float _4012 = _2574 + _4004;
    float _4014 = _3858 * _3914;
    float _4016 = _2562 + _4008;
    float _4018 = _2450 * _4002;
    float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4022 = _4012 + _4020;
    float _4024 = _3964 * _3878;
    float _4026 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4028 = _4016 + _4026;
    float _4030 = _3950 * _3876;
    float _4032 = _4022 * _4022;
    float _4034 = _3950 * _3878;
    float _4036 = _3964 * _3874;
    float _4038 = _3950 * _3874;
    float _4040 = fma(_4028, _4028, _4032);
    float _4042 = _3994 * _3874;
    float _4044 = fma(_3954, _3990, _4006);
    float _4046 = _3994 * _3878;
    float _4048 = sqrt(_4040);
    float _4050 = fma(_3962, _3962, 1.0);
    float _4052 = _3976 * _3878;
    float _4054 = _3994 * _3876;
    float _4056 = fma(_3954, _3998, _4024);
    float _4058 = fma(_3954, _3986, _4036);
    float _4060 = fma(_3978, _3998, _4052);
    float _4062 = -_3932;
    float _4064 = fma(_4062, _3998, _4034);
    float _4066 = rsqrt(_4050);
    float _4068 = fma(_4014, _3990, _4054);
    float _4070 = fma(_3300, _3982, _4060);
    float _4072 = fma(_4014, _3998, _4046);
    float _4074 = -_3932;
    float _4076 = fma(_4074, _3990, _4030);
    float _4078 = -_3932;
    float _4080 = fma(_4078, _3986, _4038);
    float _4082 = _2554 + _4070;
    float _4084 = fma(_4014, _3986, _4042);
    bool _4086 = _4048 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4088 = fma(_4010, _3250, _4068);
    float _4090 = fma(_4010, _3300, _4072);
    float _4092 = fma(_3952, _3250, _4076);
    float _4094 = fma(_3952, _3300, _4064);
    float _4096 = fma(_3952, _3252, _4080);
    float _4098 = fma(_4010, _3252, _4084);
    float _4100 = _4070;
    float _4102 = _4016;
    float _4104 = _4012;
    if (!_4086)
    {
        _4100 = _4082;
    }
    float _4106 = _4100;
    bool _4108 = !_4086;
    float _4110 = _4106;
    if (!_4108)
    {
        float _4112 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4114 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4116 = _4048 + _4114;
        float _4118 = _4082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4120 = rsqrt(_4040);
        float _4122 = _4116 * _4112;
        float _4124 = _4122 * 0.15915493667125701904296875;
        float _4126 = _4124 * 6.283185482025146484375;
        float _4128 = cos(_4126);
        float _4130 = _4124 * 6.283185482025146484375;
        float _4132 = sin(_4130);
        float _4134 = _4128 + (-1.0);
        float _4136 = _4134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4138 = fma(_4132, _4118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4140 = fma(_4082, _4128, _4136);
        float _4142 = _4120 * _4138;
        float _4144 = fma(_4028, _4142, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4146 = fma(_4022, _4142, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4110 = _4140;
        _4102 = _4144;
        _4104 = _4146;
    }
    float _4148 = _4110;
    float _4150 = _4102;
    float _4152 = _4104;
    float _4154 = -_2554;
    float _4156 = _4154 + _4148;
    float _4158 = fma(_3972, _3250, _4044);
    float _4160 = fma(_3972, _3300, _4056);
    float _4162 = fma(_3972, _3252, _4058);
    float _4164 = -_2562;
    float _4166 = _4164 + _4150;
    float _4168 = _4156 * _4156;
    float _4170 = -_2574;
    float _4172 = _4170 + _4152;
    float _4174 = _296 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4176 = _3962 * _4066;
    float _4178 = fma(_4166, _4166, _4168);
    float _4180 = _3962 * _4092;
    float _4182 = _3962 * _4094;
    float _4184 = _3962 * _4096;
    float _4186 = fma(_4172, _4172, _4178);
    float _4188 = -_4088;
    float _4190 = _4176 * _4188;
    float _4192 = -_4090;
    float _4194 = _4176 * _4192;
    float _4196 = -_4098;
    float _4198 = _4176 * _4196;
    float _4200 = sqrt(_4186);
    float _4202 = fma(_4174, _4158, _4180);
    float _4204 = fma(_4174, _4160, _4182);
    float _4206 = fma(_4174, _4162, _4184);
    float _4208 = fma(_4066, _4092, _4190);
    float _4210 = fma(_4066, _4094, _4194);
    float _4212 = fma(_4066, _4096, _4198);
    float _4214 = _4088 + _4202;
    float _4216 = _4090 + _4204;
    float _4218 = _4098 + _4206;
    float _4220 = _3980 + 1.0;
    out.m_76.x = _4208;
    out.m_76.y = _4210;
    out.m_76.z = _4212;
    float _4222 = -_3174;
    float _4224 = _1724 + _4222;
    float _4226 = _2480 * _4220;
    out.m_78.x = _4214;
    out.m_78.y = _4216;
    out.m_78.z = _4218;
    bool _4228 = _4200 > 0.0;
    float _4230 = fma(_4224, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3220);
    float _4232 = fma(_4224, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3226);
    out.m_80.x = _4158;
    out.m_80.y = _4160;
    out.m_80.z = _4162;
    float _4234 = -_2716;
    float _4236 = _2562 + _4234;
    float _4238 = fma(_4224, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3224);
    float _4240 = fma(_4018, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4230);
    float _4242 = -_2716;
    float _4244 = _4242 + _4150;
    float _4246 = -_2698;
    float _4248 = _4246 + _4148;
    float _4250 = -_2748;
    float _4252 = _4250 + _4152;
    float _4254 = -_2698;
    float _4256 = _2554 + _4254;
    float _4258 = -_2748;
    float _4260 = _2574 + _4258;
    float _4262 = fma(_4226, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4232);
    bool _4264 = !_4228;
    float _4266 = _4162;
    float _4268 = _4160;
    float _4270 = _4212;
    float _4272 = _4210;
    float _4274 = _4262;
    float _4276 = _4262;
    float _4278 = _4248;
    float _4280 = _4244;
    float _4282 = _4252;
    float _4284 = _4212;
    float _4286 = _4210;
    if (!_4264)
    {
        bool _4288 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4290 = _4208;
        if (_4288)
        {
            float _4292 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4290 = _4292;
        }
        float _4294 = _4290;
        if (_4288)
        {
            _4266 = _4240;
        }
        float _4296 = _4266;
        float _4298 = _4296;
        if (_4288)
        {
            _4268 = _4238;
        }
        float _4300 = _4268;
        float _4302 = _4294;
        float _4304 = _4300;
        if (_4288)
        {
            float _4306 = _4240 * _4294;
            _4270 = _4306;
        }
        float _4308 = _4270;
        float _4310 = _4308;
        if (_4288)
        {
            float _4312 = _4238 * _4294;
            _4272 = _4312;
        }
        float _4314 = _4272;
        float _4316 = _4314;
        if (_4288)
        {
            float _4318 = _4262 * _4294;
            _4302 = _4318;
        }
        float _4320 = _4302;
        float _4322 = _4320;
        if (!_4288)
        {
            bool _4324 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4326 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4328 = _4324 || _4326;
            bool _4330 = isnan(1.0);
            bool _4332 = _4328 || _4330;
            float _4334 = _145 + 1.0;
            float _4336 = _4334;
            if (!_4332)
            {
                float _4338 = _4334 * _4334;
                float _4340 = _4338 * 0.5;
                _4274 = _4340;
            }
            float _4342 = _4274;
            float _4344 = _4342;
            if (!_4332)
            {
                float _4346 = _4342 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4344 = _4346;
            }
            float _4348 = _4344;
            bool _4350 = !_4332;
            float _4352 = _4348;
            if (!_4350)
            {
                float _4354 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4356 = log2(_4354);
                float _4358 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4360 = _4358 + 1.0;
                float _4362 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4364 = _4356 * _4334;
                float _4366 = 1.0 / _4360;
                float _4368 = _4362 * 0.693147182464599609375;
                float _4370 = exp2(_4364);
                float _4372 = 1.0 / _4368;
                float _4374 = _4370 + (-1.0);
                float _4376 = -_4374;
                float _4378 = fma(_4376, _4372, _4334);
                float _4380 = _4378 * _4366;
                float _4382 = _4380 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4352 = _4382;
            }
            float _4384 = _4352;
            float _4386 = _4384 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4388 = _4384 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4390 = !_4332;
            if (!_4390)
            {
                float _4392 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4394 = log2(_4392);
                float _4396 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4398 = _4396 + 1.0;
                float _4400 = 1.0 / _4398;
                float _4402 = _4394 * _4334;
                float _4404 = exp2(_4402);
                float _4406 = -_4404;
                float _4408 = _4406 + 1.0;
                float _4410 = _4408 * _4400;
                _4336 = _4410;
            }
            float _4412 = _4336;
            float _4414 = fma(_4412, _1654, _4388);
            float _4416 = _4384 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4418 = fma(_4412, _1652, _4386);
            float _4420 = -_3166;
            float _4422 = _4420 + _4414;
            float _4424 = fma(_4412, _1656, _4416);
            float _4426 = -_3150;
            float _4428 = _4426 + _4418;
            float _4430 = _4422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4432 = _4422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4434 = _4422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4436 = -_3174;
            float _4438 = _4436 + _4424;
            float _4440 = fma(_4428, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4430);
            float _4442 = fma(_4428, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4432);
            float _4444 = fma(_4428, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4434);
            float _4446 = fma(_4438, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4440);
            float _4448 = fma(_4438, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4442);
            float _4450 = fma(_4438, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4444);
            _4304 = _4448;
            _4298 = _4446;
            _4276 = _4450;
            _4310 = _4446;
            _4316 = _4448;
            _4322 = _4450;
        }
        float _4452 = _4304;
        float _4454 = _4298;
        float _4456 = _4276;
        float _4458 = _4310;
        float _4460 = _4316;
        float _4462 = _4322;
        float _4464 = _4452 * _4452;
        float _4466 = rsqrt(_4186);
        float _4468 = fma(_4454, _4454, _4464);
        float _4470 = fma(_4456, _4456, _4468);
        float _4472 = sqrt(_4470);
        float _4474 = _4166 * _4466;
        float _4476 = _4156 * _4466;
        float _4478 = _4172 * _4466;
        bool _4480 = _4472 > 0.0;
        bool _4482 = !_4480;
        _4284 = _4458;
        _4286 = _4460;
        if (!_4482)
        {
            float _4484 = rsqrt(_4470);
            float _4486 = _4484 * _4452;
            float _4488 = _4484 * _4454;
            float _4490 = _4484 * _4456;
            float _4492 = _4476 * _4486;
            float _4494 = fma(_4474, _4488, _4492);
            float _4496 = fma(_4478, _4490, _4494);
            float _4498 = _4496 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4500 = fma(_4458, _4498, _4244);
            float _4502 = fma(_4460, _4498, _4248);
            float _4504 = fma(_4462, _4498, _4252);
            _4278 = _4502;
            _4280 = _4500;
            _4282 = _4504;
        }
    }
    float _4506 = _4278;
    float _4508 = _4280;
    float _4510 = _4282;
    float _4512 = _4284;
    float _4514 = _4286;
    float _4516 = -_2688;
    float _4518 = fma(_4516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4506);
    float _4520 = -_2690;
    float _4522 = fma(_4520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4508);
    float _4524 = -_2740;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4510);
    float _4528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4530 = _4518 + _4528;
    float _4532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4534 = _4522 + _4532;
    float _4536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4538 = _4526 + _4536;
    float _4540 = _4530 * _4530;
    float _4542 = fma(_4534, _4534, _4540);
    float _4544 = fma(_4538, _4538, _4542);
    float _4546 = rsqrt(_4544);
    float _4548 = _4546 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4550 = _4534 * _4548;
    float _4552 = _4538 * _4548;
    float _4554 = _4550 * _4550;
    float _4556 = _4552 * _4552;
    float _4558 = _4554 + _4556;
    float _4560 = sqrt(_4558);
    bool _4562 = _4560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4566 = _4560 + _4564;
    float _4568 = _4512;
    float _4570 = _4558;
    float _4572 = _4566;
    float _4574 = _4514;
    float _4576 = _4530;
    float _4578 = _4548;
    float _4580 = _4550;
    if (_4562)
    {
        float _4582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4568 = _4582;
    }
    float _4584 = _4568;
    if (_4562)
    {
        float _4586 = rsqrt(_4558);
        _4570 = _4586;
    }
    float _4588 = _4570;
    float _4590 = _4584;
    float _4592 = _4588;
    if (_4562)
    {
        float _4594 = _4566 * _4584;
        _4572 = _4594;
    }
    float _4596 = _4572;
    if (_4562)
    {
        float _4598 = _4596 * 0.15915493667125701904296875;
        _4574 = _4598;
    }
    float _4600 = _4574;
    float _4602 = _4538;
    if (_4562)
    {
        float _4604 = _4600 * 6.283185482025146484375;
        float _4606 = sin(_4604);
        _4602 = _4606;
    }
    float _4608 = _4602;
    float _4610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4612 = precise::max(0.0, _4610);
    float _4614 = _3150;
    if (_4562)
    {
        float _4616 = _4600 * 6.283185482025146484375;
        float _4618 = cos(_4616);
        _4614 = _4618;
    }
    float _4620 = _4614;
    float _4622 = -_4548;
    float _4624 = -_4612;
    float _4626 = fma(_4530, _4622, _4624);
    if (_4562)
    {
        float _4628 = _4626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4576 = _4628;
    }
    float _4630 = _4576;
    float _4632 = sqrt(_4544);
    float _4634 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4636 = _4608;
    float _4638 = _4630;
    if (_4562)
    {
        float _4640 = fma(_4608, _4630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4636 = _4640;
    }
    float _4642 = _4636;
    float _4644 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4634);
    float _4646 = _4642;
    float _4648 = _4620;
    if (_4562)
    {
        float _4650 = _4620 + (-1.0);
        _4638 = _4650;
    }
    float _4652 = _4638;
    float _4654 = _4652;
    if (_4562)
    {
        float _4656 = _4588 * _4642;
        _4578 = _4656;
    }
    float _4658 = _4578;
    if (!_4562)
    {
        _4646 = _4626;
    }
    float _4660 = _4646;
    float _4662 = _4660;
    if (_4562)
    {
        float _4664 = _4652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4590 = _4664;
    }
    float _4666 = _4590;
    if (_4562)
    {
        float _4668 = _4550 * _4658;
        _4580 = _4668;
    }
    float _4670 = _4580;
    if (!_4562)
    {
        _4654 = _4552;
    }
    float _4672 = _4654;
    float _4674 = _4672;
    if (_4562)
    {
        float _4676 = _4552 * _4658;
        _4674 = _4676;
    }
    float _4678 = _4674;
    if (!_4562)
    {
        _4592 = _4554;
    }
    float _4680 = _4592;
    float _4682 = _4680;
    if (_4562)
    {
        float _4684 = fma(_4626, _4620, _4666);
        _4662 = _4684;
    }
    float _4686 = _4662;
    if (_4562)
    {
        float _4688 = _4670 * _4670;
        _4682 = _4688;
    }
    float _4690 = _4682;
    if (!_4562)
    {
        _4648 = _4556;
    }
    float _4692 = _4648;
    float _4694 = _4692;
    if (_4562)
    {
        float _4696 = _4678 * _4678;
        _4694 = _4696;
    }
    float _4698 = _4694;
    float _4700 = fma(_4686, _4686, _4690);
    float _4702 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4704 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4706 = _4700 + _4698;
    float _4708 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4710 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4644);
    float _4712 = _4518 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4714 = rsqrt(_4706);
    float _4716 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4708);
    float _4718 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4720 = fma(_4632, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4718);
    float _4722 = precise::clamp(_4720, 0.0, 1.0);
    float _4724 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4712);
    float _4726 = _4710 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4728 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4716);
    float _4730 = -_4722;
    float _4732 = _4730 + 1.0;
    float _4734 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4724);
    float _4736 = fma(_4522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4704);
    float _4738 = _4728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4740 = abs(_4732);
    float _4742 = log2(_4740);
    float _4744 = _4734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4746 = _4726 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4748 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4750 = fma(_4526, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4736);
    float _4752 = _4714 * _4670;
    float _4754 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4748);
    float _4756 = _4714 * _4678;
    float _4758 = _4714 * _4686;
    float _4760 = _4752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4762 = -_4746;
    float _4764 = fma(_4762, _4702, 1.0);
    float _4766 = _4750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4768 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4754);
    float _4770 = -_4760;
    float _4772 = fma(_4758, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4770);
    float _4774 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4776 = _4742 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4778 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4768);
    float _4780 = -_4756;
    float _4782 = fma(_4780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4772);
    float _4784 = log2(_4764);
    float _4786 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4788 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4774);
    float _4790 = fma(_4782, -0.5, 0.5);
    float _4792 = fma(_4782, 0.5, 0.5);
    float _4794 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4786);
    float _4796 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4788);
    float _4798 = _4758 + 1.0;
    float _4800 = 1.0 / _4778;
    float _4802 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4794);
    float _4804 = fma(_4792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4806 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4796);
    float _4808 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4802);
    float _4810 = fma(_4792, _4804, -0.212114393711090087890625);
    float _4812 = exp2(_4776);
    float _4814 = _4784 * 0.693147182464599609375;
    float _4816 = fma(_4792, _4810, 1.570728778839111328125);
    float _4818 = _4814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4820 = sqrt(_4790);
    float _4822 = _4808 * _4800;
    float _4824 = _4806 * _4800;
    float _4826 = fma(_4822, 0.5, 0.5);
    float _4828 = fma(_4824, -0.5, 0.5);
    float _4830 = -_4758;
    float _4832 = fma(_4812, _4798, _4830);
    float3 _12530 = float3(_4826, _4828, _4818);
    float _4834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12530, float3(0.0), isnan(_12530)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12530, float3(0.0), isnan(_12530)), level(0.0)).x;
    float _4836 = fma(_4832, 0.5, 0.5);
    float _4838 = _4820 * 0.636619746685028076171875;
    float _4840 = -_4816;
    float _4842 = fma(_4838, _4840, 1.0);
    float3 _12551 = float3(_4826, _4828, _4818);
    float4 _4845 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12551, float3(0.0), isnan(_12551)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12551, float3(0.0), isnan(_12551)), level(0.0)).xyzw;
    float _4847 = _4845.x;
    float _4849 = _4845.y;
    float _4851 = _4845.z;
    float _4853 = _4845.w;
    float2 _12568 = float2(_4842, _4836);
    float3 _4857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12568, float2(0.0), isnan(_12568)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12568, float2(0.0), isnan(_12568)), level(0.0)).xyz;
    float _4859 = _4857.x;
    float _4861 = _4857.y;
    float _4863 = _4857.z;
    float _4865 = -_2688;
    float _4867 = fma(_4865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4256);
    float _4869 = -_2690;
    float _4871 = fma(_4869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4236);
    float _4873 = -_2740;
    float _4875 = fma(_4873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4260);
    float _4877 = _4742 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4879 = _4867 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4881 = _4808 + _4778;
    out.m_82.x = _4522;
    out.m_82.y = _4518;
    out.m_82.z = _4526;
    bool _4883 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4885 = isnan(_4632);
    bool _4887 = _4883 || _4885;
    bool _4889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4891 = _4887 || _4889;
    float _4893 = fma(_4871, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4879);
    float _4895 = exp2(_4877);
    out.m_84.x = _4871;
    out.m_84.y = _4867;
    out.m_84.z = _4875;
    float _4897 = fma(_4875, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4893);
    float _4899 = _4867 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4901 = _4897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4903 = fma(_4871, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4899);
    float _4905 = 1.0 / _4901;
    bool _4907 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4909 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4911 = _4907 || _4909;
    bool _4913 = isnan(0.5);
    bool _4915 = _4911 || _4913;
    float _4917 = fma(_4875, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4903);
    float _4919 = _4738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4921 = _4778 * 0.5;
    float _4923 = -_4895;
    float _4925 = _4923 + 1.0;
    float _4927 = _4917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4929 = fma(_4744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4919);
    float _4931 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4933 = _4927 + _4901;
    float _4935 = fma(_4726, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4929);
    float _4937 = fma(_4806, -0.5, _4921);
    float _4939 = _4929;
    float _4941 = _4921;
    float _4943 = _4778;
    float _4945 = _4806;
    float _4947 = _4808;
    if (!_4915)
    {
        _4939 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4949 = _4939;
    float _4951 = fma(_4766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4935);
    float _4953 = _4933 * _4905;
    float _4955 = _4953 * 0.5;
    float _4957 = _4949;
    float _4959 = _4951;
    if (!_4915)
    {
        _4941 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4961 = _4941;
    float _4963 = _4951 + _4778;
    if (!_4915)
    {
        float _4965 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4967 = fma(_4955, _4949, _4965);
        _4957 = _4967;
    }
    float _4969 = _4957;
    float _4971 = _4881 * 0.5;
    float _4973 = _4963 * 0.5;
    float _4975 = _4881;
    if (!_4915)
    {
        float _4977 = 1.0 / _4969;
        _4975 = _4977;
    }
    float _4979 = _4975;
    out.gl_Position.x = _4808;
    out.gl_Position.y = _4806;
    out.gl_Position.z = _4951;
    out.gl_Position.w = _4778;
    out.m_86.x = _4971;
    out.m_86.y = _4937;
    out.m_86.z = _4973;
    out.m_86.w = _4778;
    if (_4915)
    {
        _4943 = 1.0;
    }
    float _4981 = _4943;
    float _4983 = _4979;
    float _4985 = _4981;
    if (!_4915)
    {
        float _4987 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4989 = -_4961;
        float _4991 = fma(_4979, _4987, _4989);
        _4983 = _4991;
    }
    float _4993 = _4983;
    if (!_4891)
    {
        _4959 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4995 = _4959;
    float _4997 = _4995;
    float _4999 = _4995;
    if (!_4891)
    {
        _4945 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5001 = _4945;
    float _5003 = _5001;
    float _5005 = _5001;
    if (!_4891)
    {
        _4947 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5007 = _4947;
    float _5009 = _4931 * _4834;
    float _5011 = -_4931;
    float _5013 = _5011 + 1.0;
    float _5015 = _4853 * _5009;
    float _5017 = _4853 * _5013;
    float _5019 = _4863 * _5009;
    float _5021 = fma(_4859, _5015, _4847);
    float _5023 = _4847;
    float _5025 = _5007;
    float _5027 = _5007;
    if (!_4915)
    {
        float _5029 = -_4961;
        float _5031 = _5029 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _5023 = _5031;
    }
    float _5033 = _5023;
    float _5035 = fma(_4861, _5015, _4849);
    float _5037 = fma(_4853, _5019, _4851);
    float _5039 = _5033;
    if (!_4915)
    {
        float _5041 = 1.0 / _5033;
        _5039 = _5041;
    }
    float _5043 = _5039;
    out.m_88.x = _5021;
    out.m_88.y = _5035;
    out.m_88.z = _5037;
    out.m_88.w = _5017;
    if (!_4915)
    {
        float _5045 = _4993 * _5043;
        float _5047 = precise::clamp(_5045, 0.0, 1.0);
        _4985 = _5047;
    }
    float _5049 = _4985;
    float _5051 = _5049 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _5053 = !_4891;
    if (!_5053)
    {
        bool _5055 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5057 = isnan(_4632);
        bool _5059 = _5055 || _5057;
        bool _5061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5063 = _5059 || _5061;
        if (!_5063)
        {
            float _5065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5067 = _4632 + _5065;
            float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5069;
            float _5073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5075 = _5073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5077 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5079 = _5077 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5081 = 1.0 / _5071;
            float _5083 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5085 = _5083 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5087 = _5067 * _5081;
            float _5089 = precise::clamp(_5087, 0.0, 1.0);
            float _5091 = fma(_5089, _5075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5093 = fma(_5089, _5079, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5095 = fma(_5089, _5085, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5005 = _5093;
            _4999 = _5091;
            _5027 = _5095;
            _5097 = true;
        }
        else
        {
            bool _5099 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5101 = isnan(_4632);
            bool _5103 = _5099 || _5101;
            bool _5105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5107 = _5103 || _5105;
            if (!_5107)
            {
                _4997 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5109 = _4997;
            _4999 = _5109;
            if (!_5107)
            {
                _5003 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5111 = _5003;
            _5005 = _5111;
            if (!_5107)
            {
                _5025 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5113 = _5025;
            bool _5115 = !_5107;
            _5027 = _5113;
            if (!_5115)
            {
                bool _5117 = _4632 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5119 = isnan(_4632);
                bool _5121 = _5117 || _5119;
                bool _5123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5125 = _5121 || _5123;
                if (!_5125)
                {
                    float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5129 = _4632 + _5127;
                    float _5131 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5133 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5131;
                    float _5135 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5137 = _5135 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5139 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5141 = _5139 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5143 = 1.0 / _5133;
                    float _5145 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5147 = _5145 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5149 = _5129 * _5143;
                    float _5151 = precise::clamp(_5149, 0.0, 1.0);
                    float _5153 = fma(_5151, _5137, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5155 = fma(_5151, _5141, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5157 = fma(_5151, _5147, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5005 = _5155;
                    _4999 = _5153;
                    _5027 = _5157;
                    _5097 = true;
                }
                else
                {
                    _5005 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4999 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5027 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5097 = false;
    float _5159 = _5005;
    float _5161 = _4999;
    float _5163 = _5027;
    float _5165 = _5051 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _5167 = _5159 * 0.586610972881317138671875;
    bool _5169 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5165;
    float _5171 = fma(_5161, 0.298911988735198974609375, _5167);
    bool _5173 = _5049 > 0.0;
    bool _5175 = isnan(_5049);
    bool _5177 = _5173 || _5175;
    bool _5179 = isnan(0.0);
    bool _5181 = _5177 || _5179;
    float _5183 = fma(_5163, 0.114477999508380889892578125, _5171);
    float _5185 = -_5183;
    float _5187 = _5185 + _5161;
    float _5189 = -_5183;
    float _5191 = _5189 + _5159;
    float _5193 = -_5183;
    float _5195 = _5193 + _5163;
    float _5197 = fma(_5187, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5183);
    float _5199 = fma(_5191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5183);
    float _5201 = fma(_5195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5183);
    bool _5203 = !_5169;
    if (!_5203)
    {
        float _5205 = -_4518;
        float _5207 = _5205 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5209 = -_4522;
        float _5211 = _5209 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5213 = -_4526;
        float _5215 = _5213 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5217 = _5207 * _5207;
        float _5219 = fma(_5211, _5211, _5217);
        float _5221 = fma(_5215, _5215, _5219);
        float _5223 = sqrt(_5221);
        float _5225 = rsqrt(_5221);
        float _5227 = -_5223;
        float _5229 = _5227 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5231 = _5229 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5233 = precise::clamp(_5231, 0.0, 1.0);
        float _5235 = _5211 * _5225;
        float _5237 = _5207 * _5225;
        float _5239 = abs(_5233);
        float _5241 = log2(_5239);
        float _5243 = _5215 * _5225;
        float _5245 = _5235 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5247 = _4216 * _5237;
        float _5249 = -_5237;
        float _5251 = -_5245;
        float _5253 = fma(_5249, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5251);
        float _5255 = fma(_4214, _5235, _5247);
        float _5257 = -_5243;
        float _5259 = fma(_5257, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5253);
        float _5261 = fma(_4218, _5243, _5255);
        float _5263 = precise::clamp(_5261, 0.0, 1.0);
        float _5265 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5267 = _5259 + _5265;
        float _5269 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5271 = _5267 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5273 = precise::clamp(_5271, 0.0, 1.0);
        float _5275 = exp2(_5269);
        float _5277 = _5275 * _5273;
        float _5279 = _5263 * _5277;
        float _5281 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5283 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5285 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _5281;
        out.m_90.y = _5283;
        out.m_90.z = _5285;
    }
    out.m_68.x = _5197;
    out.m_68.y = _5199;
    out.m_68.z = _5201;
    if (_5181)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _5287 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5287;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

