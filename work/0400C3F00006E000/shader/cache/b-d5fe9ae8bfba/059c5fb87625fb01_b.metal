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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _88(thread const int& _5910, thread const int& _5911, constant _10& support_buffer)
{
    float _5914 = as_type<float>(support_buffer._m4);
    int _5916 = _5911 + as_type<int>(_5914);
    int _5918 = 1 + _5916;
    float _5920 = support_buffer._m5[_5918].x;
    float _5922 = abs(_5920);
    bool _5924 = _5922 == 1.0;
    if (_5924)
    {
        return _5910;
    }
    float _5926 = float(_5910);
    float _5928 = _5926 / _5922;
    int _5930 = int(_5928);
    return _5930;
}

static inline __attribute__((always_inline))
int _89(thread const int& _5960, thread const int& _5961, constant _10& support_buffer)
{
    float _5964 = as_type<float>(support_buffer._m4);
    int _5966 = _5961 + as_type<int>(_5964);
    int _5968 = 1 + _5966;
    float _5970 = support_buffer._m5[_5968].x;
    bool _5972 = _5970 == 1.0;
    if (_5972)
    {
        return _5960;
    }
    float _5974 = float(_5960);
    float _5976 = _5974 * _5970;
    int _5978 = int(_5976);
    return _5978;
}

