#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
};

static inline __attribute__((always_inline))
int _102(thread const int& _6244, thread const int& _6245, constant _10& support_buffer)
{
    float _6248 = as_type<float>(support_buffer._m4);
    int _6250 = _6245 + as_type<int>(_6248);
    int _6252 = 1 + _6250;
    float _6254 = support_buffer._m5[_6252].x;
    float _6256 = abs(_6254);
    bool _6258 = _6256 == 1.0;
    if (_6258)
    {
        return _6244;
    }
    float _6260 = float(_6244);
    float _6262 = _6260 / _6256;
    int _6264 = int(_6262);
    return _6264;
}

static inline __attribute__((always_inline))
int _103(thread const int& _6294, thread const int& _6295, constant _10& support_buffer)
{
    float _6298 = as_type<float>(support_buffer._m4);
    int _6300 = _6295 + as_type<int>(_6298);
    int _6302 = 1 + _6300;
    float _6304 = support_buffer._m5[_6302].x;
    bool _6306 = _6304 == 1.0;
    if (_6306)
    {
        return _6294;
    }
    float _6308 = float(_6294);
    float _6310 = _6308 * _6304;
    int _6312 = int(_6310);
    return _6312;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2207 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _111 = int(_109);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2492 = as_type<float>(_127);
        out.gl_Position.z = _2492;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2561 = as_type<float>(_165);
        out.gl_Position.z = _2561;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_55.x;
    float _169 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = _169 * _167;
    float _181 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = trunc(_179);
    int _187 = int(_185);
    float _189 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _191 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _197 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    int _203 = _187 << 4;
    int _205 = _203 + 1712;
    bool _207 = !_171;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _211 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_111);
        float _229 = 1.0 / _227;
        float _231 = _145 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    int _235 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _237 = _235;
    int _239 = 0;
    int _241 = _102(_237, _239, (*spvDescriptorSet0.support_buffer));
    int _243 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _245 = _243;
    int _247 = 0;
    int _249 = _102(_245, _247, (*spvDescriptorSet0.support_buffer));
    float _251 = in.m_59.w;
    float _253 = trunc(_251);
    int _255 = int(_253);
    int _257 = abs(_255);
    uint _260 = uint(int(uint(_255) >> uint(31)));
    float _262 = float(uint(_257));
    int _264 = ~int(_260);
    int _266 = _264 + 1;
    float _268 = float(_249);
    float _270 = float(_241);
    float _272 = trunc(_268);
    int _274 = int(_272);
    int _276 = abs(_274);
    bool _278 = _274 == 0;
    float _280 = float(uint(_276));
    int _282 = ~_276;
    int _284 = _282 + 1;
    int _286 = ~_276;
    int _288 = _286 + 1;
    float _290 = 1.0 / _280;
    int _292 = as_type<int>(_290) + (-2);
    float _294 = as_type<float>(_292) * _262;
    float _296 = _270 + 9.9999997473787516355514526367188e-06;
    float _298 = trunc(_294);
    float _300 = precise::max(_298, 0.0);
    uint _302 = uint(_300);
    float _304 = 1.0 / _296;
    int _306 = _284 * int(_302);
    int _308 = _306 + _257;
    float _310 = float(uint(_308));
    float _312 = _145 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _314 = as_type<float>(_292) * _310;
    float _316 = fma(_312, _304, _167);
    float _318 = _270 + (-1.0);
    float _320 = floor(_316);
    float _322 = trunc(_314);
    float _324 = precise::max(_322, 0.0);
    uint _326 = uint(_324);
    float _328 = -_320;
    float _330 = _316 + _328;
    float _332 = trunc(_318);
    int _334 = int(_332);
    float _336 = _270 * _330;
    int _338 = int(_302) + int(_326);
    float _340 = trunc(_336);
    int _342 = int(_340);
    int _344 = _288 * _338;
    int _346 = _344 + _257;
    bool _348 = uint(_346) >= uint(_276);
    bool _350 = !_348;
    int _352 = _350 ? 0 : (-1);
    int _354 = ~_338;
    int _356 = _354 + _352;
    int _358 = _356 + 1;
    bool _360 = _342 >= _334;
    int _362 = _342 + 1;
    int _364 = _276 * _358;
    int _366 = _364 + _257;
    bool _368 = !_360;
    int _370 = _368 ? _362 : 0;
    int _372 = _366 ^ _266;
    int _374 = ~_266;
    int _376 = _374 + _372;
    int _378 = _376 + 1;
    bool _380 = !_278;
    int _382 = _380 ? _378 : (-1);
    int _384 = _342;
    int _386 = 0;
    int _388 = _103(_384, _386, (*spvDescriptorSet0.support_buffer));
    int _390 = _382;
    int _392 = 0;
    int _394 = _103(_390, _392, (*spvDescriptorSet0.support_buffer));
    float4 _397 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_388, _394)), 0).xyzw;
    float _399 = _397.x;
    float _401 = _397.y;
    float _403 = _397.z;
    float _405 = _397.w;
    int _407 = _370;
    int _409 = 0;
    int _411 = _103(_407, _409, (*spvDescriptorSet0.support_buffer));
    int _413 = _382;
    int _415 = 0;
    int _417 = _103(_413, _415, (*spvDescriptorSet0.support_buffer));
    float4 _419 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_411, _417)), 0).xyzw;
    float _421 = _419.x;
    float _423 = _419.y;
    float _425 = _419.z;
    float _427 = _419.w;
    float _429 = in.m_55.z;
    float _431 = _167 * 2.0;
    float _433 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _435 = log2(_433);
    float _437 = in.m_55.y;
    float _439 = floor(_431);
    float _441 = _435 * _145;
    float _443 = exp2(_441);
    float _445 = _429 * 2.0;
    bool _447 = _439 > 0.0;
    bool _449 = _439 >= 0.0;
    bool _451 = isnan(_439);
    bool _453 = _449 || _451;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    float _459 = _437 + _429;
    float _461 = floor(_445);
    float _463 = _437 * 2.0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = _459 + (-1.0);
    int _479 = _457 ? 0 : 1;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _483 = 1.0 + _481;
    bool _485 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _493 = _489 || _491;
    float _495 = floor(_463);
    float _497 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _499 = ~_479;
    int _501 = _499 + 1;
    int _503 = _501 + 1;
    float _505 = -_443;
    float _507 = _505 + 1.0;
    int _509 = _503;
    if (!_447)
    {
        int _511 = ~_479;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = in.m_59.x;
    float _519 = in.m_59.y;
    float _521 = in.m_59.z;
    bool _523 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _525 = isnan(1.0);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _531 = _527 || _529;
    float _533 = 1.0 / _483;
    bool _535 = _461 > 0.0;
    bool _537 = _461 >= 0.0;
    bool _539 = isnan(_461);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    bool _547 = !_471;
    int _549 = _547 ? 0 : 1;
    float _551 = float(_515);
    int _553 = abs(_549);
    int _555 = _545 ? 0 : 1;
    float _557 = float(_553);
    bool _559 = !_467;
    int _561 = _559 ? 0 : 1;
    bool _563 = _495 > 0.0;
    float _565 = _557 * _551;
    float _567 = _493 ? _507 : 0.0;
    int _569 = ~_555;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    bool _575 = _495 >= 0.0;
    bool _577 = isnan(_495);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _565 * (-2.0);
    int _587 = _573;
    if (!_535)
    {
        int _589 = ~_555;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    if (_531)
    {
        float _595 = _567 * _533;
        _149 = _595;
    }
    float _597 = _149;
    int _599 = abs(_561);
    float _601 = _437 + (-0.5);
    float _603 = fma(_585, _519, _519);
    int _605 = _583 ? 0 : 1;
    float _607 = fma(_497, _585, _497);
    float _609 = float(_599);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].y, _603);
    bool _613 = !_475;
    int _615 = _613 ? 0 : 1;
    float _617 = _167 + _437;
    float _619 = float(_593);
    float _621 = fma(_607, _597, _611);
    int _623 = ~_605;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    float _629 = _617 + (-1.0);
    int _631 = abs(_615);
    float _633 = _609 * _619;
    int _635 = _627;
    if (!_563)
    {
        int _637 = ~_605;
        int _639 = _637 + 1;
        _635 = _639;
    }
    int _641 = _635;
    float _643 = _621 * 0.15915493667125701904296875;
    float _645 = float(_631);
    float _647 = _633 * (-2.0);
    float _649 = float(_641);
    float _651 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _653 = _167 + (-0.5);
    float _655 = fma(_647, _517, _517);
    float _657 = _167 + _429;
    float _659 = _645 * _649;
    float _661 = fma(_651, _647, _651);
    float _663 = _657 + (-1.0);
    float _665 = _659 * (-2.0);
    float _667 = _429 + (-0.5);
    float _669 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].x, _655);
    float _671 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _673 = fma(_665, _521, _521);
    float _675 = _643 * 6.283185482025146484375;
    float _677 = sin(_675);
    float _679 = fma(_661, _597, _669);
    float _681 = fma(_671, _665, _671);
    float _683 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[196].z, _673);
    float _685 = _679 * 0.15915493667125701904296875;
    float _687 = fma(_681, _597, _683);
    float _689 = _643 * 6.283185482025146484375;
    float _691 = cos(_689);
    float _693 = _687 * 0.15915493667125701904296875;
    float _695 = _685 * 6.283185482025146484375;
    float _697 = sin(_695);
    float _699 = _685 * 6.283185482025146484375;
    float _701 = cos(_699);
    float _703 = _693 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = _697 * _677;
    float _709 = _697 * _691;
    float _711 = _693 * 6.283185482025146484375;
    float _713 = sin(_711);
    float _715 = _701 * _691;
    float _717 = _701 * _677;
    float _719 = floor(_336);
    float _721 = _691 * _705;
    float _723 = _697 * _705;
    float _725 = _701 * _705;
    float _727 = _677 * _705;
    float _729 = fma(_713, _715, _707);
    float _731 = fma(_713, _707, _715);
    float _733 = -_717;
    float _735 = fma(_713, _709, _733);
    float _737 = -_719;
    float _739 = _336 + _737;
    float _741 = -_709;
    float _743 = fma(_713, _717, _741);
    float _745 = -_401;
    float _747 = _745 + _423;
    float _749 = -_399;
    float _751 = _749 + _421;
    float _753 = -_403;
    float _755 = _753 + _425;
    float _757 = _747 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _759 = _751 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _761 = _755 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _763 = in.m_48.x;
    float _765 = in.m_48.y;
    float _767 = in.m_48.z;
    float _769 = _757 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _771 = _757 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _773 = _757 * _757;
    float _775 = _757 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _777 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[5].x, _769);
    float _779 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[4].x, _771);
    float _781 = fma(_759, _759, _773);
    float _783 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[6].x, _775);
    float _785 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[5].z, _777);
    float _787 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[4].z, _779);
    float _789 = fma(_761, _761, _781);
    float _791 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[6].z, _783);
    float _793 = _785 * _785;
    float _795 = fma(_739, _747, _401);
    float _797 = fma(_739, _751, _399);
    float _799 = fma(_739, _755, _403);
    float _801 = fma(_787, _787, _793);
    float _803 = sqrt(_789);
    float _805 = _795 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _807 = _795 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _809 = fma(_791, _791, _801);
    float _811 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[5].x, _805);
    float _813 = _765 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _815 = _765 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _817 = rsqrt(_809);
    float _819 = _765 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _821 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[5].x, _813);
    float _823 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[4].x, _815);
    float _825 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].z, _811);
    float _827 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[6].x, _819);
    float _829 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[5].z, _821);
    float _831 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[4].z, _823);
    float _833 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[6].x, _807);
    float _835 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[6].z, _827);
    float _837 = _829 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _839 = _835 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _841 = _837 + _825;
    float _843 = _803 * _817;
    float _845 = fma(_785, _843, _199);
    float _847 = fma(_787, _843, _197);
    float _849 = fma(_791, _843, _201);
    float _851 = _795 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _853 = _845 * _845;
    float _855 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].z, _833);
    float _857 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[4].x, _851);
    float _859 = fma(_847, _847, _853);
    float _861 = _831 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _863 = _839 + _855;
    float _865 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].z, _857);
    float _867 = fma(_849, _849, _859);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _871 = _863 + _869;
    float _873 = _861 + _865;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _877 = _841 + _875;
    float _879 = rsqrt(_867);
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _883 = _873 + _881;
    float _885 = _877 * _877;
    float _887 = fma(_883, _883, _885);
    float _889 = fma(_871, _871, _887);
    float _891 = rsqrt(_889);
    float _893 = _845 * _879;
    float _895 = _847 * _879;
    float _897 = _849 * _879;
    float _899 = _893 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _901 = _725 * _893;
    float _903 = _725 * _897;
    float _905 = _743 * _897;
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[8].y, _899);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[10].y, _907);
    float _911 = _877 * _891;
    float _913 = _883 * _891;
    float _915 = _871 * _891;
    float _917 = abs(_909);
    bool _919 = _917 > 0.99989998340606689453125;
    float _921 = -_911;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _925 = -_913;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _883);
    float _929 = -_915;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _871);
    float _933 = _923 * _923;
    float _935 = fma(_927, _927, _933);
    float _937 = _879;
    float _939 = _837;
    float _941 = _909;
    float _943 = _831;
    float _945 = _897;
    float _947 = _743;
    if (_919)
    {
        _937 = 0.001000000047497451305389404296875;
    }
    float _949 = _937;
    if (!_919)
    {
        _939 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _951 = _939;
    float _953 = _951;
    if (!_919)
    {
        _941 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _955 = _941;
    float _957 = _955;
    if (_919)
    {
        float _959 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _953 = _959;
    }
    float _961 = _953;
    if (_919)
    {
        float _963 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _957 = _963;
    }
    float _965 = _957;
    float _967 = fma(_931, _931, _935);
    if (!_919)
    {
        _943 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _969 = _943;
    float _971 = -_961;
    float _973 = _897 * _971;
    float _975 = _969;
    if (_919)
    {
        float _977 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _975 = _977;
    }
    float _979 = _975;
    float _981 = in.m_61.x;
    float _983 = in.m_61.y;
    float _985 = in.m_61.z;
    float _987 = -_965;
    float _989 = _893 * _987;
    float _991 = -_965;
    float _993 = -_973;
    float _995 = fma(_895, _991, _993);
    float _997 = sqrt(_967);
    float _999 = in.m_63.x;
    float _1001 = in.m_63.y;
    float _1003 = in.m_63.z;
    float _1005 = -_979;
    float _1007 = -_989;
    float _1009 = fma(_897, _1005, _1007);
    float _1011 = -_979;
    float _1013 = _895 * _1011;
    float _1015 = _995 * _995;
    float _1017 = -_961;
    float _1019 = -_1013;
    float _1021 = fma(_893, _1017, _1019);
    float _1023 = fma(_1009, _1009, _1015);
    float _1025 = fma(_1021, _1021, _1023);
    float _1027 = rsqrt(_1025);
    float _1029 = _891 * _997;
    float _1031 = _985 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1033 = _981 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1035 = _983 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1037 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1041 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1003);
    float _1045 = _1037 * _1029;
    float _1047 = _1039 * _1029;
    float _1049 = _1041 * _1029;
    float _1051 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _999);
    float _1053 = _995 * _1027;
    float _1055 = _1045 * _1043;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1001);
    float _1059 = _1009 * _1027;
    float _1061 = _1047 * _1051;
    float _1063 = _725 * _895;
    float _1065 = _895 * _1053;
    float _1067 = _1021 * _1027;
    float _1069 = _1049 * _1057;
    float _1071 = _729 * _897;
    float _1073 = -_713;
    float _1075 = fma(_1073, _1059, _1063);
    float _1077 = -_1065;
    float _1079 = fma(_893, _1059, _1077);
    float _1081 = _893 * _1067;
    float _1083 = -_713;
    float _1085 = fma(_1083, _1067, _903);
    float _1087 = _729 * _895;
    float _1089 = fma(_721, _1067, _1071);
    float _1091 = fma(_727, _1067, _905);
    float _1093 = -_1081;
    float _1095 = fma(_897, _1053, _1093);
    float _1097 = fma(_723, _1079, _1085);
    float _1099 = fma(_735, _1079, _1089);
    float _1101 = fma(_731, _1079, _1091);
    float _1103 = fma(_721, _1059, _1087);
    float _1105 = _743 * _895;
    float _1107 = fma(_723, _1095, _1075);
    float _1109 = _1069 * _1097;
    float _1111 = fma(_735, _1095, _1103);
    float _1113 = fma(_727, _1059, _1105);
    float _1115 = _1069 * _1107;
    float _1117 = fma(_1061, _1099, _1109);
    float _1119 = _897 * _1059;
    float _1121 = fma(_731, _1095, _1113);
    float _1123 = fma(_1061, _1111, _1115);
    float _1125 = fma(_1055, _1101, _1117);
    float _1127 = -_713;
    float _1129 = fma(_1127, _1053, _901);
    float _1131 = _729 * _893;
    float _1133 = fma(_1055, _1121, _1123);
    float _1135 = _863 + _1125;
    float _1137 = -_1119;
    float _1139 = fma(_895, _1067, _1137);
    float _1141 = _743 * _893;
    float _1143 = _873 + _1133;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1147 = _1135 + _1145;
    float _1149 = fma(_721, _1053, _1131);
    float _1151 = fma(_723, _1139, _1129);
    float _1153 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1155 = _1143 + _1153;
    float _1157 = _1147 * _1147;
    float _1159 = fma(_727, _1053, _1141);
    float _1161 = fma(_735, _1139, _1149);
    float _1163 = _1069 * _1151;
    float _1165 = fma(_1155, _1155, _1157);
    float _1167 = fma(_731, _1139, _1159);
    float _1169 = fma(_1061, _1161, _1163);
    float _1171 = sqrt(_1165);
    float _1173 = fma(_1055, _1167, _1169);
    float _1175 = _841 + _1173;
    bool _1177 = _1171 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1179 = _1143;
    float _1181 = _1135;
    float _1183 = _1061;
    if (!_1177)
    {
        _945 = _1175;
    }
    float _1185 = _945;
    bool _1187 = !_1177;
    float _1189 = _1185;
    if (!_1187)
    {
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1195 = _1171 + _1193;
        float _1197 = rsqrt(_1165);
        float _1199 = _1195 * _1191;
        float _1201 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1203 = _1199 * 0.15915493667125701904296875;
        float _1205 = _1203 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = _1203 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = _1207 + (-1.0);
        float _1215 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = fma(_1211, _1201, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1219 = fma(_1175, _1207, _1215);
        float _1221 = _1197 * _1217;
        float _1223 = fma(_1155, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = fma(_1147, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1189 = _1219;
        _1179 = _1223;
        _1181 = _1225;
        _1183 = _1203;
    }
    float _1227 = _1189;
    float _1229 = _1179;
    float _1231 = _1181;
    float _1233 = _1183;
    float _1235 = -_911;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1227);
    float _1239 = -_913;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1229);
    float _1243 = -_915;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1231);
    float _1247 = -_913;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1253 = _1237 + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1257 = _1241 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1261 = _1245 + _1259;
    float _1263 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1265 = _1253 * _1253;
    float _1267 = -_915;
    float _1269 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _1271 = fma(_1257, _1257, _1265);
    float _1273 = fma(_1261, _1261, _1271);
    float _1275 = rsqrt(_1273);
    float _1277 = sqrt(_1273);
    float _1279 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1281 = _1257 * _1279;
    float _1283 = _1261 * _1279;
    float _1285 = _1281 * _1281;
    float _1287 = _1283 * _1283;
    float _1289 = _1285 + _1287;
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1297 = _1291 + _1295;
    float _1299 = _1233;
    float _1301 = _1289;
    float _1303 = _1297;
    float _1305 = _1253;
    float _1307 = _1283;
    float _1309 = _1287;
    if (_1293)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1299 = _1311;
    }
    float _1313 = _1299;
    if (_1293)
    {
        float _1315 = rsqrt(_1289);
        _1301 = _1315;
    }
    float _1317 = _1301;
    if (_1293)
    {
        float _1319 = _1297 * _1313;
        _1303 = _1319;
    }
    float _1321 = _1303;
    if (_1293)
    {
        float _1323 = _1321 * 0.15915493667125701904296875;
        _947 = _1323;
    }
    float _1325 = _947;
    float _1327 = _1271;
    float _1329 = _1325;
    if (_1293)
    {
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        _1327 = _1333;
    }
    float _1335 = _1327;
    float _1337 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1339 = precise::max(0.0, _1337);
    float _1341 = _1175;
    float _1343 = _1339;
    float _1345 = _1337;
    if (_1293)
    {
        float _1347 = _1325 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        _1341 = _1349;
    }
    float _1351 = _1341;
    float _1353 = -_1279;
    float _1355 = -_1339;
    float _1357 = fma(_1253, _1353, _1355);
    if (!_1293)
    {
        _1305 = _1281;
    }
    float _1359 = _1305;
    float _1361 = _1359;
    if (_1293)
    {
        float _1363 = _1357 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1343 = _1363;
    }
    float _1365 = _1343;
    float _1367 = _1365;
    float _1369 = _1335;
    if (_1293)
    {
        float _1371 = fma(_1335, _1365, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1367 = _1371;
    }
    float _1373 = _1367;
    if (!_1293)
    {
        _1369 = _1357;
    }
    float _1375 = _1369;
    float _1377 = _1375;
    float _1379 = _1351;
    if (_1293)
    {
        float _1381 = _1351 + (-1.0);
        _1345 = _1381;
    }
    float _1383 = _1345;
    float _1385 = _1383;
    if (_1293)
    {
        float _1387 = _1317 * _1373;
        _1329 = _1387;
    }
    float _1389 = _1329;
    float _1391 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1293)
    {
        float _1393 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1393;
    }
    float _1395 = _1385;
    if (_1293)
    {
        float _1397 = _1281 * _1389;
        _1361 = _1397;
    }
    float _1399 = _1361;
    if (_1293)
    {
        float _1401 = _1283 * _1389;
        _1307 = _1401;
    }
    float _1403 = _1307;
    float _1405 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1263);
    if (_1293)
    {
        float _1407 = fma(_1357, _1351, _1395);
        _1377 = _1407;
    }
    float _1409 = _1377;
    if (!_1293)
    {
        _1379 = _1285;
    }
    float _1411 = _1379;
    float _1413 = _1411;
    if (_1293)
    {
        float _1415 = _1399 * _1399;
        _1413 = _1415;
    }
    float _1417 = _1413;
    if (_1293)
    {
        float _1419 = _1403 * _1403;
        _1309 = _1419;
    }
    float _1421 = _1309;
    float _1423 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1405);
    float _1425 = fma(_1409, _1409, _1417);
    float _1427 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1431 = _1425 + _1421;
    float _1433 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1437 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1435);
    float _1439 = precise::clamp(_1437, 0.0, 1.0);
    float _1441 = rsqrt(_1431);
    float _1443 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1433);
    float _1445 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1449 = -_1439;
    float _1451 = _1449 + 1.0;
    float _1453 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1455 = abs(_1451);
    float _1457 = log2(_1455);
    float _1459 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1461 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1463 = fma(_1269, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1465 = -_1459;
    float _1467 = fma(_1465, _1447, 1.0);
    float _1469 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1461);
    float _1471 = _1441 * _1399;
    float _1473 = floor(_1429);
    float _1475 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1469);
    float _1477 = _1441 * _1409;
    float _1479 = _1441 * _1403;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1483 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1427);
    float _1485 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1487 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1489 = -_1481;
    float _1491 = fma(_1477, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1489);
    float _1493 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1483);
    float _1495 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1497 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1487);
    float _1499 = -_1479;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1491);
    float _1503 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1505 = floor(_1463);
    float _1507 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1497);
    float _1509 = fma(_1501, -0.5, 0.5);
    float _1511 = -_1473;
    float _1513 = _1429 + _1511;
    float _1515 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1507);
    float _1519 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1521 = fma(_1501, 0.5, 0.5);
    float _1523 = exp2(_1495);
    float _1525 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1515);
    float _1527 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1519);
    float _1529 = _1477 + 1.0;
    float _1531 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1525);
    float _1533 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1527);
    float _1535 = log2(_1467);
    float _1537 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1531);
    float _1539 = -_1505;
    float _1541 = _1463 + _1539;
    float _1543 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1533);
    float _1545 = 1.0 / _1517;
    float _1547 = -_1477;
    float _1549 = fma(_1523, _1529, _1547);
    float _1551 = fma(_1521, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1553 = sqrt(_1509);
    float _1555 = _1535 * 0.693147182464599609375;
    float _1557 = fma(_1521, _1551, -0.212114393711090087890625);
    float2 _4704 = float2(_1513, _1541);
    float _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4704, float2(0.0), isnan(_4704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4704, float2(0.0), isnan(_4704)), level(0.0)).x;
    float _1561 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = fma(_1521, _1557, 1.570728778839111328125);
    float _1565 = _1537 * _1545;
    float _1567 = _1543 * _1545;
    float _1569 = fma(_1565, 0.5, 0.5);
    float _1571 = fma(_1567, -0.5, 0.5);
    float _1573 = _1553 * 0.636619746685028076171875;
    float3 _4736 = float3(_1569, _1571, _1561);
    float _1575 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4736, float3(0.0), isnan(_4736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4736, float3(0.0), isnan(_4736)), level(0.0)).x;
    float _1577 = -_1563;
    float _1579 = fma(_1573, _1577, 1.0);
    float _1581 = fma(_1549, 0.5, 0.5);
    float3 _4754 = float3(_1569, _1571, _1561);
    float4 _1583 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4754, float3(0.0), isnan(_4754)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4754, float3(0.0), isnan(_4754)), level(0.0)).xyzw;
    float _1585 = _1583.x;
    float _1587 = _1583.y;
    float _1589 = _1583.z;
    float _1591 = _1583.w;
    float2 _4770 = float2(_1579, _1581);
    float3 _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4770, float2(0.0), isnan(_4770)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4770, float2(0.0), isnan(_4770)), level(0.0)).xyz;
    float _1597 = _1595.x;
    float _1599 = _1595.y;
    float _1601 = _1595.z;
    float _1603 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1607 = _233 + _1605;
    float _1609 = -_911;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _841);
    float _1613 = _1603 * _167;
    bool _1615 = _437 > 0.5;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1619 = _1617 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1623 = _1621 != 0;
    uint _1625 = uint(int(uint(_205) >> uint(2)));
    uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
    int _1629 = int(_1625) & 3;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[int(_1627)][_1629];
    int _1633 = int(_1625) + 1;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    int _1637 = _1633 & 3;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[int(_1635)][_1637];
    float _1641 = trunc(_1613);
    int _1643 = int(_1641);
    bool _1645 = _167 > 0.5;
    bool _1647 = _1645 && _1623;
    float _1649 = in.m_65.x;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1655 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1657 = isnan(_233);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1663 = _1659 || _1661;
    float _1665 = float(_1663);
    int _1667 = _205 + 8;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[int(_1671)][_1673];
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1679 = _1677 != 0;
    float _1681 = 1.0 / _1619;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1683;
    float _1687 = in.m_65.y;
    bool _1689 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1691 = isnan(_233);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = -_1665;
    float _1703 = _1701 + 1.0;
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1709 = -_405;
    float _1711 = _1709 + _427;
    int _1713 = _1643 << 4;
    int _1715 = _1713 + 1968;
    float _1717 = 1.0 / _1653;
    float _1719 = _1699 * _1703;
    float _1721 = -_1699;
    float _1723 = _1721 + 1.0;
    uint _1725 = uint(int(uint(_1715) >> uint(2)));
    uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
    int _1729 = int(_1725) & 3;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[int(_1727)][_1729];
    int _1733 = int(_1725) + 1;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    int _1737 = _1733 & 3;
    float _1739 = (*spvDescriptorSet0.vp_c9)._m0[int(_1735)][_1737];
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1745 = fma(_739, _1711, _405);
    float _1747 = _1685 * _1681;
    float _1749 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1751 = 1.0 / _1743;
    int _1753 = _1715 + 8;
    uint _1755 = uint(int(uint(_1753) >> uint(2)));
    uint _1757 = uint(int(uint(int(_1755)) >> uint(2)));
    int _1759 = int(_1755) & 3;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[int(_1757)][_1759];
    float _1763 = fma(_1747, _1607, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1765;
    out.m_67.w = _1745;
    float _1769 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1749);
    float _1771 = _1707 * _1717;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1775 = _233 + _1773;
    bool _1777 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1779 = isnan(_233);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1785 = _1781 || _1783;
    float _1787 = float(_1785);
    float _1789 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1769);
    float _1791 = _1787 * _1723;
    float _1793 = -_1787;
    float _1795 = _1793 + 1.0;
    float _1797 = fma(_1771, _1775, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1799 = _1771;
    float _1801 = _1649;
    float _1803 = _1517;
    float _1805 = _1543;
    float _1807 = _1537;
    if (_1623)
    {
        _1799 = _1649;
    }
    float _1809 = _1799;
    float _1811 = _1763 * _1791;
    float _1813 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1815 = _1767 * _1751;
    bool _1817 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1819 = isnan(_233);
    bool _1821 = _1817 || _1819;
    bool _1823 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1825 = _1821 || _1823;
    float _1827 = float(_1825);
    float _1829 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1811);
    float _1831 = _1809;
    float _1833 = _1687;
    if (_1647)
    {
        float _1835 = -_1809;
        float _1837 = _1835 + 1.0;
        _1831 = _1837;
    }
    float _1839 = _1831;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1843 = _233 + _1841;
    float _1845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1847 = fma(_1797, _1719, _1829);
    float _1849 = -_1687;
    float _1851 = _1849 + 1.0;
    if (_1623)
    {
        _1801 = _1839;
    }
    float _1853 = _1801;
    float _1855 = fma(_1815, _1843, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1857 = -_1827;
    float _1859 = _1857 + 1.0;
    float _1861 = _1639 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_1679)
    {
        float _1863 = _1615 ? _1851 : _1687;
        _1833 = _1863;
    }
    float _1865 = _1833;
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1869 = _1665 * _1859;
    float _1871 = _1853 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1873 = _1001 != 0.0;
    bool _1875 = isnan(_1001);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(0.0);
    bool _1881 = _1877 || _1879;
    float _1883 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1885 = fma(_1855, _1869, _1847);
    bool _1887 = _999 == 0.0;
    bool _1889 = !_1881;
    bool _1891 = _1887 && _1889;
    float _1893 = _1731 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1895 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1897 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1899 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1903 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1905 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1907 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1909 = _1761 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1911 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1903);
    float _1913 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1905);
    float _1915 = _1883 * _1845;
    float _1917 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1919 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1911);
    float _1921 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1923 = _1871 * _1867;
    float _1925 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1885);
    float _1927 = _1919 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1929 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1931 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_69.x = _1901;
    out.m_69.y = _1907;
    out.m_69.z = _1917;
    float _1933 = 1.0 / _1927;
    float _1935 = _1929 + _1927;
    float _1937 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1939 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1941 = _1003 == 0.0;
    bool _1943 = _1941 && _1891;
    out.m_71.x = _1923;
    out.m_71.y = _1915;
    out.m_73.x = _1895;
    out.m_73.y = _1899;
    out.m_73.z = _1937;
    out.m_73.w = _1939;
    float _1945 = _1935 * _1933;
    float _1947 = _1945 * 0.5;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1951 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1949);
    float _1953 = 1.0 / _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1957 = _1953 * _1955;
    float _1959 = abs(_1957);
    float _1961 = log2(_1959);
    bool _1963 = _1957 <= 8000.0;
    bool _1965 = isnan(_1957);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(8000.0);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1977 = in.m_75.x;
    float _1979 = in.m_75.y;
    float _1981 = in.m_75.z;
    float _1983 = exp2(_1975);
    float _1985 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = fma(_1987, -2.0, 3.0);
    float _1991 = _1987 * _1987;
    float _1993 = _1981;
    float _1995 = _1979;
    float _1997 = _1977;
    if (!_1943)
    {
        float _1999 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1981);
        _1993 = _1999;
    }
    float _2001 = _1993;
    float _2003 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1943)
    {
        float _2005 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _1995 = _2005;
    }
    float _2007 = _1995;
    float _2009 = _1991 * _1989;
    if (!_1943)
    {
        float _2011 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _1997 = _2011;
    }
    float _2013 = _1997;
    bool _2015 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2017 = isnan(_1277);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2023 = _2019 || _2021;
    float _2025 = _1107 * _2007;
    float _2027 = -_2009;
    float _2029 = _2027 + 1.0;
    float _2031 = exp2(_2003);
    float _2033 = _1151 * _2007;
    float _2035 = _1097 * _2007;
    float _2037 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2009);
    float _2039 = fma(_1111, _2013, _2025);
    float _2041 = in.m_77.x;
    float _2043 = fma(_1161, _2013, _2033);
    float _2045 = _1973 * _2037;
    float _2047 = fma(_1099, _2013, _2035);
    float _2049 = fma(_1121, _2001, _2039);
    float _2051 = fma(_1167, _2001, _2043);
    float _2053 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2055 = fma(_1101, _2001, _2047);
    float _2057 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1789);
    float _2059 = -_2031;
    float _2061 = _2059 + 1.0;
    out.m_79.x = _2049;
    out.m_79.y = _2051;
    out.m_79.z = _2055;
    float _2063 = _2057 + _1517;
    float _2065 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1537;
    out.gl_Position.y = _1543;
    out.gl_Position.z = _2057;
    out.gl_Position.w = _1517;
    float _2067 = _2063 * 0.5;
    out.m_81.z = _2067;
    out.m_81.w = _1517;
    float _2069 = _1517;
    float _2071 = _2067;
    float _2073 = _2057;
    if (!_2023)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2075 = _1803;
    float _2077 = _2075;
    float _2079 = _2075;
    if (!_2023)
    {
        _2069 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2081 = _2069;
    float _2083 = _2081;
    float _2085 = _2081;
    if (!_2023)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2087 = _2071;
    float _2089 = _2087;
    float _2091 = _2087;
    if (!_2023)
    {
        _2073 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2093 = _2073;
    float _2095 = _2093;
    float _2097 = _2093;
    if (!_2023)
    {
        _1805 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2099 = _1805;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2023)
    {
        _1807 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2105 = _1807;
    float _2107 = -_1559;
    float _2109 = _2107 + 1.0;
    float _2111 = _2109 * _2053;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = -_2113;
    float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2119 = _2117 * _2041;
    float _2121 = _2065 * _1575;
    float _2123 = -_2065;
    float _2125 = _2123 + 1.0;
    float _2127 = _2119 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2129 = _1591 * _2121;
    float _2131 = _1591 * _2125;
    out.m_83.x = _2127;
    float _2133 = _1601 * _2121;
    float _2135 = fma(_1597, _2129, _1585);
    float _2137 = fma(_1599, _2129, _1587);
    float _2139 = fma(_1591, _2133, _1589);
    out.m_85.x = _2135;
    out.m_85.y = _2137;
    out.m_85.z = _2139;
    out.m_85.w = _2131;
    bool _2141 = !_2023;
    float _2143 = _2105;
    float _2145 = _2105;
    if (!_2141)
    {
        bool _2147 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2149 = isnan(_1277);
        bool _2151 = _2147 || _2149;
        bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2155 = _2151 || _2153;
        if (!_2155)
        {
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2159 = _1277 + _2157;
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2163 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2169 = 1.0 / _2163;
            float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2187 = _2159 * _2169;
            float _2189 = precise::clamp(_2187, 0.0, 1.0);
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2195 = fma(_2189, _2167, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2197 = fma(_2189, _2193, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2199 = fma(_2189, _2173, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2201 = fma(_2189, _2177, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2203 = fma(_2189, _2181, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2205 = fma(_2189, _2185, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2091 = _2199;
            _2103 = _2203;
            _2085 = _2195;
            _2097 = _2201;
            _2079 = _2197;
            _2145 = _2205;
            _2207 = true;
        }
        else
        {
            bool _2209 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2211 = isnan(_1277);
            bool _2213 = _2209 || _2211;
            bool _2215 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2217 = _2213 || _2215;
            if (!_2217)
            {
                _2083 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2219 = _2083;
            _2085 = _2219;
            if (!_2217)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2221 = _2089;
            _2091 = _2221;
            if (!_2217)
            {
                _2077 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2223 = _2077;
            _2079 = _2223;
            if (!_2217)
            {
                _2095 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2225 = _2095;
            _2097 = _2225;
            if (!_2217)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2227 = _2101;
            _2103 = _2227;
            if (!_2217)
            {
                _2143 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2229 = _2143;
            bool _2231 = !_2217;
            _2145 = _2229;
            if (!_2231)
            {
                bool _2233 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2235 = isnan(_1277);
                bool _2237 = _2233 || _2235;
                bool _2239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2241 = _2237 || _2239;
                if (!_2241)
                {
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2245 = _1277 + _2243;
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2249 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2247;
                    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2255 = 1.0 / _2249;
                    float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2273 = _2245 * _2255;
                    float _2275 = precise::clamp(_2273, 0.0, 1.0);
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2281 = fma(_2275, _2253, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2283 = fma(_2275, _2279, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2285 = fma(_2275, _2259, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2287 = fma(_2275, _2263, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2289 = fma(_2275, _2267, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2291 = fma(_2275, _2271, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2091 = _2285;
                    _2103 = _2289;
                    _2085 = _2281;
                    _2097 = _2287;
                    _2079 = _2283;
                    _2145 = _2291;
                    _2207 = true;
                }
                else
                {
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2085 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2097 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2079 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2145 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2207 = false;
    float _2293 = _2091;
    float _2295 = _2103;
    float _2297 = _2085;
    float _2299 = _2097;
    float _2301 = _2079;
    float _2303 = _2145;
    float _2305 = fma(_2051, -0.5, 0.5);
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = -_2293;
    float _2311 = _2309 + _2295;
    float _2313 = -_2297;
    float _2315 = _2313 + _2299;
    float _2317 = -_2301;
    float _2319 = _2317 + _2303;
    bool _2321 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2323 = fma(_2307, _2311, _2293);
    float _2325 = fma(_2307, _2315, _2297);
    float _2327 = fma(_2307, _2319, _2301);
    float _2329 = _2323 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2331 = fma(_2325, 0.298911988735198974609375, _2329);
    float _2333 = fma(_2327, 0.114477999508380889892578125, _2331);
    out.m_87.x = 0.0;
    float _2335 = -_2333;
    float _2337 = _2325 + _2335;
    float _2339 = -_2333;
    float _2341 = _2323 + _2339;
    float _2343 = -_2333;
    float _2345 = _2327 + _2343;
    float _2347 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2349 = fma(_2337, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2333);
    float _2351 = fma(_2341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2333);
    float _2353 = fma(_2345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2333);
    out.m_83.w = _2347;
    out.m_89.x = _2349;
    out.m_89.y = _2351;
    out.m_89.z = _2353;
    if (!_2321)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2355 = -_1237;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2359 = -_1241;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2363 = -_1245;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2367 = _2357 * _2357;
    float _2369 = fma(_2361, _2361, _2367);
    float _2371 = fma(_2365, _2365, _2369);
    float _2373 = sqrt(_2371);
    float _2375 = rsqrt(_2371);
    float _2377 = -_2373;
    float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2381 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2383 = precise::clamp(_2381, 0.0, 1.0);
    float _2385 = _2361 * _2375;
    float _2387 = _2357 * _2375;
    float _2389 = abs(_2383);
    float _2391 = log2(_2389);
    float _2393 = _2365 * _2375;
    float _2395 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2397 = _2051 * _2387;
    float _2399 = -_2387;
    float _2401 = -_2395;
    float _2403 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2401);
    float _2405 = fma(_2049, _2385, _2397);
    float _2407 = -_2393;
    float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2403);
    float _2411 = fma(_2055, _2393, _2405);
    float _2413 = precise::clamp(_2411, 0.0, 1.0);
    float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2417 = _2409 + _2415;
    float _2419 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2421 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2423 = precise::clamp(_2421, 0.0, 1.0);
    float _2425 = exp2(_2419);
    float _2427 = _2425 * _2423;
    float _2429 = _2413 * _2427;
    float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2433 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2435 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2431;
    out.m_87.y = _2433;
    out.m_87.z = _2435;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2207 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _111 = int(_109);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2492 = as_type<float>(_127);
        out.gl_Position.z = _2492;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2561 = as_type<float>(_165);
        out.gl_Position.z = _2561;
    }
    if (_159)
    {
        return out;
    }
    float _167 = in.m_55.x;
    float _169 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = _169 * _167;
    float _181 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = trunc(_179);
    int _187 = int(_185);
    float _189 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _191 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _197 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    int _203 = _187 << 4;
    int _205 = _203 + 1712;
    bool _207 = !_171;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _211 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_111);
        float _229 = 1.0 / _227;
        float _231 = _145 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    int _235 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _237 = _235;
    int _239 = 0;
    int _241 = _102(_237, _239, (*spvDescriptorSet0.support_buffer));
    int _243 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _245 = _243;
    int _247 = 0;
    int _249 = _102(_245, _247, (*spvDescriptorSet0.support_buffer));
    float _251 = in.m_59.w;
    float _253 = trunc(_251);
    int _255 = int(_253);
    int _257 = abs(_255);
    uint _260 = uint(int(uint(_255) >> uint(31)));
    float _262 = float(uint(_257));
    int _264 = ~int(_260);
    int _266 = _264 + 1;
    float _268 = float(_249);
    float _270 = float(_241);
    float _272 = trunc(_268);
    int _274 = int(_272);
    int _276 = abs(_274);
    bool _278 = _274 == 0;
    float _280 = float(uint(_276));
    int _282 = ~_276;
    int _284 = _282 + 1;
    int _286 = ~_276;
    int _288 = _286 + 1;
    float _290 = 1.0 / _280;
    int _292 = as_type<int>(_290) + (-2);
    float _294 = as_type<float>(_292) * _262;
    float _296 = _270 + 9.9999997473787516355514526367188e-06;
    float _298 = trunc(_294);
    float _300 = precise::max(_298, 0.0);
    uint _302 = uint(_300);
    float _304 = 1.0 / _296;
    int _306 = _284 * int(_302);
    int _308 = _306 + _257;
    float _310 = float(uint(_308));
    float _312 = _145 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _314 = as_type<float>(_292) * _310;
    float _316 = fma(_312, _304, _167);
    float _318 = _270 + (-1.0);
    float _320 = floor(_316);
    float _322 = trunc(_314);
    float _324 = precise::max(_322, 0.0);
    uint _326 = uint(_324);
    float _328 = -_320;
    float _330 = _316 + _328;
    float _332 = trunc(_318);
    int _334 = int(_332);
    float _336 = _270 * _330;
    int _338 = int(_302) + int(_326);
    float _340 = trunc(_336);
    int _342 = int(_340);
    int _344 = _288 * _338;
    int _346 = _344 + _257;
    bool _348 = uint(_346) >= uint(_276);
    bool _350 = !_348;
    int _352 = _350 ? 0 : (-1);
    int _354 = ~_338;
    int _356 = _354 + _352;
    int _358 = _356 + 1;
    bool _360 = _342 >= _334;
    int _362 = _342 + 1;
    int _364 = _276 * _358;
    int _366 = _364 + _257;
    bool _368 = !_360;
    int _370 = _368 ? _362 : 0;
    int _372 = _366 ^ _266;
    int _374 = ~_266;
    int _376 = _374 + _372;
    int _378 = _376 + 1;
    bool _380 = !_278;
    int _382 = _380 ? _378 : (-1);
    int _384 = _342;
    int _386 = 0;
    int _388 = _103(_384, _386, (*spvDescriptorSet0.support_buffer));
    int _390 = _382;
    int _392 = 0;
    int _394 = _103(_390, _392, (*spvDescriptorSet0.support_buffer));
    float4 _397 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_388, _394)), 0).xyzw;
    float _399 = _397.x;
    float _401 = _397.y;
    float _403 = _397.z;
    float _405 = _397.w;
    int _407 = _370;
    int _409 = 0;
    int _411 = _103(_407, _409, (*spvDescriptorSet0.support_buffer));
    int _413 = _382;
    int _415 = 0;
    int _417 = _103(_413, _415, (*spvDescriptorSet0.support_buffer));
    float4 _419 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_411, _417)), 0).xyzw;
    float _421 = _419.x;
    float _423 = _419.y;
    float _425 = _419.z;
    float _427 = _419.w;
    float _429 = in.m_55.z;
    float _431 = _167 * 2.0;
    float _433 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _435 = log2(_433);
    float _437 = in.m_55.y;
    float _439 = floor(_431);
    float _441 = _435 * _145;
    float _443 = exp2(_441);
    float _445 = _429 * 2.0;
    bool _447 = _439 > 0.0;
    bool _449 = _439 >= 0.0;
    bool _451 = isnan(_439);
    bool _453 = _449 || _451;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    float _459 = _437 + _429;
    float _461 = floor(_445);
    float _463 = _437 * 2.0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = _459 + (-1.0);
    int _479 = _457 ? 0 : 1;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _483 = 1.0 + _481;
    bool _485 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _493 = _489 || _491;
    float _495 = floor(_463);
    float _497 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _499 = ~_479;
    int _501 = _499 + 1;
    int _503 = _501 + 1;
    float _505 = -_443;
    float _507 = _505 + 1.0;
    int _509 = _503;
    if (!_447)
    {
        int _511 = ~_479;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = in.m_59.x;
    float _519 = in.m_59.y;
    float _521 = in.m_59.z;
    bool _523 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _525 = isnan(1.0);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _531 = _527 || _529;
    float _533 = 1.0 / _483;
    bool _535 = _461 > 0.0;
    bool _537 = _461 >= 0.0;
    bool _539 = isnan(_461);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    bool _547 = !_471;
    int _549 = _547 ? 0 : 1;
    float _551 = float(_515);
    int _553 = abs(_549);
    int _555 = _545 ? 0 : 1;
    float _557 = float(_553);
    bool _559 = !_467;
    int _561 = _559 ? 0 : 1;
    bool _563 = _495 > 0.0;
    float _565 = _557 * _551;
    float _567 = _493 ? _507 : 0.0;
    int _569 = ~_555;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    bool _575 = _495 >= 0.0;
    bool _577 = isnan(_495);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _565 * (-2.0);
    int _587 = _573;
    if (!_535)
    {
        int _589 = ~_555;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    if (_531)
    {
        float _595 = _567 * _533;
        _149 = _595;
    }
    float _597 = _149;
    int _599 = abs(_561);
    float _601 = _437 + (-0.5);
    float _603 = fma(_585, _519, _519);
    int _605 = _583 ? 0 : 1;
    float _607 = fma(_497, _585, _497);
    float _609 = float(_599);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].y, _603);
    bool _613 = !_475;
    int _615 = _613 ? 0 : 1;
    float _617 = _167 + _437;
    float _619 = float(_593);
    float _621 = fma(_607, _597, _611);
    int _623 = ~_605;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    float _629 = _617 + (-1.0);
    int _631 = abs(_615);
    float _633 = _609 * _619;
    int _635 = _627;
    if (!_563)
    {
        int _637 = ~_605;
        int _639 = _637 + 1;
        _635 = _639;
    }
    int _641 = _635;
    float _643 = _621 * 0.15915493667125701904296875;
    float _645 = float(_631);
    float _647 = _633 * (-2.0);
    float _649 = float(_641);
    float _651 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _653 = _167 + (-0.5);
    float _655 = fma(_647, _517, _517);
    float _657 = _167 + _429;
    float _659 = _645 * _649;
    float _661 = fma(_651, _647, _651);
    float _663 = _657 + (-1.0);
    float _665 = _659 * (-2.0);
    float _667 = _429 + (-0.5);
    float _669 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].x, _655);
    float _671 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _673 = fma(_665, _521, _521);
    float _675 = _643 * 6.283185482025146484375;
    float _677 = sin(_675);
    float _679 = fma(_661, _597, _669);
    float _681 = fma(_671, _665, _671);
    float _683 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[196].z, _673);
    float _685 = _679 * 0.15915493667125701904296875;
    float _687 = fma(_681, _597, _683);
    float _689 = _643 * 6.283185482025146484375;
    float _691 = cos(_689);
    float _693 = _687 * 0.15915493667125701904296875;
    float _695 = _685 * 6.283185482025146484375;
    float _697 = sin(_695);
    float _699 = _685 * 6.283185482025146484375;
    float _701 = cos(_699);
    float _703 = _693 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = _697 * _677;
    float _709 = _697 * _691;
    float _711 = _693 * 6.283185482025146484375;
    float _713 = sin(_711);
    float _715 = _701 * _691;
    float _717 = _701 * _677;
    float _719 = floor(_336);
    float _721 = _691 * _705;
    float _723 = _697 * _705;
    float _725 = _701 * _705;
    float _727 = _677 * _705;
    float _729 = fma(_713, _715, _707);
    float _731 = fma(_713, _707, _715);
    float _733 = -_717;
    float _735 = fma(_713, _709, _733);
    float _737 = -_719;
    float _739 = _336 + _737;
    float _741 = -_709;
    float _743 = fma(_713, _717, _741);
    float _745 = -_401;
    float _747 = _745 + _423;
    float _749 = -_399;
    float _751 = _749 + _421;
    float _753 = -_403;
    float _755 = _753 + _425;
    float _757 = _747 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _759 = _751 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _761 = _755 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _763 = in.m_48.x;
    float _765 = in.m_48.y;
    float _767 = in.m_48.z;
    float _769 = _757 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _771 = _757 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _773 = _757 * _757;
    float _775 = _757 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _777 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[5].x, _769);
    float _779 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[4].x, _771);
    float _781 = fma(_759, _759, _773);
    float _783 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[6].x, _775);
    float _785 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[5].z, _777);
    float _787 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[4].z, _779);
    float _789 = fma(_761, _761, _781);
    float _791 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[6].z, _783);
    float _793 = _785 * _785;
    float _795 = fma(_739, _747, _401);
    float _797 = fma(_739, _751, _399);
    float _799 = fma(_739, _755, _403);
    float _801 = fma(_787, _787, _793);
    float _803 = sqrt(_789);
    float _805 = _795 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _807 = _795 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _809 = fma(_791, _791, _801);
    float _811 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[5].x, _805);
    float _813 = _765 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _815 = _765 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _817 = rsqrt(_809);
    float _819 = _765 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _821 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[5].x, _813);
    float _823 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[4].x, _815);
    float _825 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].z, _811);
    float _827 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[6].x, _819);
    float _829 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[5].z, _821);
    float _831 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[4].z, _823);
    float _833 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[6].x, _807);
    float _835 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[6].z, _827);
    float _837 = _829 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _839 = _835 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _841 = _837 + _825;
    float _843 = _803 * _817;
    float _845 = fma(_785, _843, _199);
    float _847 = fma(_787, _843, _197);
    float _849 = fma(_791, _843, _201);
    float _851 = _795 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _853 = _845 * _845;
    float _855 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].z, _833);
    float _857 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[4].x, _851);
    float _859 = fma(_847, _847, _853);
    float _861 = _831 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _863 = _839 + _855;
    float _865 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].z, _857);
    float _867 = fma(_849, _849, _859);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _871 = _863 + _869;
    float _873 = _861 + _865;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _877 = _841 + _875;
    float _879 = rsqrt(_867);
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _883 = _873 + _881;
    float _885 = _877 * _877;
    float _887 = fma(_883, _883, _885);
    float _889 = fma(_871, _871, _887);
    float _891 = rsqrt(_889);
    float _893 = _845 * _879;
    float _895 = _847 * _879;
    float _897 = _849 * _879;
    float _899 = _893 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _901 = _725 * _893;
    float _903 = _725 * _897;
    float _905 = _743 * _897;
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[8].y, _899);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[10].y, _907);
    float _911 = _877 * _891;
    float _913 = _883 * _891;
    float _915 = _871 * _891;
    float _917 = abs(_909);
    bool _919 = _917 > 0.99989998340606689453125;
    float _921 = -_911;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _925 = -_913;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _883);
    float _929 = -_915;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _871);
    float _933 = _923 * _923;
    float _935 = fma(_927, _927, _933);
    float _937 = _879;
    float _939 = _837;
    float _941 = _909;
    float _943 = _831;
    float _945 = _897;
    float _947 = _743;
    if (_919)
    {
        _937 = 0.001000000047497451305389404296875;
    }
    float _949 = _937;
    if (!_919)
    {
        _939 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _951 = _939;
    float _953 = _951;
    if (!_919)
    {
        _941 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _955 = _941;
    float _957 = _955;
    if (_919)
    {
        float _959 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _953 = _959;
    }
    float _961 = _953;
    if (_919)
    {
        float _963 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _957 = _963;
    }
    float _965 = _957;
    float _967 = fma(_931, _931, _935);
    if (!_919)
    {
        _943 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _969 = _943;
    float _971 = -_961;
    float _973 = _897 * _971;
    float _975 = _969;
    if (_919)
    {
        float _977 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _975 = _977;
    }
    float _979 = _975;
    float _981 = in.m_61.x;
    float _983 = in.m_61.y;
    float _985 = in.m_61.z;
    float _987 = -_965;
    float _989 = _893 * _987;
    float _991 = -_965;
    float _993 = -_973;
    float _995 = fma(_895, _991, _993);
    float _997 = sqrt(_967);
    float _999 = in.m_63.x;
    float _1001 = in.m_63.y;
    float _1003 = in.m_63.z;
    float _1005 = -_979;
    float _1007 = -_989;
    float _1009 = fma(_897, _1005, _1007);
    float _1011 = -_979;
    float _1013 = _895 * _1011;
    float _1015 = _995 * _995;
    float _1017 = -_961;
    float _1019 = -_1013;
    float _1021 = fma(_893, _1017, _1019);
    float _1023 = fma(_1009, _1009, _1015);
    float _1025 = fma(_1021, _1021, _1023);
    float _1027 = rsqrt(_1025);
    float _1029 = _891 * _997;
    float _1031 = _985 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1033 = _981 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1035 = _983 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1037 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1041 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1003);
    float _1045 = _1037 * _1029;
    float _1047 = _1039 * _1029;
    float _1049 = _1041 * _1029;
    float _1051 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _999);
    float _1053 = _995 * _1027;
    float _1055 = _1045 * _1043;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1001);
    float _1059 = _1009 * _1027;
    float _1061 = _1047 * _1051;
    float _1063 = _725 * _895;
    float _1065 = _895 * _1053;
    float _1067 = _1021 * _1027;
    float _1069 = _1049 * _1057;
    float _1071 = _729 * _897;
    float _1073 = -_713;
    float _1075 = fma(_1073, _1059, _1063);
    float _1077 = -_1065;
    float _1079 = fma(_893, _1059, _1077);
    float _1081 = _893 * _1067;
    float _1083 = -_713;
    float _1085 = fma(_1083, _1067, _903);
    float _1087 = _729 * _895;
    float _1089 = fma(_721, _1067, _1071);
    float _1091 = fma(_727, _1067, _905);
    float _1093 = -_1081;
    float _1095 = fma(_897, _1053, _1093);
    float _1097 = fma(_723, _1079, _1085);
    float _1099 = fma(_735, _1079, _1089);
    float _1101 = fma(_731, _1079, _1091);
    float _1103 = fma(_721, _1059, _1087);
    float _1105 = _743 * _895;
    float _1107 = fma(_723, _1095, _1075);
    float _1109 = _1069 * _1097;
    float _1111 = fma(_735, _1095, _1103);
    float _1113 = fma(_727, _1059, _1105);
    float _1115 = _1069 * _1107;
    float _1117 = fma(_1061, _1099, _1109);
    float _1119 = _897 * _1059;
    float _1121 = fma(_731, _1095, _1113);
    float _1123 = fma(_1061, _1111, _1115);
    float _1125 = fma(_1055, _1101, _1117);
    float _1127 = -_713;
    float _1129 = fma(_1127, _1053, _901);
    float _1131 = _729 * _893;
    float _1133 = fma(_1055, _1121, _1123);
    float _1135 = _863 + _1125;
    float _1137 = -_1119;
    float _1139 = fma(_895, _1067, _1137);
    float _1141 = _743 * _893;
    float _1143 = _873 + _1133;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1147 = _1135 + _1145;
    float _1149 = fma(_721, _1053, _1131);
    float _1151 = fma(_723, _1139, _1129);
    float _1153 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1155 = _1143 + _1153;
    float _1157 = _1147 * _1147;
    float _1159 = fma(_727, _1053, _1141);
    float _1161 = fma(_735, _1139, _1149);
    float _1163 = _1069 * _1151;
    float _1165 = fma(_1155, _1155, _1157);
    float _1167 = fma(_731, _1139, _1159);
    float _1169 = fma(_1061, _1161, _1163);
    float _1171 = sqrt(_1165);
    float _1173 = fma(_1055, _1167, _1169);
    float _1175 = _841 + _1173;
    bool _1177 = _1171 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1179 = _1143;
    float _1181 = _1135;
    float _1183 = _1061;
    if (!_1177)
    {
        _945 = _1175;
    }
    float _1185 = _945;
    bool _1187 = !_1177;
    float _1189 = _1185;
    if (!_1187)
    {
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1195 = _1171 + _1193;
        float _1197 = rsqrt(_1165);
        float _1199 = _1195 * _1191;
        float _1201 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1203 = _1199 * 0.15915493667125701904296875;
        float _1205 = _1203 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = _1203 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = _1207 + (-1.0);
        float _1215 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = fma(_1211, _1201, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1219 = fma(_1175, _1207, _1215);
        float _1221 = _1197 * _1217;
        float _1223 = fma(_1155, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = fma(_1147, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1189 = _1219;
        _1179 = _1223;
        _1181 = _1225;
        _1183 = _1203;
    }
    float _1227 = _1189;
    float _1229 = _1179;
    float _1231 = _1181;
    float _1233 = _1183;
    float _1235 = -_911;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1227);
    float _1239 = -_913;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1229);
    float _1243 = -_915;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1231);
    float _1247 = -_913;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1253 = _1237 + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1257 = _1241 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1261 = _1245 + _1259;
    float _1263 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1265 = _1253 * _1253;
    float _1267 = -_915;
    float _1269 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _1271 = fma(_1257, _1257, _1265);
    float _1273 = fma(_1261, _1261, _1271);
    float _1275 = rsqrt(_1273);
    float _1277 = sqrt(_1273);
    float _1279 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1281 = _1257 * _1279;
    float _1283 = _1261 * _1279;
    float _1285 = _1281 * _1281;
    float _1287 = _1283 * _1283;
    float _1289 = _1285 + _1287;
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1297 = _1291 + _1295;
    float _1299 = _1233;
    float _1301 = _1289;
    float _1303 = _1297;
    float _1305 = _1253;
    float _1307 = _1283;
    float _1309 = _1287;
    if (_1293)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1299 = _1311;
    }
    float _1313 = _1299;
    if (_1293)
    {
        float _1315 = rsqrt(_1289);
        _1301 = _1315;
    }
    float _1317 = _1301;
    if (_1293)
    {
        float _1319 = _1297 * _1313;
        _1303 = _1319;
    }
    float _1321 = _1303;
    if (_1293)
    {
        float _1323 = _1321 * 0.15915493667125701904296875;
        _947 = _1323;
    }
    float _1325 = _947;
    float _1327 = _1271;
    float _1329 = _1325;
    if (_1293)
    {
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        _1327 = _1333;
    }
    float _1335 = _1327;
    float _1337 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1339 = precise::max(0.0, _1337);
    float _1341 = _1175;
    float _1343 = _1339;
    float _1345 = _1337;
    if (_1293)
    {
        float _1347 = _1325 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        _1341 = _1349;
    }
    float _1351 = _1341;
    float _1353 = -_1279;
    float _1355 = -_1339;
    float _1357 = fma(_1253, _1353, _1355);
    if (!_1293)
    {
        _1305 = _1281;
    }
    float _1359 = _1305;
    float _1361 = _1359;
    if (_1293)
    {
        float _1363 = _1357 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1343 = _1363;
    }
    float _1365 = _1343;
    float _1367 = _1365;
    float _1369 = _1335;
    if (_1293)
    {
        float _1371 = fma(_1335, _1365, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1367 = _1371;
    }
    float _1373 = _1367;
    if (!_1293)
    {
        _1369 = _1357;
    }
    float _1375 = _1369;
    float _1377 = _1375;
    float _1379 = _1351;
    if (_1293)
    {
        float _1381 = _1351 + (-1.0);
        _1345 = _1381;
    }
    float _1383 = _1345;
    float _1385 = _1383;
    if (_1293)
    {
        float _1387 = _1317 * _1373;
        _1329 = _1387;
    }
    float _1389 = _1329;
    float _1391 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1293)
    {
        float _1393 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1393;
    }
    float _1395 = _1385;
    if (_1293)
    {
        float _1397 = _1281 * _1389;
        _1361 = _1397;
    }
    float _1399 = _1361;
    if (_1293)
    {
        float _1401 = _1283 * _1389;
        _1307 = _1401;
    }
    float _1403 = _1307;
    float _1405 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1263);
    if (_1293)
    {
        float _1407 = fma(_1357, _1351, _1395);
        _1377 = _1407;
    }
    float _1409 = _1377;
    if (!_1293)
    {
        _1379 = _1285;
    }
    float _1411 = _1379;
    float _1413 = _1411;
    if (_1293)
    {
        float _1415 = _1399 * _1399;
        _1413 = _1415;
    }
    float _1417 = _1413;
    if (_1293)
    {
        float _1419 = _1403 * _1403;
        _1309 = _1419;
    }
    float _1421 = _1309;
    float _1423 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1405);
    float _1425 = fma(_1409, _1409, _1417);
    float _1427 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1431 = _1425 + _1421;
    float _1433 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1437 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1435);
    float _1439 = precise::clamp(_1437, 0.0, 1.0);
    float _1441 = rsqrt(_1431);
    float _1443 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1433);
    float _1445 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1449 = -_1439;
    float _1451 = _1449 + 1.0;
    float _1453 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1455 = abs(_1451);
    float _1457 = log2(_1455);
    float _1459 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1461 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1463 = fma(_1269, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1465 = -_1459;
    float _1467 = fma(_1465, _1447, 1.0);
    float _1469 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1461);
    float _1471 = _1441 * _1399;
    float _1473 = floor(_1429);
    float _1475 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1469);
    float _1477 = _1441 * _1409;
    float _1479 = _1441 * _1403;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1483 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1427);
    float _1485 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1487 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1489 = -_1481;
    float _1491 = fma(_1477, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1489);
    float _1493 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1483);
    float _1495 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1497 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1487);
    float _1499 = -_1479;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1491);
    float _1503 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1505 = floor(_1463);
    float _1507 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1497);
    float _1509 = fma(_1501, -0.5, 0.5);
    float _1511 = -_1473;
    float _1513 = _1429 + _1511;
    float _1515 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1507);
    float _1519 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1521 = fma(_1501, 0.5, 0.5);
    float _1523 = exp2(_1495);
    float _1525 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1515);
    float _1527 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1519);
    float _1529 = _1477 + 1.0;
    float _1531 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1525);
    float _1533 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1527);
    float _1535 = log2(_1467);
    float _1537 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1531);
    float _1539 = -_1505;
    float _1541 = _1463 + _1539;
    float _1543 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1533);
    float _1545 = 1.0 / _1517;
    float _1547 = -_1477;
    float _1549 = fma(_1523, _1529, _1547);
    float _1551 = fma(_1521, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1553 = sqrt(_1509);
    float _1555 = _1535 * 0.693147182464599609375;
    float _1557 = fma(_1521, _1551, -0.212114393711090087890625);
    float2 _4704 = float2(_1513, _1541);
    float _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4704, float2(0.0), isnan(_4704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4704, float2(0.0), isnan(_4704)), level(0.0)).x;
    float _1561 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = fma(_1521, _1557, 1.570728778839111328125);
    float _1565 = _1537 * _1545;
    float _1567 = _1543 * _1545;
    float _1569 = fma(_1565, 0.5, 0.5);
    float _1571 = fma(_1567, -0.5, 0.5);
    float _1573 = _1553 * 0.636619746685028076171875;
    float3 _4736 = float3(_1569, _1571, _1561);
    float _1575 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4736, float3(0.0), isnan(_4736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4736, float3(0.0), isnan(_4736)), level(0.0)).x;
    float _1577 = -_1563;
    float _1579 = fma(_1573, _1577, 1.0);
    float _1581 = fma(_1549, 0.5, 0.5);
    float3 _4754 = float3(_1569, _1571, _1561);
    float4 _1583 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4754, float3(0.0), isnan(_4754)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4754, float3(0.0), isnan(_4754)), level(0.0)).xyzw;
    float _1585 = _1583.x;
    float _1587 = _1583.y;
    float _1589 = _1583.z;
    float _1591 = _1583.w;
    float2 _4770 = float2(_1579, _1581);
    float3 _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4770, float2(0.0), isnan(_4770)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4770, float2(0.0), isnan(_4770)), level(0.0)).xyz;
    float _1597 = _1595.x;
    float _1599 = _1595.y;
    float _1601 = _1595.z;
    float _1603 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1607 = _233 + _1605;
    float _1609 = -_911;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _841);
    float _1613 = _1603 * _167;
    bool _1615 = _437 > 0.5;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1619 = _1617 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1623 = _1621 != 0;
    uint _1625 = uint(int(uint(_205) >> uint(2)));
    uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
    int _1629 = int(_1625) & 3;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[int(_1627)][_1629];
    int _1633 = int(_1625) + 1;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    int _1637 = _1633 & 3;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[int(_1635)][_1637];
    float _1641 = trunc(_1613);
    int _1643 = int(_1641);
    bool _1645 = _167 > 0.5;
    bool _1647 = _1645 && _1623;
    float _1649 = in.m_65.x;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1655 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1657 = isnan(_233);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1663 = _1659 || _1661;
    float _1665 = float(_1663);
    int _1667 = _205 + 8;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[int(_1671)][_1673];
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1679 = _1677 != 0;
    float _1681 = 1.0 / _1619;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1683;
    float _1687 = in.m_65.y;
    bool _1689 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1691 = isnan(_233);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = -_1665;
    float _1703 = _1701 + 1.0;
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1709 = -_405;
    float _1711 = _1709 + _427;
    int _1713 = _1643 << 4;
    int _1715 = _1713 + 1968;
    float _1717 = 1.0 / _1653;
    float _1719 = _1699 * _1703;
    float _1721 = -_1699;
    float _1723 = _1721 + 1.0;
    uint _1725 = uint(int(uint(_1715) >> uint(2)));
    uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
    int _1729 = int(_1725) & 3;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[int(_1727)][_1729];
    int _1733 = int(_1725) + 1;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    int _1737 = _1733 & 3;
    float _1739 = (*spvDescriptorSet0.vp_c9)._m0[int(_1735)][_1737];
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1745 = fma(_739, _1711, _405);
    float _1747 = _1685 * _1681;
    float _1749 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1751 = 1.0 / _1743;
    int _1753 = _1715 + 8;
    uint _1755 = uint(int(uint(_1753) >> uint(2)));
    uint _1757 = uint(int(uint(int(_1755)) >> uint(2)));
    int _1759 = int(_1755) & 3;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[int(_1757)][_1759];
    float _1763 = fma(_1747, _1607, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1765;
    out.m_67.w = _1745;
    float _1769 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1749);
    float _1771 = _1707 * _1717;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1775 = _233 + _1773;
    bool _1777 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1779 = isnan(_233);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1785 = _1781 || _1783;
    float _1787 = float(_1785);
    float _1789 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1769);
    float _1791 = _1787 * _1723;
    float _1793 = -_1787;
    float _1795 = _1793 + 1.0;
    float _1797 = fma(_1771, _1775, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1799 = _1771;
    float _1801 = _1649;
    float _1803 = _1517;
    float _1805 = _1543;
    float _1807 = _1537;
    if (_1623)
    {
        _1799 = _1649;
    }
    float _1809 = _1799;
    float _1811 = _1763 * _1791;
    float _1813 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1815 = _1767 * _1751;
    bool _1817 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1819 = isnan(_233);
    bool _1821 = _1817 || _1819;
    bool _1823 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1825 = _1821 || _1823;
    float _1827 = float(_1825);
    float _1829 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1811);
    float _1831 = _1809;
    float _1833 = _1687;
    if (_1647)
    {
        float _1835 = -_1809;
        float _1837 = _1835 + 1.0;
        _1831 = _1837;
    }
    float _1839 = _1831;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1843 = _233 + _1841;
    float _1845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1847 = fma(_1797, _1719, _1829);
    float _1849 = -_1687;
    float _1851 = _1849 + 1.0;
    if (_1623)
    {
        _1801 = _1839;
    }
    float _1853 = _1801;
    float _1855 = fma(_1815, _1843, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1857 = -_1827;
    float _1859 = _1857 + 1.0;
    float _1861 = _1639 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_1679)
    {
        float _1863 = _1615 ? _1851 : _1687;
        _1833 = _1863;
    }
    float _1865 = _1833;
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1869 = _1665 * _1859;
    float _1871 = _1853 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1873 = _1001 != 0.0;
    bool _1875 = isnan(_1001);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(0.0);
    bool _1881 = _1877 || _1879;
    float _1883 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1885 = fma(_1855, _1869, _1847);
    bool _1887 = _999 == 0.0;
    bool _1889 = !_1881;
    bool _1891 = _1887 && _1889;
    float _1893 = _1731 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1895 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1897 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1899 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1903 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1905 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1907 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1909 = _1761 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1911 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1903);
    float _1913 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1905);
    float _1915 = _1883 * _1845;
    float _1917 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1919 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1911);
    float _1921 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1923 = _1871 * _1867;
    float _1925 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1885);
    float _1927 = _1919 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1929 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1931 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_69.x = _1901;
    out.m_69.y = _1907;
    out.m_69.z = _1917;
    float _1933 = 1.0 / _1927;
    float _1935 = _1929 + _1927;
    float _1937 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1939 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1941 = _1003 == 0.0;
    bool _1943 = _1941 && _1891;
    out.m_71.x = _1923;
    out.m_71.y = _1915;
    out.m_73.x = _1895;
    out.m_73.y = _1899;
    out.m_73.z = _1937;
    out.m_73.w = _1939;
    float _1945 = _1935 * _1933;
    float _1947 = _1945 * 0.5;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1951 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1949);
    float _1953 = 1.0 / _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1957 = _1953 * _1955;
    float _1959 = abs(_1957);
    float _1961 = log2(_1959);
    bool _1963 = _1957 <= 8000.0;
    bool _1965 = isnan(_1957);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(8000.0);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1977 = in.m_75.x;
    float _1979 = in.m_75.y;
    float _1981 = in.m_75.z;
    float _1983 = exp2(_1975);
    float _1985 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = fma(_1987, -2.0, 3.0);
    float _1991 = _1987 * _1987;
    float _1993 = _1981;
    float _1995 = _1979;
    float _1997 = _1977;
    if (!_1943)
    {
        float _1999 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1981);
        _1993 = _1999;
    }
    float _2001 = _1993;
    float _2003 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1943)
    {
        float _2005 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _1995 = _2005;
    }
    float _2007 = _1995;
    float _2009 = _1991 * _1989;
    if (!_1943)
    {
        float _2011 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _1997 = _2011;
    }
    float _2013 = _1997;
    bool _2015 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2017 = isnan(_1277);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2023 = _2019 || _2021;
    float _2025 = _1107 * _2007;
    float _2027 = -_2009;
    float _2029 = _2027 + 1.0;
    float _2031 = exp2(_2003);
    float _2033 = _1151 * _2007;
    float _2035 = _1097 * _2007;
    float _2037 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2009);
    float _2039 = fma(_1111, _2013, _2025);
    float _2041 = in.m_77.x;
    float _2043 = fma(_1161, _2013, _2033);
    float _2045 = _1973 * _2037;
    float _2047 = fma(_1099, _2013, _2035);
    float _2049 = fma(_1121, _2001, _2039);
    float _2051 = fma(_1167, _2001, _2043);
    float _2053 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2055 = fma(_1101, _2001, _2047);
    float _2057 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1789);
    float _2059 = -_2031;
    float _2061 = _2059 + 1.0;
    out.m_79.x = _2049;
    out.m_79.y = _2051;
    out.m_79.z = _2055;
    float _2063 = _2057 + _1517;
    float _2065 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1537;
    out.gl_Position.y = _1543;
    out.gl_Position.z = _2057;
    out.gl_Position.w = _1517;
    float _2067 = _2063 * 0.5;
    out.m_81.z = _2067;
    out.m_81.w = _1517;
    float _2069 = _1517;
    float _2071 = _2067;
    float _2073 = _2057;
    if (!_2023)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2075 = _1803;
    float _2077 = _2075;
    float _2079 = _2075;
    if (!_2023)
    {
        _2069 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2081 = _2069;
    float _2083 = _2081;
    float _2085 = _2081;
    if (!_2023)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2087 = _2071;
    float _2089 = _2087;
    float _2091 = _2087;
    if (!_2023)
    {
        _2073 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2093 = _2073;
    float _2095 = _2093;
    float _2097 = _2093;
    if (!_2023)
    {
        _1805 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2099 = _1805;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2023)
    {
        _1807 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2105 = _1807;
    float _2107 = -_1559;
    float _2109 = _2107 + 1.0;
    float _2111 = _2109 * _2053;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = -_2113;
    float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2119 = _2117 * _2041;
    float _2121 = _2065 * _1575;
    float _2123 = -_2065;
    float _2125 = _2123 + 1.0;
    float _2127 = _2119 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2129 = _1591 * _2121;
    float _2131 = _1591 * _2125;
    out.m_83.x = _2127;
    float _2133 = _1601 * _2121;
    float _2135 = fma(_1597, _2129, _1585);
    float _2137 = fma(_1599, _2129, _1587);
    float _2139 = fma(_1591, _2133, _1589);
    out.m_85.x = _2135;
    out.m_85.y = _2137;
    out.m_85.z = _2139;
    out.m_85.w = _2131;
    bool _2141 = !_2023;
    float _2143 = _2105;
    float _2145 = _2105;
    if (!_2141)
    {
        bool _2147 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2149 = isnan(_1277);
        bool _2151 = _2147 || _2149;
        bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2155 = _2151 || _2153;
        if (!_2155)
        {
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2159 = _1277 + _2157;
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2163 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2169 = 1.0 / _2163;
            float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2187 = _2159 * _2169;
            float _2189 = precise::clamp(_2187, 0.0, 1.0);
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2195 = fma(_2189, _2167, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2197 = fma(_2189, _2193, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2199 = fma(_2189, _2173, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2201 = fma(_2189, _2177, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2203 = fma(_2189, _2181, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2205 = fma(_2189, _2185, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2091 = _2199;
            _2103 = _2203;
            _2085 = _2195;
            _2097 = _2201;
            _2079 = _2197;
            _2145 = _2205;
            _2207 = true;
        }
        else
        {
            bool _2209 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2211 = isnan(_1277);
            bool _2213 = _2209 || _2211;
            bool _2215 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2217 = _2213 || _2215;
            if (!_2217)
            {
                _2083 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2219 = _2083;
            _2085 = _2219;
            if (!_2217)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2221 = _2089;
            _2091 = _2221;
            if (!_2217)
            {
                _2077 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2223 = _2077;
            _2079 = _2223;
            if (!_2217)
            {
                _2095 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2225 = _2095;
            _2097 = _2225;
            if (!_2217)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2227 = _2101;
            _2103 = _2227;
            if (!_2217)
            {
                _2143 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2229 = _2143;
            bool _2231 = !_2217;
            _2145 = _2229;
            if (!_2231)
            {
                bool _2233 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2235 = isnan(_1277);
                bool _2237 = _2233 || _2235;
                bool _2239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2241 = _2237 || _2239;
                if (!_2241)
                {
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2245 = _1277 + _2243;
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2249 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2247;
                    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2255 = 1.0 / _2249;
                    float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2273 = _2245 * _2255;
                    float _2275 = precise::clamp(_2273, 0.0, 1.0);
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2281 = fma(_2275, _2253, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2283 = fma(_2275, _2279, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2285 = fma(_2275, _2259, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2287 = fma(_2275, _2263, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2289 = fma(_2275, _2267, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2291 = fma(_2275, _2271, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2091 = _2285;
                    _2103 = _2289;
                    _2085 = _2281;
                    _2097 = _2287;
                    _2079 = _2283;
                    _2145 = _2291;
                    _2207 = true;
                }
                else
                {
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2085 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2097 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2079 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2145 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2207 = false;
    float _2293 = _2091;
    float _2295 = _2103;
    float _2297 = _2085;
    float _2299 = _2097;
    float _2301 = _2079;
    float _2303 = _2145;
    float _2305 = fma(_2051, -0.5, 0.5);
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = -_2293;
    float _2311 = _2309 + _2295;
    float _2313 = -_2297;
    float _2315 = _2313 + _2299;
    float _2317 = -_2301;
    float _2319 = _2317 + _2303;
    bool _2321 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2323 = fma(_2307, _2311, _2293);
    float _2325 = fma(_2307, _2315, _2297);
    float _2327 = fma(_2307, _2319, _2301);
    float _2329 = _2323 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2331 = fma(_2325, 0.298911988735198974609375, _2329);
    float _2333 = fma(_2327, 0.114477999508380889892578125, _2331);
    out.m_87.x = 0.0;
    float _2335 = -_2333;
    float _2337 = _2325 + _2335;
    float _2339 = -_2333;
    float _2341 = _2323 + _2339;
    float _2343 = -_2333;
    float _2345 = _2327 + _2343;
    float _2347 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2349 = fma(_2337, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2333);
    float _2351 = fma(_2341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2333);
    float _2353 = fma(_2345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2333);
    out.m_83.w = _2347;
    out.m_89.x = _2349;
    out.m_89.y = _2351;
    out.m_89.z = _2353;
    if (!_2321)
    {
        return out;
    }
    float _2355 = -_1237;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2359 = -_1241;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2363 = -_1245;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2367 = _2357 * _2357;
    float _2369 = fma(_2361, _2361, _2367);
    float _2371 = fma(_2365, _2365, _2369);
    float _2373 = sqrt(_2371);
    float _2375 = rsqrt(_2371);
    float _2377 = -_2373;
    float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2381 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2383 = precise::clamp(_2381, 0.0, 1.0);
    float _2385 = _2361 * _2375;
    float _2387 = _2357 * _2375;
    float _2389 = abs(_2383);
    float _2391 = log2(_2389);
    float _2393 = _2365 * _2375;
    float _2395 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2397 = _2051 * _2387;
    float _2399 = -_2387;
    float _2401 = -_2395;
    float _2403 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2401);
    float _2405 = fma(_2049, _2385, _2397);
    float _2407 = -_2393;
    float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2403);
    float _2411 = fma(_2055, _2393, _2405);
    float _2413 = precise::clamp(_2411, 0.0, 1.0);
    float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2417 = _2409 + _2415;
    float _2419 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2421 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2423 = precise::clamp(_2421, 0.0, 1.0);
    float _2425 = exp2(_2419);
    float _2427 = _2425 * _2423;
    float _2429 = _2413 * _2427;
    float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2433 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2435 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2431;
    out.m_87.y = _2433;
    out.m_87.z = _2435;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2207 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _111 = int(_109);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2492 = as_type<float>(_127);
        out.gl_Position.z = _2492;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2561 = as_type<float>(_165);
        out.gl_Position.z = _2561;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_55.x;
    float _169 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = _169 * _167;
    float _181 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = trunc(_179);
    int _187 = int(_185);
    float _189 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _191 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _197 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    int _203 = _187 << 4;
    int _205 = _203 + 1712;
    bool _207 = !_171;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _211 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_111);
        float _229 = 1.0 / _227;
        float _231 = _145 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    int _235 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _237 = _235;
    int _239 = 0;
    int _241 = _102(_237, _239, (*spvDescriptorSet0.support_buffer));
    int _243 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _245 = _243;
    int _247 = 0;
    int _249 = _102(_245, _247, (*spvDescriptorSet0.support_buffer));
    float _251 = in.m_59.w;
    float _253 = trunc(_251);
    int _255 = int(_253);
    int _257 = abs(_255);
    uint _260 = uint(int(uint(_255) >> uint(31)));
    float _262 = float(uint(_257));
    int _264 = ~int(_260);
    int _266 = _264 + 1;
    float _268 = float(_249);
    float _270 = float(_241);
    float _272 = trunc(_268);
    int _274 = int(_272);
    int _276 = abs(_274);
    bool _278 = _274 == 0;
    float _280 = float(uint(_276));
    int _282 = ~_276;
    int _284 = _282 + 1;
    int _286 = ~_276;
    int _288 = _286 + 1;
    float _290 = 1.0 / _280;
    int _292 = as_type<int>(_290) + (-2);
    float _294 = as_type<float>(_292) * _262;
    float _296 = _270 + 9.9999997473787516355514526367188e-06;
    float _298 = trunc(_294);
    float _300 = precise::max(_298, 0.0);
    uint _302 = uint(_300);
    float _304 = 1.0 / _296;
    int _306 = _284 * int(_302);
    int _308 = _306 + _257;
    float _310 = float(uint(_308));
    float _312 = _145 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _314 = as_type<float>(_292) * _310;
    float _316 = fma(_312, _304, _167);
    float _318 = _270 + (-1.0);
    float _320 = floor(_316);
    float _322 = trunc(_314);
    float _324 = precise::max(_322, 0.0);
    uint _326 = uint(_324);
    float _328 = -_320;
    float _330 = _316 + _328;
    float _332 = trunc(_318);
    int _334 = int(_332);
    float _336 = _270 * _330;
    int _338 = int(_302) + int(_326);
    float _340 = trunc(_336);
    int _342 = int(_340);
    int _344 = _288 * _338;
    int _346 = _344 + _257;
    bool _348 = uint(_346) >= uint(_276);
    bool _350 = !_348;
    int _352 = _350 ? 0 : (-1);
    int _354 = ~_338;
    int _356 = _354 + _352;
    int _358 = _356 + 1;
    bool _360 = _342 >= _334;
    int _362 = _342 + 1;
    int _364 = _276 * _358;
    int _366 = _364 + _257;
    bool _368 = !_360;
    int _370 = _368 ? _362 : 0;
    int _372 = _366 ^ _266;
    int _374 = ~_266;
    int _376 = _374 + _372;
    int _378 = _376 + 1;
    bool _380 = !_278;
    int _382 = _380 ? _378 : (-1);
    int _384 = _342;
    int _386 = 0;
    int _388 = _103(_384, _386, (*spvDescriptorSet0.support_buffer));
    int _390 = _382;
    int _392 = 0;
    int _394 = _103(_390, _392, (*spvDescriptorSet0.support_buffer));
    float4 _397 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_388, _394)), 0).xyzw;
    float _399 = _397.x;
    float _401 = _397.y;
    float _403 = _397.z;
    float _405 = _397.w;
    int _407 = _370;
    int _409 = 0;
    int _411 = _103(_407, _409, (*spvDescriptorSet0.support_buffer));
    int _413 = _382;
    int _415 = 0;
    int _417 = _103(_413, _415, (*spvDescriptorSet0.support_buffer));
    float4 _419 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_411, _417)), 0).xyzw;
    float _421 = _419.x;
    float _423 = _419.y;
    float _425 = _419.z;
    float _427 = _419.w;
    float _429 = in.m_55.z;
    float _431 = _167 * 2.0;
    float _433 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _435 = log2(_433);
    float _437 = in.m_55.y;
    float _439 = floor(_431);
    float _441 = _435 * _145;
    float _443 = exp2(_441);
    float _445 = _429 * 2.0;
    bool _447 = _439 > 0.0;
    bool _449 = _439 >= 0.0;
    bool _451 = isnan(_439);
    bool _453 = _449 || _451;
    bool _455 = isnan(0.0);
    bool _457 = _453 || _455;
    float _459 = _437 + _429;
    float _461 = floor(_445);
    float _463 = _437 * 2.0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = _459 + (-1.0);
    int _479 = _457 ? 0 : 1;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _483 = 1.0 + _481;
    bool _485 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _493 = _489 || _491;
    float _495 = floor(_463);
    float _497 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _499 = ~_479;
    int _501 = _499 + 1;
    int _503 = _501 + 1;
    float _505 = -_443;
    float _507 = _505 + 1.0;
    int _509 = _503;
    if (!_447)
    {
        int _511 = ~_479;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = in.m_59.x;
    float _519 = in.m_59.y;
    float _521 = in.m_59.z;
    bool _523 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _525 = isnan(1.0);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _531 = _527 || _529;
    float _533 = 1.0 / _483;
    bool _535 = _461 > 0.0;
    bool _537 = _461 >= 0.0;
    bool _539 = isnan(_461);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    bool _547 = !_471;
    int _549 = _547 ? 0 : 1;
    float _551 = float(_515);
    int _553 = abs(_549);
    int _555 = _545 ? 0 : 1;
    float _557 = float(_553);
    bool _559 = !_467;
    int _561 = _559 ? 0 : 1;
    bool _563 = _495 > 0.0;
    float _565 = _557 * _551;
    float _567 = _493 ? _507 : 0.0;
    int _569 = ~_555;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    bool _575 = _495 >= 0.0;
    bool _577 = isnan(_495);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _565 * (-2.0);
    int _587 = _573;
    if (!_535)
    {
        int _589 = ~_555;
        int _591 = _589 + 1;
        _587 = _591;
    }
    int _593 = _587;
    if (_531)
    {
        float _595 = _567 * _533;
        _149 = _595;
    }
    float _597 = _149;
    int _599 = abs(_561);
    float _601 = _437 + (-0.5);
    float _603 = fma(_585, _519, _519);
    int _605 = _583 ? 0 : 1;
    float _607 = fma(_497, _585, _497);
    float _609 = float(_599);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].y, _603);
    bool _613 = !_475;
    int _615 = _613 ? 0 : 1;
    float _617 = _167 + _437;
    float _619 = float(_593);
    float _621 = fma(_607, _597, _611);
    int _623 = ~_605;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    float _629 = _617 + (-1.0);
    int _631 = abs(_615);
    float _633 = _609 * _619;
    int _635 = _627;
    if (!_563)
    {
        int _637 = ~_605;
        int _639 = _637 + 1;
        _635 = _639;
    }
    int _641 = _635;
    float _643 = _621 * 0.15915493667125701904296875;
    float _645 = float(_631);
    float _647 = _633 * (-2.0);
    float _649 = float(_641);
    float _651 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _653 = _167 + (-0.5);
    float _655 = fma(_647, _517, _517);
    float _657 = _167 + _429;
    float _659 = _645 * _649;
    float _661 = fma(_651, _647, _651);
    float _663 = _657 + (-1.0);
    float _665 = _659 * (-2.0);
    float _667 = _429 + (-0.5);
    float _669 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].x, _655);
    float _671 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _673 = fma(_665, _521, _521);
    float _675 = _643 * 6.283185482025146484375;
    float _677 = sin(_675);
    float _679 = fma(_661, _597, _669);
    float _681 = fma(_671, _665, _671);
    float _683 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[196].z, _673);
    float _685 = _679 * 0.15915493667125701904296875;
    float _687 = fma(_681, _597, _683);
    float _689 = _643 * 6.283185482025146484375;
    float _691 = cos(_689);
    float _693 = _687 * 0.15915493667125701904296875;
    float _695 = _685 * 6.283185482025146484375;
    float _697 = sin(_695);
    float _699 = _685 * 6.283185482025146484375;
    float _701 = cos(_699);
    float _703 = _693 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = _697 * _677;
    float _709 = _697 * _691;
    float _711 = _693 * 6.283185482025146484375;
    float _713 = sin(_711);
    float _715 = _701 * _691;
    float _717 = _701 * _677;
    float _719 = floor(_336);
    float _721 = _691 * _705;
    float _723 = _697 * _705;
    float _725 = _701 * _705;
    float _727 = _677 * _705;
    float _729 = fma(_713, _715, _707);
    float _731 = fma(_713, _707, _715);
    float _733 = -_717;
    float _735 = fma(_713, _709, _733);
    float _737 = -_719;
    float _739 = _336 + _737;
    float _741 = -_709;
    float _743 = fma(_713, _717, _741);
    float _745 = -_401;
    float _747 = _745 + _423;
    float _749 = -_399;
    float _751 = _749 + _421;
    float _753 = -_403;
    float _755 = _753 + _425;
    float _757 = _747 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _759 = _751 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _761 = _755 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _763 = in.m_48.x;
    float _765 = in.m_48.y;
    float _767 = in.m_48.z;
    float _769 = _757 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _771 = _757 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _773 = _757 * _757;
    float _775 = _757 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _777 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[5].x, _769);
    float _779 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[4].x, _771);
    float _781 = fma(_759, _759, _773);
    float _783 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[6].x, _775);
    float _785 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[5].z, _777);
    float _787 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[4].z, _779);
    float _789 = fma(_761, _761, _781);
    float _791 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[6].z, _783);
    float _793 = _785 * _785;
    float _795 = fma(_739, _747, _401);
    float _797 = fma(_739, _751, _399);
    float _799 = fma(_739, _755, _403);
    float _801 = fma(_787, _787, _793);
    float _803 = sqrt(_789);
    float _805 = _795 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _807 = _795 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _809 = fma(_791, _791, _801);
    float _811 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[5].x, _805);
    float _813 = _765 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _815 = _765 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _817 = rsqrt(_809);
    float _819 = _765 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _821 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[5].x, _813);
    float _823 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[4].x, _815);
    float _825 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].z, _811);
    float _827 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[6].x, _819);
    float _829 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[5].z, _821);
    float _831 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[4].z, _823);
    float _833 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[6].x, _807);
    float _835 = fma(_767, (*spvDescriptorSet0.vp_c10)._m0[6].z, _827);
    float _837 = _829 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _839 = _835 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _841 = _837 + _825;
    float _843 = _803 * _817;
    float _845 = fma(_785, _843, _199);
    float _847 = fma(_787, _843, _197);
    float _849 = fma(_791, _843, _201);
    float _851 = _795 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _853 = _845 * _845;
    float _855 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].z, _833);
    float _857 = fma(_797, (*spvDescriptorSet0.vp_c10)._m0[4].x, _851);
    float _859 = fma(_847, _847, _853);
    float _861 = _831 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _863 = _839 + _855;
    float _865 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].z, _857);
    float _867 = fma(_849, _849, _859);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _871 = _863 + _869;
    float _873 = _861 + _865;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _877 = _841 + _875;
    float _879 = rsqrt(_867);
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _883 = _873 + _881;
    float _885 = _877 * _877;
    float _887 = fma(_883, _883, _885);
    float _889 = fma(_871, _871, _887);
    float _891 = rsqrt(_889);
    float _893 = _845 * _879;
    float _895 = _847 * _879;
    float _897 = _849 * _879;
    float _899 = _893 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _901 = _725 * _893;
    float _903 = _725 * _897;
    float _905 = _743 * _897;
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c10)._m0[8].y, _899);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c10)._m0[10].y, _907);
    float _911 = _877 * _891;
    float _913 = _883 * _891;
    float _915 = _871 * _891;
    float _917 = abs(_909);
    bool _919 = _917 > 0.99989998340606689453125;
    float _921 = -_911;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _925 = -_913;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _883);
    float _929 = -_915;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _871);
    float _933 = _923 * _923;
    float _935 = fma(_927, _927, _933);
    float _937 = _879;
    float _939 = _837;
    float _941 = _909;
    float _943 = _831;
    float _945 = _897;
    float _947 = _743;
    if (_919)
    {
        _937 = 0.001000000047497451305389404296875;
    }
    float _949 = _937;
    if (!_919)
    {
        _939 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _951 = _939;
    float _953 = _951;
    if (!_919)
    {
        _941 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _955 = _941;
    float _957 = _955;
    if (_919)
    {
        float _959 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _953 = _959;
    }
    float _961 = _953;
    if (_919)
    {
        float _963 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _957 = _963;
    }
    float _965 = _957;
    float _967 = fma(_931, _931, _935);
    if (!_919)
    {
        _943 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _969 = _943;
    float _971 = -_961;
    float _973 = _897 * _971;
    float _975 = _969;
    if (_919)
    {
        float _977 = fma(_949, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _975 = _977;
    }
    float _979 = _975;
    float _981 = in.m_61.x;
    float _983 = in.m_61.y;
    float _985 = in.m_61.z;
    float _987 = -_965;
    float _989 = _893 * _987;
    float _991 = -_965;
    float _993 = -_973;
    float _995 = fma(_895, _991, _993);
    float _997 = sqrt(_967);
    float _999 = in.m_63.x;
    float _1001 = in.m_63.y;
    float _1003 = in.m_63.z;
    float _1005 = -_979;
    float _1007 = -_989;
    float _1009 = fma(_897, _1005, _1007);
    float _1011 = -_979;
    float _1013 = _895 * _1011;
    float _1015 = _995 * _995;
    float _1017 = -_961;
    float _1019 = -_1013;
    float _1021 = fma(_893, _1017, _1019);
    float _1023 = fma(_1009, _1009, _1015);
    float _1025 = fma(_1021, _1021, _1023);
    float _1027 = rsqrt(_1025);
    float _1029 = _891 * _997;
    float _1031 = _985 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1033 = _981 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1035 = _983 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1037 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1041 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1003);
    float _1045 = _1037 * _1029;
    float _1047 = _1039 * _1029;
    float _1049 = _1041 * _1029;
    float _1051 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _999);
    float _1053 = _995 * _1027;
    float _1055 = _1045 * _1043;
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1001);
    float _1059 = _1009 * _1027;
    float _1061 = _1047 * _1051;
    float _1063 = _725 * _895;
    float _1065 = _895 * _1053;
    float _1067 = _1021 * _1027;
    float _1069 = _1049 * _1057;
    float _1071 = _729 * _897;
    float _1073 = -_713;
    float _1075 = fma(_1073, _1059, _1063);
    float _1077 = -_1065;
    float _1079 = fma(_893, _1059, _1077);
    float _1081 = _893 * _1067;
    float _1083 = -_713;
    float _1085 = fma(_1083, _1067, _903);
    float _1087 = _729 * _895;
    float _1089 = fma(_721, _1067, _1071);
    float _1091 = fma(_727, _1067, _905);
    float _1093 = -_1081;
    float _1095 = fma(_897, _1053, _1093);
    float _1097 = fma(_723, _1079, _1085);
    float _1099 = fma(_735, _1079, _1089);
    float _1101 = fma(_731, _1079, _1091);
    float _1103 = fma(_721, _1059, _1087);
    float _1105 = _743 * _895;
    float _1107 = fma(_723, _1095, _1075);
    float _1109 = _1069 * _1097;
    float _1111 = fma(_735, _1095, _1103);
    float _1113 = fma(_727, _1059, _1105);
    float _1115 = _1069 * _1107;
    float _1117 = fma(_1061, _1099, _1109);
    float _1119 = _897 * _1059;
    float _1121 = fma(_731, _1095, _1113);
    float _1123 = fma(_1061, _1111, _1115);
    float _1125 = fma(_1055, _1101, _1117);
    float _1127 = -_713;
    float _1129 = fma(_1127, _1053, _901);
    float _1131 = _729 * _893;
    float _1133 = fma(_1055, _1121, _1123);
    float _1135 = _863 + _1125;
    float _1137 = -_1119;
    float _1139 = fma(_895, _1067, _1137);
    float _1141 = _743 * _893;
    float _1143 = _873 + _1133;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1147 = _1135 + _1145;
    float _1149 = fma(_721, _1053, _1131);
    float _1151 = fma(_723, _1139, _1129);
    float _1153 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1155 = _1143 + _1153;
    float _1157 = _1147 * _1147;
    float _1159 = fma(_727, _1053, _1141);
    float _1161 = fma(_735, _1139, _1149);
    float _1163 = _1069 * _1151;
    float _1165 = fma(_1155, _1155, _1157);
    float _1167 = fma(_731, _1139, _1159);
    float _1169 = fma(_1061, _1161, _1163);
    float _1171 = sqrt(_1165);
    float _1173 = fma(_1055, _1167, _1169);
    float _1175 = _841 + _1173;
    bool _1177 = _1171 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1179 = _1143;
    float _1181 = _1135;
    float _1183 = _1061;
    if (!_1177)
    {
        _945 = _1175;
    }
    float _1185 = _945;
    bool _1187 = !_1177;
    float _1189 = _1185;
    if (!_1187)
    {
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1195 = _1171 + _1193;
        float _1197 = rsqrt(_1165);
        float _1199 = _1195 * _1191;
        float _1201 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1203 = _1199 * 0.15915493667125701904296875;
        float _1205 = _1203 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = _1203 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = _1207 + (-1.0);
        float _1215 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = fma(_1211, _1201, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1219 = fma(_1175, _1207, _1215);
        float _1221 = _1197 * _1217;
        float _1223 = fma(_1155, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = fma(_1147, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1189 = _1219;
        _1179 = _1223;
        _1181 = _1225;
        _1183 = _1203;
    }
    float _1227 = _1189;
    float _1229 = _1179;
    float _1231 = _1181;
    float _1233 = _1183;
    float _1235 = -_911;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1227);
    float _1239 = -_913;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1229);
    float _1243 = -_915;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1231);
    float _1247 = -_913;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1253 = _1237 + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1257 = _1241 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1261 = _1245 + _1259;
    float _1263 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1265 = _1253 * _1253;
    float _1267 = -_915;
    float _1269 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _1271 = fma(_1257, _1257, _1265);
    float _1273 = fma(_1261, _1261, _1271);
    float _1275 = rsqrt(_1273);
    float _1277 = sqrt(_1273);
    float _1279 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1281 = _1257 * _1279;
    float _1283 = _1261 * _1279;
    float _1285 = _1281 * _1281;
    float _1287 = _1283 * _1283;
    float _1289 = _1285 + _1287;
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1297 = _1291 + _1295;
    float _1299 = _1233;
    float _1301 = _1289;
    float _1303 = _1297;
    float _1305 = _1253;
    float _1307 = _1283;
    float _1309 = _1287;
    if (_1293)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1299 = _1311;
    }
    float _1313 = _1299;
    if (_1293)
    {
        float _1315 = rsqrt(_1289);
        _1301 = _1315;
    }
    float _1317 = _1301;
    if (_1293)
    {
        float _1319 = _1297 * _1313;
        _1303 = _1319;
    }
    float _1321 = _1303;
    if (_1293)
    {
        float _1323 = _1321 * 0.15915493667125701904296875;
        _947 = _1323;
    }
    float _1325 = _947;
    float _1327 = _1271;
    float _1329 = _1325;
    if (_1293)
    {
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        _1327 = _1333;
    }
    float _1335 = _1327;
    float _1337 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1339 = precise::max(0.0, _1337);
    float _1341 = _1175;
    float _1343 = _1339;
    float _1345 = _1337;
    if (_1293)
    {
        float _1347 = _1325 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        _1341 = _1349;
    }
    float _1351 = _1341;
    float _1353 = -_1279;
    float _1355 = -_1339;
    float _1357 = fma(_1253, _1353, _1355);
    if (!_1293)
    {
        _1305 = _1281;
    }
    float _1359 = _1305;
    float _1361 = _1359;
    if (_1293)
    {
        float _1363 = _1357 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1343 = _1363;
    }
    float _1365 = _1343;
    float _1367 = _1365;
    float _1369 = _1335;
    if (_1293)
    {
        float _1371 = fma(_1335, _1365, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1367 = _1371;
    }
    float _1373 = _1367;
    if (!_1293)
    {
        _1369 = _1357;
    }
    float _1375 = _1369;
    float _1377 = _1375;
    float _1379 = _1351;
    if (_1293)
    {
        float _1381 = _1351 + (-1.0);
        _1345 = _1381;
    }
    float _1383 = _1345;
    float _1385 = _1383;
    if (_1293)
    {
        float _1387 = _1317 * _1373;
        _1329 = _1387;
    }
    float _1389 = _1329;
    float _1391 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1293)
    {
        float _1393 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1393;
    }
    float _1395 = _1385;
    if (_1293)
    {
        float _1397 = _1281 * _1389;
        _1361 = _1397;
    }
    float _1399 = _1361;
    if (_1293)
    {
        float _1401 = _1283 * _1389;
        _1307 = _1401;
    }
    float _1403 = _1307;
    float _1405 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1263);
    if (_1293)
    {
        float _1407 = fma(_1357, _1351, _1395);
        _1377 = _1407;
    }
    float _1409 = _1377;
    if (!_1293)
    {
        _1379 = _1285;
    }
    float _1411 = _1379;
    float _1413 = _1411;
    if (_1293)
    {
        float _1415 = _1399 * _1399;
        _1413 = _1415;
    }
    float _1417 = _1413;
    if (_1293)
    {
        float _1419 = _1403 * _1403;
        _1309 = _1419;
    }
    float _1421 = _1309;
    float _1423 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1405);
    float _1425 = fma(_1409, _1409, _1417);
    float _1427 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1431 = _1425 + _1421;
    float _1433 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1437 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1435);
    float _1439 = precise::clamp(_1437, 0.0, 1.0);
    float _1441 = rsqrt(_1431);
    float _1443 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1433);
    float _1445 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1449 = -_1439;
    float _1451 = _1449 + 1.0;
    float _1453 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1455 = abs(_1451);
    float _1457 = log2(_1455);
    float _1459 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1461 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1463 = fma(_1269, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1465 = -_1459;
    float _1467 = fma(_1465, _1447, 1.0);
    float _1469 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1461);
    float _1471 = _1441 * _1399;
    float _1473 = floor(_1429);
    float _1475 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1469);
    float _1477 = _1441 * _1409;
    float _1479 = _1441 * _1403;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1483 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1427);
    float _1485 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1487 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1489 = -_1481;
    float _1491 = fma(_1477, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1489);
    float _1493 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1483);
    float _1495 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1497 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1487);
    float _1499 = -_1479;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1491);
    float _1503 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1505 = floor(_1463);
    float _1507 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1497);
    float _1509 = fma(_1501, -0.5, 0.5);
    float _1511 = -_1473;
    float _1513 = _1429 + _1511;
    float _1515 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1507);
    float _1519 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1521 = fma(_1501, 0.5, 0.5);
    float _1523 = exp2(_1495);
    float _1525 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1515);
    float _1527 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1519);
    float _1529 = _1477 + 1.0;
    float _1531 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1525);
    float _1533 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1527);
    float _1535 = log2(_1467);
    float _1537 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1531);
    float _1539 = -_1505;
    float _1541 = _1463 + _1539;
    float _1543 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1533);
    float _1545 = 1.0 / _1517;
    float _1547 = -_1477;
    float _1549 = fma(_1523, _1529, _1547);
    float _1551 = fma(_1521, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1553 = sqrt(_1509);
    float _1555 = _1535 * 0.693147182464599609375;
    float _1557 = fma(_1521, _1551, -0.212114393711090087890625);
    float2 _4704 = float2(_1513, _1541);
    float _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4704, float2(0.0), isnan(_4704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4704, float2(0.0), isnan(_4704)), level(0.0)).x;
    float _1561 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = fma(_1521, _1557, 1.570728778839111328125);
    float _1565 = _1537 * _1545;
    float _1567 = _1543 * _1545;
    float _1569 = fma(_1565, 0.5, 0.5);
    float _1571 = fma(_1567, -0.5, 0.5);
    float _1573 = _1553 * 0.636619746685028076171875;
    float3 _4736 = float3(_1569, _1571, _1561);
    float _1575 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4736, float3(0.0), isnan(_4736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4736, float3(0.0), isnan(_4736)), level(0.0)).x;
    float _1577 = -_1563;
    float _1579 = fma(_1573, _1577, 1.0);
    float _1581 = fma(_1549, 0.5, 0.5);
    float3 _4754 = float3(_1569, _1571, _1561);
    float4 _1583 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4754, float3(0.0), isnan(_4754)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4754, float3(0.0), isnan(_4754)), level(0.0)).xyzw;
    float _1585 = _1583.x;
    float _1587 = _1583.y;
    float _1589 = _1583.z;
    float _1591 = _1583.w;
    float2 _4770 = float2(_1579, _1581);
    float3 _1595 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4770, float2(0.0), isnan(_4770)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4770, float2(0.0), isnan(_4770)), level(0.0)).xyz;
    float _1597 = _1595.x;
    float _1599 = _1595.y;
    float _1601 = _1595.z;
    float _1603 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1607 = _233 + _1605;
    float _1609 = -_911;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _841);
    float _1613 = _1603 * _167;
    bool _1615 = _437 > 0.5;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1619 = _1617 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1623 = _1621 != 0;
    uint _1625 = uint(int(uint(_205) >> uint(2)));
    uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
    int _1629 = int(_1625) & 3;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[int(_1627)][_1629];
    int _1633 = int(_1625) + 1;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    int _1637 = _1633 & 3;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[int(_1635)][_1637];
    float _1641 = trunc(_1613);
    int _1643 = int(_1641);
    bool _1645 = _167 > 0.5;
    bool _1647 = _1645 && _1623;
    float _1649 = in.m_65.x;
    float _1651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1655 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1657 = isnan(_233);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1663 = _1659 || _1661;
    float _1665 = float(_1663);
    int _1667 = _205 + 8;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[int(_1671)][_1673];
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1679 = _1677 != 0;
    float _1681 = 1.0 / _1619;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1683;
    float _1687 = in.m_65.y;
    bool _1689 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1691 = isnan(_233);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = -_1665;
    float _1703 = _1701 + 1.0;
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1709 = -_405;
    float _1711 = _1709 + _427;
    int _1713 = _1643 << 4;
    int _1715 = _1713 + 1968;
    float _1717 = 1.0 / _1653;
    float _1719 = _1699 * _1703;
    float _1721 = -_1699;
    float _1723 = _1721 + 1.0;
    uint _1725 = uint(int(uint(_1715) >> uint(2)));
    uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
    int _1729 = int(_1725) & 3;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[int(_1727)][_1729];
    int _1733 = int(_1725) + 1;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    int _1737 = _1733 & 3;
    float _1739 = (*spvDescriptorSet0.vp_c9)._m0[int(_1735)][_1737];
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1745 = fma(_739, _1711, _405);
    float _1747 = _1685 * _1681;
    float _1749 = _1445 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1751 = 1.0 / _1743;
    int _1753 = _1715 + 8;
    uint _1755 = uint(int(uint(_1753) >> uint(2)));
    uint _1757 = uint(int(uint(int(_1755)) >> uint(2)));
    int _1759 = int(_1755) & 3;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[int(_1757)][_1759];
    float _1763 = fma(_1747, _1607, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1765;
    out.m_67.w = _1745;
    float _1769 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1749);
    float _1771 = _1707 * _1717;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1775 = _233 + _1773;
    bool _1777 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1779 = isnan(_233);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1785 = _1781 || _1783;
    float _1787 = float(_1785);
    float _1789 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1769);
    float _1791 = _1787 * _1723;
    float _1793 = -_1787;
    float _1795 = _1793 + 1.0;
    float _1797 = fma(_1771, _1775, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1799 = _1771;
    float _1801 = _1649;
    float _1803 = _1517;
    float _1805 = _1543;
    float _1807 = _1537;
    if (_1623)
    {
        _1799 = _1649;
    }
    float _1809 = _1799;
    float _1811 = _1763 * _1791;
    float _1813 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1815 = _1767 * _1751;
    bool _1817 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1819 = isnan(_233);
    bool _1821 = _1817 || _1819;
    bool _1823 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1825 = _1821 || _1823;
    float _1827 = float(_1825);
    float _1829 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1811);
    float _1831 = _1809;
    float _1833 = _1687;
    if (_1647)
    {
        float _1835 = -_1809;
        float _1837 = _1835 + 1.0;
        _1831 = _1837;
    }
    float _1839 = _1831;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1843 = _233 + _1841;
    float _1845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1847 = fma(_1797, _1719, _1829);
    float _1849 = -_1687;
    float _1851 = _1849 + 1.0;
    if (_1623)
    {
        _1801 = _1839;
    }
    float _1853 = _1801;
    float _1855 = fma(_1815, _1843, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1857 = -_1827;
    float _1859 = _1857 + 1.0;
    float _1861 = _1639 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_1679)
    {
        float _1863 = _1615 ? _1851 : _1687;
        _1833 = _1863;
    }
    float _1865 = _1833;
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1869 = _1665 * _1859;
    float _1871 = _1853 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1873 = _1001 != 0.0;
    bool _1875 = isnan(_1001);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(0.0);
    bool _1881 = _1877 || _1879;
    float _1883 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1885 = fma(_1855, _1869, _1847);
    bool _1887 = _999 == 0.0;
    bool _1889 = !_1881;
    bool _1891 = _1887 && _1889;
    float _1893 = _1731 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1895 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1897 = _1739 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1899 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1903 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1905 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1907 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1909 = _1761 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1911 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1903);
    float _1913 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1905);
    float _1915 = _1883 * _1845;
    float _1917 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1919 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1911);
    float _1921 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1923 = _1871 * _1867;
    float _1925 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1885);
    float _1927 = _1919 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1929 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1931 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_69.x = _1901;
    out.m_69.y = _1907;
    out.m_69.z = _1917;
    float _1933 = 1.0 / _1927;
    float _1935 = _1929 + _1927;
    float _1937 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1939 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1941 = _1003 == 0.0;
    bool _1943 = _1941 && _1891;
    out.m_71.x = _1923;
    out.m_71.y = _1915;
    out.m_73.x = _1895;
    out.m_73.y = _1899;
    out.m_73.z = _1937;
    out.m_73.w = _1939;
    float _1945 = _1935 * _1933;
    float _1947 = _1945 * 0.5;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1951 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1949);
    float _1953 = 1.0 / _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1957 = _1953 * _1955;
    float _1959 = abs(_1957);
    float _1961 = log2(_1959);
    bool _1963 = _1957 <= 8000.0;
    bool _1965 = isnan(_1957);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(8000.0);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1977 = in.m_75.x;
    float _1979 = in.m_75.y;
    float _1981 = in.m_75.z;
    float _1983 = exp2(_1975);
    float _1985 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1987 = precise::clamp(_1985, 0.0, 1.0);
    float _1989 = fma(_1987, -2.0, 3.0);
    float _1991 = _1987 * _1987;
    float _1993 = _1981;
    float _1995 = _1979;
    float _1997 = _1977;
    if (!_1943)
    {
        float _1999 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1981);
        _1993 = _1999;
    }
    float _2001 = _1993;
    float _2003 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1943)
    {
        float _2005 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _1995 = _2005;
    }
    float _2007 = _1995;
    float _2009 = _1991 * _1989;
    if (!_1943)
    {
        float _2011 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _1997 = _2011;
    }
    float _2013 = _1997;
    bool _2015 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2017 = isnan(_1277);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2023 = _2019 || _2021;
    float _2025 = _1107 * _2007;
    float _2027 = -_2009;
    float _2029 = _2027 + 1.0;
    float _2031 = exp2(_2003);
    float _2033 = _1151 * _2007;
    float _2035 = _1097 * _2007;
    float _2037 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2009);
    float _2039 = fma(_1111, _2013, _2025);
    float _2041 = in.m_77.x;
    float _2043 = fma(_1161, _2013, _2033);
    float _2045 = _1973 * _2037;
    float _2047 = fma(_1099, _2013, _2035);
    float _2049 = fma(_1121, _2001, _2039);
    float _2051 = fma(_1167, _2001, _2043);
    float _2053 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2055 = fma(_1101, _2001, _2047);
    float _2057 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1789);
    float _2059 = -_2031;
    float _2061 = _2059 + 1.0;
    out.m_79.x = _2049;
    out.m_79.y = _2051;
    out.m_79.z = _2055;
    float _2063 = _2057 + _1517;
    float _2065 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1537;
    out.gl_Position.y = _1543;
    out.gl_Position.z = _2057;
    out.gl_Position.w = _1517;
    float _2067 = _2063 * 0.5;
    out.m_81.z = _2067;
    out.m_81.w = _1517;
    float _2069 = _1517;
    float _2071 = _2067;
    float _2073 = _2057;
    if (!_2023)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2075 = _1803;
    float _2077 = _2075;
    float _2079 = _2075;
    if (!_2023)
    {
        _2069 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2081 = _2069;
    float _2083 = _2081;
    float _2085 = _2081;
    if (!_2023)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2087 = _2071;
    float _2089 = _2087;
    float _2091 = _2087;
    if (!_2023)
    {
        _2073 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2093 = _2073;
    float _2095 = _2093;
    float _2097 = _2093;
    if (!_2023)
    {
        _1805 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2099 = _1805;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2023)
    {
        _1807 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2105 = _1807;
    float _2107 = -_1559;
    float _2109 = _2107 + 1.0;
    float _2111 = _2109 * _2053;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = -_2113;
    float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2119 = _2117 * _2041;
    float _2121 = _2065 * _1575;
    float _2123 = -_2065;
    float _2125 = _2123 + 1.0;
    float _2127 = _2119 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2129 = _1591 * _2121;
    float _2131 = _1591 * _2125;
    out.m_83.x = _2127;
    float _2133 = _1601 * _2121;
    float _2135 = fma(_1597, _2129, _1585);
    float _2137 = fma(_1599, _2129, _1587);
    float _2139 = fma(_1591, _2133, _1589);
    out.m_85.x = _2135;
    out.m_85.y = _2137;
    out.m_85.z = _2139;
    out.m_85.w = _2131;
    bool _2141 = !_2023;
    float _2143 = _2105;
    float _2145 = _2105;
    if (!_2141)
    {
        bool _2147 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2149 = isnan(_1277);
        bool _2151 = _2147 || _2149;
        bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2155 = _2151 || _2153;
        if (!_2155)
        {
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2159 = _1277 + _2157;
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2163 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2169 = 1.0 / _2163;
            float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2187 = _2159 * _2169;
            float _2189 = precise::clamp(_2187, 0.0, 1.0);
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2195 = fma(_2189, _2167, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2197 = fma(_2189, _2193, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2199 = fma(_2189, _2173, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2201 = fma(_2189, _2177, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2203 = fma(_2189, _2181, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2205 = fma(_2189, _2185, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2091 = _2199;
            _2103 = _2203;
            _2085 = _2195;
            _2097 = _2201;
            _2079 = _2197;
            _2145 = _2205;
            _2207 = true;
        }
        else
        {
            bool _2209 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2211 = isnan(_1277);
            bool _2213 = _2209 || _2211;
            bool _2215 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2217 = _2213 || _2215;
            if (!_2217)
            {
                _2083 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2219 = _2083;
            _2085 = _2219;
            if (!_2217)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2221 = _2089;
            _2091 = _2221;
            if (!_2217)
            {
                _2077 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2223 = _2077;
            _2079 = _2223;
            if (!_2217)
            {
                _2095 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2225 = _2095;
            _2097 = _2225;
            if (!_2217)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2227 = _2101;
            _2103 = _2227;
            if (!_2217)
            {
                _2143 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2229 = _2143;
            bool _2231 = !_2217;
            _2145 = _2229;
            if (!_2231)
            {
                bool _2233 = _1277 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2235 = isnan(_1277);
                bool _2237 = _2233 || _2235;
                bool _2239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2241 = _2237 || _2239;
                if (!_2241)
                {
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2245 = _1277 + _2243;
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2249 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2247;
                    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2255 = 1.0 / _2249;
                    float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2273 = _2245 * _2255;
                    float _2275 = precise::clamp(_2273, 0.0, 1.0);
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2281 = fma(_2275, _2253, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2283 = fma(_2275, _2279, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2285 = fma(_2275, _2259, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2287 = fma(_2275, _2263, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2289 = fma(_2275, _2267, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2291 = fma(_2275, _2271, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2091 = _2285;
                    _2103 = _2289;
                    _2085 = _2281;
                    _2097 = _2287;
                    _2079 = _2283;
                    _2145 = _2291;
                    _2207 = true;
                }
                else
                {
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2085 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2097 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2079 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2145 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2207 = false;
    float _2293 = _2091;
    float _2295 = _2103;
    float _2297 = _2085;
    float _2299 = _2097;
    float _2301 = _2079;
    float _2303 = _2145;
    float _2305 = fma(_2051, -0.5, 0.5);
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = -_2293;
    float _2311 = _2309 + _2295;
    float _2313 = -_2297;
    float _2315 = _2313 + _2299;
    float _2317 = -_2301;
    float _2319 = _2317 + _2303;
    bool _2321 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2323 = fma(_2307, _2311, _2293);
    float _2325 = fma(_2307, _2315, _2297);
    float _2327 = fma(_2307, _2319, _2301);
    float _2329 = _2323 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2331 = fma(_2325, 0.298911988735198974609375, _2329);
    float _2333 = fma(_2327, 0.114477999508380889892578125, _2331);
    out.m_87.x = 0.0;
    float _2335 = -_2333;
    float _2337 = _2325 + _2335;
    float _2339 = -_2333;
    float _2341 = _2323 + _2339;
    float _2343 = -_2333;
    float _2345 = _2327 + _2343;
    float _2347 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2349 = fma(_2337, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2333);
    float _2351 = fma(_2341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2333);
    float _2353 = fma(_2345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2333);
    out.m_83.w = _2347;
    out.m_89.x = _2349;
    out.m_89.y = _2351;
    out.m_89.z = _2353;
    if (!_2321)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2355 = -_1237;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2359 = -_1241;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2363 = -_1245;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2367 = _2357 * _2357;
    float _2369 = fma(_2361, _2361, _2367);
    float _2371 = fma(_2365, _2365, _2369);
    float _2373 = sqrt(_2371);
    float _2375 = rsqrt(_2371);
    float _2377 = -_2373;
    float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2381 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2383 = precise::clamp(_2381, 0.0, 1.0);
    float _2385 = _2361 * _2375;
    float _2387 = _2357 * _2375;
    float _2389 = abs(_2383);
    float _2391 = log2(_2389);
    float _2393 = _2365 * _2375;
    float _2395 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2397 = _2051 * _2387;
    float _2399 = -_2387;
    float _2401 = -_2395;
    float _2403 = fma(_2399, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2401);
    float _2405 = fma(_2049, _2385, _2397);
    float _2407 = -_2393;
    float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2403);
    float _2411 = fma(_2055, _2393, _2405);
    float _2413 = precise::clamp(_2411, 0.0, 1.0);
    float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2417 = _2409 + _2415;
    float _2419 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2421 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2423 = precise::clamp(_2421, 0.0, 1.0);
    float _2425 = exp2(_2419);
    float _2427 = _2425 * _2423;
    float _2429 = _2413 * _2427;
    float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2433 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2435 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2431;
    out.m_87.y = _2433;
    out.m_87.z = _2435;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

