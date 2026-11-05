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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2210 = false;
    bool _433 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_121);
        out.gl_Position.z = _2499;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    if (_135)
    {
        float _143 = float(_105);
        _141 = _143;
    }
    float _145 = _141;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_151)
    {
        out.m_47.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2567 = as_type<float>(_157);
        out.gl_Position.z = _2567;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    float _187 = 0.0;
    float _189 = _161;
    if (!_173)
    {
        float _191 = _161 * _161;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    int _203 = as_type<int>(_159) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_159) & 2;
    bool _209 = _207 != 0;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_173;
    float _221 = _201;
    bool _223 = _173;
    bool _225 = false;
    if (!_219)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _161 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _161);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _255;
    }
    float _257 = _221;
    bool _259 = !_173;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _161 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _189 = _279;
    }
    float _281 = _189;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _285 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _291 = fma(_281, _175, _285);
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_291, _163, _181);
    float _299 = fma(_293, _163, _183);
    float _301 = fma(_295, _163, _185);
    bool _303 = !_283;
    float _321;
    if (!_303)
    {
        float _305 = in.m_56.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = in.m_54.x;
    float _339 = in.m_54.y;
    bool _341 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _343 = isnan(_331);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _353;
    bool _357 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _359 = isnan(_331);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = 1.0 / _355;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _381 = _367 * _371;
    float _383 = -_367;
    float _385 = _383 + 1.0;
    float _387 = _335 * _377;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _389;
    float _393 = fma(_375, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _393 * _381;
    float _399 = _395 * _381;
    float _401 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _403 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].x, _401);
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].y, _403);
    float _409 = _405 * _337;
    float _411 = _407 * _339;
    bool _413 = !_379;
    float _431;
    if (!_413)
    {
        float _415 = in.m_56.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_105);
        float _437 = 1.0 / _435;
        float _439 = _139 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    float _443 = in.m_58.x;
    float _445 = in.m_58.y;
    float _447 = in.m_58.z;
    float _449 = in.m_58.w;
    float _451 = in.m_56.w;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _459 = _457 != 0;
    float _461 = in.m_60.x;
    float _463 = in.m_60.y;
    float _465 = in.m_60.z;
    float _467 = in.m_60.w;
    float _469 = in.m_62.x;
    float _471 = in.m_62.y;
    float _473 = in.m_62.z;
    float _475 = in.m_62.w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _479 = _477 != 0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _485 = 0.0;
    float _487 = _483;
    if (_455)
    {
        float _489 = in.m_56.x;
        _485 = _489;
    }
    float _491 = _485;
    float _493 = 0.0;
    if (_459)
    {
        float _495 = in.m_56.w;
        _493 = _495;
    }
    float _497 = _493;
    float _499 = _299 * _445;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _505 = _451 > 0.5;
    float _507 = 1.0 / _503;
    float _509 = fma(_297, _443, _499);
    float _511 = _299 * _463;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _515 = fma(_301, _447, _509);
    bool _517 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _519 = isnan(_441);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = _299 * _471;
    float _531 = 1.0 / _483;
    float _533 = fma(_297, _461, _511);
    float _535 = fma(_297, _469, _529);
    float _537 = fma(_301, _465, _533);
    float _539 = fma(_301, _473, _535);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _553 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _555 = isnan(_441);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = 1.0 / _543;
    float _567 = _503;
    float _569 = _547;
    int _571 = as_type<int>(_475);
    float _573 = _467;
    float _575 = _449;
    if (_459)
    {
        float _577 = _497 * 3.1415927410125732421875;
        _567 = _577;
    }
    float _579 = _567;
    float _581 = _551 * _507;
    out.m_64.w = _513;
    float _583 = _547 * _531;
    float _585 = _531;
    if (_455)
    {
        float _587 = _491 * 3.1415927410125732421875;
        _569 = _587;
    }
    float _589 = _569;
    float _591 = -_563;
    float _593 = _591 + 1.0;
    if (_459)
    {
        float _595 = _579 * 0.15915493667125701904296875;
        _487 = _595;
    }
    float _597 = _487;
    bool _599 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_441);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    if (_455)
    {
        float _611 = _589 * 0.15915493667125701904296875;
        _585 = _611;
    }
    float _613 = _585;
    float _615 = _527 * _593;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _617;
    float _621 = _589;
    float _623 = _593;
    if (_479)
    {
        float _625 = in.m_56.x;
        float _627 = in.m_56.y;
        _621 = _625;
        _623 = _627;
    }
    float _629 = _621;
    float _631 = _623;
    float _633 = _597;
    if (_459)
    {
        float _635 = _597 * 6.283185482025146484375;
        float _637 = sin(_635);
        _633 = _637;
    }
    float _639 = _633;
    float _641 = -_527;
    float _643 = _641 + 1.0;
    bool _645 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _647 = isnan(_441);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _619 * _565;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _441 + _659;
    float _663 = -_609;
    float _665 = _663 + 1.0;
    float _667 = _609 * _643;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _441 + _669;
    float _673 = _613;
    float _675 = _643;
    if (_455)
    {
        float _677 = _613 * 6.283185482025146484375;
        float _679 = sin(_677);
        _673 = _679;
    }
    float _681 = _673;
    float _683 = fma(_583, _661, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _685 = _655 * _665;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _689 = _441 + _687;
    float _691 = fma(_581, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _693 = _537 + _467;
    float _695 = _683 * _685;
    float _697 = -_655;
    float _699 = _697 + 1.0;
    float _701 = fma(_657, _689, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _703 = _515 + _449;
    float _705 = _539 + _475;
    float _707 = _695;
    if (_459)
    {
        bool _709 = _639 > 0.5;
        _223 = _709;
    }
    bool _711 = _223;
    float _713 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    if (_479)
    {
        _571 = 0;
    }
    int _715 = _571;
    int _717 = _715;
    if (_455)
    {
        bool _719 = _681 > 0.5;
        _225 = _719;
    }
    bool _721 = _225;
    float _723 = _629;
    float _725 = _631;
    if (_479)
    {
        _573 = _629;
    }
    float _727 = _573;
    float _729 = _727;
    if (_479)
    {
        _575 = _631;
    }
    float _731 = _575;
    float _733 = _731;
    if (!_479)
    {
        float _735 = in.m_56.x;
        float _737 = in.m_56.y;
        float _739 = _735 * 3.1415927410125732421875;
        float _741 = _739 * 0.15915493667125701904296875;
        float _743 = _737 * 3.1415927410125732421875;
        float _745 = _743 * 0.15915493667125701904296875;
        float _747 = _741 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = _745 * 6.283185482025146484375;
        float _753 = sin(_751);
        _723 = _735;
        _725 = _737;
        _717 = 1;
        _729 = _749;
        _733 = _753;
    }
    float _755 = _723;
    float _757 = _725;
    int _759 = _717;
    float _761 = _729;
    float _763 = _733;
    float _765 = _755;
    if (!_459)
    {
        _675 = _213;
    }
    float _767 = _675;
    float _769 = in.m_56.z;
    float _771 = _767;
    if (_459)
    {
        float _773 = -_213;
        float _775 = _711 ? _773 : _213;
        _771 = _775;
    }
    float _777 = _771;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _781 = _755 > 0.5;
    float _783 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _785 = _757 > 0.5;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _791 = _789 != 0;
    float _793 = fma(_691, _667, _713);
    float _795 = -_213;
    int _797 = _781 ? as_type<int>(_795) : as_type<int>(_213);
    float _799 = -_787;
    float _801 = fma(_783, 2.0, _799);
    float _803 = _793;
    if (!_455)
    {
        _707 = _217;
    }
    float _805 = _707;
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _809 = _805;
    if (_455)
    {
        float _811 = -_217;
        float _813 = _721 ? _811 : _217;
        _809 = _813;
    }
    float _815 = _809;
    float _817 = -_139;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[76].x, _801);
    bool _821 = _759 != 1;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _825 = _823 != 0;
    float _827 = -_217;
    int _829 = _785 ? as_type<int>(_827) : as_type<int>(_217);
    float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _833 = !_791;
    float _835 = _833 ? _213 : as_type<float>(_797);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _839 = _837 != 0;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _843 = _841 != 0;
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _847 = !_825;
    float _849 = _847 ? _217 : as_type<float>(_829);
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _855 = _853 != 0;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _859 = _857 != 0;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _863 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[93].z, _851);
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _867 = _761 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _869 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[93].w, _861);
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _875 = _757 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _877 = _763 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _879 = -_865;
    float _881 = fma(_867, 2.0, _879);
    float _883 = _779 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _885 = fma(_875, -2.0, _871);
    float _887 = _865;
    float _889 = _883;
    float _891 = _815;
    if (!_821)
    {
        _887 = _769;
    }
    float _893 = _887;
    float _895 = fma(_877, -2.0, _873);
    float _897 = -_139;
    float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[91].x, _881);
    float _901 = _777 + 0.5;
    float _903 = fma(_701, _615, _793);
    float _905 = _893;
    float _907 = _899;
    if (!_821)
    {
        _803 = _893;
    }
    float _909 = _803;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _913 = _909;
    if (_821)
    {
        _905 = _769;
    }
    float _915 = _905;
    float _917 = fma(_883, _901, _899);
    float _919 = _807 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _921 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _895);
    if (!_821)
    {
        _907 = _757;
    }
    float _923 = _907;
    float _925 = _815 + (-0.5);
    float _927 = _923;
    if (!_821)
    {
        _889 = _757;
    }
    float _929 = _889;
    float _931 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].z, _911);
    float _933 = _929;
    if (_821)
    {
        _927 = _755;
    }
    float _935 = _927;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_821)
    {
        _933 = _755;
    }
    float _939 = _933;
    float _941 = -_919;
    float _943 = -_921;
    float _945 = fma(_941, _925, _943);
    if (_821)
    {
        _765 = _915;
    }
    float _947 = _765;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _951 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[118].x, _903);
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _955 = _703 + _953;
    float _957 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[84].z, _937);
    float _959 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[83].z, _949);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _963 = _693 + _961;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _967 = _955 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _969 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[84].x, _957);
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_821)
    {
        _971 = _909;
    }
    float _973 = _971;
    float _975 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[78].w, _965);
    float _977 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[28].x, _967);
    float _979 = _969 * (-0.15915493667125701904296875);
    float _981 = _831 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _983 = _835 + 0.5;
    float _985 = _973;
    if (_821)
    {
        _985 = _757;
    }
    float _987 = _985;
    float _989 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _885);
    if (_821)
    {
        _913 = _757;
    }
    float _991 = _913;
    float _993 = fma(_981, _983, _819);
    float _995 = _979 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1001 = _849 + (-0.5);
    float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1005 = _705 + _1003;
    float _1007 = _935 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1009 = -_999;
    float _1011 = -_989;
    float _1013 = fma(_1009, _1001, _1011);
    float _1015 = -_217;
    int _1017 = _505 ? as_type<int>(_1015) : as_type<int>(_217);
    float _1019 = _979 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    bool _1023 = _915 > 0.5;
    float _1025 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[28].z, _977);
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1029 = !_843;
    float _1031 = _1029 ? _217 : as_type<float>(_1017);
    float _1033 = _987 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1035 = -_213;
    int _1037 = _1023 ? as_type<int>(_1035) : as_type<int>(_213);
    float _1039 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _869);
    float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1043 = _1025 >= 0.0;
    float _1045 = -_1027;
    float _1047 = fma(_1007, 2.0, _1045);
    float _1049 = _1031 * _997;
    float _1051 = -_139;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1047);
    bool _1055 = !_839;
    float _1057 = _1055 ? _213 : as_type<float>(_1037);
    float _1059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1065 = _1031 * _1021;
    float _1067 = -_1049;
    float _1069 = fma(_1057, _1021, _1067);
    float _1071 = -_213;
    int _1073 = _785 ? as_type<int>(_1071) : as_type<int>(_213);
    float _1075 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1061);
    float _1077 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _975);
    float _1079 = fma(_1033, -2.0, _1063);
    float _1081 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _863);
    float _1083 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1085 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _931);
    float _1087 = _1069 + 0.5;
    float _1089 = fma(_1057, _997, _1065);
    bool _1091 = !_855;
    float _1093 = _1091 ? _213 : as_type<float>(_1073);
    float _1095 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _959);
    float _1097 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1075);
    float _1099 = fma(_1083, _1087, _1053);
    float _1101 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1079);
    float _1103 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1105 = _1089 + (-0.5);
    float _1107 = _1093 + 0.5;
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1111 = -_1081;
    float _1113 = _1111 + 1.0;
    float _1115 = -_1103;
    float _1117 = -_1101;
    float _1119 = fma(_1115, _1105, _1117);
    float _1121 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1123 = _955 * _955;
    float _1125 = -_217;
    int _1127 = _1023 ? as_type<int>(_1125) : as_type<int>(_217);
    float _1129 = -_1113;
    float _1131 = fma(_1129, _777, _917);
    float _1133 = -_1085;
    float _1135 = _1133 + 1.0;
    float _1137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1139 = fma(_963, _963, _1123);
    bool _1141 = !_859;
    float _1143 = _1141 ? _217 : as_type<float>(_1127);
    float _1145 = -_1039;
    float _1147 = _1145 + 1.0;
    float _1149 = -_1135;
    float _1151 = fma(_835, _1149, _993);
    float _1153 = fma(_1005, _1005, _1139);
    float _1155 = -_1095;
    float _1157 = _1155 + 1.0;
    float _1159 = -_1143;
    float _1161 = _1159 + 0.5;
    float _1163 = fma(_1147, _815, _945);
    float _1165 = rsqrt(_1153);
    float _1167 = _1121 * _1109;
    float _1169 = -_1077;
    float _1171 = _1169 + 1.0;
    if (_1043)
    {
        _891 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1173 = _891;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1177 = -_1097;
    float _1179 = _1177 + 1.0;
    float _1181 = fma(_849, _1171, _1013);
    float _1183 = _951 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1185 = _1175 * _1137;
    int _1187 = as_type<int>(_1173);
    if (_1043)
    {
        float _1189 = _1173 * 5.0;
        _1187 = as_type<int>(_1189);
    }
    int _1191 = _1187;
    float _1193 = -_1157;
    float _1195 = fma(_1069, _1193, _1099);
    float _1197 = fma(_1089, _1179, _1119);
    out.m_66.x = _1131;
    out.m_66.y = _1163;
    float _1199 = _955 * _1165;
    out.m_68.w = _1183;
    float _1201 = _963 * _1165;
    if (_1043)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4214 = as_type<float>(_1191);
        out.gl_Position.z = _4214;
    }
    out.m_70.x = _1167;
    out.m_70.y = _1185;
    out.m_72.x = _1151;
    out.m_72.y = _1181;
    out.m_72.z = _1195;
    out.m_72.w = _1197;
    if (_1043)
    {
        out.m_47.x = 0.0;
    }
    if (_1043)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1203 = -_1199;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    float _1207 = _1005 * _1165;
    float _1209 = -_1201;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1213 = -_1199;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1219 = _1205 + _1217;
    float _1221 = -_1207;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1227 = _1211 + _1225;
    float _1229 = -_1201;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1237 = _1223 + _1235;
    float _1239 = _1215 * _1215;
    float _1241 = -_1207;
    float _1243 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1005);
    float _1245 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1233);
    float _1247 = fma(_1231, _1231, _1239);
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1245);
    float _1251 = fma(_1243, _1243, _1247);
    bool _1253 = _1249 >= 0.0;
    float _1255 = sqrt(_1251);
    float _1257 = _1249;
    float _1259 = _1219;
    float _1261 = _1227;
    float _1263 = _1211;
    float _1265 = _1223;
    if (_1253)
    {
        _1257 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1267 = _1257;
    int _1269 = as_type<int>(_1267);
    if (_1253)
    {
        out.m_47.x = 0.0;
    }
    if (_1253)
    {
        float _1271 = _1267 * 5.0;
        _1269 = as_type<int>(_1271);
    }
    int _1273 = _1269;
    float _1275 = _1165 * _1255;
    if (_1253)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4362 = as_type<float>(_1273);
        out.gl_Position.z = _4362;
    }
    if (_1253)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1277 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1279 = _409 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _1285 = _1275 * _1277;
    float _1287 = _1275 * _1279;
    float _1289 = _1281 * _1285;
    float _1291 = _1283 * _1287;
    float _1293 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1295 = _1293 * 0.5;
    bool _1297 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1305 = _1301 || _1303;
    float _1307 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1311 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1313 = isnan(0.5);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1319 = _1315 || _1317;
    float _1321 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1307);
    float _1323 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1325 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1309);
    float _1327 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1321);
    float _1329 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1323);
    float _1331 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1325);
    float _1333 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1335 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1329);
    float _1337 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1339 = _705 + _1333;
    float _1341 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1343 = _693 + _1337;
    float _1345 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1349 = _1339 + _1347;
    float _1351 = 1.0 / _1341;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1355 = _1343 + _1353;
    float _1357 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1359 = _1349 * _1349;
    float _1361 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1357);
    float _1363 = fma(_1355, _1355, _1359);
    float _1365 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1367 = sqrt(_1363);
    float _1369 = _1365 + _1341;
    float _1371 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1373 = _1369 * _1351;
    float _1375 = _1373 * 0.5;
    float _1377 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1371);
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1381 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1379);
    float _1383 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1377);
    bool _1385 = _1367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1387 = 1.0 / _1381;
    float _1389 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1391 = _703 + _1389;
    float _1393 = _1375;
    float _1395 = _1295;
    float _1397 = _1343;
    float _1399 = _1389;
    if (!_1385)
    {
        _1393 = _1339;
    }
    float _1401 = _1393;
    float _1403 = _1401;
    if (!_1385)
    {
        _1395 = _1391;
    }
    float _1405 = _1395;
    bool _1407 = !_1385;
    float _1409 = _1405;
    if (!_1407)
    {
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1415 = _1367 + _1413;
        float _1417 = _1391 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1419 = _1415 * _1411;
        float _1421 = rsqrt(_1363);
        float _1423 = _1419 * 0.15915493667125701904296875;
        float _1425 = _1423 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = _1423 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1427 + (-1.0);
        float _1435 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1437 = fma(_1431, _1417, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1439 = fma(_1391, _1427, _1435);
        float _1441 = _1421 * _1437;
        float _1443 = fma(_1355, _1441, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1445 = fma(_1349, _1441, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1397 = _1443;
        _1409 = _1439;
        _1403 = _1445;
        _1399 = _1441;
    }
    float _1447 = _1397;
    float _1449 = _1409;
    float _1451 = _1403;
    float _1453 = _1399;
    float _1455 = -_1201;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1447);
    float _1459 = -_1199;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1449);
    float _1463 = -_1207;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1467 = _1453;
    float _1469 = _1461;
    float _1471 = _1457;
    float _1473 = _1465;
    float _1475 = _1447;
    if (_1319)
    {
        _1467 = 1.0;
    }
    float _1477 = _1467;
    float _1479 = _1477;
    if (!_1305)
    {
        float _1481 = _1219 * _1219;
        float _1483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1485 = -_705;
        float _1487 = _1485 + _1451;
        float _1489 = -_703;
        float _1491 = _1489 + _1449;
        float _1493 = fma(_1227, _1227, _1481);
        float _1495 = fma(_1237, _1237, _1493);
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1499 = sqrt(_1495);
        float _1501 = 1.0 / _1275;
        float _1503 = precise::min(_1499, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1505 = _1503 * _1483;
        float _1507 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1509 = _1505 * _1501;
        float _1511 = -_693;
        float _1513 = _1511 + _1447;
        float _1515 = _1507 * _1509;
        float _1517 = _1487 * _1509;
        float _1519 = fma(_1513, _1515, _1211);
        float _1521 = fma(_1491, _1515, _1205);
        float _1523 = fma(_1507, _1517, _1223);
        _1259 = _1507;
        _1469 = _1521;
        _1471 = _1519;
        _1473 = _1523;
    }
    float _1525 = _1259;
    float _1527 = _1469;
    float _1529 = _1471;
    float _1531 = _1473;
    float _1533 = _1525;
    if (_1319)
    {
        _1261 = 1.0;
    }
    float _1535 = _1261;
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1539 = _1387 * _1537;
    float _1541 = _1535;
    if (!_1319)
    {
        float _1543 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1545 = _1543 * 0.15915493667125701904296875;
        float _1547 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = _1545 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1547 * 0.15915493667125701904296875;
        float _1555 = _1545 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = 1.0 / _1551;
        float _1561 = _1553 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = _1557 * _1559;
        float _1567 = _1553 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1563 * _1565;
        float _1573 = 1.0 / _1571;
        float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1577 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1575;
        float _1579 = 1.0 / _1577;
        float _1581 = _1569 * _1573;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = fma(_1539, _1581, _1583);
        float _1587 = _1585 * _1579;
        float _1589 = precise::clamp(_1587, 0.0, 1.0);
        _1533 = _1545;
        _1263 = _1553;
        _1479 = _1589;
    }
    float _1591 = _1533;
    float _1593 = _1263;
    float _1595 = _1479;
    float _1597 = _1591;
    float _1599 = _1593;
    if (!_1319)
    {
        float _1601 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = _1601 * 0.15915493667125701904296875;
        float _1605 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1607 = _1603 * 6.283185482025146484375;
        float _1609 = cos(_1607);
        float _1611 = _1605 * 0.15915493667125701904296875;
        float _1613 = _1603 * 6.283185482025146484375;
        float _1615 = sin(_1613);
        float _1617 = 1.0 / _1609;
        float _1619 = _1611 * 6.283185482025146484375;
        float _1621 = cos(_1619);
        float _1623 = _1615 * _1617;
        float _1625 = _1611 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = _1621 * _1623;
        float _1631 = 1.0 / _1629;
        float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1635 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1633;
        float _1637 = 1.0 / _1635;
        float _1639 = _1627 * _1631;
        float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1643 = fma(_1539, _1639, _1641);
        float _1645 = _1643 * _1637;
        float _1647 = precise::clamp(_1645, 0.0, 1.0);
        float _1649 = -_1647;
        float _1651 = _1649 + 1.0;
        _1597 = _1617;
        _1599 = _1629;
        _1541 = _1651;
    }
    float _1653 = _1597;
    float _1655 = _1599;
    float _1657 = _1541;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1661 = _1527 + _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1665 = _1529 + _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1669 = _1531 + _1667;
    float _1671 = _1661 * _1661;
    float _1673 = fma(_1665, _1665, _1671);
    float _1675 = fma(_1669, _1669, _1673);
    float _1677 = rsqrt(_1675);
    float _1679 = sqrt(_1675);
    float _1681 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1683 = _1665 * _1681;
    float _1685 = _1669 * _1681;
    float _1687 = _1683 * _1683;
    float _1689 = _1685 * _1685;
    float _1691 = _1687 + _1689;
    float _1693 = sqrt(_1691);
    bool _1695 = _1693 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1699 = _1693 + _1697;
    float _1701 = _1653;
    float _1703 = _1699;
    float _1705 = _1661;
    float _1707 = _1683;
    if (_1695)
    {
        float _1709 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1709;
    }
    float _1711 = _1701;
    float _1713 = _1711;
    if (_1695)
    {
        float _1715 = _1699 * _1711;
        _1703 = _1715;
    }
    float _1717 = _1703;
    if (_1695)
    {
        float _1719 = rsqrt(_1691);
        _1713 = _1719;
    }
    float _1721 = _1713;
    float _1723 = _1721;
    if (_1695)
    {
        float _1725 = _1717 * 0.15915493667125701904296875;
        _1265 = _1725;
    }
    float _1727 = _1265;
    float _1729 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1731 = _1669;
    if (_1695)
    {
        float _1733 = _1727 * 6.283185482025146484375;
        float _1735 = sin(_1733);
        _1731 = _1735;
    }
    float _1737 = _1731;
    float _1739 = precise::max(0.0, _1729);
    float _1741 = _1655;
    float _1743 = _1739;
    if (_1695)
    {
        float _1745 = _1727 * 6.283185482025146484375;
        float _1747 = cos(_1745);
        _1741 = _1747;
    }
    float _1749 = _1741;
    float _1751 = -_1681;
    float _1753 = -_1739;
    float _1755 = fma(_1661, _1751, _1753);
    if (_1695)
    {
        float _1757 = _1755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1705 = _1757;
    }
    float _1759 = _1705;
    float _1761 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1763 = _1737;
    float _1765 = _1759;
    if (_1695)
    {
        float _1767 = fma(_1737, _1759, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1763 = _1767;
    }
    float _1769 = _1763;
    float _1771 = _1769;
    if (!_1695)
    {
        _1765 = _1755;
    }
    float _1773 = _1765;
    float _1775 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1777 = _1773;
    if (_1695)
    {
        float _1779 = _1721 * _1769;
        _1475 = _1779;
    }
    float _1781 = _1475;
    if (!_1695)
    {
        _1771 = _1687;
    }
    float _1783 = _1771;
    float _1785 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1775);
    float _1787 = _1783;
    float _1789 = _1749;
    if (_1695)
    {
        float _1791 = _1749 + (-1.0);
        _1743 = _1791;
    }
    float _1793 = _1743;
    float _1795 = _1793;
    if (_1695)
    {
        float _1797 = _1683 * _1781;
        _1707 = _1797;
    }
    float _1799 = _1707;
    float _1801 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1785);
    if (_1695)
    {
        float _1803 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1803;
    }
    float _1805 = _1723;
    if (!_1695)
    {
        _1795 = _1685;
    }
    float _1807 = _1795;
    float _1809 = _1807;
    if (_1695)
    {
        float _1811 = _1685 * _1781;
        _1809 = _1811;
    }
    float _1813 = _1809;
    if (_1695)
    {
        float _1815 = _1799 * _1799;
        _1787 = _1815;
    }
    float _1817 = _1787;
    if (_1695)
    {
        float _1819 = fma(_1755, _1749, _1805);
        _1777 = _1819;
    }
    float _1821 = _1777;
    if (!_1695)
    {
        _1789 = _1689;
    }
    float _1823 = _1789;
    float _1825 = _1823;
    if (_1695)
    {
        float _1827 = _1813 * _1813;
        _1825 = _1827;
    }
    float _1829 = _1825;
    float _1831 = fma(_1821, _1821, _1817);
    float _1833 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1835 = _1831 + _1829;
    float _1837 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1833);
    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1841 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1839);
    float _1843 = precise::clamp(_1841, 0.0, 1.0);
    float _1845 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1847 = rsqrt(_1835);
    float _1849 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1837);
    float _1851 = -_1843;
    float _1853 = _1851 + 1.0;
    float _1855 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1857 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1845);
    float _1859 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1861 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1855);
    float _1863 = abs(_1853);
    float _1865 = log2(_1863);
    float _1867 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1857);
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1871 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1861);
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1875 = -_1869;
    float _1877 = fma(_1875, _1761, 1.0);
    float _1879 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1881 = _1847 * _1799;
    float _1883 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1885 = _1847 * _1821;
    float _1887 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1889 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1891 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1883);
    float _1893 = _1847 * _1813;
    float _1895 = log2(_1877);
    float _1897 = -_1889;
    float _1899 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1897);
    float _1901 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1903 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1891);
    float _1905 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1907 = -_1893;
    float _1909 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1899);
    float _1911 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1913 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1903);
    float _1915 = exp2(_1901);
    float _1917 = fma(_1909, -0.5, 0.5);
    float _1919 = fma(_1909, 0.5, 0.5);
    float _1921 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1911);
    float _1923 = _1885 + 1.0;
    float _1925 = fma(_1919, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1927 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1921);
    float _1929 = 1.0 / _1913;
    float _1931 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1905);
    float _1933 = fma(_1919, _1925, -0.212114393711090087890625);
    float _1935 = _1895 * 0.693147182464599609375;
    float _1937 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1931);
    float _1939 = fma(_1919, _1933, 1.570728778839111328125);
    float _1941 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1943 = sqrt(_1917);
    float _1945 = -_1885;
    float _1947 = fma(_1915, _1923, _1945);
    float _1949 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1927);
    float _1951 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1937);
    float _1953 = fma(_1947, 0.5, 0.5);
    float _1955 = _1949 * _1929;
    float _1957 = _1951 * _1929;
    float _1959 = fma(_1955, 0.5, 0.5);
    float _1961 = fma(_1957, -0.5, 0.5);
    float _1963 = _1943 * 0.636619746685028076171875;
    float3 _5450 = float3(_1959, _1961, _1941);
    float _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5450, float3(0.0), isnan(_5450)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5450, float3(0.0), isnan(_5450)), level(0.0)).x;
    float _1967 = -_1939;
    float _1969 = fma(_1963, _1967, 1.0);
    float3 _5466 = float3(_1959, _1961, _1941);
    float4 _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5466, float3(0.0), isnan(_5466)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5466, float3(0.0), isnan(_5466)), level(0.0)).xyzw;
    float _1974 = _1972.x;
    float _1976 = _1972.y;
    float _1978 = _1972.z;
    float _1980 = _1972.w;
    float2 _5483 = float2(_1969, _1953);
    float3 _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5483, float2(0.0), isnan(_5483)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5483, float2(0.0), isnan(_5483)), level(0.0)).xyz;
    float _1986 = _1984.x;
    float _1988 = _1984.y;
    float _1990 = _1984.z;
    float _1992 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1994 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1996 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1998 = fma(_1992, _1992, 1.0);
    float _2000 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1994);
    float _2002 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2004 = exp2(_2002);
    bool _2006 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2008 = isnan(_1679);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2014 = _2010 || _2012;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2016 = rsqrt(_1998);
    float _2018 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2000);
    float _2020 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2022 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2018);
    float _2024 = _1949 + _1913;
    float _2026 = -_2004;
    float _2028 = _2026 + 1.0;
    float _2030 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2032 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2034 = _2022 + _1913;
    float _2036 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2030);
    float _2040 = _1913 * 0.5;
    float _2042 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2032);
    float _2044 = _1992 * _2016;
    float _2046 = _2034 * 0.5;
    float _2048 = _2024 * 0.5;
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2054 = _2044 * _2052;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2058 = _2044 * _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2062 = _2044 * _2060;
    float _2064 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2066 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2054);
    float _2068 = fma(_1951, -0.5, _2040);
    float _2070 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2020);
    float _2072 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2058);
    float _2074 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2062);
    float _2076 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.gl_Position.x = _1949;
    out.gl_Position.y = _1951;
    out.gl_Position.z = _2022;
    out.gl_Position.w = _1913;
    float _2078 = _1992;
    float _2080 = _1951;
    float _2082 = _2022;
    float _2084 = _1949;
    float _2086 = _2066;
    if (!_2014)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2088 = _2078;
    out.m_76.x = _2048;
    out.m_76.y = _2068;
    out.m_76.z = _2046;
    out.m_76.w = _1913;
    out.m_78.x = _2050;
    out.m_78.y = _2064;
    out.m_78.z = _2076;
    out.m_80.x = _2066;
    out.m_80.y = _2072;
    out.m_80.z = _2074;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2014)
    {
        _2080 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    float _2098 = _2094;
    if (!_2014)
    {
        _2082 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2100 = _2082;
    float _2102 = _2100;
    float _2104 = _2100;
    if (!_2014)
    {
        _2084 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2106 = _2084;
    float _2108 = _2106;
    float _2110 = _2106;
    if (!_2014)
    {
        _2086 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2112 = _2086;
    float _2114 = _2036 * _1965;
    float _2116 = -_2036;
    float _2118 = _2116 + 1.0;
    float _2120 = _1980 * _2114;
    float _2122 = _1990 * _2114;
    float _2124 = fma(_1986, _2120, _1974);
    float _2126 = fma(_1988, _2120, _1976);
    float _2128 = _1980 * _2118;
    float _2130 = fma(_1980, _2122, _1978);
    float _2132 = _1595 * _1657;
    out.m_82.x = _2124;
    out.m_82.y = _2126;
    out.m_82.z = _2130;
    out.m_82.w = _2128;
    float _2134 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2136 = _2132;
    float _2138 = _2112;
    float _2140 = _2112;
    if (!_2014)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2142 = _2136;
    bool _2144 = !_2014;
    float _2146 = _2142;
    float _2148 = _2142;
    if (!_2144)
    {
        bool _2150 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2152 = isnan(_1679);
        bool _2154 = _2150 || _2152;
        bool _2156 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2158 = _2154 || _2156;
        if (!_2158)
        {
            float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2162 = _1679 + _2160;
            float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2166 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2164;
            float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2172 = 1.0 / _2166;
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2188 = _2186 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2190 = _2162 * _2172;
            float _2192 = precise::clamp(_2190, 0.0, 1.0);
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2198 = fma(_2192, _2170, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2200 = fma(_2192, _2196, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2202 = fma(_2192, _2176, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2204 = fma(_2192, _2180, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2206 = fma(_2192, _2184, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2208 = fma(_2192, _2188, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2140 = _2198;
            _2092 = _2206;
            _2098 = _2202;
            _2110 = _2204;
            _2104 = _2200;
            _2148 = _2208;
            _2210 = true;
        }
        else
        {
            bool _2212 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2214 = isnan(_1679);
            bool _2216 = _2212 || _2214;
            bool _2218 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2220 = _2216 || _2218;
            if (!_2220)
            {
                _2096 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2222 = _2096;
            _2098 = _2222;
            if (!_2220)
            {
                _2138 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2224 = _2138;
            _2140 = _2224;
            if (!_2220)
            {
                _2102 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2226 = _2102;
            _2104 = _2226;
            if (!_2220)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2228 = _2108;
            _2110 = _2228;
            if (!_2220)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2230 = _2090;
            _2092 = _2230;
            if (!_2220)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2232 = _2146;
            bool _2234 = !_2220;
            _2148 = _2232;
            if (!_2234)
            {
                bool _2236 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2238 = isnan(_1679);
                bool _2240 = _2236 || _2238;
                bool _2242 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2244 = _2240 || _2242;
                if (!_2244)
                {
                    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2248 = _1679 + _2246;
                    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2252 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2250;
                    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2258 = 1.0 / _2252;
                    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2276 = _2248 * _2258;
                    float _2278 = precise::clamp(_2276, 0.0, 1.0);
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2284 = fma(_2278, _2256, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2286 = fma(_2278, _2282, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2288 = fma(_2278, _2262, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2290 = fma(_2278, _2266, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2292 = fma(_2278, _2270, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2294 = fma(_2278, _2274, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2140 = _2284;
                    _2092 = _2292;
                    _2098 = _2288;
                    _2110 = _2290;
                    _2104 = _2286;
                    _2148 = _2294;
                    _2210 = true;
                }
                else
                {
                    _2140 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2098 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2104 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2210 = false;
    float _2296 = _2140;
    float _2298 = _2092;
    float _2300 = _2098;
    float _2302 = _2110;
    float _2304 = _2104;
    float _2306 = _2148;
    float _2308 = _2134 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2310 = fma(_2064, -0.5, 0.5);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = -_2296;
    float _2316 = _2314 + _2298;
    float _2318 = -_2300;
    float _2320 = _2318 + _2302;
    out.m_47.x = _2308;
    float _2322 = -_2304;
    float _2324 = _2322 + _2306;
    float _2326 = fma(_2312, _2316, _2296);
    float _2328 = fma(_2312, _2320, _2300);
    bool _2330 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2332 = _2326 * 0.586610972881317138671875;
    float _2334 = fma(_2312, _2324, _2304);
    out.m_84.x = 0.0;
    bool _2336 = _1595 > 0.0;
    bool _2338 = isnan(_1595);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(0.0);
    bool _2344 = _2340 || _2342;
    float _2346 = fma(_2328, 0.298911988735198974609375, _2332);
    bool _2348 = _1657 <= 0.0;
    bool _2350 = !_2344;
    bool _2352 = _2348 || _2350;
    float _2354 = fma(_2334, 0.114477999508380889892578125, _2346);
    float _2356 = -_2354;
    float _2358 = _2328 + _2356;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2354);
    bool _2362 = !_2330;
    if (!_2362)
    {
        float _2364 = -_1527;
        float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2368 = -_1529;
        float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2372 = -_1531;
        float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2376 = _2366 * _2366;
        float _2378 = fma(_2370, _2370, _2376);
        float _2380 = fma(_2374, _2374, _2378);
        float _2382 = sqrt(_2380);
        float _2384 = rsqrt(_2380);
        float _2386 = -_2382;
        float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2390 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2392 = precise::clamp(_2390, 0.0, 1.0);
        float _2394 = _2370 * _2384;
        float _2396 = _2366 * _2384;
        float _2398 = abs(_2392);
        float _2400 = log2(_2398);
        float _2402 = _2374 * _2384;
        float _2404 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2406 = _2064 * _2396;
        float _2408 = -_2396;
        float _2410 = -_2404;
        float _2412 = fma(_2408, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2410);
        float _2414 = fma(_2050, _2394, _2406);
        float _2416 = -_2402;
        float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2412);
        float _2420 = fma(_2076, _2402, _2414);
        float _2422 = precise::clamp(_2420, 0.0, 1.0);
        float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2426 = _2418 + _2424;
        float _2428 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2430 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2432 = precise::clamp(_2430, 0.0, 1.0);
        float _2434 = exp2(_2428);
        float _2436 = _2434 * _2432;
        float _2438 = _2422 * _2436;
        float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_84.x = _2440;
    }
    out.m_86.x = _2360;
    if (!_2352)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2442 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2442;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2210 = false;
    bool _433 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_121);
        out.gl_Position.z = _2499;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    if (_135)
    {
        float _143 = float(_105);
        _141 = _143;
    }
    float _145 = _141;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_151)
    {
        out.m_47.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2567 = as_type<float>(_157);
        out.gl_Position.z = _2567;
    }
    if (_151)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    float _187 = 0.0;
    float _189 = _161;
    if (!_173)
    {
        float _191 = _161 * _161;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    int _203 = as_type<int>(_159) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_159) & 2;
    bool _209 = _207 != 0;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_173;
    float _221 = _201;
    bool _223 = _173;
    bool _225 = false;
    if (!_219)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _161 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _161);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _255;
    }
    float _257 = _221;
    bool _259 = !_173;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _161 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _189 = _279;
    }
    float _281 = _189;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _285 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _291 = fma(_281, _175, _285);
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_291, _163, _181);
    float _299 = fma(_293, _163, _183);
    float _301 = fma(_295, _163, _185);
    bool _303 = !_283;
    float _321;
    if (!_303)
    {
        float _305 = in.m_56.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = in.m_54.x;
    float _339 = in.m_54.y;
    bool _341 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _343 = isnan(_331);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _353;
    bool _357 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _359 = isnan(_331);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = 1.0 / _355;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _381 = _367 * _371;
    float _383 = -_367;
    float _385 = _383 + 1.0;
    float _387 = _335 * _377;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _389;
    float _393 = fma(_375, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _393 * _381;
    float _399 = _395 * _381;
    float _401 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _403 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].x, _401);
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].y, _403);
    float _409 = _405 * _337;
    float _411 = _407 * _339;
    bool _413 = !_379;
    float _431;
    if (!_413)
    {
        float _415 = in.m_56.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_105);
        float _437 = 1.0 / _435;
        float _439 = _139 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    float _443 = in.m_58.x;
    float _445 = in.m_58.y;
    float _447 = in.m_58.z;
    float _449 = in.m_58.w;
    float _451 = in.m_56.w;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _459 = _457 != 0;
    float _461 = in.m_60.x;
    float _463 = in.m_60.y;
    float _465 = in.m_60.z;
    float _467 = in.m_60.w;
    float _469 = in.m_62.x;
    float _471 = in.m_62.y;
    float _473 = in.m_62.z;
    float _475 = in.m_62.w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _479 = _477 != 0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _485 = 0.0;
    float _487 = _483;
    if (_455)
    {
        float _489 = in.m_56.x;
        _485 = _489;
    }
    float _491 = _485;
    float _493 = 0.0;
    if (_459)
    {
        float _495 = in.m_56.w;
        _493 = _495;
    }
    float _497 = _493;
    float _499 = _299 * _445;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _505 = _451 > 0.5;
    float _507 = 1.0 / _503;
    float _509 = fma(_297, _443, _499);
    float _511 = _299 * _463;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _515 = fma(_301, _447, _509);
    bool _517 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _519 = isnan(_441);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = _299 * _471;
    float _531 = 1.0 / _483;
    float _533 = fma(_297, _461, _511);
    float _535 = fma(_297, _469, _529);
    float _537 = fma(_301, _465, _533);
    float _539 = fma(_301, _473, _535);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _553 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _555 = isnan(_441);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = 1.0 / _543;
    float _567 = _503;
    float _569 = _547;
    int _571 = as_type<int>(_475);
    float _573 = _467;
    float _575 = _449;
    if (_459)
    {
        float _577 = _497 * 3.1415927410125732421875;
        _567 = _577;
    }
    float _579 = _567;
    float _581 = _551 * _507;
    out.m_64.w = _513;
    float _583 = _547 * _531;
    float _585 = _531;
    if (_455)
    {
        float _587 = _491 * 3.1415927410125732421875;
        _569 = _587;
    }
    float _589 = _569;
    float _591 = -_563;
    float _593 = _591 + 1.0;
    if (_459)
    {
        float _595 = _579 * 0.15915493667125701904296875;
        _487 = _595;
    }
    float _597 = _487;
    bool _599 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_441);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    if (_455)
    {
        float _611 = _589 * 0.15915493667125701904296875;
        _585 = _611;
    }
    float _613 = _585;
    float _615 = _527 * _593;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _617;
    float _621 = _589;
    float _623 = _593;
    if (_479)
    {
        float _625 = in.m_56.x;
        float _627 = in.m_56.y;
        _621 = _625;
        _623 = _627;
    }
    float _629 = _621;
    float _631 = _623;
    float _633 = _597;
    if (_459)
    {
        float _635 = _597 * 6.283185482025146484375;
        float _637 = sin(_635);
        _633 = _637;
    }
    float _639 = _633;
    float _641 = -_527;
    float _643 = _641 + 1.0;
    bool _645 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _647 = isnan(_441);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _619 * _565;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _441 + _659;
    float _663 = -_609;
    float _665 = _663 + 1.0;
    float _667 = _609 * _643;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _441 + _669;
    float _673 = _613;
    float _675 = _643;
    if (_455)
    {
        float _677 = _613 * 6.283185482025146484375;
        float _679 = sin(_677);
        _673 = _679;
    }
    float _681 = _673;
    float _683 = fma(_583, _661, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _685 = _655 * _665;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _689 = _441 + _687;
    float _691 = fma(_581, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _693 = _537 + _467;
    float _695 = _683 * _685;
    float _697 = -_655;
    float _699 = _697 + 1.0;
    float _701 = fma(_657, _689, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _703 = _515 + _449;
    float _705 = _539 + _475;
    float _707 = _695;
    if (_459)
    {
        bool _709 = _639 > 0.5;
        _223 = _709;
    }
    bool _711 = _223;
    float _713 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    if (_479)
    {
        _571 = 0;
    }
    int _715 = _571;
    int _717 = _715;
    if (_455)
    {
        bool _719 = _681 > 0.5;
        _225 = _719;
    }
    bool _721 = _225;
    float _723 = _629;
    float _725 = _631;
    if (_479)
    {
        _573 = _629;
    }
    float _727 = _573;
    float _729 = _727;
    if (_479)
    {
        _575 = _631;
    }
    float _731 = _575;
    float _733 = _731;
    if (!_479)
    {
        float _735 = in.m_56.x;
        float _737 = in.m_56.y;
        float _739 = _735 * 3.1415927410125732421875;
        float _741 = _739 * 0.15915493667125701904296875;
        float _743 = _737 * 3.1415927410125732421875;
        float _745 = _743 * 0.15915493667125701904296875;
        float _747 = _741 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = _745 * 6.283185482025146484375;
        float _753 = sin(_751);
        _723 = _735;
        _725 = _737;
        _717 = 1;
        _729 = _749;
        _733 = _753;
    }
    float _755 = _723;
    float _757 = _725;
    int _759 = _717;
    float _761 = _729;
    float _763 = _733;
    float _765 = _755;
    if (!_459)
    {
        _675 = _213;
    }
    float _767 = _675;
    float _769 = in.m_56.z;
    float _771 = _767;
    if (_459)
    {
        float _773 = -_213;
        float _775 = _711 ? _773 : _213;
        _771 = _775;
    }
    float _777 = _771;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _781 = _755 > 0.5;
    float _783 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _785 = _757 > 0.5;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _791 = _789 != 0;
    float _793 = fma(_691, _667, _713);
    float _795 = -_213;
    int _797 = _781 ? as_type<int>(_795) : as_type<int>(_213);
    float _799 = -_787;
    float _801 = fma(_783, 2.0, _799);
    float _803 = _793;
    if (!_455)
    {
        _707 = _217;
    }
    float _805 = _707;
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _809 = _805;
    if (_455)
    {
        float _811 = -_217;
        float _813 = _721 ? _811 : _217;
        _809 = _813;
    }
    float _815 = _809;
    float _817 = -_139;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[76].x, _801);
    bool _821 = _759 != 1;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _825 = _823 != 0;
    float _827 = -_217;
    int _829 = _785 ? as_type<int>(_827) : as_type<int>(_217);
    float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _833 = !_791;
    float _835 = _833 ? _213 : as_type<float>(_797);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _839 = _837 != 0;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _843 = _841 != 0;
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _847 = !_825;
    float _849 = _847 ? _217 : as_type<float>(_829);
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _855 = _853 != 0;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _859 = _857 != 0;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _863 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[93].z, _851);
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _867 = _761 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _869 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[93].w, _861);
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _875 = _757 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _877 = _763 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _879 = -_865;
    float _881 = fma(_867, 2.0, _879);
    float _883 = _779 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _885 = fma(_875, -2.0, _871);
    float _887 = _865;
    float _889 = _883;
    float _891 = _815;
    if (!_821)
    {
        _887 = _769;
    }
    float _893 = _887;
    float _895 = fma(_877, -2.0, _873);
    float _897 = -_139;
    float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[91].x, _881);
    float _901 = _777 + 0.5;
    float _903 = fma(_701, _615, _793);
    float _905 = _893;
    float _907 = _899;
    if (!_821)
    {
        _803 = _893;
    }
    float _909 = _803;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _913 = _909;
    if (_821)
    {
        _905 = _769;
    }
    float _915 = _905;
    float _917 = fma(_883, _901, _899);
    float _919 = _807 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _921 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _895);
    if (!_821)
    {
        _907 = _757;
    }
    float _923 = _907;
    float _925 = _815 + (-0.5);
    float _927 = _923;
    if (!_821)
    {
        _889 = _757;
    }
    float _929 = _889;
    float _931 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].z, _911);
    float _933 = _929;
    if (_821)
    {
        _927 = _755;
    }
    float _935 = _927;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_821)
    {
        _933 = _755;
    }
    float _939 = _933;
    float _941 = -_919;
    float _943 = -_921;
    float _945 = fma(_941, _925, _943);
    if (_821)
    {
        _765 = _915;
    }
    float _947 = _765;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _951 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[118].x, _903);
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _955 = _703 + _953;
    float _957 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[84].z, _937);
    float _959 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[83].z, _949);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _963 = _693 + _961;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _967 = _955 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _969 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[84].x, _957);
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_821)
    {
        _971 = _909;
    }
    float _973 = _971;
    float _975 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[78].w, _965);
    float _977 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[28].x, _967);
    float _979 = _969 * (-0.15915493667125701904296875);
    float _981 = _831 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _983 = _835 + 0.5;
    float _985 = _973;
    if (_821)
    {
        _985 = _757;
    }
    float _987 = _985;
    float _989 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _885);
    if (_821)
    {
        _913 = _757;
    }
    float _991 = _913;
    float _993 = fma(_981, _983, _819);
    float _995 = _979 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1001 = _849 + (-0.5);
    float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1005 = _705 + _1003;
    float _1007 = _935 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1009 = -_999;
    float _1011 = -_989;
    float _1013 = fma(_1009, _1001, _1011);
    float _1015 = -_217;
    int _1017 = _505 ? as_type<int>(_1015) : as_type<int>(_217);
    float _1019 = _979 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    bool _1023 = _915 > 0.5;
    float _1025 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[28].z, _977);
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1029 = !_843;
    float _1031 = _1029 ? _217 : as_type<float>(_1017);
    float _1033 = _987 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1035 = -_213;
    int _1037 = _1023 ? as_type<int>(_1035) : as_type<int>(_213);
    float _1039 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _869);
    float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1043 = _1025 >= 0.0;
    float _1045 = -_1027;
    float _1047 = fma(_1007, 2.0, _1045);
    float _1049 = _1031 * _997;
    float _1051 = -_139;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1047);
    bool _1055 = !_839;
    float _1057 = _1055 ? _213 : as_type<float>(_1037);
    float _1059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1065 = _1031 * _1021;
    float _1067 = -_1049;
    float _1069 = fma(_1057, _1021, _1067);
    float _1071 = -_213;
    int _1073 = _785 ? as_type<int>(_1071) : as_type<int>(_213);
    float _1075 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1061);
    float _1077 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _975);
    float _1079 = fma(_1033, -2.0, _1063);
    float _1081 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _863);
    float _1083 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1085 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _931);
    float _1087 = _1069 + 0.5;
    float _1089 = fma(_1057, _997, _1065);
    bool _1091 = !_855;
    float _1093 = _1091 ? _213 : as_type<float>(_1073);
    float _1095 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _959);
    float _1097 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1075);
    float _1099 = fma(_1083, _1087, _1053);
    float _1101 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1079);
    float _1103 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1105 = _1089 + (-0.5);
    float _1107 = _1093 + 0.5;
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1111 = -_1081;
    float _1113 = _1111 + 1.0;
    float _1115 = -_1103;
    float _1117 = -_1101;
    float _1119 = fma(_1115, _1105, _1117);
    float _1121 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1123 = _955 * _955;
    float _1125 = -_217;
    int _1127 = _1023 ? as_type<int>(_1125) : as_type<int>(_217);
    float _1129 = -_1113;
    float _1131 = fma(_1129, _777, _917);
    float _1133 = -_1085;
    float _1135 = _1133 + 1.0;
    float _1137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1139 = fma(_963, _963, _1123);
    bool _1141 = !_859;
    float _1143 = _1141 ? _217 : as_type<float>(_1127);
    float _1145 = -_1039;
    float _1147 = _1145 + 1.0;
    float _1149 = -_1135;
    float _1151 = fma(_835, _1149, _993);
    float _1153 = fma(_1005, _1005, _1139);
    float _1155 = -_1095;
    float _1157 = _1155 + 1.0;
    float _1159 = -_1143;
    float _1161 = _1159 + 0.5;
    float _1163 = fma(_1147, _815, _945);
    float _1165 = rsqrt(_1153);
    float _1167 = _1121 * _1109;
    float _1169 = -_1077;
    float _1171 = _1169 + 1.0;
    if (_1043)
    {
        _891 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1173 = _891;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1177 = -_1097;
    float _1179 = _1177 + 1.0;
    float _1181 = fma(_849, _1171, _1013);
    float _1183 = _951 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1185 = _1175 * _1137;
    int _1187 = as_type<int>(_1173);
    if (_1043)
    {
        float _1189 = _1173 * 5.0;
        _1187 = as_type<int>(_1189);
    }
    int _1191 = _1187;
    float _1193 = -_1157;
    float _1195 = fma(_1069, _1193, _1099);
    float _1197 = fma(_1089, _1179, _1119);
    out.m_66.x = _1131;
    out.m_66.y = _1163;
    float _1199 = _955 * _1165;
    out.m_68.w = _1183;
    float _1201 = _963 * _1165;
    if (_1043)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4214 = as_type<float>(_1191);
        out.gl_Position.z = _4214;
    }
    out.m_70.x = _1167;
    out.m_70.y = _1185;
    out.m_72.x = _1151;
    out.m_72.y = _1181;
    out.m_72.z = _1195;
    out.m_72.w = _1197;
    if (_1043)
    {
        out.m_47.x = 0.0;
    }
    if (_1043)
    {
        return out;
    }
    float _1203 = -_1199;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    float _1207 = _1005 * _1165;
    float _1209 = -_1201;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1213 = -_1199;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1219 = _1205 + _1217;
    float _1221 = -_1207;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1227 = _1211 + _1225;
    float _1229 = -_1201;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1237 = _1223 + _1235;
    float _1239 = _1215 * _1215;
    float _1241 = -_1207;
    float _1243 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1005);
    float _1245 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1233);
    float _1247 = fma(_1231, _1231, _1239);
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1245);
    float _1251 = fma(_1243, _1243, _1247);
    bool _1253 = _1249 >= 0.0;
    float _1255 = sqrt(_1251);
    float _1257 = _1249;
    float _1259 = _1219;
    float _1261 = _1227;
    float _1263 = _1211;
    float _1265 = _1223;
    if (_1253)
    {
        _1257 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1267 = _1257;
    int _1269 = as_type<int>(_1267);
    if (_1253)
    {
        out.m_47.x = 0.0;
    }
    if (_1253)
    {
        float _1271 = _1267 * 5.0;
        _1269 = as_type<int>(_1271);
    }
    int _1273 = _1269;
    float _1275 = _1165 * _1255;
    if (_1253)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4362 = as_type<float>(_1273);
        out.gl_Position.z = _4362;
    }
    if (_1253)
    {
        return out;
    }
    float _1277 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1279 = _409 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _1285 = _1275 * _1277;
    float _1287 = _1275 * _1279;
    float _1289 = _1281 * _1285;
    float _1291 = _1283 * _1287;
    float _1293 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1295 = _1293 * 0.5;
    bool _1297 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1305 = _1301 || _1303;
    float _1307 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1311 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1313 = isnan(0.5);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1319 = _1315 || _1317;
    float _1321 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1307);
    float _1323 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1325 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1309);
    float _1327 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1321);
    float _1329 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1323);
    float _1331 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1325);
    float _1333 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1335 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1329);
    float _1337 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1339 = _705 + _1333;
    float _1341 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1343 = _693 + _1337;
    float _1345 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1349 = _1339 + _1347;
    float _1351 = 1.0 / _1341;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1355 = _1343 + _1353;
    float _1357 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1359 = _1349 * _1349;
    float _1361 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1357);
    float _1363 = fma(_1355, _1355, _1359);
    float _1365 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1367 = sqrt(_1363);
    float _1369 = _1365 + _1341;
    float _1371 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1373 = _1369 * _1351;
    float _1375 = _1373 * 0.5;
    float _1377 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1371);
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1381 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1379);
    float _1383 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1377);
    bool _1385 = _1367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1387 = 1.0 / _1381;
    float _1389 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1391 = _703 + _1389;
    float _1393 = _1375;
    float _1395 = _1295;
    float _1397 = _1343;
    float _1399 = _1389;
    if (!_1385)
    {
        _1393 = _1339;
    }
    float _1401 = _1393;
    float _1403 = _1401;
    if (!_1385)
    {
        _1395 = _1391;
    }
    float _1405 = _1395;
    bool _1407 = !_1385;
    float _1409 = _1405;
    if (!_1407)
    {
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1415 = _1367 + _1413;
        float _1417 = _1391 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1419 = _1415 * _1411;
        float _1421 = rsqrt(_1363);
        float _1423 = _1419 * 0.15915493667125701904296875;
        float _1425 = _1423 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = _1423 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1427 + (-1.0);
        float _1435 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1437 = fma(_1431, _1417, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1439 = fma(_1391, _1427, _1435);
        float _1441 = _1421 * _1437;
        float _1443 = fma(_1355, _1441, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1445 = fma(_1349, _1441, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1397 = _1443;
        _1409 = _1439;
        _1403 = _1445;
        _1399 = _1441;
    }
    float _1447 = _1397;
    float _1449 = _1409;
    float _1451 = _1403;
    float _1453 = _1399;
    float _1455 = -_1201;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1447);
    float _1459 = -_1199;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1449);
    float _1463 = -_1207;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1467 = _1453;
    float _1469 = _1461;
    float _1471 = _1457;
    float _1473 = _1465;
    float _1475 = _1447;
    if (_1319)
    {
        _1467 = 1.0;
    }
    float _1477 = _1467;
    float _1479 = _1477;
    if (!_1305)
    {
        float _1481 = _1219 * _1219;
        float _1483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1485 = -_705;
        float _1487 = _1485 + _1451;
        float _1489 = -_703;
        float _1491 = _1489 + _1449;
        float _1493 = fma(_1227, _1227, _1481);
        float _1495 = fma(_1237, _1237, _1493);
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1499 = sqrt(_1495);
        float _1501 = 1.0 / _1275;
        float _1503 = precise::min(_1499, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1505 = _1503 * _1483;
        float _1507 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1509 = _1505 * _1501;
        float _1511 = -_693;
        float _1513 = _1511 + _1447;
        float _1515 = _1507 * _1509;
        float _1517 = _1487 * _1509;
        float _1519 = fma(_1513, _1515, _1211);
        float _1521 = fma(_1491, _1515, _1205);
        float _1523 = fma(_1507, _1517, _1223);
        _1259 = _1507;
        _1469 = _1521;
        _1471 = _1519;
        _1473 = _1523;
    }
    float _1525 = _1259;
    float _1527 = _1469;
    float _1529 = _1471;
    float _1531 = _1473;
    float _1533 = _1525;
    if (_1319)
    {
        _1261 = 1.0;
    }
    float _1535 = _1261;
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1539 = _1387 * _1537;
    float _1541 = _1535;
    if (!_1319)
    {
        float _1543 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1545 = _1543 * 0.15915493667125701904296875;
        float _1547 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = _1545 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1547 * 0.15915493667125701904296875;
        float _1555 = _1545 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = 1.0 / _1551;
        float _1561 = _1553 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = _1557 * _1559;
        float _1567 = _1553 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1563 * _1565;
        float _1573 = 1.0 / _1571;
        float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1577 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1575;
        float _1579 = 1.0 / _1577;
        float _1581 = _1569 * _1573;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = fma(_1539, _1581, _1583);
        float _1587 = _1585 * _1579;
        float _1589 = precise::clamp(_1587, 0.0, 1.0);
        _1533 = _1545;
        _1263 = _1553;
        _1479 = _1589;
    }
    float _1591 = _1533;
    float _1593 = _1263;
    float _1595 = _1479;
    float _1597 = _1591;
    float _1599 = _1593;
    if (!_1319)
    {
        float _1601 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = _1601 * 0.15915493667125701904296875;
        float _1605 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1607 = _1603 * 6.283185482025146484375;
        float _1609 = cos(_1607);
        float _1611 = _1605 * 0.15915493667125701904296875;
        float _1613 = _1603 * 6.283185482025146484375;
        float _1615 = sin(_1613);
        float _1617 = 1.0 / _1609;
        float _1619 = _1611 * 6.283185482025146484375;
        float _1621 = cos(_1619);
        float _1623 = _1615 * _1617;
        float _1625 = _1611 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = _1621 * _1623;
        float _1631 = 1.0 / _1629;
        float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1635 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1633;
        float _1637 = 1.0 / _1635;
        float _1639 = _1627 * _1631;
        float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1643 = fma(_1539, _1639, _1641);
        float _1645 = _1643 * _1637;
        float _1647 = precise::clamp(_1645, 0.0, 1.0);
        float _1649 = -_1647;
        float _1651 = _1649 + 1.0;
        _1597 = _1617;
        _1599 = _1629;
        _1541 = _1651;
    }
    float _1653 = _1597;
    float _1655 = _1599;
    float _1657 = _1541;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1661 = _1527 + _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1665 = _1529 + _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1669 = _1531 + _1667;
    float _1671 = _1661 * _1661;
    float _1673 = fma(_1665, _1665, _1671);
    float _1675 = fma(_1669, _1669, _1673);
    float _1677 = rsqrt(_1675);
    float _1679 = sqrt(_1675);
    float _1681 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1683 = _1665 * _1681;
    float _1685 = _1669 * _1681;
    float _1687 = _1683 * _1683;
    float _1689 = _1685 * _1685;
    float _1691 = _1687 + _1689;
    float _1693 = sqrt(_1691);
    bool _1695 = _1693 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1699 = _1693 + _1697;
    float _1701 = _1653;
    float _1703 = _1699;
    float _1705 = _1661;
    float _1707 = _1683;
    if (_1695)
    {
        float _1709 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1709;
    }
    float _1711 = _1701;
    float _1713 = _1711;
    if (_1695)
    {
        float _1715 = _1699 * _1711;
        _1703 = _1715;
    }
    float _1717 = _1703;
    if (_1695)
    {
        float _1719 = rsqrt(_1691);
        _1713 = _1719;
    }
    float _1721 = _1713;
    float _1723 = _1721;
    if (_1695)
    {
        float _1725 = _1717 * 0.15915493667125701904296875;
        _1265 = _1725;
    }
    float _1727 = _1265;
    float _1729 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1731 = _1669;
    if (_1695)
    {
        float _1733 = _1727 * 6.283185482025146484375;
        float _1735 = sin(_1733);
        _1731 = _1735;
    }
    float _1737 = _1731;
    float _1739 = precise::max(0.0, _1729);
    float _1741 = _1655;
    float _1743 = _1739;
    if (_1695)
    {
        float _1745 = _1727 * 6.283185482025146484375;
        float _1747 = cos(_1745);
        _1741 = _1747;
    }
    float _1749 = _1741;
    float _1751 = -_1681;
    float _1753 = -_1739;
    float _1755 = fma(_1661, _1751, _1753);
    if (_1695)
    {
        float _1757 = _1755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1705 = _1757;
    }
    float _1759 = _1705;
    float _1761 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1763 = _1737;
    float _1765 = _1759;
    if (_1695)
    {
        float _1767 = fma(_1737, _1759, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1763 = _1767;
    }
    float _1769 = _1763;
    float _1771 = _1769;
    if (!_1695)
    {
        _1765 = _1755;
    }
    float _1773 = _1765;
    float _1775 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1777 = _1773;
    if (_1695)
    {
        float _1779 = _1721 * _1769;
        _1475 = _1779;
    }
    float _1781 = _1475;
    if (!_1695)
    {
        _1771 = _1687;
    }
    float _1783 = _1771;
    float _1785 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1775);
    float _1787 = _1783;
    float _1789 = _1749;
    if (_1695)
    {
        float _1791 = _1749 + (-1.0);
        _1743 = _1791;
    }
    float _1793 = _1743;
    float _1795 = _1793;
    if (_1695)
    {
        float _1797 = _1683 * _1781;
        _1707 = _1797;
    }
    float _1799 = _1707;
    float _1801 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1785);
    if (_1695)
    {
        float _1803 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1803;
    }
    float _1805 = _1723;
    if (!_1695)
    {
        _1795 = _1685;
    }
    float _1807 = _1795;
    float _1809 = _1807;
    if (_1695)
    {
        float _1811 = _1685 * _1781;
        _1809 = _1811;
    }
    float _1813 = _1809;
    if (_1695)
    {
        float _1815 = _1799 * _1799;
        _1787 = _1815;
    }
    float _1817 = _1787;
    if (_1695)
    {
        float _1819 = fma(_1755, _1749, _1805);
        _1777 = _1819;
    }
    float _1821 = _1777;
    if (!_1695)
    {
        _1789 = _1689;
    }
    float _1823 = _1789;
    float _1825 = _1823;
    if (_1695)
    {
        float _1827 = _1813 * _1813;
        _1825 = _1827;
    }
    float _1829 = _1825;
    float _1831 = fma(_1821, _1821, _1817);
    float _1833 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1835 = _1831 + _1829;
    float _1837 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1833);
    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1841 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1839);
    float _1843 = precise::clamp(_1841, 0.0, 1.0);
    float _1845 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1847 = rsqrt(_1835);
    float _1849 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1837);
    float _1851 = -_1843;
    float _1853 = _1851 + 1.0;
    float _1855 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1857 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1845);
    float _1859 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1861 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1855);
    float _1863 = abs(_1853);
    float _1865 = log2(_1863);
    float _1867 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1857);
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1871 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1861);
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1875 = -_1869;
    float _1877 = fma(_1875, _1761, 1.0);
    float _1879 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1881 = _1847 * _1799;
    float _1883 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1885 = _1847 * _1821;
    float _1887 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1889 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1891 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1883);
    float _1893 = _1847 * _1813;
    float _1895 = log2(_1877);
    float _1897 = -_1889;
    float _1899 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1897);
    float _1901 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1903 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1891);
    float _1905 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1907 = -_1893;
    float _1909 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1899);
    float _1911 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1913 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1903);
    float _1915 = exp2(_1901);
    float _1917 = fma(_1909, -0.5, 0.5);
    float _1919 = fma(_1909, 0.5, 0.5);
    float _1921 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1911);
    float _1923 = _1885 + 1.0;
    float _1925 = fma(_1919, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1927 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1921);
    float _1929 = 1.0 / _1913;
    float _1931 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1905);
    float _1933 = fma(_1919, _1925, -0.212114393711090087890625);
    float _1935 = _1895 * 0.693147182464599609375;
    float _1937 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1931);
    float _1939 = fma(_1919, _1933, 1.570728778839111328125);
    float _1941 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1943 = sqrt(_1917);
    float _1945 = -_1885;
    float _1947 = fma(_1915, _1923, _1945);
    float _1949 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1927);
    float _1951 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1937);
    float _1953 = fma(_1947, 0.5, 0.5);
    float _1955 = _1949 * _1929;
    float _1957 = _1951 * _1929;
    float _1959 = fma(_1955, 0.5, 0.5);
    float _1961 = fma(_1957, -0.5, 0.5);
    float _1963 = _1943 * 0.636619746685028076171875;
    float3 _5450 = float3(_1959, _1961, _1941);
    float _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5450, float3(0.0), isnan(_5450)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5450, float3(0.0), isnan(_5450)), level(0.0)).x;
    float _1967 = -_1939;
    float _1969 = fma(_1963, _1967, 1.0);
    float3 _5466 = float3(_1959, _1961, _1941);
    float4 _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5466, float3(0.0), isnan(_5466)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5466, float3(0.0), isnan(_5466)), level(0.0)).xyzw;
    float _1974 = _1972.x;
    float _1976 = _1972.y;
    float _1978 = _1972.z;
    float _1980 = _1972.w;
    float2 _5483 = float2(_1969, _1953);
    float3 _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5483, float2(0.0), isnan(_5483)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5483, float2(0.0), isnan(_5483)), level(0.0)).xyz;
    float _1986 = _1984.x;
    float _1988 = _1984.y;
    float _1990 = _1984.z;
    float _1992 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1994 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1996 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1998 = fma(_1992, _1992, 1.0);
    float _2000 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1994);
    float _2002 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2004 = exp2(_2002);
    bool _2006 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2008 = isnan(_1679);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2014 = _2010 || _2012;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2016 = rsqrt(_1998);
    float _2018 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2000);
    float _2020 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2022 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2018);
    float _2024 = _1949 + _1913;
    float _2026 = -_2004;
    float _2028 = _2026 + 1.0;
    float _2030 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2032 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2034 = _2022 + _1913;
    float _2036 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2030);
    float _2040 = _1913 * 0.5;
    float _2042 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2032);
    float _2044 = _1992 * _2016;
    float _2046 = _2034 * 0.5;
    float _2048 = _2024 * 0.5;
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2054 = _2044 * _2052;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2058 = _2044 * _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2062 = _2044 * _2060;
    float _2064 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2066 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2054);
    float _2068 = fma(_1951, -0.5, _2040);
    float _2070 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2020);
    float _2072 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2058);
    float _2074 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2062);
    float _2076 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.gl_Position.x = _1949;
    out.gl_Position.y = _1951;
    out.gl_Position.z = _2022;
    out.gl_Position.w = _1913;
    float _2078 = _1992;
    float _2080 = _1951;
    float _2082 = _2022;
    float _2084 = _1949;
    float _2086 = _2066;
    if (!_2014)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2088 = _2078;
    out.m_76.x = _2048;
    out.m_76.y = _2068;
    out.m_76.z = _2046;
    out.m_76.w = _1913;
    out.m_78.x = _2050;
    out.m_78.y = _2064;
    out.m_78.z = _2076;
    out.m_80.x = _2066;
    out.m_80.y = _2072;
    out.m_80.z = _2074;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2014)
    {
        _2080 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    float _2098 = _2094;
    if (!_2014)
    {
        _2082 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2100 = _2082;
    float _2102 = _2100;
    float _2104 = _2100;
    if (!_2014)
    {
        _2084 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2106 = _2084;
    float _2108 = _2106;
    float _2110 = _2106;
    if (!_2014)
    {
        _2086 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2112 = _2086;
    float _2114 = _2036 * _1965;
    float _2116 = -_2036;
    float _2118 = _2116 + 1.0;
    float _2120 = _1980 * _2114;
    float _2122 = _1990 * _2114;
    float _2124 = fma(_1986, _2120, _1974);
    float _2126 = fma(_1988, _2120, _1976);
    float _2128 = _1980 * _2118;
    float _2130 = fma(_1980, _2122, _1978);
    float _2132 = _1595 * _1657;
    out.m_82.x = _2124;
    out.m_82.y = _2126;
    out.m_82.z = _2130;
    out.m_82.w = _2128;
    float _2134 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2136 = _2132;
    float _2138 = _2112;
    float _2140 = _2112;
    if (!_2014)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2142 = _2136;
    bool _2144 = !_2014;
    float _2146 = _2142;
    float _2148 = _2142;
    if (!_2144)
    {
        bool _2150 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2152 = isnan(_1679);
        bool _2154 = _2150 || _2152;
        bool _2156 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2158 = _2154 || _2156;
        if (!_2158)
        {
            float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2162 = _1679 + _2160;
            float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2166 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2164;
            float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2172 = 1.0 / _2166;
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2188 = _2186 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2190 = _2162 * _2172;
            float _2192 = precise::clamp(_2190, 0.0, 1.0);
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2198 = fma(_2192, _2170, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2200 = fma(_2192, _2196, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2202 = fma(_2192, _2176, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2204 = fma(_2192, _2180, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2206 = fma(_2192, _2184, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2208 = fma(_2192, _2188, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2140 = _2198;
            _2092 = _2206;
            _2098 = _2202;
            _2110 = _2204;
            _2104 = _2200;
            _2148 = _2208;
            _2210 = true;
        }
        else
        {
            bool _2212 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2214 = isnan(_1679);
            bool _2216 = _2212 || _2214;
            bool _2218 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2220 = _2216 || _2218;
            if (!_2220)
            {
                _2096 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2222 = _2096;
            _2098 = _2222;
            if (!_2220)
            {
                _2138 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2224 = _2138;
            _2140 = _2224;
            if (!_2220)
            {
                _2102 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2226 = _2102;
            _2104 = _2226;
            if (!_2220)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2228 = _2108;
            _2110 = _2228;
            if (!_2220)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2230 = _2090;
            _2092 = _2230;
            if (!_2220)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2232 = _2146;
            bool _2234 = !_2220;
            _2148 = _2232;
            if (!_2234)
            {
                bool _2236 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2238 = isnan(_1679);
                bool _2240 = _2236 || _2238;
                bool _2242 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2244 = _2240 || _2242;
                if (!_2244)
                {
                    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2248 = _1679 + _2246;
                    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2252 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2250;
                    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2258 = 1.0 / _2252;
                    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2276 = _2248 * _2258;
                    float _2278 = precise::clamp(_2276, 0.0, 1.0);
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2284 = fma(_2278, _2256, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2286 = fma(_2278, _2282, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2288 = fma(_2278, _2262, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2290 = fma(_2278, _2266, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2292 = fma(_2278, _2270, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2294 = fma(_2278, _2274, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2140 = _2284;
                    _2092 = _2292;
                    _2098 = _2288;
                    _2110 = _2290;
                    _2104 = _2286;
                    _2148 = _2294;
                    _2210 = true;
                }
                else
                {
                    _2140 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2098 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2104 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2210 = false;
    float _2296 = _2140;
    float _2298 = _2092;
    float _2300 = _2098;
    float _2302 = _2110;
    float _2304 = _2104;
    float _2306 = _2148;
    float _2308 = _2134 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2310 = fma(_2064, -0.5, 0.5);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = -_2296;
    float _2316 = _2314 + _2298;
    float _2318 = -_2300;
    float _2320 = _2318 + _2302;
    out.m_47.x = _2308;
    float _2322 = -_2304;
    float _2324 = _2322 + _2306;
    float _2326 = fma(_2312, _2316, _2296);
    float _2328 = fma(_2312, _2320, _2300);
    bool _2330 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2332 = _2326 * 0.586610972881317138671875;
    float _2334 = fma(_2312, _2324, _2304);
    out.m_84.x = 0.0;
    bool _2336 = _1595 > 0.0;
    bool _2338 = isnan(_1595);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(0.0);
    bool _2344 = _2340 || _2342;
    float _2346 = fma(_2328, 0.298911988735198974609375, _2332);
    bool _2348 = _1657 <= 0.0;
    bool _2350 = !_2344;
    bool _2352 = _2348 || _2350;
    float _2354 = fma(_2334, 0.114477999508380889892578125, _2346);
    float _2356 = -_2354;
    float _2358 = _2328 + _2356;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2354);
    bool _2362 = !_2330;
    if (!_2362)
    {
        float _2364 = -_1527;
        float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2368 = -_1529;
        float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2372 = -_1531;
        float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2376 = _2366 * _2366;
        float _2378 = fma(_2370, _2370, _2376);
        float _2380 = fma(_2374, _2374, _2378);
        float _2382 = sqrt(_2380);
        float _2384 = rsqrt(_2380);
        float _2386 = -_2382;
        float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2390 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2392 = precise::clamp(_2390, 0.0, 1.0);
        float _2394 = _2370 * _2384;
        float _2396 = _2366 * _2384;
        float _2398 = abs(_2392);
        float _2400 = log2(_2398);
        float _2402 = _2374 * _2384;
        float _2404 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2406 = _2064 * _2396;
        float _2408 = -_2396;
        float _2410 = -_2404;
        float _2412 = fma(_2408, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2410);
        float _2414 = fma(_2050, _2394, _2406);
        float _2416 = -_2402;
        float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2412);
        float _2420 = fma(_2076, _2402, _2414);
        float _2422 = precise::clamp(_2420, 0.0, 1.0);
        float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2426 = _2418 + _2424;
        float _2428 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2430 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2432 = precise::clamp(_2430, 0.0, 1.0);
        float _2434 = exp2(_2428);
        float _2436 = _2434 * _2432;
        float _2438 = _2422 * _2436;
        float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_84.x = _2440;
    }
    out.m_86.x = _2360;
    if (!_2352)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2442 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2442;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2210 = false;
    bool _433 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_121);
        out.gl_Position.z = _2499;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    if (_135)
    {
        float _143 = float(_105);
        _141 = _143;
    }
    float _145 = _141;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_151)
    {
        out.m_47.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2567 = as_type<float>(_157);
        out.gl_Position.z = _2567;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    float _187 = 0.0;
    float _189 = _161;
    if (!_173)
    {
        float _191 = _161 * _161;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    int _203 = as_type<int>(_159) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_159) & 2;
    bool _209 = _207 != 0;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_173;
    float _221 = _201;
    bool _223 = _173;
    bool _225 = false;
    if (!_219)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _161 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _161);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _255;
    }
    float _257 = _221;
    bool _259 = !_173;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _161 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _189 = _279;
    }
    float _281 = _189;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _285 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _291 = fma(_281, _175, _285);
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_291, _163, _181);
    float _299 = fma(_293, _163, _183);
    float _301 = fma(_295, _163, _185);
    bool _303 = !_283;
    float _321;
    if (!_303)
    {
        float _305 = in.m_56.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = in.m_54.x;
    float _339 = in.m_54.y;
    bool _341 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _343 = isnan(_331);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _353;
    bool _357 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _359 = isnan(_331);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = 1.0 / _355;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _381 = _367 * _371;
    float _383 = -_367;
    float _385 = _383 + 1.0;
    float _387 = _335 * _377;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _389;
    float _393 = fma(_375, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _393 * _381;
    float _399 = _395 * _381;
    float _401 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _403 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].x, _401);
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].y, _403);
    float _409 = _405 * _337;
    float _411 = _407 * _339;
    bool _413 = !_379;
    float _431;
    if (!_413)
    {
        float _415 = in.m_56.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_105);
        float _437 = 1.0 / _435;
        float _439 = _139 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    float _443 = in.m_58.x;
    float _445 = in.m_58.y;
    float _447 = in.m_58.z;
    float _449 = in.m_58.w;
    float _451 = in.m_56.w;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _459 = _457 != 0;
    float _461 = in.m_60.x;
    float _463 = in.m_60.y;
    float _465 = in.m_60.z;
    float _467 = in.m_60.w;
    float _469 = in.m_62.x;
    float _471 = in.m_62.y;
    float _473 = in.m_62.z;
    float _475 = in.m_62.w;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _479 = _477 != 0;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _485 = 0.0;
    float _487 = _483;
    if (_455)
    {
        float _489 = in.m_56.x;
        _485 = _489;
    }
    float _491 = _485;
    float _493 = 0.0;
    if (_459)
    {
        float _495 = in.m_56.w;
        _493 = _495;
    }
    float _497 = _493;
    float _499 = _299 * _445;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _505 = _451 > 0.5;
    float _507 = 1.0 / _503;
    float _509 = fma(_297, _443, _499);
    float _511 = _299 * _463;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _515 = fma(_301, _447, _509);
    bool _517 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _519 = isnan(_441);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = _299 * _471;
    float _531 = 1.0 / _483;
    float _533 = fma(_297, _461, _511);
    float _535 = fma(_297, _469, _529);
    float _537 = fma(_301, _465, _533);
    float _539 = fma(_301, _473, _535);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _553 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _555 = isnan(_441);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = 1.0 / _543;
    float _567 = _503;
    float _569 = _547;
    int _571 = as_type<int>(_475);
    float _573 = _467;
    float _575 = _449;
    if (_459)
    {
        float _577 = _497 * 3.1415927410125732421875;
        _567 = _577;
    }
    float _579 = _567;
    float _581 = _551 * _507;
    out.m_64.w = _513;
    float _583 = _547 * _531;
    float _585 = _531;
    if (_455)
    {
        float _587 = _491 * 3.1415927410125732421875;
        _569 = _587;
    }
    float _589 = _569;
    float _591 = -_563;
    float _593 = _591 + 1.0;
    if (_459)
    {
        float _595 = _579 * 0.15915493667125701904296875;
        _487 = _595;
    }
    float _597 = _487;
    bool _599 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = isnan(_441);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    if (_455)
    {
        float _611 = _589 * 0.15915493667125701904296875;
        _585 = _611;
    }
    float _613 = _585;
    float _615 = _527 * _593;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _617;
    float _621 = _589;
    float _623 = _593;
    if (_479)
    {
        float _625 = in.m_56.x;
        float _627 = in.m_56.y;
        _621 = _625;
        _623 = _627;
    }
    float _629 = _621;
    float _631 = _623;
    float _633 = _597;
    if (_459)
    {
        float _635 = _597 * 6.283185482025146484375;
        float _637 = sin(_635);
        _633 = _637;
    }
    float _639 = _633;
    float _641 = -_527;
    float _643 = _641 + 1.0;
    bool _645 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _647 = isnan(_441);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _619 * _565;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _661 = _441 + _659;
    float _663 = -_609;
    float _665 = _663 + 1.0;
    float _667 = _609 * _643;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _441 + _669;
    float _673 = _613;
    float _675 = _643;
    if (_455)
    {
        float _677 = _613 * 6.283185482025146484375;
        float _679 = sin(_677);
        _673 = _679;
    }
    float _681 = _673;
    float _683 = fma(_583, _661, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _685 = _655 * _665;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _689 = _441 + _687;
    float _691 = fma(_581, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _693 = _537 + _467;
    float _695 = _683 * _685;
    float _697 = -_655;
    float _699 = _697 + 1.0;
    float _701 = fma(_657, _689, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _703 = _515 + _449;
    float _705 = _539 + _475;
    float _707 = _695;
    if (_459)
    {
        bool _709 = _639 > 0.5;
        _223 = _709;
    }
    bool _711 = _223;
    float _713 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    if (_479)
    {
        _571 = 0;
    }
    int _715 = _571;
    int _717 = _715;
    if (_455)
    {
        bool _719 = _681 > 0.5;
        _225 = _719;
    }
    bool _721 = _225;
    float _723 = _629;
    float _725 = _631;
    if (_479)
    {
        _573 = _629;
    }
    float _727 = _573;
    float _729 = _727;
    if (_479)
    {
        _575 = _631;
    }
    float _731 = _575;
    float _733 = _731;
    if (!_479)
    {
        float _735 = in.m_56.x;
        float _737 = in.m_56.y;
        float _739 = _735 * 3.1415927410125732421875;
        float _741 = _739 * 0.15915493667125701904296875;
        float _743 = _737 * 3.1415927410125732421875;
        float _745 = _743 * 0.15915493667125701904296875;
        float _747 = _741 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = _745 * 6.283185482025146484375;
        float _753 = sin(_751);
        _723 = _735;
        _725 = _737;
        _717 = 1;
        _729 = _749;
        _733 = _753;
    }
    float _755 = _723;
    float _757 = _725;
    int _759 = _717;
    float _761 = _729;
    float _763 = _733;
    float _765 = _755;
    if (!_459)
    {
        _675 = _213;
    }
    float _767 = _675;
    float _769 = in.m_56.z;
    float _771 = _767;
    if (_459)
    {
        float _773 = -_213;
        float _775 = _711 ? _773 : _213;
        _771 = _775;
    }
    float _777 = _771;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _781 = _755 > 0.5;
    float _783 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _785 = _757 > 0.5;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _791 = _789 != 0;
    float _793 = fma(_691, _667, _713);
    float _795 = -_213;
    int _797 = _781 ? as_type<int>(_795) : as_type<int>(_213);
    float _799 = -_787;
    float _801 = fma(_783, 2.0, _799);
    float _803 = _793;
    if (!_455)
    {
        _707 = _217;
    }
    float _805 = _707;
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _809 = _805;
    if (_455)
    {
        float _811 = -_217;
        float _813 = _721 ? _811 : _217;
        _809 = _813;
    }
    float _815 = _809;
    float _817 = -_139;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[76].x, _801);
    bool _821 = _759 != 1;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _825 = _823 != 0;
    float _827 = -_217;
    int _829 = _785 ? as_type<int>(_827) : as_type<int>(_217);
    float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _833 = !_791;
    float _835 = _833 ? _213 : as_type<float>(_797);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _839 = _837 != 0;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _843 = _841 != 0;
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _847 = !_825;
    float _849 = _847 ? _217 : as_type<float>(_829);
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _855 = _853 != 0;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _859 = _857 != 0;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _863 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[93].z, _851);
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _867 = _761 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _869 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[93].w, _861);
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _875 = _757 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _877 = _763 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _879 = -_865;
    float _881 = fma(_867, 2.0, _879);
    float _883 = _779 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _885 = fma(_875, -2.0, _871);
    float _887 = _865;
    float _889 = _883;
    float _891 = _815;
    if (!_821)
    {
        _887 = _769;
    }
    float _893 = _887;
    float _895 = fma(_877, -2.0, _873);
    float _897 = -_139;
    float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[91].x, _881);
    float _901 = _777 + 0.5;
    float _903 = fma(_701, _615, _793);
    float _905 = _893;
    float _907 = _899;
    if (!_821)
    {
        _803 = _893;
    }
    float _909 = _803;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _913 = _909;
    if (_821)
    {
        _905 = _769;
    }
    float _915 = _905;
    float _917 = fma(_883, _901, _899);
    float _919 = _807 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _921 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _895);
    if (!_821)
    {
        _907 = _757;
    }
    float _923 = _907;
    float _925 = _815 + (-0.5);
    float _927 = _923;
    if (!_821)
    {
        _889 = _757;
    }
    float _929 = _889;
    float _931 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].z, _911);
    float _933 = _929;
    if (_821)
    {
        _927 = _755;
    }
    float _935 = _927;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    if (_821)
    {
        _933 = _755;
    }
    float _939 = _933;
    float _941 = -_919;
    float _943 = -_921;
    float _945 = fma(_941, _925, _943);
    if (_821)
    {
        _765 = _915;
    }
    float _947 = _765;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _951 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[118].x, _903);
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _955 = _703 + _953;
    float _957 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[84].z, _937);
    float _959 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[83].z, _949);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _963 = _693 + _961;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _967 = _955 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _969 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[84].x, _957);
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_821)
    {
        _971 = _909;
    }
    float _973 = _971;
    float _975 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[78].w, _965);
    float _977 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[28].x, _967);
    float _979 = _969 * (-0.15915493667125701904296875);
    float _981 = _831 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _983 = _835 + 0.5;
    float _985 = _973;
    if (_821)
    {
        _985 = _757;
    }
    float _987 = _985;
    float _989 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _885);
    if (_821)
    {
        _913 = _757;
    }
    float _991 = _913;
    float _993 = fma(_981, _983, _819);
    float _995 = _979 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1001 = _849 + (-0.5);
    float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1005 = _705 + _1003;
    float _1007 = _935 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1009 = -_999;
    float _1011 = -_989;
    float _1013 = fma(_1009, _1001, _1011);
    float _1015 = -_217;
    int _1017 = _505 ? as_type<int>(_1015) : as_type<int>(_217);
    float _1019 = _979 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    bool _1023 = _915 > 0.5;
    float _1025 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[28].z, _977);
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1029 = !_843;
    float _1031 = _1029 ? _217 : as_type<float>(_1017);
    float _1033 = _987 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1035 = -_213;
    int _1037 = _1023 ? as_type<int>(_1035) : as_type<int>(_213);
    float _1039 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _869);
    float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1043 = _1025 >= 0.0;
    float _1045 = -_1027;
    float _1047 = fma(_1007, 2.0, _1045);
    float _1049 = _1031 * _997;
    float _1051 = -_139;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1047);
    bool _1055 = !_839;
    float _1057 = _1055 ? _213 : as_type<float>(_1037);
    float _1059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1065 = _1031 * _1021;
    float _1067 = -_1049;
    float _1069 = fma(_1057, _1021, _1067);
    float _1071 = -_213;
    int _1073 = _785 ? as_type<int>(_1071) : as_type<int>(_213);
    float _1075 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1061);
    float _1077 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _975);
    float _1079 = fma(_1033, -2.0, _1063);
    float _1081 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _863);
    float _1083 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1085 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _931);
    float _1087 = _1069 + 0.5;
    float _1089 = fma(_1057, _997, _1065);
    bool _1091 = !_855;
    float _1093 = _1091 ? _213 : as_type<float>(_1073);
    float _1095 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _959);
    float _1097 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1075);
    float _1099 = fma(_1083, _1087, _1053);
    float _1101 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1079);
    float _1103 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1105 = _1089 + (-0.5);
    float _1107 = _1093 + 0.5;
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1111 = -_1081;
    float _1113 = _1111 + 1.0;
    float _1115 = -_1103;
    float _1117 = -_1101;
    float _1119 = fma(_1115, _1105, _1117);
    float _1121 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1123 = _955 * _955;
    float _1125 = -_217;
    int _1127 = _1023 ? as_type<int>(_1125) : as_type<int>(_217);
    float _1129 = -_1113;
    float _1131 = fma(_1129, _777, _917);
    float _1133 = -_1085;
    float _1135 = _1133 + 1.0;
    float _1137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1139 = fma(_963, _963, _1123);
    bool _1141 = !_859;
    float _1143 = _1141 ? _217 : as_type<float>(_1127);
    float _1145 = -_1039;
    float _1147 = _1145 + 1.0;
    float _1149 = -_1135;
    float _1151 = fma(_835, _1149, _993);
    float _1153 = fma(_1005, _1005, _1139);
    float _1155 = -_1095;
    float _1157 = _1155 + 1.0;
    float _1159 = -_1143;
    float _1161 = _1159 + 0.5;
    float _1163 = fma(_1147, _815, _945);
    float _1165 = rsqrt(_1153);
    float _1167 = _1121 * _1109;
    float _1169 = -_1077;
    float _1171 = _1169 + 1.0;
    if (_1043)
    {
        _891 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1173 = _891;
    float _1175 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1177 = -_1097;
    float _1179 = _1177 + 1.0;
    float _1181 = fma(_849, _1171, _1013);
    float _1183 = _951 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1185 = _1175 * _1137;
    int _1187 = as_type<int>(_1173);
    if (_1043)
    {
        float _1189 = _1173 * 5.0;
        _1187 = as_type<int>(_1189);
    }
    int _1191 = _1187;
    float _1193 = -_1157;
    float _1195 = fma(_1069, _1193, _1099);
    float _1197 = fma(_1089, _1179, _1119);
    out.m_66.x = _1131;
    out.m_66.y = _1163;
    float _1199 = _955 * _1165;
    out.m_68.w = _1183;
    float _1201 = _963 * _1165;
    if (_1043)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4214 = as_type<float>(_1191);
        out.gl_Position.z = _4214;
    }
    out.m_70.x = _1167;
    out.m_70.y = _1185;
    out.m_72.x = _1151;
    out.m_72.y = _1181;
    out.m_72.z = _1195;
    out.m_72.w = _1197;
    if (_1043)
    {
        out.m_47.x = 0.0;
    }
    if (_1043)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1203 = -_1199;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    float _1207 = _1005 * _1165;
    float _1209 = -_1201;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _1213 = -_1199;
    float _1215 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1219 = _1205 + _1217;
    float _1221 = -_1207;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1227 = _1211 + _1225;
    float _1229 = -_1201;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1233 = _1219 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1237 = _1223 + _1235;
    float _1239 = _1215 * _1215;
    float _1241 = -_1207;
    float _1243 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1005);
    float _1245 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1233);
    float _1247 = fma(_1231, _1231, _1239);
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1245);
    float _1251 = fma(_1243, _1243, _1247);
    bool _1253 = _1249 >= 0.0;
    float _1255 = sqrt(_1251);
    float _1257 = _1249;
    float _1259 = _1219;
    float _1261 = _1227;
    float _1263 = _1211;
    float _1265 = _1223;
    if (_1253)
    {
        _1257 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1267 = _1257;
    int _1269 = as_type<int>(_1267);
    if (_1253)
    {
        out.m_47.x = 0.0;
    }
    if (_1253)
    {
        float _1271 = _1267 * 5.0;
        _1269 = as_type<int>(_1271);
    }
    int _1273 = _1269;
    float _1275 = _1165 * _1255;
    if (_1253)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4362 = as_type<float>(_1273);
        out.gl_Position.z = _4362;
    }
    if (_1253)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1277 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1279 = _409 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _1285 = _1275 * _1277;
    float _1287 = _1275 * _1279;
    float _1289 = _1281 * _1285;
    float _1291 = _1283 * _1287;
    float _1293 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1295 = _1293 * 0.5;
    bool _1297 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1305 = _1301 || _1303;
    float _1307 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1311 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1313 = isnan(0.5);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1319 = _1315 || _1317;
    float _1321 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1307);
    float _1323 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1325 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1309);
    float _1327 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1321);
    float _1329 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1323);
    float _1331 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1325);
    float _1333 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1335 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1329);
    float _1337 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1339 = _705 + _1333;
    float _1341 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1343 = _693 + _1337;
    float _1345 = _1205 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1349 = _1339 + _1347;
    float _1351 = 1.0 / _1341;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1355 = _1343 + _1353;
    float _1357 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1359 = _1349 * _1349;
    float _1361 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1357);
    float _1363 = fma(_1355, _1355, _1359);
    float _1365 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1367 = sqrt(_1363);
    float _1369 = _1365 + _1341;
    float _1371 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1373 = _1369 * _1351;
    float _1375 = _1373 * 0.5;
    float _1377 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1371);
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1381 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1379);
    float _1383 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1377);
    bool _1385 = _1367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1387 = 1.0 / _1381;
    float _1389 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1391 = _703 + _1389;
    float _1393 = _1375;
    float _1395 = _1295;
    float _1397 = _1343;
    float _1399 = _1389;
    if (!_1385)
    {
        _1393 = _1339;
    }
    float _1401 = _1393;
    float _1403 = _1401;
    if (!_1385)
    {
        _1395 = _1391;
    }
    float _1405 = _1395;
    bool _1407 = !_1385;
    float _1409 = _1405;
    if (!_1407)
    {
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1415 = _1367 + _1413;
        float _1417 = _1391 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1419 = _1415 * _1411;
        float _1421 = rsqrt(_1363);
        float _1423 = _1419 * 0.15915493667125701904296875;
        float _1425 = _1423 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = _1423 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1427 + (-1.0);
        float _1435 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1437 = fma(_1431, _1417, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1439 = fma(_1391, _1427, _1435);
        float _1441 = _1421 * _1437;
        float _1443 = fma(_1355, _1441, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1445 = fma(_1349, _1441, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1397 = _1443;
        _1409 = _1439;
        _1403 = _1445;
        _1399 = _1441;
    }
    float _1447 = _1397;
    float _1449 = _1409;
    float _1451 = _1403;
    float _1453 = _1399;
    float _1455 = -_1201;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1447);
    float _1459 = -_1199;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1449);
    float _1463 = -_1207;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1467 = _1453;
    float _1469 = _1461;
    float _1471 = _1457;
    float _1473 = _1465;
    float _1475 = _1447;
    if (_1319)
    {
        _1467 = 1.0;
    }
    float _1477 = _1467;
    float _1479 = _1477;
    if (!_1305)
    {
        float _1481 = _1219 * _1219;
        float _1483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1485 = -_705;
        float _1487 = _1485 + _1451;
        float _1489 = -_703;
        float _1491 = _1489 + _1449;
        float _1493 = fma(_1227, _1227, _1481);
        float _1495 = fma(_1237, _1237, _1493);
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1499 = sqrt(_1495);
        float _1501 = 1.0 / _1275;
        float _1503 = precise::min(_1499, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1505 = _1503 * _1483;
        float _1507 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1509 = _1505 * _1501;
        float _1511 = -_693;
        float _1513 = _1511 + _1447;
        float _1515 = _1507 * _1509;
        float _1517 = _1487 * _1509;
        float _1519 = fma(_1513, _1515, _1211);
        float _1521 = fma(_1491, _1515, _1205);
        float _1523 = fma(_1507, _1517, _1223);
        _1259 = _1507;
        _1469 = _1521;
        _1471 = _1519;
        _1473 = _1523;
    }
    float _1525 = _1259;
    float _1527 = _1469;
    float _1529 = _1471;
    float _1531 = _1473;
    float _1533 = _1525;
    if (_1319)
    {
        _1261 = 1.0;
    }
    float _1535 = _1261;
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1539 = _1387 * _1537;
    float _1541 = _1535;
    if (!_1319)
    {
        float _1543 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1545 = _1543 * 0.15915493667125701904296875;
        float _1547 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = _1545 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1547 * 0.15915493667125701904296875;
        float _1555 = _1545 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = 1.0 / _1551;
        float _1561 = _1553 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = _1557 * _1559;
        float _1567 = _1553 * 6.283185482025146484375;
        float _1569 = sin(_1567);
        float _1571 = _1563 * _1565;
        float _1573 = 1.0 / _1571;
        float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1577 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1575;
        float _1579 = 1.0 / _1577;
        float _1581 = _1569 * _1573;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = fma(_1539, _1581, _1583);
        float _1587 = _1585 * _1579;
        float _1589 = precise::clamp(_1587, 0.0, 1.0);
        _1533 = _1545;
        _1263 = _1553;
        _1479 = _1589;
    }
    float _1591 = _1533;
    float _1593 = _1263;
    float _1595 = _1479;
    float _1597 = _1591;
    float _1599 = _1593;
    if (!_1319)
    {
        float _1601 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = _1601 * 0.15915493667125701904296875;
        float _1605 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1607 = _1603 * 6.283185482025146484375;
        float _1609 = cos(_1607);
        float _1611 = _1605 * 0.15915493667125701904296875;
        float _1613 = _1603 * 6.283185482025146484375;
        float _1615 = sin(_1613);
        float _1617 = 1.0 / _1609;
        float _1619 = _1611 * 6.283185482025146484375;
        float _1621 = cos(_1619);
        float _1623 = _1615 * _1617;
        float _1625 = _1611 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = _1621 * _1623;
        float _1631 = 1.0 / _1629;
        float _1633 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1635 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1633;
        float _1637 = 1.0 / _1635;
        float _1639 = _1627 * _1631;
        float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1643 = fma(_1539, _1639, _1641);
        float _1645 = _1643 * _1637;
        float _1647 = precise::clamp(_1645, 0.0, 1.0);
        float _1649 = -_1647;
        float _1651 = _1649 + 1.0;
        _1597 = _1617;
        _1599 = _1629;
        _1541 = _1651;
    }
    float _1653 = _1597;
    float _1655 = _1599;
    float _1657 = _1541;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1661 = _1527 + _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1665 = _1529 + _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1669 = _1531 + _1667;
    float _1671 = _1661 * _1661;
    float _1673 = fma(_1665, _1665, _1671);
    float _1675 = fma(_1669, _1669, _1673);
    float _1677 = rsqrt(_1675);
    float _1679 = sqrt(_1675);
    float _1681 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1683 = _1665 * _1681;
    float _1685 = _1669 * _1681;
    float _1687 = _1683 * _1683;
    float _1689 = _1685 * _1685;
    float _1691 = _1687 + _1689;
    float _1693 = sqrt(_1691);
    bool _1695 = _1693 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1699 = _1693 + _1697;
    float _1701 = _1653;
    float _1703 = _1699;
    float _1705 = _1661;
    float _1707 = _1683;
    if (_1695)
    {
        float _1709 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1709;
    }
    float _1711 = _1701;
    float _1713 = _1711;
    if (_1695)
    {
        float _1715 = _1699 * _1711;
        _1703 = _1715;
    }
    float _1717 = _1703;
    if (_1695)
    {
        float _1719 = rsqrt(_1691);
        _1713 = _1719;
    }
    float _1721 = _1713;
    float _1723 = _1721;
    if (_1695)
    {
        float _1725 = _1717 * 0.15915493667125701904296875;
        _1265 = _1725;
    }
    float _1727 = _1265;
    float _1729 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1731 = _1669;
    if (_1695)
    {
        float _1733 = _1727 * 6.283185482025146484375;
        float _1735 = sin(_1733);
        _1731 = _1735;
    }
    float _1737 = _1731;
    float _1739 = precise::max(0.0, _1729);
    float _1741 = _1655;
    float _1743 = _1739;
    if (_1695)
    {
        float _1745 = _1727 * 6.283185482025146484375;
        float _1747 = cos(_1745);
        _1741 = _1747;
    }
    float _1749 = _1741;
    float _1751 = -_1681;
    float _1753 = -_1739;
    float _1755 = fma(_1661, _1751, _1753);
    if (_1695)
    {
        float _1757 = _1755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1705 = _1757;
    }
    float _1759 = _1705;
    float _1761 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1763 = _1737;
    float _1765 = _1759;
    if (_1695)
    {
        float _1767 = fma(_1737, _1759, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1763 = _1767;
    }
    float _1769 = _1763;
    float _1771 = _1769;
    if (!_1695)
    {
        _1765 = _1755;
    }
    float _1773 = _1765;
    float _1775 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1777 = _1773;
    if (_1695)
    {
        float _1779 = _1721 * _1769;
        _1475 = _1779;
    }
    float _1781 = _1475;
    if (!_1695)
    {
        _1771 = _1687;
    }
    float _1783 = _1771;
    float _1785 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1775);
    float _1787 = _1783;
    float _1789 = _1749;
    if (_1695)
    {
        float _1791 = _1749 + (-1.0);
        _1743 = _1791;
    }
    float _1793 = _1743;
    float _1795 = _1793;
    if (_1695)
    {
        float _1797 = _1683 * _1781;
        _1707 = _1797;
    }
    float _1799 = _1707;
    float _1801 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1785);
    if (_1695)
    {
        float _1803 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1803;
    }
    float _1805 = _1723;
    if (!_1695)
    {
        _1795 = _1685;
    }
    float _1807 = _1795;
    float _1809 = _1807;
    if (_1695)
    {
        float _1811 = _1685 * _1781;
        _1809 = _1811;
    }
    float _1813 = _1809;
    if (_1695)
    {
        float _1815 = _1799 * _1799;
        _1787 = _1815;
    }
    float _1817 = _1787;
    if (_1695)
    {
        float _1819 = fma(_1755, _1749, _1805);
        _1777 = _1819;
    }
    float _1821 = _1777;
    if (!_1695)
    {
        _1789 = _1689;
    }
    float _1823 = _1789;
    float _1825 = _1823;
    if (_1695)
    {
        float _1827 = _1813 * _1813;
        _1825 = _1827;
    }
    float _1829 = _1825;
    float _1831 = fma(_1821, _1821, _1817);
    float _1833 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1835 = _1831 + _1829;
    float _1837 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1833);
    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1841 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1839);
    float _1843 = precise::clamp(_1841, 0.0, 1.0);
    float _1845 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1847 = rsqrt(_1835);
    float _1849 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1837);
    float _1851 = -_1843;
    float _1853 = _1851 + 1.0;
    float _1855 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1857 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1845);
    float _1859 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1861 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1855);
    float _1863 = abs(_1853);
    float _1865 = log2(_1863);
    float _1867 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1857);
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1871 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1861);
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1875 = -_1869;
    float _1877 = fma(_1875, _1761, 1.0);
    float _1879 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1881 = _1847 * _1799;
    float _1883 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1885 = _1847 * _1821;
    float _1887 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1889 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1891 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1883);
    float _1893 = _1847 * _1813;
    float _1895 = log2(_1877);
    float _1897 = -_1889;
    float _1899 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1897);
    float _1901 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1903 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1891);
    float _1905 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1907 = -_1893;
    float _1909 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1899);
    float _1911 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1913 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1903);
    float _1915 = exp2(_1901);
    float _1917 = fma(_1909, -0.5, 0.5);
    float _1919 = fma(_1909, 0.5, 0.5);
    float _1921 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1911);
    float _1923 = _1885 + 1.0;
    float _1925 = fma(_1919, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1927 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1921);
    float _1929 = 1.0 / _1913;
    float _1931 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1905);
    float _1933 = fma(_1919, _1925, -0.212114393711090087890625);
    float _1935 = _1895 * 0.693147182464599609375;
    float _1937 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1931);
    float _1939 = fma(_1919, _1933, 1.570728778839111328125);
    float _1941 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1943 = sqrt(_1917);
    float _1945 = -_1885;
    float _1947 = fma(_1915, _1923, _1945);
    float _1949 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1927);
    float _1951 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1937);
    float _1953 = fma(_1947, 0.5, 0.5);
    float _1955 = _1949 * _1929;
    float _1957 = _1951 * _1929;
    float _1959 = fma(_1955, 0.5, 0.5);
    float _1961 = fma(_1957, -0.5, 0.5);
    float _1963 = _1943 * 0.636619746685028076171875;
    float3 _5450 = float3(_1959, _1961, _1941);
    float _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5450, float3(0.0), isnan(_5450)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5450, float3(0.0), isnan(_5450)), level(0.0)).x;
    float _1967 = -_1939;
    float _1969 = fma(_1963, _1967, 1.0);
    float3 _5466 = float3(_1959, _1961, _1941);
    float4 _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5466, float3(0.0), isnan(_5466)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5466, float3(0.0), isnan(_5466)), level(0.0)).xyzw;
    float _1974 = _1972.x;
    float _1976 = _1972.y;
    float _1978 = _1972.z;
    float _1980 = _1972.w;
    float2 _5483 = float2(_1969, _1953);
    float3 _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5483, float2(0.0), isnan(_5483)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5483, float2(0.0), isnan(_5483)), level(0.0)).xyz;
    float _1986 = _1984.x;
    float _1988 = _1984.y;
    float _1990 = _1984.z;
    float _1992 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1994 = _1873 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1996 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1998 = fma(_1992, _1992, 1.0);
    float _2000 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1994);
    float _2002 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2004 = exp2(_2002);
    bool _2006 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2008 = isnan(_1679);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2014 = _2010 || _2012;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2016 = rsqrt(_1998);
    float _2018 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2000);
    float _2020 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2022 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2018);
    float _2024 = _1949 + _1913;
    float _2026 = -_2004;
    float _2028 = _2026 + 1.0;
    float _2030 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2032 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2034 = _2022 + _1913;
    float _2036 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2030);
    float _2040 = _1913 * 0.5;
    float _2042 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2032);
    float _2044 = _1992 * _2016;
    float _2046 = _2034 * 0.5;
    float _2048 = _2024 * 0.5;
    float _2050 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2052 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2054 = _2044 * _2052;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2058 = _2044 * _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2062 = _2044 * _2060;
    float _2064 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2066 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2054);
    float _2068 = fma(_1951, -0.5, _2040);
    float _2070 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2020);
    float _2072 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2058);
    float _2074 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2062);
    float _2076 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.gl_Position.x = _1949;
    out.gl_Position.y = _1951;
    out.gl_Position.z = _2022;
    out.gl_Position.w = _1913;
    float _2078 = _1992;
    float _2080 = _1951;
    float _2082 = _2022;
    float _2084 = _1949;
    float _2086 = _2066;
    if (!_2014)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2088 = _2078;
    out.m_76.x = _2048;
    out.m_76.y = _2068;
    out.m_76.z = _2046;
    out.m_76.w = _1913;
    out.m_78.x = _2050;
    out.m_78.y = _2064;
    out.m_78.z = _2076;
    out.m_80.x = _2066;
    out.m_80.y = _2072;
    out.m_80.z = _2074;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2014)
    {
        _2080 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    float _2098 = _2094;
    if (!_2014)
    {
        _2082 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2100 = _2082;
    float _2102 = _2100;
    float _2104 = _2100;
    if (!_2014)
    {
        _2084 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2106 = _2084;
    float _2108 = _2106;
    float _2110 = _2106;
    if (!_2014)
    {
        _2086 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2112 = _2086;
    float _2114 = _2036 * _1965;
    float _2116 = -_2036;
    float _2118 = _2116 + 1.0;
    float _2120 = _1980 * _2114;
    float _2122 = _1990 * _2114;
    float _2124 = fma(_1986, _2120, _1974);
    float _2126 = fma(_1988, _2120, _1976);
    float _2128 = _1980 * _2118;
    float _2130 = fma(_1980, _2122, _1978);
    float _2132 = _1595 * _1657;
    out.m_82.x = _2124;
    out.m_82.y = _2126;
    out.m_82.z = _2130;
    out.m_82.w = _2128;
    float _2134 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2136 = _2132;
    float _2138 = _2112;
    float _2140 = _2112;
    if (!_2014)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2142 = _2136;
    bool _2144 = !_2014;
    float _2146 = _2142;
    float _2148 = _2142;
    if (!_2144)
    {
        bool _2150 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2152 = isnan(_1679);
        bool _2154 = _2150 || _2152;
        bool _2156 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2158 = _2154 || _2156;
        if (!_2158)
        {
            float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2162 = _1679 + _2160;
            float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2166 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2164;
            float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2172 = 1.0 / _2166;
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2188 = _2186 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2190 = _2162 * _2172;
            float _2192 = precise::clamp(_2190, 0.0, 1.0);
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2198 = fma(_2192, _2170, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2200 = fma(_2192, _2196, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2202 = fma(_2192, _2176, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2204 = fma(_2192, _2180, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2206 = fma(_2192, _2184, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2208 = fma(_2192, _2188, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2140 = _2198;
            _2092 = _2206;
            _2098 = _2202;
            _2110 = _2204;
            _2104 = _2200;
            _2148 = _2208;
            _2210 = true;
        }
        else
        {
            bool _2212 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2214 = isnan(_1679);
            bool _2216 = _2212 || _2214;
            bool _2218 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2220 = _2216 || _2218;
            if (!_2220)
            {
                _2096 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2222 = _2096;
            _2098 = _2222;
            if (!_2220)
            {
                _2138 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2224 = _2138;
            _2140 = _2224;
            if (!_2220)
            {
                _2102 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2226 = _2102;
            _2104 = _2226;
            if (!_2220)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2228 = _2108;
            _2110 = _2228;
            if (!_2220)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2230 = _2090;
            _2092 = _2230;
            if (!_2220)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2232 = _2146;
            bool _2234 = !_2220;
            _2148 = _2232;
            if (!_2234)
            {
                bool _2236 = _1679 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2238 = isnan(_1679);
                bool _2240 = _2236 || _2238;
                bool _2242 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2244 = _2240 || _2242;
                if (!_2244)
                {
                    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2248 = _1679 + _2246;
                    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2252 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2250;
                    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2258 = 1.0 / _2252;
                    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2266 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2276 = _2248 * _2258;
                    float _2278 = precise::clamp(_2276, 0.0, 1.0);
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2284 = fma(_2278, _2256, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2286 = fma(_2278, _2282, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2288 = fma(_2278, _2262, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2290 = fma(_2278, _2266, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2292 = fma(_2278, _2270, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2294 = fma(_2278, _2274, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2140 = _2284;
                    _2092 = _2292;
                    _2098 = _2288;
                    _2110 = _2290;
                    _2104 = _2286;
                    _2148 = _2294;
                    _2210 = true;
                }
                else
                {
                    _2140 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2098 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2104 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2210 = false;
    float _2296 = _2140;
    float _2298 = _2092;
    float _2300 = _2098;
    float _2302 = _2110;
    float _2304 = _2104;
    float _2306 = _2148;
    float _2308 = _2134 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2310 = fma(_2064, -0.5, 0.5);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = -_2296;
    float _2316 = _2314 + _2298;
    float _2318 = -_2300;
    float _2320 = _2318 + _2302;
    out.m_47.x = _2308;
    float _2322 = -_2304;
    float _2324 = _2322 + _2306;
    float _2326 = fma(_2312, _2316, _2296);
    float _2328 = fma(_2312, _2320, _2300);
    bool _2330 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2332 = _2326 * 0.586610972881317138671875;
    float _2334 = fma(_2312, _2324, _2304);
    out.m_84.x = 0.0;
    bool _2336 = _1595 > 0.0;
    bool _2338 = isnan(_1595);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(0.0);
    bool _2344 = _2340 || _2342;
    float _2346 = fma(_2328, 0.298911988735198974609375, _2332);
    bool _2348 = _1657 <= 0.0;
    bool _2350 = !_2344;
    bool _2352 = _2348 || _2350;
    float _2354 = fma(_2334, 0.114477999508380889892578125, _2346);
    float _2356 = -_2354;
    float _2358 = _2328 + _2356;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2354);
    bool _2362 = !_2330;
    if (!_2362)
    {
        float _2364 = -_1527;
        float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2368 = -_1529;
        float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2372 = -_1531;
        float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2376 = _2366 * _2366;
        float _2378 = fma(_2370, _2370, _2376);
        float _2380 = fma(_2374, _2374, _2378);
        float _2382 = sqrt(_2380);
        float _2384 = rsqrt(_2380);
        float _2386 = -_2382;
        float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2390 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2392 = precise::clamp(_2390, 0.0, 1.0);
        float _2394 = _2370 * _2384;
        float _2396 = _2366 * _2384;
        float _2398 = abs(_2392);
        float _2400 = log2(_2398);
        float _2402 = _2374 * _2384;
        float _2404 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2406 = _2064 * _2396;
        float _2408 = -_2396;
        float _2410 = -_2404;
        float _2412 = fma(_2408, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2410);
        float _2414 = fma(_2050, _2394, _2406);
        float _2416 = -_2402;
        float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2412);
        float _2420 = fma(_2076, _2402, _2414);
        float _2422 = precise::clamp(_2420, 0.0, 1.0);
        float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2426 = _2418 + _2424;
        float _2428 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2430 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2432 = precise::clamp(_2430, 0.0, 1.0);
        float _2434 = exp2(_2428);
        float _2436 = _2434 * _2432;
        float _2438 = _2422 * _2436;
        float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_84.x = _2440;
    }
    out.m_86.x = _2360;
    if (!_2352)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2442 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2442;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

