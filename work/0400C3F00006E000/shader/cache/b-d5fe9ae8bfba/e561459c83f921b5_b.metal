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
    float4 m_59 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_53 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1595 = false;
    bool _416 = false;
    bool _176 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2155 = as_type<float>(_114);
        out.gl_Position.z = _2155;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2225 = as_type<float>(_152);
        out.gl_Position.z = _2225;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _156 = !_154;
    float _174;
    if (!_156)
    {
        float _158 = in.m_51.x;
        float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _164 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _166 = _164 * _160;
        float _168 = floor(_166);
        float _170 = -_168;
        float _172 = _166 + _170;
        _174 = _172;
        _176 = true;
    }
    else
    {
        float _178 = float(_98);
        float _180 = 1.0 / _178;
        float _182 = _132 * _180;
        _174 = _182;
    }
    _176 = false;
    float _184 = _174;
    float _186 = in.m_51.x;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = _184 + _188;
    bool _192 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _194 = isnan(_184);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _184 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _184 + _220;
    float _224 = 1.0 / _206;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _218;
    float _230 = 1.0 / _214;
    float _232 = _190 * _224;
    bool _234 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_184);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_202;
    float _248 = _246 + 1.0;
    float _250 = _244 * _248;
    float _252 = _210 * _228;
    bool _254 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _256 = isnan(_184);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -_244;
    float _268 = _266 + 1.0;
    bool _270 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _272 = isnan(_184);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _290 = -_264;
    float _292 = _290 + 1.0;
    float _294 = _264 * _268;
    float _296 = _222 * _230;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = _280 * _292;
    float _312 = fma(_300, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _316 = fma(_304, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _318 = fma(_284, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = -_280;
    float _322 = _320 + 1.0;
    float _324 = _312 * _310;
    float _326 = _314 * _186;
    float _328 = _316 * _310;
    float _330 = _318 * _310;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _336 = fma(_288, _252, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].x, _324);
    float _340 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].y, _328);
    float _342 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _344 = trunc(_326);
    int _346 = int(_344);
    float _348 = fma(_336, _294, _338);
    float _350 = fma(_308, _252, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _356;
    float _360 = fma(_334, _252, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _362;
    float _366 = fma(_350, _294, _340);
    float _368 = fma(_354, _232, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _370 = fma(_358, _232, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _372 = fma(_364, _232, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _374 = fma(_360, _294, _342);
    float _376 = fma(_368, _250, _348);
    float _378 = fma(_370, _250, _366);
    float _380 = fma(_372, _250, _374);
    float _382 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[146].x, _376);
    float _384 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[146].y, _378);
    float _386 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[146].z, _380);
    int _388 = _346 << 4;
    int _390 = _388 + 1712;
    bool _392 = !_226;
    int _394 = as_type<int>(_366);
    float _396 = _252;
    int _398 = _346;
    float _414;
    if (!_392)
    {
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _186 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_98);
        float _420 = 1.0 / _418;
        float _422 = _132 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_53.x;
    float _428 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _430 = log2(_428);
    float _432 = in.m_51.z;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _436 = _434 != 0;
    float _438 = _186 * 2.0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _442 = _440 != 0;
    float _444 = in.m_51.w;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _448 = _446 != 0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _456 = _454 != 0;
    float _458 = in.m_53.y;
    float _460 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _462 = 1.0 / _452;
    float _464 = in.m_51.y;
    bool _466 = false;
    if (_436)
    {
        bool _468 = _186 > 0.5;
        _466 = _468;
    }
    bool _470 = _466;
    float _472 = _460 * _186;
    float _474 = in.m_44.x;
    float _476 = in.m_44.y;
    float _478 = in.m_44.z;
    float _480 = floor(_438);
    float _482 = _430 * _132;
    bool _484 = _470;
    float _486 = _426;
    if (_436)
    {
        float _488 = -_426;
        float _490 = _488 + 1.0;
        _394 = as_type<int>(_490);
    }
    int _492 = _394;
    if (!_436)
    {
        _396 = _426;
    }
    float _494 = _396;
    float _496 = _494;
    if (_442)
    {
        float _498 = -_426;
        float _500 = _498 + 1.0;
        _398 = as_type<int>(_500);
    }
    int _502 = _398;
    if (_436)
    {
        float _504 = _470 ? as_type<float>(_492) : _426;
        _496 = _504;
    }
    float _506 = _496;
    float _508 = trunc(_472);
    int _510 = int(_508);
    if (_442)
    {
        bool _512 = _432 > 0.5;
        _484 = _512;
    }
    bool _514 = _484;
    bool _516 = _444 > 0.5;
    float _518 = -_458;
    float _520 = _518 + 1.0;
    float _522 = _458;
    if (_442)
    {
        float _524 = _514 ? as_type<float>(_502) : _426;
        _486 = _524;
    }
    float _526 = _486;
    float _528 = exp2(_482);
    float _530 = _432 * 2.0;
    float _532 = _464 * 2.0;
    int _534 = _516 ? as_type<int>(_520) : as_type<int>(_458);
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _546 = _544 != 0;
    float _548 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _550 = floor(_530);
    bool _552 = _464 > 0.5;
    float _554 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].x, _548);
    float _556 = _448 ? as_type<float>(_534) : _458;
    float _558 = _464 + _432;
    if (_456)
    {
        float _560 = _552 ? _520 : _458;
        _522 = _560;
    }
    float _562 = _522;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _566 = 1.0 + _564;
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _580 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _582 = _480 > 0.0;
    float _584 = 1.0 / _566;
    float _586 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].x, _578);
    float _588 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _590 = _186 + _464;
    bool _592 = _480 >= 0.0;
    bool _594 = isnan(_480);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = _558 + (-1.0);
    int _604 = _510 << 4;
    int _606 = _604 + 1968;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    float _612 = -_528;
    float _614 = _612 + 1.0;
    float _616 = _590 + (-1.0);
    int _618 = _606 + 8;
    uint _621 = uint(int(uint(_618) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[int(_623)][_625];
    float _629 = _610 * _462;
    float _631 = floor(_532);
    bool _633 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _641 = _637 || _639;
    float _643 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _645 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _647 = isnan(_424);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    uint _659 = uint(int(uint(_606) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[int(_669)][_671];
    float _675 = _641 ? _614 : 0.0;
    float _677 = _464 + (-0.5);
    bool _679 = _550 > 0.0;
    float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _683 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _685 = isnan(_424);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    if (_576)
    {
        float _695 = _675 * _584;
        _134 = _695;
    }
    float _697 = _134;
    bool _699 = _550 >= 0.0;
    bool _701 = isnan(_550);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    uint _709 = uint(int(uint(_390) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[int(_719)][_721];
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _727 = _424 + _725;
    float _729 = -_655;
    float _731 = _729 + 1.0;
    int _733 = _707 ? 0 : 1;
    float _735 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _588);
    bool _737 = _631 > 0.0;
    float _739 = fma(_629, _727, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _741 = _600 ? 0 : 1;
    int _743 = _390 + 8;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[int(_747)][_749];
    bool _753 = _631 >= 0.0;
    bool _755 = isnan(_631);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    float _763 = _693 * _731;
    float _765 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _586);
    float _767 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _554);
    bool _769 = !_538;
    int _771 = _769 ? 0 : 1;
    float _773 = _739 * _763;
    int _775 = ~_741;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = -_693;
    float _783 = _781 + 1.0;
    bool _785 = !_542;
    int _787 = _785 ? 0 : 1;
    float _789 = _767 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _791 = _761 ? 0 : 1;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[115].x, _773);
    int _795 = ~_733;
    int _797 = _795 + 1;
    int _799 = _797 + 1;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _803 = _779;
    int _805 = _799;
    if (!_582)
    {
        int _807 = ~_741;
        int _809 = _807 + 1;
        _803 = _809;
    }
    int _811 = _803;
    float _813 = _556 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_679)
    {
        int _815 = ~_733;
        int _817 = _815 + 1;
        _805 = _817;
    }
    int _819 = _805;
    float _821 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[116].x, _793);
    int _823 = abs(_771);
    int _825 = abs(_787);
    int _827 = ~_791;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    float _833 = _627 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _835 = _831;
    if (!_737)
    {
        int _837 = ~_791;
        int _839 = _837 + 1;
        _835 = _839;
    }
    int _841 = _835;
    float _843 = float(_823);
    float _845 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _847 = float(_819);
    float _849 = float(_825);
    float _851 = _665 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _853 = float(_811);
    float _855 = _843 * _847;
    float _857 = _673 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _859 = !_546;
    int _861 = _859 ? 0 : 1;
    float _863 = _849 * _853;
    float _865 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _715 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _869 = _723 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _873 = in.m_55.x;
    float _875 = in.m_55.y;
    float _877 = in.m_55.z;
    float _879 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _881 = abs(_861);
    float _883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _885 = float(_841);
    float _887 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_57.x = _865;
    out.m_57.y = _879;
    out.m_57.z = _845;
    out.m_57.w = _871;
    float _889 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _897 = _789 + _895;
    float _899 = _765 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _901 = _735 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _903 = _897 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _905 = float(_881);
    float _907 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _909 = _899 + _907;
    float _911 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _915 = _905 * _885;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _919 = _901 + _917;
    float _921 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[28].x, _903);
    float _923 = _863 * (-2.0);
    out.m_59.x = _889;
    out.m_59.y = _891;
    out.m_59.z = _893;
    out.m_59.w = _911;
    float _925 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].z, _921);
    float _927 = fma(_643, _923, _643);
    float _929 = fma(_923, _875, _875);
    float _931 = _897 * _897;
    float _933 = _813 * _681;
    bool _935 = _925 >= 0.0;
    float _937 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[196].y, _929);
    float _939 = fma(_909, _909, _931);
    float _941 = _562 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _943 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _945 = _526 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _947 = fma(_927, _697, _937);
    float _949 = fma(_919, _919, _939);
    float _951 = _855 * (-2.0);
    float _953 = _941 * _883;
    float _955 = _943 * _801;
    float _957 = _945 * _913;
    float _959 = _186 + (-0.5);
    float _961 = rsqrt(_949);
    float _963 = _939;
    float _965 = _877;
    if (_935)
    {
        _963 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _967 = _963;
    float _969 = fma(_951, _873, _873);
    float _971 = fma(_657, _951, _657);
    out.m_61.x = _955;
    out.m_61.y = _953;
    out.m_61.z = _957;
    out.m_61.w = _933;
    int _973 = as_type<int>(_967);
    if (_935)
    {
        float _975 = _967 * 5.0;
        _973 = as_type<int>(_975);
    }
    int _977 = _973;
    float _979 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].x, _969);
    if (_935)
    {
        out.m_47.x = 0.0;
    }
    float _981 = _947 * 0.15915493667125701904296875;
    float _983 = fma(_971, _697, _979);
    if (_935)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3560 = as_type<float>(_977);
        out.gl_Position.z = _3560;
    }
    float _985 = _897 * _961;
    float _987 = _909 * _961;
    if (_935)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _989 = -_985;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _789);
    float _993 = _919 * _961;
    float _995 = -_987;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _999 = _186 + _432;
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1003 = _991 + _1001;
    float _1005 = -_993;
    float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1011 = _997 + _1009;
    float _1013 = _999 + (-1.0);
    float _1015 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _1007 + _1017;
    float _1021 = _432 + (-0.5);
    float _1023 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1025 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1015);
    float _1027 = _915 * (-2.0);
    float _1029 = -_985;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _1033 = -_987;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _1037 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1025);
    float _1039 = fma(_1027, _877, _877);
    float _1041 = fma(_1023, _1027, _1023);
    float _1043 = _1031 * _1031;
    float _1045 = -_993;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    bool _1049 = _1037 >= 0.0;
    float _1051 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1039);
    float _1053 = fma(_1035, _1035, _1043);
    float _1055 = in.m_63.x;
    float _1057 = in.m_63.y;
    float _1059 = in.m_63.z;
    float _1061 = _983 * 0.15915493667125701904296875;
    float _1063 = fma(_1041, _697, _1051);
    float _1065 = fma(_1047, _1047, _1053);
    float _1067 = _981 * 6.283185482025146484375;
    float _1069 = sin(_1067);
    float _1071 = _1063 * 0.15915493667125701904296875;
    float _1073 = _991;
    if (_1049)
    {
        _965 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1075 = _965;
    int _1077 = as_type<int>(_1075);
    if (_1049)
    {
        out.m_47.x = 0.0;
    }
    float _1079 = _981 * 6.283185482025146484375;
    float _1081 = cos(_1079);
    if (_1049)
    {
        float _1083 = _1075 * 5.0;
        _1077 = as_type<int>(_1083);
    }
    int _1085 = _1077;
    float _1087 = _1061 * 6.283185482025146484375;
    float _1089 = sin(_1087);
    if (_1049)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3744 = as_type<float>(_1085);
        out.gl_Position.z = _3744;
    }
    float _1091 = _1061 * 6.283185482025146484375;
    float _1093 = cos(_1091);
    float _1095 = _1071 * 6.283185482025146484375;
    float _1097 = sin(_1095);
    float _1099 = sqrt(_1065);
    if (_1049)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1101 = in.m_65.x;
    float _1103 = in.m_65.y;
    float _1105 = in.m_65.z;
    float _1107 = _1071 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = _384 * _1057;
    float _1113 = _382 * _1055;
    float _1115 = _386 * _1059;
    float _1117 = _961 * _1099;
    float _1119 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1121 = _1089 * _1069;
    float _1123 = _1093 * _1081;
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1127 = _1117 * _1119;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1131 = fma(_1097, _1123, _1121);
    float _1133 = fma(_1097, _1121, _1123);
    float _1135 = _1117 * _1125;
    float _1137 = _1093 * _1069;
    float _1139 = _1093 * _1109;
    float _1141 = _1089 * _1081;
    float _1143 = _1081 * _1109;
    float _1145 = _1117 * _1129;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1151 = _1089 * _1109;
    float _1153 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1101);
    float _1155 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1103);
    float _1157 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1105);
    float _1159 = -_1137;
    float _1161 = fma(_1097, _1141, _1159);
    float _1163 = _1153 * _1127;
    float _1165 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1167 = _1155 * _1135;
    float _1169 = _1157 * _1145;
    float _1171 = -_1141;
    float _1173 = fma(_1097, _1137, _1171);
    float _1175 = -_1097;
    float _1177 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1165);
    float _1179 = -_1097;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1147);
    float _1183 = -_1097;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1149);
    float _1187 = -_1167;
    float _1189 = _1097 * _1187;
    float _1191 = _1139 * _1167;
    float _1193 = _1151 * _1167;
    float _1195 = _1069 * _1109;
    float _1197 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1199 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1201 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1203 = fma(_1143, _1163, _1189);
    float _1205 = fma(_1131, _1163, _1191);
    float _1207 = fma(_1161, _1163, _1193);
    bool _1209 = _1103 != 0.0;
    bool _1211 = isnan(_1103);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = in.m_67.x;
    float _1221 = in.m_67.y;
    float _1223 = in.m_67.z;
    float _1225 = fma(_1173, _1169, _1205);
    float _1227 = fma(_1195, _1169, _1203);
    bool _1229 = _1101 == 0.0;
    bool _1231 = !_1217;
    bool _1233 = _1229 && _1231;
    float _1235 = fma(_1133, _1169, _1207);
    float _1237 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1239 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1241 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1243 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1245 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1247 = _1105 == 0.0;
    bool _1249 = _1247 && _1233;
    float _1251 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1199);
    float _1253 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1201);
    float _1255 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1243);
    float _1257 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1245);
    float _1259 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1197);
    float _1261 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1237);
    float _1263 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1255);
    float _1265 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1257);
    float _1267 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1239);
    float _1269 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1241);
    float _1271 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1275 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1177);
    float _1277 = 0.0;
    float _1279 = _1147;
    float _1281 = _1177;
    float _1283 = _1203;
    float _1285 = _1275;
    if (_1249)
    {
        _1277 = _1219;
    }
    float _1287 = _1277;
    float _1289 = _899 + _1271;
    float _1291 = _901 + _1273;
    float _1293 = 0.0;
    float _1295 = _1287;
    float _1297 = _1289;
    float _1299 = _1291;
    if (_1249)
    {
        _1293 = _1221;
    }
    float _1301 = _1293;
    float _1303 = in.m_69.x;
    float _1305 = in.m_69.y;
    float _1307 = in.m_69.z;
    float _1309 = in.m_69.w;
    float _1311 = _1301;
    if (_1249)
    {
        _1279 = _1287;
    }
    float _1313 = _1279;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1289 + _1315;
    float _1319 = _1313;
    if (!_1249)
    {
        _1295 = _1219;
    }
    float _1321 = _1295;
    float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1325 = _1291 + _1323;
    float _1327 = 0.0;
    if (_1249)
    {
        _1327 = _1223;
    }
    float _1329 = _1327;
    float _1331 = _1317 * _1317;
    float _1333 = _1329;
    float _1335 = _1331;
    if (_1249)
    {
        _1281 = _1301;
    }
    float _1337 = _1281;
    float _1339 = _1325 * _1325;
    float _1341 = _1337;
    float _1343 = _1339;
    if (!_1249)
    {
        _1311 = _1221;
    }
    float _1345 = _1311;
    float _1347 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1259);
    if (_1249)
    {
        _1283 = _1329;
    }
    float _1349 = _1283;
    float _1351 = _1331 + _1339;
    float _1353 = _1349;
    if (!_1249)
    {
        _1333 = _1223;
    }
    float _1355 = _1333;
    float _1357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1251);
    float _1359 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1253);
    float _1361 = sqrt(_1351);
    if (!_1249)
    {
        float _1363 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1321);
        _1319 = _1363;
    }
    float _1365 = _1319;
    if (!_1249)
    {
        float _1367 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1355);
        _1353 = _1367;
    }
    float _1369 = _1353;
    float _1371 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_1249)
    {
        float _1373 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1345);
        _1341 = _1373;
    }
    float _1375 = _1341;
    float _1377 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1181);
    float _1379 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1185);
    float _1381 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1371);
    float _1383 = _1275 * _1305;
    float _1385 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1261);
    float _1387 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1267);
    float _1389 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1381);
    float _1391 = _1377 * _1305;
    float _1393 = _1379 * _1305;
    float _1395 = fma(_1347, _1303, _1383);
    float _1397 = _1307 * _1321;
    bool _1399 = _1361 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1401 = _1303 * _1345;
    float _1403 = _1305 * _1355;
    float _1405 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1407 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1269);
    float _1409 = fma(_1357, _1303, _1391);
    float _1411 = fma(_1359, _1303, _1393);
    float _1413 = -_1397;
    float _1415 = fma(_1303, _1355, _1413);
    float _1417 = -_1401;
    float _1419 = fma(_1305, _1321, _1417);
    float _1421 = -_1403;
    float _1423 = fma(_1307, _1345, _1421);
    float _1425 = _789 + _1405;
    float _1427 = fma(_1385, _1307, _1395);
    float _1429 = fma(_1387, _1307, _1409);
    float _1431 = fma(_1407, _1307, _1411);
    float _1433 = _1415 * _1309;
    float _1435 = _1423 * _1309;
    float _1437 = _1419 * _1309;
    float _1439 = _1309;
    if (!_1399)
    {
        _1439 = _1425;
    }
    float _1441 = _1439;
    bool _1443 = !_1399;
    float _1445 = _1441;
    if (!_1443)
    {
        float _1447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1451 = _1361 + _1449;
        float _1453 = _1425 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = rsqrt(_1351);
        float _1457 = _1451 * _1447;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1459 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = _1459 * 6.283185482025146484375;
        float _1467 = cos(_1465);
        float _1469 = fma(_1463, _1453, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1471 = _1455 * _1469;
        float _1473 = _1467 + (-1.0);
        float _1475 = fma(_1317, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1477 = fma(_1325, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1479 = _1473 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1483 = _1475 + _1481;
        float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1487 = _1477 + _1485;
        float _1489 = fma(_1425, _1467, _1479);
        float _1491 = _1483 * _1483;
        float _1493 = _1487 * _1487;
        _1445 = _1489;
        _1335 = _1491;
        _1343 = _1493;
        _1297 = _1475;
        _1299 = _1477;
    }
    float _1495 = _1445;
    float _1497 = _1335;
    float _1499 = _1343;
    float _1501 = _1297;
    float _1503 = _1299;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1507 = _1495 + _1505;
    float _1509 = _1275 * _1375;
    float _1511 = _1377 * _1375;
    float _1513 = _1379 * _1375;
    float _1515 = fma(_1507, _1507, _1497);
    float _1517 = _1433 * _1275;
    float _1519 = _1433 * _1377;
    float _1521 = _1433 * _1379;
    float _1523 = _1515 + _1499;
    float _1525 = fma(_1347, _1365, _1509);
    float _1527 = fma(_1357, _1365, _1511);
    float _1529 = fma(_1435, _1347, _1517);
    float _1531 = fma(_1435, _1357, _1519);
    float _1533 = fma(_1359, _1365, _1513);
    float _1535 = sqrt(_1523);
    float _1537 = fma(_1435, _1359, _1521);
    float _1539 = fma(_1387, _1369, _1527);
    float _1541 = fma(_1437, _1385, _1529);
    float _1543 = fma(_1437, _1387, _1531);
    float _1545 = fma(_1385, _1369, _1525);
    float _1547 = fma(_1407, _1369, _1533);
    float _1549 = fma(_1437, _1407, _1537);
    out.m_71.x = _1427;
    out.m_71.y = _1429;
    out.m_71.z = _1431;
    out.m_73.x = _1545;
    out.m_73.y = _1539;
    out.m_73.z = _1547;
    out.m_75.x = _1541;
    out.m_75.y = _1543;
    out.m_75.z = _1549;
    bool _1551 = _1535 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1553 = isnan(_1535);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1559 = _1555 || _1557;
    if (!_1559)
    {
        _1285 = 1.0;
    }
    float _1561 = _1285;
    bool _1563 = !_1559;
    float _1565 = _1561;
    if (!_1563)
    {
        bool _1567 = _1535 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1569 = isnan(_1535);
        bool _1571 = _1567 || _1569;
        bool _1573 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1575 = _1571 || _1573;
        if (!_1575)
        {
            float _1577 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1579 = _1535 + _1577;
            float _1581 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1583 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1581;
            float _1585 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1587 = _1585 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1589 = 1.0 / _1583;
            float _1591 = _1579 * _1589;
            float _1593 = fma(_1591, _1587, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1565 = _1593;
            _1595 = true;
        }
        else
        {
            bool _1597 = _1535 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1599 = isnan(_1535);
            bool _1601 = _1597 || _1599;
            bool _1603 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1605 = _1601 || _1603;
            if (!_1605)
            {
                float _1607 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1609 = _1535 + _1607;
                float _1611 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1613 = _1611 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1615 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1617 = _1615 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1619 = 1.0 / _1613;
                float _1621 = _1609 * _1619;
                float _1623 = fma(_1621, _1617, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1565 = _1623;
                _1595 = true;
            }
            else
            {
                _1565 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1595 = false;
    float _1625 = _1565;
    float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1629 = _1495 + _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1633 = _1501 + _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1637 = _1503 + _1635;
    bool _1639 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan(0.5);
    bool _1647 = _1643 || _1645;
    float _1649 = fma(_1629, _1625, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1651 = fma(_1633, _1625, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1653 = fma(_1637, _1625, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1655 = -_985;
    float _1657 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1649);
    float _1659 = -_987;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1651);
    float _1663 = -_993;
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1653);
    float _1667 = _1657;
    float _1669 = _1661;
    float _1671 = _1665;
    if (!_1647)
    {
        float _1673 = _1003 * _1003;
        float _1675 = 1.0 / _1117;
        float _1677 = -_789;
        float _1679 = _1677 + _1649;
        float _1681 = -_901;
        float _1683 = _1681 + _1653;
        float _1685 = fma(_1011, _1011, _1673);
        float _1687 = fma(_1019, _1019, _1685);
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1691 = sqrt(_1687);
        float _1693 = precise::min(_1691, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1695 = _1693 * _1689;
        float _1697 = -_899;
        float _1699 = _1697 + _1651;
        float _1701 = _1695 * _1675;
        float _1703 = fma(_1699, _1701, _997);
        float _1705 = fma(_1679, _1701, _991);
        float _1707 = fma(_1683, _1701, _1007);
        _1667 = _1705;
        _1669 = _1703;
        _1671 = _1707;
    }
    float _1709 = _1667;
    float _1711 = _1669;
    float _1713 = _1671;
    float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1717 = _1709 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1721 = _1711 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1725 = _1713 + _1723;
    float _1727 = _1717 * _1717;
    float _1729 = fma(_1721, _1721, _1727);
    float _1731 = fma(_1725, _1725, _1729);
    float _1733 = rsqrt(_1731);
    float _1735 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1737 = _1721 * _1735;
    float _1739 = _1725 * _1735;
    float _1741 = _1737 * _1737;
    float _1743 = _1739 * _1739;
    float _1745 = _1741 + _1743;
    float _1747 = sqrt(_1745);
    bool _1749 = _1747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1751 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1753 = _1747 + _1751;
    float _1755 = _1651;
    float _1757 = _1745;
    float _1759 = _1753;
    float _1761 = _1717;
    float _1763 = _1735;
    float _1765 = _1737;
    if (_1749)
    {
        float _1767 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1755 = _1767;
    }
    float _1769 = _1755;
    if (_1749)
    {
        float _1771 = rsqrt(_1745);
        _1757 = _1771;
    }
    float _1773 = _1757;
    float _1775 = _1769;
    if (_1749)
    {
        float _1777 = _1753 * _1769;
        _1759 = _1777;
    }
    float _1779 = _1759;
    if (_1749)
    {
        float _1781 = _1779 * 0.15915493667125701904296875;
        _1775 = _1781;
    }
    float _1783 = _1775;
    float _1785 = _1733;
    float _1787 = _1783;
    if (_1749)
    {
        float _1789 = _1783 * 6.283185482025146484375;
        float _1791 = sin(_1789);
        _1785 = _1791;
    }
    float _1793 = _1785;
    float _1795 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1797 = precise::max(0.0, _1795);
    float _1799 = _1725;
    float _1801 = _1797;
    if (_1749)
    {
        float _1803 = _1783 * 6.283185482025146484375;
        float _1805 = cos(_1803);
        _1799 = _1805;
    }
    float _1807 = _1799;
    float _1809 = -_1735;
    float _1811 = -_1797;
    float _1813 = fma(_1717, _1809, _1811);
    if (_1749)
    {
        float _1815 = _1813 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1761 = _1815;
    }
    float _1817 = _1761;
    float _1819 = _1817;
    if (!_1749)
    {
        _1787 = _1741;
    }
    float _1821 = _1787;
    float _1823 = _1793;
    float _1825 = _1821;
    if (_1749)
    {
        float _1827 = fma(_1793, _1817, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1819 = _1827;
    }
    float _1829 = _1819;
    float _1831 = _1829;
    if (!_1749)
    {
        _1823 = _1813;
    }
    float _1833 = _1823;
    float _1835 = _1833;
    if (_1749)
    {
        float _1837 = _1807 + (-1.0);
        _1801 = _1837;
    }
    float _1839 = _1801;
    float _1841 = _1839;
    if (_1749)
    {
        float _1843 = _1773 * _1829;
        _1073 = _1843;
    }
    float _1845 = _1073;
    if (!_1749)
    {
        _1831 = _1739;
    }
    float _1847 = _1831;
    float _1849 = sqrt(_1731);
    float _1851 = _1847;
    if (_1749)
    {
        float _1853 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1763 = _1853;
    }
    float _1855 = _1763;
    if (_1749)
    {
        float _1857 = _1737 * _1845;
        _1765 = _1857;
    }
    float _1859 = _1765;
    if (_1749)
    {
        float _1861 = _1739 * _1845;
        _1851 = _1861;
    }
    float _1863 = _1851;
    if (!_1749)
    {
        _1841 = _1743;
    }
    float _1865 = _1841;
    float _1867 = _1865;
    if (_1749)
    {
        float _1869 = fma(_1813, _1807, _1855);
        _1835 = _1869;
    }
    float _1871 = _1835;
    if (_1749)
    {
        float _1873 = _1859 * _1859;
        _1825 = _1873;
    }
    float _1875 = _1825;
    if (_1749)
    {
        float _1877 = _1863 * _1863;
        _1867 = _1877;
    }
    float _1879 = _1867;
    float _1881 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1883 = fma(_1871, _1871, _1875);
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1887 = _1883 + _1879;
    float _1889 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1893 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1891);
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    float _1897 = rsqrt(_1887);
    float _1899 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1889);
    float _1901 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1903 = -_1895;
    float _1905 = _1903 + 1.0;
    float _1907 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1909 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1899);
    float _1911 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1901);
    float _1913 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1907);
    float _1915 = _1909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1917 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1911);
    float _1919 = abs(_1905);
    float _1921 = log2(_1919);
    float _1923 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1881);
    float _1925 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1927 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1913);
    float _1929 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1931 = _1897 * _1859;
    float _1933 = -_1925;
    float _1935 = fma(_1933, _1885, 1.0);
    float _1937 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1923);
    float _1939 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1941 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1943 = _1897 * _1871;
    float _1945 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1947 = _1897 * _1863;
    float _1949 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1941);
    float _1951 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1953 = -_1945;
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1953);
    float _1957 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1959 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1949);
    float _1961 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1963 = -_1947;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1955);
    float _1967 = log2(_1935);
    float _1969 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1959);
    float _1971 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1973 = fma(_1965, -0.5, 0.5);
    float _1975 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1961);
    float _1977 = fma(_1965, 0.5, 0.5);
    float _1979 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1971);
    float _1981 = _1943 + 1.0;
    float _1983 = exp2(_1957);
    float _1985 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1975);
    float _1987 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1979);
    float _1989 = fma(_1977, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1991 = fma(_1977, _1989, -0.212114393711090087890625);
    float _1993 = 1.0 / _1969;
    float _1995 = _1967 * 0.693147182464599609375;
    float _1997 = fma(_1977, _1991, 1.570728778839111328125);
    float _1999 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2001 = sqrt(_1973);
    float _2003 = -_1943;
    float _2005 = fma(_1983, _1981, _2003);
    float _2007 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1985);
    float _2009 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1987);
    float _2011 = _2007 * _1993;
    float _2013 = _2009 * _1993;
    float _2015 = fma(_2011, 0.5, 0.5);
    float _2017 = fma(_2013, -0.5, 0.5);
    float _2019 = fma(_2005, 0.5, 0.5);
    float _2021 = _2001 * 0.636619746685028076171875;
    float3 _5309 = float3(_2015, _2017, _1999);
    float _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5309, float3(0.0), isnan(_5309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5309, float3(0.0), isnan(_5309)), level(0.0)).x;
    float3 _5320 = float3(_2015, _2017, _1999);
    float4 _2026 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5320, float3(0.0), isnan(_5320)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5320, float3(0.0), isnan(_5320)), level(0.0)).xyzw;
    float _2028 = _2026.x;
    float _2030 = _2026.y;
    float _2032 = _2026.z;
    float _2034 = _2026.w;
    float _2036 = -_1997;
    float _2038 = fma(_2021, _2036, 1.0);
    float2 _5342 = float2(_2038, _2019);
    float3 _2042 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5342, float2(0.0), isnan(_5342)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5342, float2(0.0), isnan(_5342)), level(0.0)).xyz;
    float _2044 = _2042.x;
    float _2046 = _2042.y;
    float _2048 = _2042.z;
    float _2050 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2052 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2054 = _2007 + _1969;
    float _2056 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2050);
    float _2058 = _2054 * 0.5;
    float _2060 = exp2(_2052);
    float _2062 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2056);
    float _2064 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2062);
    float _2066 = _1969 * 0.5;
    float _2068 = _2064 + _1969;
    float _2070 = -_2060;
    float _2072 = _2070 + 1.0;
    float _2074 = fma(_2009, -0.5, _2066);
    float _2076 = _2068 * 0.5;
    float _2078 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2007;
    out.gl_Position.y = _2009;
    out.gl_Position.z = _2064;
    out.gl_Position.w = _1969;
    float _2080 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2058;
    out.m_77.y = _2074;
    out.m_77.z = _2076;
    out.m_77.w = _1969;
    out.m_47.x = _2080;
    float _2082 = _2078 * _2023;
    float _2084 = -_2078;
    float _2086 = _2084 + 1.0;
    float _2088 = _2034 * _2082;
    float _2090 = _2034 * _2086;
    float _2092 = _2048 * _2082;
    float _2094 = fma(_2044, _2088, _2028);
    float _2096 = fma(_2046, _2088, _2030);
    float _2098 = fma(_2034, _2092, _2032);
    out.m_79.x = _2094;
    out.m_79.y = _2096;
    out.m_79.z = _2098;
    out.m_79.w = _2090;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1595 = false;
    bool _416 = false;
    bool _176 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2155 = as_type<float>(_114);
        out.gl_Position.z = _2155;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2225 = as_type<float>(_152);
        out.gl_Position.z = _2225;
    }
    if (_144)
    {
        return out;
    }
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _156 = !_154;
    float _174;
    if (!_156)
    {
        float _158 = in.m_51.x;
        float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _164 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _166 = _164 * _160;
        float _168 = floor(_166);
        float _170 = -_168;
        float _172 = _166 + _170;
        _174 = _172;
        _176 = true;
    }
    else
    {
        float _178 = float(_98);
        float _180 = 1.0 / _178;
        float _182 = _132 * _180;
        _174 = _182;
    }
    _176 = false;
    float _184 = _174;
    float _186 = in.m_51.x;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = _184 + _188;
    bool _192 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _194 = isnan(_184);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _184 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _184 + _220;
    float _224 = 1.0 / _206;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _218;
    float _230 = 1.0 / _214;
    float _232 = _190 * _224;
    bool _234 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_184);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_202;
    float _248 = _246 + 1.0;
    float _250 = _244 * _248;
    float _252 = _210 * _228;
    bool _254 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _256 = isnan(_184);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -_244;
    float _268 = _266 + 1.0;
    bool _270 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _272 = isnan(_184);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _290 = -_264;
    float _292 = _290 + 1.0;
    float _294 = _264 * _268;
    float _296 = _222 * _230;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = _280 * _292;
    float _312 = fma(_300, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _316 = fma(_304, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _318 = fma(_284, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = -_280;
    float _322 = _320 + 1.0;
    float _324 = _312 * _310;
    float _326 = _314 * _186;
    float _328 = _316 * _310;
    float _330 = _318 * _310;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _336 = fma(_288, _252, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].x, _324);
    float _340 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].y, _328);
    float _342 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _344 = trunc(_326);
    int _346 = int(_344);
    float _348 = fma(_336, _294, _338);
    float _350 = fma(_308, _252, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _356;
    float _360 = fma(_334, _252, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _362;
    float _366 = fma(_350, _294, _340);
    float _368 = fma(_354, _232, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _370 = fma(_358, _232, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _372 = fma(_364, _232, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _374 = fma(_360, _294, _342);
    float _376 = fma(_368, _250, _348);
    float _378 = fma(_370, _250, _366);
    float _380 = fma(_372, _250, _374);
    float _382 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[146].x, _376);
    float _384 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[146].y, _378);
    float _386 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[146].z, _380);
    int _388 = _346 << 4;
    int _390 = _388 + 1712;
    bool _392 = !_226;
    int _394 = as_type<int>(_366);
    float _396 = _252;
    int _398 = _346;
    float _414;
    if (!_392)
    {
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _186 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_98);
        float _420 = 1.0 / _418;
        float _422 = _132 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_53.x;
    float _428 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _430 = log2(_428);
    float _432 = in.m_51.z;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _436 = _434 != 0;
    float _438 = _186 * 2.0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _442 = _440 != 0;
    float _444 = in.m_51.w;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _448 = _446 != 0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _456 = _454 != 0;
    float _458 = in.m_53.y;
    float _460 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _462 = 1.0 / _452;
    float _464 = in.m_51.y;
    bool _466 = false;
    if (_436)
    {
        bool _468 = _186 > 0.5;
        _466 = _468;
    }
    bool _470 = _466;
    float _472 = _460 * _186;
    float _474 = in.m_44.x;
    float _476 = in.m_44.y;
    float _478 = in.m_44.z;
    float _480 = floor(_438);
    float _482 = _430 * _132;
    bool _484 = _470;
    float _486 = _426;
    if (_436)
    {
        float _488 = -_426;
        float _490 = _488 + 1.0;
        _394 = as_type<int>(_490);
    }
    int _492 = _394;
    if (!_436)
    {
        _396 = _426;
    }
    float _494 = _396;
    float _496 = _494;
    if (_442)
    {
        float _498 = -_426;
        float _500 = _498 + 1.0;
        _398 = as_type<int>(_500);
    }
    int _502 = _398;
    if (_436)
    {
        float _504 = _470 ? as_type<float>(_492) : _426;
        _496 = _504;
    }
    float _506 = _496;
    float _508 = trunc(_472);
    int _510 = int(_508);
    if (_442)
    {
        bool _512 = _432 > 0.5;
        _484 = _512;
    }
    bool _514 = _484;
    bool _516 = _444 > 0.5;
    float _518 = -_458;
    float _520 = _518 + 1.0;
    float _522 = _458;
    if (_442)
    {
        float _524 = _514 ? as_type<float>(_502) : _426;
        _486 = _524;
    }
    float _526 = _486;
    float _528 = exp2(_482);
    float _530 = _432 * 2.0;
    float _532 = _464 * 2.0;
    int _534 = _516 ? as_type<int>(_520) : as_type<int>(_458);
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _546 = _544 != 0;
    float _548 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _550 = floor(_530);
    bool _552 = _464 > 0.5;
    float _554 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].x, _548);
    float _556 = _448 ? as_type<float>(_534) : _458;
    float _558 = _464 + _432;
    if (_456)
    {
        float _560 = _552 ? _520 : _458;
        _522 = _560;
    }
    float _562 = _522;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _566 = 1.0 + _564;
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _580 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _582 = _480 > 0.0;
    float _584 = 1.0 / _566;
    float _586 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].x, _578);
    float _588 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _590 = _186 + _464;
    bool _592 = _480 >= 0.0;
    bool _594 = isnan(_480);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = _558 + (-1.0);
    int _604 = _510 << 4;
    int _606 = _604 + 1968;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    float _612 = -_528;
    float _614 = _612 + 1.0;
    float _616 = _590 + (-1.0);
    int _618 = _606 + 8;
    uint _621 = uint(int(uint(_618) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[int(_623)][_625];
    float _629 = _610 * _462;
    float _631 = floor(_532);
    bool _633 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _641 = _637 || _639;
    float _643 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _645 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _647 = isnan(_424);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    uint _659 = uint(int(uint(_606) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[int(_669)][_671];
    float _675 = _641 ? _614 : 0.0;
    float _677 = _464 + (-0.5);
    bool _679 = _550 > 0.0;
    float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _683 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _685 = isnan(_424);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    if (_576)
    {
        float _695 = _675 * _584;
        _134 = _695;
    }
    float _697 = _134;
    bool _699 = _550 >= 0.0;
    bool _701 = isnan(_550);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    uint _709 = uint(int(uint(_390) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[int(_719)][_721];
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _727 = _424 + _725;
    float _729 = -_655;
    float _731 = _729 + 1.0;
    int _733 = _707 ? 0 : 1;
    float _735 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _588);
    bool _737 = _631 > 0.0;
    float _739 = fma(_629, _727, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _741 = _600 ? 0 : 1;
    int _743 = _390 + 8;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[int(_747)][_749];
    bool _753 = _631 >= 0.0;
    bool _755 = isnan(_631);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    float _763 = _693 * _731;
    float _765 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _586);
    float _767 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _554);
    bool _769 = !_538;
    int _771 = _769 ? 0 : 1;
    float _773 = _739 * _763;
    int _775 = ~_741;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = -_693;
    float _783 = _781 + 1.0;
    bool _785 = !_542;
    int _787 = _785 ? 0 : 1;
    float _789 = _767 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _791 = _761 ? 0 : 1;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[115].x, _773);
    int _795 = ~_733;
    int _797 = _795 + 1;
    int _799 = _797 + 1;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _803 = _779;
    int _805 = _799;
    if (!_582)
    {
        int _807 = ~_741;
        int _809 = _807 + 1;
        _803 = _809;
    }
    int _811 = _803;
    float _813 = _556 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_679)
    {
        int _815 = ~_733;
        int _817 = _815 + 1;
        _805 = _817;
    }
    int _819 = _805;
    float _821 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[116].x, _793);
    int _823 = abs(_771);
    int _825 = abs(_787);
    int _827 = ~_791;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    float _833 = _627 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _835 = _831;
    if (!_737)
    {
        int _837 = ~_791;
        int _839 = _837 + 1;
        _835 = _839;
    }
    int _841 = _835;
    float _843 = float(_823);
    float _845 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _847 = float(_819);
    float _849 = float(_825);
    float _851 = _665 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _853 = float(_811);
    float _855 = _843 * _847;
    float _857 = _673 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _859 = !_546;
    int _861 = _859 ? 0 : 1;
    float _863 = _849 * _853;
    float _865 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _715 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _869 = _723 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _873 = in.m_55.x;
    float _875 = in.m_55.y;
    float _877 = in.m_55.z;
    float _879 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _881 = abs(_861);
    float _883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _885 = float(_841);
    float _887 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_57.x = _865;
    out.m_57.y = _879;
    out.m_57.z = _845;
    out.m_57.w = _871;
    float _889 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _897 = _789 + _895;
    float _899 = _765 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _901 = _735 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _903 = _897 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _905 = float(_881);
    float _907 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _909 = _899 + _907;
    float _911 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _915 = _905 * _885;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _919 = _901 + _917;
    float _921 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[28].x, _903);
    float _923 = _863 * (-2.0);
    out.m_59.x = _889;
    out.m_59.y = _891;
    out.m_59.z = _893;
    out.m_59.w = _911;
    float _925 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].z, _921);
    float _927 = fma(_643, _923, _643);
    float _929 = fma(_923, _875, _875);
    float _931 = _897 * _897;
    float _933 = _813 * _681;
    bool _935 = _925 >= 0.0;
    float _937 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[196].y, _929);
    float _939 = fma(_909, _909, _931);
    float _941 = _562 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _943 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _945 = _526 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _947 = fma(_927, _697, _937);
    float _949 = fma(_919, _919, _939);
    float _951 = _855 * (-2.0);
    float _953 = _941 * _883;
    float _955 = _943 * _801;
    float _957 = _945 * _913;
    float _959 = _186 + (-0.5);
    float _961 = rsqrt(_949);
    float _963 = _939;
    float _965 = _877;
    if (_935)
    {
        _963 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _967 = _963;
    float _969 = fma(_951, _873, _873);
    float _971 = fma(_657, _951, _657);
    out.m_61.x = _955;
    out.m_61.y = _953;
    out.m_61.z = _957;
    out.m_61.w = _933;
    int _973 = as_type<int>(_967);
    if (_935)
    {
        float _975 = _967 * 5.0;
        _973 = as_type<int>(_975);
    }
    int _977 = _973;
    float _979 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].x, _969);
    if (_935)
    {
        out.m_47.x = 0.0;
    }
    float _981 = _947 * 0.15915493667125701904296875;
    float _983 = fma(_971, _697, _979);
    if (_935)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3560 = as_type<float>(_977);
        out.gl_Position.z = _3560;
    }
    float _985 = _897 * _961;
    float _987 = _909 * _961;
    if (_935)
    {
        return out;
    }
    float _989 = -_985;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _789);
    float _993 = _919 * _961;
    float _995 = -_987;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _999 = _186 + _432;
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1003 = _991 + _1001;
    float _1005 = -_993;
    float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1011 = _997 + _1009;
    float _1013 = _999 + (-1.0);
    float _1015 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _1007 + _1017;
    float _1021 = _432 + (-0.5);
    float _1023 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1025 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1015);
    float _1027 = _915 * (-2.0);
    float _1029 = -_985;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _1033 = -_987;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _1037 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1025);
    float _1039 = fma(_1027, _877, _877);
    float _1041 = fma(_1023, _1027, _1023);
    float _1043 = _1031 * _1031;
    float _1045 = -_993;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    bool _1049 = _1037 >= 0.0;
    float _1051 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1039);
    float _1053 = fma(_1035, _1035, _1043);
    float _1055 = in.m_63.x;
    float _1057 = in.m_63.y;
    float _1059 = in.m_63.z;
    float _1061 = _983 * 0.15915493667125701904296875;
    float _1063 = fma(_1041, _697, _1051);
    float _1065 = fma(_1047, _1047, _1053);
    float _1067 = _981 * 6.283185482025146484375;
    float _1069 = sin(_1067);
    float _1071 = _1063 * 0.15915493667125701904296875;
    float _1073 = _991;
    if (_1049)
    {
        _965 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1075 = _965;
    int _1077 = as_type<int>(_1075);
    if (_1049)
    {
        out.m_47.x = 0.0;
    }
    float _1079 = _981 * 6.283185482025146484375;
    float _1081 = cos(_1079);
    if (_1049)
    {
        float _1083 = _1075 * 5.0;
        _1077 = as_type<int>(_1083);
    }
    int _1085 = _1077;
    float _1087 = _1061 * 6.283185482025146484375;
    float _1089 = sin(_1087);
    if (_1049)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3744 = as_type<float>(_1085);
        out.gl_Position.z = _3744;
    }
    float _1091 = _1061 * 6.283185482025146484375;
    float _1093 = cos(_1091);
    float _1095 = _1071 * 6.283185482025146484375;
    float _1097 = sin(_1095);
    float _1099 = sqrt(_1065);
    if (_1049)
    {
        return out;
    }
    float _1101 = in.m_65.x;
    float _1103 = in.m_65.y;
    float _1105 = in.m_65.z;
    float _1107 = _1071 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = _384 * _1057;
    float _1113 = _382 * _1055;
    float _1115 = _386 * _1059;
    float _1117 = _961 * _1099;
    float _1119 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1121 = _1089 * _1069;
    float _1123 = _1093 * _1081;
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1127 = _1117 * _1119;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1131 = fma(_1097, _1123, _1121);
    float _1133 = fma(_1097, _1121, _1123);
    float _1135 = _1117 * _1125;
    float _1137 = _1093 * _1069;
    float _1139 = _1093 * _1109;
    float _1141 = _1089 * _1081;
    float _1143 = _1081 * _1109;
    float _1145 = _1117 * _1129;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1151 = _1089 * _1109;
    float _1153 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1101);
    float _1155 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1103);
    float _1157 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1105);
    float _1159 = -_1137;
    float _1161 = fma(_1097, _1141, _1159);
    float _1163 = _1153 * _1127;
    float _1165 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1167 = _1155 * _1135;
    float _1169 = _1157 * _1145;
    float _1171 = -_1141;
    float _1173 = fma(_1097, _1137, _1171);
    float _1175 = -_1097;
    float _1177 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1165);
    float _1179 = -_1097;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1147);
    float _1183 = -_1097;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1149);
    float _1187 = -_1167;
    float _1189 = _1097 * _1187;
    float _1191 = _1139 * _1167;
    float _1193 = _1151 * _1167;
    float _1195 = _1069 * _1109;
    float _1197 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1199 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1201 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1203 = fma(_1143, _1163, _1189);
    float _1205 = fma(_1131, _1163, _1191);
    float _1207 = fma(_1161, _1163, _1193);
    bool _1209 = _1103 != 0.0;
    bool _1211 = isnan(_1103);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = in.m_67.x;
    float _1221 = in.m_67.y;
    float _1223 = in.m_67.z;
    float _1225 = fma(_1173, _1169, _1205);
    float _1227 = fma(_1195, _1169, _1203);
    bool _1229 = _1101 == 0.0;
    bool _1231 = !_1217;
    bool _1233 = _1229 && _1231;
    float _1235 = fma(_1133, _1169, _1207);
    float _1237 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1239 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1241 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1243 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1245 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1247 = _1105 == 0.0;
    bool _1249 = _1247 && _1233;
    float _1251 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1199);
    float _1253 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1201);
    float _1255 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1243);
    float _1257 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1245);
    float _1259 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1197);
    float _1261 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1237);
    float _1263 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1255);
    float _1265 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1257);
    float _1267 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1239);
    float _1269 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1241);
    float _1271 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1275 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1177);
    float _1277 = 0.0;
    float _1279 = _1147;
    float _1281 = _1177;
    float _1283 = _1203;
    float _1285 = _1275;
    if (_1249)
    {
        _1277 = _1219;
    }
    float _1287 = _1277;
    float _1289 = _899 + _1271;
    float _1291 = _901 + _1273;
    float _1293 = 0.0;
    float _1295 = _1287;
    float _1297 = _1289;
    float _1299 = _1291;
    if (_1249)
    {
        _1293 = _1221;
    }
    float _1301 = _1293;
    float _1303 = in.m_69.x;
    float _1305 = in.m_69.y;
    float _1307 = in.m_69.z;
    float _1309 = in.m_69.w;
    float _1311 = _1301;
    if (_1249)
    {
        _1279 = _1287;
    }
    float _1313 = _1279;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1289 + _1315;
    float _1319 = _1313;
    if (!_1249)
    {
        _1295 = _1219;
    }
    float _1321 = _1295;
    float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1325 = _1291 + _1323;
    float _1327 = 0.0;
    if (_1249)
    {
        _1327 = _1223;
    }
    float _1329 = _1327;
    float _1331 = _1317 * _1317;
    float _1333 = _1329;
    float _1335 = _1331;
    if (_1249)
    {
        _1281 = _1301;
    }
    float _1337 = _1281;
    float _1339 = _1325 * _1325;
    float _1341 = _1337;
    float _1343 = _1339;
    if (!_1249)
    {
        _1311 = _1221;
    }
    float _1345 = _1311;
    float _1347 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1259);
    if (_1249)
    {
        _1283 = _1329;
    }
    float _1349 = _1283;
    float _1351 = _1331 + _1339;
    float _1353 = _1349;
    if (!_1249)
    {
        _1333 = _1223;
    }
    float _1355 = _1333;
    float _1357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1251);
    float _1359 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1253);
    float _1361 = sqrt(_1351);
    if (!_1249)
    {
        float _1363 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1321);
        _1319 = _1363;
    }
    float _1365 = _1319;
    if (!_1249)
    {
        float _1367 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1355);
        _1353 = _1367;
    }
    float _1369 = _1353;
    float _1371 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_1249)
    {
        float _1373 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1345);
        _1341 = _1373;
    }
    float _1375 = _1341;
    float _1377 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1181);
    float _1379 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1185);
    float _1381 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1371);
    float _1383 = _1275 * _1305;
    float _1385 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1261);
    float _1387 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1267);
    float _1389 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1381);
    float _1391 = _1377 * _1305;
    float _1393 = _1379 * _1305;
    float _1395 = fma(_1347, _1303, _1383);
    float _1397 = _1307 * _1321;
    bool _1399 = _1361 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1401 = _1303 * _1345;
    float _1403 = _1305 * _1355;
    float _1405 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1407 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1269);
    float _1409 = fma(_1357, _1303, _1391);
    float _1411 = fma(_1359, _1303, _1393);
    float _1413 = -_1397;
    float _1415 = fma(_1303, _1355, _1413);
    float _1417 = -_1401;
    float _1419 = fma(_1305, _1321, _1417);
    float _1421 = -_1403;
    float _1423 = fma(_1307, _1345, _1421);
    float _1425 = _789 + _1405;
    float _1427 = fma(_1385, _1307, _1395);
    float _1429 = fma(_1387, _1307, _1409);
    float _1431 = fma(_1407, _1307, _1411);
    float _1433 = _1415 * _1309;
    float _1435 = _1423 * _1309;
    float _1437 = _1419 * _1309;
    float _1439 = _1309;
    if (!_1399)
    {
        _1439 = _1425;
    }
    float _1441 = _1439;
    bool _1443 = !_1399;
    float _1445 = _1441;
    if (!_1443)
    {
        float _1447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1451 = _1361 + _1449;
        float _1453 = _1425 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = rsqrt(_1351);
        float _1457 = _1451 * _1447;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1459 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = _1459 * 6.283185482025146484375;
        float _1467 = cos(_1465);
        float _1469 = fma(_1463, _1453, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1471 = _1455 * _1469;
        float _1473 = _1467 + (-1.0);
        float _1475 = fma(_1317, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1477 = fma(_1325, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1479 = _1473 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1483 = _1475 + _1481;
        float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1487 = _1477 + _1485;
        float _1489 = fma(_1425, _1467, _1479);
        float _1491 = _1483 * _1483;
        float _1493 = _1487 * _1487;
        _1445 = _1489;
        _1335 = _1491;
        _1343 = _1493;
        _1297 = _1475;
        _1299 = _1477;
    }
    float _1495 = _1445;
    float _1497 = _1335;
    float _1499 = _1343;
    float _1501 = _1297;
    float _1503 = _1299;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1507 = _1495 + _1505;
    float _1509 = _1275 * _1375;
    float _1511 = _1377 * _1375;
    float _1513 = _1379 * _1375;
    float _1515 = fma(_1507, _1507, _1497);
    float _1517 = _1433 * _1275;
    float _1519 = _1433 * _1377;
    float _1521 = _1433 * _1379;
    float _1523 = _1515 + _1499;
    float _1525 = fma(_1347, _1365, _1509);
    float _1527 = fma(_1357, _1365, _1511);
    float _1529 = fma(_1435, _1347, _1517);
    float _1531 = fma(_1435, _1357, _1519);
    float _1533 = fma(_1359, _1365, _1513);
    float _1535 = sqrt(_1523);
    float _1537 = fma(_1435, _1359, _1521);
    float _1539 = fma(_1387, _1369, _1527);
    float _1541 = fma(_1437, _1385, _1529);
    float _1543 = fma(_1437, _1387, _1531);
    float _1545 = fma(_1385, _1369, _1525);
    float _1547 = fma(_1407, _1369, _1533);
    float _1549 = fma(_1437, _1407, _1537);
    out.m_71.x = _1427;
    out.m_71.y = _1429;
    out.m_71.z = _1431;
    out.m_73.x = _1545;
    out.m_73.y = _1539;
    out.m_73.z = _1547;
    out.m_75.x = _1541;
    out.m_75.y = _1543;
    out.m_75.z = _1549;
    bool _1551 = _1535 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1553 = isnan(_1535);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1559 = _1555 || _1557;
    if (!_1559)
    {
        _1285 = 1.0;
    }
    float _1561 = _1285;
    bool _1563 = !_1559;
    float _1565 = _1561;
    if (!_1563)
    {
        bool _1567 = _1535 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1569 = isnan(_1535);
        bool _1571 = _1567 || _1569;
        bool _1573 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1575 = _1571 || _1573;
        if (!_1575)
        {
            float _1577 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1579 = _1535 + _1577;
            float _1581 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1583 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1581;
            float _1585 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1587 = _1585 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1589 = 1.0 / _1583;
            float _1591 = _1579 * _1589;
            float _1593 = fma(_1591, _1587, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1565 = _1593;
            _1595 = true;
        }
        else
        {
            bool _1597 = _1535 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1599 = isnan(_1535);
            bool _1601 = _1597 || _1599;
            bool _1603 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1605 = _1601 || _1603;
            if (!_1605)
            {
                float _1607 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1609 = _1535 + _1607;
                float _1611 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1613 = _1611 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1615 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1617 = _1615 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1619 = 1.0 / _1613;
                float _1621 = _1609 * _1619;
                float _1623 = fma(_1621, _1617, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1565 = _1623;
                _1595 = true;
            }
            else
            {
                _1565 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1595 = false;
    float _1625 = _1565;
    float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1629 = _1495 + _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1633 = _1501 + _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1637 = _1503 + _1635;
    bool _1639 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan(0.5);
    bool _1647 = _1643 || _1645;
    float _1649 = fma(_1629, _1625, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1651 = fma(_1633, _1625, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1653 = fma(_1637, _1625, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1655 = -_985;
    float _1657 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1649);
    float _1659 = -_987;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1651);
    float _1663 = -_993;
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1653);
    float _1667 = _1657;
    float _1669 = _1661;
    float _1671 = _1665;
    if (!_1647)
    {
        float _1673 = _1003 * _1003;
        float _1675 = 1.0 / _1117;
        float _1677 = -_789;
        float _1679 = _1677 + _1649;
        float _1681 = -_901;
        float _1683 = _1681 + _1653;
        float _1685 = fma(_1011, _1011, _1673);
        float _1687 = fma(_1019, _1019, _1685);
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1691 = sqrt(_1687);
        float _1693 = precise::min(_1691, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1695 = _1693 * _1689;
        float _1697 = -_899;
        float _1699 = _1697 + _1651;
        float _1701 = _1695 * _1675;
        float _1703 = fma(_1699, _1701, _997);
        float _1705 = fma(_1679, _1701, _991);
        float _1707 = fma(_1683, _1701, _1007);
        _1667 = _1705;
        _1669 = _1703;
        _1671 = _1707;
    }
    float _1709 = _1667;
    float _1711 = _1669;
    float _1713 = _1671;
    float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1717 = _1709 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1721 = _1711 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1725 = _1713 + _1723;
    float _1727 = _1717 * _1717;
    float _1729 = fma(_1721, _1721, _1727);
    float _1731 = fma(_1725, _1725, _1729);
    float _1733 = rsqrt(_1731);
    float _1735 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1737 = _1721 * _1735;
    float _1739 = _1725 * _1735;
    float _1741 = _1737 * _1737;
    float _1743 = _1739 * _1739;
    float _1745 = _1741 + _1743;
    float _1747 = sqrt(_1745);
    bool _1749 = _1747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1751 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1753 = _1747 + _1751;
    float _1755 = _1651;
    float _1757 = _1745;
    float _1759 = _1753;
    float _1761 = _1717;
    float _1763 = _1735;
    float _1765 = _1737;
    if (_1749)
    {
        float _1767 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1755 = _1767;
    }
    float _1769 = _1755;
    if (_1749)
    {
        float _1771 = rsqrt(_1745);
        _1757 = _1771;
    }
    float _1773 = _1757;
    float _1775 = _1769;
    if (_1749)
    {
        float _1777 = _1753 * _1769;
        _1759 = _1777;
    }
    float _1779 = _1759;
    if (_1749)
    {
        float _1781 = _1779 * 0.15915493667125701904296875;
        _1775 = _1781;
    }
    float _1783 = _1775;
    float _1785 = _1733;
    float _1787 = _1783;
    if (_1749)
    {
        float _1789 = _1783 * 6.283185482025146484375;
        float _1791 = sin(_1789);
        _1785 = _1791;
    }
    float _1793 = _1785;
    float _1795 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1797 = precise::max(0.0, _1795);
    float _1799 = _1725;
    float _1801 = _1797;
    if (_1749)
    {
        float _1803 = _1783 * 6.283185482025146484375;
        float _1805 = cos(_1803);
        _1799 = _1805;
    }
    float _1807 = _1799;
    float _1809 = -_1735;
    float _1811 = -_1797;
    float _1813 = fma(_1717, _1809, _1811);
    if (_1749)
    {
        float _1815 = _1813 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1761 = _1815;
    }
    float _1817 = _1761;
    float _1819 = _1817;
    if (!_1749)
    {
        _1787 = _1741;
    }
    float _1821 = _1787;
    float _1823 = _1793;
    float _1825 = _1821;
    if (_1749)
    {
        float _1827 = fma(_1793, _1817, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1819 = _1827;
    }
    float _1829 = _1819;
    float _1831 = _1829;
    if (!_1749)
    {
        _1823 = _1813;
    }
    float _1833 = _1823;
    float _1835 = _1833;
    if (_1749)
    {
        float _1837 = _1807 + (-1.0);
        _1801 = _1837;
    }
    float _1839 = _1801;
    float _1841 = _1839;
    if (_1749)
    {
        float _1843 = _1773 * _1829;
        _1073 = _1843;
    }
    float _1845 = _1073;
    if (!_1749)
    {
        _1831 = _1739;
    }
    float _1847 = _1831;
    float _1849 = sqrt(_1731);
    float _1851 = _1847;
    if (_1749)
    {
        float _1853 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1763 = _1853;
    }
    float _1855 = _1763;
    if (_1749)
    {
        float _1857 = _1737 * _1845;
        _1765 = _1857;
    }
    float _1859 = _1765;
    if (_1749)
    {
        float _1861 = _1739 * _1845;
        _1851 = _1861;
    }
    float _1863 = _1851;
    if (!_1749)
    {
        _1841 = _1743;
    }
    float _1865 = _1841;
    float _1867 = _1865;
    if (_1749)
    {
        float _1869 = fma(_1813, _1807, _1855);
        _1835 = _1869;
    }
    float _1871 = _1835;
    if (_1749)
    {
        float _1873 = _1859 * _1859;
        _1825 = _1873;
    }
    float _1875 = _1825;
    if (_1749)
    {
        float _1877 = _1863 * _1863;
        _1867 = _1877;
    }
    float _1879 = _1867;
    float _1881 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1883 = fma(_1871, _1871, _1875);
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1887 = _1883 + _1879;
    float _1889 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1893 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1891);
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    float _1897 = rsqrt(_1887);
    float _1899 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1889);
    float _1901 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1903 = -_1895;
    float _1905 = _1903 + 1.0;
    float _1907 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1909 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1899);
    float _1911 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1901);
    float _1913 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1907);
    float _1915 = _1909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1917 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1911);
    float _1919 = abs(_1905);
    float _1921 = log2(_1919);
    float _1923 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1881);
    float _1925 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1927 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1913);
    float _1929 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1931 = _1897 * _1859;
    float _1933 = -_1925;
    float _1935 = fma(_1933, _1885, 1.0);
    float _1937 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1923);
    float _1939 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1941 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1943 = _1897 * _1871;
    float _1945 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1947 = _1897 * _1863;
    float _1949 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1941);
    float _1951 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1953 = -_1945;
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1953);
    float _1957 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1959 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1949);
    float _1961 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1963 = -_1947;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1955);
    float _1967 = log2(_1935);
    float _1969 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1959);
    float _1971 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1973 = fma(_1965, -0.5, 0.5);
    float _1975 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1961);
    float _1977 = fma(_1965, 0.5, 0.5);
    float _1979 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1971);
    float _1981 = _1943 + 1.0;
    float _1983 = exp2(_1957);
    float _1985 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1975);
    float _1987 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1979);
    float _1989 = fma(_1977, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1991 = fma(_1977, _1989, -0.212114393711090087890625);
    float _1993 = 1.0 / _1969;
    float _1995 = _1967 * 0.693147182464599609375;
    float _1997 = fma(_1977, _1991, 1.570728778839111328125);
    float _1999 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2001 = sqrt(_1973);
    float _2003 = -_1943;
    float _2005 = fma(_1983, _1981, _2003);
    float _2007 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1985);
    float _2009 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1987);
    float _2011 = _2007 * _1993;
    float _2013 = _2009 * _1993;
    float _2015 = fma(_2011, 0.5, 0.5);
    float _2017 = fma(_2013, -0.5, 0.5);
    float _2019 = fma(_2005, 0.5, 0.5);
    float _2021 = _2001 * 0.636619746685028076171875;
    float3 _5309 = float3(_2015, _2017, _1999);
    float _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5309, float3(0.0), isnan(_5309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5309, float3(0.0), isnan(_5309)), level(0.0)).x;
    float3 _5320 = float3(_2015, _2017, _1999);
    float4 _2026 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5320, float3(0.0), isnan(_5320)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5320, float3(0.0), isnan(_5320)), level(0.0)).xyzw;
    float _2028 = _2026.x;
    float _2030 = _2026.y;
    float _2032 = _2026.z;
    float _2034 = _2026.w;
    float _2036 = -_1997;
    float _2038 = fma(_2021, _2036, 1.0);
    float2 _5342 = float2(_2038, _2019);
    float3 _2042 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5342, float2(0.0), isnan(_5342)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5342, float2(0.0), isnan(_5342)), level(0.0)).xyz;
    float _2044 = _2042.x;
    float _2046 = _2042.y;
    float _2048 = _2042.z;
    float _2050 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2052 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2054 = _2007 + _1969;
    float _2056 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2050);
    float _2058 = _2054 * 0.5;
    float _2060 = exp2(_2052);
    float _2062 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2056);
    float _2064 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2062);
    float _2066 = _1969 * 0.5;
    float _2068 = _2064 + _1969;
    float _2070 = -_2060;
    float _2072 = _2070 + 1.0;
    float _2074 = fma(_2009, -0.5, _2066);
    float _2076 = _2068 * 0.5;
    float _2078 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2007;
    out.gl_Position.y = _2009;
    out.gl_Position.z = _2064;
    out.gl_Position.w = _1969;
    float _2080 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2058;
    out.m_77.y = _2074;
    out.m_77.z = _2076;
    out.m_77.w = _1969;
    out.m_47.x = _2080;
    float _2082 = _2078 * _2023;
    float _2084 = -_2078;
    float _2086 = _2084 + 1.0;
    float _2088 = _2034 * _2082;
    float _2090 = _2034 * _2086;
    float _2092 = _2048 * _2082;
    float _2094 = fma(_2044, _2088, _2028);
    float _2096 = fma(_2046, _2088, _2030);
    float _2098 = fma(_2034, _2092, _2032);
    out.m_79.x = _2094;
    out.m_79.y = _2096;
    out.m_79.z = _2098;
    out.m_79.w = _2090;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1595 = false;
    bool _416 = false;
    bool _176 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2155 = as_type<float>(_114);
        out.gl_Position.z = _2155;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2225 = as_type<float>(_152);
        out.gl_Position.z = _2225;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _156 = !_154;
    float _174;
    if (!_156)
    {
        float _158 = in.m_51.x;
        float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _164 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _166 = _164 * _160;
        float _168 = floor(_166);
        float _170 = -_168;
        float _172 = _166 + _170;
        _174 = _172;
        _176 = true;
    }
    else
    {
        float _178 = float(_98);
        float _180 = 1.0 / _178;
        float _182 = _132 * _180;
        _174 = _182;
    }
    _176 = false;
    float _184 = _174;
    float _186 = in.m_51.x;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = _184 + _188;
    bool _192 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _194 = isnan(_184);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _184 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _184 + _220;
    float _224 = 1.0 / _206;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _218;
    float _230 = 1.0 / _214;
    float _232 = _190 * _224;
    bool _234 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_184);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_202;
    float _248 = _246 + 1.0;
    float _250 = _244 * _248;
    float _252 = _210 * _228;
    bool _254 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _256 = isnan(_184);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -_244;
    float _268 = _266 + 1.0;
    bool _270 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _272 = isnan(_184);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _290 = -_264;
    float _292 = _290 + 1.0;
    float _294 = _264 * _268;
    float _296 = _222 * _230;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = _280 * _292;
    float _312 = fma(_300, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _316 = fma(_304, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _318 = fma(_284, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = -_280;
    float _322 = _320 + 1.0;
    float _324 = _312 * _310;
    float _326 = _314 * _186;
    float _328 = _316 * _310;
    float _330 = _318 * _310;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _336 = fma(_288, _252, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].x, _324);
    float _340 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].y, _328);
    float _342 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _344 = trunc(_326);
    int _346 = int(_344);
    float _348 = fma(_336, _294, _338);
    float _350 = fma(_308, _252, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _356;
    float _360 = fma(_334, _252, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _362;
    float _366 = fma(_350, _294, _340);
    float _368 = fma(_354, _232, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _370 = fma(_358, _232, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _372 = fma(_364, _232, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _374 = fma(_360, _294, _342);
    float _376 = fma(_368, _250, _348);
    float _378 = fma(_370, _250, _366);
    float _380 = fma(_372, _250, _374);
    float _382 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[146].x, _376);
    float _384 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[146].y, _378);
    float _386 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[146].z, _380);
    int _388 = _346 << 4;
    int _390 = _388 + 1712;
    bool _392 = !_226;
    int _394 = as_type<int>(_366);
    float _396 = _252;
    int _398 = _346;
    float _414;
    if (!_392)
    {
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _186 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_98);
        float _420 = 1.0 / _418;
        float _422 = _132 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_53.x;
    float _428 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _430 = log2(_428);
    float _432 = in.m_51.z;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _436 = _434 != 0;
    float _438 = _186 * 2.0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _442 = _440 != 0;
    float _444 = in.m_51.w;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _448 = _446 != 0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _456 = _454 != 0;
    float _458 = in.m_53.y;
    float _460 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _462 = 1.0 / _452;
    float _464 = in.m_51.y;
    bool _466 = false;
    if (_436)
    {
        bool _468 = _186 > 0.5;
        _466 = _468;
    }
    bool _470 = _466;
    float _472 = _460 * _186;
    float _474 = in.m_44.x;
    float _476 = in.m_44.y;
    float _478 = in.m_44.z;
    float _480 = floor(_438);
    float _482 = _430 * _132;
    bool _484 = _470;
    float _486 = _426;
    if (_436)
    {
        float _488 = -_426;
        float _490 = _488 + 1.0;
        _394 = as_type<int>(_490);
    }
    int _492 = _394;
    if (!_436)
    {
        _396 = _426;
    }
    float _494 = _396;
    float _496 = _494;
    if (_442)
    {
        float _498 = -_426;
        float _500 = _498 + 1.0;
        _398 = as_type<int>(_500);
    }
    int _502 = _398;
    if (_436)
    {
        float _504 = _470 ? as_type<float>(_492) : _426;
        _496 = _504;
    }
    float _506 = _496;
    float _508 = trunc(_472);
    int _510 = int(_508);
    if (_442)
    {
        bool _512 = _432 > 0.5;
        _484 = _512;
    }
    bool _514 = _484;
    bool _516 = _444 > 0.5;
    float _518 = -_458;
    float _520 = _518 + 1.0;
    float _522 = _458;
    if (_442)
    {
        float _524 = _514 ? as_type<float>(_502) : _426;
        _486 = _524;
    }
    float _526 = _486;
    float _528 = exp2(_482);
    float _530 = _432 * 2.0;
    float _532 = _464 * 2.0;
    int _534 = _516 ? as_type<int>(_520) : as_type<int>(_458);
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _546 = _544 != 0;
    float _548 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _550 = floor(_530);
    bool _552 = _464 > 0.5;
    float _554 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].x, _548);
    float _556 = _448 ? as_type<float>(_534) : _458;
    float _558 = _464 + _432;
    if (_456)
    {
        float _560 = _552 ? _520 : _458;
        _522 = _560;
    }
    float _562 = _522;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _566 = 1.0 + _564;
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _580 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _582 = _480 > 0.0;
    float _584 = 1.0 / _566;
    float _586 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].x, _578);
    float _588 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _590 = _186 + _464;
    bool _592 = _480 >= 0.0;
    bool _594 = isnan(_480);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = _558 + (-1.0);
    int _604 = _510 << 4;
    int _606 = _604 + 1968;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    float _612 = -_528;
    float _614 = _612 + 1.0;
    float _616 = _590 + (-1.0);
    int _618 = _606 + 8;
    uint _621 = uint(int(uint(_618) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[int(_623)][_625];
    float _629 = _610 * _462;
    float _631 = floor(_532);
    bool _633 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _641 = _637 || _639;
    float _643 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _645 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _647 = isnan(_424);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    uint _659 = uint(int(uint(_606) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[int(_669)][_671];
    float _675 = _641 ? _614 : 0.0;
    float _677 = _464 + (-0.5);
    bool _679 = _550 > 0.0;
    float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _683 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _685 = isnan(_424);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    if (_576)
    {
        float _695 = _675 * _584;
        _134 = _695;
    }
    float _697 = _134;
    bool _699 = _550 >= 0.0;
    bool _701 = isnan(_550);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    uint _709 = uint(int(uint(_390) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[int(_719)][_721];
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _727 = _424 + _725;
    float _729 = -_655;
    float _731 = _729 + 1.0;
    int _733 = _707 ? 0 : 1;
    float _735 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _588);
    bool _737 = _631 > 0.0;
    float _739 = fma(_629, _727, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _741 = _600 ? 0 : 1;
    int _743 = _390 + 8;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[int(_747)][_749];
    bool _753 = _631 >= 0.0;
    bool _755 = isnan(_631);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    float _763 = _693 * _731;
    float _765 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _586);
    float _767 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _554);
    bool _769 = !_538;
    int _771 = _769 ? 0 : 1;
    float _773 = _739 * _763;
    int _775 = ~_741;
    int _777 = _775 + 1;
    int _779 = _777 + 1;
    float _781 = -_693;
    float _783 = _781 + 1.0;
    bool _785 = !_542;
    int _787 = _785 ? 0 : 1;
    float _789 = _767 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _791 = _761 ? 0 : 1;
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[115].x, _773);
    int _795 = ~_733;
    int _797 = _795 + 1;
    int _799 = _797 + 1;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _803 = _779;
    int _805 = _799;
    if (!_582)
    {
        int _807 = ~_741;
        int _809 = _807 + 1;
        _803 = _809;
    }
    int _811 = _803;
    float _813 = _556 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_679)
    {
        int _815 = ~_733;
        int _817 = _815 + 1;
        _805 = _817;
    }
    int _819 = _805;
    float _821 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[116].x, _793);
    int _823 = abs(_771);
    int _825 = abs(_787);
    int _827 = ~_791;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    float _833 = _627 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _835 = _831;
    if (!_737)
    {
        int _837 = ~_791;
        int _839 = _837 + 1;
        _835 = _839;
    }
    int _841 = _835;
    float _843 = float(_823);
    float _845 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _847 = float(_819);
    float _849 = float(_825);
    float _851 = _665 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _853 = float(_811);
    float _855 = _843 * _847;
    float _857 = _673 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _859 = !_546;
    int _861 = _859 ? 0 : 1;
    float _863 = _849 * _853;
    float _865 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _715 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _869 = _723 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _873 = in.m_55.x;
    float _875 = in.m_55.y;
    float _877 = in.m_55.z;
    float _879 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _881 = abs(_861);
    float _883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _885 = float(_841);
    float _887 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_57.x = _865;
    out.m_57.y = _879;
    out.m_57.z = _845;
    out.m_57.w = _871;
    float _889 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _891 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _897 = _789 + _895;
    float _899 = _765 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _901 = _735 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _903 = _897 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _905 = float(_881);
    float _907 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _909 = _899 + _907;
    float _911 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _915 = _905 * _885;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _919 = _901 + _917;
    float _921 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[28].x, _903);
    float _923 = _863 * (-2.0);
    out.m_59.x = _889;
    out.m_59.y = _891;
    out.m_59.z = _893;
    out.m_59.w = _911;
    float _925 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].z, _921);
    float _927 = fma(_643, _923, _643);
    float _929 = fma(_923, _875, _875);
    float _931 = _897 * _897;
    float _933 = _813 * _681;
    bool _935 = _925 >= 0.0;
    float _937 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[196].y, _929);
    float _939 = fma(_909, _909, _931);
    float _941 = _562 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _943 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _945 = _526 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _947 = fma(_927, _697, _937);
    float _949 = fma(_919, _919, _939);
    float _951 = _855 * (-2.0);
    float _953 = _941 * _883;
    float _955 = _943 * _801;
    float _957 = _945 * _913;
    float _959 = _186 + (-0.5);
    float _961 = rsqrt(_949);
    float _963 = _939;
    float _965 = _877;
    if (_935)
    {
        _963 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _967 = _963;
    float _969 = fma(_951, _873, _873);
    float _971 = fma(_657, _951, _657);
    out.m_61.x = _955;
    out.m_61.y = _953;
    out.m_61.z = _957;
    out.m_61.w = _933;
    int _973 = as_type<int>(_967);
    if (_935)
    {
        float _975 = _967 * 5.0;
        _973 = as_type<int>(_975);
    }
    int _977 = _973;
    float _979 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].x, _969);
    if (_935)
    {
        out.m_47.x = 0.0;
    }
    float _981 = _947 * 0.15915493667125701904296875;
    float _983 = fma(_971, _697, _979);
    if (_935)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3560 = as_type<float>(_977);
        out.gl_Position.z = _3560;
    }
    float _985 = _897 * _961;
    float _987 = _909 * _961;
    if (_935)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _989 = -_985;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _789);
    float _993 = _919 * _961;
    float _995 = -_987;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _999 = _186 + _432;
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1003 = _991 + _1001;
    float _1005 = -_993;
    float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1011 = _997 + _1009;
    float _1013 = _999 + (-1.0);
    float _1015 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _1007 + _1017;
    float _1021 = _432 + (-0.5);
    float _1023 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1025 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1015);
    float _1027 = _915 * (-2.0);
    float _1029 = -_985;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _1033 = -_987;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _1037 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1025);
    float _1039 = fma(_1027, _877, _877);
    float _1041 = fma(_1023, _1027, _1023);
    float _1043 = _1031 * _1031;
    float _1045 = -_993;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    bool _1049 = _1037 >= 0.0;
    float _1051 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1039);
    float _1053 = fma(_1035, _1035, _1043);
    float _1055 = in.m_63.x;
    float _1057 = in.m_63.y;
    float _1059 = in.m_63.z;
    float _1061 = _983 * 0.15915493667125701904296875;
    float _1063 = fma(_1041, _697, _1051);
    float _1065 = fma(_1047, _1047, _1053);
    float _1067 = _981 * 6.283185482025146484375;
    float _1069 = sin(_1067);
    float _1071 = _1063 * 0.15915493667125701904296875;
    float _1073 = _991;
    if (_1049)
    {
        _965 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1075 = _965;
    int _1077 = as_type<int>(_1075);
    if (_1049)
    {
        out.m_47.x = 0.0;
    }
    float _1079 = _981 * 6.283185482025146484375;
    float _1081 = cos(_1079);
    if (_1049)
    {
        float _1083 = _1075 * 5.0;
        _1077 = as_type<int>(_1083);
    }
    int _1085 = _1077;
    float _1087 = _1061 * 6.283185482025146484375;
    float _1089 = sin(_1087);
    if (_1049)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3744 = as_type<float>(_1085);
        out.gl_Position.z = _3744;
    }
    float _1091 = _1061 * 6.283185482025146484375;
    float _1093 = cos(_1091);
    float _1095 = _1071 * 6.283185482025146484375;
    float _1097 = sin(_1095);
    float _1099 = sqrt(_1065);
    if (_1049)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1101 = in.m_65.x;
    float _1103 = in.m_65.y;
    float _1105 = in.m_65.z;
    float _1107 = _1071 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = _384 * _1057;
    float _1113 = _382 * _1055;
    float _1115 = _386 * _1059;
    float _1117 = _961 * _1099;
    float _1119 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1121 = _1089 * _1069;
    float _1123 = _1093 * _1081;
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1127 = _1117 * _1119;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1131 = fma(_1097, _1123, _1121);
    float _1133 = fma(_1097, _1121, _1123);
    float _1135 = _1117 * _1125;
    float _1137 = _1093 * _1069;
    float _1139 = _1093 * _1109;
    float _1141 = _1089 * _1081;
    float _1143 = _1081 * _1109;
    float _1145 = _1117 * _1129;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1151 = _1089 * _1109;
    float _1153 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1101);
    float _1155 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1103);
    float _1157 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1105);
    float _1159 = -_1137;
    float _1161 = fma(_1097, _1141, _1159);
    float _1163 = _1153 * _1127;
    float _1165 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1167 = _1155 * _1135;
    float _1169 = _1157 * _1145;
    float _1171 = -_1141;
    float _1173 = fma(_1097, _1137, _1171);
    float _1175 = -_1097;
    float _1177 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1165);
    float _1179 = -_1097;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1147);
    float _1183 = -_1097;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1149);
    float _1187 = -_1167;
    float _1189 = _1097 * _1187;
    float _1191 = _1139 * _1167;
    float _1193 = _1151 * _1167;
    float _1195 = _1069 * _1109;
    float _1197 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1199 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1201 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1203 = fma(_1143, _1163, _1189);
    float _1205 = fma(_1131, _1163, _1191);
    float _1207 = fma(_1161, _1163, _1193);
    bool _1209 = _1103 != 0.0;
    bool _1211 = isnan(_1103);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = in.m_67.x;
    float _1221 = in.m_67.y;
    float _1223 = in.m_67.z;
    float _1225 = fma(_1173, _1169, _1205);
    float _1227 = fma(_1195, _1169, _1203);
    bool _1229 = _1101 == 0.0;
    bool _1231 = !_1217;
    bool _1233 = _1229 && _1231;
    float _1235 = fma(_1133, _1169, _1207);
    float _1237 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1239 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1241 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1243 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1245 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1247 = _1105 == 0.0;
    bool _1249 = _1247 && _1233;
    float _1251 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1199);
    float _1253 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1201);
    float _1255 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1243);
    float _1257 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1245);
    float _1259 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1197);
    float _1261 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1237);
    float _1263 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1255);
    float _1265 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1257);
    float _1267 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1239);
    float _1269 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1241);
    float _1271 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1275 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1177);
    float _1277 = 0.0;
    float _1279 = _1147;
    float _1281 = _1177;
    float _1283 = _1203;
    float _1285 = _1275;
    if (_1249)
    {
        _1277 = _1219;
    }
    float _1287 = _1277;
    float _1289 = _899 + _1271;
    float _1291 = _901 + _1273;
    float _1293 = 0.0;
    float _1295 = _1287;
    float _1297 = _1289;
    float _1299 = _1291;
    if (_1249)
    {
        _1293 = _1221;
    }
    float _1301 = _1293;
    float _1303 = in.m_69.x;
    float _1305 = in.m_69.y;
    float _1307 = in.m_69.z;
    float _1309 = in.m_69.w;
    float _1311 = _1301;
    if (_1249)
    {
        _1279 = _1287;
    }
    float _1313 = _1279;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1289 + _1315;
    float _1319 = _1313;
    if (!_1249)
    {
        _1295 = _1219;
    }
    float _1321 = _1295;
    float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1325 = _1291 + _1323;
    float _1327 = 0.0;
    if (_1249)
    {
        _1327 = _1223;
    }
    float _1329 = _1327;
    float _1331 = _1317 * _1317;
    float _1333 = _1329;
    float _1335 = _1331;
    if (_1249)
    {
        _1281 = _1301;
    }
    float _1337 = _1281;
    float _1339 = _1325 * _1325;
    float _1341 = _1337;
    float _1343 = _1339;
    if (!_1249)
    {
        _1311 = _1221;
    }
    float _1345 = _1311;
    float _1347 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1259);
    if (_1249)
    {
        _1283 = _1329;
    }
    float _1349 = _1283;
    float _1351 = _1331 + _1339;
    float _1353 = _1349;
    if (!_1249)
    {
        _1333 = _1223;
    }
    float _1355 = _1333;
    float _1357 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1251);
    float _1359 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1253);
    float _1361 = sqrt(_1351);
    if (!_1249)
    {
        float _1363 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1321);
        _1319 = _1363;
    }
    float _1365 = _1319;
    if (!_1249)
    {
        float _1367 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1355);
        _1353 = _1367;
    }
    float _1369 = _1353;
    float _1371 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_1249)
    {
        float _1373 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1345);
        _1341 = _1373;
    }
    float _1375 = _1341;
    float _1377 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1181);
    float _1379 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1185);
    float _1381 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1371);
    float _1383 = _1275 * _1305;
    float _1385 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1261);
    float _1387 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1267);
    float _1389 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1381);
    float _1391 = _1377 * _1305;
    float _1393 = _1379 * _1305;
    float _1395 = fma(_1347, _1303, _1383);
    float _1397 = _1307 * _1321;
    bool _1399 = _1361 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1401 = _1303 * _1345;
    float _1403 = _1305 * _1355;
    float _1405 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1407 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1269);
    float _1409 = fma(_1357, _1303, _1391);
    float _1411 = fma(_1359, _1303, _1393);
    float _1413 = -_1397;
    float _1415 = fma(_1303, _1355, _1413);
    float _1417 = -_1401;
    float _1419 = fma(_1305, _1321, _1417);
    float _1421 = -_1403;
    float _1423 = fma(_1307, _1345, _1421);
    float _1425 = _789 + _1405;
    float _1427 = fma(_1385, _1307, _1395);
    float _1429 = fma(_1387, _1307, _1409);
    float _1431 = fma(_1407, _1307, _1411);
    float _1433 = _1415 * _1309;
    float _1435 = _1423 * _1309;
    float _1437 = _1419 * _1309;
    float _1439 = _1309;
    if (!_1399)
    {
        _1439 = _1425;
    }
    float _1441 = _1439;
    bool _1443 = !_1399;
    float _1445 = _1441;
    if (!_1443)
    {
        float _1447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1451 = _1361 + _1449;
        float _1453 = _1425 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = rsqrt(_1351);
        float _1457 = _1451 * _1447;
        float _1459 = _1457 * 0.15915493667125701904296875;
        float _1461 = _1459 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        float _1465 = _1459 * 6.283185482025146484375;
        float _1467 = cos(_1465);
        float _1469 = fma(_1463, _1453, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1471 = _1455 * _1469;
        float _1473 = _1467 + (-1.0);
        float _1475 = fma(_1317, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1477 = fma(_1325, _1471, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1479 = _1473 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1483 = _1475 + _1481;
        float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1487 = _1477 + _1485;
        float _1489 = fma(_1425, _1467, _1479);
        float _1491 = _1483 * _1483;
        float _1493 = _1487 * _1487;
        _1445 = _1489;
        _1335 = _1491;
        _1343 = _1493;
        _1297 = _1475;
        _1299 = _1477;
    }
    float _1495 = _1445;
    float _1497 = _1335;
    float _1499 = _1343;
    float _1501 = _1297;
    float _1503 = _1299;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1507 = _1495 + _1505;
    float _1509 = _1275 * _1375;
    float _1511 = _1377 * _1375;
    float _1513 = _1379 * _1375;
    float _1515 = fma(_1507, _1507, _1497);
    float _1517 = _1433 * _1275;
    float _1519 = _1433 * _1377;
    float _1521 = _1433 * _1379;
    float _1523 = _1515 + _1499;
    float _1525 = fma(_1347, _1365, _1509);
    float _1527 = fma(_1357, _1365, _1511);
    float _1529 = fma(_1435, _1347, _1517);
    float _1531 = fma(_1435, _1357, _1519);
    float _1533 = fma(_1359, _1365, _1513);
    float _1535 = sqrt(_1523);
    float _1537 = fma(_1435, _1359, _1521);
    float _1539 = fma(_1387, _1369, _1527);
    float _1541 = fma(_1437, _1385, _1529);
    float _1543 = fma(_1437, _1387, _1531);
    float _1545 = fma(_1385, _1369, _1525);
    float _1547 = fma(_1407, _1369, _1533);
    float _1549 = fma(_1437, _1407, _1537);
    out.m_71.x = _1427;
    out.m_71.y = _1429;
    out.m_71.z = _1431;
    out.m_73.x = _1545;
    out.m_73.y = _1539;
    out.m_73.z = _1547;
    out.m_75.x = _1541;
    out.m_75.y = _1543;
    out.m_75.z = _1549;
    bool _1551 = _1535 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1553 = isnan(_1535);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1559 = _1555 || _1557;
    if (!_1559)
    {
        _1285 = 1.0;
    }
    float _1561 = _1285;
    bool _1563 = !_1559;
    float _1565 = _1561;
    if (!_1563)
    {
        bool _1567 = _1535 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1569 = isnan(_1535);
        bool _1571 = _1567 || _1569;
        bool _1573 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1575 = _1571 || _1573;
        if (!_1575)
        {
            float _1577 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1579 = _1535 + _1577;
            float _1581 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1583 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1581;
            float _1585 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1587 = _1585 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1589 = 1.0 / _1583;
            float _1591 = _1579 * _1589;
            float _1593 = fma(_1591, _1587, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1565 = _1593;
            _1595 = true;
        }
        else
        {
            bool _1597 = _1535 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1599 = isnan(_1535);
            bool _1601 = _1597 || _1599;
            bool _1603 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1605 = _1601 || _1603;
            if (!_1605)
            {
                float _1607 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1609 = _1535 + _1607;
                float _1611 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1613 = _1611 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1615 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1617 = _1615 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1619 = 1.0 / _1613;
                float _1621 = _1609 * _1619;
                float _1623 = fma(_1621, _1617, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1565 = _1623;
                _1595 = true;
            }
            else
            {
                _1565 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1595 = false;
    float _1625 = _1565;
    float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1629 = _1495 + _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1633 = _1501 + _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1637 = _1503 + _1635;
    bool _1639 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan(0.5);
    bool _1647 = _1643 || _1645;
    float _1649 = fma(_1629, _1625, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1651 = fma(_1633, _1625, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1653 = fma(_1637, _1625, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1655 = -_985;
    float _1657 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1649);
    float _1659 = -_987;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1651);
    float _1663 = -_993;
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1653);
    float _1667 = _1657;
    float _1669 = _1661;
    float _1671 = _1665;
    if (!_1647)
    {
        float _1673 = _1003 * _1003;
        float _1675 = 1.0 / _1117;
        float _1677 = -_789;
        float _1679 = _1677 + _1649;
        float _1681 = -_901;
        float _1683 = _1681 + _1653;
        float _1685 = fma(_1011, _1011, _1673);
        float _1687 = fma(_1019, _1019, _1685);
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1691 = sqrt(_1687);
        float _1693 = precise::min(_1691, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1695 = _1693 * _1689;
        float _1697 = -_899;
        float _1699 = _1697 + _1651;
        float _1701 = _1695 * _1675;
        float _1703 = fma(_1699, _1701, _997);
        float _1705 = fma(_1679, _1701, _991);
        float _1707 = fma(_1683, _1701, _1007);
        _1667 = _1705;
        _1669 = _1703;
        _1671 = _1707;
    }
    float _1709 = _1667;
    float _1711 = _1669;
    float _1713 = _1671;
    float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1717 = _1709 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1721 = _1711 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1725 = _1713 + _1723;
    float _1727 = _1717 * _1717;
    float _1729 = fma(_1721, _1721, _1727);
    float _1731 = fma(_1725, _1725, _1729);
    float _1733 = rsqrt(_1731);
    float _1735 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1737 = _1721 * _1735;
    float _1739 = _1725 * _1735;
    float _1741 = _1737 * _1737;
    float _1743 = _1739 * _1739;
    float _1745 = _1741 + _1743;
    float _1747 = sqrt(_1745);
    bool _1749 = _1747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1751 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1753 = _1747 + _1751;
    float _1755 = _1651;
    float _1757 = _1745;
    float _1759 = _1753;
    float _1761 = _1717;
    float _1763 = _1735;
    float _1765 = _1737;
    if (_1749)
    {
        float _1767 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1755 = _1767;
    }
    float _1769 = _1755;
    if (_1749)
    {
        float _1771 = rsqrt(_1745);
        _1757 = _1771;
    }
    float _1773 = _1757;
    float _1775 = _1769;
    if (_1749)
    {
        float _1777 = _1753 * _1769;
        _1759 = _1777;
    }
    float _1779 = _1759;
    if (_1749)
    {
        float _1781 = _1779 * 0.15915493667125701904296875;
        _1775 = _1781;
    }
    float _1783 = _1775;
    float _1785 = _1733;
    float _1787 = _1783;
    if (_1749)
    {
        float _1789 = _1783 * 6.283185482025146484375;
        float _1791 = sin(_1789);
        _1785 = _1791;
    }
    float _1793 = _1785;
    float _1795 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1797 = precise::max(0.0, _1795);
    float _1799 = _1725;
    float _1801 = _1797;
    if (_1749)
    {
        float _1803 = _1783 * 6.283185482025146484375;
        float _1805 = cos(_1803);
        _1799 = _1805;
    }
    float _1807 = _1799;
    float _1809 = -_1735;
    float _1811 = -_1797;
    float _1813 = fma(_1717, _1809, _1811);
    if (_1749)
    {
        float _1815 = _1813 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1761 = _1815;
    }
    float _1817 = _1761;
    float _1819 = _1817;
    if (!_1749)
    {
        _1787 = _1741;
    }
    float _1821 = _1787;
    float _1823 = _1793;
    float _1825 = _1821;
    if (_1749)
    {
        float _1827 = fma(_1793, _1817, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1819 = _1827;
    }
    float _1829 = _1819;
    float _1831 = _1829;
    if (!_1749)
    {
        _1823 = _1813;
    }
    float _1833 = _1823;
    float _1835 = _1833;
    if (_1749)
    {
        float _1837 = _1807 + (-1.0);
        _1801 = _1837;
    }
    float _1839 = _1801;
    float _1841 = _1839;
    if (_1749)
    {
        float _1843 = _1773 * _1829;
        _1073 = _1843;
    }
    float _1845 = _1073;
    if (!_1749)
    {
        _1831 = _1739;
    }
    float _1847 = _1831;
    float _1849 = sqrt(_1731);
    float _1851 = _1847;
    if (_1749)
    {
        float _1853 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1763 = _1853;
    }
    float _1855 = _1763;
    if (_1749)
    {
        float _1857 = _1737 * _1845;
        _1765 = _1857;
    }
    float _1859 = _1765;
    if (_1749)
    {
        float _1861 = _1739 * _1845;
        _1851 = _1861;
    }
    float _1863 = _1851;
    if (!_1749)
    {
        _1841 = _1743;
    }
    float _1865 = _1841;
    float _1867 = _1865;
    if (_1749)
    {
        float _1869 = fma(_1813, _1807, _1855);
        _1835 = _1869;
    }
    float _1871 = _1835;
    if (_1749)
    {
        float _1873 = _1859 * _1859;
        _1825 = _1873;
    }
    float _1875 = _1825;
    if (_1749)
    {
        float _1877 = _1863 * _1863;
        _1867 = _1877;
    }
    float _1879 = _1867;
    float _1881 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1883 = fma(_1871, _1871, _1875);
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1887 = _1883 + _1879;
    float _1889 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1893 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1891);
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    float _1897 = rsqrt(_1887);
    float _1899 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1889);
    float _1901 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1903 = -_1895;
    float _1905 = _1903 + 1.0;
    float _1907 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1909 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1899);
    float _1911 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1901);
    float _1913 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1907);
    float _1915 = _1909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1917 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1911);
    float _1919 = abs(_1905);
    float _1921 = log2(_1919);
    float _1923 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1881);
    float _1925 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1927 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1913);
    float _1929 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1931 = _1897 * _1859;
    float _1933 = -_1925;
    float _1935 = fma(_1933, _1885, 1.0);
    float _1937 = fma(_1713, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1923);
    float _1939 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1941 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1943 = _1897 * _1871;
    float _1945 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1947 = _1897 * _1863;
    float _1949 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1941);
    float _1951 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1953 = -_1945;
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1953);
    float _1957 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1959 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1949);
    float _1961 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1963 = -_1947;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1955);
    float _1967 = log2(_1935);
    float _1969 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1959);
    float _1971 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1973 = fma(_1965, -0.5, 0.5);
    float _1975 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1961);
    float _1977 = fma(_1965, 0.5, 0.5);
    float _1979 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1971);
    float _1981 = _1943 + 1.0;
    float _1983 = exp2(_1957);
    float _1985 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1975);
    float _1987 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1979);
    float _1989 = fma(_1977, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1991 = fma(_1977, _1989, -0.212114393711090087890625);
    float _1993 = 1.0 / _1969;
    float _1995 = _1967 * 0.693147182464599609375;
    float _1997 = fma(_1977, _1991, 1.570728778839111328125);
    float _1999 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2001 = sqrt(_1973);
    float _2003 = -_1943;
    float _2005 = fma(_1983, _1981, _2003);
    float _2007 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1985);
    float _2009 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1987);
    float _2011 = _2007 * _1993;
    float _2013 = _2009 * _1993;
    float _2015 = fma(_2011, 0.5, 0.5);
    float _2017 = fma(_2013, -0.5, 0.5);
    float _2019 = fma(_2005, 0.5, 0.5);
    float _2021 = _2001 * 0.636619746685028076171875;
    float3 _5309 = float3(_2015, _2017, _1999);
    float _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5309, float3(0.0), isnan(_5309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5309, float3(0.0), isnan(_5309)), level(0.0)).x;
    float3 _5320 = float3(_2015, _2017, _1999);
    float4 _2026 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5320, float3(0.0), isnan(_5320)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5320, float3(0.0), isnan(_5320)), level(0.0)).xyzw;
    float _2028 = _2026.x;
    float _2030 = _2026.y;
    float _2032 = _2026.z;
    float _2034 = _2026.w;
    float _2036 = -_1997;
    float _2038 = fma(_2021, _2036, 1.0);
    float2 _5342 = float2(_2038, _2019);
    float3 _2042 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5342, float2(0.0), isnan(_5342)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5342, float2(0.0), isnan(_5342)), level(0.0)).xyz;
    float _2044 = _2042.x;
    float _2046 = _2042.y;
    float _2048 = _2042.z;
    float _2050 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2052 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2054 = _2007 + _1969;
    float _2056 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2050);
    float _2058 = _2054 * 0.5;
    float _2060 = exp2(_2052);
    float _2062 = fma(_1915, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2056);
    float _2064 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2062);
    float _2066 = _1969 * 0.5;
    float _2068 = _2064 + _1969;
    float _2070 = -_2060;
    float _2072 = _2070 + 1.0;
    float _2074 = fma(_2009, -0.5, _2066);
    float _2076 = _2068 * 0.5;
    float _2078 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2007;
    out.gl_Position.y = _2009;
    out.gl_Position.z = _2064;
    out.gl_Position.w = _1969;
    float _2080 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2058;
    out.m_77.y = _2074;
    out.m_77.z = _2076;
    out.m_77.w = _1969;
    out.m_47.x = _2080;
    float _2082 = _2078 * _2023;
    float _2084 = -_2078;
    float _2086 = _2084 + 1.0;
    float _2088 = _2034 * _2082;
    float _2090 = _2034 * _2086;
    float _2092 = _2048 * _2082;
    float _2094 = fma(_2044, _2088, _2028);
    float _2096 = fma(_2046, _2088, _2030);
    float _2098 = fma(_2034, _2092, _2032);
    out.m_79.x = _2094;
    out.m_79.y = _2096;
    out.m_79.z = _2098;
    out.m_79.w = _2090;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