static inline __attribute__((always_inline))
void _86(thread int& _5907, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _5907 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1917 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_46.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_113);
        out.gl_Position.z = _2411;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = _131;
    if (_127)
    {
        float _135 = float(_97);
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2481 = as_type<float>(_151);
        out.gl_Position.z = _2481;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    int _153 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _155 = _153;
    int _157 = 0;
    int _159 = _88(_155, _157, (*spvDescriptorSet0.support_buffer));
    float _161 = in.m_53.z;
    float _163 = in.m_55.z;
    float _165 = _131 + _161;
    float _167 = _165 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _169 = trunc(_163);
    int _171 = int(_169);
    float _173 = float(_159);
    int _175 = abs(_159);
    bool _177 = _159 == 0;
    float _179 = _167 * _173;
    float _181 = float(uint(_175));
    float _183 = trunc(_179);
    int _185 = int(_183);
    float _187 = 1.0 / _181;
    int _189 = abs(_185);
    uint _192 = uint(int(uint(_185) >> uint(31)));
    float _194 = float(uint(_189));
    int _196 = ~int(_192);
    int _198 = _196 + 1;
    int _200 = as_type<int>(_187) + (-2);
    float _202 = as_type<float>(_200) * _194;
    float _204 = trunc(_202);
    float _206 = precise::max(_204, 0.0);
    uint _208 = uint(_206);
    int _210 = ~int(_208);
    int _212 = _210 + 1;
    int _214 = _212 * _175;
    int _216 = _214 + _189;
    float _218 = float(uint(_216));
    float _220 = as_type<float>(_200) * _218;
    float _222 = trunc(_220);
    float _224 = precise::max(_222, 0.0);
    uint _226 = uint(_224);
    int _228 = int(_208) + int(_226);
    int _230 = ~_228;
    int _232 = _230 + 1;
    int _234 = _232 * _175;
    int _236 = _234 + _189;
    bool _238 = uint(_236) >= uint(_175);
    bool _240 = !_238;
    int _242 = _240 ? 0 : (-1);
    int _244 = ~_228;
    int _246 = _244 + _242;
    int _248 = _246 + 1;
    int _250 = _248 * _175;
    int _252 = _250 + _189;
    int _254 = _252 ^ _198;
    int _256 = ~_198;
    int _258 = _256 + _254;
    int _260 = _258 + 1;
    bool _262 = !_177;
    int _264 = _262 ? _260 : (-1);
    int _266 = _264;
    int _268 = 0;
    int _270 = _89(_266, _268, (*spvDescriptorSet0.support_buffer));
    int _272 = _171;
    int _274 = 0;
    int _276 = _89(_272, _274, (*spvDescriptorSet0.support_buffer));
    float4 _279 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_270, _276)), 0).xyzw;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = _279.w;
    float _289 = in.m_53.x;
    float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _293 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _295 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _297 = in.m_53.y;
    float _299 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _301 = in.m_55.x;
    float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _305 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _307 = _305 != 0;
    float _309 = in.m_55.y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _313 = _293 * _291;
    float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _319 = _317 != 0;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _325 = _323 != 0;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _329 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[20].x, _313);
    float _331 = _295 * _303;
    float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _335 = _297 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _337 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[20].y, _331);
    bool _339 = _289 > 0.5;
    bool _341 = _339 && _319;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _345 = fma(_335, -2.0, _327);
    float _347 = _329 * 6.283185482025146484375;
    float _349 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[78].w, _311);
    float _351 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[79].z, _343);
    float _353 = floor(_329);
    float _355 = _347 * 0.15915493667125701904296875;
    float _357 = _337 * 6.283185482025146484375;
    bool _359 = _297 > 0.5;
    bool _361 = _359 && _325;
    float _363 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[79].x, _351);
    float _365 = _357 * 0.15915493667125701904296875;
    float _367 = _289 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _369 = _363 * (-0.15915493667125701904296875);
    float _371 = 0.0;
    float _373 = _363;
    float _375 = _309;
    if (_319)
    {
        _371 = _301;
    }
    float _377 = _371;
    float _379 = floor(_337);
    float _381 = -_321;
    float _383 = fma(_367, 2.0, _381);
    bool _385 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _389 = _385 || _387;
    bool _391 = isnan(1.0);
    bool _393 = _389 || _391;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _397 = _377;
    if (_341)
    {
        float _399 = -_377;
        float _401 = _399 + 1.0;
        _397 = _401;
    }
    float _403 = _397;
    if (!_319)
    {
        _373 = _301;
    }
    float _405 = _373;
    float _407 = -_353;
    float _409 = _329 + _407;
    float _411 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[78].z, _395);
    float _413 = _355 * 6.283185482025146484375;
    float _415 = cos(_413);
    float _417 = _405;
    if (_319)
    {
        _417 = _403;
    }
    float _419 = _417;
    float _421 = _315 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _423 = _333 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _425 = _421;
    if (_361)
    {
        float _427 = -_309;
        float _429 = _427 + 1.0;
        _375 = _429;
    }
    float _431 = _375;
    float _433 = fma(_421, _419, -0.5);
    if (!_393)
    {
        float _435 = _299 * _299;
        float _437 = _435 * 0.5;
        _425 = _437;
    }
    float _439 = _425;
    float _441 = _365 * 6.283185482025146484375;
    float _443 = cos(_441);
    float _445 = fma(_423, _431, -0.5);
    float _447 = -_379;
    float _449 = _337 + _447;
    float _451 = _439;
    if (!_393)
    {
        float _453 = _439 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _451 = _453;
    }
    float _455 = _451;
    float _457 = _369 * 6.283185482025146484375;
    float _459 = sin(_457);
    float _461 = fma(_415, 0.5, 0.5);
    float _463 = _415;
    float _465 = _455;
    if (!_393)
    {
        _463 = _299;
    }
    float _467 = _463;
    float _469 = _369 * 6.283185482025146484375;
    float _471 = cos(_469);
    float _473 = fma(_443, 0.5, 0.5);
    float _475 = _459 * _445;
    bool _477 = !_393;
    float _479 = _467;
    if (!_477)
    {
        float _481 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _483 = log2(_481);
        float _485 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _487 = _485 + 1.0;
        float _489 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _491 = _299 * _483;
        float _493 = 1.0 / _487;
        float _495 = _489 * 0.693147182464599609375;
        float _497 = exp2(_491);
        float _499 = 1.0 / _495;
        float _501 = _497 + (-1.0);
        float _503 = -_501;
        float _505 = fma(_503, _499, _299);
        float _507 = _505 * _493;
        float _509 = _507 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _465 = _509;
    }
    float _511 = _465;
    bool _513 = !_393;
    if (!_513)
    {
        float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _517 = log2(_515);
        float _519 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _521 = _519 + 1.0;
        float _523 = 1.0 / _521;
        float _525 = _299 * _517;
        float _527 = exp2(_525);
        float _529 = -_527;
        float _531 = _529 + 1.0;
        float _533 = _531 * _523;
        _479 = _533;
    }
    float _535 = _479;
    float _537 = _471 * _445;
    float _539 = -_475;
    float _541 = fma(_471, _433, _539);
    float _543 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _411);
    float _545 = fma(_459, _433, _537);
    float _547 = in.m_51.x;
    float _549 = in.m_51.y;
    float _551 = in.m_51.z;
    bool _553 = _409 < 0.5;
    float _555 = float(_553);
    float _557 = -_409;
    float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _567 = _565 != 0;
    float _569 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _349);
    float _571 = -_555;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _575 = -_461;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _579 = _449 < 0.5;
    float _581 = float(_579);
    float _583 = -_131;
    float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[76].x, _383);
    float _587 = -_449;
    float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _591 = !_563;
    int _593 = _591 ? 0 : 1;
    float _595 = -_473;
    float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _599 = -_581;
    float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _603 = !_307;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_543, _541, _585);
    int _609 = abs(_593);
    bool _611 = !_567;
    int _613 = _611 ? 0 : 1;
    float _615 = _607 + 0.5;
    int _617 = abs(_605);
    float _619 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _345);
    float _621 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _623 = abs(_613);
    float _625 = float(_609);
    float _627 = -_619;
    float _629 = fma(_569, _545, _627);
    float _631 = fma(_535, _547, _621);
    float _633 = float(_617);
    float _635 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _637 = abs(_559);
    float _639 = _625 * _637;
    float _641 = abs(_589);
    float _643 = _625 * _641;
    float _645 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _647 = float(_623);
    float _649 = fma(_633, _577, _639);
    float _651 = fma(_633, _597, _643);
    float _653 = fma(_535, _549, _635);
    float _655 = fma(_535, _551, _645);
    float _657 = abs(_573);
    float _659 = fma(_647, _657, _649);
    int _661 = _264 + 1;
    float _663 = abs(_601);
    float _665 = fma(_647, _663, _651);
    float _667 = in.m_46.x;
    float _669 = in.m_46.y;
    float _671 = in.m_46.z;
    uint _673 = as_type<uint>(half2(float2(_287, 0.0)));
    float _675 = _629 + 0.5;
    int _677 = abs(_661);
    uint _679 = extract_bits(_673, 0u, 8u);
    int _681 = int(_679) & 255;
    uint _683 = extract_bits(_673, 8u, 8u);
    int _685 = int(_683) & 255;
    int _687 = _685 << 8;
    int _689 = _681 | _687;
    float _691 = float(uint(_677));
    uint _693 = uint(int(uint(_661) >> uint(31)));
    float _695 = as_type<float>(_200) * _691;
    int _697 = ~int(_693);
    int _699 = _697 + 1;
    float _701 = trunc(_695);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    int _707 = ~int(_705);
    int _709 = _707 + 1;
    int _711 = _709 * _175;
    int _713 = _711 + _677;
    float _715 = float(uint(_713));
    float _717 = as_type<float>(_200) * _715;
    float _719 = trunc(_717);
    float _721 = precise::max(_719, 0.0);
    uint _723 = uint(_721);
    int _725 = int(_705) + int(_723);
    float _727 = in.m_57.x;
    float _729 = in.m_57.y;
    float _731 = in.m_57.z;
    float _733 = in.m_57.w;
    int _735 = ~_725;
    int _737 = _735 + 1;
    int _739 = _737 * _175;
    int _741 = _739 + _677;
    bool _743 = uint(_741) >= uint(_175);
    bool _745 = !_743;
    int _747 = _745 ? 0 : (-1);
    bool _749 = _689 >= 32768;
    int _751 = ~_725;
    int _753 = _751 + _747;
    int _755 = _753 + 1;
    float _757 = fma(_655, _733, _671);
    int _759 = _755 * _175;
    int _761 = _759 + _677;
    int _763 = _689 + (-1024);
    float _765 = fma(_631, _733, _667);
    float _767 = fma(_653, _733, _669);
    float _769 = _727 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _771 = _761 ^ _699;
    float _773 = _729 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _775 = _763;
    if (_749)
    {
        int _777 = ~_689;
        int _779 = _777 + 33792;
        int _781 = _779 + 1;
        _775 = _781;
    }
    int _783 = _775;
    float _785 = _731 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _787 = ~_699;
    int _789 = _787 + _771;
    int _791 = _789 + 1;
    int _793 = _783 + 30719;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _805 = float(_793);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _809 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = fma(_805, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _815 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _819 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _823 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = abs(_813);
    float _827 = -_825;
    float _829 = _827 + 1.0;
    out.m_59.x = _809;
    out.m_59.y = _811;
    out.m_59.z = _815;
    out.m_59.w = _817;
    bool _831 = !_177;
    int _833 = _831 ? _791 : (-1);
    out.m_61.x = _819;
    out.m_61.y = _821;
    out.m_61.z = _823;
    int _835 = as_type<int>(_829) + (-218103808);
    bool _837 = uint(_835) >= 1920991232u;
    bool _839 = !_837;
    float _841 = _821;
    if (!_839)
    {
        int _843;
        _86(_843, out.gl_Position, out.gl_PointSize);
    }
    int _845 = _833;
    int _847 = 0;
    int _849 = _89(_845, _847, (*spvDescriptorSet0.support_buffer));
    int _851 = _171;
    int _853 = 0;
    int _855 = _89(_851, _853, (*spvDescriptorSet0.support_buffer));
    float4 _857 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_849, _855)), 0).xyzw;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = _857.w;
    float _867 = floor(_179);
    float _869 = -_867;
    float _871 = _179 + _869;
    uint _873 = as_type<uint>(half2(float2(_865, 0.0)));
    float _875 = -_285;
    float _877 = _875 + _863;
    uint _879 = extract_bits(_873, 0u, 8u);
    int _881 = int(_879) & 255;
    uint _883 = extract_bits(_873, 8u, 8u);
    int _885 = int(_883) & 255;
    int _887 = _885 << 8;
    int _889 = _881 | _887;
    bool _891 = _889 >= 32768;
    int _893 = _889 + (-1024);
    int _895 = _893;
    if (_891)
    {
        int _897 = ~_889;
        int _899 = _897 + 33792;
        int _901 = _899 + 1;
        _895 = _901;
    }
    int _903 = _895;
    int _905 = _903 + 30719;
    float _907 = float(_905);
    float _909 = fma(_907, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _911 = fma(_871, _877, _285);
    float _913 = abs(_909);
    float _915 = -_913;
    float _917 = _915 + 1.0;
    int _919 = as_type<int>(_917) + (-218103808);
    float _921 = -_281;
    float _923 = _921 + _859;
    bool _925 = uint(_919) >= 1920991232u;
    float _927 = -_283;
    float _929 = _927 + _861;
    float _931 = fma(_871, _923, _281);
    float _933 = fma(_871, _929, _283);
    bool _935 = !_925;
    if (!_935)
    {
        int _937;
        _86(_937, out.gl_Position, out.gl_PointSize);
    }
    float _939 = in.m_53.x;
    float _941 = in.m_53.y;
    float _943 = in.m_53.z;
    float _945 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _947 = log2(_945);
    float _949 = _767 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_63.x = _615;
    out.m_63.y = _675;
    float _951 = _767 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _953 = _767 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _957 = 1.0 + _955;
    bool _959 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _961 = isnan(1.0);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _967 = _963 || _965;
    float _969 = _659 * _769;
    bool _971 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _973 = isnan(0.0);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _979 = _975 || _977;
    float _981 = 1.0 / _957;
    float _983 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[6].x, _953);
    float _985 = in.m_65.w;
    float _987 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[4].x, _949);
    float _989 = _665 * _773;
    float _991 = _947 * _131;
    float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _995 = _943 * 2.0;
    float _997 = _939 * 2.0;
    float _999 = exp2(_991);
    float _1001 = floor(_995);
    out.m_67.w = _985;
    float _1003 = -_999;
    float _1005 = _1003 + 1.0;
    float _1007 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[5].x, _951);
    float _1009 = floor(_997);
    float _1011 = _979 ? _1005 : 0.0;
    float _1013 = fma(_757, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1007);
    float _1015 = _941 * 2.0;
    bool _1017 = _1001 > 0.0;
    bool _1019 = _1001 >= 0.0;
    bool _1021 = isnan(_1001);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan(0.0);
    bool _1027 = _1023 || _1025;
    if (_967)
    {
        float _1029 = _1011 * _981;
        _133 = _1029;
    }
    float _1031 = _133;
    float _1033 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1035 = floor(_1015);
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1043 = _1041 != 0;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1047 = _1045 != 0;
    float _1049 = fma(_757, (*spvDescriptorSet0.vp_c10)._m0[4].z, _987);
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1053 = _1051 != 0;
    float _1055 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1033);
    int _1057 = _1027 ? 0 : 1;
    float _1059 = _941 + _939;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1067 = _1065 != 0;
    float _1069 = fma(_757, (*spvDescriptorSet0.vp_c10)._m0[6].z, _983);
    int _1071 = ~_1057;
    int _1073 = _1071 + 1;
    int _1075 = _1073 + 1;
    float _1077 = _1059 + (-1.0);
    int _1079 = _1075;
    if (!_1017)
    {
        int _1081 = ~_1057;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    float _1087 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _1089 = _1009 >= 0.0;
    bool _1091 = isnan(_1009);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(0.0);
    bool _1097 = _1093 || _1095;
    float _1099 = _939 + _943;
    float _1101 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1103 = _1097 ? 0 : 1;
    float _1105 = _1099 + (-1.0);
    bool _1107 = _1009 > 0.0;
    float _1109 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1087);
    float _1111 = _1049 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = _1101 + _1113;
    float _1117 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1121 = ~_1103;
    int _1123 = _1121 + 1;
    int _1125 = _1123 + 1;
    float _1127 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _1131 = _1125;
    if (!_1107)
    {
        int _1133 = ~_1103;
        int _1135 = _1133 + 1;
        _1131 = _1135;
    }
    int _1137 = _1131;
    float _1139 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1117);
    float _1141 = _1069 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1143 = _1035 >= 0.0;
    bool _1145 = isnan(_1035);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1155 = _1111 + _1153;
    float _1157 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1055);
    bool _1159 = !_1039;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _1165 = !_1043;
    int _1167 = _1165 ? 0 : 1;
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1139);
    bool _1171 = !_1047;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1179 = _1177 != 0;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1183 = _1181 != 0;
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1187 = _1185 != 0;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = _1141 + _1189;
    int _1193 = _1151 ? 0 : 1;
    float _1195 = _1163 * _1129;
    bool _1197 = _1035 > 0.0;
    float _1199 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1175);
    float _1201 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1195);
    int _1203 = ~_1193;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1199);
    bool _1211 = !_1183;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1109);
    float _1217 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1219 = floor(_1201);
    int _1221 = abs(_1213);
    float _1223 = _1217 * _993;
    int _1225 = _1207;
    if (!_1197)
    {
        int _1227 = ~_1193;
        int _1229 = _1227 + 1;
        _1225 = _1229;
    }
    int _1231 = _1225;
    bool _1233 = !_1179;
    int _1235 = _1233 ? 0 : 1;
    float _1237 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1223);
    bool _1239 = !_1187;
    int _1241 = _1239 ? 0 : 1;
    float _1243 = rsqrt(_1157);
    bool _1245 = _1209 >= 0.0;
    float _1247 = in.m_69.x;
    float _1249 = in.m_69.y;
    float _1251 = in.m_69.z;
    int _1253 = abs(_1235);
    int _1255 = abs(_1241);
    float _1257 = -_1219;
    float _1259 = _1201 + _1257;
    float _1261 = floor(_1237);
    float _1263 = float(_1085);
    float _1265 = float(_1253);
    float _1267 = _1201 + 0.25;
    float _1269 = float(_1255);
    float _1271 = _1237 + 0.25;
    float _1273 = float(_1231);
    float _1275 = _1265 * _1263;
    float _1277 = floor(_1267);
    float _1279 = float(_1137);
    float _1281 = _1201 * 6.283185482025146484375;
    float _1283 = _1269 * _1273;
    float _1285 = float(_1221);
    float _1287 = -_1261;
    float _1289 = _1237 + _1287;
    float _1291 = 0.0;
    int _1293 = as_type<int>(_1279);
    if (_1245)
    {
        _1291 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1295 = _1291;
    float _1297 = _1283 * (-2.0);
    float _1299 = floor(_1271);
    float _1301 = _1285 * _1279;
    bool _1303 = _1259 >= 0.5;
    bool _1305 = isnan(_1259);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan(0.5);
    bool _1311 = _1307 || _1309;
    float _1313 = fma(_1297, _1251, _1251);
    if (_1245)
    {
        float _1315 = _1295 * 5.0;
        _1293 = as_type<int>(_1315);
    }
    int _1317 = _1293;
    bool _1319 = _1289 >= 0.5;
    bool _1321 = isnan(_1289);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    float _1329 = -_1277;
    float _1331 = _1267 + _1329;
    int _1333 = abs(_1167);
    float _1335 = _943 + (-0.5);
    bool _1337 = !_1311;
    float _1339 = _1337 ? 0.5 : (-0.5);
    float _1341 = _1331;
    if (_1245)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4218 = as_type<float>(_1317);
        out.gl_Position.z = _4218;
    }
    float _1343 = fma(_1119, _1297, _1119);
    float _1345 = _1281 * 0.15915493667125701904296875;
    float _1347 = _1237 * 6.283185482025146484375;
    float _1349 = -_1299;
    float _1351 = _1271 + _1349;
    float _1353 = _1115 * _1115;
    int _1355 = abs(_1173);
    float _1357 = _1351;
    if (_1245)
    {
        out.m_49.x = 0.0;
    }
    float _1359 = _1275 * (-2.0);
    float _1361 = float(_1355);
    float _1363 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1313);
    float _1365 = float(_1333);
    float _1367 = fma(_1155, _1155, _1353);
    float _1369 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1371 = _1369 * 2.0;
    int _1373 = abs(_1161);
    float _1375 = fma(_1343, _1031, _1363);
    float _1377 = fma(_1191, _1191, _1367);
    float _1379 = _1345 * 6.283185482025146484375;
    float _1381 = sin(_1379);
    float _1383 = _1365 * _1371;
    bool _1385 = !_1063;
    int _1387 = _1385 ? 0 : 1;
    bool _1389 = _1331 > 0.5;
    int _1391 = abs(_1387);
    float _1393 = rsqrt(_1377);
    bool _1395 = !_1327;
    float _1397 = _1395 ? 0.5 : (-0.5);
    float _1399 = _1347 * 0.15915493667125701904296875;
    float _1401 = float(_1391);
    float _1403 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1405 = _1403 * 2.0;
    float _1407 = float(_1373);
    float _1409 = _1399 * 6.283185482025146484375;
    float _1411 = sin(_1409);
    float _1413 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _1415 = !_1053;
    int _1417 = _1415 ? 0 : 1;
    float _1419 = _1401 * _1405;
    bool _1421 = _1351 > 0.5;
    float _1423 = fma(_1407, _1413, _1383);
    int _1425 = abs(_1417);
    if (_1389)
    {
        float _1427 = -_1331;
        float _1429 = _1427 + 1.0;
        _1341 = _1429;
    }
    float _1431 = _1341;
    float _1433 = _1115 * _1393;
    float _1435 = _1155 * _1393;
    float _1437 = float(_1425);
    float _1439 = fma(_1431, 4.0, -1.0);
    float _1441 = -_1433;
    float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1445 = -_1435;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1155);
    float _1449 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1451 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1453 = _1443 * _1443;
    if (_1421)
    {
        float _1455 = -_1351;
        float _1457 = _1455 + 1.0;
        _1357 = _1457;
    }
    float _1459 = _1357;
    float _1461 = fma(_1361, _1449, _1423);
    float _1463 = fma(_1437, _1451, _1419);
    float _1465 = fma(_1447, _1447, _1453);
    float _1467 = rsqrt(_1169);
    float _1469 = fma(_1459, 4.0, -1.0);
    float _1471 = fma(_1461, 3.1415927410125732421875, _1247);
    bool _1473 = !_1067;
    int _1475 = _1473 ? 0 : 1;
    if (_1245)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1477 = -_1433;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1101);
    float _1481 = fma(_1127, _1359, _1127);
    float _1483 = -_1435;
    float _1485 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1487 = fma(_1471, _1359, _1471);
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1491 = _1479 + _1489;
    int _1493 = abs(_1475);
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1497 = _1485 + _1495;
    float _1499 = _1375 * 0.15915493667125701904296875;
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1503 = _1191 * _1393;
    float _1505 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1507 = _941 + _943;
    float _1509 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1501);
    float _1511 = float(_1493);
    float _1513 = -_1503;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1517 = rsqrt(_1215);
    float _1519 = _939 + (-0.5);
    float _1521 = _1507 + (-1.0);
    float _1523 = fma(_1511, _1505, _1463);
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1527 = _1515 + _1525;
    float _1529 = _1301 * (-2.0);
    float _1531 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1487);
    float _1533 = fma(_1523, 3.1415927410125732421875, _1249);
    float _1535 = sqrt(_1215);
    float _1537 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1509);
    float _1539 = _941 + (-0.5);
    float _1541 = fma(_1533, _1529, _1533);
    float _1543 = -_1503;
    float _1545 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1191);
    float _1547 = fma(_1481, _1031, _1531);
    bool _1549 = _1537 >= 0.0;
    float _1551 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1541);
    float _1553 = fma(_1545, _1545, _1465);
    float _1555 = _1547 * 0.15915493667125701904296875;
    float _1557 = _933 * _1243;
    float _1559 = _931 * _1517;
    float _1561 = _911 * _1467;
    float _1563 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1565 = _1499 * 6.283185482025146484375;
    float _1567 = cos(_1565);
    float _1569 = _1535 * _1559;
    float _1571 = _1535 * _1557;
    float _1573 = fma(_1563, _1529, _1563);
    float _1575 = _1535 * _1561;
    float _1577 = _1573;
    if (_1549)
    {
        out.m_49.x = 0.0;
    }
    float _1579 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1581 = fma(_1573, _1031, _1551);
    float _1583 = sqrt(_1553);
    if (_1549)
    {
        _1577 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1585 = _1577;
    float _1587 = _1581 * 0.15915493667125701904296875;
    float _1589 = _989 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1591 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1593 = as_type<int>(_1585);
    if (_1549)
    {
        float _1595 = _1585 * 5.0;
        _1593 = as_type<int>(_1595);
    }
    int _1597 = _1593;
    float _1599 = _1555 * 6.283185482025146484375;
    float _1601 = cos(_1599);
    if (_1549)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4626 = as_type<float>(_1597);
        out.gl_Position.z = _4626;
    }
    float _1603 = _1499 * 6.283185482025146484375;
    float _1605 = sin(_1603);
    float _1607 = _1393 * _1583;
    float _1609 = _1555 * 6.283185482025146484375;
    float _1611 = sin(_1609);
    float _1613 = _1601 * _1567;
    float _1615 = _1587 * 6.283185482025146484375;
    float _1617 = sin(_1615);
    if (_1549)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1619 = _1587 * 6.283185482025146484375;
    float _1621 = cos(_1619);
    float _1623 = _1611 * _1605;
    float _1625 = _1607 * _1589;
    float _1627 = _1607 * _1591;
    float _1629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1569);
    float _1631 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1571);
    float _1633 = _1607 * _1579;
    float _1635 = fma(_1617, _1623, _1613);
    float _1637 = fma(_1617, _1613, _1623);
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1575);
    float _1641 = _1601 * _1605;
    float _1643 = _1611 * _1567;
    float _1645 = _1627 * _1629;
    float _1647 = _1625 * _1631;
    float _1649 = _1633 * _1639;
    float _1651 = -_1641;
    float _1653 = fma(_1617, _1643, _1651);
    float _1655 = _1601 * _1621;
    float _1657 = _1611 * _1621;
    float _1659 = _1621 * _1645;
    float _1661 = _1635 * _1647;
    float _1663 = _1653 * _1647;
    float _1665 = -_1643;
    float _1667 = fma(_1617, _1641, _1665);
    float _1669 = _1657 * _1647;
    float _1671 = fma(_1605, _1659, _1661);
    float _1673 = fma(_1567, _1659, _1663);
    float _1675 = -_1617;
    float _1677 = fma(_1675, _1645, _1669);
    float _1679 = fma(_1667, _1649, _1671);
    float _1681 = fma(_1637, _1649, _1673);
    float _1683 = fma(_1655, _1649, _1677);
    float _1685 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1687 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1689 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1691 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1693 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1685);
    float _1695 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1687);
    float _1697 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1689);
    float _1699 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1701 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1693);
    float _1703 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1695);
    float _1705 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1697);
    float _1707 = _1691 * _1691;
    float _1709 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1713 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1715 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1717 = _1709 * _1709;
    float _1719 = fma(_1699, _1699, _1707);
    float _1721 = fma(_1711, _1711, _1717);
    float _1723 = fma(_1715, _1715, _1719);
    float _1725 = fma(_1713, _1713, _1721);
    float _1727 = rsqrt(_1723);
    float _1729 = rsqrt(_1725);
    float _1731 = _1691 * _1727;
    float _1733 = sqrt(_1723);
    float _1735 = _1699 * _1727;
    float _1737 = _1715 * _1727;
    float _1739 = _1709 * _1729;
    float _1741 = _1711 * _1729;
    float _1743 = _1713 * _1729;
    float _1745 = _1731 * _1739;
    float _1747 = fma(_1735, _1741, _1745);
    float _1749 = fma(_1737, _1743, _1747);
    float _1751 = _1749 * _1733;
    float _1753 = fma(_1735, _1751, _1711);
    float _1755 = fma(_1737, _1751, _1713);
    float _1757 = fma(_1731, _1751, _1709);
    float _1759 = _1111 + _1753;
    float _1761 = _1141 + _1755;
    float _1763 = _1101 + _1757;
    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1767 = _1759 + _1765;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1771 = _1761 + _1769;
    float _1773 = _1767 * _1767;
    float _1775 = _1771 * _1771;
    float _1777 = _1773 + _1775;
    float _1779 = sqrt(_1777);
    bool _1781 = _1779 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1783 = _1709;
    float _1785 = _1759;
    float _1787 = _1729;
    float _1789 = _1773;
    float _1791 = _1775;
    if (!_1781)
    {
        _1783 = _1759;
    }
    float _1793 = _1783;
    float _1795 = _1793;
    if (!_1781)
    {
        _1785 = _1761;
    }
    float _1797 = _1785;
    float _1799 = _1797;
    if (!_1781)
    {
        _1787 = _1763;
    }
    float _1801 = _1787;
    bool _1803 = !_1781;
    float _1805 = _1801;
    if (!_1803)
    {
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1811 = _1779 + _1809;
        float _1813 = _1763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = rsqrt(_1777);
        float _1817 = _1811 * _1807;
        float _1819 = _1817 * 0.15915493667125701904296875;
        float _1821 = _1819 * 6.283185482025146484375;
        float _1823 = sin(_1821);
        float _1825 = _1819 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = fma(_1823, _1813, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1831 = _1815 * _1829;
        float _1833 = _1827 + (-1.0);
        float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1837 = _1767 * _1831;
        float _1839 = _1771 * _1831;
        float _1841 = fma(_1763, _1827, _1835);
        float _1843 = _1837 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1845 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1847 = _1837 * _1837;
        float _1849 = _1839 * _1839;
        _1805 = _1841;
        _1789 = _1847;
        _1791 = _1849;
        _1795 = _1843;
        _1799 = _1845;
    }
    float _1851 = _1805;
    float _1853 = _1789;
    float _1855 = _1791;
    float _1857 = _1795;
    float _1859 = _1799;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1863 = _1851 + _1861;
    out.m_59.x = _809;
    out.m_59.y = _811;
    out.m_59.z = _815;
    out.m_59.w = _817;
    float _1865 = fma(_1863, _1863, _1853);
    out.m_61.x = _819;
    out.m_61.y = _821;
    out.m_61.z = _823;
    float _1867 = _1865 + _1855;
    float _1869 = sqrt(_1867);
    bool _1871 = _1869 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1873 = isnan(_1869);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1879 = _1875 || _1877;
    float _1881 = _1853;
    if (!_1879)
    {
        _1881 = 1.0;
    }
    float _1883 = _1881;
    bool _1885 = !_1879;
    float _1887 = _1883;
    if (!_1885)
    {
        bool _1889 = _1869 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1891 = isnan(_1869);
        bool _1893 = _1889 || _1891;
        bool _1895 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1897 = _1893 || _1895;
        if (!_1897)
        {
            float _1899 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1901 = _1869 + _1899;
            float _1903 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1905 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1903;
            float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1909 = _1907 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1911 = 1.0 / _1905;
            float _1913 = _1901 * _1911;
            float _1915 = fma(_1913, _1909, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1887 = _1915;
            _1917 = true;
        }
        else
        {
            bool _1919 = _1869 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1921 = isnan(_1869);
            bool _1923 = _1919 || _1921;
            bool _1925 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1927 = _1923 || _1925;
            if (!_1927)
            {
                float _1929 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1931 = _1869 + _1929;
                float _1933 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1935 = _1933 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1937 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1939 = _1937 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1941 = 1.0 / _1935;
                float _1943 = _1931 * _1941;
                float _1945 = fma(_1943, _1939, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1887 = _1945;
                _1917 = true;
            }
            else
            {
                _1887 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1917 = false;
    float _1947 = _1887;
    float _1949 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1951 = _1851 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1955 = _1857 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1959 = _1859 + _1957;
    float _1961 = fma(_1951, _1947, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1963 = fma(_1955, _1947, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1965 = fma(_1959, _1947, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1967 = -_1433;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1961);
    float _1971 = -_1435;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1963);
    float _1975 = -_1503;
    float _1977 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1965);
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1981 = _1969 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1985 = _1973 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1989 = _1977 + _1987;
    float _1991 = _1981 * _1981;
    float _1993 = fma(_1985, _1985, _1991);
    float _1995 = fma(_1989, _1989, _1993);
    float _1997 = rsqrt(_1995);
    float _1999 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2001 = _1985 * _1999;
    float _2003 = _1989 * _1999;
    float _2005 = _2001 * _2001;
    float _2007 = _2003 * _2003;
    float _2009 = _2005 + _2007;
    float _2011 = sqrt(_2009);
    bool _2013 = _2011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2017 = _2011 + _2015;
    float _2019 = _1997;
    float _2021 = _2009;
    float _2023 = _2017;
    float _2025 = _1981;
    float _2027 = _1999;
    float _2029 = _2001;
    if (_2013)
    {
        float _2031 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2019 = _2031;
    }
    float _2033 = _2019;
    if (_2013)
    {
        float _2035 = rsqrt(_2009);
        _2021 = _2035;
    }
    float _2037 = _2021;
    if (_2013)
    {
        float _2039 = _2017 * _2033;
        _2023 = _2039;
    }
    float _2041 = _2023;
    if (_2013)
    {
        float _2043 = _2041 * 0.15915493667125701904296875;
        _841 = _2043;
    }
    float _2045 = _841;
    float _2047 = _2033;
    float _2049 = _2045;
    if (_2013)
    {
        float _2051 = _2045 * 6.283185482025146484375;
        float _2053 = sin(_2051);
        _2047 = _2053;
    }
    float _2055 = _2047;
    float _2057 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2059 = precise::max(0.0, _2057);
    float _2061 = _1989;
    float _2063 = _2059;
    if (_2013)
    {
        float _2065 = _2045 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        _2061 = _2067;
    }
    float _2069 = _2061;
    float _2071 = -_1999;
    float _2073 = -_2059;
    float _2075 = fma(_1981, _2071, _2073);
    if (!_2013)
    {
        _2025 = _2003;
    }
    float _2077 = _2025;
    float _2079 = _2077;
    if (_2013)
    {
        float _2081 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2063 = _2081;
    }
    float _2083 = _2063;
    float _2085 = _2055;
    float _2087 = _2083;
    if (_2013)
    {
        float _2089 = fma(_2055, _2083, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2085 = _2089;
    }
    float _2091 = _2085;
    float _2093 = _2091;
    float _2095 = _2069;
    if (_2013)
    {
        float _2097 = _2069 + (-1.0);
        _2087 = _2097;
    }
    float _2099 = _2087;
    float _2101 = _2099;
    if (_2013)
    {
        float _2103 = _2037 * _2091;
        _2027 = _2103;
    }
    float _2105 = _2027;
    if (!_2013)
    {
        _2093 = _2075;
    }
    float _2107 = _2093;
    float _2109 = sqrt(_1995);
    float _2111 = _2107;
    if (_2013)
    {
        float _2113 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2049 = _2113;
    }
    float _2115 = _2049;
    if (_2013)
    {
        float _2117 = _2001 * _2105;
        _2029 = _2117;
    }
    float _2119 = _2029;
    if (!_2013)
    {
        _2101 = _2005;
    }
    float _2121 = _2101;
    float _2123 = _2121;
    if (_2013)
    {
        float _2125 = _2003 * _2105;
        _2079 = _2125;
    }
    float _2127 = _2079;
    if (_2013)
    {
        float _2129 = fma(_2075, _2069, _2115);
        _2111 = _2129;
    }
    float _2131 = _2111;
    if (_2013)
    {
        float _2133 = _2119 * _2119;
        _2123 = _2133;
    }
    float _2135 = _2123;
    if (!_2013)
    {
        _2095 = _2007;
    }
    float _2137 = _2095;
    float _2139 = _2137;
    if (_2013)
    {
        float _2141 = _2127 * _2127;
        _2139 = _2141;
    }
    float _2143 = _2139;
    float _2145 = fma(_2131, _2131, _2135);
    float _2147 = _2145 + _2143;
    float _2149 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2153 = fma(_2109, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2151);
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    float _2157 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2159 = rsqrt(_2147);
    float _2161 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2149);
    float _2163 = -_2155;
    float _2165 = _2163 + 1.0;
    float _2167 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2169 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2157);
    float _2171 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2161);
    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2175 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2167);
    float _2177 = abs(_2165);
    float _2179 = log2(_2177);
    float _2181 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2183 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2169);
    float _2185 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2175);
    float _2187 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2189 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2191 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2193 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2195 = _2159 * _2119;
    float _2197 = -_2189;
    float _2199 = fma(_2197, _2173, 1.0);
    float _2201 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2187);
    float _2203 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2205 = _2159 * _2131;
    float _2207 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2209 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2201);
    float _2211 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2203);
    float _2213 = _2159 * _2127;
    float _2215 = -_2207;
    float _2217 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2215);
    float _2219 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2221 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2223 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2211);
    float _2225 = -_2213;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2217);
    float _2229 = log2(_2199);
    float _2231 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2233 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2223);
    float _2235 = fma(_2227, -0.5, 0.5);
    float _2237 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2239 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2231);
    float _2241 = fma(_2227, 0.5, 0.5);
    float _2243 = _2205 + 1.0;
    float _2245 = exp2(_2221);
    float _2247 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2237);
    float _2249 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2239);
    float _2251 = fma(_2241, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2253 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2247);
    float _2255 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2249);
    float _2257 = fma(_2241, _2251, -0.212114393711090087890625);
    float _2259 = 1.0 / _2233;
    float _2261 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2253);
    float _2263 = fma(_2241, _2257, 1.570728778839111328125);
    float _2265 = sqrt(_2235);
    float _2267 = -_2205;
    float _2269 = fma(_2245, _2243, _2267);
    float _2271 = _2229 * 0.693147182464599609375;
    float _2273 = fma(_2269, 0.5, 0.5);
    float _2275 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2277 = _2255 * _2259;
    float _2279 = _2261 * _2259;
    float _2281 = fma(_2277, 0.5, 0.5);
    float _2283 = fma(_2279, -0.5, 0.5);
    float _2285 = _2265 * 0.636619746685028076171875;
    float3 _5769 = float3(_2281, _2283, _2275);
    float _2287 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5769, float3(0.0), isnan(_5769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5769, float3(0.0), isnan(_5769)), level(0.0)).x;
    float _2289 = -_2263;
    float _2291 = fma(_2285, _2289, 1.0);
    float3 _5785 = float3(_2281, _2283, _2275);
    float4 _2293 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5785, float3(0.0), isnan(_5785)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5785, float3(0.0), isnan(_5785)), level(0.0)).xyzw;
    float _2295 = _2293.x;
    float _2297 = _2293.y;
    float _2299 = _2293.z;
    float _2301 = _2293.w;
    float2 _5801 = float2(_2291, _2273);
    float3 _2305 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5801, float2(0.0), isnan(_5801)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5801, float2(0.0), isnan(_5801)), level(0.0)).xyz;
    float _2307 = _2305.x;
    float _2309 = _2305.y;
    float _2311 = _2305.z;
    float _2313 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2315 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2317 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2315);
    float _2319 = exp2(_2313);
    float _2321 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2317);
    float _2323 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2321);
    float _2325 = _2323 + _2233;
    float _2327 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2255;
    out.gl_Position.y = _2261;
    out.gl_Position.z = _2323;
    out.gl_Position.w = _2233;
    float _2329 = _2325 * 0.5;
    float _2331 = -_2319;
    float _2333 = _2331 + 1.0;
    out.m_49.x = _2327;
    float _2335 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2329;
    out.m_71.w = _2233;
    float _2337 = _2335 * _2287;
    float _2339 = -_2335;
    float _2341 = _2339 + 1.0;
    float _2343 = _2301 * _2337;
    float _2345 = _2311 * _2337;
    float _2347 = fma(_2307, _2343, _2295);
    float _2349 = fma(_2309, _2343, _2297);
    float _2351 = _2301 * _2341;
    float _2353 = fma(_2301, _2345, _2299);
    out.m_73.x = _2347;
    out.m_73.y = _2349;
    out.m_73.z = _2353;
    out.m_73.w = _2351;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1917 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_46.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_113);
        out.gl_Position.z = _2411;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = _131;
    if (_127)
    {
        float _135 = float(_97);
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2481 = as_type<float>(_151);
        out.gl_Position.z = _2481;
    }
    if (_143)
    {
        return out;
    }
    int _153 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _155 = _153;
    int _157 = 0;
    int _159 = _88(_155, _157, (*spvDescriptorSet0.support_buffer));
    float _161 = in.m_53.z;
    float _163 = in.m_55.z;
    float _165 = _131 + _161;
    float _167 = _165 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _169 = trunc(_163);
    int _171 = int(_169);
    float _173 = float(_159);
    int _175 = abs(_159);
    bool _177 = _159 == 0;
    float _179 = _167 * _173;
    float _181 = float(uint(_175));
    float _183 = trunc(_179);
    int _185 = int(_183);
    float _187 = 1.0 / _181;
    int _189 = abs(_185);
    uint _192 = uint(int(uint(_185) >> uint(31)));
    float _194 = float(uint(_189));
    int _196 = ~int(_192);
    int _198 = _196 + 1;
    int _200 = as_type<int>(_187) + (-2);
    float _202 = as_type<float>(_200) * _194;
    float _204 = trunc(_202);
    float _206 = precise::max(_204, 0.0);
    uint _208 = uint(_206);
    int _210 = ~int(_208);
    int _212 = _210 + 1;
    int _214 = _212 * _175;
    int _216 = _214 + _189;
    float _218 = float(uint(_216));
    float _220 = as_type<float>(_200) * _218;
    float _222 = trunc(_220);
    float _224 = precise::max(_222, 0.0);
    uint _226 = uint(_224);
    int _228 = int(_208) + int(_226);
    int _230 = ~_228;
    int _232 = _230 + 1;
    int _234 = _232 * _175;
    int _236 = _234 + _189;
    bool _238 = uint(_236) >= uint(_175);
    bool _240 = !_238;
    int _242 = _240 ? 0 : (-1);
    int _244 = ~_228;
    int _246 = _244 + _242;
    int _248 = _246 + 1;
    int _250 = _248 * _175;
    int _252 = _250 + _189;
    int _254 = _252 ^ _198;
    int _256 = ~_198;
    int _258 = _256 + _254;
    int _260 = _258 + 1;
    bool _262 = !_177;
    int _264 = _262 ? _260 : (-1);
    int _266 = _264;
    int _268 = 0;
    int _270 = _89(_266, _268, (*spvDescriptorSet0.support_buffer));
    int _272 = _171;
    int _274 = 0;
    int _276 = _89(_272, _274, (*spvDescriptorSet0.support_buffer));
    float4 _279 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_270, _276)), 0).xyzw;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = _279.w;
    float _289 = in.m_53.x;
    float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _293 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _295 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _297 = in.m_53.y;
    float _299 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _301 = in.m_55.x;
    float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _305 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _307 = _305 != 0;
    float _309 = in.m_55.y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _313 = _293 * _291;
    float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _319 = _317 != 0;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _325 = _323 != 0;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _329 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[20].x, _313);
    float _331 = _295 * _303;
    float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _335 = _297 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _337 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[20].y, _331);
    bool _339 = _289 > 0.5;
    bool _341 = _339 && _319;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _345 = fma(_335, -2.0, _327);
    float _347 = _329 * 6.283185482025146484375;
    float _349 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[78].w, _311);
    float _351 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[79].z, _343);
    float _353 = floor(_329);
    float _355 = _347 * 0.15915493667125701904296875;
    float _357 = _337 * 6.283185482025146484375;
    bool _359 = _297 > 0.5;
    bool _361 = _359 && _325;
    float _363 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[79].x, _351);
    float _365 = _357 * 0.15915493667125701904296875;
    float _367 = _289 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _369 = _363 * (-0.15915493667125701904296875);
    float _371 = 0.0;
    float _373 = _363;
    float _375 = _309;
    if (_319)
    {
        _371 = _301;
    }
    float _377 = _371;
    float _379 = floor(_337);
    float _381 = -_321;
    float _383 = fma(_367, 2.0, _381);
    bool _385 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _389 = _385 || _387;
    bool _391 = isnan(1.0);
    bool _393 = _389 || _391;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _397 = _377;
    if (_341)
    {
        float _399 = -_377;
        float _401 = _399 + 1.0;
        _397 = _401;
    }
    float _403 = _397;
    if (!_319)
    {
        _373 = _301;
    }
    float _405 = _373;
    float _407 = -_353;
    float _409 = _329 + _407;
    float _411 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[78].z, _395);
    float _413 = _355 * 6.283185482025146484375;
    float _415 = cos(_413);
    float _417 = _405;
    if (_319)
    {
        _417 = _403;
    }
    float _419 = _417;
    float _421 = _315 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _423 = _333 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _425 = _421;
    if (_361)
    {
        float _427 = -_309;
        float _429 = _427 + 1.0;
        _375 = _429;
    }
    float _431 = _375;
    float _433 = fma(_421, _419, -0.5);
    if (!_393)
    {
        float _435 = _299 * _299;
        float _437 = _435 * 0.5;
        _425 = _437;
    }
    float _439 = _425;
    float _441 = _365 * 6.283185482025146484375;
    float _443 = cos(_441);
    float _445 = fma(_423, _431, -0.5);
    float _447 = -_379;
    float _449 = _337 + _447;
    float _451 = _439;
    if (!_393)
    {
        float _453 = _439 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _451 = _453;
    }
    float _455 = _451;
    float _457 = _369 * 6.283185482025146484375;
    float _459 = sin(_457);
    float _461 = fma(_415, 0.5, 0.5);
    float _463 = _415;
    float _465 = _455;
    if (!_393)
    {
        _463 = _299;
    }
    float _467 = _463;
    float _469 = _369 * 6.283185482025146484375;
    float _471 = cos(_469);
    float _473 = fma(_443, 0.5, 0.5);
    float _475 = _459 * _445;
    bool _477 = !_393;
    float _479 = _467;
    if (!_477)
    {
        float _481 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _483 = log2(_481);
        float _485 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _487 = _485 + 1.0;
        float _489 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _491 = _299 * _483;
        float _493 = 1.0 / _487;
        float _495 = _489 * 0.693147182464599609375;
        float _497 = exp2(_491);
        float _499 = 1.0 / _495;
        float _501 = _497 + (-1.0);
        float _503 = -_501;
        float _505 = fma(_503, _499, _299);
        float _507 = _505 * _493;
        float _509 = _507 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _465 = _509;
    }
    float _511 = _465;
    bool _513 = !_393;
    if (!_513)
    {
        float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _517 = log2(_515);
        float _519 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _521 = _519 + 1.0;
        float _523 = 1.0 / _521;
        float _525 = _299 * _517;
        float _527 = exp2(_525);
        float _529 = -_527;
        float _531 = _529 + 1.0;
        float _533 = _531 * _523;
        _479 = _533;
    }
    float _535 = _479;
    float _537 = _471 * _445;
    float _539 = -_475;
    float _541 = fma(_471, _433, _539);
    float _543 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _411);
    float _545 = fma(_459, _433, _537);
    float _547 = in.m_51.x;
    float _549 = in.m_51.y;
    float _551 = in.m_51.z;
    bool _553 = _409 < 0.5;
    float _555 = float(_553);
    float _557 = -_409;
    float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _567 = _565 != 0;
    float _569 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _349);
    float _571 = -_555;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _575 = -_461;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _579 = _449 < 0.5;
    float _581 = float(_579);
    float _583 = -_131;
    float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[76].x, _383);
    float _587 = -_449;
    float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _591 = !_563;
    int _593 = _591 ? 0 : 1;
    float _595 = -_473;
    float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _599 = -_581;
    float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _603 = !_307;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_543, _541, _585);
    int _609 = abs(_593);
    bool _611 = !_567;
    int _613 = _611 ? 0 : 1;
    float _615 = _607 + 0.5;
    int _617 = abs(_605);
    float _619 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _345);
    float _621 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _623 = abs(_613);
    float _625 = float(_609);
    float _627 = -_619;
    float _629 = fma(_569, _545, _627);
    float _631 = fma(_535, _547, _621);
    float _633 = float(_617);
    float _635 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _637 = abs(_559);
    float _639 = _625 * _637;
    float _641 = abs(_589);
    float _643 = _625 * _641;
    float _645 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _647 = float(_623);
    float _649 = fma(_633, _577, _639);
    float _651 = fma(_633, _597, _643);
    float _653 = fma(_535, _549, _635);
    float _655 = fma(_535, _551, _645);
    float _657 = abs(_573);
    float _659 = fma(_647, _657, _649);
    int _661 = _264 + 1;
    float _663 = abs(_601);
    float _665 = fma(_647, _663, _651);
    float _667 = in.m_46.x;
    float _669 = in.m_46.y;
    float _671 = in.m_46.z;
    uint _673 = as_type<uint>(half2(float2(_287, 0.0)));
    float _675 = _629 + 0.5;
    int _677 = abs(_661);
    uint _679 = extract_bits(_673, 0u, 8u);
    int _681 = int(_679) & 255;
    uint _683 = extract_bits(_673, 8u, 8u);
    int _685 = int(_683) & 255;
    int _687 = _685 << 8;
    int _689 = _681 | _687;
    float _691 = float(uint(_677));
    uint _693 = uint(int(uint(_661) >> uint(31)));
    float _695 = as_type<float>(_200) * _691;
    int _697 = ~int(_693);
    int _699 = _697 + 1;
    float _701 = trunc(_695);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    int _707 = ~int(_705);
    int _709 = _707 + 1;
    int _711 = _709 * _175;
    int _713 = _711 + _677;
    float _715 = float(uint(_713));
    float _717 = as_type<float>(_200) * _715;
    float _719 = trunc(_717);
    float _721 = precise::max(_719, 0.0);
    uint _723 = uint(_721);
    int _725 = int(_705) + int(_723);
    float _727 = in.m_57.x;
    float _729 = in.m_57.y;
    float _731 = in.m_57.z;
    float _733 = in.m_57.w;
    int _735 = ~_725;
    int _737 = _735 + 1;
    int _739 = _737 * _175;
    int _741 = _739 + _677;
    bool _743 = uint(_741) >= uint(_175);
    bool _745 = !_743;
    int _747 = _745 ? 0 : (-1);
    bool _749 = _689 >= 32768;
    int _751 = ~_725;
    int _753 = _751 + _747;
    int _755 = _753 + 1;
    float _757 = fma(_655, _733, _671);
    int _759 = _755 * _175;
    int _761 = _759 + _677;
    int _763 = _689 + (-1024);
    float _765 = fma(_631, _733, _667);
    float _767 = fma(_653, _733, _669);
    float _769 = _727 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _771 = _761 ^ _699;
    float _773 = _729 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _775 = _763;
    if (_749)
    {
        int _777 = ~_689;
        int _779 = _777 + 33792;
        int _781 = _779 + 1;
        _775 = _781;
    }
    int _783 = _775;
    float _785 = _731 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _787 = ~_699;
    int _789 = _787 + _771;
    int _791 = _789 + 1;
    int _793 = _783 + 30719;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _805 = float(_793);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _809 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = fma(_805, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _815 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _819 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _823 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = abs(_813);
    float _827 = -_825;
    float _829 = _827 + 1.0;
    out.m_59.x = _809;
    out.m_59.y = _811;
    out.m_59.z = _815;
    out.m_59.w = _817;
    bool _831 = !_177;
    int _833 = _831 ? _791 : (-1);
    out.m_61.x = _819;
    out.m_61.y = _821;
    out.m_61.z = _823;
    int _835 = as_type<int>(_829) + (-218103808);
    bool _837 = uint(_835) >= 1920991232u;
    bool _839 = !_837;
    float _841 = _821;
    if (!_839)
    {
        int _843;
        _86(_843, out.gl_Position, out.gl_PointSize);
    }
    int _845 = _833;
    int _847 = 0;
    int _849 = _89(_845, _847, (*spvDescriptorSet0.support_buffer));
    int _851 = _171;
    int _853 = 0;
    int _855 = _89(_851, _853, (*spvDescriptorSet0.support_buffer));
    float4 _857 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_849, _855)), 0).xyzw;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = _857.w;
    float _867 = floor(_179);
    float _869 = -_867;
    float _871 = _179 + _869;
    uint _873 = as_type<uint>(half2(float2(_865, 0.0)));
    float _875 = -_285;
    float _877 = _875 + _863;
    uint _879 = extract_bits(_873, 0u, 8u);
    int _881 = int(_879) & 255;
    uint _883 = extract_bits(_873, 8u, 8u);
    int _885 = int(_883) & 255;
    int _887 = _885 << 8;
    int _889 = _881 | _887;
    bool _891 = _889 >= 32768;
    int _893 = _889 + (-1024);
    int _895 = _893;
    if (_891)
    {
        int _897 = ~_889;
        int _899 = _897 + 33792;
        int _901 = _899 + 1;
        _895 = _901;
    }
    int _903 = _895;
    int _905 = _903 + 30719;
    float _907 = float(_905);
    float _909 = fma(_907, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _911 = fma(_871, _877, _285);
    float _913 = abs(_909);
    float _915 = -_913;
    float _917 = _915 + 1.0;
    int _919 = as_type<int>(_917) + (-218103808);
    float _921 = -_281;
    float _923 = _921 + _859;
    bool _925 = uint(_919) >= 1920991232u;
    float _927 = -_283;
    float _929 = _927 + _861;
    float _931 = fma(_871, _923, _281);
    float _933 = fma(_871, _929, _283);
    bool _935 = !_925;
    if (!_935)
    {
        int _937;
        _86(_937, out.gl_Position, out.gl_PointSize);
    }
    float _939 = in.m_53.x;
    float _941 = in.m_53.y;
    float _943 = in.m_53.z;
    float _945 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _947 = log2(_945);
    float _949 = _767 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_63.x = _615;
    out.m_63.y = _675;
    float _951 = _767 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _953 = _767 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _957 = 1.0 + _955;
    bool _959 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _961 = isnan(1.0);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _967 = _963 || _965;
    float _969 = _659 * _769;
    bool _971 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _973 = isnan(0.0);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _979 = _975 || _977;
    float _981 = 1.0 / _957;
    float _983 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[6].x, _953);
    float _985 = in.m_65.w;
    float _987 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[4].x, _949);
    float _989 = _665 * _773;
    float _991 = _947 * _131;
    float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _995 = _943 * 2.0;
    float _997 = _939 * 2.0;
    float _999 = exp2(_991);
    float _1001 = floor(_995);
    out.m_67.w = _985;
    float _1003 = -_999;
    float _1005 = _1003 + 1.0;
    float _1007 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[5].x, _951);
    float _1009 = floor(_997);
    float _1011 = _979 ? _1005 : 0.0;
    float _1013 = fma(_757, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1007);
    float _1015 = _941 * 2.0;
    bool _1017 = _1001 > 0.0;
    bool _1019 = _1001 >= 0.0;
    bool _1021 = isnan(_1001);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan(0.0);
    bool _1027 = _1023 || _1025;
    if (_967)
    {
        float _1029 = _1011 * _981;
        _133 = _1029;
    }
    float _1031 = _133;
    float _1033 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1035 = floor(_1015);
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1043 = _1041 != 0;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1047 = _1045 != 0;
    float _1049 = fma(_757, (*spvDescriptorSet0.vp_c10)._m0[4].z, _987);
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1053 = _1051 != 0;
    float _1055 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1033);
    int _1057 = _1027 ? 0 : 1;
    float _1059 = _941 + _939;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1067 = _1065 != 0;
    float _1069 = fma(_757, (*spvDescriptorSet0.vp_c10)._m0[6].z, _983);
    int _1071 = ~_1057;
    int _1073 = _1071 + 1;
    int _1075 = _1073 + 1;
    float _1077 = _1059 + (-1.0);
    int _1079 = _1075;
    if (!_1017)
    {
        int _1081 = ~_1057;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    float _1087 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _1089 = _1009 >= 0.0;
    bool _1091 = isnan(_1009);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(0.0);
    bool _1097 = _1093 || _1095;
    float _1099 = _939 + _943;
    float _1101 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1103 = _1097 ? 0 : 1;
    float _1105 = _1099 + (-1.0);
    bool _1107 = _1009 > 0.0;
    float _1109 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1087);
    float _1111 = _1049 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = _1101 + _1113;
    float _1117 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1121 = ~_1103;
    int _1123 = _1121 + 1;
    int _1125 = _1123 + 1;
    float _1127 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _1131 = _1125;
    if (!_1107)
    {
        int _1133 = ~_1103;
        int _1135 = _1133 + 1;
        _1131 = _1135;
    }
    int _1137 = _1131;
    float _1139 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1117);
    float _1141 = _1069 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1143 = _1035 >= 0.0;
    bool _1145 = isnan(_1035);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1155 = _1111 + _1153;
    float _1157 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1055);
    bool _1159 = !_1039;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _1165 = !_1043;
    int _1167 = _1165 ? 0 : 1;
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1139);
    bool _1171 = !_1047;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1179 = _1177 != 0;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1183 = _1181 != 0;
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1187 = _1185 != 0;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = _1141 + _1189;
    int _1193 = _1151 ? 0 : 1;
    float _1195 = _1163 * _1129;
    bool _1197 = _1035 > 0.0;
    float _1199 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1175);
    float _1201 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1195);
    int _1203 = ~_1193;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1199);
    bool _1211 = !_1183;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1109);
    float _1217 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1219 = floor(_1201);
    int _1221 = abs(_1213);
    float _1223 = _1217 * _993;
    int _1225 = _1207;
    if (!_1197)
    {
        int _1227 = ~_1193;
        int _1229 = _1227 + 1;
        _1225 = _1229;
    }
    int _1231 = _1225;
    bool _1233 = !_1179;
    int _1235 = _1233 ? 0 : 1;
    float _1237 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1223);
    bool _1239 = !_1187;
    int _1241 = _1239 ? 0 : 1;
    float _1243 = rsqrt(_1157);
    bool _1245 = _1209 >= 0.0;
    float _1247 = in.m_69.x;
    float _1249 = in.m_69.y;
    float _1251 = in.m_69.z;
    int _1253 = abs(_1235);
    int _1255 = abs(_1241);
    float _1257 = -_1219;
    float _1259 = _1201 + _1257;
    float _1261 = floor(_1237);
    float _1263 = float(_1085);
    float _1265 = float(_1253);
    float _1267 = _1201 + 0.25;
    float _1269 = float(_1255);
    float _1271 = _1237 + 0.25;
    float _1273 = float(_1231);
    float _1275 = _1265 * _1263;
    float _1277 = floor(_1267);
    float _1279 = float(_1137);
    float _1281 = _1201 * 6.283185482025146484375;
    float _1283 = _1269 * _1273;
    float _1285 = float(_1221);
    float _1287 = -_1261;
    float _1289 = _1237 + _1287;
    float _1291 = 0.0;
    int _1293 = as_type<int>(_1279);
    if (_1245)
    {
        _1291 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1295 = _1291;
    float _1297 = _1283 * (-2.0);
    float _1299 = floor(_1271);
    float _1301 = _1285 * _1279;
    bool _1303 = _1259 >= 0.5;
    bool _1305 = isnan(_1259);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan(0.5);
    bool _1311 = _1307 || _1309;
    float _1313 = fma(_1297, _1251, _1251);
    if (_1245)
    {
        float _1315 = _1295 * 5.0;
        _1293 = as_type<int>(_1315);
    }
    int _1317 = _1293;
    bool _1319 = _1289 >= 0.5;
    bool _1321 = isnan(_1289);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    float _1329 = -_1277;
    float _1331 = _1267 + _1329;
    int _1333 = abs(_1167);
    float _1335 = _943 + (-0.5);
    bool _1337 = !_1311;
    float _1339 = _1337 ? 0.5 : (-0.5);
    float _1341 = _1331;
    if (_1245)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4218 = as_type<float>(_1317);
        out.gl_Position.z = _4218;
    }
    float _1343 = fma(_1119, _1297, _1119);
    float _1345 = _1281 * 0.15915493667125701904296875;
    float _1347 = _1237 * 6.283185482025146484375;
    float _1349 = -_1299;
    float _1351 = _1271 + _1349;
    float _1353 = _1115 * _1115;
    int _1355 = abs(_1173);
    float _1357 = _1351;
    if (_1245)
    {
        out.m_49.x = 0.0;
    }
    float _1359 = _1275 * (-2.0);
    float _1361 = float(_1355);
    float _1363 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1313);
    float _1365 = float(_1333);
    float _1367 = fma(_1155, _1155, _1353);
    float _1369 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1371 = _1369 * 2.0;
    int _1373 = abs(_1161);
    float _1375 = fma(_1343, _1031, _1363);
    float _1377 = fma(_1191, _1191, _1367);
    float _1379 = _1345 * 6.283185482025146484375;
    float _1381 = sin(_1379);
    float _1383 = _1365 * _1371;
    bool _1385 = !_1063;
    int _1387 = _1385 ? 0 : 1;
    bool _1389 = _1331 > 0.5;
    int _1391 = abs(_1387);
    float _1393 = rsqrt(_1377);
    bool _1395 = !_1327;
    float _1397 = _1395 ? 0.5 : (-0.5);
    float _1399 = _1347 * 0.15915493667125701904296875;
    float _1401 = float(_1391);
    float _1403 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1405 = _1403 * 2.0;
    float _1407 = float(_1373);
    float _1409 = _1399 * 6.283185482025146484375;
    float _1411 = sin(_1409);
    float _1413 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _1415 = !_1053;
    int _1417 = _1415 ? 0 : 1;
    float _1419 = _1401 * _1405;
    bool _1421 = _1351 > 0.5;
    float _1423 = fma(_1407, _1413, _1383);
    int _1425 = abs(_1417);
    if (_1389)
    {
        float _1427 = -_1331;
        float _1429 = _1427 + 1.0;
        _1341 = _1429;
    }
    float _1431 = _1341;
    float _1433 = _1115 * _1393;
    float _1435 = _1155 * _1393;
    float _1437 = float(_1425);
    float _1439 = fma(_1431, 4.0, -1.0);
    float _1441 = -_1433;
    float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1445 = -_1435;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1155);
    float _1449 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1451 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1453 = _1443 * _1443;
    if (_1421)
    {
        float _1455 = -_1351;
        float _1457 = _1455 + 1.0;
        _1357 = _1457;
    }
    float _1459 = _1357;
    float _1461 = fma(_1361, _1449, _1423);
    float _1463 = fma(_1437, _1451, _1419);
    float _1465 = fma(_1447, _1447, _1453);
    float _1467 = rsqrt(_1169);
    float _1469 = fma(_1459, 4.0, -1.0);
    float _1471 = fma(_1461, 3.1415927410125732421875, _1247);
    bool _1473 = !_1067;
    int _1475 = _1473 ? 0 : 1;
    if (_1245)
    {
        return out;
    }
    float _1477 = -_1433;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1101);
    float _1481 = fma(_1127, _1359, _1127);
    float _1483 = -_1435;
    float _1485 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1487 = fma(_1471, _1359, _1471);
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1491 = _1479 + _1489;
    int _1493 = abs(_1475);
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1497 = _1485 + _1495;
    float _1499 = _1375 * 0.15915493667125701904296875;
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1503 = _1191 * _1393;
    float _1505 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1507 = _941 + _943;
    float _1509 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1501);
    float _1511 = float(_1493);
    float _1513 = -_1503;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1517 = rsqrt(_1215);
    float _1519 = _939 + (-0.5);
    float _1521 = _1507 + (-1.0);
    float _1523 = fma(_1511, _1505, _1463);
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1527 = _1515 + _1525;
    float _1529 = _1301 * (-2.0);
    float _1531 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1487);
    float _1533 = fma(_1523, 3.1415927410125732421875, _1249);
    float _1535 = sqrt(_1215);
    float _1537 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1509);
    float _1539 = _941 + (-0.5);
    float _1541 = fma(_1533, _1529, _1533);
    float _1543 = -_1503;
    float _1545 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1191);
    float _1547 = fma(_1481, _1031, _1531);
    bool _1549 = _1537 >= 0.0;
    float _1551 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1541);
    float _1553 = fma(_1545, _1545, _1465);
    float _1555 = _1547 * 0.15915493667125701904296875;
    float _1557 = _933 * _1243;
    float _1559 = _931 * _1517;
    float _1561 = _911 * _1467;
    float _1563 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1565 = _1499 * 6.283185482025146484375;
    float _1567 = cos(_1565);
    float _1569 = _1535 * _1559;
    float _1571 = _1535 * _1557;
    float _1573 = fma(_1563, _1529, _1563);
    float _1575 = _1535 * _1561;
    float _1577 = _1573;
    if (_1549)
    {
        out.m_49.x = 0.0;
    }
    float _1579 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1581 = fma(_1573, _1031, _1551);
    float _1583 = sqrt(_1553);
    if (_1549)
    {
        _1577 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1585 = _1577;
    float _1587 = _1581 * 0.15915493667125701904296875;
    float _1589 = _989 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1591 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1593 = as_type<int>(_1585);
    if (_1549)
    {
        float _1595 = _1585 * 5.0;
        _1593 = as_type<int>(_1595);
    }
    int _1597 = _1593;
    float _1599 = _1555 * 6.283185482025146484375;
    float _1601 = cos(_1599);
    if (_1549)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4626 = as_type<float>(_1597);
        out.gl_Position.z = _4626;
    }
    float _1603 = _1499 * 6.283185482025146484375;
    float _1605 = sin(_1603);
    float _1607 = _1393 * _1583;
    float _1609 = _1555 * 6.283185482025146484375;
    float _1611 = sin(_1609);
    float _1613 = _1601 * _1567;
    float _1615 = _1587 * 6.283185482025146484375;
    float _1617 = sin(_1615);
    if (_1549)
    {
        return out;
    }
    float _1619 = _1587 * 6.283185482025146484375;
    float _1621 = cos(_1619);
    float _1623 = _1611 * _1605;
    float _1625 = _1607 * _1589;
    float _1627 = _1607 * _1591;
    float _1629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1569);
    float _1631 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1571);
    float _1633 = _1607 * _1579;
    float _1635 = fma(_1617, _1623, _1613);
    float _1637 = fma(_1617, _1613, _1623);
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1575);
    float _1641 = _1601 * _1605;
    float _1643 = _1611 * _1567;
    float _1645 = _1627 * _1629;
    float _1647 = _1625 * _1631;
    float _1649 = _1633 * _1639;
    float _1651 = -_1641;
    float _1653 = fma(_1617, _1643, _1651);
    float _1655 = _1601 * _1621;
    float _1657 = _1611 * _1621;
    float _1659 = _1621 * _1645;
    float _1661 = _1635 * _1647;
    float _1663 = _1653 * _1647;
    float _1665 = -_1643;
    float _1667 = fma(_1617, _1641, _1665);
    float _1669 = _1657 * _1647;
    float _1671 = fma(_1605, _1659, _1661);
    float _1673 = fma(_1567, _1659, _1663);
    float _1675 = -_1617;
    float _1677 = fma(_1675, _1645, _1669);
    float _1679 = fma(_1667, _1649, _1671);
    float _1681 = fma(_1637, _1649, _1673);
    float _1683 = fma(_1655, _1649, _1677);
    float _1685 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1687 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1689 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1691 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1693 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1685);
    float _1695 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1687);
    float _1697 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1689);
    float _1699 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1701 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1693);
    float _1703 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1695);
    float _1705 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1697);
    float _1707 = _1691 * _1691;
    float _1709 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1713 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1715 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1717 = _1709 * _1709;
    float _1719 = fma(_1699, _1699, _1707);
    float _1721 = fma(_1711, _1711, _1717);
    float _1723 = fma(_1715, _1715, _1719);
    float _1725 = fma(_1713, _1713, _1721);
    float _1727 = rsqrt(_1723);
    float _1729 = rsqrt(_1725);
    float _1731 = _1691 * _1727;
    float _1733 = sqrt(_1723);
    float _1735 = _1699 * _1727;
    float _1737 = _1715 * _1727;
    float _1739 = _1709 * _1729;
    float _1741 = _1711 * _1729;
    float _1743 = _1713 * _1729;
    float _1745 = _1731 * _1739;
    float _1747 = fma(_1735, _1741, _1745);
    float _1749 = fma(_1737, _1743, _1747);
    float _1751 = _1749 * _1733;
    float _1753 = fma(_1735, _1751, _1711);
    float _1755 = fma(_1737, _1751, _1713);
    float _1757 = fma(_1731, _1751, _1709);
    float _1759 = _1111 + _1753;
    float _1761 = _1141 + _1755;
    float _1763 = _1101 + _1757;
    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1767 = _1759 + _1765;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1771 = _1761 + _1769;
    float _1773 = _1767 * _1767;
    float _1775 = _1771 * _1771;
    float _1777 = _1773 + _1775;
    float _1779 = sqrt(_1777);
    bool _1781 = _1779 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1783 = _1709;
    float _1785 = _1759;
    float _1787 = _1729;
    float _1789 = _1773;
    float _1791 = _1775;
    if (!_1781)
    {
        _1783 = _1759;
    }
    float _1793 = _1783;
    float _1795 = _1793;
    if (!_1781)
    {
        _1785 = _1761;
    }
    float _1797 = _1785;
    float _1799 = _1797;
    if (!_1781)
    {
        _1787 = _1763;
    }
    float _1801 = _1787;
    bool _1803 = !_1781;
    float _1805 = _1801;
    if (!_1803)
    {
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1811 = _1779 + _1809;
        float _1813 = _1763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = rsqrt(_1777);
        float _1817 = _1811 * _1807;
        float _1819 = _1817 * 0.15915493667125701904296875;
        float _1821 = _1819 * 6.283185482025146484375;
        float _1823 = sin(_1821);
        float _1825 = _1819 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = fma(_1823, _1813, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1831 = _1815 * _1829;
        float _1833 = _1827 + (-1.0);
        float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1837 = _1767 * _1831;
        float _1839 = _1771 * _1831;
        float _1841 = fma(_1763, _1827, _1835);
        float _1843 = _1837 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1845 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1847 = _1837 * _1837;
        float _1849 = _1839 * _1839;
        _1805 = _1841;
        _1789 = _1847;
        _1791 = _1849;
        _1795 = _1843;
        _1799 = _1845;
    }
    float _1851 = _1805;
    float _1853 = _1789;
    float _1855 = _1791;
    float _1857 = _1795;
    float _1859 = _1799;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1863 = _1851 + _1861;
    out.m_59.x = _809;
    out.m_59.y = _811;
    out.m_59.z = _815;
    out.m_59.w = _817;
    float _1865 = fma(_1863, _1863, _1853);
    out.m_61.x = _819;
    out.m_61.y = _821;
    out.m_61.z = _823;
    float _1867 = _1865 + _1855;
    float _1869 = sqrt(_1867);
    bool _1871 = _1869 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1873 = isnan(_1869);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1879 = _1875 || _1877;
    float _1881 = _1853;
    if (!_1879)
    {
        _1881 = 1.0;
    }
    float _1883 = _1881;
    bool _1885 = !_1879;
    float _1887 = _1883;
    if (!_1885)
    {
        bool _1889 = _1869 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1891 = isnan(_1869);
        bool _1893 = _1889 || _1891;
        bool _1895 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1897 = _1893 || _1895;
        if (!_1897)
        {
            float _1899 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1901 = _1869 + _1899;
            float _1903 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1905 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1903;
            float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1909 = _1907 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1911 = 1.0 / _1905;
            float _1913 = _1901 * _1911;
            float _1915 = fma(_1913, _1909, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1887 = _1915;
            _1917 = true;
        }
        else
        {
            bool _1919 = _1869 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1921 = isnan(_1869);
            bool _1923 = _1919 || _1921;
            bool _1925 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1927 = _1923 || _1925;
            if (!_1927)
            {
                float _1929 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1931 = _1869 + _1929;
                float _1933 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1935 = _1933 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1937 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1939 = _1937 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1941 = 1.0 / _1935;
                float _1943 = _1931 * _1941;
                float _1945 = fma(_1943, _1939, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1887 = _1945;
                _1917 = true;
            }
            else
            {
                _1887 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1917 = false;
    float _1947 = _1887;
    float _1949 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1951 = _1851 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1955 = _1857 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1959 = _1859 + _1957;
    float _1961 = fma(_1951, _1947, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1963 = fma(_1955, _1947, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1965 = fma(_1959, _1947, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1967 = -_1433;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1961);
    float _1971 = -_1435;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1963);
    float _1975 = -_1503;
    float _1977 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1965);
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1981 = _1969 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1985 = _1973 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1989 = _1977 + _1987;
    float _1991 = _1981 * _1981;
    float _1993 = fma(_1985, _1985, _1991);
    float _1995 = fma(_1989, _1989, _1993);
    float _1997 = rsqrt(_1995);
    float _1999 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2001 = _1985 * _1999;
    float _2003 = _1989 * _1999;
    float _2005 = _2001 * _2001;
    float _2007 = _2003 * _2003;
    float _2009 = _2005 + _2007;
    float _2011 = sqrt(_2009);
    bool _2013 = _2011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2017 = _2011 + _2015;
    float _2019 = _1997;
    float _2021 = _2009;
    float _2023 = _2017;
    float _2025 = _1981;
    float _2027 = _1999;
    float _2029 = _2001;
    if (_2013)
    {
        float _2031 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2019 = _2031;
    }
    float _2033 = _2019;
    if (_2013)
    {
        float _2035 = rsqrt(_2009);
        _2021 = _2035;
    }
    float _2037 = _2021;
    if (_2013)
    {
        float _2039 = _2017 * _2033;
        _2023 = _2039;
    }
    float _2041 = _2023;
    if (_2013)
    {
        float _2043 = _2041 * 0.15915493667125701904296875;
        _841 = _2043;
    }
    float _2045 = _841;
    float _2047 = _2033;
    float _2049 = _2045;
    if (_2013)
    {
        float _2051 = _2045 * 6.283185482025146484375;
        float _2053 = sin(_2051);
        _2047 = _2053;
    }
    float _2055 = _2047;
    float _2057 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2059 = precise::max(0.0, _2057);
    float _2061 = _1989;
    float _2063 = _2059;
    if (_2013)
    {
        float _2065 = _2045 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        _2061 = _2067;
    }
    float _2069 = _2061;
    float _2071 = -_1999;
    float _2073 = -_2059;
    float _2075 = fma(_1981, _2071, _2073);
    if (!_2013)
    {
        _2025 = _2003;
    }
    float _2077 = _2025;
    float _2079 = _2077;
    if (_2013)
    {
        float _2081 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2063 = _2081;
    }
    float _2083 = _2063;
    float _2085 = _2055;
    float _2087 = _2083;
    if (_2013)
    {
        float _2089 = fma(_2055, _2083, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2085 = _2089;
    }
    float _2091 = _2085;
    float _2093 = _2091;
    float _2095 = _2069;
    if (_2013)
    {
        float _2097 = _2069 + (-1.0);
        _2087 = _2097;
    }
    float _2099 = _2087;
    float _2101 = _2099;
    if (_2013)
    {
        float _2103 = _2037 * _2091;
        _2027 = _2103;
    }
    float _2105 = _2027;
    if (!_2013)
    {
        _2093 = _2075;
    }
    float _2107 = _2093;
    float _2109 = sqrt(_1995);
    float _2111 = _2107;
    if (_2013)
    {
        float _2113 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2049 = _2113;
    }
    float _2115 = _2049;
    if (_2013)
    {
        float _2117 = _2001 * _2105;
        _2029 = _2117;
    }
    float _2119 = _2029;
    if (!_2013)
    {
        _2101 = _2005;
    }
    float _2121 = _2101;
    float _2123 = _2121;
    if (_2013)
    {
        float _2125 = _2003 * _2105;
        _2079 = _2125;
    }
    float _2127 = _2079;
    if (_2013)
    {
        float _2129 = fma(_2075, _2069, _2115);
        _2111 = _2129;
    }
    float _2131 = _2111;
    if (_2013)
    {
        float _2133 = _2119 * _2119;
        _2123 = _2133;
    }
    float _2135 = _2123;
    if (!_2013)
    {
        _2095 = _2007;
    }
    float _2137 = _2095;
    float _2139 = _2137;
    if (_2013)
    {
        float _2141 = _2127 * _2127;
        _2139 = _2141;
    }
    float _2143 = _2139;
    float _2145 = fma(_2131, _2131, _2135);
    float _2147 = _2145 + _2143;
    float _2149 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2153 = fma(_2109, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2151);
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    float _2157 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2159 = rsqrt(_2147);
    float _2161 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2149);
    float _2163 = -_2155;
    float _2165 = _2163 + 1.0;
    float _2167 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2169 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2157);
    float _2171 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2161);
    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2175 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2167);
    float _2177 = abs(_2165);
    float _2179 = log2(_2177);
    float _2181 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2183 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2169);
    float _2185 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2175);
    float _2187 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2189 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2191 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2193 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2195 = _2159 * _2119;
    float _2197 = -_2189;
    float _2199 = fma(_2197, _2173, 1.0);
    float _2201 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2187);
    float _2203 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2205 = _2159 * _2131;
    float _2207 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2209 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2201);
    float _2211 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2203);
    float _2213 = _2159 * _2127;
    float _2215 = -_2207;
    float _2217 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2215);
    float _2219 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2221 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2223 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2211);
    float _2225 = -_2213;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2217);
    float _2229 = log2(_2199);
    float _2231 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2233 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2223);
    float _2235 = fma(_2227, -0.5, 0.5);
    float _2237 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2239 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2231);
    float _2241 = fma(_2227, 0.5, 0.5);
    float _2243 = _2205 + 1.0;
    float _2245 = exp2(_2221);
    float _2247 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2237);
    float _2249 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2239);
    float _2251 = fma(_2241, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2253 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2247);
    float _2255 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2249);
    float _2257 = fma(_2241, _2251, -0.212114393711090087890625);
    float _2259 = 1.0 / _2233;
    float _2261 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2253);
    float _2263 = fma(_2241, _2257, 1.570728778839111328125);
    float _2265 = sqrt(_2235);
    float _2267 = -_2205;
    float _2269 = fma(_2245, _2243, _2267);
    float _2271 = _2229 * 0.693147182464599609375;
    float _2273 = fma(_2269, 0.5, 0.5);
    float _2275 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2277 = _2255 * _2259;
    float _2279 = _2261 * _2259;
    float _2281 = fma(_2277, 0.5, 0.5);
    float _2283 = fma(_2279, -0.5, 0.5);
    float _2285 = _2265 * 0.636619746685028076171875;
    float3 _5769 = float3(_2281, _2283, _2275);
    float _2287 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5769, float3(0.0), isnan(_5769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5769, float3(0.0), isnan(_5769)), level(0.0)).x;
    float _2289 = -_2263;
    float _2291 = fma(_2285, _2289, 1.0);
    float3 _5785 = float3(_2281, _2283, _2275);
    float4 _2293 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5785, float3(0.0), isnan(_5785)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5785, float3(0.0), isnan(_5785)), level(0.0)).xyzw;
    float _2295 = _2293.x;
    float _2297 = _2293.y;
    float _2299 = _2293.z;
    float _2301 = _2293.w;
    float2 _5801 = float2(_2291, _2273);
    float3 _2305 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5801, float2(0.0), isnan(_5801)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5801, float2(0.0), isnan(_5801)), level(0.0)).xyz;
    float _2307 = _2305.x;
    float _2309 = _2305.y;
    float _2311 = _2305.z;
    float _2313 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2315 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2317 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2315);
    float _2319 = exp2(_2313);
    float _2321 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2317);
    float _2323 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2321);
    float _2325 = _2323 + _2233;
    float _2327 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2255;
    out.gl_Position.y = _2261;
    out.gl_Position.z = _2323;
    out.gl_Position.w = _2233;
    float _2329 = _2325 * 0.5;
    float _2331 = -_2319;
    float _2333 = _2331 + 1.0;
    out.m_49.x = _2327;
    float _2335 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2329;
    out.m_71.w = _2233;
    float _2337 = _2335 * _2287;
    float _2339 = -_2335;
    float _2341 = _2339 + 1.0;
    float _2343 = _2301 * _2337;
    float _2345 = _2311 * _2337;
    float _2347 = fma(_2307, _2343, _2295);
    float _2349 = fma(_2309, _2343, _2297);
    float _2351 = _2301 * _2341;
    float _2353 = fma(_2301, _2345, _2299);
    out.m_73.x = _2347;
    out.m_73.y = _2349;
    out.m_73.z = _2353;
    out.m_73.w = _2351;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1917 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_46.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_113);
        out.gl_Position.z = _2411;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = _131;
    if (_127)
    {
        float _135 = float(_97);
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2481 = as_type<float>(_151);
        out.gl_Position.z = _2481;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    int _153 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _155 = _153;
    int _157 = 0;
    int _159 = _88(_155, _157, (*spvDescriptorSet0.support_buffer));
    float _161 = in.m_53.z;
    float _163 = in.m_55.z;
    float _165 = _131 + _161;
    float _167 = _165 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _169 = trunc(_163);
    int _171 = int(_169);
    float _173 = float(_159);
    int _175 = abs(_159);
    bool _177 = _159 == 0;
    float _179 = _167 * _173;
    float _181 = float(uint(_175));
    float _183 = trunc(_179);
    int _185 = int(_183);
    float _187 = 1.0 / _181;
    int _189 = abs(_185);
    uint _192 = uint(int(uint(_185) >> uint(31)));
    float _194 = float(uint(_189));
    int _196 = ~int(_192);
    int _198 = _196 + 1;
    int _200 = as_type<int>(_187) + (-2);
    float _202 = as_type<float>(_200) * _194;
    float _204 = trunc(_202);
    float _206 = precise::max(_204, 0.0);
    uint _208 = uint(_206);
    int _210 = ~int(_208);
    int _212 = _210 + 1;
    int _214 = _212 * _175;
    int _216 = _214 + _189;
    float _218 = float(uint(_216));
    float _220 = as_type<float>(_200) * _218;
    float _222 = trunc(_220);
    float _224 = precise::max(_222, 0.0);
    uint _226 = uint(_224);
    int _228 = int(_208) + int(_226);
    int _230 = ~_228;
    int _232 = _230 + 1;
    int _234 = _232 * _175;
    int _236 = _234 + _189;
    bool _238 = uint(_236) >= uint(_175);
    bool _240 = !_238;
    int _242 = _240 ? 0 : (-1);
    int _244 = ~_228;
    int _246 = _244 + _242;
    int _248 = _246 + 1;
    int _250 = _248 * _175;
    int _252 = _250 + _189;
    int _254 = _252 ^ _198;
    int _256 = ~_198;
    int _258 = _256 + _254;
    int _260 = _258 + 1;
    bool _262 = !_177;
    int _264 = _262 ? _260 : (-1);
    int _266 = _264;
    int _268 = 0;
    int _270 = _89(_266, _268, (*spvDescriptorSet0.support_buffer));
    int _272 = _171;
    int _274 = 0;
    int _276 = _89(_272, _274, (*spvDescriptorSet0.support_buffer));
    float4 _279 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_270, _276)), 0).xyzw;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = _279.w;
    float _289 = in.m_53.x;
    float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _293 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _295 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _297 = in.m_53.y;
    float _299 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _301 = in.m_55.x;
    float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _305 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _307 = _305 != 0;
    float _309 = in.m_55.y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _313 = _293 * _291;
    float _315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _319 = _317 != 0;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _325 = _323 != 0;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _329 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[20].x, _313);
    float _331 = _295 * _303;
    float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _335 = _297 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _337 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[20].y, _331);
    bool _339 = _289 > 0.5;
    bool _341 = _339 && _319;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _345 = fma(_335, -2.0, _327);
    float _347 = _329 * 6.283185482025146484375;
    float _349 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[78].w, _311);
    float _351 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[79].z, _343);
    float _353 = floor(_329);
    float _355 = _347 * 0.15915493667125701904296875;
    float _357 = _337 * 6.283185482025146484375;
    bool _359 = _297 > 0.5;
    bool _361 = _359 && _325;
    float _363 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[79].x, _351);
    float _365 = _357 * 0.15915493667125701904296875;
    float _367 = _289 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _369 = _363 * (-0.15915493667125701904296875);
    float _371 = 0.0;
    float _373 = _363;
    float _375 = _309;
    if (_319)
    {
        _371 = _301;
    }
    float _377 = _371;
    float _379 = floor(_337);
    float _381 = -_321;
    float _383 = fma(_367, 2.0, _381);
    bool _385 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _389 = _385 || _387;
    bool _391 = isnan(1.0);
    bool _393 = _389 || _391;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _397 = _377;
    if (_341)
    {
        float _399 = -_377;
        float _401 = _399 + 1.0;
        _397 = _401;
    }
    float _403 = _397;
    if (!_319)
    {
        _373 = _301;
    }
    float _405 = _373;
    float _407 = -_353;
    float _409 = _329 + _407;
    float _411 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[78].z, _395);
    float _413 = _355 * 6.283185482025146484375;
    float _415 = cos(_413);
    float _417 = _405;
    if (_319)
    {
        _417 = _403;
    }
    float _419 = _417;
    float _421 = _315 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _423 = _333 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _425 = _421;
    if (_361)
    {
        float _427 = -_309;
        float _429 = _427 + 1.0;
        _375 = _429;
    }
    float _431 = _375;
    float _433 = fma(_421, _419, -0.5);
    if (!_393)
    {
        float _435 = _299 * _299;
        float _437 = _435 * 0.5;
        _425 = _437;
    }
    float _439 = _425;
    float _441 = _365 * 6.283185482025146484375;
    float _443 = cos(_441);
    float _445 = fma(_423, _431, -0.5);
    float _447 = -_379;
    float _449 = _337 + _447;
    float _451 = _439;
    if (!_393)
    {
        float _453 = _439 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _451 = _453;
    }
    float _455 = _451;
    float _457 = _369 * 6.283185482025146484375;
    float _459 = sin(_457);
    float _461 = fma(_415, 0.5, 0.5);
    float _463 = _415;
    float _465 = _455;
    if (!_393)
    {
        _463 = _299;
    }
    float _467 = _463;
    float _469 = _369 * 6.283185482025146484375;
    float _471 = cos(_469);
    float _473 = fma(_443, 0.5, 0.5);
    float _475 = _459 * _445;
    bool _477 = !_393;
    float _479 = _467;
    if (!_477)
    {
        float _481 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _483 = log2(_481);
        float _485 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _487 = _485 + 1.0;
        float _489 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _491 = _299 * _483;
        float _493 = 1.0 / _487;
        float _495 = _489 * 0.693147182464599609375;
        float _497 = exp2(_491);
        float _499 = 1.0 / _495;
        float _501 = _497 + (-1.0);
        float _503 = -_501;
        float _505 = fma(_503, _499, _299);
        float _507 = _505 * _493;
        float _509 = _507 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _465 = _509;
    }
    float _511 = _465;
    bool _513 = !_393;
    if (!_513)
    {
        float _515 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _517 = log2(_515);
        float _519 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _521 = _519 + 1.0;
        float _523 = 1.0 / _521;
        float _525 = _299 * _517;
        float _527 = exp2(_525);
        float _529 = -_527;
        float _531 = _529 + 1.0;
        float _533 = _531 * _523;
        _479 = _533;
    }
    float _535 = _479;
    float _537 = _471 * _445;
    float _539 = -_475;
    float _541 = fma(_471, _433, _539);
    float _543 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _411);
    float _545 = fma(_459, _433, _537);
    float _547 = in.m_51.x;
    float _549 = in.m_51.y;
    float _551 = in.m_51.z;
    bool _553 = _409 < 0.5;
    float _555 = float(_553);
    float _557 = -_409;
    float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _567 = _565 != 0;
    float _569 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _349);
    float _571 = -_555;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _575 = -_461;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _579 = _449 < 0.5;
    float _581 = float(_579);
    float _583 = -_131;
    float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[76].x, _383);
    float _587 = -_449;
    float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _591 = !_563;
    int _593 = _591 ? 0 : 1;
    float _595 = -_473;
    float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _599 = -_581;
    float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _603 = !_307;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_543, _541, _585);
    int _609 = abs(_593);
    bool _611 = !_567;
    int _613 = _611 ? 0 : 1;
    float _615 = _607 + 0.5;
    int _617 = abs(_605);
    float _619 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _345);
    float _621 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _623 = abs(_613);
    float _625 = float(_609);
    float _627 = -_619;
    float _629 = fma(_569, _545, _627);
    float _631 = fma(_535, _547, _621);
    float _633 = float(_617);
    float _635 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _637 = abs(_559);
    float _639 = _625 * _637;
    float _641 = abs(_589);
    float _643 = _625 * _641;
    float _645 = _511 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _647 = float(_623);
    float _649 = fma(_633, _577, _639);
    float _651 = fma(_633, _597, _643);
    float _653 = fma(_535, _549, _635);
    float _655 = fma(_535, _551, _645);
    float _657 = abs(_573);
    float _659 = fma(_647, _657, _649);
    int _661 = _264 + 1;
    float _663 = abs(_601);
    float _665 = fma(_647, _663, _651);
    float _667 = in.m_46.x;
    float _669 = in.m_46.y;
    float _671 = in.m_46.z;
    uint _673 = as_type<uint>(half2(float2(_287, 0.0)));
    float _675 = _629 + 0.5;
    int _677 = abs(_661);
    uint _679 = extract_bits(_673, 0u, 8u);
    int _681 = int(_679) & 255;
    uint _683 = extract_bits(_673, 8u, 8u);
    int _685 = int(_683) & 255;
    int _687 = _685 << 8;
    int _689 = _681 | _687;
    float _691 = float(uint(_677));
    uint _693 = uint(int(uint(_661) >> uint(31)));
    float _695 = as_type<float>(_200) * _691;
    int _697 = ~int(_693);
    int _699 = _697 + 1;
    float _701 = trunc(_695);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    int _707 = ~int(_705);
    int _709 = _707 + 1;
    int _711 = _709 * _175;
    int _713 = _711 + _677;
    float _715 = float(uint(_713));
    float _717 = as_type<float>(_200) * _715;
    float _719 = trunc(_717);
    float _721 = precise::max(_719, 0.0);
    uint _723 = uint(_721);
    int _725 = int(_705) + int(_723);
    float _727 = in.m_57.x;
    float _729 = in.m_57.y;
    float _731 = in.m_57.z;
    float _733 = in.m_57.w;
    int _735 = ~_725;
    int _737 = _735 + 1;
    int _739 = _737 * _175;
    int _741 = _739 + _677;
    bool _743 = uint(_741) >= uint(_175);
    bool _745 = !_743;
    int _747 = _745 ? 0 : (-1);
    bool _749 = _689 >= 32768;
    int _751 = ~_725;
    int _753 = _751 + _747;
    int _755 = _753 + 1;
    float _757 = fma(_655, _733, _671);
    int _759 = _755 * _175;
    int _761 = _759 + _677;
    int _763 = _689 + (-1024);
    float _765 = fma(_631, _733, _667);
    float _767 = fma(_653, _733, _669);
    float _769 = _727 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _771 = _761 ^ _699;
    float _773 = _729 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _775 = _763;
    if (_749)
    {
        int _777 = ~_689;
        int _779 = _777 + 33792;
        int _781 = _779 + 1;
        _775 = _781;
    }
    int _783 = _775;
    float _785 = _731 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _787 = ~_699;
    int _789 = _787 + _771;
    int _791 = _789 + 1;
    int _793 = _783 + 30719;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _805 = float(_793);
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _809 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = fma(_805, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _815 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _819 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _821 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _823 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = abs(_813);
    float _827 = -_825;
    float _829 = _827 + 1.0;
    out.m_59.x = _809;
    out.m_59.y = _811;
    out.m_59.z = _815;
    out.m_59.w = _817;
    bool _831 = !_177;
    int _833 = _831 ? _791 : (-1);
    out.m_61.x = _819;
    out.m_61.y = _821;
    out.m_61.z = _823;
    int _835 = as_type<int>(_829) + (-218103808);
    bool _837 = uint(_835) >= 1920991232u;
    bool _839 = !_837;
    float _841 = _821;
    if (!_839)
    {
        int _843;
        _86(_843, out.gl_Position, out.gl_PointSize);
    }
    int _845 = _833;
    int _847 = 0;
    int _849 = _89(_845, _847, (*spvDescriptorSet0.support_buffer));
    int _851 = _171;
    int _853 = 0;
    int _855 = _89(_851, _853, (*spvDescriptorSet0.support_buffer));
    float4 _857 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_849, _855)), 0).xyzw;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = _857.w;
    float _867 = floor(_179);
    float _869 = -_867;
    float _871 = _179 + _869;
    uint _873 = as_type<uint>(half2(float2(_865, 0.0)));
    float _875 = -_285;
    float _877 = _875 + _863;
    uint _879 = extract_bits(_873, 0u, 8u);
    int _881 = int(_879) & 255;
    uint _883 = extract_bits(_873, 8u, 8u);
    int _885 = int(_883) & 255;
    int _887 = _885 << 8;
    int _889 = _881 | _887;
    bool _891 = _889 >= 32768;
    int _893 = _889 + (-1024);
    int _895 = _893;
    if (_891)
    {
        int _897 = ~_889;
        int _899 = _897 + 33792;
        int _901 = _899 + 1;
        _895 = _901;
    }
    int _903 = _895;
    int _905 = _903 + 30719;
    float _907 = float(_905);
    float _909 = fma(_907, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _911 = fma(_871, _877, _285);
    float _913 = abs(_909);
    float _915 = -_913;
    float _917 = _915 + 1.0;
    int _919 = as_type<int>(_917) + (-218103808);
    float _921 = -_281;
    float _923 = _921 + _859;
    bool _925 = uint(_919) >= 1920991232u;
    float _927 = -_283;
    float _929 = _927 + _861;
    float _931 = fma(_871, _923, _281);
    float _933 = fma(_871, _929, _283);
    bool _935 = !_925;
    if (!_935)
    {
        int _937;
        _86(_937, out.gl_Position, out.gl_PointSize);
    }
    float _939 = in.m_53.x;
    float _941 = in.m_53.y;
    float _943 = in.m_53.z;
    float _945 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _947 = log2(_945);
    float _949 = _767 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_63.x = _615;
    out.m_63.y = _675;
    float _951 = _767 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _953 = _767 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _957 = 1.0 + _955;
    bool _959 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _961 = isnan(1.0);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _967 = _963 || _965;
    float _969 = _659 * _769;
    bool _971 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _973 = isnan(0.0);
    bool _975 = _971 || _973;
    bool _977 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _979 = _975 || _977;
    float _981 = 1.0 / _957;
    float _983 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[6].x, _953);
    float _985 = in.m_65.w;
    float _987 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[4].x, _949);
    float _989 = _665 * _773;
    float _991 = _947 * _131;
    float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _995 = _943 * 2.0;
    float _997 = _939 * 2.0;
    float _999 = exp2(_991);
    float _1001 = floor(_995);
    out.m_67.w = _985;
    float _1003 = -_999;
    float _1005 = _1003 + 1.0;
    float _1007 = fma(_765, (*spvDescriptorSet0.vp_c10)._m0[5].x, _951);
    float _1009 = floor(_997);
    float _1011 = _979 ? _1005 : 0.0;
    float _1013 = fma(_757, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1007);
    float _1015 = _941 * 2.0;
    bool _1017 = _1001 > 0.0;
    bool _1019 = _1001 >= 0.0;
    bool _1021 = isnan(_1001);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan(0.0);
    bool _1027 = _1023 || _1025;
    if (_967)
    {
        float _1029 = _1011 * _981;
        _133 = _1029;
    }
    float _1031 = _133;
    float _1033 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1035 = floor(_1015);
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1043 = _1041 != 0;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1047 = _1045 != 0;
    float _1049 = fma(_757, (*spvDescriptorSet0.vp_c10)._m0[4].z, _987);
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1053 = _1051 != 0;
    float _1055 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1033);
    int _1057 = _1027 ? 0 : 1;
    float _1059 = _941 + _939;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1067 = _1065 != 0;
    float _1069 = fma(_757, (*spvDescriptorSet0.vp_c10)._m0[6].z, _983);
    int _1071 = ~_1057;
    int _1073 = _1071 + 1;
    int _1075 = _1073 + 1;
    float _1077 = _1059 + (-1.0);
    int _1079 = _1075;
    if (!_1017)
    {
        int _1081 = ~_1057;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    float _1087 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _1089 = _1009 >= 0.0;
    bool _1091 = isnan(_1009);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan(0.0);
    bool _1097 = _1093 || _1095;
    float _1099 = _939 + _943;
    float _1101 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1103 = _1097 ? 0 : 1;
    float _1105 = _1099 + (-1.0);
    bool _1107 = _1009 > 0.0;
    float _1109 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1087);
    float _1111 = _1049 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1115 = _1101 + _1113;
    float _1117 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1121 = ~_1103;
    int _1123 = _1121 + 1;
    int _1125 = _1123 + 1;
    float _1127 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _1131 = _1125;
    if (!_1107)
    {
        int _1133 = ~_1103;
        int _1135 = _1133 + 1;
        _1131 = _1135;
    }
    int _1137 = _1131;
    float _1139 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1117);
    float _1141 = _1069 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1143 = _1035 >= 0.0;
    bool _1145 = isnan(_1035);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1155 = _1111 + _1153;
    float _1157 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1055);
    bool _1159 = !_1039;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _1165 = !_1043;
    int _1167 = _1165 ? 0 : 1;
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1139);
    bool _1171 = !_1047;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1179 = _1177 != 0;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1183 = _1181 != 0;
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1187 = _1185 != 0;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = _1141 + _1189;
    int _1193 = _1151 ? 0 : 1;
    float _1195 = _1163 * _1129;
    bool _1197 = _1035 > 0.0;
    float _1199 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1175);
    float _1201 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1195);
    int _1203 = ~_1193;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1199);
    bool _1211 = !_1183;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1109);
    float _1217 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1219 = floor(_1201);
    int _1221 = abs(_1213);
    float _1223 = _1217 * _993;
    int _1225 = _1207;
    if (!_1197)
    {
        int _1227 = ~_1193;
        int _1229 = _1227 + 1;
        _1225 = _1229;
    }
    int _1231 = _1225;
    bool _1233 = !_1179;
    int _1235 = _1233 ? 0 : 1;
    float _1237 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1223);
    bool _1239 = !_1187;
    int _1241 = _1239 ? 0 : 1;
    float _1243 = rsqrt(_1157);
    bool _1245 = _1209 >= 0.0;
    float _1247 = in.m_69.x;
    float _1249 = in.m_69.y;
    float _1251 = in.m_69.z;
    int _1253 = abs(_1235);
    int _1255 = abs(_1241);
    float _1257 = -_1219;
    float _1259 = _1201 + _1257;
    float _1261 = floor(_1237);
    float _1263 = float(_1085);
    float _1265 = float(_1253);
    float _1267 = _1201 + 0.25;
    float _1269 = float(_1255);
    float _1271 = _1237 + 0.25;
    float _1273 = float(_1231);
    float _1275 = _1265 * _1263;
    float _1277 = floor(_1267);
    float _1279 = float(_1137);
    float _1281 = _1201 * 6.283185482025146484375;
    float _1283 = _1269 * _1273;
    float _1285 = float(_1221);
    float _1287 = -_1261;
    float _1289 = _1237 + _1287;
    float _1291 = 0.0;
    int _1293 = as_type<int>(_1279);
    if (_1245)
    {
        _1291 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1295 = _1291;
    float _1297 = _1283 * (-2.0);
    float _1299 = floor(_1271);
    float _1301 = _1285 * _1279;
    bool _1303 = _1259 >= 0.5;
    bool _1305 = isnan(_1259);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan(0.5);
    bool _1311 = _1307 || _1309;
    float _1313 = fma(_1297, _1251, _1251);
    if (_1245)
    {
        float _1315 = _1295 * 5.0;
        _1293 = as_type<int>(_1315);
    }
    int _1317 = _1293;
    bool _1319 = _1289 >= 0.5;
    bool _1321 = isnan(_1289);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    float _1329 = -_1277;
    float _1331 = _1267 + _1329;
    int _1333 = abs(_1167);
    float _1335 = _943 + (-0.5);
    bool _1337 = !_1311;
    float _1339 = _1337 ? 0.5 : (-0.5);
    float _1341 = _1331;
    if (_1245)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4218 = as_type<float>(_1317);
        out.gl_Position.z = _4218;
    }
    float _1343 = fma(_1119, _1297, _1119);
    float _1345 = _1281 * 0.15915493667125701904296875;
    float _1347 = _1237 * 6.283185482025146484375;
    float _1349 = -_1299;
    float _1351 = _1271 + _1349;
    float _1353 = _1115 * _1115;
    int _1355 = abs(_1173);
    float _1357 = _1351;
    if (_1245)
    {
        out.m_49.x = 0.0;
    }
    float _1359 = _1275 * (-2.0);
    float _1361 = float(_1355);
    float _1363 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1313);
    float _1365 = float(_1333);
    float _1367 = fma(_1155, _1155, _1353);
    float _1369 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1371 = _1369 * 2.0;
    int _1373 = abs(_1161);
    float _1375 = fma(_1343, _1031, _1363);
    float _1377 = fma(_1191, _1191, _1367);
    float _1379 = _1345 * 6.283185482025146484375;
    float _1381 = sin(_1379);
    float _1383 = _1365 * _1371;
    bool _1385 = !_1063;
    int _1387 = _1385 ? 0 : 1;
    bool _1389 = _1331 > 0.5;
    int _1391 = abs(_1387);
    float _1393 = rsqrt(_1377);
    bool _1395 = !_1327;
    float _1397 = _1395 ? 0.5 : (-0.5);
    float _1399 = _1347 * 0.15915493667125701904296875;
    float _1401 = float(_1391);
    float _1403 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1405 = _1403 * 2.0;
    float _1407 = float(_1373);
    float _1409 = _1399 * 6.283185482025146484375;
    float _1411 = sin(_1409);
    float _1413 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _1415 = !_1053;
    int _1417 = _1415 ? 0 : 1;
    float _1419 = _1401 * _1405;
    bool _1421 = _1351 > 0.5;
    float _1423 = fma(_1407, _1413, _1383);
    int _1425 = abs(_1417);
    if (_1389)
    {
        float _1427 = -_1331;
        float _1429 = _1427 + 1.0;
        _1341 = _1429;
    }
    float _1431 = _1341;
    float _1433 = _1115 * _1393;
    float _1435 = _1155 * _1393;
    float _1437 = float(_1425);
    float _1439 = fma(_1431, 4.0, -1.0);
    float _1441 = -_1433;
    float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1445 = -_1435;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1155);
    float _1449 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1451 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1453 = _1443 * _1443;
    if (_1421)
    {
        float _1455 = -_1351;
        float _1457 = _1455 + 1.0;
        _1357 = _1457;
    }
    float _1459 = _1357;
    float _1461 = fma(_1361, _1449, _1423);
    float _1463 = fma(_1437, _1451, _1419);
    float _1465 = fma(_1447, _1447, _1453);
    float _1467 = rsqrt(_1169);
    float _1469 = fma(_1459, 4.0, -1.0);
    float _1471 = fma(_1461, 3.1415927410125732421875, _1247);
    bool _1473 = !_1067;
    int _1475 = _1473 ? 0 : 1;
    if (_1245)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1477 = -_1433;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1101);
    float _1481 = fma(_1127, _1359, _1127);
    float _1483 = -_1435;
    float _1485 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1487 = fma(_1471, _1359, _1471);
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1491 = _1479 + _1489;
    int _1493 = abs(_1475);
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1497 = _1485 + _1495;
    float _1499 = _1375 * 0.15915493667125701904296875;
    float _1501 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1503 = _1191 * _1393;
    float _1505 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1507 = _941 + _943;
    float _1509 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1501);
    float _1511 = float(_1493);
    float _1513 = -_1503;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1517 = rsqrt(_1215);
    float _1519 = _939 + (-0.5);
    float _1521 = _1507 + (-1.0);
    float _1523 = fma(_1511, _1505, _1463);
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1527 = _1515 + _1525;
    float _1529 = _1301 * (-2.0);
    float _1531 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1487);
    float _1533 = fma(_1523, 3.1415927410125732421875, _1249);
    float _1535 = sqrt(_1215);
    float _1537 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1509);
    float _1539 = _941 + (-0.5);
    float _1541 = fma(_1533, _1529, _1533);
    float _1543 = -_1503;
    float _1545 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1191);
    float _1547 = fma(_1481, _1031, _1531);
    bool _1549 = _1537 >= 0.0;
    float _1551 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1541);
    float _1553 = fma(_1545, _1545, _1465);
    float _1555 = _1547 * 0.15915493667125701904296875;
    float _1557 = _933 * _1243;
    float _1559 = _931 * _1517;
    float _1561 = _911 * _1467;
    float _1563 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1565 = _1499 * 6.283185482025146484375;
    float _1567 = cos(_1565);
    float _1569 = _1535 * _1559;
    float _1571 = _1535 * _1557;
    float _1573 = fma(_1563, _1529, _1563);
    float _1575 = _1535 * _1561;
    float _1577 = _1573;
    if (_1549)
    {
        out.m_49.x = 0.0;
    }
    float _1579 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1581 = fma(_1573, _1031, _1551);
    float _1583 = sqrt(_1553);
    if (_1549)
    {
        _1577 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1585 = _1577;
    float _1587 = _1581 * 0.15915493667125701904296875;
    float _1589 = _989 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1591 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1593 = as_type<int>(_1585);
    if (_1549)
    {
        float _1595 = _1585 * 5.0;
        _1593 = as_type<int>(_1595);
    }
    int _1597 = _1593;
    float _1599 = _1555 * 6.283185482025146484375;
    float _1601 = cos(_1599);
    if (_1549)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4626 = as_type<float>(_1597);
        out.gl_Position.z = _4626;
    }
    float _1603 = _1499 * 6.283185482025146484375;
    float _1605 = sin(_1603);
    float _1607 = _1393 * _1583;
    float _1609 = _1555 * 6.283185482025146484375;
    float _1611 = sin(_1609);
    float _1613 = _1601 * _1567;
    float _1615 = _1587 * 6.283185482025146484375;
    float _1617 = sin(_1615);
    if (_1549)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1619 = _1587 * 6.283185482025146484375;
    float _1621 = cos(_1619);
    float _1623 = _1611 * _1605;
    float _1625 = _1607 * _1589;
    float _1627 = _1607 * _1591;
    float _1629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1569);
    float _1631 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1571);
    float _1633 = _1607 * _1579;
    float _1635 = fma(_1617, _1623, _1613);
    float _1637 = fma(_1617, _1613, _1623);
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1575);
    float _1641 = _1601 * _1605;
    float _1643 = _1611 * _1567;
    float _1645 = _1627 * _1629;
    float _1647 = _1625 * _1631;
    float _1649 = _1633 * _1639;
    float _1651 = -_1641;
    float _1653 = fma(_1617, _1643, _1651);
    float _1655 = _1601 * _1621;
    float _1657 = _1611 * _1621;
    float _1659 = _1621 * _1645;
    float _1661 = _1635 * _1647;
    float _1663 = _1653 * _1647;
    float _1665 = -_1643;
    float _1667 = fma(_1617, _1641, _1665);
    float _1669 = _1657 * _1647;
    float _1671 = fma(_1605, _1659, _1661);
    float _1673 = fma(_1567, _1659, _1663);
    float _1675 = -_1617;
    float _1677 = fma(_1675, _1645, _1669);
    float _1679 = fma(_1667, _1649, _1671);
    float _1681 = fma(_1637, _1649, _1673);
    float _1683 = fma(_1655, _1649, _1677);
    float _1685 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1687 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1689 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1691 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1693 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1685);
    float _1695 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1687);
    float _1697 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1689);
    float _1699 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1701 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1693);
    float _1703 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1695);
    float _1705 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1697);
    float _1707 = _1691 * _1691;
    float _1709 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1713 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1715 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1717 = _1709 * _1709;
    float _1719 = fma(_1699, _1699, _1707);
    float _1721 = fma(_1711, _1711, _1717);
    float _1723 = fma(_1715, _1715, _1719);
    float _1725 = fma(_1713, _1713, _1721);
    float _1727 = rsqrt(_1723);
    float _1729 = rsqrt(_1725);
    float _1731 = _1691 * _1727;
    float _1733 = sqrt(_1723);
    float _1735 = _1699 * _1727;
    float _1737 = _1715 * _1727;
    float _1739 = _1709 * _1729;
    float _1741 = _1711 * _1729;
    float _1743 = _1713 * _1729;
    float _1745 = _1731 * _1739;
    float _1747 = fma(_1735, _1741, _1745);
    float _1749 = fma(_1737, _1743, _1747);
    float _1751 = _1749 * _1733;
    float _1753 = fma(_1735, _1751, _1711);
    float _1755 = fma(_1737, _1751, _1713);
    float _1757 = fma(_1731, _1751, _1709);
    float _1759 = _1111 + _1753;
    float _1761 = _1141 + _1755;
    float _1763 = _1101 + _1757;
    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1767 = _1759 + _1765;
    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1771 = _1761 + _1769;
    float _1773 = _1767 * _1767;
    float _1775 = _1771 * _1771;
    float _1777 = _1773 + _1775;
    float _1779 = sqrt(_1777);
    bool _1781 = _1779 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1783 = _1709;
    float _1785 = _1759;
    float _1787 = _1729;
    float _1789 = _1773;
    float _1791 = _1775;
    if (!_1781)
    {
        _1783 = _1759;
    }
    float _1793 = _1783;
    float _1795 = _1793;
    if (!_1781)
    {
        _1785 = _1761;
    }
    float _1797 = _1785;
    float _1799 = _1797;
    if (!_1781)
    {
        _1787 = _1763;
    }
    float _1801 = _1787;
    bool _1803 = !_1781;
    float _1805 = _1801;
    if (!_1803)
    {
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1811 = _1779 + _1809;
        float _1813 = _1763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = rsqrt(_1777);
        float _1817 = _1811 * _1807;
        float _1819 = _1817 * 0.15915493667125701904296875;
        float _1821 = _1819 * 6.283185482025146484375;
        float _1823 = sin(_1821);
        float _1825 = _1819 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = fma(_1823, _1813, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1831 = _1815 * _1829;
        float _1833 = _1827 + (-1.0);
        float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1837 = _1767 * _1831;
        float _1839 = _1771 * _1831;
        float _1841 = fma(_1763, _1827, _1835);
        float _1843 = _1837 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1845 = _1839 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1847 = _1837 * _1837;
        float _1849 = _1839 * _1839;
        _1805 = _1841;
        _1789 = _1847;
        _1791 = _1849;
        _1795 = _1843;
        _1799 = _1845;
    }
    float _1851 = _1805;
    float _1853 = _1789;
    float _1855 = _1791;
    float _1857 = _1795;
    float _1859 = _1799;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1863 = _1851 + _1861;
    out.m_59.x = _809;
    out.m_59.y = _811;
    out.m_59.z = _815;
    out.m_59.w = _817;
    float _1865 = fma(_1863, _1863, _1853);
    out.m_61.x = _819;
    out.m_61.y = _821;
    out.m_61.z = _823;
    float _1867 = _1865 + _1855;
    float _1869 = sqrt(_1867);
    bool _1871 = _1869 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1873 = isnan(_1869);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1879 = _1875 || _1877;
    float _1881 = _1853;
    if (!_1879)
    {
        _1881 = 1.0;
    }
    float _1883 = _1881;
    bool _1885 = !_1879;
    float _1887 = _1883;
    if (!_1885)
    {
        bool _1889 = _1869 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1891 = isnan(_1869);
        bool _1893 = _1889 || _1891;
        bool _1895 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1897 = _1893 || _1895;
        if (!_1897)
        {
            float _1899 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1901 = _1869 + _1899;
            float _1903 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1905 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1903;
            float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1909 = _1907 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1911 = 1.0 / _1905;
            float _1913 = _1901 * _1911;
            float _1915 = fma(_1913, _1909, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1887 = _1915;
            _1917 = true;
        }
        else
        {
            bool _1919 = _1869 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1921 = isnan(_1869);
            bool _1923 = _1919 || _1921;
            bool _1925 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1927 = _1923 || _1925;
            if (!_1927)
            {
                float _1929 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1931 = _1869 + _1929;
                float _1933 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1935 = _1933 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1937 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1939 = _1937 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1941 = 1.0 / _1935;
                float _1943 = _1931 * _1941;
                float _1945 = fma(_1943, _1939, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1887 = _1945;
                _1917 = true;
            }
            else
            {
                _1887 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1917 = false;
    float _1947 = _1887;
    float _1949 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1951 = _1851 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1955 = _1857 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1959 = _1859 + _1957;
    float _1961 = fma(_1951, _1947, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1963 = fma(_1955, _1947, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1965 = fma(_1959, _1947, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1967 = -_1433;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1961);
    float _1971 = -_1435;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1963);
    float _1975 = -_1503;
    float _1977 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1965);
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1981 = _1969 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1985 = _1973 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1989 = _1977 + _1987;
    float _1991 = _1981 * _1981;
    float _1993 = fma(_1985, _1985, _1991);
    float _1995 = fma(_1989, _1989, _1993);
    float _1997 = rsqrt(_1995);
    float _1999 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2001 = _1985 * _1999;
    float _2003 = _1989 * _1999;
    float _2005 = _2001 * _2001;
    float _2007 = _2003 * _2003;
    float _2009 = _2005 + _2007;
    float _2011 = sqrt(_2009);
    bool _2013 = _2011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2017 = _2011 + _2015;
    float _2019 = _1997;
    float _2021 = _2009;
    float _2023 = _2017;
    float _2025 = _1981;
    float _2027 = _1999;
    float _2029 = _2001;
    if (_2013)
    {
        float _2031 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2019 = _2031;
    }
    float _2033 = _2019;
    if (_2013)
    {
        float _2035 = rsqrt(_2009);
        _2021 = _2035;
    }
    float _2037 = _2021;
    if (_2013)
    {
        float _2039 = _2017 * _2033;
        _2023 = _2039;
    }
    float _2041 = _2023;
    if (_2013)
    {
        float _2043 = _2041 * 0.15915493667125701904296875;
        _841 = _2043;
    }
    float _2045 = _841;
    float _2047 = _2033;
    float _2049 = _2045;
    if (_2013)
    {
        float _2051 = _2045 * 6.283185482025146484375;
        float _2053 = sin(_2051);
        _2047 = _2053;
    }
    float _2055 = _2047;
    float _2057 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2059 = precise::max(0.0, _2057);
    float _2061 = _1989;
    float _2063 = _2059;
    if (_2013)
    {
        float _2065 = _2045 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        _2061 = _2067;
    }
    float _2069 = _2061;
    float _2071 = -_1999;
    float _2073 = -_2059;
    float _2075 = fma(_1981, _2071, _2073);
    if (!_2013)
    {
        _2025 = _2003;
    }
    float _2077 = _2025;
    float _2079 = _2077;
    if (_2013)
    {
        float _2081 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2063 = _2081;
    }
    float _2083 = _2063;
    float _2085 = _2055;
    float _2087 = _2083;
    if (_2013)
    {
        float _2089 = fma(_2055, _2083, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2085 = _2089;
    }
    float _2091 = _2085;
    float _2093 = _2091;
    float _2095 = _2069;
    if (_2013)
    {
        float _2097 = _2069 + (-1.0);
        _2087 = _2097;
    }
    float _2099 = _2087;
    float _2101 = _2099;
    if (_2013)
    {
        float _2103 = _2037 * _2091;
        _2027 = _2103;
    }
    float _2105 = _2027;
    if (!_2013)
    {
        _2093 = _2075;
    }
    float _2107 = _2093;
    float _2109 = sqrt(_1995);
    float _2111 = _2107;
    if (_2013)
    {
        float _2113 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2049 = _2113;
    }
    float _2115 = _2049;
    if (_2013)
    {
        float _2117 = _2001 * _2105;
        _2029 = _2117;
    }
    float _2119 = _2029;
    if (!_2013)
    {
        _2101 = _2005;
    }
    float _2121 = _2101;
    float _2123 = _2121;
    if (_2013)
    {
        float _2125 = _2003 * _2105;
        _2079 = _2125;
    }
    float _2127 = _2079;
    if (_2013)
    {
        float _2129 = fma(_2075, _2069, _2115);
        _2111 = _2129;
    }
    float _2131 = _2111;
    if (_2013)
    {
        float _2133 = _2119 * _2119;
        _2123 = _2133;
    }
    float _2135 = _2123;
    if (!_2013)
    {
        _2095 = _2007;
    }
    float _2137 = _2095;
    float _2139 = _2137;
    if (_2013)
    {
        float _2141 = _2127 * _2127;
        _2139 = _2141;
    }
    float _2143 = _2139;
    float _2145 = fma(_2131, _2131, _2135);
    float _2147 = _2145 + _2143;
    float _2149 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2153 = fma(_2109, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2151);
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    float _2157 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2159 = rsqrt(_2147);
    float _2161 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2149);
    float _2163 = -_2155;
    float _2165 = _2163 + 1.0;
    float _2167 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2169 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2157);
    float _2171 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2161);
    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2175 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2167);
    float _2177 = abs(_2165);
    float _2179 = log2(_2177);
    float _2181 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2183 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2169);
    float _2185 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2175);
    float _2187 = _1969 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2189 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2191 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2193 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2195 = _2159 * _2119;
    float _2197 = -_2189;
    float _2199 = fma(_2197, _2173, 1.0);
    float _2201 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2187);
    float _2203 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2205 = _2159 * _2131;
    float _2207 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2209 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2201);
    float _2211 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2203);
    float _2213 = _2159 * _2127;
    float _2215 = -_2207;
    float _2217 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2215);
    float _2219 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2221 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2223 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2211);
    float _2225 = -_2213;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2217);
    float _2229 = log2(_2199);
    float _2231 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2233 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2223);
    float _2235 = fma(_2227, -0.5, 0.5);
    float _2237 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2239 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2231);
    float _2241 = fma(_2227, 0.5, 0.5);
    float _2243 = _2205 + 1.0;
    float _2245 = exp2(_2221);
    float _2247 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2237);
    float _2249 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2239);
    float _2251 = fma(_2241, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2253 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2247);
    float _2255 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2249);
    float _2257 = fma(_2241, _2251, -0.212114393711090087890625);
    float _2259 = 1.0 / _2233;
    float _2261 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2253);
    float _2263 = fma(_2241, _2257, 1.570728778839111328125);
    float _2265 = sqrt(_2235);
    float _2267 = -_2205;
    float _2269 = fma(_2245, _2243, _2267);
    float _2271 = _2229 * 0.693147182464599609375;
    float _2273 = fma(_2269, 0.5, 0.5);
    float _2275 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2277 = _2255 * _2259;
    float _2279 = _2261 * _2259;
    float _2281 = fma(_2277, 0.5, 0.5);
    float _2283 = fma(_2279, -0.5, 0.5);
    float _2285 = _2265 * 0.636619746685028076171875;
    float3 _5769 = float3(_2281, _2283, _2275);
    float _2287 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5769, float3(0.0), isnan(_5769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5769, float3(0.0), isnan(_5769)), level(0.0)).x;
    float _2289 = -_2263;
    float _2291 = fma(_2285, _2289, 1.0);
    float3 _5785 = float3(_2281, _2283, _2275);
    float4 _2293 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5785, float3(0.0), isnan(_5785)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5785, float3(0.0), isnan(_5785)), level(0.0)).xyzw;
    float _2295 = _2293.x;
    float _2297 = _2293.y;
    float _2299 = _2293.z;
    float _2301 = _2293.w;
    float2 _5801 = float2(_2291, _2273);
    float3 _2305 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5801, float2(0.0), isnan(_5801)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5801, float2(0.0), isnan(_5801)), level(0.0)).xyz;
    float _2307 = _2305.x;
    float _2309 = _2305.y;
    float _2311 = _2305.z;
    float _2313 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2315 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2317 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2315);
    float _2319 = exp2(_2313);
    float _2321 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2317);
    float _2323 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2321);
    float _2325 = _2323 + _2233;
    float _2327 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2255;
    out.gl_Position.y = _2261;
    out.gl_Position.z = _2323;
    out.gl_Position.w = _2233;
    float _2329 = _2325 * 0.5;
    float _2331 = -_2319;
    float _2333 = _2331 + 1.0;
    out.m_49.x = _2327;
    float _2335 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2329;
    out.m_71.w = _2233;
    float _2337 = _2335 * _2287;
    float _2339 = -_2335;
    float _2341 = _2339 + 1.0;
    float _2343 = _2301 * _2337;
    float _2345 = _2311 * _2337;
    float _2347 = fma(_2307, _2343, _2295);
    float _2349 = fma(_2309, _2343, _2297);
    float _2351 = _2301 * _2341;
    float _2353 = fma(_2301, _2345, _2299);
    out.m_73.x = _2347;
    out.m_73.y = _2349;
    out.m_73.z = _2353;
    out.m_73.w = _2351;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

