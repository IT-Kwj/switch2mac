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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2863 = false;
    bool _647 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3168 = as_type<float>(_117);
        out.gl_Position.z = _3168;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_49.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _137 = _141;
    }
    float _143 = _137;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3237 = as_type<float>(_155);
        out.gl_Position.z = _3237;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_51.x;
    float _159 = in.m_51.y;
    float _161 = in.m_51.z;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _167 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = in.m_53.x;
    float _171 = in.m_53.y;
    float _173 = in.m_53.z;
    float _175 = in.m_55.x;
    float _177 = in.m_55.y;
    float _179 = in.m_55.z;
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _183 = in.m_57.x;
    float _185 = _165 * _163;
    float _187 = _157 * _157;
    float _189 = _159 * _159;
    float _191 = _161 * _161;
    float _193 = fma(_169, _169, _187);
    float _195 = fma(_171, _171, _189);
    float _197 = fma(_173, _173, _191);
    float _199 = fma(_175, _175, _193);
    float _201 = fma(_177, _177, _195);
    float _203 = fma(_179, _179, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[20].x, _185);
    float _209 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    bool _211 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _215 = _211 || _213;
    bool _217 = isnan(1.0);
    bool _219 = _215 || _217;
    float _221 = _209 * _181;
    float _223 = sqrt(_201);
    float _225 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[20].y, _221);
    bool _227 = _205 > 0.0;
    float _229 = floor(_207);
    float _231 = 0.0;
    float _233 = _201;
    float _235 = _181;
    float _237 = _199;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _241 = _167;
    if (!_219)
    {
        float _243 = _167 * _167;
        float _245 = _243 * 0.5;
        _231 = _245;
    }
    float _247 = _231;
    float _249 = _247;
    if (!_219)
    {
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _251;
    }
    float _253 = _249;
    bool _255 = _223 > 0.0;
    float _257 = sqrt(_203);
    int _259 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _261 = _259 != 0;
    float _263 = floor(_225);
    float _265 = 0.0;
    float _267 = _253;
    float _269 = 1.4012984643248170709237295832899e-45;
    if (_227)
    {
        float _271 = rsqrt(_199);
        _265 = _271;
    }
    float _273 = _265;
    bool _275 = _257 > 0.0;
    float _277 = _257;
    if (!_219)
    {
        _277 = _167;
    }
    float _279 = _277;
    float _281 = 0.0;
    float _283 = _279;
    if (_255)
    {
        float _285 = rsqrt(_201);
        _281 = _285;
    }
    float _287 = _281;
    bool _289 = !_219;
    if (!_289)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = _167 * _293;
        float _303 = 1.0 / _297;
        float _305 = _299 * 0.693147182464599609375;
        float _307 = exp2(_301);
        float _309 = 1.0 / _305;
        float _311 = _307 + (-1.0);
        float _313 = -_311;
        float _315 = fma(_313, _309, _167);
        float _317 = _315 * _303;
        float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _307;
        _267 = _319;
        _235 = _317;
        _269 = _303;
        _237 = _309;
    }
    float _321 = _233;
    float _323 = _267;
    float _325 = _235;
    float _327 = _269;
    float _329 = _237;
    bool _331 = !_219;
    float _333 = _325;
    float _335 = _321;
    float _337 = _327;
    float _339 = _329;
    if (!_331)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _167 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _333 = _349;
        _335 = _351;
        _239 = _347;
        _283 = _359;
    }
    float _361 = _333;
    float _363 = _335;
    float _365 = _239;
    float _367 = _283;
    float _369 = -_229;
    float _371 = _207 + _369;
    float _373 = _207 * 6.283185482025146484375;
    float _375 = 0.0;
    float _377 = _361;
    float _379 = _365;
    float _381 = _363;
    if (_275)
    {
        float _383 = rsqrt(_203);
        _375 = _383;
    }
    float _385 = _375;
    float _387 = -_263;
    float _389 = _225 + _387;
    float _391 = _225 * 6.283185482025146484375;
    float _393 = _373 * 0.15915493667125701904296875;
    if (!_227)
    {
        _241 = 0.0;
    }
    float _395 = _241;
    float _397 = _395;
    if (_227)
    {
        float _399 = _273 * _169;
        _397 = _399;
    }
    float _401 = _397;
    float _403 = _391 * 0.15915493667125701904296875;
    if (!_227)
    {
        _377 = 0.0;
    }
    float _405 = _377;
    float _407 = _405;
    if (_227)
    {
        float _409 = _273 * _157;
        _407 = _409;
    }
    float _411 = _407;
    float _413 = _393 * 6.283185482025146484375;
    float _415 = cos(_413);
    if (!_227)
    {
        _379 = 0.0;
    }
    float _417 = _379;
    float _419 = _417;
    if (_227)
    {
        float _421 = _273 * _175;
        _419 = _421;
    }
    float _423 = _419;
    float _425 = 0.0;
    if (!_275)
    {
        _425 = 0.0;
    }
    float _427 = _425;
    float _429 = in.m_49.x;
    float _431 = in.m_49.y;
    float _433 = in.m_49.z;
    float _435 = _427;
    if (!_275)
    {
        _381 = 0.0;
    }
    float _437 = _381;
    float _439 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = 0.0;
    float _443 = _437;
    if (!_275)
    {
        _441 = 0.0;
    }
    float _445 = _441;
    float _447 = _403 * 6.283185482025146484375;
    float _449 = cos(_447);
    float _451 = _445;
    if (_275)
    {
        float _453 = _385 * _173;
        _435 = _453;
    }
    float _455 = _435;
    if (_275)
    {
        float _457 = _385 * _161;
        _443 = _457;
    }
    float _459 = _443;
    if (_275)
    {
        float _461 = _385 * _179;
        _451 = _461;
    }
    float _463 = _451;
    float _465 = 0.0;
    if (!_255)
    {
        _465 = 0.0;
    }
    float _467 = _465;
    float _469 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _471 = _467;
    if (!_255)
    {
        _337 = 0.0;
    }
    float _473 = _337;
    float _475 = _473;
    if (_255)
    {
        float _477 = _287 * _171;
        _471 = _477;
    }
    float _479 = _471;
    if (!_255)
    {
        _339 = 0.0;
    }
    float _481 = _339;
    float _483 = _481;
    if (_255)
    {
        float _485 = _287 * _159;
        _475 = _485;
    }
    float _487 = _475;
    if (_255)
    {
        float _489 = _287 * _177;
        _483 = _489;
    }
    float _491 = _483;
    float _493 = fma(_415, 0.5, 0.5);
    bool _495 = _371 < 0.5;
    float _497 = float(_495);
    float _499 = _469 * _411;
    float _501 = _469 * _459;
    float _503 = -_371;
    float _505 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _507 = -_493;
    float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _511 = -_497;
    float _513 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _515 = _469 * _487;
    float _517 = fma(_439, _401, _499);
    float _519 = in.m_59.w;
    bool _521 = _389 < 0.5;
    float _523 = float(_521);
    float _525 = fma(_449, 0.5, 0.5);
    float _527 = in.m_44.x;
    float _529 = in.m_44.y;
    float _531 = in.m_44.z;
    float _533 = -_389;
    float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _537 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _539 = -_523;
    float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _543 = -_525;
    float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _547 = fma(_439, _479, _515);
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _551 = _549 != 0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _555 = _553 != 0;
    float _557 = fma(_439, _455, _501);
    float _559 = fma(_537, _423, _517);
    float _561 = fma(_537, _491, _547);
    bool _563 = !_261;
    int _565 = _563 ? 0 : 1;
    float _567 = fma(_537, _463, _557);
    bool _569 = !_551;
    int _571 = _569 ? 0 : 1;
    float _573 = fma(_367, _429, _559);
    int _575 = abs(_565);
    float _577 = fma(_367, _431, _561);
    int _579 = abs(_571);
    bool _581 = !_555;
    int _583 = _581 ? 0 : 1;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _587 = abs(_583);
    float _589 = fma(_367, _433, _567);
    float _591 = float(_579);
    float _593 = fma(_573, _519, _527);
    float _595 = float(_575);
    float _597 = fma(_577, _519, _529);
    float _599 = abs(_505);
    float _601 = _591 * _599;
    float _603 = abs(_535);
    float _605 = _591 * _603;
    float _607 = fma(_589, _519, _531);
    float _609 = float(_587);
    float _611 = fma(_595, _509, _601);
    float _613 = fma(_595, _545, _605);
    float _615 = abs(_513);
    float _617 = fma(_609, _615, _611);
    float _619 = abs(_541);
    float _621 = fma(_609, _619, _613);
    bool _623 = !_585;
    float _625 = _593;
    float _643;
    float _645;
    if (!_623)
    {
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _629 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _631 = float(_101);
        float _633 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _635 = _633 * _627;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = _631;
        _647 = true;
    }
    else
    {
        float _649 = float(_101);
        float _651 = 1.0 / _649;
        float _653 = _135 * _651;
        _643 = _653;
        _645 = _649;
    }
    _647 = false;
    float _655 = _643;
    float _657 = _645;
    float _659 = in.m_57.y;
    float _661 = _183 * 2.0;
    float _663 = in.m_57.z;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _673;
    float _677 = 1.0 / _667;
    float _679 = _183 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _683 = _655 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _687 = _655 + _685;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _691 = 1.0 / _675;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _695 = -_689;
    float _697 = fma(_679, 2.0, _695);
    bool _699 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _707 = _703 || _705;
    float _709 = _659 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _711 = -_135;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[76].x, _697);
    float _715 = 1.0 / _671;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _717;
    float _721 = _663 * 2.0;
    bool _723 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _725 = isnan(_655);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _737 = log2(_735);
    float _739 = fma(_709, -2.0, _693);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _743 = _655 + _741;
    float _745 = _659 * 2.0;
    float _747 = _683 * _691;
    float _749 = _659 + _663;
    float _751 = _743 * _677;
    float _753 = _183 + _659;
    float _755 = floor(_661);
    float _757 = _749 + (-1.0);
    float _759 = _753 + (-1.0);
    float _761 = _687 * _715;
    float _763 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _765 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _767 = floor(_721);
    float _769 = _737 * _135;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _771;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _779 = fma(_719, _751, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _783 = 1.0 + _781;
    float _785 = floor(_745);
    bool _787 = _755 > 0.0;
    float _789 = fma(_773, _751, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _791 = _755 >= 0.0;
    bool _793 = isnan(_755);
    bool _795 = _791 || _793;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    float _801 = _183 + _663;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = fma(_777, _761, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _809 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _811 = int(_809);
    float _813 = _801 + (-1.0);
    bool _815 = _767 > 0.0;
    float _817 = fma(_805, _761, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _819 = _767 >= 0.0;
    bool _821 = isnan(_767);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _833 = exp2(_769);
    bool _835 = _785 > 0.0;
    float _837 = _663 + (-0.5);
    bool _839 = _785 >= 0.0;
    bool _841 = isnan(_785);
    bool _843 = _839 || _841;
    bool _845 = isnan(0.0);
    bool _847 = _843 || _845;
    float _849 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[78].z, _831);
    float _851 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _853 = int(_851);
    float _855 = float(_811);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _861;
    float _865 = fma(_859, _747, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _867 = -_833;
    float _869 = _867 + 1.0;
    float _871 = 1.0 / _855;
    float _873 = fma(_863, _747, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _875 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _849);
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _879 = _707 ? _869 : 0.0;
    bool _881 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _883 = isnan(1.0);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _889 = _885 || _887;
    float _891 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[78].w, _877);
    float _893 = 1.0 / _783;
    float _895 = float(_853);
    float _897 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _739);
    float _899 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    int _901 = _799 ? 0 : 1;
    float _903 = _895 * _135;
    int _905 = _847 ? 0 : 1;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _909 = _871 * _135;
    int _911 = ~_901;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    int _917 = _827 ? 0 : 1;
    int _919 = _915;
    if (!_787)
    {
        int _921 = ~_901;
        int _923 = _921 + 1;
        _919 = _923;
    }
    int _925 = _919;
    if (_889)
    {
        float _927 = _879 * _893;
        _139 = _927;
    }
    float _929 = _139;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _933 = _931 != 0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _941 = _939 != 0;
    int _943 = ~_905;
    int _945 = _943 + 1;
    int _947 = _945 + 1;
    int _949 = _947;
    if (!_835)
    {
        int _951 = ~_905;
        int _953 = _951 + 1;
        _949 = _953;
    }
    int _955 = _949;
    float _957 = _929 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _959 = !_933;
    int _961 = _959 ? 0 : 1;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _973 = _971 != 0;
    float _975 = _957 * _907;
    bool _977 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _979 = isnan(_655);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    bool _989 = !_937;
    int _991 = _989 ? 0 : 1;
    bool _993 = !_941;
    int _995 = _993 ? 0 : 1;
    float _997 = -_987;
    float _999 = _997 + 1.0;
    bool _1001 = !_973;
    int _1003 = _1001 ? 0 : 1;
    int _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1007 = _1005 != 0;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1015 = _1013 != 0;
    bool _1017 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1019 = isnan(_655);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    int _1029 = ~_917;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    bool _1035 = !_1007;
    int _1037 = _1035 ? 0 : 1;
    float _1039 = _1027 * _999;
    int _1041 = _1033;
    if (!_815)
    {
        int _1043 = ~_917;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    float _1049 = -_1027;
    float _1051 = _1049 + 1.0;
    bool _1053 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1055 = isnan(_655);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = in.m_61.x;
    float _1067 = in.m_61.y;
    float _1069 = in.m_61.z;
    int _1071 = abs(_1037);
    float _1073 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[203].z, _975);
    bool _1075 = !_1015;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = _733 * _1051;
    bool _1081 = !_1011;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = _1073 + 0.25;
    int _1087 = abs(_1077);
    float _1089 = floor(_1073);
    float _1091 = float(_1047);
    float _1093 = -_733;
    float _1095 = _1093 + 1.0;
    float _1097 = float(_1071);
    float _1099 = float(_955);
    float _1101 = _1063 * _1095;
    float _1103 = float(_1087);
    float _1105 = floor(_1085);
    int _1107 = abs(_1083);
    float _1109 = _1097 * _1091;
    float _1111 = float(_925);
    float _1113 = _1103 * _1099;
    float _1115 = float(_1107);
    float _1117 = _1109 * (-2.0);
    float _1119 = _789 * _1101;
    float _1121 = _779 * _1101;
    float _1123 = -_1089;
    float _1125 = _1073 + _1123;
    float _1127 = _1115 * _1111;
    float _1129 = fma(_1117, _1065, _1065);
    bool _1131 = !_969;
    int _1133 = _1131 ? 0 : 1;
    float _1135 = _1127 * (-2.0);
    bool _1137 = _1125 >= 0.5;
    bool _1139 = isnan(_1125);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan(0.5);
    bool _1145 = _1141 || _1143;
    float _1147 = -_1105;
    float _1149 = _1085 + _1147;
    float _1151 = _1073 * 6.283185482025146484375;
    int _1153 = abs(_1133);
    float _1155 = fma(_1135, _1067, _1067);
    float _1157 = fma(_765, _1117, _765);
    float _1159 = _1151 * 0.15915493667125701904296875;
    float _1161 = _183 + (-0.5);
    bool _1163 = _1149 > 0.5;
    float _1165 = fma(_763, _1135, _763);
    bool _1167 = !_965;
    int _1169 = _1167 ? 0 : 1;
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1129);
    float _1173 = _1159 * 6.283185482025146484375;
    float _1175 = sin(_1173);
    float _1177 = _659 + (-0.5);
    bool _1179 = !_1145;
    float _1181 = _1179 ? 0.5 : (-0.5);
    float _1183 = fma(_1157, _929, _1171);
    int _1185 = abs(_1169);
    float _1187 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1155);
    float _1189 = float(_1153);
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1193 = _1191 * 2.0;
    float _1195 = _1149;
    if (_1163)
    {
        float _1197 = -_1149;
        float _1199 = _1197 + 1.0;
        _1195 = _1199;
    }
    float _1201 = _1195;
    int _1203 = abs(_1003);
    float _1205 = _1189 * _1193;
    float _1207 = float(_1185);
    float _1209 = fma(_1201, 4.0, -1.0);
    float _1211 = as_type<float>(int(gl_VertexIndex));
    float _1213 = fma(_1165, _929, _1187);
    float _1215 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1217 = _1183 * 0.15915493667125701904296875;
    float _1219 = _1213 * 0.15915493667125701904296875;
    float _1221 = fma(_1207, _1215, _1205);
    float _1223 = float(_1203);
    float _1225 = in.m_59.x;
    float _1227 = in.m_59.y;
    float _1229 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1231 = -_1063;
    float _1233 = _1231 + 1.0;
    float _1235 = _1217 * 6.283185482025146484375;
    float _1237 = sin(_1235);
    float _1239 = fma(_1223, _1229, _1221);
    float _1241 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1121);
    float _1243 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1119);
    float _1245 = fma(_1239, 3.1415927410125732421875, _1069);
    float _1247 = _1113 * (-2.0);
    float _1249 = fma(_817, _1079, _1241);
    float _1251 = fma(_807, _1079, _1243);
    float _1253 = _1217 * 6.283185482025146484375;
    float _1255 = cos(_1253);
    float _1257 = fma(_1245, _1247, _1245);
    float _1259 = fma(_873, _1039, _1249);
    float _1261 = fma(_829, _1247, _829);
    float _1263 = fma(_865, _1039, _1251);
    float _1265 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1257);
    float _1267 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1259);
    int _1269 = as_type<int>(_1211) & 1;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>(_1211) & 2;
    bool _1275 = _1273 != 0;
    float _1277 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1263);
    float _1279 = fma(_1261, _929, _1265);
    float _1281 = _1219 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = _1267 * _1227;
    float _1287 = _1277 * _1225;
    float _1289 = _1279 * 0.15915493667125701904296875;
    float _1291 = _597 * _177;
    float _1293 = _621 * _1285;
    bool _1295 = !_1271;
    float _1297 = _1295 ? (-0.5) : 0.5;
    float _1299 = _617 * _1287;
    float _1301 = _1219 * 6.283185482025146484375;
    float _1303 = cos(_1301);
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1307 = !_1275;
    float _1309 = _1307 ? (-0.5) : 0.5;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1297);
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1315 = fma(_593, _175, _1291);
    bool _1317 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1319 = isnan(0.5);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1325 = _1321 || _1323;
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1309);
    float _1329 = _1289 * 6.283185482025146484375;
    float _1331 = cos(_1329);
    float _1333 = _1313 * _1311;
    float _1335 = _1237 * _1283;
    float _1337 = _1305 * _1327;
    float _1339 = _1255 * _1283;
    float _1341 = fma(_607, _179, _1315);
    float _1343 = _1289 * 6.283185482025146484375;
    float _1345 = sin(_1343);
    float _1347 = _1255 * _1303;
    float _1349 = _1237 * _1303;
    float _1351 = _1255 * _1331;
    float _1353 = _1303 * _1331;
    float _1355 = _1237 * _1331;
    float _1357 = _1283 * _1331;
    float _1359 = _1351 * _1337;
    float _1361 = in.m_55.w;
    float _1363 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1365 = fma(_1345, _1347, _1335);
    float _1367 = -_1337;
    float _1369 = _1345 * _1367;
    float _1371 = in.m_53.w;
    float _1373 = -_1349;
    float _1375 = fma(_1345, _1339, _1373);
    float _1377 = fma(_1365, _1333, _1359);
    float _1379 = fma(_1353, _1333, _1369);
    float _1381 = -_1339;
    float _1383 = fma(_1345, _1349, _1381);
    float _1385 = _1355 * _1337;
    float _1387 = fma(_1375, _1363, _1377);
    float _1389 = fma(_1345, _1335, _1347);
    float _1391 = fma(_1357, _1363, _1379);
    float _1393 = fma(_1383, _1333, _1385);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1397 = _597 * _171;
    float _1399 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = fma(_1389, _1363, _1393);
    float _1403 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1395);
    float _1405 = fma(_593, _169, _1397);
    float _1407 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1409 = _597 * _159;
    float _1411 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1403);
    float _1413 = fma(_607, _173, _1405);
    float _1415 = _1341 + _1361;
    float _1417 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1407);
    float _1419 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1421 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1423 = _1413 + _1371;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1427 = _1415 + _1419;
    float _1429 = in.m_51.w;
    float _1431 = fma(_593, _157, _1409);
    float _1433 = _1423 + _1425;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1437 = _1427 + _1435;
    float _1439 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1421);
    float _1441 = fma(_607, _161, _1431);
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1445 = _1433 + _1443;
    float _1447 = _1437 * _1437;
    float _1449 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1439);
    float _1451 = fma(_1445, _1445, _1447);
    float _1453 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1455 = sqrt(_1451);
    float _1457 = _1441 + _1429;
    float _1459 = _1457 + _1453;
    bool _1461 = _1455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1463 = _1441;
    float _1465 = _1449;
    float _1467 = _1451;
    float _1469 = _1433;
    if (!_1461)
    {
        _1463 = _1433;
    }
    float _1471 = _1463;
    float _1473 = _1471;
    if (!_1461)
    {
        _1465 = _1427;
    }
    float _1475 = _1465;
    float _1477 = _1475;
    if (!_1461)
    {
        _625 = _1459;
    }
    float _1479 = _625;
    bool _1481 = !_1461;
    float _1483 = _1479;
    if (!_1481)
    {
        float _1485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1489 = _1455 + _1487;
        float _1491 = rsqrt(_1451);
        float _1493 = _1489 * _1485;
        float _1495 = _1459 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1497 = _1493 * 0.15915493667125701904296875;
        float _1499 = _1497 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1497 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = _1501 + (-1.0);
        float _1509 = fma(_1505, _1495, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1511 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1513 = _1491 * _1509;
        float _1515 = fma(_1459, _1501, _1511);
        float _1517 = fma(_1445, _1513, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1519 = fma(_1437, _1513, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1483 = _1515;
        _1473 = _1517;
        _1477 = _1519;
        _1467 = _1491;
    }
    float _1521 = _1483;
    float _1523 = _1473;
    float _1525 = _1477;
    float _1527 = _1467;
    float _1529 = _1521;
    float _1531 = _1523;
    float _1533 = _1525;
    if (!_1325)
    {
        float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1537 = _1457 + _1535;
        float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1541 = _1423 + _1539;
        float _1543 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1545 = -_1457;
        float _1547 = _1545 + _1521;
        float _1549 = _1537 * _1537;
        float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1553 = _1415 + _1551;
        float _1555 = fma(_1541, _1541, _1549);
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1559 = fma(_1553, _1553, _1555);
        float _1561 = sqrt(_1559);
        float _1563 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1565 = -_1423;
        float _1567 = _1565 + _1523;
        float _1569 = precise::min(_1561, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1571 = _1569 * _1557;
        float _1573 = _1563 * _1571;
        float _1575 = -_1415;
        float _1577 = _1575 + _1525;
        float _1579 = fma(_1567, _1573, _1423);
        float _1581 = fma(_1547, _1573, _1457);
        float _1583 = fma(_1577, _1573, _1415);
        _1529 = _1581;
        _1531 = _1579;
        _1533 = _1583;
    }
    float _1585 = _1529;
    float _1587 = _1531;
    float _1589 = _1533;
    float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1593 = _1585 + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1597 = _1587 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1601 = _1589 + _1599;
    float _1603 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1605 = _1593 * _1593;
    float _1607 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1603);
    float _1611 = fma(_1597, _1597, _1605);
    float _1613 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1609);
    float _1615 = fma(_1601, _1601, _1611);
    float _1617 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1619 = rsqrt(_1615);
    float _1621 = sqrt(_1615);
    float _1623 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1625 = _1597 * _1623;
    float _1627 = _1601 * _1623;
    float _1629 = _1625 * _1625;
    float _1631 = _1627 * _1627;
    float _1633 = _1629 + _1631;
    float _1635 = sqrt(_1633);
    bool _1637 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = _1635 + _1639;
    float _1643 = _1459;
    float _1645 = _1633;
    float _1647 = _1641;
    float _1649 = _1625;
    float _1651 = _1627;
    float _1653 = _1629;
    float _1655 = _1631;
    if (_1637)
    {
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1657;
    }
    float _1659 = _1643;
    if (_1637)
    {
        float _1661 = rsqrt(_1633);
        _1645 = _1661;
    }
    float _1663 = _1645;
    if (_1637)
    {
        float _1665 = _1641 * _1659;
        _1647 = _1665;
    }
    float _1667 = _1647;
    if (_1637)
    {
        float _1669 = _1667 * 0.15915493667125701904296875;
        _1469 = _1669;
    }
    float _1671 = _1469;
    float _1673 = _1527;
    if (_1637)
    {
        float _1675 = _1671 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        _1673 = _1677;
    }
    float _1679 = _1673;
    float _1681 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1683 = precise::max(0.0, _1681);
    float _1685 = _161;
    float _1687 = _1683;
    float _1689 = _1681;
    if (_1637)
    {
        float _1691 = _1671 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        _1685 = _1693;
    }
    float _1695 = _1685;
    float _1697 = -_1623;
    float _1699 = -_1683;
    float _1701 = fma(_1593, _1697, _1699);
    float _1703 = _1701;
    if (_1637)
    {
        float _1705 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1687 = _1705;
    }
    float _1707 = _1687;
    float _1709 = _1679;
    float _1711 = _1707;
    if (_1637)
    {
        float _1713 = fma(_1679, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1709 = _1713;
    }
    float _1715 = _1709;
    float _1717 = _1715;
    if (_1637)
    {
        float _1719 = _1695 + (-1.0);
        _1689 = _1719;
    }
    float _1721 = _1689;
    if (_1637)
    {
        float _1723 = _1663 * _1715;
        _1717 = _1723;
    }
    float _1725 = _1717;
    float _1727 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1637)
    {
        float _1729 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1711 = _1729;
    }
    float _1731 = _1711;
    if (_1637)
    {
        float _1733 = _1625 * _1725;
        _1649 = _1733;
    }
    float _1735 = _1649;
    if (_1637)
    {
        float _1737 = _1627 * _1725;
        _1651 = _1737;
    }
    float _1739 = _1651;
    if (_1637)
    {
        float _1741 = fma(_1701, _1695, _1731);
        _1703 = _1741;
    }
    float _1743 = _1703;
    if (_1637)
    {
        float _1745 = _1735 * _1735;
        _1653 = _1745;
    }
    float _1747 = _1653;
    if (_1637)
    {
        float _1749 = _1739 * _1739;
        _1655 = _1749;
    }
    float _1751 = _1655;
    float _1753 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1755 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1727);
    float _1757 = fma(_1743, _1743, _1747);
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1761 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1759);
    float _1763 = precise::clamp(_1761, 0.0, 1.0);
    float _1765 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1753);
    float _1767 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1755);
    float _1769 = _1757 + _1751;
    float _1771 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1773 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1765);
    float _1775 = -_1763;
    float _1777 = _1775 + 1.0;
    float _1779 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1781 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1771);
    float _1783 = rsqrt(_1769);
    float _1785 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1787 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1789 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1781);
    float _1791 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1795 = abs(_1777);
    float _1797 = log2(_1795);
    float _1799 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1793);
    float _1801 = -_1787;
    float _1803 = fma(_1801, _1607, 1.0);
    float _1805 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1799);
    float _1807 = _1783 * _1735;
    float _1809 = _1783 * _1743;
    float _1811 = _1783 * _1739;
    float _1813 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1815 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1817 = log2(_1803);
    float _1819 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1821 = -_1815;
    float _1823 = fma(_1809, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1821);
    float _1825 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1827 = -_1811;
    float _1829 = fma(_1827, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1823);
    float _1831 = 1.0 / _1813;
    float _1833 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1835 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1819);
    float _1837 = fma(_1829, -0.5, 0.5);
    float _1839 = fma(_1829, 0.5, 0.5);
    float _1841 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1833);
    float _1843 = _1809 + 1.0;
    float _1845 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1835);
    float _1847 = exp2(_1825);
    float _1849 = fma(_1839, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1851 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1841);
    float _1853 = _1817 * 0.693147182464599609375;
    float _1855 = fma(_1839, _1849, -0.212114393711090087890625);
    float _1857 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1851);
    float _1859 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1861 = sqrt(_1837);
    float _1863 = fma(_1839, _1855, 1.570728778839111328125);
    float _1865 = -_1809;
    float _1867 = fma(_1847, _1843, _1865);
    float _1869 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1845);
    float _1871 = _1857 * _1831;
    float _1873 = fma(_1867, 0.5, 0.5);
    float _1875 = _1869 * _1831;
    float _1877 = fma(_1871, 0.5, 0.5);
    float _1879 = _1861 * 0.636619746685028076171875;
    float _1881 = fma(_1875, -0.5, 0.5);
    float _1883 = -_1863;
    float _1885 = fma(_1879, _1883, 1.0);
    float3 _5813 = float3(_1877, _1881, _1859);
    float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5813, float3(0.0), isnan(_5813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5813, float3(0.0), isnan(_5813)), level(0.0)).x;
    float3 _5824 = float3(_1877, _1881, _1859);
    float4 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5824, float3(0.0), isnan(_5824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5824, float3(0.0), isnan(_5824)), level(0.0)).xyzw;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    float _1898 = _1890.w;
    float2 _5841 = float2(_1885, _1873);
    float3 _1902 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5841, float2(0.0), isnan(_5841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5841, float2(0.0), isnan(_5841)), level(0.0)).xyz;
    float _1904 = _1902.x;
    float _1906 = _1902.y;
    float _1908 = _1902.z;
    float _1910 = float(uint(_853));
    float _1912 = trunc(_909);
    int _1914 = int(_1912);
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1918 = _1916 != 0;
    float _1920 = -_899;
    float _1922 = _1920 + 1.0;
    int _1924 = ~_853;
    int _1926 = _1924 + 1;
    float _1928 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1930 = _853 == 0;
    int _1932 = abs(_991);
    float _1934 = 1.0 / _1910;
    bool _1936 = _659 > 0.5;
    bool _1938 = !_1918;
    float _1940 = _1938 ? 7.345489978790283203125 : 1.0;
    float _1942 = exp2(_1928);
    float _1944 = float(uint(_1914));
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1948 = as_type<int>(_1934) + (-2);
    float _1950 = as_type<float>(_1948) * _1944;
    int _1952 = ~_853;
    int _1954 = _1952 + 1;
    float _1956 = -_1942;
    float _1958 = _1956 + 1.0;
    float _1960 = trunc(_1950);
    float _1962 = precise::max(_1960, 0.0);
    uint _1965 = uint(_1962);
    float _1967 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1969 = _1954 * int(_1965);
    int _1971 = _1969 + _1914;
    float _1973 = float(_1914);
    float _1975 = float(uint(_1971));
    float _1977 = as_type<float>(_1948) * _1975;
    float _1979 = _1940 * _183;
    bool _1981 = _1973 >= _895;
    bool _1983 = isnan(_1973);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(_895);
    bool _1989 = _1985 || _1987;
    float _1991 = float(_1989);
    float _1993 = trunc(_1977);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = floor(_1979);
    int _2001 = int(_1965) + int(_1997);
    float _2003 = trunc(_1991);
    int _2005 = int(_2003);
    int _2007 = _1926 * _2001;
    int _2009 = _2007 + _1914;
    float _2011 = -_1999;
    float _2013 = _1979 + _2011;
    float _2015 = 1.0 / _657;
    bool _2017 = uint(_2009) >= uint(_853);
    bool _2019 = !_2017;
    int _2021 = _2019 ? 0 : (-1);
    int _2023 = ~_2001;
    int _2025 = _2023 + _2021;
    int _2027 = _2025 + 1;
    float _2029 = _2013 * _895;
    int _2031 = _853 * _2027;
    int _2033 = _2031 + _1914;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2037 = _2035 != 0;
    float _2039 = _903 * _2015;
    int _2041 = ~_2005;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    float _2047 = trunc(_2029);
    int _2049 = int(_2047);
    bool _2051 = !_1930;
    int _2053 = _2051 ? _2033 : (-1);
    bool _2055 = !_2037;
    int _2057 = _2055 ? 0 : 1;
    int _2059 = _853 + (-1);
    int _2061 = _2053 * _2045;
    int _2063 = abs(_2057);
    float _2065 = trunc(_2039);
    int _2067 = int(_2065);
    int _2069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2071 = _2069 != 0;
    int _2073 = _2005 * _2059;
    int _2075 = _2073 + _2061;
    int _2077 = abs(_961);
    int _2079 = _2075 * _1932;
    bool _2081 = !_2071;
    int _2083 = _2081 ? 0 : 1;
    int _2085 = abs(_995);
    int _2087 = _2049 * _2063;
    int _2089 = _2087 + _1914;
    int _2091 = abs(_2083);
    int _2093 = _2067 * _2077;
    int _2095 = _2093 + _2079;
    float _2097 = float(uint(_2089));
    bool _2099 = _183 > 0.5;
    int _2101 = _2089 * _2085;
    int _2103 = _2101 + _2095;
    float _2105 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2107 = as_type<float>(_1948) * _2097;
    int _2109 = ~_853;
    int _2111 = _2109 + 1;
    int _2113 = _2049 * _2091;
    int _2115 = _2113 + _2103;
    int _2117 = ~_853;
    int _2119 = _2117 + 1;
    float _2121 = _2105 * _183;
    float _2123 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2125 = trunc(_2107);
    float _2127 = precise::max(_2125, 0.0);
    uint _2129 = uint(_2127);
    float _2131 = float(uint(_2115));
    float _2133 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2123);
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2137 = _2135 != 0;
    float _2139 = as_type<float>(_1948) * _2131;
    float _2141 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2133);
    float _2143 = trunc(_2121);
    int _2145 = int(_2143);
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2149 = _2147 != 0;
    int _2151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2153 = _2151 != 0;
    float _2155 = -_1297;
    int _2157 = _2099 ? as_type<int>(_2155) : as_type<int>(_1297);
    bool _2159 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2161 = isnan(0.5);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2167 = _2163 || _2165;
    float _2169 = trunc(_2139);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    int _2175 = _2145 << 4;
    int _2177 = _2175 + 1968;
    int _2179 = _2177 + 8;
    uint _2181 = uint(int(uint(_2179) >> uint(2)));
    uint _2183 = uint(int(uint(int(_2181)) >> uint(2)));
    int _2185 = int(_2181) & 3;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[int(_2183)][_2185];
    int _2189 = _2119 * int(_2173);
    int _2191 = _2189 + _2115;
    float _2193 = float(uint(_2191));
    float _2195 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2197 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2199 = as_type<float>(_1948) * _2193;
    float _2201 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2195);
    uint _2203 = uint(int(uint(_2177) >> uint(2)));
    uint _2205 = uint(int(uint(int(_2203)) >> uint(2)));
    int _2207 = int(_2203) & 3;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[int(_2205)][_2207];
    int _2211 = int(_2203) + 1;
    uint _2213 = uint(int(uint(_2211) >> uint(2)));
    int _2215 = _2211 & 3;
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[int(_2213)][_2215];
    float _2219 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2201);
    float _2221 = trunc(_2199);
    float _2223 = precise::max(_2221, 0.0);
    uint _2225 = uint(_2223);
    float _2227 = _2219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2229 = !_2149;
    float _2231 = _2229 ? _1297 : as_type<float>(_2157);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2235 = _2227 + _2197;
    float _2237 = 1.0 / _2197;
    float _2239 = _2233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2241 = _2231 + 0.5;
    float _2243 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2245 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2247 = int(_2173) + int(_2225);
    float _2249 = _2245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2251 = _2111 * _2247;
    int _2253 = _2251 + _2115;
    int _2255 = _2111 * int(_2129);
    int _2257 = _2255 + _2089;
    float _2259 = _2235 * _2237;
    float _2261 = _2259 * 0.5;
    bool _2263 = uint(_2253) >= uint(_853);
    float _2265 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[80].x, _713);
    float _2267 = float(uint(_2257));
    float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2271 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2269);
    bool _2273 = !_2263;
    int _2275 = _2273 ? 0 : (-1);
    float _2277 = as_type<float>(_1948) * _2267;
    int _2279 = ~_2247;
    int _2281 = _2279 + _2275;
    int _2283 = _2281 + 1;
    float _2285 = 1.0 / _2271;
    float _2287 = -_1309;
    int _2289 = _1936 ? as_type<int>(_2287) : as_type<int>(_1309);
    float _2291 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2293 = ~_853;
    int _2295 = _2293 + 1;
    float _2297 = _2291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2299 = trunc(_2277);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _2209 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_66.x = _2297;
    out.m_66.y = _2249;
    out.m_66.z = _2239;
    out.m_66.w = _1946;
    int _2307 = int(_2129) + int(_2303);
    int _2309 = _853 * _2283;
    int _2311 = _2309 + _2115;
    float _2313 = _2305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2315 = _2217 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2317 = !_2153;
    float _2319 = _2317 ? _1309 : as_type<float>(_2289);
    float _2321 = _2187 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2323 = !_1930;
    int _2325 = _2323 ? _2311 : (-1);
    float _2327 = _2315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2329 = as_type<float>(_2115);
    float _2331 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2333 = _2285;
    float _2335 = _1869;
    float _2337 = _1892;
    float _2339 = _1894;
    float _2341 = _1813;
    if (!_2167)
    {
        _2329 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2343 = _2329;
    float _2345 = _2319 + (-0.5);
    int _2347 = _2325 >> 31;
    float _2349 = _2321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2351 = _2295 * _2307;
    int _2353 = _2351 + _2089;
    float _2355 = _2343;
    if (!_2167)
    {
        float _2357 = -_2343;
        float _2359 = _2357 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2331 = _2359;
    }
    float _2361 = _2331;
    int _2363 = _2347 & 3;
    float _2365 = -_2345;
    float _2367 = -_897;
    float _2369 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2367);
    out.m_68.x = _2313;
    out.m_68.y = _2327;
    out.m_68.z = _2349;
    float _2371 = _2345;
    if (!_2167)
    {
        float _2373 = 1.0 / _2361;
        _2371 = _2373;
    }
    float _2375 = _2371;
    int _2377 = _2325 + _2363;
    float _2379 = -_875;
    float _2381 = _2379 + 1.0;
    bool _2383 = uint(_2353) >= uint(_853);
    if (!_2167)
    {
        float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2387 = -_2343;
        float _2389 = fma(_2285, _2385, _2387);
        _2355 = _2389;
    }
    float _2391 = _2355;
    int _2393 = _2377 >> 2;
    float _2395 = -_2381;
    float _2397 = fma(_2231, _2395, _2265);
    float _2399 = fma(_2319, _1922, _2369);
    bool _2401 = !_2383;
    int _2403 = _2401 ? 0 : (-1);
    float _2405 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2407 = _2393 << 4;
    int _2409 = _2407 + 368;
    float _2411 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2413 = as_type<float>(_2393);
    if (_2167)
    {
        _2413 = 1.0;
    }
    float _2415 = _2413;
    out.m_70.x = _2397;
    out.m_70.y = _2399;
    uint _2417 = uint(int(uint(_2409) >> uint(2)));
    uint _2419 = uint(int(uint(int(_2417)) >> uint(2)));
    int _2421 = int(_2417) & 3;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[int(_2419)][_2421];
    int _2425 = int(_2417) + 1;
    uint _2427 = uint(int(uint(_2425) >> uint(2)));
    int _2429 = _2425 & 3;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[int(_2427)][_2429];
    float _2433 = -_1345;
    float _2435 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2411);
    float _2437 = _2415;
    if (!_2167)
    {
        float _2439 = _2391 * _2375;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        _2437 = _2441;
    }
    float _2443 = _2437;
    int _2445 = ~_2307;
    int _2447 = _2445 + _2403;
    int _2449 = _2447 + 1;
    float _2451 = -_1345;
    float _2453 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2405);
    int _2455 = _2325 & 3;
    bool _2457 = _2455 != 0;
    float _2459 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2461 = _2325 & 3;
    bool _2463 = _2461 != 0;
    int _2465 = _2409 + 8;
    uint _2467 = uint(int(uint(_2465) >> uint(2)));
    uint _2469 = uint(int(uint(int(_2467)) >> uint(2)));
    int _2471 = int(_2467) & 3;
    float _2473 = (*spvDescriptorSet0.vp_c9)._m0[int(_2469)][_2471];
    int _2475 = int(_2467) + 1;
    uint _2477 = uint(int(uint(_2475) >> uint(2)));
    int _2479 = _2475 & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    int _2483 = _853 * _2449;
    int _2485 = _2483 + _2089;
    float _2487 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2489 = uint(_2455) > 1u;
    float _2491 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2493 = _2455 != 3;
    float _2495 = -_1345;
    float _2497 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2487);
    float _2499 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2501 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2503 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2491);
    float _2505 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2507 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2499);
    float _2509 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2501);
    int _2511 = _2463 ? 0 : 1;
    float _2513 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2515 = uint(_2455) >= 2u;
    float _2517 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2519 = ~_2511;
    int _2521 = _2519 + 1;
    int _2523 = _2521 + 1;
    float _2525 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2505);
    int _2527 = _2523;
    if (!_2489)
    {
        int _2529 = ~_2511;
        int _2531 = _2529 + 1;
        _2527 = _2531;
    }
    int _2533 = _2527;
    float _2535 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2513);
    int _2537 = _2515 ? 0 : 1;
    float _2539 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2517);
    bool _2541 = !_2457;
    int _2543 = _2541 ? 0 : 1;
    float _2545 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2507);
    int _2547 = abs(_2533);
    float _2549 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2503);
    int _2551 = ~_2537;
    int _2553 = _2551 + 1;
    int _2555 = _2553 + 1;
    float _2557 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2509);
    int _2559 = _2555;
    float _2561 = _2557;
    if (_2493)
    {
        int _2563 = ~_2537;
        int _2565 = _2563 + 1;
        _2559 = _2565;
    }
    int _2567 = _2559;
    float _2569 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2525);
    bool _2571 = _2455 != 3;
    float _2573 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2435);
    int _2575 = abs(_2543);
    float _2577 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2497);
    int _2579 = ~_2547;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    float _2585 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2453);
    int _2587 = abs(_2567);
    float _2589 = _2459 * _2573;
    bool _2591 = !_2571;
    int _2593 = _2591 ? 0 : (-1);
    int _2595 = _2583 * as_type<int>(_2431);
    int _2597 = ~_2575;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    float _2603 = fma(_2243, _2545, _2589);
    float _2605 = _1967 * _1887;
    int _2607 = abs(_2593);
    int _2609 = _2601 * as_type<int>(_2423);
    int _2611 = _2609 + _2595;
    bool _2613 = !_2137;
    int _2615 = _2613 ? 0 : 1;
    float _2617 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2619 = ~_2587;
    int _2621 = _2619 + 1;
    int _2623 = _2621 + 1;
    float _2625 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2617);
    int _2627 = abs(_2615);
    int _2629 = _2623 * as_type<int>(_2473);
    int _2631 = _2629 + _2611;
    int _2633 = ~_2607;
    int _2635 = _2633 + 1;
    int _2637 = _2635 + 1;
    float _2639 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2625);
    float _2641 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2535);
    bool _2643 = !_1930;
    int _2645 = _2643 ? _2485 : (-1);
    int _2647 = _2637 * as_type<int>(_2481);
    int _2649 = _2647 + _2631;
    int _2651 = ~_2627;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    float _2657 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2539);
    float _2659 = _1908 * _2605;
    int _2661 = _2649 * _2655;
    float _2663 = _2459 * _2577;
    float _2665 = _2459 * _2585;
    float _2667 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2639);
    int _2669 = _2645 * _2627;
    int _2671 = _2669 + _2661;
    float _2673 = fma(_2243, _2549, _2663);
    float _2675 = fma(_2243, _2557, _2665);
    float _2677 = _2603;
    float _2679 = _2667;
    if (!_2167)
    {
        _2561 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2681 = _2561;
    float _2683 = _1898 * _2605;
    float _2685 = float(_2671);
    float _2687 = _2569 + _2603;
    float _2689 = _2685;
    if (!_2167)
    {
        float _2691 = -_2681;
        float _2693 = _2691 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2677 = _2693;
    }
    float _2695 = _2677;
    float _2697 = _2667 + _1813;
    float _2699 = fma(_1904, _2683, _1892);
    float _2701 = _2641 + _2673;
    out.gl_Position.x = _1857;
    out.gl_Position.y = _1869;
    out.gl_Position.z = _2667;
    out.gl_Position.w = _1813;
    float _2703 = _2697 * 0.5;
    float _2705 = _2695;
    if (!_2167)
    {
        float _2707 = 1.0 / _2695;
        _2705 = _2707;
    }
    float _2709 = _2705;
    float _2711 = _2657 + _2675;
    float _2713 = fma(_1906, _2683, _1894);
    float _2715 = fma(_1898, _2659, _1896);
    out.m_72.z = _2703;
    out.m_72.w = _1813;
    if (!_2167)
    {
        float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2719 = -_2681;
        float _2721 = fma(_2285, _2717, _2719);
        _2333 = _2721;
    }
    float _2723 = _2333;
    bool _2725 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2727 = isnan(_1621);
    bool _2729 = _2725 || _2727;
    bool _2731 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2733 = _2729 || _2731;
    out.m_74.x = _2687;
    out.m_74.y = _2701;
    out.m_74.z = _2711;
    float _2735 = -_1967;
    float _2737 = _2735 + 1.0;
    float _2739 = _2723;
    if (_2167)
    {
        _2335 = 1.0;
    }
    float _2741 = _2335;
    out.m_76.x = _2685;
    float _2743 = _1898 * _2737;
    float _2745 = _2741;
    if (!_2167)
    {
        float _2747 = _2723 * _2709;
        float _2749 = precise::clamp(_2747, 0.0, 1.0);
        _2739 = _2749;
    }
    float _2751 = _2739;
    if (!_2733)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2753 = _2337;
    out.m_78.x = _2699;
    out.m_78.y = _2713;
    out.m_78.z = _2715;
    out.m_78.w = _2743;
    float _2755 = _2753;
    float _2757 = _2753;
    if (!_2167)
    {
        float _2759 = -_2751;
        float _2761 = _2759 + 1.0;
        _2745 = _2761;
    }
    float _2763 = _2745;
    if (!_2733)
    {
        _2339 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2765 = _2339;
    float _2767 = _2765;
    float _2769 = _2765;
    if (!_2733)
    {
        _2689 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2771 = _2689;
    float _2773 = _2443 * _2763;
    float _2775 = _2773;
    float _2777 = _2771;
    float _2779 = _2771;
    if (!_2733)
    {
        _2341 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2781 = _2341;
    float _2783 = _2781;
    float _2785 = _2781;
    if (!_2733)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2787 = _2679;
    float _2789 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2791 = _2787;
    float _2793 = _2787;
    if (!_2733)
    {
        _2775 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2795 = _2775;
    bool _2797 = !_2733;
    float _2799 = _2795;
    float _2801 = _2795;
    if (!_2797)
    {
        bool _2803 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2805 = isnan(_1621);
        bool _2807 = _2803 || _2805;
        bool _2809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2811 = _2807 || _2809;
        if (!_2811)
        {
            float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2815 = _1621 + _2813;
            float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2819 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2817;
            float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2825 = 1.0 / _2819;
            float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2829 = _2827 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2831 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2833 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2843 = _2815 * _2825;
            float _2845 = precise::clamp(_2843, 0.0, 1.0);
            float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2851 = fma(_2845, _2823, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2853 = fma(_2845, _2849, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2855 = fma(_2845, _2829, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2857 = fma(_2845, _2833, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2859 = fma(_2845, _2837, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2861 = fma(_2845, _2841, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2769 = _2851;
            _2793 = _2859;
            _2757 = _2855;
            _2785 = _2857;
            _2779 = _2853;
            _2801 = _2861;
            _2863 = true;
        }
        else
        {
            bool _2865 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2867 = isnan(_1621);
            bool _2869 = _2865 || _2867;
            bool _2871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2873 = _2869 || _2871;
            if (!_2873)
            {
                _2755 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2875 = _2755;
            _2757 = _2875;
            if (!_2873)
            {
                _2767 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2877 = _2767;
            _2769 = _2877;
            if (!_2873)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2879 = _2777;
            _2779 = _2879;
            if (!_2873)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2881 = _2783;
            _2785 = _2881;
            if (!_2873)
            {
                _2791 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2883 = _2791;
            _2793 = _2883;
            if (!_2873)
            {
                _2799 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2885 = _2799;
            bool _2887 = !_2873;
            _2801 = _2885;
            if (!_2887)
            {
                bool _2889 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2891 = isnan(_1621);
                bool _2893 = _2889 || _2891;
                bool _2895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2897 = _2893 || _2895;
                if (!_2897)
                {
                    float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2901 = _1621 + _2899;
                    float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2905 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2903;
                    float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2911 = 1.0 / _2905;
                    float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2919 = _2917 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2929 = _2901 * _2911;
                    float _2931 = precise::clamp(_2929, 0.0, 1.0);
                    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2937 = fma(_2931, _2909, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2939 = fma(_2931, _2935, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2941 = fma(_2931, _2915, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2943 = fma(_2931, _2919, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2945 = fma(_2931, _2923, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2947 = fma(_2931, _2927, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2769 = _2937;
                    _2793 = _2945;
                    _2757 = _2941;
                    _2785 = _2943;
                    _2779 = _2939;
                    _2801 = _2947;
                    _2863 = true;
                }
                else
                {
                    _2769 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2793 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2757 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2801 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2863 = false;
    float _2949 = _2769;
    float _2951 = _2793;
    float _2953 = _2757;
    float _2955 = _2785;
    float _2957 = _2779;
    float _2959 = _2801;
    float _2961 = fma(_2701, -0.5, 0.5);
    float _2963 = precise::clamp(_2961, 0.0, 1.0);
    float _2965 = -_2949;
    float _2967 = _2965 + _2951;
    float _2969 = -_2953;
    float _2971 = _2969 + _2955;
    out.m_80.x = 0.0;
    float _2973 = -_2957;
    float _2975 = _2973 + _2959;
    float _2977 = fma(_2963, _2967, _2949);
    float _2979 = fma(_2963, _2971, _2953);
    bool _2981 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2983 = _2977 * 0.586610972881317138671875;
    float _2985 = fma(_2963, _2975, _2957);
    float _2987 = _2789 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2989 = fma(_2979, 0.298911988735198974609375, _2983);
    bool _2991 = _2443 > 0.0;
    bool _2993 = isnan(_2443);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan(0.0);
    bool _2999 = _2995 || _2997;
    float _3001 = fma(_2985, 0.114477999508380889892578125, _2989);
    out.m_47.x = _2987;
    bool _3003 = _2763 <= 0.0;
    bool _3005 = !_2999;
    bool _3007 = _3003 || _3005;
    float _3009 = -_3001;
    float _3011 = _2977 + _3009;
    float _3013 = -_3001;
    float _3015 = _2979 + _3013;
    float _3017 = fma(_3011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3001);
    float _3019 = -_3001;
    float _3021 = _2985 + _3019;
    float _3023 = fma(_3015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3001);
    float _3025 = fma(_3021, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3001);
    bool _3027 = !_2981;
    if (!_3027)
    {
        float _3029 = -_1585;
        float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3033 = -_1587;
        float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3037 = -_1589;
        float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3041 = _3031 * _3031;
        float _3043 = fma(_3035, _3035, _3041);
        float _3045 = fma(_3039, _3039, _3043);
        float _3047 = sqrt(_3045);
        float _3049 = rsqrt(_3045);
        float _3051 = -_3047;
        float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3055 = _3053 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3057 = precise::clamp(_3055, 0.0, 1.0);
        float _3059 = _3035 * _3049;
        float _3061 = _3031 * _3049;
        float _3063 = abs(_3057);
        float _3065 = log2(_3063);
        float _3067 = _3039 * _3049;
        float _3069 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3071 = _2701 * _3061;
        float _3073 = -_3061;
        float _3075 = -_3069;
        float _3077 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3075);
        float _3079 = fma(_2687, _3059, _3071);
        float _3081 = -_3067;
        float _3083 = fma(_3081, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3077);
        float _3085 = fma(_2711, _3067, _3079);
        float _3087 = precise::clamp(_3085, 0.0, 1.0);
        float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3091 = _3083 + _3089;
        float _3093 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3095 = _3091 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3097 = precise::clamp(_3095, 0.0, 1.0);
        float _3099 = exp2(_3093);
        float _3101 = _3099 * _3097;
        float _3103 = _3087 * _3101;
        float _3105 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3107 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3109 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_80.x = _3105;
        out.m_80.y = _3107;
        out.m_80.z = _3109;
    }
    out.m_82.x = _3023;
    out.m_82.y = _3017;
    out.m_82.z = _3025;
    if (!_3007)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3111 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3111;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2863 = false;
    bool _647 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3168 = as_type<float>(_117);
        out.gl_Position.z = _3168;
    }
    if (!_105)
    {
        return out;
    }
    float _121 = in.m_49.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _137 = _141;
    }
    float _143 = _137;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3237 = as_type<float>(_155);
        out.gl_Position.z = _3237;
    }
    if (_149)
    {
        return out;
    }
    float _157 = in.m_51.x;
    float _159 = in.m_51.y;
    float _161 = in.m_51.z;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _167 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = in.m_53.x;
    float _171 = in.m_53.y;
    float _173 = in.m_53.z;
    float _175 = in.m_55.x;
    float _177 = in.m_55.y;
    float _179 = in.m_55.z;
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _183 = in.m_57.x;
    float _185 = _165 * _163;
    float _187 = _157 * _157;
    float _189 = _159 * _159;
    float _191 = _161 * _161;
    float _193 = fma(_169, _169, _187);
    float _195 = fma(_171, _171, _189);
    float _197 = fma(_173, _173, _191);
    float _199 = fma(_175, _175, _193);
    float _201 = fma(_177, _177, _195);
    float _203 = fma(_179, _179, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[20].x, _185);
    float _209 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    bool _211 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _215 = _211 || _213;
    bool _217 = isnan(1.0);
    bool _219 = _215 || _217;
    float _221 = _209 * _181;
    float _223 = sqrt(_201);
    float _225 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[20].y, _221);
    bool _227 = _205 > 0.0;
    float _229 = floor(_207);
    float _231 = 0.0;
    float _233 = _201;
    float _235 = _181;
    float _237 = _199;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _241 = _167;
    if (!_219)
    {
        float _243 = _167 * _167;
        float _245 = _243 * 0.5;
        _231 = _245;
    }
    float _247 = _231;
    float _249 = _247;
    if (!_219)
    {
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _251;
    }
    float _253 = _249;
    bool _255 = _223 > 0.0;
    float _257 = sqrt(_203);
    int _259 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _261 = _259 != 0;
    float _263 = floor(_225);
    float _265 = 0.0;
    float _267 = _253;
    float _269 = 1.4012984643248170709237295832899e-45;
    if (_227)
    {
        float _271 = rsqrt(_199);
        _265 = _271;
    }
    float _273 = _265;
    bool _275 = _257 > 0.0;
    float _277 = _257;
    if (!_219)
    {
        _277 = _167;
    }
    float _279 = _277;
    float _281 = 0.0;
    float _283 = _279;
    if (_255)
    {
        float _285 = rsqrt(_201);
        _281 = _285;
    }
    float _287 = _281;
    bool _289 = !_219;
    if (!_289)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = _167 * _293;
        float _303 = 1.0 / _297;
        float _305 = _299 * 0.693147182464599609375;
        float _307 = exp2(_301);
        float _309 = 1.0 / _305;
        float _311 = _307 + (-1.0);
        float _313 = -_311;
        float _315 = fma(_313, _309, _167);
        float _317 = _315 * _303;
        float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _307;
        _267 = _319;
        _235 = _317;
        _269 = _303;
        _237 = _309;
    }
    float _321 = _233;
    float _323 = _267;
    float _325 = _235;
    float _327 = _269;
    float _329 = _237;
    bool _331 = !_219;
    float _333 = _325;
    float _335 = _321;
    float _337 = _327;
    float _339 = _329;
    if (!_331)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _167 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _333 = _349;
        _335 = _351;
        _239 = _347;
        _283 = _359;
    }
    float _361 = _333;
    float _363 = _335;
    float _365 = _239;
    float _367 = _283;
    float _369 = -_229;
    float _371 = _207 + _369;
    float _373 = _207 * 6.283185482025146484375;
    float _375 = 0.0;
    float _377 = _361;
    float _379 = _365;
    float _381 = _363;
    if (_275)
    {
        float _383 = rsqrt(_203);
        _375 = _383;
    }
    float _385 = _375;
    float _387 = -_263;
    float _389 = _225 + _387;
    float _391 = _225 * 6.283185482025146484375;
    float _393 = _373 * 0.15915493667125701904296875;
    if (!_227)
    {
        _241 = 0.0;
    }
    float _395 = _241;
    float _397 = _395;
    if (_227)
    {
        float _399 = _273 * _169;
        _397 = _399;
    }
    float _401 = _397;
    float _403 = _391 * 0.15915493667125701904296875;
    if (!_227)
    {
        _377 = 0.0;
    }
    float _405 = _377;
    float _407 = _405;
    if (_227)
    {
        float _409 = _273 * _157;
        _407 = _409;
    }
    float _411 = _407;
    float _413 = _393 * 6.283185482025146484375;
    float _415 = cos(_413);
    if (!_227)
    {
        _379 = 0.0;
    }
    float _417 = _379;
    float _419 = _417;
    if (_227)
    {
        float _421 = _273 * _175;
        _419 = _421;
    }
    float _423 = _419;
    float _425 = 0.0;
    if (!_275)
    {
        _425 = 0.0;
    }
    float _427 = _425;
    float _429 = in.m_49.x;
    float _431 = in.m_49.y;
    float _433 = in.m_49.z;
    float _435 = _427;
    if (!_275)
    {
        _381 = 0.0;
    }
    float _437 = _381;
    float _439 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = 0.0;
    float _443 = _437;
    if (!_275)
    {
        _441 = 0.0;
    }
    float _445 = _441;
    float _447 = _403 * 6.283185482025146484375;
    float _449 = cos(_447);
    float _451 = _445;
    if (_275)
    {
        float _453 = _385 * _173;
        _435 = _453;
    }
    float _455 = _435;
    if (_275)
    {
        float _457 = _385 * _161;
        _443 = _457;
    }
    float _459 = _443;
    if (_275)
    {
        float _461 = _385 * _179;
        _451 = _461;
    }
    float _463 = _451;
    float _465 = 0.0;
    if (!_255)
    {
        _465 = 0.0;
    }
    float _467 = _465;
    float _469 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _471 = _467;
    if (!_255)
    {
        _337 = 0.0;
    }
    float _473 = _337;
    float _475 = _473;
    if (_255)
    {
        float _477 = _287 * _171;
        _471 = _477;
    }
    float _479 = _471;
    if (!_255)
    {
        _339 = 0.0;
    }
    float _481 = _339;
    float _483 = _481;
    if (_255)
    {
        float _485 = _287 * _159;
        _475 = _485;
    }
    float _487 = _475;
    if (_255)
    {
        float _489 = _287 * _177;
        _483 = _489;
    }
    float _491 = _483;
    float _493 = fma(_415, 0.5, 0.5);
    bool _495 = _371 < 0.5;
    float _497 = float(_495);
    float _499 = _469 * _411;
    float _501 = _469 * _459;
    float _503 = -_371;
    float _505 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _507 = -_493;
    float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _511 = -_497;
    float _513 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _515 = _469 * _487;
    float _517 = fma(_439, _401, _499);
    float _519 = in.m_59.w;
    bool _521 = _389 < 0.5;
    float _523 = float(_521);
    float _525 = fma(_449, 0.5, 0.5);
    float _527 = in.m_44.x;
    float _529 = in.m_44.y;
    float _531 = in.m_44.z;
    float _533 = -_389;
    float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _537 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _539 = -_523;
    float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _543 = -_525;
    float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _547 = fma(_439, _479, _515);
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _551 = _549 != 0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _555 = _553 != 0;
    float _557 = fma(_439, _455, _501);
    float _559 = fma(_537, _423, _517);
    float _561 = fma(_537, _491, _547);
    bool _563 = !_261;
    int _565 = _563 ? 0 : 1;
    float _567 = fma(_537, _463, _557);
    bool _569 = !_551;
    int _571 = _569 ? 0 : 1;
    float _573 = fma(_367, _429, _559);
    int _575 = abs(_565);
    float _577 = fma(_367, _431, _561);
    int _579 = abs(_571);
    bool _581 = !_555;
    int _583 = _581 ? 0 : 1;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _587 = abs(_583);
    float _589 = fma(_367, _433, _567);
    float _591 = float(_579);
    float _593 = fma(_573, _519, _527);
    float _595 = float(_575);
    float _597 = fma(_577, _519, _529);
    float _599 = abs(_505);
    float _601 = _591 * _599;
    float _603 = abs(_535);
    float _605 = _591 * _603;
    float _607 = fma(_589, _519, _531);
    float _609 = float(_587);
    float _611 = fma(_595, _509, _601);
    float _613 = fma(_595, _545, _605);
    float _615 = abs(_513);
    float _617 = fma(_609, _615, _611);
    float _619 = abs(_541);
    float _621 = fma(_609, _619, _613);
    bool _623 = !_585;
    float _625 = _593;
    float _643;
    float _645;
    if (!_623)
    {
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _629 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _631 = float(_101);
        float _633 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _635 = _633 * _627;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = _631;
        _647 = true;
    }
    else
    {
        float _649 = float(_101);
        float _651 = 1.0 / _649;
        float _653 = _135 * _651;
        _643 = _653;
        _645 = _649;
    }
    _647 = false;
    float _655 = _643;
    float _657 = _645;
    float _659 = in.m_57.y;
    float _661 = _183 * 2.0;
    float _663 = in.m_57.z;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _673;
    float _677 = 1.0 / _667;
    float _679 = _183 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _683 = _655 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _687 = _655 + _685;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _691 = 1.0 / _675;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _695 = -_689;
    float _697 = fma(_679, 2.0, _695);
    bool _699 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _707 = _703 || _705;
    float _709 = _659 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _711 = -_135;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[76].x, _697);
    float _715 = 1.0 / _671;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _717;
    float _721 = _663 * 2.0;
    bool _723 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _725 = isnan(_655);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _737 = log2(_735);
    float _739 = fma(_709, -2.0, _693);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _743 = _655 + _741;
    float _745 = _659 * 2.0;
    float _747 = _683 * _691;
    float _749 = _659 + _663;
    float _751 = _743 * _677;
    float _753 = _183 + _659;
    float _755 = floor(_661);
    float _757 = _749 + (-1.0);
    float _759 = _753 + (-1.0);
    float _761 = _687 * _715;
    float _763 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _765 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _767 = floor(_721);
    float _769 = _737 * _135;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _771;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _779 = fma(_719, _751, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _783 = 1.0 + _781;
    float _785 = floor(_745);
    bool _787 = _755 > 0.0;
    float _789 = fma(_773, _751, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _791 = _755 >= 0.0;
    bool _793 = isnan(_755);
    bool _795 = _791 || _793;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    float _801 = _183 + _663;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = fma(_777, _761, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _809 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _811 = int(_809);
    float _813 = _801 + (-1.0);
    bool _815 = _767 > 0.0;
    float _817 = fma(_805, _761, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _819 = _767 >= 0.0;
    bool _821 = isnan(_767);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _833 = exp2(_769);
    bool _835 = _785 > 0.0;
    float _837 = _663 + (-0.5);
    bool _839 = _785 >= 0.0;
    bool _841 = isnan(_785);
    bool _843 = _839 || _841;
    bool _845 = isnan(0.0);
    bool _847 = _843 || _845;
    float _849 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[78].z, _831);
    float _851 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _853 = int(_851);
    float _855 = float(_811);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _861;
    float _865 = fma(_859, _747, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _867 = -_833;
    float _869 = _867 + 1.0;
    float _871 = 1.0 / _855;
    float _873 = fma(_863, _747, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _875 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _849);
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _879 = _707 ? _869 : 0.0;
    bool _881 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _883 = isnan(1.0);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _889 = _885 || _887;
    float _891 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[78].w, _877);
    float _893 = 1.0 / _783;
    float _895 = float(_853);
    float _897 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _739);
    float _899 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    int _901 = _799 ? 0 : 1;
    float _903 = _895 * _135;
    int _905 = _847 ? 0 : 1;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _909 = _871 * _135;
    int _911 = ~_901;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    int _917 = _827 ? 0 : 1;
    int _919 = _915;
    if (!_787)
    {
        int _921 = ~_901;
        int _923 = _921 + 1;
        _919 = _923;
    }
    int _925 = _919;
    if (_889)
    {
        float _927 = _879 * _893;
        _139 = _927;
    }
    float _929 = _139;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _933 = _931 != 0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _941 = _939 != 0;
    int _943 = ~_905;
    int _945 = _943 + 1;
    int _947 = _945 + 1;
    int _949 = _947;
    if (!_835)
    {
        int _951 = ~_905;
        int _953 = _951 + 1;
        _949 = _953;
    }
    int _955 = _949;
    float _957 = _929 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _959 = !_933;
    int _961 = _959 ? 0 : 1;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _973 = _971 != 0;
    float _975 = _957 * _907;
    bool _977 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _979 = isnan(_655);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    bool _989 = !_937;
    int _991 = _989 ? 0 : 1;
    bool _993 = !_941;
    int _995 = _993 ? 0 : 1;
    float _997 = -_987;
    float _999 = _997 + 1.0;
    bool _1001 = !_973;
    int _1003 = _1001 ? 0 : 1;
    int _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1007 = _1005 != 0;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1015 = _1013 != 0;
    bool _1017 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1019 = isnan(_655);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    int _1029 = ~_917;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    bool _1035 = !_1007;
    int _1037 = _1035 ? 0 : 1;
    float _1039 = _1027 * _999;
    int _1041 = _1033;
    if (!_815)
    {
        int _1043 = ~_917;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    float _1049 = -_1027;
    float _1051 = _1049 + 1.0;
    bool _1053 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1055 = isnan(_655);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = in.m_61.x;
    float _1067 = in.m_61.y;
    float _1069 = in.m_61.z;
    int _1071 = abs(_1037);
    float _1073 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[203].z, _975);
    bool _1075 = !_1015;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = _733 * _1051;
    bool _1081 = !_1011;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = _1073 + 0.25;
    int _1087 = abs(_1077);
    float _1089 = floor(_1073);
    float _1091 = float(_1047);
    float _1093 = -_733;
    float _1095 = _1093 + 1.0;
    float _1097 = float(_1071);
    float _1099 = float(_955);
    float _1101 = _1063 * _1095;
    float _1103 = float(_1087);
    float _1105 = floor(_1085);
    int _1107 = abs(_1083);
    float _1109 = _1097 * _1091;
    float _1111 = float(_925);
    float _1113 = _1103 * _1099;
    float _1115 = float(_1107);
    float _1117 = _1109 * (-2.0);
    float _1119 = _789 * _1101;
    float _1121 = _779 * _1101;
    float _1123 = -_1089;
    float _1125 = _1073 + _1123;
    float _1127 = _1115 * _1111;
    float _1129 = fma(_1117, _1065, _1065);
    bool _1131 = !_969;
    int _1133 = _1131 ? 0 : 1;
    float _1135 = _1127 * (-2.0);
    bool _1137 = _1125 >= 0.5;
    bool _1139 = isnan(_1125);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan(0.5);
    bool _1145 = _1141 || _1143;
    float _1147 = -_1105;
    float _1149 = _1085 + _1147;
    float _1151 = _1073 * 6.283185482025146484375;
    int _1153 = abs(_1133);
    float _1155 = fma(_1135, _1067, _1067);
    float _1157 = fma(_765, _1117, _765);
    float _1159 = _1151 * 0.15915493667125701904296875;
    float _1161 = _183 + (-0.5);
    bool _1163 = _1149 > 0.5;
    float _1165 = fma(_763, _1135, _763);
    bool _1167 = !_965;
    int _1169 = _1167 ? 0 : 1;
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1129);
    float _1173 = _1159 * 6.283185482025146484375;
    float _1175 = sin(_1173);
    float _1177 = _659 + (-0.5);
    bool _1179 = !_1145;
    float _1181 = _1179 ? 0.5 : (-0.5);
    float _1183 = fma(_1157, _929, _1171);
    int _1185 = abs(_1169);
    float _1187 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1155);
    float _1189 = float(_1153);
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1193 = _1191 * 2.0;
    float _1195 = _1149;
    if (_1163)
    {
        float _1197 = -_1149;
        float _1199 = _1197 + 1.0;
        _1195 = _1199;
    }
    float _1201 = _1195;
    int _1203 = abs(_1003);
    float _1205 = _1189 * _1193;
    float _1207 = float(_1185);
    float _1209 = fma(_1201, 4.0, -1.0);
    float _1211 = as_type<float>(int(gl_VertexIndex));
    float _1213 = fma(_1165, _929, _1187);
    float _1215 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1217 = _1183 * 0.15915493667125701904296875;
    float _1219 = _1213 * 0.15915493667125701904296875;
    float _1221 = fma(_1207, _1215, _1205);
    float _1223 = float(_1203);
    float _1225 = in.m_59.x;
    float _1227 = in.m_59.y;
    float _1229 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1231 = -_1063;
    float _1233 = _1231 + 1.0;
    float _1235 = _1217 * 6.283185482025146484375;
    float _1237 = sin(_1235);
    float _1239 = fma(_1223, _1229, _1221);
    float _1241 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1121);
    float _1243 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1119);
    float _1245 = fma(_1239, 3.1415927410125732421875, _1069);
    float _1247 = _1113 * (-2.0);
    float _1249 = fma(_817, _1079, _1241);
    float _1251 = fma(_807, _1079, _1243);
    float _1253 = _1217 * 6.283185482025146484375;
    float _1255 = cos(_1253);
    float _1257 = fma(_1245, _1247, _1245);
    float _1259 = fma(_873, _1039, _1249);
    float _1261 = fma(_829, _1247, _829);
    float _1263 = fma(_865, _1039, _1251);
    float _1265 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1257);
    float _1267 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1259);
    int _1269 = as_type<int>(_1211) & 1;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>(_1211) & 2;
    bool _1275 = _1273 != 0;
    float _1277 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1263);
    float _1279 = fma(_1261, _929, _1265);
    float _1281 = _1219 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = _1267 * _1227;
    float _1287 = _1277 * _1225;
    float _1289 = _1279 * 0.15915493667125701904296875;
    float _1291 = _597 * _177;
    float _1293 = _621 * _1285;
    bool _1295 = !_1271;
    float _1297 = _1295 ? (-0.5) : 0.5;
    float _1299 = _617 * _1287;
    float _1301 = _1219 * 6.283185482025146484375;
    float _1303 = cos(_1301);
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1307 = !_1275;
    float _1309 = _1307 ? (-0.5) : 0.5;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1297);
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1315 = fma(_593, _175, _1291);
    bool _1317 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1319 = isnan(0.5);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1325 = _1321 || _1323;
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1309);
    float _1329 = _1289 * 6.283185482025146484375;
    float _1331 = cos(_1329);
    float _1333 = _1313 * _1311;
    float _1335 = _1237 * _1283;
    float _1337 = _1305 * _1327;
    float _1339 = _1255 * _1283;
    float _1341 = fma(_607, _179, _1315);
    float _1343 = _1289 * 6.283185482025146484375;
    float _1345 = sin(_1343);
    float _1347 = _1255 * _1303;
    float _1349 = _1237 * _1303;
    float _1351 = _1255 * _1331;
    float _1353 = _1303 * _1331;
    float _1355 = _1237 * _1331;
    float _1357 = _1283 * _1331;
    float _1359 = _1351 * _1337;
    float _1361 = in.m_55.w;
    float _1363 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1365 = fma(_1345, _1347, _1335);
    float _1367 = -_1337;
    float _1369 = _1345 * _1367;
    float _1371 = in.m_53.w;
    float _1373 = -_1349;
    float _1375 = fma(_1345, _1339, _1373);
    float _1377 = fma(_1365, _1333, _1359);
    float _1379 = fma(_1353, _1333, _1369);
    float _1381 = -_1339;
    float _1383 = fma(_1345, _1349, _1381);
    float _1385 = _1355 * _1337;
    float _1387 = fma(_1375, _1363, _1377);
    float _1389 = fma(_1345, _1335, _1347);
    float _1391 = fma(_1357, _1363, _1379);
    float _1393 = fma(_1383, _1333, _1385);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1397 = _597 * _171;
    float _1399 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = fma(_1389, _1363, _1393);
    float _1403 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1395);
    float _1405 = fma(_593, _169, _1397);
    float _1407 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1409 = _597 * _159;
    float _1411 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1403);
    float _1413 = fma(_607, _173, _1405);
    float _1415 = _1341 + _1361;
    float _1417 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1407);
    float _1419 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1421 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1423 = _1413 + _1371;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1427 = _1415 + _1419;
    float _1429 = in.m_51.w;
    float _1431 = fma(_593, _157, _1409);
    float _1433 = _1423 + _1425;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1437 = _1427 + _1435;
    float _1439 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1421);
    float _1441 = fma(_607, _161, _1431);
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1445 = _1433 + _1443;
    float _1447 = _1437 * _1437;
    float _1449 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1439);
    float _1451 = fma(_1445, _1445, _1447);
    float _1453 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1455 = sqrt(_1451);
    float _1457 = _1441 + _1429;
    float _1459 = _1457 + _1453;
    bool _1461 = _1455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1463 = _1441;
    float _1465 = _1449;
    float _1467 = _1451;
    float _1469 = _1433;
    if (!_1461)
    {
        _1463 = _1433;
    }
    float _1471 = _1463;
    float _1473 = _1471;
    if (!_1461)
    {
        _1465 = _1427;
    }
    float _1475 = _1465;
    float _1477 = _1475;
    if (!_1461)
    {
        _625 = _1459;
    }
    float _1479 = _625;
    bool _1481 = !_1461;
    float _1483 = _1479;
    if (!_1481)
    {
        float _1485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1489 = _1455 + _1487;
        float _1491 = rsqrt(_1451);
        float _1493 = _1489 * _1485;
        float _1495 = _1459 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1497 = _1493 * 0.15915493667125701904296875;
        float _1499 = _1497 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1497 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = _1501 + (-1.0);
        float _1509 = fma(_1505, _1495, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1511 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1513 = _1491 * _1509;
        float _1515 = fma(_1459, _1501, _1511);
        float _1517 = fma(_1445, _1513, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1519 = fma(_1437, _1513, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1483 = _1515;
        _1473 = _1517;
        _1477 = _1519;
        _1467 = _1491;
    }
    float _1521 = _1483;
    float _1523 = _1473;
    float _1525 = _1477;
    float _1527 = _1467;
    float _1529 = _1521;
    float _1531 = _1523;
    float _1533 = _1525;
    if (!_1325)
    {
        float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1537 = _1457 + _1535;
        float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1541 = _1423 + _1539;
        float _1543 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1545 = -_1457;
        float _1547 = _1545 + _1521;
        float _1549 = _1537 * _1537;
        float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1553 = _1415 + _1551;
        float _1555 = fma(_1541, _1541, _1549);
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1559 = fma(_1553, _1553, _1555);
        float _1561 = sqrt(_1559);
        float _1563 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1565 = -_1423;
        float _1567 = _1565 + _1523;
        float _1569 = precise::min(_1561, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1571 = _1569 * _1557;
        float _1573 = _1563 * _1571;
        float _1575 = -_1415;
        float _1577 = _1575 + _1525;
        float _1579 = fma(_1567, _1573, _1423);
        float _1581 = fma(_1547, _1573, _1457);
        float _1583 = fma(_1577, _1573, _1415);
        _1529 = _1581;
        _1531 = _1579;
        _1533 = _1583;
    }
    float _1585 = _1529;
    float _1587 = _1531;
    float _1589 = _1533;
    float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1593 = _1585 + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1597 = _1587 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1601 = _1589 + _1599;
    float _1603 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1605 = _1593 * _1593;
    float _1607 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1603);
    float _1611 = fma(_1597, _1597, _1605);
    float _1613 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1609);
    float _1615 = fma(_1601, _1601, _1611);
    float _1617 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1619 = rsqrt(_1615);
    float _1621 = sqrt(_1615);
    float _1623 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1625 = _1597 * _1623;
    float _1627 = _1601 * _1623;
    float _1629 = _1625 * _1625;
    float _1631 = _1627 * _1627;
    float _1633 = _1629 + _1631;
    float _1635 = sqrt(_1633);
    bool _1637 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = _1635 + _1639;
    float _1643 = _1459;
    float _1645 = _1633;
    float _1647 = _1641;
    float _1649 = _1625;
    float _1651 = _1627;
    float _1653 = _1629;
    float _1655 = _1631;
    if (_1637)
    {
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1657;
    }
    float _1659 = _1643;
    if (_1637)
    {
        float _1661 = rsqrt(_1633);
        _1645 = _1661;
    }
    float _1663 = _1645;
    if (_1637)
    {
        float _1665 = _1641 * _1659;
        _1647 = _1665;
    }
    float _1667 = _1647;
    if (_1637)
    {
        float _1669 = _1667 * 0.15915493667125701904296875;
        _1469 = _1669;
    }
    float _1671 = _1469;
    float _1673 = _1527;
    if (_1637)
    {
        float _1675 = _1671 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        _1673 = _1677;
    }
    float _1679 = _1673;
    float _1681 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1683 = precise::max(0.0, _1681);
    float _1685 = _161;
    float _1687 = _1683;
    float _1689 = _1681;
    if (_1637)
    {
        float _1691 = _1671 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        _1685 = _1693;
    }
    float _1695 = _1685;
    float _1697 = -_1623;
    float _1699 = -_1683;
    float _1701 = fma(_1593, _1697, _1699);
    float _1703 = _1701;
    if (_1637)
    {
        float _1705 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1687 = _1705;
    }
    float _1707 = _1687;
    float _1709 = _1679;
    float _1711 = _1707;
    if (_1637)
    {
        float _1713 = fma(_1679, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1709 = _1713;
    }
    float _1715 = _1709;
    float _1717 = _1715;
    if (_1637)
    {
        float _1719 = _1695 + (-1.0);
        _1689 = _1719;
    }
    float _1721 = _1689;
    if (_1637)
    {
        float _1723 = _1663 * _1715;
        _1717 = _1723;
    }
    float _1725 = _1717;
    float _1727 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1637)
    {
        float _1729 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1711 = _1729;
    }
    float _1731 = _1711;
    if (_1637)
    {
        float _1733 = _1625 * _1725;
        _1649 = _1733;
    }
    float _1735 = _1649;
    if (_1637)
    {
        float _1737 = _1627 * _1725;
        _1651 = _1737;
    }
    float _1739 = _1651;
    if (_1637)
    {
        float _1741 = fma(_1701, _1695, _1731);
        _1703 = _1741;
    }
    float _1743 = _1703;
    if (_1637)
    {
        float _1745 = _1735 * _1735;
        _1653 = _1745;
    }
    float _1747 = _1653;
    if (_1637)
    {
        float _1749 = _1739 * _1739;
        _1655 = _1749;
    }
    float _1751 = _1655;
    float _1753 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1755 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1727);
    float _1757 = fma(_1743, _1743, _1747);
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1761 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1759);
    float _1763 = precise::clamp(_1761, 0.0, 1.0);
    float _1765 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1753);
    float _1767 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1755);
    float _1769 = _1757 + _1751;
    float _1771 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1773 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1765);
    float _1775 = -_1763;
    float _1777 = _1775 + 1.0;
    float _1779 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1781 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1771);
    float _1783 = rsqrt(_1769);
    float _1785 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1787 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1789 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1781);
    float _1791 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1795 = abs(_1777);
    float _1797 = log2(_1795);
    float _1799 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1793);
    float _1801 = -_1787;
    float _1803 = fma(_1801, _1607, 1.0);
    float _1805 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1799);
    float _1807 = _1783 * _1735;
    float _1809 = _1783 * _1743;
    float _1811 = _1783 * _1739;
    float _1813 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1815 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1817 = log2(_1803);
    float _1819 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1821 = -_1815;
    float _1823 = fma(_1809, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1821);
    float _1825 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1827 = -_1811;
    float _1829 = fma(_1827, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1823);
    float _1831 = 1.0 / _1813;
    float _1833 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1835 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1819);
    float _1837 = fma(_1829, -0.5, 0.5);
    float _1839 = fma(_1829, 0.5, 0.5);
    float _1841 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1833);
    float _1843 = _1809 + 1.0;
    float _1845 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1835);
    float _1847 = exp2(_1825);
    float _1849 = fma(_1839, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1851 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1841);
    float _1853 = _1817 * 0.693147182464599609375;
    float _1855 = fma(_1839, _1849, -0.212114393711090087890625);
    float _1857 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1851);
    float _1859 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1861 = sqrt(_1837);
    float _1863 = fma(_1839, _1855, 1.570728778839111328125);
    float _1865 = -_1809;
    float _1867 = fma(_1847, _1843, _1865);
    float _1869 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1845);
    float _1871 = _1857 * _1831;
    float _1873 = fma(_1867, 0.5, 0.5);
    float _1875 = _1869 * _1831;
    float _1877 = fma(_1871, 0.5, 0.5);
    float _1879 = _1861 * 0.636619746685028076171875;
    float _1881 = fma(_1875, -0.5, 0.5);
    float _1883 = -_1863;
    float _1885 = fma(_1879, _1883, 1.0);
    float3 _5813 = float3(_1877, _1881, _1859);
    float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5813, float3(0.0), isnan(_5813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5813, float3(0.0), isnan(_5813)), level(0.0)).x;
    float3 _5824 = float3(_1877, _1881, _1859);
    float4 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5824, float3(0.0), isnan(_5824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5824, float3(0.0), isnan(_5824)), level(0.0)).xyzw;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    float _1898 = _1890.w;
    float2 _5841 = float2(_1885, _1873);
    float3 _1902 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5841, float2(0.0), isnan(_5841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5841, float2(0.0), isnan(_5841)), level(0.0)).xyz;
    float _1904 = _1902.x;
    float _1906 = _1902.y;
    float _1908 = _1902.z;
    float _1910 = float(uint(_853));
    float _1912 = trunc(_909);
    int _1914 = int(_1912);
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1918 = _1916 != 0;
    float _1920 = -_899;
    float _1922 = _1920 + 1.0;
    int _1924 = ~_853;
    int _1926 = _1924 + 1;
    float _1928 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1930 = _853 == 0;
    int _1932 = abs(_991);
    float _1934 = 1.0 / _1910;
    bool _1936 = _659 > 0.5;
    bool _1938 = !_1918;
    float _1940 = _1938 ? 7.345489978790283203125 : 1.0;
    float _1942 = exp2(_1928);
    float _1944 = float(uint(_1914));
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1948 = as_type<int>(_1934) + (-2);
    float _1950 = as_type<float>(_1948) * _1944;
    int _1952 = ~_853;
    int _1954 = _1952 + 1;
    float _1956 = -_1942;
    float _1958 = _1956 + 1.0;
    float _1960 = trunc(_1950);
    float _1962 = precise::max(_1960, 0.0);
    uint _1965 = uint(_1962);
    float _1967 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1969 = _1954 * int(_1965);
    int _1971 = _1969 + _1914;
    float _1973 = float(_1914);
    float _1975 = float(uint(_1971));
    float _1977 = as_type<float>(_1948) * _1975;
    float _1979 = _1940 * _183;
    bool _1981 = _1973 >= _895;
    bool _1983 = isnan(_1973);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(_895);
    bool _1989 = _1985 || _1987;
    float _1991 = float(_1989);
    float _1993 = trunc(_1977);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = floor(_1979);
    int _2001 = int(_1965) + int(_1997);
    float _2003 = trunc(_1991);
    int _2005 = int(_2003);
    int _2007 = _1926 * _2001;
    int _2009 = _2007 + _1914;
    float _2011 = -_1999;
    float _2013 = _1979 + _2011;
    float _2015 = 1.0 / _657;
    bool _2017 = uint(_2009) >= uint(_853);
    bool _2019 = !_2017;
    int _2021 = _2019 ? 0 : (-1);
    int _2023 = ~_2001;
    int _2025 = _2023 + _2021;
    int _2027 = _2025 + 1;
    float _2029 = _2013 * _895;
    int _2031 = _853 * _2027;
    int _2033 = _2031 + _1914;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2037 = _2035 != 0;
    float _2039 = _903 * _2015;
    int _2041 = ~_2005;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    float _2047 = trunc(_2029);
    int _2049 = int(_2047);
    bool _2051 = !_1930;
    int _2053 = _2051 ? _2033 : (-1);
    bool _2055 = !_2037;
    int _2057 = _2055 ? 0 : 1;
    int _2059 = _853 + (-1);
    int _2061 = _2053 * _2045;
    int _2063 = abs(_2057);
    float _2065 = trunc(_2039);
    int _2067 = int(_2065);
    int _2069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2071 = _2069 != 0;
    int _2073 = _2005 * _2059;
    int _2075 = _2073 + _2061;
    int _2077 = abs(_961);
    int _2079 = _2075 * _1932;
    bool _2081 = !_2071;
    int _2083 = _2081 ? 0 : 1;
    int _2085 = abs(_995);
    int _2087 = _2049 * _2063;
    int _2089 = _2087 + _1914;
    int _2091 = abs(_2083);
    int _2093 = _2067 * _2077;
    int _2095 = _2093 + _2079;
    float _2097 = float(uint(_2089));
    bool _2099 = _183 > 0.5;
    int _2101 = _2089 * _2085;
    int _2103 = _2101 + _2095;
    float _2105 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2107 = as_type<float>(_1948) * _2097;
    int _2109 = ~_853;
    int _2111 = _2109 + 1;
    int _2113 = _2049 * _2091;
    int _2115 = _2113 + _2103;
    int _2117 = ~_853;
    int _2119 = _2117 + 1;
    float _2121 = _2105 * _183;
    float _2123 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2125 = trunc(_2107);
    float _2127 = precise::max(_2125, 0.0);
    uint _2129 = uint(_2127);
    float _2131 = float(uint(_2115));
    float _2133 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2123);
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2137 = _2135 != 0;
    float _2139 = as_type<float>(_1948) * _2131;
    float _2141 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2133);
    float _2143 = trunc(_2121);
    int _2145 = int(_2143);
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2149 = _2147 != 0;
    int _2151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2153 = _2151 != 0;
    float _2155 = -_1297;
    int _2157 = _2099 ? as_type<int>(_2155) : as_type<int>(_1297);
    bool _2159 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2161 = isnan(0.5);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2167 = _2163 || _2165;
    float _2169 = trunc(_2139);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    int _2175 = _2145 << 4;
    int _2177 = _2175 + 1968;
    int _2179 = _2177 + 8;
    uint _2181 = uint(int(uint(_2179) >> uint(2)));
    uint _2183 = uint(int(uint(int(_2181)) >> uint(2)));
    int _2185 = int(_2181) & 3;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[int(_2183)][_2185];
    int _2189 = _2119 * int(_2173);
    int _2191 = _2189 + _2115;
    float _2193 = float(uint(_2191));
    float _2195 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2197 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2199 = as_type<float>(_1948) * _2193;
    float _2201 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2195);
    uint _2203 = uint(int(uint(_2177) >> uint(2)));
    uint _2205 = uint(int(uint(int(_2203)) >> uint(2)));
    int _2207 = int(_2203) & 3;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[int(_2205)][_2207];
    int _2211 = int(_2203) + 1;
    uint _2213 = uint(int(uint(_2211) >> uint(2)));
    int _2215 = _2211 & 3;
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[int(_2213)][_2215];
    float _2219 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2201);
    float _2221 = trunc(_2199);
    float _2223 = precise::max(_2221, 0.0);
    uint _2225 = uint(_2223);
    float _2227 = _2219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2229 = !_2149;
    float _2231 = _2229 ? _1297 : as_type<float>(_2157);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2235 = _2227 + _2197;
    float _2237 = 1.0 / _2197;
    float _2239 = _2233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2241 = _2231 + 0.5;
    float _2243 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2245 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2247 = int(_2173) + int(_2225);
    float _2249 = _2245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2251 = _2111 * _2247;
    int _2253 = _2251 + _2115;
    int _2255 = _2111 * int(_2129);
    int _2257 = _2255 + _2089;
    float _2259 = _2235 * _2237;
    float _2261 = _2259 * 0.5;
    bool _2263 = uint(_2253) >= uint(_853);
    float _2265 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[80].x, _713);
    float _2267 = float(uint(_2257));
    float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2271 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2269);
    bool _2273 = !_2263;
    int _2275 = _2273 ? 0 : (-1);
    float _2277 = as_type<float>(_1948) * _2267;
    int _2279 = ~_2247;
    int _2281 = _2279 + _2275;
    int _2283 = _2281 + 1;
    float _2285 = 1.0 / _2271;
    float _2287 = -_1309;
    int _2289 = _1936 ? as_type<int>(_2287) : as_type<int>(_1309);
    float _2291 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2293 = ~_853;
    int _2295 = _2293 + 1;
    float _2297 = _2291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2299 = trunc(_2277);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _2209 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_66.x = _2297;
    out.m_66.y = _2249;
    out.m_66.z = _2239;
    out.m_66.w = _1946;
    int _2307 = int(_2129) + int(_2303);
    int _2309 = _853 * _2283;
    int _2311 = _2309 + _2115;
    float _2313 = _2305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2315 = _2217 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2317 = !_2153;
    float _2319 = _2317 ? _1309 : as_type<float>(_2289);
    float _2321 = _2187 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2323 = !_1930;
    int _2325 = _2323 ? _2311 : (-1);
    float _2327 = _2315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2329 = as_type<float>(_2115);
    float _2331 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2333 = _2285;
    float _2335 = _1869;
    float _2337 = _1892;
    float _2339 = _1894;
    float _2341 = _1813;
    if (!_2167)
    {
        _2329 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2343 = _2329;
    float _2345 = _2319 + (-0.5);
    int _2347 = _2325 >> 31;
    float _2349 = _2321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2351 = _2295 * _2307;
    int _2353 = _2351 + _2089;
    float _2355 = _2343;
    if (!_2167)
    {
        float _2357 = -_2343;
        float _2359 = _2357 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2331 = _2359;
    }
    float _2361 = _2331;
    int _2363 = _2347 & 3;
    float _2365 = -_2345;
    float _2367 = -_897;
    float _2369 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2367);
    out.m_68.x = _2313;
    out.m_68.y = _2327;
    out.m_68.z = _2349;
    float _2371 = _2345;
    if (!_2167)
    {
        float _2373 = 1.0 / _2361;
        _2371 = _2373;
    }
    float _2375 = _2371;
    int _2377 = _2325 + _2363;
    float _2379 = -_875;
    float _2381 = _2379 + 1.0;
    bool _2383 = uint(_2353) >= uint(_853);
    if (!_2167)
    {
        float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2387 = -_2343;
        float _2389 = fma(_2285, _2385, _2387);
        _2355 = _2389;
    }
    float _2391 = _2355;
    int _2393 = _2377 >> 2;
    float _2395 = -_2381;
    float _2397 = fma(_2231, _2395, _2265);
    float _2399 = fma(_2319, _1922, _2369);
    bool _2401 = !_2383;
    int _2403 = _2401 ? 0 : (-1);
    float _2405 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2407 = _2393 << 4;
    int _2409 = _2407 + 368;
    float _2411 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2413 = as_type<float>(_2393);
    if (_2167)
    {
        _2413 = 1.0;
    }
    float _2415 = _2413;
    out.m_70.x = _2397;
    out.m_70.y = _2399;
    uint _2417 = uint(int(uint(_2409) >> uint(2)));
    uint _2419 = uint(int(uint(int(_2417)) >> uint(2)));
    int _2421 = int(_2417) & 3;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[int(_2419)][_2421];
    int _2425 = int(_2417) + 1;
    uint _2427 = uint(int(uint(_2425) >> uint(2)));
    int _2429 = _2425 & 3;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[int(_2427)][_2429];
    float _2433 = -_1345;
    float _2435 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2411);
    float _2437 = _2415;
    if (!_2167)
    {
        float _2439 = _2391 * _2375;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        _2437 = _2441;
    }
    float _2443 = _2437;
    int _2445 = ~_2307;
    int _2447 = _2445 + _2403;
    int _2449 = _2447 + 1;
    float _2451 = -_1345;
    float _2453 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2405);
    int _2455 = _2325 & 3;
    bool _2457 = _2455 != 0;
    float _2459 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2461 = _2325 & 3;
    bool _2463 = _2461 != 0;
    int _2465 = _2409 + 8;
    uint _2467 = uint(int(uint(_2465) >> uint(2)));
    uint _2469 = uint(int(uint(int(_2467)) >> uint(2)));
    int _2471 = int(_2467) & 3;
    float _2473 = (*spvDescriptorSet0.vp_c9)._m0[int(_2469)][_2471];
    int _2475 = int(_2467) + 1;
    uint _2477 = uint(int(uint(_2475) >> uint(2)));
    int _2479 = _2475 & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    int _2483 = _853 * _2449;
    int _2485 = _2483 + _2089;
    float _2487 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2489 = uint(_2455) > 1u;
    float _2491 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2493 = _2455 != 3;
    float _2495 = -_1345;
    float _2497 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2487);
    float _2499 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2501 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2503 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2491);
    float _2505 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2507 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2499);
    float _2509 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2501);
    int _2511 = _2463 ? 0 : 1;
    float _2513 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2515 = uint(_2455) >= 2u;
    float _2517 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2519 = ~_2511;
    int _2521 = _2519 + 1;
    int _2523 = _2521 + 1;
    float _2525 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2505);
    int _2527 = _2523;
    if (!_2489)
    {
        int _2529 = ~_2511;
        int _2531 = _2529 + 1;
        _2527 = _2531;
    }
    int _2533 = _2527;
    float _2535 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2513);
    int _2537 = _2515 ? 0 : 1;
    float _2539 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2517);
    bool _2541 = !_2457;
    int _2543 = _2541 ? 0 : 1;
    float _2545 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2507);
    int _2547 = abs(_2533);
    float _2549 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2503);
    int _2551 = ~_2537;
    int _2553 = _2551 + 1;
    int _2555 = _2553 + 1;
    float _2557 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2509);
    int _2559 = _2555;
    float _2561 = _2557;
    if (_2493)
    {
        int _2563 = ~_2537;
        int _2565 = _2563 + 1;
        _2559 = _2565;
    }
    int _2567 = _2559;
    float _2569 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2525);
    bool _2571 = _2455 != 3;
    float _2573 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2435);
    int _2575 = abs(_2543);
    float _2577 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2497);
    int _2579 = ~_2547;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    float _2585 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2453);
    int _2587 = abs(_2567);
    float _2589 = _2459 * _2573;
    bool _2591 = !_2571;
    int _2593 = _2591 ? 0 : (-1);
    int _2595 = _2583 * as_type<int>(_2431);
    int _2597 = ~_2575;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    float _2603 = fma(_2243, _2545, _2589);
    float _2605 = _1967 * _1887;
    int _2607 = abs(_2593);
    int _2609 = _2601 * as_type<int>(_2423);
    int _2611 = _2609 + _2595;
    bool _2613 = !_2137;
    int _2615 = _2613 ? 0 : 1;
    float _2617 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2619 = ~_2587;
    int _2621 = _2619 + 1;
    int _2623 = _2621 + 1;
    float _2625 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2617);
    int _2627 = abs(_2615);
    int _2629 = _2623 * as_type<int>(_2473);
    int _2631 = _2629 + _2611;
    int _2633 = ~_2607;
    int _2635 = _2633 + 1;
    int _2637 = _2635 + 1;
    float _2639 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2625);
    float _2641 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2535);
    bool _2643 = !_1930;
    int _2645 = _2643 ? _2485 : (-1);
    int _2647 = _2637 * as_type<int>(_2481);
    int _2649 = _2647 + _2631;
    int _2651 = ~_2627;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    float _2657 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2539);
    float _2659 = _1908 * _2605;
    int _2661 = _2649 * _2655;
    float _2663 = _2459 * _2577;
    float _2665 = _2459 * _2585;
    float _2667 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2639);
    int _2669 = _2645 * _2627;
    int _2671 = _2669 + _2661;
    float _2673 = fma(_2243, _2549, _2663);
    float _2675 = fma(_2243, _2557, _2665);
    float _2677 = _2603;
    float _2679 = _2667;
    if (!_2167)
    {
        _2561 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2681 = _2561;
    float _2683 = _1898 * _2605;
    float _2685 = float(_2671);
    float _2687 = _2569 + _2603;
    float _2689 = _2685;
    if (!_2167)
    {
        float _2691 = -_2681;
        float _2693 = _2691 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2677 = _2693;
    }
    float _2695 = _2677;
    float _2697 = _2667 + _1813;
    float _2699 = fma(_1904, _2683, _1892);
    float _2701 = _2641 + _2673;
    out.gl_Position.x = _1857;
    out.gl_Position.y = _1869;
    out.gl_Position.z = _2667;
    out.gl_Position.w = _1813;
    float _2703 = _2697 * 0.5;
    float _2705 = _2695;
    if (!_2167)
    {
        float _2707 = 1.0 / _2695;
        _2705 = _2707;
    }
    float _2709 = _2705;
    float _2711 = _2657 + _2675;
    float _2713 = fma(_1906, _2683, _1894);
    float _2715 = fma(_1898, _2659, _1896);
    out.m_72.z = _2703;
    out.m_72.w = _1813;
    if (!_2167)
    {
        float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2719 = -_2681;
        float _2721 = fma(_2285, _2717, _2719);
        _2333 = _2721;
    }
    float _2723 = _2333;
    bool _2725 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2727 = isnan(_1621);
    bool _2729 = _2725 || _2727;
    bool _2731 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2733 = _2729 || _2731;
    out.m_74.x = _2687;
    out.m_74.y = _2701;
    out.m_74.z = _2711;
    float _2735 = -_1967;
    float _2737 = _2735 + 1.0;
    float _2739 = _2723;
    if (_2167)
    {
        _2335 = 1.0;
    }
    float _2741 = _2335;
    out.m_76.x = _2685;
    float _2743 = _1898 * _2737;
    float _2745 = _2741;
    if (!_2167)
    {
        float _2747 = _2723 * _2709;
        float _2749 = precise::clamp(_2747, 0.0, 1.0);
        _2739 = _2749;
    }
    float _2751 = _2739;
    if (!_2733)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2753 = _2337;
    out.m_78.x = _2699;
    out.m_78.y = _2713;
    out.m_78.z = _2715;
    out.m_78.w = _2743;
    float _2755 = _2753;
    float _2757 = _2753;
    if (!_2167)
    {
        float _2759 = -_2751;
        float _2761 = _2759 + 1.0;
        _2745 = _2761;
    }
    float _2763 = _2745;
    if (!_2733)
    {
        _2339 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2765 = _2339;
    float _2767 = _2765;
    float _2769 = _2765;
    if (!_2733)
    {
        _2689 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2771 = _2689;
    float _2773 = _2443 * _2763;
    float _2775 = _2773;
    float _2777 = _2771;
    float _2779 = _2771;
    if (!_2733)
    {
        _2341 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2781 = _2341;
    float _2783 = _2781;
    float _2785 = _2781;
    if (!_2733)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2787 = _2679;
    float _2789 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2791 = _2787;
    float _2793 = _2787;
    if (!_2733)
    {
        _2775 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2795 = _2775;
    bool _2797 = !_2733;
    float _2799 = _2795;
    float _2801 = _2795;
    if (!_2797)
    {
        bool _2803 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2805 = isnan(_1621);
        bool _2807 = _2803 || _2805;
        bool _2809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2811 = _2807 || _2809;
        if (!_2811)
        {
            float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2815 = _1621 + _2813;
            float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2819 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2817;
            float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2825 = 1.0 / _2819;
            float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2829 = _2827 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2831 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2833 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2843 = _2815 * _2825;
            float _2845 = precise::clamp(_2843, 0.0, 1.0);
            float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2851 = fma(_2845, _2823, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2853 = fma(_2845, _2849, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2855 = fma(_2845, _2829, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2857 = fma(_2845, _2833, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2859 = fma(_2845, _2837, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2861 = fma(_2845, _2841, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2769 = _2851;
            _2793 = _2859;
            _2757 = _2855;
            _2785 = _2857;
            _2779 = _2853;
            _2801 = _2861;
            _2863 = true;
        }
        else
        {
            bool _2865 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2867 = isnan(_1621);
            bool _2869 = _2865 || _2867;
            bool _2871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2873 = _2869 || _2871;
            if (!_2873)
            {
                _2755 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2875 = _2755;
            _2757 = _2875;
            if (!_2873)
            {
                _2767 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2877 = _2767;
            _2769 = _2877;
            if (!_2873)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2879 = _2777;
            _2779 = _2879;
            if (!_2873)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2881 = _2783;
            _2785 = _2881;
            if (!_2873)
            {
                _2791 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2883 = _2791;
            _2793 = _2883;
            if (!_2873)
            {
                _2799 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2885 = _2799;
            bool _2887 = !_2873;
            _2801 = _2885;
            if (!_2887)
            {
                bool _2889 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2891 = isnan(_1621);
                bool _2893 = _2889 || _2891;
                bool _2895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2897 = _2893 || _2895;
                if (!_2897)
                {
                    float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2901 = _1621 + _2899;
                    float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2905 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2903;
                    float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2911 = 1.0 / _2905;
                    float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2919 = _2917 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2929 = _2901 * _2911;
                    float _2931 = precise::clamp(_2929, 0.0, 1.0);
                    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2937 = fma(_2931, _2909, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2939 = fma(_2931, _2935, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2941 = fma(_2931, _2915, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2943 = fma(_2931, _2919, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2945 = fma(_2931, _2923, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2947 = fma(_2931, _2927, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2769 = _2937;
                    _2793 = _2945;
                    _2757 = _2941;
                    _2785 = _2943;
                    _2779 = _2939;
                    _2801 = _2947;
                    _2863 = true;
                }
                else
                {
                    _2769 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2793 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2757 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2801 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2863 = false;
    float _2949 = _2769;
    float _2951 = _2793;
    float _2953 = _2757;
    float _2955 = _2785;
    float _2957 = _2779;
    float _2959 = _2801;
    float _2961 = fma(_2701, -0.5, 0.5);
    float _2963 = precise::clamp(_2961, 0.0, 1.0);
    float _2965 = -_2949;
    float _2967 = _2965 + _2951;
    float _2969 = -_2953;
    float _2971 = _2969 + _2955;
    out.m_80.x = 0.0;
    float _2973 = -_2957;
    float _2975 = _2973 + _2959;
    float _2977 = fma(_2963, _2967, _2949);
    float _2979 = fma(_2963, _2971, _2953);
    bool _2981 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2983 = _2977 * 0.586610972881317138671875;
    float _2985 = fma(_2963, _2975, _2957);
    float _2987 = _2789 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2989 = fma(_2979, 0.298911988735198974609375, _2983);
    bool _2991 = _2443 > 0.0;
    bool _2993 = isnan(_2443);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan(0.0);
    bool _2999 = _2995 || _2997;
    float _3001 = fma(_2985, 0.114477999508380889892578125, _2989);
    out.m_47.x = _2987;
    bool _3003 = _2763 <= 0.0;
    bool _3005 = !_2999;
    bool _3007 = _3003 || _3005;
    float _3009 = -_3001;
    float _3011 = _2977 + _3009;
    float _3013 = -_3001;
    float _3015 = _2979 + _3013;
    float _3017 = fma(_3011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3001);
    float _3019 = -_3001;
    float _3021 = _2985 + _3019;
    float _3023 = fma(_3015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3001);
    float _3025 = fma(_3021, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3001);
    bool _3027 = !_2981;
    if (!_3027)
    {
        float _3029 = -_1585;
        float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3033 = -_1587;
        float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3037 = -_1589;
        float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3041 = _3031 * _3031;
        float _3043 = fma(_3035, _3035, _3041);
        float _3045 = fma(_3039, _3039, _3043);
        float _3047 = sqrt(_3045);
        float _3049 = rsqrt(_3045);
        float _3051 = -_3047;
        float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3055 = _3053 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3057 = precise::clamp(_3055, 0.0, 1.0);
        float _3059 = _3035 * _3049;
        float _3061 = _3031 * _3049;
        float _3063 = abs(_3057);
        float _3065 = log2(_3063);
        float _3067 = _3039 * _3049;
        float _3069 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3071 = _2701 * _3061;
        float _3073 = -_3061;
        float _3075 = -_3069;
        float _3077 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3075);
        float _3079 = fma(_2687, _3059, _3071);
        float _3081 = -_3067;
        float _3083 = fma(_3081, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3077);
        float _3085 = fma(_2711, _3067, _3079);
        float _3087 = precise::clamp(_3085, 0.0, 1.0);
        float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3091 = _3083 + _3089;
        float _3093 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3095 = _3091 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3097 = precise::clamp(_3095, 0.0, 1.0);
        float _3099 = exp2(_3093);
        float _3101 = _3099 * _3097;
        float _3103 = _3087 * _3101;
        float _3105 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3107 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3109 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_80.x = _3105;
        out.m_80.y = _3107;
        out.m_80.z = _3109;
    }
    out.m_82.x = _3023;
    out.m_82.y = _3017;
    out.m_82.z = _3025;
    if (!_3007)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3111 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3111;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2863 = false;
    bool _647 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3168 = as_type<float>(_117);
        out.gl_Position.z = _3168;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_49.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _137 = _141;
    }
    float _143 = _137;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3237 = as_type<float>(_155);
        out.gl_Position.z = _3237;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_51.x;
    float _159 = in.m_51.y;
    float _161 = in.m_51.z;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _167 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _169 = in.m_53.x;
    float _171 = in.m_53.y;
    float _173 = in.m_53.z;
    float _175 = in.m_55.x;
    float _177 = in.m_55.y;
    float _179 = in.m_55.z;
    float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _183 = in.m_57.x;
    float _185 = _165 * _163;
    float _187 = _157 * _157;
    float _189 = _159 * _159;
    float _191 = _161 * _161;
    float _193 = fma(_169, _169, _187);
    float _195 = fma(_171, _171, _189);
    float _197 = fma(_173, _173, _191);
    float _199 = fma(_175, _175, _193);
    float _201 = fma(_177, _177, _195);
    float _203 = fma(_179, _179, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[20].x, _185);
    float _209 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    bool _211 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _215 = _211 || _213;
    bool _217 = isnan(1.0);
    bool _219 = _215 || _217;
    float _221 = _209 * _181;
    float _223 = sqrt(_201);
    float _225 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[20].y, _221);
    bool _227 = _205 > 0.0;
    float _229 = floor(_207);
    float _231 = 0.0;
    float _233 = _201;
    float _235 = _181;
    float _237 = _199;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _241 = _167;
    if (!_219)
    {
        float _243 = _167 * _167;
        float _245 = _243 * 0.5;
        _231 = _245;
    }
    float _247 = _231;
    float _249 = _247;
    if (!_219)
    {
        float _251 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _251;
    }
    float _253 = _249;
    bool _255 = _223 > 0.0;
    float _257 = sqrt(_203);
    int _259 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _261 = _259 != 0;
    float _263 = floor(_225);
    float _265 = 0.0;
    float _267 = _253;
    float _269 = 1.4012984643248170709237295832899e-45;
    if (_227)
    {
        float _271 = rsqrt(_199);
        _265 = _271;
    }
    float _273 = _265;
    bool _275 = _257 > 0.0;
    float _277 = _257;
    if (!_219)
    {
        _277 = _167;
    }
    float _279 = _277;
    float _281 = 0.0;
    float _283 = _279;
    if (_255)
    {
        float _285 = rsqrt(_201);
        _281 = _285;
    }
    float _287 = _281;
    bool _289 = !_219;
    if (!_289)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = _167 * _293;
        float _303 = 1.0 / _297;
        float _305 = _299 * 0.693147182464599609375;
        float _307 = exp2(_301);
        float _309 = 1.0 / _305;
        float _311 = _307 + (-1.0);
        float _313 = -_311;
        float _315 = fma(_313, _309, _167);
        float _317 = _315 * _303;
        float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _307;
        _267 = _319;
        _235 = _317;
        _269 = _303;
        _237 = _309;
    }
    float _321 = _233;
    float _323 = _267;
    float _325 = _235;
    float _327 = _269;
    float _329 = _237;
    bool _331 = !_219;
    float _333 = _325;
    float _335 = _321;
    float _337 = _327;
    float _339 = _329;
    if (!_331)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _167 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _333 = _349;
        _335 = _351;
        _239 = _347;
        _283 = _359;
    }
    float _361 = _333;
    float _363 = _335;
    float _365 = _239;
    float _367 = _283;
    float _369 = -_229;
    float _371 = _207 + _369;
    float _373 = _207 * 6.283185482025146484375;
    float _375 = 0.0;
    float _377 = _361;
    float _379 = _365;
    float _381 = _363;
    if (_275)
    {
        float _383 = rsqrt(_203);
        _375 = _383;
    }
    float _385 = _375;
    float _387 = -_263;
    float _389 = _225 + _387;
    float _391 = _225 * 6.283185482025146484375;
    float _393 = _373 * 0.15915493667125701904296875;
    if (!_227)
    {
        _241 = 0.0;
    }
    float _395 = _241;
    float _397 = _395;
    if (_227)
    {
        float _399 = _273 * _169;
        _397 = _399;
    }
    float _401 = _397;
    float _403 = _391 * 0.15915493667125701904296875;
    if (!_227)
    {
        _377 = 0.0;
    }
    float _405 = _377;
    float _407 = _405;
    if (_227)
    {
        float _409 = _273 * _157;
        _407 = _409;
    }
    float _411 = _407;
    float _413 = _393 * 6.283185482025146484375;
    float _415 = cos(_413);
    if (!_227)
    {
        _379 = 0.0;
    }
    float _417 = _379;
    float _419 = _417;
    if (_227)
    {
        float _421 = _273 * _175;
        _419 = _421;
    }
    float _423 = _419;
    float _425 = 0.0;
    if (!_275)
    {
        _425 = 0.0;
    }
    float _427 = _425;
    float _429 = in.m_49.x;
    float _431 = in.m_49.y;
    float _433 = in.m_49.z;
    float _435 = _427;
    if (!_275)
    {
        _381 = 0.0;
    }
    float _437 = _381;
    float _439 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = 0.0;
    float _443 = _437;
    if (!_275)
    {
        _441 = 0.0;
    }
    float _445 = _441;
    float _447 = _403 * 6.283185482025146484375;
    float _449 = cos(_447);
    float _451 = _445;
    if (_275)
    {
        float _453 = _385 * _173;
        _435 = _453;
    }
    float _455 = _435;
    if (_275)
    {
        float _457 = _385 * _161;
        _443 = _457;
    }
    float _459 = _443;
    if (_275)
    {
        float _461 = _385 * _179;
        _451 = _461;
    }
    float _463 = _451;
    float _465 = 0.0;
    if (!_255)
    {
        _465 = 0.0;
    }
    float _467 = _465;
    float _469 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _471 = _467;
    if (!_255)
    {
        _337 = 0.0;
    }
    float _473 = _337;
    float _475 = _473;
    if (_255)
    {
        float _477 = _287 * _171;
        _471 = _477;
    }
    float _479 = _471;
    if (!_255)
    {
        _339 = 0.0;
    }
    float _481 = _339;
    float _483 = _481;
    if (_255)
    {
        float _485 = _287 * _159;
        _475 = _485;
    }
    float _487 = _475;
    if (_255)
    {
        float _489 = _287 * _177;
        _483 = _489;
    }
    float _491 = _483;
    float _493 = fma(_415, 0.5, 0.5);
    bool _495 = _371 < 0.5;
    float _497 = float(_495);
    float _499 = _469 * _411;
    float _501 = _469 * _459;
    float _503 = -_371;
    float _505 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _507 = -_493;
    float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _511 = -_497;
    float _513 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _515 = _469 * _487;
    float _517 = fma(_439, _401, _499);
    float _519 = in.m_59.w;
    bool _521 = _389 < 0.5;
    float _523 = float(_521);
    float _525 = fma(_449, 0.5, 0.5);
    float _527 = in.m_44.x;
    float _529 = in.m_44.y;
    float _531 = in.m_44.z;
    float _533 = -_389;
    float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _537 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _539 = -_523;
    float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _543 = -_525;
    float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _547 = fma(_439, _479, _515);
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _551 = _549 != 0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _555 = _553 != 0;
    float _557 = fma(_439, _455, _501);
    float _559 = fma(_537, _423, _517);
    float _561 = fma(_537, _491, _547);
    bool _563 = !_261;
    int _565 = _563 ? 0 : 1;
    float _567 = fma(_537, _463, _557);
    bool _569 = !_551;
    int _571 = _569 ? 0 : 1;
    float _573 = fma(_367, _429, _559);
    int _575 = abs(_565);
    float _577 = fma(_367, _431, _561);
    int _579 = abs(_571);
    bool _581 = !_555;
    int _583 = _581 ? 0 : 1;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _587 = abs(_583);
    float _589 = fma(_367, _433, _567);
    float _591 = float(_579);
    float _593 = fma(_573, _519, _527);
    float _595 = float(_575);
    float _597 = fma(_577, _519, _529);
    float _599 = abs(_505);
    float _601 = _591 * _599;
    float _603 = abs(_535);
    float _605 = _591 * _603;
    float _607 = fma(_589, _519, _531);
    float _609 = float(_587);
    float _611 = fma(_595, _509, _601);
    float _613 = fma(_595, _545, _605);
    float _615 = abs(_513);
    float _617 = fma(_609, _615, _611);
    float _619 = abs(_541);
    float _621 = fma(_609, _619, _613);
    bool _623 = !_585;
    float _625 = _593;
    float _643;
    float _645;
    if (!_623)
    {
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _629 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _631 = float(_101);
        float _633 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _635 = _633 * _627;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = _631;
        _647 = true;
    }
    else
    {
        float _649 = float(_101);
        float _651 = 1.0 / _649;
        float _653 = _135 * _651;
        _643 = _653;
        _645 = _649;
    }
    _647 = false;
    float _655 = _643;
    float _657 = _645;
    float _659 = in.m_57.y;
    float _661 = _183 * 2.0;
    float _663 = in.m_57.z;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _673;
    float _677 = 1.0 / _667;
    float _679 = _183 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _683 = _655 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _687 = _655 + _685;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _691 = 1.0 / _675;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _695 = -_689;
    float _697 = fma(_679, 2.0, _695);
    bool _699 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _707 = _703 || _705;
    float _709 = _659 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _711 = -_135;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[76].x, _697);
    float _715 = 1.0 / _671;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _717;
    float _721 = _663 * 2.0;
    bool _723 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _725 = isnan(_655);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _737 = log2(_735);
    float _739 = fma(_709, -2.0, _693);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _743 = _655 + _741;
    float _745 = _659 * 2.0;
    float _747 = _683 * _691;
    float _749 = _659 + _663;
    float _751 = _743 * _677;
    float _753 = _183 + _659;
    float _755 = floor(_661);
    float _757 = _749 + (-1.0);
    float _759 = _753 + (-1.0);
    float _761 = _687 * _715;
    float _763 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _765 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _767 = floor(_721);
    float _769 = _737 * _135;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _771;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _779 = fma(_719, _751, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _783 = 1.0 + _781;
    float _785 = floor(_745);
    bool _787 = _755 > 0.0;
    float _789 = fma(_773, _751, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _791 = _755 >= 0.0;
    bool _793 = isnan(_755);
    bool _795 = _791 || _793;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    float _801 = _183 + _663;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = fma(_777, _761, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _809 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _811 = int(_809);
    float _813 = _801 + (-1.0);
    bool _815 = _767 > 0.0;
    float _817 = fma(_805, _761, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _819 = _767 >= 0.0;
    bool _821 = isnan(_767);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _833 = exp2(_769);
    bool _835 = _785 > 0.0;
    float _837 = _663 + (-0.5);
    bool _839 = _785 >= 0.0;
    bool _841 = isnan(_785);
    bool _843 = _839 || _841;
    bool _845 = isnan(0.0);
    bool _847 = _843 || _845;
    float _849 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[78].z, _831);
    float _851 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _853 = int(_851);
    float _855 = float(_811);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _861;
    float _865 = fma(_859, _747, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _867 = -_833;
    float _869 = _867 + 1.0;
    float _871 = 1.0 / _855;
    float _873 = fma(_863, _747, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _875 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _849);
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _879 = _707 ? _869 : 0.0;
    bool _881 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _883 = isnan(1.0);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _889 = _885 || _887;
    float _891 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[78].w, _877);
    float _893 = 1.0 / _783;
    float _895 = float(_853);
    float _897 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _739);
    float _899 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    int _901 = _799 ? 0 : 1;
    float _903 = _895 * _135;
    int _905 = _847 ? 0 : 1;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _909 = _871 * _135;
    int _911 = ~_901;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    int _917 = _827 ? 0 : 1;
    int _919 = _915;
    if (!_787)
    {
        int _921 = ~_901;
        int _923 = _921 + 1;
        _919 = _923;
    }
    int _925 = _919;
    if (_889)
    {
        float _927 = _879 * _893;
        _139 = _927;
    }
    float _929 = _139;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _933 = _931 != 0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _941 = _939 != 0;
    int _943 = ~_905;
    int _945 = _943 + 1;
    int _947 = _945 + 1;
    int _949 = _947;
    if (!_835)
    {
        int _951 = ~_905;
        int _953 = _951 + 1;
        _949 = _953;
    }
    int _955 = _949;
    float _957 = _929 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    bool _959 = !_933;
    int _961 = _959 ? 0 : 1;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _973 = _971 != 0;
    float _975 = _957 * _907;
    bool _977 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _979 = isnan(_655);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    bool _989 = !_937;
    int _991 = _989 ? 0 : 1;
    bool _993 = !_941;
    int _995 = _993 ? 0 : 1;
    float _997 = -_987;
    float _999 = _997 + 1.0;
    bool _1001 = !_973;
    int _1003 = _1001 ? 0 : 1;
    int _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1007 = _1005 != 0;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1015 = _1013 != 0;
    bool _1017 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1019 = isnan(_655);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    int _1029 = ~_917;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    bool _1035 = !_1007;
    int _1037 = _1035 ? 0 : 1;
    float _1039 = _1027 * _999;
    int _1041 = _1033;
    if (!_815)
    {
        int _1043 = ~_917;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    float _1049 = -_1027;
    float _1051 = _1049 + 1.0;
    bool _1053 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1055 = isnan(_655);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = in.m_61.x;
    float _1067 = in.m_61.y;
    float _1069 = in.m_61.z;
    int _1071 = abs(_1037);
    float _1073 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[203].z, _975);
    bool _1075 = !_1015;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = _733 * _1051;
    bool _1081 = !_1011;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = _1073 + 0.25;
    int _1087 = abs(_1077);
    float _1089 = floor(_1073);
    float _1091 = float(_1047);
    float _1093 = -_733;
    float _1095 = _1093 + 1.0;
    float _1097 = float(_1071);
    float _1099 = float(_955);
    float _1101 = _1063 * _1095;
    float _1103 = float(_1087);
    float _1105 = floor(_1085);
    int _1107 = abs(_1083);
    float _1109 = _1097 * _1091;
    float _1111 = float(_925);
    float _1113 = _1103 * _1099;
    float _1115 = float(_1107);
    float _1117 = _1109 * (-2.0);
    float _1119 = _789 * _1101;
    float _1121 = _779 * _1101;
    float _1123 = -_1089;
    float _1125 = _1073 + _1123;
    float _1127 = _1115 * _1111;
    float _1129 = fma(_1117, _1065, _1065);
    bool _1131 = !_969;
    int _1133 = _1131 ? 0 : 1;
    float _1135 = _1127 * (-2.0);
    bool _1137 = _1125 >= 0.5;
    bool _1139 = isnan(_1125);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan(0.5);
    bool _1145 = _1141 || _1143;
    float _1147 = -_1105;
    float _1149 = _1085 + _1147;
    float _1151 = _1073 * 6.283185482025146484375;
    int _1153 = abs(_1133);
    float _1155 = fma(_1135, _1067, _1067);
    float _1157 = fma(_765, _1117, _765);
    float _1159 = _1151 * 0.15915493667125701904296875;
    float _1161 = _183 + (-0.5);
    bool _1163 = _1149 > 0.5;
    float _1165 = fma(_763, _1135, _763);
    bool _1167 = !_965;
    int _1169 = _1167 ? 0 : 1;
    float _1171 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1129);
    float _1173 = _1159 * 6.283185482025146484375;
    float _1175 = sin(_1173);
    float _1177 = _659 + (-0.5);
    bool _1179 = !_1145;
    float _1181 = _1179 ? 0.5 : (-0.5);
    float _1183 = fma(_1157, _929, _1171);
    int _1185 = abs(_1169);
    float _1187 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1155);
    float _1189 = float(_1153);
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1193 = _1191 * 2.0;
    float _1195 = _1149;
    if (_1163)
    {
        float _1197 = -_1149;
        float _1199 = _1197 + 1.0;
        _1195 = _1199;
    }
    float _1201 = _1195;
    int _1203 = abs(_1003);
    float _1205 = _1189 * _1193;
    float _1207 = float(_1185);
    float _1209 = fma(_1201, 4.0, -1.0);
    float _1211 = as_type<float>(int(gl_VertexIndex));
    float _1213 = fma(_1165, _929, _1187);
    float _1215 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1217 = _1183 * 0.15915493667125701904296875;
    float _1219 = _1213 * 0.15915493667125701904296875;
    float _1221 = fma(_1207, _1215, _1205);
    float _1223 = float(_1203);
    float _1225 = in.m_59.x;
    float _1227 = in.m_59.y;
    float _1229 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1231 = -_1063;
    float _1233 = _1231 + 1.0;
    float _1235 = _1217 * 6.283185482025146484375;
    float _1237 = sin(_1235);
    float _1239 = fma(_1223, _1229, _1221);
    float _1241 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1121);
    float _1243 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1119);
    float _1245 = fma(_1239, 3.1415927410125732421875, _1069);
    float _1247 = _1113 * (-2.0);
    float _1249 = fma(_817, _1079, _1241);
    float _1251 = fma(_807, _1079, _1243);
    float _1253 = _1217 * 6.283185482025146484375;
    float _1255 = cos(_1253);
    float _1257 = fma(_1245, _1247, _1245);
    float _1259 = fma(_873, _1039, _1249);
    float _1261 = fma(_829, _1247, _829);
    float _1263 = fma(_865, _1039, _1251);
    float _1265 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1257);
    float _1267 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1259);
    int _1269 = as_type<int>(_1211) & 1;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>(_1211) & 2;
    bool _1275 = _1273 != 0;
    float _1277 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1263);
    float _1279 = fma(_1261, _929, _1265);
    float _1281 = _1219 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = _1267 * _1227;
    float _1287 = _1277 * _1225;
    float _1289 = _1279 * 0.15915493667125701904296875;
    float _1291 = _597 * _177;
    float _1293 = _621 * _1285;
    bool _1295 = !_1271;
    float _1297 = _1295 ? (-0.5) : 0.5;
    float _1299 = _617 * _1287;
    float _1301 = _1219 * 6.283185482025146484375;
    float _1303 = cos(_1301);
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1307 = !_1275;
    float _1309 = _1307 ? (-0.5) : 0.5;
    float _1311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1297);
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1315 = fma(_593, _175, _1291);
    bool _1317 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1319 = isnan(0.5);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1325 = _1321 || _1323;
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1309);
    float _1329 = _1289 * 6.283185482025146484375;
    float _1331 = cos(_1329);
    float _1333 = _1313 * _1311;
    float _1335 = _1237 * _1283;
    float _1337 = _1305 * _1327;
    float _1339 = _1255 * _1283;
    float _1341 = fma(_607, _179, _1315);
    float _1343 = _1289 * 6.283185482025146484375;
    float _1345 = sin(_1343);
    float _1347 = _1255 * _1303;
    float _1349 = _1237 * _1303;
    float _1351 = _1255 * _1331;
    float _1353 = _1303 * _1331;
    float _1355 = _1237 * _1331;
    float _1357 = _1283 * _1331;
    float _1359 = _1351 * _1337;
    float _1361 = in.m_55.w;
    float _1363 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1365 = fma(_1345, _1347, _1335);
    float _1367 = -_1337;
    float _1369 = _1345 * _1367;
    float _1371 = in.m_53.w;
    float _1373 = -_1349;
    float _1375 = fma(_1345, _1339, _1373);
    float _1377 = fma(_1365, _1333, _1359);
    float _1379 = fma(_1353, _1333, _1369);
    float _1381 = -_1339;
    float _1383 = fma(_1345, _1349, _1381);
    float _1385 = _1355 * _1337;
    float _1387 = fma(_1375, _1363, _1377);
    float _1389 = fma(_1345, _1335, _1347);
    float _1391 = fma(_1357, _1363, _1379);
    float _1393 = fma(_1383, _1333, _1385);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1397 = _597 * _171;
    float _1399 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = fma(_1389, _1363, _1393);
    float _1403 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1395);
    float _1405 = fma(_593, _169, _1397);
    float _1407 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1409 = _597 * _159;
    float _1411 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1403);
    float _1413 = fma(_607, _173, _1405);
    float _1415 = _1341 + _1361;
    float _1417 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1407);
    float _1419 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1421 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1423 = _1413 + _1371;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1427 = _1415 + _1419;
    float _1429 = in.m_51.w;
    float _1431 = fma(_593, _157, _1409);
    float _1433 = _1423 + _1425;
    float _1435 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1437 = _1427 + _1435;
    float _1439 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1421);
    float _1441 = fma(_607, _161, _1431);
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1445 = _1433 + _1443;
    float _1447 = _1437 * _1437;
    float _1449 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1439);
    float _1451 = fma(_1445, _1445, _1447);
    float _1453 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1455 = sqrt(_1451);
    float _1457 = _1441 + _1429;
    float _1459 = _1457 + _1453;
    bool _1461 = _1455 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1463 = _1441;
    float _1465 = _1449;
    float _1467 = _1451;
    float _1469 = _1433;
    if (!_1461)
    {
        _1463 = _1433;
    }
    float _1471 = _1463;
    float _1473 = _1471;
    if (!_1461)
    {
        _1465 = _1427;
    }
    float _1475 = _1465;
    float _1477 = _1475;
    if (!_1461)
    {
        _625 = _1459;
    }
    float _1479 = _625;
    bool _1481 = !_1461;
    float _1483 = _1479;
    if (!_1481)
    {
        float _1485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1489 = _1455 + _1487;
        float _1491 = rsqrt(_1451);
        float _1493 = _1489 * _1485;
        float _1495 = _1459 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1497 = _1493 * 0.15915493667125701904296875;
        float _1499 = _1497 * 6.283185482025146484375;
        float _1501 = cos(_1499);
        float _1503 = _1497 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = _1501 + (-1.0);
        float _1509 = fma(_1505, _1495, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1511 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1513 = _1491 * _1509;
        float _1515 = fma(_1459, _1501, _1511);
        float _1517 = fma(_1445, _1513, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1519 = fma(_1437, _1513, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1483 = _1515;
        _1473 = _1517;
        _1477 = _1519;
        _1467 = _1491;
    }
    float _1521 = _1483;
    float _1523 = _1473;
    float _1525 = _1477;
    float _1527 = _1467;
    float _1529 = _1521;
    float _1531 = _1523;
    float _1533 = _1525;
    if (!_1325)
    {
        float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1537 = _1457 + _1535;
        float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1541 = _1423 + _1539;
        float _1543 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1545 = -_1457;
        float _1547 = _1545 + _1521;
        float _1549 = _1537 * _1537;
        float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1553 = _1415 + _1551;
        float _1555 = fma(_1541, _1541, _1549);
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1559 = fma(_1553, _1553, _1555);
        float _1561 = sqrt(_1559);
        float _1563 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1565 = -_1423;
        float _1567 = _1565 + _1523;
        float _1569 = precise::min(_1561, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1571 = _1569 * _1557;
        float _1573 = _1563 * _1571;
        float _1575 = -_1415;
        float _1577 = _1575 + _1525;
        float _1579 = fma(_1567, _1573, _1423);
        float _1581 = fma(_1547, _1573, _1457);
        float _1583 = fma(_1577, _1573, _1415);
        _1529 = _1581;
        _1531 = _1579;
        _1533 = _1583;
    }
    float _1585 = _1529;
    float _1587 = _1531;
    float _1589 = _1533;
    float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1593 = _1585 + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1597 = _1587 + _1595;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1601 = _1589 + _1599;
    float _1603 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1605 = _1593 * _1593;
    float _1607 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1603);
    float _1611 = fma(_1597, _1597, _1605);
    float _1613 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1609);
    float _1615 = fma(_1601, _1601, _1611);
    float _1617 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1619 = rsqrt(_1615);
    float _1621 = sqrt(_1615);
    float _1623 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1625 = _1597 * _1623;
    float _1627 = _1601 * _1623;
    float _1629 = _1625 * _1625;
    float _1631 = _1627 * _1627;
    float _1633 = _1629 + _1631;
    float _1635 = sqrt(_1633);
    bool _1637 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1641 = _1635 + _1639;
    float _1643 = _1459;
    float _1645 = _1633;
    float _1647 = _1641;
    float _1649 = _1625;
    float _1651 = _1627;
    float _1653 = _1629;
    float _1655 = _1631;
    if (_1637)
    {
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1643 = _1657;
    }
    float _1659 = _1643;
    if (_1637)
    {
        float _1661 = rsqrt(_1633);
        _1645 = _1661;
    }
    float _1663 = _1645;
    if (_1637)
    {
        float _1665 = _1641 * _1659;
        _1647 = _1665;
    }
    float _1667 = _1647;
    if (_1637)
    {
        float _1669 = _1667 * 0.15915493667125701904296875;
        _1469 = _1669;
    }
    float _1671 = _1469;
    float _1673 = _1527;
    if (_1637)
    {
        float _1675 = _1671 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        _1673 = _1677;
    }
    float _1679 = _1673;
    float _1681 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1683 = precise::max(0.0, _1681);
    float _1685 = _161;
    float _1687 = _1683;
    float _1689 = _1681;
    if (_1637)
    {
        float _1691 = _1671 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        _1685 = _1693;
    }
    float _1695 = _1685;
    float _1697 = -_1623;
    float _1699 = -_1683;
    float _1701 = fma(_1593, _1697, _1699);
    float _1703 = _1701;
    if (_1637)
    {
        float _1705 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1687 = _1705;
    }
    float _1707 = _1687;
    float _1709 = _1679;
    float _1711 = _1707;
    if (_1637)
    {
        float _1713 = fma(_1679, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1709 = _1713;
    }
    float _1715 = _1709;
    float _1717 = _1715;
    if (_1637)
    {
        float _1719 = _1695 + (-1.0);
        _1689 = _1719;
    }
    float _1721 = _1689;
    if (_1637)
    {
        float _1723 = _1663 * _1715;
        _1717 = _1723;
    }
    float _1725 = _1717;
    float _1727 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1637)
    {
        float _1729 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1711 = _1729;
    }
    float _1731 = _1711;
    if (_1637)
    {
        float _1733 = _1625 * _1725;
        _1649 = _1733;
    }
    float _1735 = _1649;
    if (_1637)
    {
        float _1737 = _1627 * _1725;
        _1651 = _1737;
    }
    float _1739 = _1651;
    if (_1637)
    {
        float _1741 = fma(_1701, _1695, _1731);
        _1703 = _1741;
    }
    float _1743 = _1703;
    if (_1637)
    {
        float _1745 = _1735 * _1735;
        _1653 = _1745;
    }
    float _1747 = _1653;
    if (_1637)
    {
        float _1749 = _1739 * _1739;
        _1655 = _1749;
    }
    float _1751 = _1655;
    float _1753 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1755 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1727);
    float _1757 = fma(_1743, _1743, _1747);
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1761 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1759);
    float _1763 = precise::clamp(_1761, 0.0, 1.0);
    float _1765 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1753);
    float _1767 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1755);
    float _1769 = _1757 + _1751;
    float _1771 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1773 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1765);
    float _1775 = -_1763;
    float _1777 = _1775 + 1.0;
    float _1779 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1781 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1771);
    float _1783 = rsqrt(_1769);
    float _1785 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1787 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1789 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1781);
    float _1791 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1793 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1795 = abs(_1777);
    float _1797 = log2(_1795);
    float _1799 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1793);
    float _1801 = -_1787;
    float _1803 = fma(_1801, _1607, 1.0);
    float _1805 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1799);
    float _1807 = _1783 * _1735;
    float _1809 = _1783 * _1743;
    float _1811 = _1783 * _1739;
    float _1813 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1815 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1817 = log2(_1803);
    float _1819 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1821 = -_1815;
    float _1823 = fma(_1809, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1821);
    float _1825 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1827 = -_1811;
    float _1829 = fma(_1827, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1823);
    float _1831 = 1.0 / _1813;
    float _1833 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1835 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1819);
    float _1837 = fma(_1829, -0.5, 0.5);
    float _1839 = fma(_1829, 0.5, 0.5);
    float _1841 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1833);
    float _1843 = _1809 + 1.0;
    float _1845 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1835);
    float _1847 = exp2(_1825);
    float _1849 = fma(_1839, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1851 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1841);
    float _1853 = _1817 * 0.693147182464599609375;
    float _1855 = fma(_1839, _1849, -0.212114393711090087890625);
    float _1857 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1851);
    float _1859 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1861 = sqrt(_1837);
    float _1863 = fma(_1839, _1855, 1.570728778839111328125);
    float _1865 = -_1809;
    float _1867 = fma(_1847, _1843, _1865);
    float _1869 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1845);
    float _1871 = _1857 * _1831;
    float _1873 = fma(_1867, 0.5, 0.5);
    float _1875 = _1869 * _1831;
    float _1877 = fma(_1871, 0.5, 0.5);
    float _1879 = _1861 * 0.636619746685028076171875;
    float _1881 = fma(_1875, -0.5, 0.5);
    float _1883 = -_1863;
    float _1885 = fma(_1879, _1883, 1.0);
    float3 _5813 = float3(_1877, _1881, _1859);
    float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5813, float3(0.0), isnan(_5813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5813, float3(0.0), isnan(_5813)), level(0.0)).x;
    float3 _5824 = float3(_1877, _1881, _1859);
    float4 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5824, float3(0.0), isnan(_5824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5824, float3(0.0), isnan(_5824)), level(0.0)).xyzw;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    float _1898 = _1890.w;
    float2 _5841 = float2(_1885, _1873);
    float3 _1902 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5841, float2(0.0), isnan(_5841)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5841, float2(0.0), isnan(_5841)), level(0.0)).xyz;
    float _1904 = _1902.x;
    float _1906 = _1902.y;
    float _1908 = _1902.z;
    float _1910 = float(uint(_853));
    float _1912 = trunc(_909);
    int _1914 = int(_1912);
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1918 = _1916 != 0;
    float _1920 = -_899;
    float _1922 = _1920 + 1.0;
    int _1924 = ~_853;
    int _1926 = _1924 + 1;
    float _1928 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1930 = _853 == 0;
    int _1932 = abs(_991);
    float _1934 = 1.0 / _1910;
    bool _1936 = _659 > 0.5;
    bool _1938 = !_1918;
    float _1940 = _1938 ? 7.345489978790283203125 : 1.0;
    float _1942 = exp2(_1928);
    float _1944 = float(uint(_1914));
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1948 = as_type<int>(_1934) + (-2);
    float _1950 = as_type<float>(_1948) * _1944;
    int _1952 = ~_853;
    int _1954 = _1952 + 1;
    float _1956 = -_1942;
    float _1958 = _1956 + 1.0;
    float _1960 = trunc(_1950);
    float _1962 = precise::max(_1960, 0.0);
    uint _1965 = uint(_1962);
    float _1967 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1969 = _1954 * int(_1965);
    int _1971 = _1969 + _1914;
    float _1973 = float(_1914);
    float _1975 = float(uint(_1971));
    float _1977 = as_type<float>(_1948) * _1975;
    float _1979 = _1940 * _183;
    bool _1981 = _1973 >= _895;
    bool _1983 = isnan(_1973);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(_895);
    bool _1989 = _1985 || _1987;
    float _1991 = float(_1989);
    float _1993 = trunc(_1977);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = floor(_1979);
    int _2001 = int(_1965) + int(_1997);
    float _2003 = trunc(_1991);
    int _2005 = int(_2003);
    int _2007 = _1926 * _2001;
    int _2009 = _2007 + _1914;
    float _2011 = -_1999;
    float _2013 = _1979 + _2011;
    float _2015 = 1.0 / _657;
    bool _2017 = uint(_2009) >= uint(_853);
    bool _2019 = !_2017;
    int _2021 = _2019 ? 0 : (-1);
    int _2023 = ~_2001;
    int _2025 = _2023 + _2021;
    int _2027 = _2025 + 1;
    float _2029 = _2013 * _895;
    int _2031 = _853 * _2027;
    int _2033 = _2031 + _1914;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2037 = _2035 != 0;
    float _2039 = _903 * _2015;
    int _2041 = ~_2005;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    float _2047 = trunc(_2029);
    int _2049 = int(_2047);
    bool _2051 = !_1930;
    int _2053 = _2051 ? _2033 : (-1);
    bool _2055 = !_2037;
    int _2057 = _2055 ? 0 : 1;
    int _2059 = _853 + (-1);
    int _2061 = _2053 * _2045;
    int _2063 = abs(_2057);
    float _2065 = trunc(_2039);
    int _2067 = int(_2065);
    int _2069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2071 = _2069 != 0;
    int _2073 = _2005 * _2059;
    int _2075 = _2073 + _2061;
    int _2077 = abs(_961);
    int _2079 = _2075 * _1932;
    bool _2081 = !_2071;
    int _2083 = _2081 ? 0 : 1;
    int _2085 = abs(_995);
    int _2087 = _2049 * _2063;
    int _2089 = _2087 + _1914;
    int _2091 = abs(_2083);
    int _2093 = _2067 * _2077;
    int _2095 = _2093 + _2079;
    float _2097 = float(uint(_2089));
    bool _2099 = _183 > 0.5;
    int _2101 = _2089 * _2085;
    int _2103 = _2101 + _2095;
    float _2105 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2107 = as_type<float>(_1948) * _2097;
    int _2109 = ~_853;
    int _2111 = _2109 + 1;
    int _2113 = _2049 * _2091;
    int _2115 = _2113 + _2103;
    int _2117 = ~_853;
    int _2119 = _2117 + 1;
    float _2121 = _2105 * _183;
    float _2123 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2125 = trunc(_2107);
    float _2127 = precise::max(_2125, 0.0);
    uint _2129 = uint(_2127);
    float _2131 = float(uint(_2115));
    float _2133 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2123);
    int _2135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2137 = _2135 != 0;
    float _2139 = as_type<float>(_1948) * _2131;
    float _2141 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2133);
    float _2143 = trunc(_2121);
    int _2145 = int(_2143);
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2149 = _2147 != 0;
    int _2151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2153 = _2151 != 0;
    float _2155 = -_1297;
    int _2157 = _2099 ? as_type<int>(_2155) : as_type<int>(_1297);
    bool _2159 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2161 = isnan(0.5);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2167 = _2163 || _2165;
    float _2169 = trunc(_2139);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    int _2175 = _2145 << 4;
    int _2177 = _2175 + 1968;
    int _2179 = _2177 + 8;
    uint _2181 = uint(int(uint(_2179) >> uint(2)));
    uint _2183 = uint(int(uint(int(_2181)) >> uint(2)));
    int _2185 = int(_2181) & 3;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[int(_2183)][_2185];
    int _2189 = _2119 * int(_2173);
    int _2191 = _2189 + _2115;
    float _2193 = float(uint(_2191));
    float _2195 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2197 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2199 = as_type<float>(_1948) * _2193;
    float _2201 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2195);
    uint _2203 = uint(int(uint(_2177) >> uint(2)));
    uint _2205 = uint(int(uint(int(_2203)) >> uint(2)));
    int _2207 = int(_2203) & 3;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[int(_2205)][_2207];
    int _2211 = int(_2203) + 1;
    uint _2213 = uint(int(uint(_2211) >> uint(2)));
    int _2215 = _2211 & 3;
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[int(_2213)][_2215];
    float _2219 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2201);
    float _2221 = trunc(_2199);
    float _2223 = precise::max(_2221, 0.0);
    uint _2225 = uint(_2223);
    float _2227 = _2219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2229 = !_2149;
    float _2231 = _2229 ? _1297 : as_type<float>(_2157);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2235 = _2227 + _2197;
    float _2237 = 1.0 / _2197;
    float _2239 = _2233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2241 = _2231 + 0.5;
    float _2243 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2245 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2247 = int(_2173) + int(_2225);
    float _2249 = _2245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2251 = _2111 * _2247;
    int _2253 = _2251 + _2115;
    int _2255 = _2111 * int(_2129);
    int _2257 = _2255 + _2089;
    float _2259 = _2235 * _2237;
    float _2261 = _2259 * 0.5;
    bool _2263 = uint(_2253) >= uint(_853);
    float _2265 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[80].x, _713);
    float _2267 = float(uint(_2257));
    float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2271 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2269);
    bool _2273 = !_2263;
    int _2275 = _2273 ? 0 : (-1);
    float _2277 = as_type<float>(_1948) * _2267;
    int _2279 = ~_2247;
    int _2281 = _2279 + _2275;
    int _2283 = _2281 + 1;
    float _2285 = 1.0 / _2271;
    float _2287 = -_1309;
    int _2289 = _1936 ? as_type<int>(_2287) : as_type<int>(_1309);
    float _2291 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2293 = ~_853;
    int _2295 = _2293 + 1;
    float _2297 = _2291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2299 = trunc(_2277);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _2209 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_66.x = _2297;
    out.m_66.y = _2249;
    out.m_66.z = _2239;
    out.m_66.w = _1946;
    int _2307 = int(_2129) + int(_2303);
    int _2309 = _853 * _2283;
    int _2311 = _2309 + _2115;
    float _2313 = _2305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2315 = _2217 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2317 = !_2153;
    float _2319 = _2317 ? _1309 : as_type<float>(_2289);
    float _2321 = _2187 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2323 = !_1930;
    int _2325 = _2323 ? _2311 : (-1);
    float _2327 = _2315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2329 = as_type<float>(_2115);
    float _2331 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2333 = _2285;
    float _2335 = _1869;
    float _2337 = _1892;
    float _2339 = _1894;
    float _2341 = _1813;
    if (!_2167)
    {
        _2329 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2343 = _2329;
    float _2345 = _2319 + (-0.5);
    int _2347 = _2325 >> 31;
    float _2349 = _2321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2351 = _2295 * _2307;
    int _2353 = _2351 + _2089;
    float _2355 = _2343;
    if (!_2167)
    {
        float _2357 = -_2343;
        float _2359 = _2357 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2331 = _2359;
    }
    float _2361 = _2331;
    int _2363 = _2347 & 3;
    float _2365 = -_2345;
    float _2367 = -_897;
    float _2369 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2367);
    out.m_68.x = _2313;
    out.m_68.y = _2327;
    out.m_68.z = _2349;
    float _2371 = _2345;
    if (!_2167)
    {
        float _2373 = 1.0 / _2361;
        _2371 = _2373;
    }
    float _2375 = _2371;
    int _2377 = _2325 + _2363;
    float _2379 = -_875;
    float _2381 = _2379 + 1.0;
    bool _2383 = uint(_2353) >= uint(_853);
    if (!_2167)
    {
        float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2387 = -_2343;
        float _2389 = fma(_2285, _2385, _2387);
        _2355 = _2389;
    }
    float _2391 = _2355;
    int _2393 = _2377 >> 2;
    float _2395 = -_2381;
    float _2397 = fma(_2231, _2395, _2265);
    float _2399 = fma(_2319, _1922, _2369);
    bool _2401 = !_2383;
    int _2403 = _2401 ? 0 : (-1);
    float _2405 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2407 = _2393 << 4;
    int _2409 = _2407 + 368;
    float _2411 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2413 = as_type<float>(_2393);
    if (_2167)
    {
        _2413 = 1.0;
    }
    float _2415 = _2413;
    out.m_70.x = _2397;
    out.m_70.y = _2399;
    uint _2417 = uint(int(uint(_2409) >> uint(2)));
    uint _2419 = uint(int(uint(int(_2417)) >> uint(2)));
    int _2421 = int(_2417) & 3;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[int(_2419)][_2421];
    int _2425 = int(_2417) + 1;
    uint _2427 = uint(int(uint(_2425) >> uint(2)));
    int _2429 = _2425 & 3;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[int(_2427)][_2429];
    float _2433 = -_1345;
    float _2435 = fma(_2433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2411);
    float _2437 = _2415;
    if (!_2167)
    {
        float _2439 = _2391 * _2375;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        _2437 = _2441;
    }
    float _2443 = _2437;
    int _2445 = ~_2307;
    int _2447 = _2445 + _2403;
    int _2449 = _2447 + 1;
    float _2451 = -_1345;
    float _2453 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2405);
    int _2455 = _2325 & 3;
    bool _2457 = _2455 != 0;
    float _2459 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2461 = _2325 & 3;
    bool _2463 = _2461 != 0;
    int _2465 = _2409 + 8;
    uint _2467 = uint(int(uint(_2465) >> uint(2)));
    uint _2469 = uint(int(uint(int(_2467)) >> uint(2)));
    int _2471 = int(_2467) & 3;
    float _2473 = (*spvDescriptorSet0.vp_c9)._m0[int(_2469)][_2471];
    int _2475 = int(_2467) + 1;
    uint _2477 = uint(int(uint(_2475) >> uint(2)));
    int _2479 = _2475 & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    int _2483 = _853 * _2449;
    int _2485 = _2483 + _2089;
    float _2487 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2489 = uint(_2455) > 1u;
    float _2491 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2493 = _2455 != 3;
    float _2495 = -_1345;
    float _2497 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2487);
    float _2499 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2501 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2503 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2491);
    float _2505 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2507 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2499);
    float _2509 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2501);
    int _2511 = _2463 ? 0 : 1;
    float _2513 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2515 = uint(_2455) >= 2u;
    float _2517 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2519 = ~_2511;
    int _2521 = _2519 + 1;
    int _2523 = _2521 + 1;
    float _2525 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2505);
    int _2527 = _2523;
    if (!_2489)
    {
        int _2529 = ~_2511;
        int _2531 = _2529 + 1;
        _2527 = _2531;
    }
    int _2533 = _2527;
    float _2535 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2513);
    int _2537 = _2515 ? 0 : 1;
    float _2539 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2517);
    bool _2541 = !_2457;
    int _2543 = _2541 ? 0 : 1;
    float _2545 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2507);
    int _2547 = abs(_2533);
    float _2549 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2503);
    int _2551 = ~_2537;
    int _2553 = _2551 + 1;
    int _2555 = _2553 + 1;
    float _2557 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2509);
    int _2559 = _2555;
    float _2561 = _2557;
    if (_2493)
    {
        int _2563 = ~_2537;
        int _2565 = _2563 + 1;
        _2559 = _2565;
    }
    int _2567 = _2559;
    float _2569 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2525);
    bool _2571 = _2455 != 3;
    float _2573 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2435);
    int _2575 = abs(_2543);
    float _2577 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2497);
    int _2579 = ~_2547;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    float _2585 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2453);
    int _2587 = abs(_2567);
    float _2589 = _2459 * _2573;
    bool _2591 = !_2571;
    int _2593 = _2591 ? 0 : (-1);
    int _2595 = _2583 * as_type<int>(_2431);
    int _2597 = ~_2575;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    float _2603 = fma(_2243, _2545, _2589);
    float _2605 = _1967 * _1887;
    int _2607 = abs(_2593);
    int _2609 = _2601 * as_type<int>(_2423);
    int _2611 = _2609 + _2595;
    bool _2613 = !_2137;
    int _2615 = _2613 ? 0 : 1;
    float _2617 = _1785 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2619 = ~_2587;
    int _2621 = _2619 + 1;
    int _2623 = _2621 + 1;
    float _2625 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2617);
    int _2627 = abs(_2615);
    int _2629 = _2623 * as_type<int>(_2473);
    int _2631 = _2629 + _2611;
    int _2633 = ~_2607;
    int _2635 = _2633 + 1;
    int _2637 = _2635 + 1;
    float _2639 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2625);
    float _2641 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2535);
    bool _2643 = !_1930;
    int _2645 = _2643 ? _2485 : (-1);
    int _2647 = _2637 * as_type<int>(_2481);
    int _2649 = _2647 + _2631;
    int _2651 = ~_2627;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    float _2657 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2539);
    float _2659 = _1908 * _2605;
    int _2661 = _2649 * _2655;
    float _2663 = _2459 * _2577;
    float _2665 = _2459 * _2585;
    float _2667 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2639);
    int _2669 = _2645 * _2627;
    int _2671 = _2669 + _2661;
    float _2673 = fma(_2243, _2549, _2663);
    float _2675 = fma(_2243, _2557, _2665);
    float _2677 = _2603;
    float _2679 = _2667;
    if (!_2167)
    {
        _2561 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2681 = _2561;
    float _2683 = _1898 * _2605;
    float _2685 = float(_2671);
    float _2687 = _2569 + _2603;
    float _2689 = _2685;
    if (!_2167)
    {
        float _2691 = -_2681;
        float _2693 = _2691 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2677 = _2693;
    }
    float _2695 = _2677;
    float _2697 = _2667 + _1813;
    float _2699 = fma(_1904, _2683, _1892);
    float _2701 = _2641 + _2673;
    out.gl_Position.x = _1857;
    out.gl_Position.y = _1869;
    out.gl_Position.z = _2667;
    out.gl_Position.w = _1813;
    float _2703 = _2697 * 0.5;
    float _2705 = _2695;
    if (!_2167)
    {
        float _2707 = 1.0 / _2695;
        _2705 = _2707;
    }
    float _2709 = _2705;
    float _2711 = _2657 + _2675;
    float _2713 = fma(_1906, _2683, _1894);
    float _2715 = fma(_1898, _2659, _1896);
    out.m_72.z = _2703;
    out.m_72.w = _1813;
    if (!_2167)
    {
        float _2717 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2719 = -_2681;
        float _2721 = fma(_2285, _2717, _2719);
        _2333 = _2721;
    }
    float _2723 = _2333;
    bool _2725 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2727 = isnan(_1621);
    bool _2729 = _2725 || _2727;
    bool _2731 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2733 = _2729 || _2731;
    out.m_74.x = _2687;
    out.m_74.y = _2701;
    out.m_74.z = _2711;
    float _2735 = -_1967;
    float _2737 = _2735 + 1.0;
    float _2739 = _2723;
    if (_2167)
    {
        _2335 = 1.0;
    }
    float _2741 = _2335;
    out.m_76.x = _2685;
    float _2743 = _1898 * _2737;
    float _2745 = _2741;
    if (!_2167)
    {
        float _2747 = _2723 * _2709;
        float _2749 = precise::clamp(_2747, 0.0, 1.0);
        _2739 = _2749;
    }
    float _2751 = _2739;
    if (!_2733)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2753 = _2337;
    out.m_78.x = _2699;
    out.m_78.y = _2713;
    out.m_78.z = _2715;
    out.m_78.w = _2743;
    float _2755 = _2753;
    float _2757 = _2753;
    if (!_2167)
    {
        float _2759 = -_2751;
        float _2761 = _2759 + 1.0;
        _2745 = _2761;
    }
    float _2763 = _2745;
    if (!_2733)
    {
        _2339 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2765 = _2339;
    float _2767 = _2765;
    float _2769 = _2765;
    if (!_2733)
    {
        _2689 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2771 = _2689;
    float _2773 = _2443 * _2763;
    float _2775 = _2773;
    float _2777 = _2771;
    float _2779 = _2771;
    if (!_2733)
    {
        _2341 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2781 = _2341;
    float _2783 = _2781;
    float _2785 = _2781;
    if (!_2733)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2787 = _2679;
    float _2789 = _2773 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2791 = _2787;
    float _2793 = _2787;
    if (!_2733)
    {
        _2775 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2795 = _2775;
    bool _2797 = !_2733;
    float _2799 = _2795;
    float _2801 = _2795;
    if (!_2797)
    {
        bool _2803 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2805 = isnan(_1621);
        bool _2807 = _2803 || _2805;
        bool _2809 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2811 = _2807 || _2809;
        if (!_2811)
        {
            float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2815 = _1621 + _2813;
            float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2819 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2817;
            float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2823 = _2821 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2825 = 1.0 / _2819;
            float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2829 = _2827 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2831 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2833 = _2831 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2837 = _2835 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2843 = _2815 * _2825;
            float _2845 = precise::clamp(_2843, 0.0, 1.0);
            float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2851 = fma(_2845, _2823, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2853 = fma(_2845, _2849, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2855 = fma(_2845, _2829, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2857 = fma(_2845, _2833, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2859 = fma(_2845, _2837, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2861 = fma(_2845, _2841, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2769 = _2851;
            _2793 = _2859;
            _2757 = _2855;
            _2785 = _2857;
            _2779 = _2853;
            _2801 = _2861;
            _2863 = true;
        }
        else
        {
            bool _2865 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2867 = isnan(_1621);
            bool _2869 = _2865 || _2867;
            bool _2871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2873 = _2869 || _2871;
            if (!_2873)
            {
                _2755 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2875 = _2755;
            _2757 = _2875;
            if (!_2873)
            {
                _2767 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2877 = _2767;
            _2769 = _2877;
            if (!_2873)
            {
                _2777 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2879 = _2777;
            _2779 = _2879;
            if (!_2873)
            {
                _2783 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2881 = _2783;
            _2785 = _2881;
            if (!_2873)
            {
                _2791 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2883 = _2791;
            _2793 = _2883;
            if (!_2873)
            {
                _2799 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2885 = _2799;
            bool _2887 = !_2873;
            _2801 = _2885;
            if (!_2887)
            {
                bool _2889 = _1621 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2891 = isnan(_1621);
                bool _2893 = _2889 || _2891;
                bool _2895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2897 = _2893 || _2895;
                if (!_2897)
                {
                    float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2901 = _1621 + _2899;
                    float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2905 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2903;
                    float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2911 = 1.0 / _2905;
                    float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2919 = _2917 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2921 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2925 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2929 = _2901 * _2911;
                    float _2931 = precise::clamp(_2929, 0.0, 1.0);
                    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2935 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2937 = fma(_2931, _2909, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2939 = fma(_2931, _2935, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2941 = fma(_2931, _2915, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2943 = fma(_2931, _2919, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2945 = fma(_2931, _2923, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2947 = fma(_2931, _2927, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2769 = _2937;
                    _2793 = _2945;
                    _2757 = _2941;
                    _2785 = _2943;
                    _2779 = _2939;
                    _2801 = _2947;
                    _2863 = true;
                }
                else
                {
                    _2769 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2793 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2757 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2785 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2779 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2801 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2863 = false;
    float _2949 = _2769;
    float _2951 = _2793;
    float _2953 = _2757;
    float _2955 = _2785;
    float _2957 = _2779;
    float _2959 = _2801;
    float _2961 = fma(_2701, -0.5, 0.5);
    float _2963 = precise::clamp(_2961, 0.0, 1.0);
    float _2965 = -_2949;
    float _2967 = _2965 + _2951;
    float _2969 = -_2953;
    float _2971 = _2969 + _2955;
    out.m_80.x = 0.0;
    float _2973 = -_2957;
    float _2975 = _2973 + _2959;
    float _2977 = fma(_2963, _2967, _2949);
    float _2979 = fma(_2963, _2971, _2953);
    bool _2981 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2983 = _2977 * 0.586610972881317138671875;
    float _2985 = fma(_2963, _2975, _2957);
    float _2987 = _2789 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2989 = fma(_2979, 0.298911988735198974609375, _2983);
    bool _2991 = _2443 > 0.0;
    bool _2993 = isnan(_2443);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan(0.0);
    bool _2999 = _2995 || _2997;
    float _3001 = fma(_2985, 0.114477999508380889892578125, _2989);
    out.m_47.x = _2987;
    bool _3003 = _2763 <= 0.0;
    bool _3005 = !_2999;
    bool _3007 = _3003 || _3005;
    float _3009 = -_3001;
    float _3011 = _2977 + _3009;
    float _3013 = -_3001;
    float _3015 = _2979 + _3013;
    float _3017 = fma(_3011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3001);
    float _3019 = -_3001;
    float _3021 = _2985 + _3019;
    float _3023 = fma(_3015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3001);
    float _3025 = fma(_3021, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3001);
    bool _3027 = !_2981;
    if (!_3027)
    {
        float _3029 = -_1585;
        float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3033 = -_1587;
        float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3037 = -_1589;
        float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3041 = _3031 * _3031;
        float _3043 = fma(_3035, _3035, _3041);
        float _3045 = fma(_3039, _3039, _3043);
        float _3047 = sqrt(_3045);
        float _3049 = rsqrt(_3045);
        float _3051 = -_3047;
        float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3055 = _3053 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3057 = precise::clamp(_3055, 0.0, 1.0);
        float _3059 = _3035 * _3049;
        float _3061 = _3031 * _3049;
        float _3063 = abs(_3057);
        float _3065 = log2(_3063);
        float _3067 = _3039 * _3049;
        float _3069 = _3059 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3071 = _2701 * _3061;
        float _3073 = -_3061;
        float _3075 = -_3069;
        float _3077 = fma(_3073, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3075);
        float _3079 = fma(_2687, _3059, _3071);
        float _3081 = -_3067;
        float _3083 = fma(_3081, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3077);
        float _3085 = fma(_2711, _3067, _3079);
        float _3087 = precise::clamp(_3085, 0.0, 1.0);
        float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3091 = _3083 + _3089;
        float _3093 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3095 = _3091 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3097 = precise::clamp(_3095, 0.0, 1.0);
        float _3099 = exp2(_3093);
        float _3101 = _3099 * _3097;
        float _3103 = _3087 * _3101;
        float _3105 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3107 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3109 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_80.x = _3105;
        out.m_80.y = _3107;
        out.m_80.z = _3109;
    }
    out.m_82.x = _3023;
    out.m_82.y = _3017;
    out.m_82.z = _3025;
    if (!_3007)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3111 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3111;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

