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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_78 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_66 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _361 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3330 = as_type<float>(_119);
        out.gl_Position.z = _3330;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_47.w;
    float _125 = in.m_49.w;
    bool _127 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_123);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_123;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.w = _125;
    float _141 = _139;
    float _143 = _125;
    if (_135)
    {
        float _145 = float(_103);
        _113 = _145;
    }
    float _147 = _113;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_45.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _121 = as_type<int>(_159);
    }
    int _161 = _121;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3405 = as_type<float>(_161);
        out.gl_Position.z = _3405;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_49.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_103);
        float _207 = 1.0 / _205;
        float _209 = _139 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    bool _229 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_211);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -_227;
    float _251 = _249 + 1.0;
    float _253 = 1.0 / _243;
    bool _255 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _257 = isnan(_211);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = _239 * _251;
    float _269 = -_239;
    float _271 = _269 + 1.0;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _275 = _265 * _271;
    float _277 = 1.0 / _247;
    float _279 = -_265;
    float _281 = _279 + 1.0;
    float _283 = _215 * _253;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _211 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_291, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _287 * _277;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _307 = _297 * _275;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = _299 * _275;
    float _315 = fma(_305, _301, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _317 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _319 = fma(_311, _301, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _321 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _313);
    float _323 = fma(_315, _267, _317);
    float _325 = fma(_319, _267, _321);
    float _327 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[145].x, _323);
    float _329 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[145].y, _325);
    bool _331 = !_273;
    float _333 = _313;
    int _335 = as_type<int>(_321);
    float _337 = _267;
    int _339 = as_type<int>(_325);
    float _341 = _275;
    float _359;
    if (!_331)
    {
        float _343 = in.m_49.x;
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _347 = _343 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _333 = _353;
        _359 = _357;
        _361 = true;
    }
    else
    {
        float _363 = float(_103);
        float _365 = 1.0 / _363;
        float _367 = _139 * _365;
        _359 = _367;
    }
    _361 = false;
    float _369 = _333;
    float _371 = _359;
    float _373 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _375 = int(_373);
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _379 = _377 != 0;
    float _381 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].y);
    int _383 = int(_381);
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _387 = _369;
    float _389 = _315;
    if (_379)
    {
        float _391 = in.m_49.x;
        float _393 = in.m_49.y;
        float _395 = in.m_49.z;
        _385 = _391;
        _387 = _393;
        _389 = _395;
    }
    float _397 = _385;
    float _399 = _387;
    float _401 = _389;
    float _403 = 0.0;
    if (_379)
    {
        _403 = 1.0;
    }
    float _405 = _403;
    float _407 = 0.0;
    float _409 = _405;
    if (_379)
    {
        _407 = 1.0;
    }
    float _411 = _407;
    float _413 = _411;
    if (_379)
    {
        _335 = 0;
    }
    int _415 = _335;
    float _417 = 0.0;
    float _419 = _401;
    float _421 = _397;
    int _423 = _415;
    float _425 = _399;
    if (_379)
    {
        _417 = _397;
    }
    float _427 = _417;
    float _429 = _427;
    if (_379)
    {
        _337 = _399;
    }
    float _431 = _337;
    float _433 = _431;
    if (_379)
    {
        _339 = as_type<int>(_401);
    }
    int _435 = _339;
    float _437 = 0.0;
    int _439 = _435;
    if (_379)
    {
        _437 = _427;
    }
    float _441 = _437;
    float _443 = _441;
    if (_379)
    {
        _341 = _427;
    }
    float _445 = _341;
    float _447 = _445;
    if (!_379)
    {
        float _449 = in.m_49.x;
        float _451 = in.m_49.y;
        float _453 = in.m_49.z;
        float _455 = _449 * 3.1415927410125732421875;
        float _457 = _455 * 0.15915493667125701904296875;
        float _459 = _451 * 3.1415927410125732421875;
        float _461 = _459 * 0.15915493667125701904296875;
        float _463 = _453 * 3.1415927410125732421875;
        float _465 = _457 * 6.283185482025146484375;
        float _467 = sin(_465);
        float _469 = _463 * 0.15915493667125701904296875;
        float _471 = _461 * 6.283185482025146484375;
        float _473 = sin(_471);
        float _475 = _469 * 6.283185482025146484375;
        float _477 = sin(_475);
        _419 = _453;
        _447 = _467;
        _421 = _449;
        _423 = 1;
        _433 = _473;
        _425 = _451;
        _439 = as_type<int>(_477);
        _413 = 1.2345600128173828125;
        _443 = _453;
        _409 = 7.345489978790283203125;
        _429 = _451;
    }
    float _479 = _419;
    float _481 = _447;
    float _483 = _421;
    int _485 = _423;
    float _487 = _433;
    float _489 = _425;
    int _491 = _439;
    float _493 = _413;
    float _495 = _443;
    float _497 = _409;
    float _499 = _429;
    float _501 = _479 * 2.0;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _505 = _481 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _507 = _483 * 2.0;
    bool _509 = _485 != 1;
    float _511 = -_503;
    float _513 = fma(_505, 2.0, _511);
    float _515 = _487 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _519 = floor(_501);
    float _521 = fma(_515, -2.0, _517);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _525 = floor(_507);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _529 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[93].w, _523);
    float _531 = _489 * 2.0;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1048576;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2097152;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4194304;
    bool _543 = _541 != 0;
    float _545 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[93].z, _527);
    bool _547 = !_509;
    float _549 = _547 ? _487 : _481;
    float _551 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _529);
    bool _553 = !_509;
    float _555 = _553 ? as_type<float>(_491) : _487;
    float _557 = _489 + _483;
    float _559 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _561 = log2(_559);
    bool _563 = _519 > 0.0;
    float _565 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _521);
    float _567 = _557 + (-1.0);
    bool _569 = _519 >= 0.0;
    bool _571 = isnan(_519);
    bool _573 = _569 || _571;
    bool _575 = isnan(0.0);
    bool _577 = _573 || _575;
    bool _579 = _525 > 0.0;
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _583 = _525 >= 0.0;
    bool _585 = isnan(_525);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = floor(_531);
    float _595 = float(_103);
    float _597 = _489 + _479;
    bool _599 = !_539;
    int _601 = _599 ? 0 : 1;
    float _603 = _489 + (-0.5);
    bool _605 = !_535;
    int _607 = _605 ? 0 : 1;
    float _609 = _597 + (-1.0);
    bool _611 = !_543;
    int _613 = _611 ? 0 : 1;
    float _615 = 1.0 / _595;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _627 = _625 != 0;
    int _629 = _577 ? 0 : 1;
    int _631 = ~_629;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    float _637 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _639 = !_619;
    int _641 = _639 ? 0 : 1;
    float _643 = _561 * _139;
    int _645 = _635;
    if (!_563)
    {
        int _647 = ~_629;
        int _649 = _647 + 1;
        _645 = _649;
    }
    int _651 = _645;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _655 = float(_375);
    float _657 = _615 * _139;
    bool _659 = _593 > 0.0;
    float _661 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[98].z, _653);
    bool _663 = _593 >= 0.0;
    bool _665 = isnan(_593);
    bool _667 = _663 || _665;
    bool _669 = isnan(0.0);
    bool _671 = _667 || _669;
    float _673 = 1.0 / _655;
    float _675 = float(_383);
    float _677 = 1.0 / _675;
    int _679 = abs(_641);
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _687 = float(_651);
    float _689 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _545);
    int _691 = _591 ? 0 : 1;
    float _693 = exp2(_643);
    float _695 = _549 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _697 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[98].w, _685);
    float _699 = _555 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _701 = -_681;
    float _703 = fma(_695, 2.0, _701);
    float _705 = float(_679);
    float _707 = fma(_699, -2.0, _683);
    bool _709 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _711 = isnan(1.0);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _717 = _713 || _715;
    float _719 = in.m_56.x;
    float _721 = in.m_56.y;
    float _723 = in.m_56.z;
    int _725 = ~_691;
    int _727 = _725 + 1;
    int _729 = _727 + 1;
    float _731 = _705 * _687;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _735 = 1.0 + _733;
    int _737 = _729;
    if (!_579)
    {
        int _739 = ~_691;
        int _741 = _739 + 1;
        _737 = _741;
    }
    int _743 = _737;
    float _745 = -_139;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[91].x, _513);
    float _749 = -_693;
    float _751 = _749 + 1.0;
    float _753 = 1.0 / _735;
    bool _755 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _763 = _759 || _761;
    float _765 = _673 * _139;
    bool _767 = !_623;
    int _769 = _767 ? 0 : 1;
    float _771 = _677 * _139;
    float _773 = _763 ? _751 : 0.0;
    float _775 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[97].z, _661);
    int _777 = abs(_769);
    float _779 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[97].w, _697);
    float _781 = -_139;
    float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[96].x, _703);
    float _785 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[96].y, _707);
    float _787 = float(_743);
    float _789 = float(_777);
    int _791 = _671 ? 0 : 1;
    if (_717)
    {
        float _793 = _773 * _753;
        _141 = _793;
    }
    float _795 = _141;
    float _797 = _731 * (-2.0);
    float _799 = _789 * _787;
    int _801 = ~_791;
    int _803 = _801 + 1;
    int _805 = _803 + 1;
    float _807 = _483 + (-0.5);
    float _809 = fma(_797, _719, _719);
    bool _811 = !_627;
    int _813 = _811 ? 0 : 1;
    float _815 = fma(_581, _797, _581);
    int _817 = _805;
    if (!_659)
    {
        int _819 = ~_791;
        int _821 = _819 + 1;
        _817 = _821;
    }
    int _823 = _817;
    float _825 = _799 * (-2.0);
    int _827 = abs(_813);
    float _829 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[196].x, _809);
    float _831 = float(_823);
    float _833 = fma(_637, _825, _637);
    float _835 = float(_827);
    float _837 = fma(_825, _721, _721);
    float _839 = fma(_815, _795, _829);
    float _841 = _483 + _479;
    float _843 = in.m_58.x;
    float _845 = in.m_58.y;
    float _847 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].y, _837);
    float _849 = _835 * _831;
    float _851 = _839 * 0.15915493667125701904296875;
    float _853 = _479 + (-0.5);
    float _855 = fma(_833, _795, _847);
    float _857 = _841 + (-1.0);
    float _859 = _849 * (-2.0);
    float _861 = in.m_42.x;
    float _863 = in.m_42.y;
    float _865 = in.m_42.z;
    float _867 = _855 * 0.15915493667125701904296875;
    float _869 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _871 = fma(_859, _723, _723);
    float _873 = in.m_60.x;
    float _875 = in.m_60.y;
    float _877 = in.m_60.z;
    float _879 = _851 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = fma(_869, _859, _869);
    float _885 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[196].z, _871);
    float _887 = fma(_883, _795, _885);
    float _889 = _851 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = _887 * 0.15915493667125701904296875;
    float _895 = _327 * _843;
    float _897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _899 = _329 * _845;
    float _901 = _867 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _907 = _863 * _875;
    float _909 = _867 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _895 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _917 = fma(_861, _873, _907);
    float _919 = _913 * _897;
    float _921 = _905 * _915;
    float _923 = in.m_62.x;
    float _925 = in.m_62.y;
    float _927 = in.m_62.z;
    float _929 = _893 * 6.283185482025146484375;
    float _931 = cos(_929);
    float _933 = _881 * _903;
    float _935 = fma(_865, _877, _917);
    float _937 = _935 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _939 = _893 * 6.283185482025146484375;
    float _941 = sin(_939);
    float _943 = _891 * _911;
    float _945 = _881 * _911;
    float _947 = _891 * _931;
    float _949 = _891 * _903;
    float _951 = _881 * _931;
    float _953 = _911 * _931;
    float _955 = _947 * _921;
    float _957 = _903 * _931;
    float _959 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _961 = _951 * _921;
    float _963 = fma(_941, _943, _933);
    float _965 = -_921;
    float _967 = _941 * _965;
    float _969 = -_945;
    float _971 = fma(_941, _949, _969);
    float _973 = -_949;
    float _975 = fma(_941, _945, _973);
    float _977 = fma(_963, _919, _955);
    float _979 = fma(_953, _919, _967);
    float _981 = fma(_941, _933, _943);
    float _983 = fma(_975, _919, _961);
    float _985 = fma(_971, _959, _977);
    float _987 = fma(_957, _959, _979);
    float _989 = _863 * _925;
    float _991 = fma(_981, _959, _983);
    float _993 = _985 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _995 = _985 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _997 = fma(_861, _923, _989);
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].x, _993);
    float _1001 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].x, _995);
    float _1003 = fma(_865, _927, _997);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _999);
    float _1007 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    float _1009 = _1003 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1011 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1013 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1015 = in.m_64.x;
    float _1017 = in.m_64.y;
    float _1019 = in.m_64.z;
    float _1021 = _937 + _1011;
    float _1023 = _1009 + _1013;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1027 = _1021 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1031 = _1023 + _1029;
    float _1033 = _1027 * _1027;
    float _1035 = fma(_1031, _1031, _1033);
    float _1037 = sqrt(_1035);
    float _1039 = _863 * _1017;
    float _1041 = _985 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1043 = fma(_861, _1015, _1039);
    float _1045 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1041);
    float _1047 = fma(_865, _1019, _1043);
    bool _1049 = _1037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1051 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1045);
    float _1053 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1065 = _1063 != 0;
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1069 = _1067 != 0;
    float _1071 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1073 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1075 = isnan(0.5);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1081 = _1077 || _1079;
    float _1083 = _1053 + _1071;
    bool _1085 = !_1061;
    int _1087 = _1085 ? 0 : 1;
    bool _1089 = !_1057;
    int _1091 = _1089 ? 0 : 1;
    bool _1093 = !_1065;
    int _1095 = _1093 ? 0 : 1;
    bool _1097 = !_1069;
    int _1099 = _1097 ? 0 : 1;
    float _1101 = _1015;
    float _1103 = _1019;
    float _1105 = _1043;
    float _1107 = _1037;
    float _1109 = _985;
    float _1111 = _1027;
    float _1113 = _975;
    if (!_1049)
    {
        _1101 = _1023;
    }
    float _1115 = _1101;
    float _1117 = _1115;
    if (!_1049)
    {
        _1103 = _1021;
    }
    float _1119 = _1103;
    float _1121 = _1119;
    if (!_1049)
    {
        _1105 = _1083;
    }
    float _1123 = _1105;
    bool _1125 = !_1049;
    float _1127 = _1123;
    if (!_1125)
    {
        float _1129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1133 = _1037 + _1131;
        float _1135 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1137 = rsqrt(_1035);
        float _1139 = _1133 * _1129;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = _1141 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = _1145 + (-1.0);
        float _1153 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = fma(_1149, _1135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1157 = fma(_1083, _1145, _1153);
        float _1159 = _1137 * _1155;
        float _1161 = fma(_1031, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1163 = fma(_1027, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1127 = _1157;
        _1121 = _1163;
        _1117 = _1161;
        _1107 = _1133;
    }
    float _1165 = _1127;
    float _1167 = _1121;
    float _1169 = _1117;
    float _1171 = _1107;
    float _1173 = _1165;
    float _1175 = _1169;
    float _1177 = _1167;
    float _1179 = _1171;
    if (!_1081)
    {
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1183 = _1053 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1187 = _1009 + _1185;
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1191 = -_1053;
        float _1193 = _1191 + _1165;
        float _1195 = _1183 * _1183;
        float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1199 = _937 + _1197;
        float _1201 = -_937;
        float _1203 = _1201 + _1167;
        float _1205 = fma(_1187, _1187, _1195);
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1209 = fma(_1199, _1199, _1205);
        float _1211 = sqrt(_1209);
        float _1213 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = precise::min(_1211, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1217 = _1215 * _1207;
        float _1219 = -_1009;
        float _1221 = _1219 + _1169;
        float _1223 = _1213 * _1217;
        float _1225 = fma(_1221, _1223, _1009);
        float _1227 = fma(_1193, _1223, _1053);
        float _1229 = fma(_1203, _1223, _937);
        _1173 = _1227;
        _1175 = _1225;
        _1177 = _1229;
        _1109 = _1207;
    }
    float _1231 = _1173;
    float _1233 = _1175;
    float _1235 = _1177;
    float _1237 = _1109;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1241 = _1231 + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1245 = _1233 + _1243;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1249 = _1235 + _1247;
    float _1251 = _1241 * _1241;
    float _1253 = fma(_1245, _1245, _1251);
    float _1255 = fma(_1249, _1249, _1253);
    float _1257 = rsqrt(_1255);
    float _1259 = sqrt(_1255);
    float _1261 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1263 = _1245 * _1261;
    float _1265 = _1249 * _1261;
    float _1267 = _1263 * _1263;
    float _1269 = _1265 * _1265;
    float _1271 = _1267 + _1269;
    float _1273 = sqrt(_1271);
    bool _1275 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = _1273 + _1277;
    float _1281 = _1253;
    float _1283 = _1271;
    float _1285 = _1279;
    float _1287 = _1241;
    float _1289 = _1263;
    float _1291 = _1265;
    float _1293 = _1269;
    if (_1275)
    {
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1281 = _1295;
    }
    float _1297 = _1281;
    if (_1275)
    {
        float _1299 = rsqrt(_1271);
        _1283 = _1299;
    }
    float _1301 = _1283;
    if (_1275)
    {
        float _1303 = _1279 * _1297;
        _1285 = _1303;
    }
    float _1305 = _1285;
    if (_1275)
    {
        float _1307 = _1305 * 0.15915493667125701904296875;
        _1111 = _1307;
    }
    float _1309 = _1111;
    float _1311 = _1237;
    if (_1275)
    {
        float _1313 = _1309 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        _1311 = _1315;
    }
    float _1317 = _1311;
    float _1319 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1321 = precise::max(0.0, _1319);
    float _1323 = _1297;
    float _1325 = _1321;
    if (_1275)
    {
        float _1327 = _1309 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        _1323 = _1329;
    }
    float _1331 = _1323;
    float _1333 = -_1261;
    float _1335 = -_1321;
    float _1337 = fma(_1241, _1333, _1335);
    if (_1275)
    {
        float _1339 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1287 = _1339;
    }
    float _1341 = _1287;
    float _1343 = _1317;
    float _1345 = _1341;
    if (_1275)
    {
        float _1347 = fma(_1317, _1341, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = _1349;
    if (!_1275)
    {
        _1345 = _1337;
    }
    float _1353 = _1345;
    float _1355 = _1353;
    if (_1275)
    {
        float _1357 = _1331 + (-1.0);
        _1325 = _1357;
    }
    float _1359 = _1325;
    float _1361 = _1359;
    if (_1275)
    {
        float _1363 = _1301 * _1349;
        _1179 = _1363;
    }
    float _1365 = _1179;
    if (_1275)
    {
        float _1367 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1367;
    }
    float _1369 = _1351;
    if (_1275)
    {
        float _1371 = _1263 * _1365;
        _1289 = _1371;
    }
    float _1373 = _1289;
    if (!_1275)
    {
        _1361 = _1267;
    }
    float _1375 = _1361;
    float _1377 = _1375;
    if (_1275)
    {
        float _1379 = _1265 * _1365;
        _1291 = _1379;
    }
    float _1381 = _1291;
    if (_1275)
    {
        float _1383 = fma(_1337, _1331, _1369);
        _1355 = _1383;
    }
    float _1385 = _1355;
    if (_1275)
    {
        float _1387 = _1373 * _1373;
        _1377 = _1387;
    }
    float _1389 = _1377;
    float _1391 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1275)
    {
        float _1393 = _1381 * _1381;
        _1293 = _1393;
    }
    float _1395 = _1293;
    float _1397 = fma(_1385, _1385, _1389);
    float _1399 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    float _1401 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1403 = _1397 + _1395;
    float _1405 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1407 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1399);
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1411 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1409);
    float _1413 = precise::clamp(_1411, 0.0, 1.0);
    float _1415 = rsqrt(_1403);
    float _1417 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1419 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1405);
    float _1421 = -_1413;
    float _1423 = _1421 + 1.0;
    float _1425 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1427 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1417);
    float _1429 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1431 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1433 = abs(_1423);
    float _1435 = log2(_1433);
    float _1437 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1427);
    float _1439 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1441 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1443 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1431);
    float _1445 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1449 = -_1441;
    float _1451 = fma(_1449, _1401, 1.0);
    float _1453 = _1415 * _1373;
    float _1455 = _1415 * _1385;
    float _1457 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1447);
    float _1459 = _1415 * _1381;
    float _1461 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1463 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1443);
    float _1465 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1457);
    float _1467 = log2(_1451);
    float _1469 = -_1461;
    float _1471 = fma(_1455, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1469);
    float _1473 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1475 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1477 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1479 = -_1459;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1471);
    float _1483 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1485 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1465);
    float _1487 = exp2(_1473);
    float _1489 = fma(_1481, -0.5, 0.5);
    float _1491 = fma(_1481, 0.5, 0.5);
    float _1493 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1483);
    float _1495 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1477);
    float _1497 = _1455 + 1.0;
    float _1499 = fma(_1491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1501 = 1.0 / _1485;
    float _1503 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1493);
    float _1505 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1495);
    float _1507 = fma(_1491, _1499, -0.212114393711090087890625);
    float _1509 = _1467 * 0.693147182464599609375;
    float _1511 = fma(_1491, _1507, 1.570728778839111328125);
    float _1513 = sqrt(_1489);
    float _1515 = -_1455;
    float _1517 = fma(_1487, _1497, _1515);
    float _1519 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1503);
    float _1521 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1505);
    float _1523 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1525 = fma(_1517, 0.5, 0.5);
    float _1527 = _1519 * _1501;
    float _1529 = _1521 * _1501;
    float _1531 = fma(_1527, 0.5, 0.5);
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = _1513 * 0.636619746685028076171875;
    float _1537 = -_1511;
    float _1539 = fma(_1535, _1537, 1.0);
    float3 _5479 = float3(_1531, _1533, _1523);
    float _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5479, float3(0.0), isnan(_5479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5479, float3(0.0), isnan(_5479)), level(0.0)).x;
    float3 _5490 = float3(_1531, _1533, _1523);
    float4 _1544 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5490, float3(0.0), isnan(_5490)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5490, float3(0.0), isnan(_5490)), level(0.0)).xyzw;
    float _1546 = _1544.x;
    float _1548 = _1544.y;
    float _1550 = _1544.z;
    float _1552 = _1544.w;
    float2 _5507 = float2(_1539, _1525);
    float3 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5507, float2(0.0), isnan(_5507)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5507, float2(0.0), isnan(_5507)), level(0.0)).xyz;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1566 = int(_1564);
    float _1568 = _493 * _495;
    int _1570 = abs(_1087);
    out.m_45.x = 1.0;
    int _1572 = abs(_601);
    float _1574 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1576 = abs(_607);
    out.m_66.x = _1233;
    out.m_66.y = _1231;
    out.m_66.z = _1235;
    float _1578 = trunc(_765);
    int _1580 = int(_1578);
    float _1582 = -_689;
    float _1584 = _1582 + 1.0;
    float _1586 = -_775;
    float _1588 = _1586 + 1.0;
    float _1590 = -_551;
    float _1592 = _1590 + 1.0;
    float _1594 = float(uint(_1566));
    float _1596 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].x);
    int _1598 = int(_1596);
    bool _1600 = _1566 == 0;
    float _1602 = float(uint(_1580));
    float _1604 = 1.0 / _1594;
    int _1606 = ~_1566;
    int _1608 = _1606 + 1;
    float _1610 = float(uint(_1598));
    float _1612 = trunc(_771);
    int _1614 = int(_1612);
    int _1616 = ~_1598;
    int _1618 = _1616 + 1;
    int _1620 = as_type<int>(_1604) + (-2);
    float _1622 = 1.0 / _1610;
    int _1624 = ~_1566;
    int _1626 = _1624 + 1;
    float _1628 = as_type<float>(_1620) * _1602;
    float _1630 = trunc(_1628);
    float _1632 = precise::max(_1630, 0.0);
    uint _1635 = uint(_1632);
    float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1639 = float(_1580);
    int _1641 = _1608 * int(_1635);
    int _1643 = _1641 + _1580;
    float _1645 = exp2(_1574);
    float _1647 = float(uint(_1643));
    int _1649 = as_type<int>(_1622) + (-2);
    float _1651 = float(_1566);
    float _1653 = as_type<float>(_1620) * _1647;
    float _1655 = _497 * _499;
    float _1657 = float(uint(_1614));
    bool _1659 = _1639 >= _1651;
    bool _1661 = isnan(_1639);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(_1651);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = floor(_1655);
    float _1673 = as_type<float>(_1649) * _1657;
    float _1675 = -_1645;
    float _1677 = _1675 + 1.0;
    float _1679 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1681 = trunc(_1653);
    float _1683 = precise::max(_1681, 0.0);
    uint _1685 = uint(_1683);
    float _1687 = trunc(_1673);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = -_1671;
    float _1695 = _1655 + _1693;
    float _1697 = _1695 * _1651;
    int _1699 = int(_1635) + int(_1685);
    float _1701 = trunc(_1669);
    int _1703 = int(_1701);
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1707 = _1705 != 0;
    int _1709 = _1626 * _1699;
    int _1711 = _1709 + _1580;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1715 = _1713 != 0;
    int _1717 = _1618 * int(_1691);
    int _1719 = _1717 + _1614;
    float _1721 = floor(_1568);
    bool _1723 = uint(_1711) >= uint(_1566);
    float _1725 = float(uint(_1719));
    bool _1727 = !_1723;
    int _1729 = _1727 ? 0 : (-1);
    bool _1731 = !_1707;
    int _1733 = _1731 ? 0 : 1;
    float _1735 = trunc(_1697);
    int _1737 = int(_1735);
    float _1739 = as_type<float>(_1649) * _1725;
    int _1741 = ~_1699;
    int _1743 = _1741 + _1729;
    int _1745 = _1743 + 1;
    int _1747 = abs(_1733);
    int _1749 = ~_1703;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    int _1755 = _1566 * _1745;
    int _1757 = _1755 + _1580;
    float _1759 = trunc(_1739);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    float _1765 = -_1721;
    float _1767 = _1568 + _1765;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 65536;
    bool _1771 = _1769 != 0;
    bool _1773 = !_1600;
    int _1775 = _1773 ? _1757 : (-1);
    int _1777 = _1566 + (-1);
    int _1779 = _1737 * _1747;
    int _1781 = _1779 + _1580;
    float _1783 = _1651 * _657;
    int _1785 = _1775 * _1753;
    int _1787 = ~_1598;
    int _1789 = _1787 + 1;
    float _1791 = float(_1614);
    int _1793 = _1703 * _1777;
    int _1795 = _1793 + _1785;
    float _1797 = trunc(_1783);
    int _1799 = int(_1797);
    int _1801 = int(_1691) + int(_1763);
    float _1803 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1805 = abs(_1091);
    float _1807 = -_941;
    float _1809 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1803);
    int _1811 = _1789 * _1801;
    int _1813 = _1811 + _1614;
    float _1815 = float(_1598);
    int _1817 = abs(_1095);
    int _1819 = _1795 * _1570;
    bool _1821 = _1791 >= _1815;
    bool _1823 = isnan(_1791);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(_1815);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    bool _1833 = uint(_1813) >= uint(_1598);
    int _1835 = _1799 * _1805;
    int _1837 = _1835 + _1819;
    float _1839 = trunc(_1831);
    int _1841 = int(_1839);
    int _1843 = abs(_1099);
    float _1845 = _1767 * _1815;
    bool _1847 = !_1833;
    int _1849 = _1847 ? 0 : (-1);
    int _1851 = _1781 * _1817;
    int _1853 = _1851 + _1837;
    float _1855 = _1815 * _657;
    int _1857 = ~_1801;
    int _1859 = _1857 + _1849;
    int _1861 = _1859 + 1;
    float _1863 = trunc(_1845);
    int _1865 = int(_1863);
    bool _1867 = _1598 == 0;
    int _1869 = _1737 * _1843;
    int _1871 = _1869 + _1853;
    int _1873 = _1598 + (-1);
    int _1875 = _1598 * _1861;
    int _1877 = _1875 + _1614;
    bool _1879 = !_1771;
    int _1881 = _1879 ? 0 : 1;
    float _1883 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1885 = float(uint(_1871));
    float _1887 = trunc(_1855);
    int _1889 = int(_1887);
    int _1891 = ~_1841;
    int _1893 = _1891 + 1;
    int _1895 = _1893 + 1;
    float _1897 = -_941;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1883);
    bool _1901 = !_1867;
    int _1903 = _1901 ? _1877 : (-1);
    float _1905 = as_type<float>(_1620) * _1885;
    int _1907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8388608;
    bool _1909 = _1907 != 0;
    float _1911 = float(uint(_1781));
    int _1913 = _1903 * _1895;
    int _1915 = abs(_1881);
    float _1917 = trunc(_1905);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    int _1923 = _1841 * _1873;
    int _1925 = _1923 + _1913;
    bool _1927 = !_1909;
    int _1929 = _1927 ? 0 : 1;
    int _1931 = _1865 * _1915;
    int _1933 = _1931 + _1614;
    int _1935 = abs(_613);
    int _1937 = _1925 * _1572;
    int _1939 = ~_1566;
    int _1941 = _1939 + 1;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1943;
    int _1947 = ~_1598;
    int _1949 = _1947 + 1;
    int _1951 = _1889 * _1576;
    int _1953 = _1951 + _1937;
    int _1955 = abs(_1929);
    float _1957 = as_type<float>(_1620) * _1911;
    int _1959 = _1941 * int(_1921);
    int _1961 = _1959 + _1871;
    float _1963 = trunc(_1957);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    float _1969 = float(uint(_1961));
    int _1971 = _1933 * _1935;
    int _1973 = _1971 + _1953;
    int _1975 = ~_1598;
    int _1977 = _1975 + 1;
    float _1979 = as_type<float>(_1620) * _1969;
    int _1981 = _1865 * _1955;
    int _1983 = _1981 + _1973;
    int _1985 = ~_1566;
    int _1987 = _1985 + 1;
    float _1989 = trunc(_1979);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = float(uint(_1983));
    int _1997 = _1987 * int(_1967);
    int _1999 = _1997 + _1781;
    float _2001 = as_type<float>(_1649) * _1995;
    float _2003 = float(uint(_1999));
    int _2005 = ~_1566;
    int _2007 = _2005 + 1;
    float _2009 = trunc(_2001);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    float _2015 = as_type<float>(_1620) * _2003;
    int _2017 = ~_1598;
    int _2019 = _2017 + 1;
    int _2021 = int(_1921) + int(_1993);
    float _2023 = trunc(_2015);
    float _2025 = precise::max(_2023, 0.0);
    uint _2027 = uint(_2025);
    int _2029 = _2007 * _2021;
    int _2031 = _2029 + _1871;
    int _2033 = _1977 * int(_2013);
    int _2035 = _2033 + _1983;
    bool _2037 = uint(_2031) >= uint(_1566);
    bool _2039 = !_2037;
    int _2041 = _2039 ? 0 : (-1);
    float _2043 = float(uint(_2035));
    int _2045 = ~_2021;
    int _2047 = _2045 + _2041;
    int _2049 = _2047 + 1;
    int _2051 = int(_1967) + int(_2027);
    float _2053 = as_type<float>(_1967);
    float _2055 = as_type<float>(_1941);
    if (_1715)
    {
        float _2057 = _125 * 3.1415927410125732421875;
        _2053 = _2057;
    }
    float _2059 = _2053;
    int _2061 = _1566 * _2049;
    int _2063 = _2061 + _1871;
    float _2065 = as_type<float>(_1649) * _2043;
    if (_1715)
    {
        float _2067 = _2059 * 0.15915493667125701904296875;
        _2055 = _2067;
    }
    float _2069 = _2055;
    int _2071 = _1941 * _2051;
    int _2073 = _2071 + _1781;
    bool _2075 = !_1600;
    int _2077 = _2075 ? _2063 : (-1);
    float _2079 = trunc(_2065);
    float _2081 = precise::max(_2079, 0.0);
    uint _2083 = uint(_2081);
    int _2085 = _2077 & 3;
    bool _2087 = _2085 != 0;
    int _2089 = _2077 & 3;
    bool _2091 = _2089 != 0;
    bool _2093 = uint(_2073) >= uint(_1566);
    float _2095 = _2069;
    if (_1715)
    {
        float _2097 = _2069 * 6.283185482025146484375;
        float _2099 = sin(_2097);
        _2095 = _2099;
    }
    float _2101 = _2095;
    float _2103 = _2087 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2105 = _2089 != 3;
    bool _2107 = !_2093;
    int _2109 = _2107 ? 0 : (-1);
    bool _2111 = uint(_2089) > 1u;
    bool _2113 = uint(_2089) >= 2u;
    int _2115 = ~_2051;
    int _2117 = _2115 + _2109;
    int _2119 = _2117 + 1;
    float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _2121;
    int _2125 = _2113 ? 0 : 1;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _2129 = _371 + _2127;
    int _2131 = int(_2013) + int(_2083);
    int _2133 = _1566 * _2119;
    int _2135 = _2133 + _1781;
    int _2137 = ~_2125;
    int _2139 = _2137 + 1;
    int _2141 = _2139 + 1;
    float _2143 = 1.0 / _2123;
    int _2145 = _2141;
    bool _2147 = _2113;
    float _2149 = _2103;
    if (_2105)
    {
        int _2151 = ~_2125;
        int _2153 = _2151 + 1;
        _2145 = _2153;
    }
    int _2155 = _2145;
    int _2157 = _2019 * _2131;
    int _2159 = _2157 + _1983;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2163 = _2161 != 0;
    float _2165 = _1679 * _1541;
    if (_1715)
    {
        bool _2167 = _2101 > 0.5;
        _2147 = _2167;
    }
    bool _2169 = _2147;
    float _2171 = -_1679;
    float _2173 = _2171 + 1.0;
    int _2175 = ~as_type<int>(_2103);
    int _2177 = _2175 + 1;
    int _2179 = _2177 + 1;
    int _2181 = _2179;
    if (!_2111)
    {
        int _2183 = ~as_type<int>(_2103);
        int _2185 = _2183 + 1;
        _2181 = _2185;
    }
    int _2187 = _2181;
    if (!_1715)
    {
        _2149 = _181;
    }
    float _2189 = _2149;
    float _2191 = float(uint(_1933));
    float _2193 = _2189;
    float _2195 = _2191;
    if (_1715)
    {
        float _2197 = -_181;
        float _2199 = _2169 ? _2197 : _181;
        _2193 = _2199;
    }
    float _2201 = _2193;
    if (_2163)
    {
        float _2203 = _125 * 3.1415927410125732421875;
        _143 = _2203;
    }
    float _2205 = _143;
    int _2207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2209 = _2207 != 0;
    float _2211 = as_type<float>(_1649) * _2191;
    bool _2213 = uint(_2159) >= uint(_1598);
    float _2215 = _2129 * _2143;
    bool _2217 = !_1600;
    int _2219 = _2217 ? _2135 : (-1);
    if (_2163)
    {
        float _2221 = _2205 * 0.15915493667125701904296875;
        _2195 = _2221;
    }
    float _2223 = _2195;
    bool _2225 = !_2213;
    int _2227 = _2225 ? 0 : (-1);
    float _2229 = trunc(_2211);
    float _2231 = precise::max(_2229, 0.0);
    uint _2233 = uint(_2231);
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2237 = _2235 != 0;
    int _2239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2241 = _2239 != 0;
    int _2243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 33554432;
    bool _2245 = _2243 != 0;
    float _2247 = _2205;
    bool _2249 = _2241;
    if (_2209)
    {
        float _2251 = in.m_49.x;
        _2247 = _2251;
    }
    float _2253 = _2247;
    bool _2255 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _2257 = isnan(_371);
    bool _2259 = _2255 || _2257;
    bool _2261 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _2263 = _2259 || _2261;
    float _2265 = float(_2263);
    float _2267 = _2223;
    if (_2163)
    {
        float _2269 = _2223 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        _2267 = _2271;
    }
    float _2273 = _2267;
    bool _2275 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _2277 = isnan(_371);
    bool _2279 = _2275 || _2277;
    bool _2281 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _2283 = _2279 || _2281;
    float _2285 = float(_2283);
    float _2287 = -_2285;
    float _2289 = _2287 + 1.0;
    int _2291 = ~_1598;
    int _2293 = _2291 + 1;
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _2295;
    int _2299 = ~_2131;
    int _2301 = _2299 + _2227;
    int _2303 = _2301 + 1;
    float _2305 = _2265 * _2289;
    float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _2307;
    float _2311 = fma(_2297, _2215, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    int _2313 = _2077 >> 31;
    int _2315 = _2293 * int(_2233);
    int _2317 = _2315 + _1933;
    float _2319 = fma(_2309, _2215, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _2321 = _1598 * _2303;
    int _2323 = _2321 + _1983;
    int _2325 = _2313 & 3;
    float _2327 = _2311 * _2305;
    float _2329 = _2319 * _2305;
    float _2331 = float(uint(_2317));
    float _2333 = fma(_1945, _2215, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    int _2335 = _2077 + _2325;
    float _2337 = -_2265;
    float _2339 = _2337 + 1.0;
    bool _2341 = !_1867;
    int _2343 = _2341 ? _2323 : (-1);
    float _2345 = as_type<float>(_1649) * _2331;
    bool _2347 = !_2241;
    int _2349 = _2347 ? 0 : 1;
    float _2351 = as_type<float>(_2077);
    float _2353 = _2327;
    float _2355 = _2345;
    if (_2237)
    {
        float _2357 = in.m_49.z;
        _2351 = _2357;
    }
    float _2359 = _2351;
    if (_2163)
    {
        bool _2361 = _2273 > 0.5;
        _2249 = _2361;
    }
    bool _2363 = _2249;
    float _2365 = _2253;
    if (_2209)
    {
        float _2367 = _2253 * 3.1415927410125732421875;
        _2365 = _2367;
    }
    float _2369 = _2365;
    bool _2371 = !_2245;
    int _2373 = _2371 ? 0 : 1;
    float _2375 = trunc(_2345);
    float _2377 = precise::max(_2375, 0.0);
    uint _2379 = uint(_2377);
    int _2381 = _2343 & 3;
    bool _2383 = _2381 != 0;
    float _2385 = fma(_2339, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2327);
    bool _2387 = !_2091;
    int _2389 = _2387 ? 0 : 1;
    float _2391 = _2333 * _2305;
    bool _2393 = uint(_2381) > 1u;
    if (_2209)
    {
        float _2395 = _2369 * 0.15915493667125701904296875;
        _2353 = _2395;
    }
    float _2397 = _2353;
    bool _2399 = !_2383;
    int _2401 = _2399 ? 0 : 1;
    float _2403 = fma(_2339, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2329);
    int _2405 = _2343 & 3;
    bool _2407 = _2405 != 0;
    float _2409 = fma(_2339, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2391);
    int _2411 = _2335 >> 2;
    float _2413 = _2397;
    if (_2209)
    {
        float _2415 = _2397 * 6.283185482025146484375;
        float _2417 = sin(_2415);
        _2413 = _2417;
    }
    float _2419 = _2413;
    int _2421 = _2407 ? 0 : 1;
    float _2423 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[108].z, _2409);
    bool _2425 = _2089 != 3;
    float _2427 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[108].y, _2403);
    int _2429 = ~_2421;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[108].x, _2385);
    int _2437 = _2433;
    if (!_2393)
    {
        int _2439 = ~_2421;
        int _2441 = _2439 + 1;
        _2437 = _2441;
    }
    int _2443 = _2437;
    float _2445 = _2359;
    if (_2237)
    {
        float _2447 = _2359 * 3.1415927410125732421875;
        _2445 = _2447;
    }
    float _2449 = _2445;
    bool _2451 = uint(_2381) >= 2u;
    float _2453 = _2427 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2455 = _2411 << 4;
    int _2457 = _2455 + 800;
    if (_2237)
    {
        float _2459 = _2449 * 0.15915493667125701904296875;
        _2355 = _2459;
    }
    float _2461 = _2355;
    int _2463 = int(_2233) + int(_2379);
    float _2465 = _2435 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2467 = !_2425;
    int _2469 = _2467 ? 0 : (-1);
    uint _2471 = uint(int(uint(_2457) >> uint(2)));
    uint _2473 = uint(int(uint(int(_2471)) >> uint(2)));
    int _2475 = int(_2471) & 3;
    float _2477 = (*spvDescriptorSet0.vp_c9)._m0[int(_2473)][_2475];
    int _2479 = int(_2471) + 1;
    uint _2481 = uint(int(uint(_2479) >> uint(2)));
    int _2483 = _2479 & 3;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[int(_2481)][_2483];
    int _2487 = _2343 >> 31;
    float _2489 = _2461;
    if (_2237)
    {
        float _2491 = _2461 * 6.283185482025146484375;
        float _2493 = sin(_2491);
        _2489 = _2493;
    }
    float _2495 = _2489;
    bool _2497 = _2381 != 3;
    int _2499 = _1949 * _2463;
    int _2501 = _2499 + _1933;
    int _2503 = _2451 ? 0 : 1;
    float _2505 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2507 = _2381 != 3;
    float _2509 = _2453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2511 = _2487 & 3;
    bool _2513 = !_2507;
    int _2515 = _2513 ? 0 : (-1);
    bool _2517 = _2507;
    if (_2209)
    {
        bool _2519 = _2419 > 0.5;
        _2517 = _2519;
    }
    bool _2521 = _2517;
    int _2523 = _2343 + _2511;
    int _2525 = _2457 + 8;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    uint _2529 = uint(int(uint(int(_2527)) >> uint(2)));
    int _2531 = int(_2527) & 3;
    float _2533 = (*spvDescriptorSet0.vp_c9)._m0[int(_2529)][_2531];
    int _2535 = int(_2527) + 1;
    uint _2537 = uint(int(uint(_2535) >> uint(2)));
    int _2539 = _2535 & 3;
    float _2541 = (*spvDescriptorSet0.vp_c9)._m0[int(_2537)][_2539];
    int _2543 = ~_2503;
    int _2545 = _2543 + 1;
    int _2547 = _2545 + 1;
    int _2549 = _2523 >> 2;
    int _2551 = _2547;
    if (_2497)
    {
        int _2553 = ~_2503;
        int _2555 = _2553 + 1;
        _2551 = _2555;
    }
    int _2557 = _2551;
    float _2559 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2561 = _2549 << 4;
    int _2563 = _2561 + 944;
    bool _2565 = uint(_2501) >= uint(_1598);
    float _2567 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2569 = uint(int(uint(_2563) >> uint(2)));
    uint _2571 = uint(int(uint(int(_2569)) >> uint(2)));
    int _2573 = int(_2569) & 3;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[int(_2571)][_2573];
    int _2577 = int(_2569) + 1;
    uint _2579 = uint(int(uint(_2577) >> uint(2)));
    int _2581 = _2577 & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    int _2585 = abs(_2187);
    bool _2587 = !_2565;
    int _2589 = _2587 ? 0 : (-1);
    out.m_68.x = _2505;
    out.m_68.y = _2509;
    out.m_68.z = _2567;
    bool _2591 = _2565;
    if (_2237)
    {
        bool _2593 = _2495 > 0.5;
        _2591 = _2593;
    }
    bool _2595 = _2591;
    float _2597 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2599 = ~_2585;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    int _2605 = abs(_2155);
    float _2607 = -_941;
    float _2609 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2597);
    float _2611 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2613 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _2615 = int(_2613);
    int _2617 = ~_2605;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    int _2623 = abs(_2469);
    int _2625 = _2563 + 8;
    uint _2627 = uint(int(uint(_2625) >> uint(2)));
    uint _2629 = uint(int(uint(int(_2627)) >> uint(2)));
    int _2631 = int(_2627) & 3;
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[int(_2629)][_2631];
    int _2635 = int(_2627) + 1;
    uint _2637 = uint(int(uint(_2635) >> uint(2)));
    int _2639 = _2635 & 3;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[int(_2637)][_2639];
    int _2643 = abs(_2389);
    float _2645 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2647 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2611);
    int _2649 = _2603 * as_type<int>(_2485);
    int _2651 = ~_2643;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    float _2657 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2645);
    int _2659 = abs(_2443);
    float _2661 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2663 = abs(_2401);
    int _2665 = _2655 * as_type<int>(_2477);
    int _2667 = _2665 + _2649;
    int _2669 = ~_2659;
    int _2671 = _2669 + 1;
    int _2673 = _2671 + 1;
    float _2675 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2661);
    int _2677 = ~_2463;
    int _2679 = _2677 + _2589;
    int _2681 = _2679 + 1;
    float _2683 = trunc((*spvDescriptorSet0.vp_c9)._m0[100].z);
    int _2685 = int(_2683);
    int _2687 = ~_2663;
    int _2689 = _2687 + 1;
    int _2691 = _2689 + 1;
    float _2693 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1809);
    int _2695 = abs(_2373);
    int _2697 = _1598 * _2681;
    int _2699 = _2697 + _1933;
    int _2701 = abs(_2557);
    float _2703 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2609);
    int _2705 = _2621 * as_type<int>(_2533);
    int _2707 = _2705 + _2667;
    int _2709 = abs(_2349);
    float _2711 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1899);
    float _2713 = float(uint(_2615));
    float _2715 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2717 = abs(_2515);
    float _2719 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2715);
    int _2721 = ~_2623;
    int _2723 = _2721 + 1;
    int _2725 = _2723 + 1;
    float _2727 = 1.0 / _2713;
    int _2729 = _2673 * as_type<int>(_2583);
    int _2731 = ~_2709;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    float _2737 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2719);
    int _2739 = _2725 * as_type<int>(_2541);
    int _2741 = _2739 + _2707;
    float _2743 = float(uint(_2685));
    int _2745 = _2691 * as_type<int>(_2575);
    int _2747 = _2745 + _2729;
    bool _2749 = !_1867;
    int _2751 = _2749 ? _2699 : (-1);
    int _2753 = _2741 * _2735;
    int _2755 = ~_2685;
    int _2757 = _2755 + 1;
    float _2759 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2737);
    float _2761 = 1.0 / _2743;
    int _2763 = _2219 * _2709;
    int _2765 = _2763 + _2753;
    int _2767 = ~_2701;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    float _2773 = _971 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.gl_Position.x = _1519;
    out.gl_Position.y = _1521;
    out.gl_Position.z = _2759;
    out.gl_Position.w = _1485;
    int _2775 = as_type<int>(_2727) + (-2);
    int _2777 = _2771 * as_type<int>(_2633);
    int _2779 = _2777 + _2747;
    float _2781 = float(uint(_2765));
    float _2783 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2773);
    int _2785 = ~_2717;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = as_type<float>(_2775) * _2781;
    int _2793 = abs(_2615);
    float _2795 = _971 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2797 = abs(_2685);
    int _2799 = _2789 * as_type<int>(_2641);
    int _2801 = _2799 + _2779;
    int _2803 = ~_2695;
    int _2805 = _2803 + 1;
    int _2807 = _2805 + 1;
    float _2809 = trunc(_2791);
    float _2811 = precise::max(_2809, 0.0);
    uint _2813 = uint(_2811);
    float _2815 = float(uint(_2793));
    float _2817 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2783);
    int _2819 = ~_2615;
    int _2821 = _2819 + 1;
    int _2823 = _2801 * _2807;
    float _2825 = _971 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2827 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2795);
    float _2829 = float(uint(_2797));
    float _2831 = 1.0 / _2815;
    float _2833 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2825);
    int _2835 = _2751 * _2695;
    int _2837 = _2835 + _2823;
    int _2839 = abs(_2765);
    float _2841 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2843 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2833);
    int _2845 = as_type<int>(_2761) + (-2);
    float _2847 = _2759 + _1485;
    int _2849 = _2821 * int(_2813);
    int _2851 = _2849 + _2765;
    float _2853 = float(uint(_2837));
    float _2855 = 1.0 / _2829;
    int _2857 = ~_2793;
    int _2859 = _2857 + 1;
    float _2861 = _1562 * _2165;
    float _2863 = float(uint(_2851));
    float _2865 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2827);
    float _2867 = as_type<float>(_2845) * _2853;
    int _2869 = as_type<int>(_2831) + (-2);
    float _2871 = as_type<float>(_2775) * _2863;
    float _2873 = float(uint(_2839));
    float _2875 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2657);
    int _2877 = abs(_2837);
    float _2879 = trunc(_2867);
    float _2881 = precise::max(_2879, 0.0);
    uint _2883 = uint(_2881);
    float _2885 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2647);
    float _2887 = as_type<float>(_2869) * _2873;
    float _2889 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2675);
    float _2891 = _2647;
    float _2893 = _2675;
    if (!_2209)
    {
        _1113 = _181;
    }
    float _2895 = _1113;
    float _2897 = _2847 * 0.5;
    float _2899 = _2895;
    if (_2209)
    {
        float _2901 = -_181;
        float _2903 = _2521 ? _2901 : _181;
        _2899 = _2903;
    }
    float _2905 = _2899;
    float _2907 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2909 = as_type<int>(_2855) + (-2);
    float _2911 = trunc(_2887);
    float _2913 = precise::max(_2911, 0.0);
    uint _2915 = uint(_2913);
    float _2917 = float(uint(_2877));
    float _2919 = fma(_2907, _2907, 1.0);
    if (!_2163)
    {
        _2891 = _177;
    }
    float _2921 = _2891;
    float _2923 = _2907 * _2703;
    float _2925 = _2921;
    if (!_2237)
    {
        _2893 = _177;
    }
    float _2927 = _2893;
    float _2929 = as_type<float>(_2909) * _2917;
    float _2931 = _2927;
    if (_2163)
    {
        float _2933 = -_177;
        float _2935 = _2363 ? _2933 : _177;
        _2925 = _2935;
    }
    float _2937 = _2925;
    float _2939 = rsqrt(_2919);
    if (_2237)
    {
        float _2941 = -_177;
        float _2943 = _2595 ? _2941 : _177;
        _2931 = _2943;
    }
    float _2945 = _2931;
    float _2947 = _2907 * _2693;
    int _2949 = _2757 * int(_2883);
    int _2951 = _2949 + _2837;
    int _2953 = ~_2797;
    int _2955 = _2953 + 1;
    float _2957 = _2907 * _2711;
    out.m_70.x = _2875;
    out.m_70.y = _2885;
    out.m_70.z = _2889;
    int _2959 = ~_2797;
    int _2961 = _2959 + 1;
    float _2963 = trunc(_2929);
    float _2965 = precise::max(_2963, 0.0);
    uint _2967 = uint(_2965);
    int _2969 = _2859 * int(_2915);
    int _2971 = _2969 + _2839;
    int _2973 = _2765 ^ _2615;
    out.m_72.z = _2897;
    out.m_72.w = _1485;
    bool _2975 = _2685 == 0;
    float _2977 = float(uint(_2971));
    float _2979 = trunc(_2871);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    float _2985 = fma(_2841, _2875, _2947);
    float _2987 = fma(_2841, _2885, _2923);
    float _2989 = float(uint(_2951));
    float _2991 = _2907 * _2939;
    float _2993 = as_type<float>(_2869) * _2977;
    float _2995 = fma(_2841, _2889, _2957);
    uint _2997 = uint(int(uint(_2973) >> uint(31)));
    float _2999 = as_type<float>(_2845) * _2989;
    int _3001 = _2955 * int(_2967);
    int _3003 = _3001 + _2877;
    float _3005 = -_2843;
    float _3007 = _2991 * _3005;
    float _3009 = -_2865;
    float _3011 = _2991 * _3009;
    float _3013 = -_2817;
    float _3015 = _2991 * _3013;
    float _3017 = trunc(_2993);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    float _3023 = float(uint(_3003));
    float _3025 = fma(_2939, _2693, _3007);
    float _3027 = fma(_2939, _2711, _3015);
    int _3029 = ~_2615;
    int _3031 = _3029 + 1;
    float _3033 = _2865 + _2987;
    float _3035 = as_type<float>(_2909) * _3023;
    int _3037 = int(_2813) + int(_2983);
    float _3039 = trunc(_2999);
    float _3041 = precise::max(_3039, 0.0);
    uint _3043 = uint(_3041);
    float _3045 = _2817 + _2995;
    int _3047 = ~_2793;
    int _3049 = _3047 + 1;
    float _3051 = fma(_2939, _2703, _3011);
    bool _3053 = _2685 == 0;
    int _3055 = _3031 * _3037;
    int _3057 = _3055 + _2765;
    float _3059 = trunc(_3035);
    float _3061 = precise::max(_3059, 0.0);
    uint _3063 = uint(_3061);
    int _3065 = int(_2915) + int(_3021);
    out.m_74.x = _3025;
    out.m_74.y = _3051;
    out.m_74.z = _3027;
    bool _3067 = uint(_3057) >= uint(_2615);
    float _3069 = _2843 + _2985;
    int _3071 = _3049 * _3065;
    int _3073 = _3071 + _2839;
    bool _3075 = !_3067;
    int _3077 = _3075 ? 0 : (-1);
    int _3079 = int(_2883) + int(_3043);
    out.m_76.x = _3069;
    out.m_76.y = _3033;
    out.m_76.z = _3045;
    int _3081 = ~_2685;
    int _3083 = _3081 + 1;
    int _3085 = ~_3037;
    int _3087 = _3085 + _3077;
    int _3089 = _3087 + 1;
    int _3091 = int(_2967) + int(_3063);
    int _3093 = _2615 * _3089;
    int _3095 = _3093 + _2765;
    bool _3097 = _2615 == 0;
    int _3099 = _3083 * _3079;
    int _3101 = _3099 + _2837;
    bool _3103 = uint(_3073) >= uint(_2793);
    int _3105 = _2961 * _3091;
    int _3107 = _3105 + _2877;
    bool _3109 = !_3097;
    int _3111 = _3109 ? _3095 : (-1);
    float _3113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _3115 = uint(_3101) >= uint(_2685);
    bool _3117 = uint(_3107) >= uint(_2797);
    bool _3119 = !_3115;
    int _3121 = _3119 ? 0 : (-1);
    int _3123 = _2837 ^ _2685;
    float _3125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3127 = ~_3079;
    int _3129 = _3127 + _3121;
    int _3131 = _3129 + 1;
    bool _3133 = !_3103;
    int _3135 = _3133 ? 0 : (-1);
    bool _3137 = !_3117;
    int _3139 = _3137 ? 0 : (-1);
    int _3141 = _2685 * _3131;
    int _3143 = _3141 + _2837;
    float _3145 = float(_3111);
    float _3147 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    uint _3149 = uint(int(uint(_3123) >> uint(31)));
    int _3151 = ~_3135;
    int _3153 = _3065 + _3151;
    int _3155 = _3153 + 1;
    float _3157 = fma(_3147, _3145, _747);
    int _3159 = ~_3139;
    int _3161 = _3091 + _3159;
    int _3163 = _3161 + 1;
    float _3165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _3167 = ~int(_2997);
    int _3169 = _3167 + 1;
    float _3171 = _3125 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    int _3173 = ~int(_3149);
    int _3175 = _3173 + 1;
    float _3177 = _1552 * _2173;
    bool _3179 = !_2975;
    int _3181 = _3179 ? _3143 : (-1);
    int _3183 = _3155 ^ _3169;
    int _3185 = _3163 ^ _3175;
    float _3187 = float(_3181);
    float _3189 = _2937 + 0.5;
    bool _3191 = _2615 == 0;
    int _3193 = ~_3169;
    int _3195 = _3193 + _3183;
    int _3197 = _3195 + 1;
    float _3199 = fma(_3147, _3189, _3157);
    int _3201 = ~_3175;
    int _3203 = _3201 + _3185;
    int _3205 = _3203 + 1;
    float _3207 = fma(_3171, _3187, _783);
    bool _3209 = !_3191;
    int _3211 = _3209 ? _3197 : (-1);
    float _3213 = _3165 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _3215 = !_3053;
    int _3217 = _3215 ? _3205 : (-1);
    float _3219 = _2945 + 0.5;
    float _3221 = float(_3211);
    float _3223 = _3113 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3225 = float(_3217);
    float _3227 = fma(_3171, _3219, _3207);
    float _3229 = -_1584;
    float _3231 = fma(_3229, _2937, _3199);
    float _3233 = -_565;
    float _3235 = fma(_3213, _3221, _3233);
    float _3237 = _2905 + (-0.5);
    float _3239 = -_785;
    float _3241 = fma(_3223, _3225, _3239);
    float _3243 = _2201 + (-0.5);
    float _3245 = -_1588;
    float _3247 = fma(_3245, _2945, _3227);
    float _3249 = -_3213;
    float _3251 = fma(_3249, _3237, _3235);
    float _3253 = -_779;
    float _3255 = _3253 + 1.0;
    float _3257 = -_3223;
    float _3259 = fma(_3257, _3243, _3241);
    float _3261 = _1552 * _2165;
    float _3263 = fma(_1592, _2905, _3251);
    float _3265 = fma(_1552, _2861, _1550);
    float _3267 = fma(_3255, _2201, _3259);
    float _3269 = fma(_1558, _3261, _1546);
    float _3271 = fma(_1560, _3261, _1548);
    out.m_78.x = _3231;
    out.m_78.y = _3263;
    float _3273 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_80.x = _3247;
    out.m_80.y = _3267;
    out.m_82.w = _3273;
    out.m_84.x = _3269;
    out.m_84.y = _3271;
    out.m_84.z = _3265;
    out.m_84.w = _3177;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _361 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3330 = as_type<float>(_119);
        out.gl_Position.z = _3330;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_47.w;
    float _125 = in.m_49.w;
    bool _127 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_123);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_123;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.w = _125;
    float _141 = _139;
    float _143 = _125;
    if (_135)
    {
        float _145 = float(_103);
        _113 = _145;
    }
    float _147 = _113;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_45.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _121 = as_type<int>(_159);
    }
    int _161 = _121;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3405 = as_type<float>(_161);
        out.gl_Position.z = _3405;
    }
    if (_153)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_49.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_103);
        float _207 = 1.0 / _205;
        float _209 = _139 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    bool _229 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_211);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -_227;
    float _251 = _249 + 1.0;
    float _253 = 1.0 / _243;
    bool _255 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _257 = isnan(_211);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = _239 * _251;
    float _269 = -_239;
    float _271 = _269 + 1.0;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _275 = _265 * _271;
    float _277 = 1.0 / _247;
    float _279 = -_265;
    float _281 = _279 + 1.0;
    float _283 = _215 * _253;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _211 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_291, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _287 * _277;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _307 = _297 * _275;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = _299 * _275;
    float _315 = fma(_305, _301, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _317 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _319 = fma(_311, _301, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _321 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _313);
    float _323 = fma(_315, _267, _317);
    float _325 = fma(_319, _267, _321);
    float _327 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[145].x, _323);
    float _329 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[145].y, _325);
    bool _331 = !_273;
    float _333 = _313;
    int _335 = as_type<int>(_321);
    float _337 = _267;
    int _339 = as_type<int>(_325);
    float _341 = _275;
    float _359;
    if (!_331)
    {
        float _343 = in.m_49.x;
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _347 = _343 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _333 = _353;
        _359 = _357;
        _361 = true;
    }
    else
    {
        float _363 = float(_103);
        float _365 = 1.0 / _363;
        float _367 = _139 * _365;
        _359 = _367;
    }
    _361 = false;
    float _369 = _333;
    float _371 = _359;
    float _373 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _375 = int(_373);
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _379 = _377 != 0;
    float _381 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].y);
    int _383 = int(_381);
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _387 = _369;
    float _389 = _315;
    if (_379)
    {
        float _391 = in.m_49.x;
        float _393 = in.m_49.y;
        float _395 = in.m_49.z;
        _385 = _391;
        _387 = _393;
        _389 = _395;
    }
    float _397 = _385;
    float _399 = _387;
    float _401 = _389;
    float _403 = 0.0;
    if (_379)
    {
        _403 = 1.0;
    }
    float _405 = _403;
    float _407 = 0.0;
    float _409 = _405;
    if (_379)
    {
        _407 = 1.0;
    }
    float _411 = _407;
    float _413 = _411;
    if (_379)
    {
        _335 = 0;
    }
    int _415 = _335;
    float _417 = 0.0;
    float _419 = _401;
    float _421 = _397;
    int _423 = _415;
    float _425 = _399;
    if (_379)
    {
        _417 = _397;
    }
    float _427 = _417;
    float _429 = _427;
    if (_379)
    {
        _337 = _399;
    }
    float _431 = _337;
    float _433 = _431;
    if (_379)
    {
        _339 = as_type<int>(_401);
    }
    int _435 = _339;
    float _437 = 0.0;
    int _439 = _435;
    if (_379)
    {
        _437 = _427;
    }
    float _441 = _437;
    float _443 = _441;
    if (_379)
    {
        _341 = _427;
    }
    float _445 = _341;
    float _447 = _445;
    if (!_379)
    {
        float _449 = in.m_49.x;
        float _451 = in.m_49.y;
        float _453 = in.m_49.z;
        float _455 = _449 * 3.1415927410125732421875;
        float _457 = _455 * 0.15915493667125701904296875;
        float _459 = _451 * 3.1415927410125732421875;
        float _461 = _459 * 0.15915493667125701904296875;
        float _463 = _453 * 3.1415927410125732421875;
        float _465 = _457 * 6.283185482025146484375;
        float _467 = sin(_465);
        float _469 = _463 * 0.15915493667125701904296875;
        float _471 = _461 * 6.283185482025146484375;
        float _473 = sin(_471);
        float _475 = _469 * 6.283185482025146484375;
        float _477 = sin(_475);
        _419 = _453;
        _447 = _467;
        _421 = _449;
        _423 = 1;
        _433 = _473;
        _425 = _451;
        _439 = as_type<int>(_477);
        _413 = 1.2345600128173828125;
        _443 = _453;
        _409 = 7.345489978790283203125;
        _429 = _451;
    }
    float _479 = _419;
    float _481 = _447;
    float _483 = _421;
    int _485 = _423;
    float _487 = _433;
    float _489 = _425;
    int _491 = _439;
    float _493 = _413;
    float _495 = _443;
    float _497 = _409;
    float _499 = _429;
    float _501 = _479 * 2.0;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _505 = _481 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _507 = _483 * 2.0;
    bool _509 = _485 != 1;
    float _511 = -_503;
    float _513 = fma(_505, 2.0, _511);
    float _515 = _487 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _519 = floor(_501);
    float _521 = fma(_515, -2.0, _517);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _525 = floor(_507);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _529 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[93].w, _523);
    float _531 = _489 * 2.0;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1048576;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2097152;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4194304;
    bool _543 = _541 != 0;
    float _545 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[93].z, _527);
    bool _547 = !_509;
    float _549 = _547 ? _487 : _481;
    float _551 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _529);
    bool _553 = !_509;
    float _555 = _553 ? as_type<float>(_491) : _487;
    float _557 = _489 + _483;
    float _559 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _561 = log2(_559);
    bool _563 = _519 > 0.0;
    float _565 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _521);
    float _567 = _557 + (-1.0);
    bool _569 = _519 >= 0.0;
    bool _571 = isnan(_519);
    bool _573 = _569 || _571;
    bool _575 = isnan(0.0);
    bool _577 = _573 || _575;
    bool _579 = _525 > 0.0;
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _583 = _525 >= 0.0;
    bool _585 = isnan(_525);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = floor(_531);
    float _595 = float(_103);
    float _597 = _489 + _479;
    bool _599 = !_539;
    int _601 = _599 ? 0 : 1;
    float _603 = _489 + (-0.5);
    bool _605 = !_535;
    int _607 = _605 ? 0 : 1;
    float _609 = _597 + (-1.0);
    bool _611 = !_543;
    int _613 = _611 ? 0 : 1;
    float _615 = 1.0 / _595;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _627 = _625 != 0;
    int _629 = _577 ? 0 : 1;
    int _631 = ~_629;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    float _637 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _639 = !_619;
    int _641 = _639 ? 0 : 1;
    float _643 = _561 * _139;
    int _645 = _635;
    if (!_563)
    {
        int _647 = ~_629;
        int _649 = _647 + 1;
        _645 = _649;
    }
    int _651 = _645;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _655 = float(_375);
    float _657 = _615 * _139;
    bool _659 = _593 > 0.0;
    float _661 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[98].z, _653);
    bool _663 = _593 >= 0.0;
    bool _665 = isnan(_593);
    bool _667 = _663 || _665;
    bool _669 = isnan(0.0);
    bool _671 = _667 || _669;
    float _673 = 1.0 / _655;
    float _675 = float(_383);
    float _677 = 1.0 / _675;
    int _679 = abs(_641);
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _687 = float(_651);
    float _689 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _545);
    int _691 = _591 ? 0 : 1;
    float _693 = exp2(_643);
    float _695 = _549 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _697 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[98].w, _685);
    float _699 = _555 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _701 = -_681;
    float _703 = fma(_695, 2.0, _701);
    float _705 = float(_679);
    float _707 = fma(_699, -2.0, _683);
    bool _709 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _711 = isnan(1.0);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _717 = _713 || _715;
    float _719 = in.m_56.x;
    float _721 = in.m_56.y;
    float _723 = in.m_56.z;
    int _725 = ~_691;
    int _727 = _725 + 1;
    int _729 = _727 + 1;
    float _731 = _705 * _687;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _735 = 1.0 + _733;
    int _737 = _729;
    if (!_579)
    {
        int _739 = ~_691;
        int _741 = _739 + 1;
        _737 = _741;
    }
    int _743 = _737;
    float _745 = -_139;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[91].x, _513);
    float _749 = -_693;
    float _751 = _749 + 1.0;
    float _753 = 1.0 / _735;
    bool _755 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _763 = _759 || _761;
    float _765 = _673 * _139;
    bool _767 = !_623;
    int _769 = _767 ? 0 : 1;
    float _771 = _677 * _139;
    float _773 = _763 ? _751 : 0.0;
    float _775 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[97].z, _661);
    int _777 = abs(_769);
    float _779 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[97].w, _697);
    float _781 = -_139;
    float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[96].x, _703);
    float _785 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[96].y, _707);
    float _787 = float(_743);
    float _789 = float(_777);
    int _791 = _671 ? 0 : 1;
    if (_717)
    {
        float _793 = _773 * _753;
        _141 = _793;
    }
    float _795 = _141;
    float _797 = _731 * (-2.0);
    float _799 = _789 * _787;
    int _801 = ~_791;
    int _803 = _801 + 1;
    int _805 = _803 + 1;
    float _807 = _483 + (-0.5);
    float _809 = fma(_797, _719, _719);
    bool _811 = !_627;
    int _813 = _811 ? 0 : 1;
    float _815 = fma(_581, _797, _581);
    int _817 = _805;
    if (!_659)
    {
        int _819 = ~_791;
        int _821 = _819 + 1;
        _817 = _821;
    }
    int _823 = _817;
    float _825 = _799 * (-2.0);
    int _827 = abs(_813);
    float _829 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[196].x, _809);
    float _831 = float(_823);
    float _833 = fma(_637, _825, _637);
    float _835 = float(_827);
    float _837 = fma(_825, _721, _721);
    float _839 = fma(_815, _795, _829);
    float _841 = _483 + _479;
    float _843 = in.m_58.x;
    float _845 = in.m_58.y;
    float _847 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].y, _837);
    float _849 = _835 * _831;
    float _851 = _839 * 0.15915493667125701904296875;
    float _853 = _479 + (-0.5);
    float _855 = fma(_833, _795, _847);
    float _857 = _841 + (-1.0);
    float _859 = _849 * (-2.0);
    float _861 = in.m_42.x;
    float _863 = in.m_42.y;
    float _865 = in.m_42.z;
    float _867 = _855 * 0.15915493667125701904296875;
    float _869 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _871 = fma(_859, _723, _723);
    float _873 = in.m_60.x;
    float _875 = in.m_60.y;
    float _877 = in.m_60.z;
    float _879 = _851 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = fma(_869, _859, _869);
    float _885 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[196].z, _871);
    float _887 = fma(_883, _795, _885);
    float _889 = _851 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = _887 * 0.15915493667125701904296875;
    float _895 = _327 * _843;
    float _897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _899 = _329 * _845;
    float _901 = _867 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _907 = _863 * _875;
    float _909 = _867 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _895 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _917 = fma(_861, _873, _907);
    float _919 = _913 * _897;
    float _921 = _905 * _915;
    float _923 = in.m_62.x;
    float _925 = in.m_62.y;
    float _927 = in.m_62.z;
    float _929 = _893 * 6.283185482025146484375;
    float _931 = cos(_929);
    float _933 = _881 * _903;
    float _935 = fma(_865, _877, _917);
    float _937 = _935 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _939 = _893 * 6.283185482025146484375;
    float _941 = sin(_939);
    float _943 = _891 * _911;
    float _945 = _881 * _911;
    float _947 = _891 * _931;
    float _949 = _891 * _903;
    float _951 = _881 * _931;
    float _953 = _911 * _931;
    float _955 = _947 * _921;
    float _957 = _903 * _931;
    float _959 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _961 = _951 * _921;
    float _963 = fma(_941, _943, _933);
    float _965 = -_921;
    float _967 = _941 * _965;
    float _969 = -_945;
    float _971 = fma(_941, _949, _969);
    float _973 = -_949;
    float _975 = fma(_941, _945, _973);
    float _977 = fma(_963, _919, _955);
    float _979 = fma(_953, _919, _967);
    float _981 = fma(_941, _933, _943);
    float _983 = fma(_975, _919, _961);
    float _985 = fma(_971, _959, _977);
    float _987 = fma(_957, _959, _979);
    float _989 = _863 * _925;
    float _991 = fma(_981, _959, _983);
    float _993 = _985 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _995 = _985 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _997 = fma(_861, _923, _989);
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].x, _993);
    float _1001 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].x, _995);
    float _1003 = fma(_865, _927, _997);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _999);
    float _1007 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    float _1009 = _1003 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1011 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1013 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1015 = in.m_64.x;
    float _1017 = in.m_64.y;
    float _1019 = in.m_64.z;
    float _1021 = _937 + _1011;
    float _1023 = _1009 + _1013;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1027 = _1021 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1031 = _1023 + _1029;
    float _1033 = _1027 * _1027;
    float _1035 = fma(_1031, _1031, _1033);
    float _1037 = sqrt(_1035);
    float _1039 = _863 * _1017;
    float _1041 = _985 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1043 = fma(_861, _1015, _1039);
    float _1045 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1041);
    float _1047 = fma(_865, _1019, _1043);
    bool _1049 = _1037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1051 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1045);
    float _1053 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1065 = _1063 != 0;
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1069 = _1067 != 0;
    float _1071 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1073 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1075 = isnan(0.5);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1081 = _1077 || _1079;
    float _1083 = _1053 + _1071;
    bool _1085 = !_1061;
    int _1087 = _1085 ? 0 : 1;
    bool _1089 = !_1057;
    int _1091 = _1089 ? 0 : 1;
    bool _1093 = !_1065;
    int _1095 = _1093 ? 0 : 1;
    bool _1097 = !_1069;
    int _1099 = _1097 ? 0 : 1;
    float _1101 = _1015;
    float _1103 = _1019;
    float _1105 = _1043;
    float _1107 = _1037;
    float _1109 = _985;
    float _1111 = _1027;
    float _1113 = _975;
    if (!_1049)
    {
        _1101 = _1023;
    }
    float _1115 = _1101;
    float _1117 = _1115;
    if (!_1049)
    {
        _1103 = _1021;
    }
    float _1119 = _1103;
    float _1121 = _1119;
    if (!_1049)
    {
        _1105 = _1083;
    }
    float _1123 = _1105;
    bool _1125 = !_1049;
    float _1127 = _1123;
    if (!_1125)
    {
        float _1129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1133 = _1037 + _1131;
        float _1135 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1137 = rsqrt(_1035);
        float _1139 = _1133 * _1129;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = _1141 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = _1145 + (-1.0);
        float _1153 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = fma(_1149, _1135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1157 = fma(_1083, _1145, _1153);
        float _1159 = _1137 * _1155;
        float _1161 = fma(_1031, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1163 = fma(_1027, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1127 = _1157;
        _1121 = _1163;
        _1117 = _1161;
        _1107 = _1133;
    }
    float _1165 = _1127;
    float _1167 = _1121;
    float _1169 = _1117;
    float _1171 = _1107;
    float _1173 = _1165;
    float _1175 = _1169;
    float _1177 = _1167;
    float _1179 = _1171;
    if (!_1081)
    {
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1183 = _1053 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1187 = _1009 + _1185;
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1191 = -_1053;
        float _1193 = _1191 + _1165;
        float _1195 = _1183 * _1183;
        float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1199 = _937 + _1197;
        float _1201 = -_937;
        float _1203 = _1201 + _1167;
        float _1205 = fma(_1187, _1187, _1195);
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1209 = fma(_1199, _1199, _1205);
        float _1211 = sqrt(_1209);
        float _1213 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = precise::min(_1211, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1217 = _1215 * _1207;
        float _1219 = -_1009;
        float _1221 = _1219 + _1169;
        float _1223 = _1213 * _1217;
        float _1225 = fma(_1221, _1223, _1009);
        float _1227 = fma(_1193, _1223, _1053);
        float _1229 = fma(_1203, _1223, _937);
        _1173 = _1227;
        _1175 = _1225;
        _1177 = _1229;
        _1109 = _1207;
    }
    float _1231 = _1173;
    float _1233 = _1175;
    float _1235 = _1177;
    float _1237 = _1109;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1241 = _1231 + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1245 = _1233 + _1243;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1249 = _1235 + _1247;
    float _1251 = _1241 * _1241;
    float _1253 = fma(_1245, _1245, _1251);
    float _1255 = fma(_1249, _1249, _1253);
    float _1257 = rsqrt(_1255);
    float _1259 = sqrt(_1255);
    float _1261 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1263 = _1245 * _1261;
    float _1265 = _1249 * _1261;
    float _1267 = _1263 * _1263;
    float _1269 = _1265 * _1265;
    float _1271 = _1267 + _1269;
    float _1273 = sqrt(_1271);
    bool _1275 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = _1273 + _1277;
    float _1281 = _1253;
    float _1283 = _1271;
    float _1285 = _1279;
    float _1287 = _1241;
    float _1289 = _1263;
    float _1291 = _1265;
    float _1293 = _1269;
    if (_1275)
    {
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1281 = _1295;
    }
    float _1297 = _1281;
    if (_1275)
    {
        float _1299 = rsqrt(_1271);
        _1283 = _1299;
    }
    float _1301 = _1283;
    if (_1275)
    {
        float _1303 = _1279 * _1297;
        _1285 = _1303;
    }
    float _1305 = _1285;
    if (_1275)
    {
        float _1307 = _1305 * 0.15915493667125701904296875;
        _1111 = _1307;
    }
    float _1309 = _1111;
    float _1311 = _1237;
    if (_1275)
    {
        float _1313 = _1309 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        _1311 = _1315;
    }
    float _1317 = _1311;
    float _1319 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1321 = precise::max(0.0, _1319);
    float _1323 = _1297;
    float _1325 = _1321;
    if (_1275)
    {
        float _1327 = _1309 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        _1323 = _1329;
    }
    float _1331 = _1323;
    float _1333 = -_1261;
    float _1335 = -_1321;
    float _1337 = fma(_1241, _1333, _1335);
    if (_1275)
    {
        float _1339 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1287 = _1339;
    }
    float _1341 = _1287;
    float _1343 = _1317;
    float _1345 = _1341;
    if (_1275)
    {
        float _1347 = fma(_1317, _1341, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = _1349;
    if (!_1275)
    {
        _1345 = _1337;
    }
    float _1353 = _1345;
    float _1355 = _1353;
    if (_1275)
    {
        float _1357 = _1331 + (-1.0);
        _1325 = _1357;
    }
    float _1359 = _1325;
    float _1361 = _1359;
    if (_1275)
    {
        float _1363 = _1301 * _1349;
        _1179 = _1363;
    }
    float _1365 = _1179;
    if (_1275)
    {
        float _1367 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1367;
    }
    float _1369 = _1351;
    if (_1275)
    {
        float _1371 = _1263 * _1365;
        _1289 = _1371;
    }
    float _1373 = _1289;
    if (!_1275)
    {
        _1361 = _1267;
    }
    float _1375 = _1361;
    float _1377 = _1375;
    if (_1275)
    {
        float _1379 = _1265 * _1365;
        _1291 = _1379;
    }
    float _1381 = _1291;
    if (_1275)
    {
        float _1383 = fma(_1337, _1331, _1369);
        _1355 = _1383;
    }
    float _1385 = _1355;
    if (_1275)
    {
        float _1387 = _1373 * _1373;
        _1377 = _1387;
    }
    float _1389 = _1377;
    float _1391 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1275)
    {
        float _1393 = _1381 * _1381;
        _1293 = _1393;
    }
    float _1395 = _1293;
    float _1397 = fma(_1385, _1385, _1389);
    float _1399 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    float _1401 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1403 = _1397 + _1395;
    float _1405 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1407 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1399);
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1411 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1409);
    float _1413 = precise::clamp(_1411, 0.0, 1.0);
    float _1415 = rsqrt(_1403);
    float _1417 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1419 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1405);
    float _1421 = -_1413;
    float _1423 = _1421 + 1.0;
    float _1425 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1427 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1417);
    float _1429 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1431 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1433 = abs(_1423);
    float _1435 = log2(_1433);
    float _1437 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1427);
    float _1439 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1441 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1443 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1431);
    float _1445 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1449 = -_1441;
    float _1451 = fma(_1449, _1401, 1.0);
    float _1453 = _1415 * _1373;
    float _1455 = _1415 * _1385;
    float _1457 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1447);
    float _1459 = _1415 * _1381;
    float _1461 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1463 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1443);
    float _1465 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1457);
    float _1467 = log2(_1451);
    float _1469 = -_1461;
    float _1471 = fma(_1455, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1469);
    float _1473 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1475 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1477 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1479 = -_1459;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1471);
    float _1483 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1485 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1465);
    float _1487 = exp2(_1473);
    float _1489 = fma(_1481, -0.5, 0.5);
    float _1491 = fma(_1481, 0.5, 0.5);
    float _1493 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1483);
    float _1495 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1477);
    float _1497 = _1455 + 1.0;
    float _1499 = fma(_1491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1501 = 1.0 / _1485;
    float _1503 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1493);
    float _1505 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1495);
    float _1507 = fma(_1491, _1499, -0.212114393711090087890625);
    float _1509 = _1467 * 0.693147182464599609375;
    float _1511 = fma(_1491, _1507, 1.570728778839111328125);
    float _1513 = sqrt(_1489);
    float _1515 = -_1455;
    float _1517 = fma(_1487, _1497, _1515);
    float _1519 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1503);
    float _1521 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1505);
    float _1523 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1525 = fma(_1517, 0.5, 0.5);
    float _1527 = _1519 * _1501;
    float _1529 = _1521 * _1501;
    float _1531 = fma(_1527, 0.5, 0.5);
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = _1513 * 0.636619746685028076171875;
    float _1537 = -_1511;
    float _1539 = fma(_1535, _1537, 1.0);
    float3 _5479 = float3(_1531, _1533, _1523);
    float _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5479, float3(0.0), isnan(_5479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5479, float3(0.0), isnan(_5479)), level(0.0)).x;
    float3 _5490 = float3(_1531, _1533, _1523);
    float4 _1544 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5490, float3(0.0), isnan(_5490)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5490, float3(0.0), isnan(_5490)), level(0.0)).xyzw;
    float _1546 = _1544.x;
    float _1548 = _1544.y;
    float _1550 = _1544.z;
    float _1552 = _1544.w;
    float2 _5507 = float2(_1539, _1525);
    float3 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5507, float2(0.0), isnan(_5507)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5507, float2(0.0), isnan(_5507)), level(0.0)).xyz;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1566 = int(_1564);
    float _1568 = _493 * _495;
    int _1570 = abs(_1087);
    out.m_45.x = 1.0;
    int _1572 = abs(_601);
    float _1574 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1576 = abs(_607);
    out.m_66.x = _1233;
    out.m_66.y = _1231;
    out.m_66.z = _1235;
    float _1578 = trunc(_765);
    int _1580 = int(_1578);
    float _1582 = -_689;
    float _1584 = _1582 + 1.0;
    float _1586 = -_775;
    float _1588 = _1586 + 1.0;
    float _1590 = -_551;
    float _1592 = _1590 + 1.0;
    float _1594 = float(uint(_1566));
    float _1596 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].x);
    int _1598 = int(_1596);
    bool _1600 = _1566 == 0;
    float _1602 = float(uint(_1580));
    float _1604 = 1.0 / _1594;
    int _1606 = ~_1566;
    int _1608 = _1606 + 1;
    float _1610 = float(uint(_1598));
    float _1612 = trunc(_771);
    int _1614 = int(_1612);
    int _1616 = ~_1598;
    int _1618 = _1616 + 1;
    int _1620 = as_type<int>(_1604) + (-2);
    float _1622 = 1.0 / _1610;
    int _1624 = ~_1566;
    int _1626 = _1624 + 1;
    float _1628 = as_type<float>(_1620) * _1602;
    float _1630 = trunc(_1628);
    float _1632 = precise::max(_1630, 0.0);
    uint _1635 = uint(_1632);
    float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1639 = float(_1580);
    int _1641 = _1608 * int(_1635);
    int _1643 = _1641 + _1580;
    float _1645 = exp2(_1574);
    float _1647 = float(uint(_1643));
    int _1649 = as_type<int>(_1622) + (-2);
    float _1651 = float(_1566);
    float _1653 = as_type<float>(_1620) * _1647;
    float _1655 = _497 * _499;
    float _1657 = float(uint(_1614));
    bool _1659 = _1639 >= _1651;
    bool _1661 = isnan(_1639);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(_1651);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = floor(_1655);
    float _1673 = as_type<float>(_1649) * _1657;
    float _1675 = -_1645;
    float _1677 = _1675 + 1.0;
    float _1679 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1681 = trunc(_1653);
    float _1683 = precise::max(_1681, 0.0);
    uint _1685 = uint(_1683);
    float _1687 = trunc(_1673);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = -_1671;
    float _1695 = _1655 + _1693;
    float _1697 = _1695 * _1651;
    int _1699 = int(_1635) + int(_1685);
    float _1701 = trunc(_1669);
    int _1703 = int(_1701);
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1707 = _1705 != 0;
    int _1709 = _1626 * _1699;
    int _1711 = _1709 + _1580;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1715 = _1713 != 0;
    int _1717 = _1618 * int(_1691);
    int _1719 = _1717 + _1614;
    float _1721 = floor(_1568);
    bool _1723 = uint(_1711) >= uint(_1566);
    float _1725 = float(uint(_1719));
    bool _1727 = !_1723;
    int _1729 = _1727 ? 0 : (-1);
    bool _1731 = !_1707;
    int _1733 = _1731 ? 0 : 1;
    float _1735 = trunc(_1697);
    int _1737 = int(_1735);
    float _1739 = as_type<float>(_1649) * _1725;
    int _1741 = ~_1699;
    int _1743 = _1741 + _1729;
    int _1745 = _1743 + 1;
    int _1747 = abs(_1733);
    int _1749 = ~_1703;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    int _1755 = _1566 * _1745;
    int _1757 = _1755 + _1580;
    float _1759 = trunc(_1739);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    float _1765 = -_1721;
    float _1767 = _1568 + _1765;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 65536;
    bool _1771 = _1769 != 0;
    bool _1773 = !_1600;
    int _1775 = _1773 ? _1757 : (-1);
    int _1777 = _1566 + (-1);
    int _1779 = _1737 * _1747;
    int _1781 = _1779 + _1580;
    float _1783 = _1651 * _657;
    int _1785 = _1775 * _1753;
    int _1787 = ~_1598;
    int _1789 = _1787 + 1;
    float _1791 = float(_1614);
    int _1793 = _1703 * _1777;
    int _1795 = _1793 + _1785;
    float _1797 = trunc(_1783);
    int _1799 = int(_1797);
    int _1801 = int(_1691) + int(_1763);
    float _1803 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1805 = abs(_1091);
    float _1807 = -_941;
    float _1809 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1803);
    int _1811 = _1789 * _1801;
    int _1813 = _1811 + _1614;
    float _1815 = float(_1598);
    int _1817 = abs(_1095);
    int _1819 = _1795 * _1570;
    bool _1821 = _1791 >= _1815;
    bool _1823 = isnan(_1791);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(_1815);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    bool _1833 = uint(_1813) >= uint(_1598);
    int _1835 = _1799 * _1805;
    int _1837 = _1835 + _1819;
    float _1839 = trunc(_1831);
    int _1841 = int(_1839);
    int _1843 = abs(_1099);
    float _1845 = _1767 * _1815;
    bool _1847 = !_1833;
    int _1849 = _1847 ? 0 : (-1);
    int _1851 = _1781 * _1817;
    int _1853 = _1851 + _1837;
    float _1855 = _1815 * _657;
    int _1857 = ~_1801;
    int _1859 = _1857 + _1849;
    int _1861 = _1859 + 1;
    float _1863 = trunc(_1845);
    int _1865 = int(_1863);
    bool _1867 = _1598 == 0;
    int _1869 = _1737 * _1843;
    int _1871 = _1869 + _1853;
    int _1873 = _1598 + (-1);
    int _1875 = _1598 * _1861;
    int _1877 = _1875 + _1614;
    bool _1879 = !_1771;
    int _1881 = _1879 ? 0 : 1;
    float _1883 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1885 = float(uint(_1871));
    float _1887 = trunc(_1855);
    int _1889 = int(_1887);
    int _1891 = ~_1841;
    int _1893 = _1891 + 1;
    int _1895 = _1893 + 1;
    float _1897 = -_941;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1883);
    bool _1901 = !_1867;
    int _1903 = _1901 ? _1877 : (-1);
    float _1905 = as_type<float>(_1620) * _1885;
    int _1907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8388608;
    bool _1909 = _1907 != 0;
    float _1911 = float(uint(_1781));
    int _1913 = _1903 * _1895;
    int _1915 = abs(_1881);
    float _1917 = trunc(_1905);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    int _1923 = _1841 * _1873;
    int _1925 = _1923 + _1913;
    bool _1927 = !_1909;
    int _1929 = _1927 ? 0 : 1;
    int _1931 = _1865 * _1915;
    int _1933 = _1931 + _1614;
    int _1935 = abs(_613);
    int _1937 = _1925 * _1572;
    int _1939 = ~_1566;
    int _1941 = _1939 + 1;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1943;
    int _1947 = ~_1598;
    int _1949 = _1947 + 1;
    int _1951 = _1889 * _1576;
    int _1953 = _1951 + _1937;
    int _1955 = abs(_1929);
    float _1957 = as_type<float>(_1620) * _1911;
    int _1959 = _1941 * int(_1921);
    int _1961 = _1959 + _1871;
    float _1963 = trunc(_1957);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    float _1969 = float(uint(_1961));
    int _1971 = _1933 * _1935;
    int _1973 = _1971 + _1953;
    int _1975 = ~_1598;
    int _1977 = _1975 + 1;
    float _1979 = as_type<float>(_1620) * _1969;
    int _1981 = _1865 * _1955;
    int _1983 = _1981 + _1973;
    int _1985 = ~_1566;
    int _1987 = _1985 + 1;
    float _1989 = trunc(_1979);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = float(uint(_1983));
    int _1997 = _1987 * int(_1967);
    int _1999 = _1997 + _1781;
    float _2001 = as_type<float>(_1649) * _1995;
    float _2003 = float(uint(_1999));
    int _2005 = ~_1566;
    int _2007 = _2005 + 1;
    float _2009 = trunc(_2001);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    float _2015 = as_type<float>(_1620) * _2003;
    int _2017 = ~_1598;
    int _2019 = _2017 + 1;
    int _2021 = int(_1921) + int(_1993);
    float _2023 = trunc(_2015);
    float _2025 = precise::max(_2023, 0.0);
    uint _2027 = uint(_2025);
    int _2029 = _2007 * _2021;
    int _2031 = _2029 + _1871;
    int _2033 = _1977 * int(_2013);
    int _2035 = _2033 + _1983;
    bool _2037 = uint(_2031) >= uint(_1566);
    bool _2039 = !_2037;
    int _2041 = _2039 ? 0 : (-1);
    float _2043 = float(uint(_2035));
    int _2045 = ~_2021;
    int _2047 = _2045 + _2041;
    int _2049 = _2047 + 1;
    int _2051 = int(_1967) + int(_2027);
    float _2053 = as_type<float>(_1967);
    float _2055 = as_type<float>(_1941);
    if (_1715)
    {
        float _2057 = _125 * 3.1415927410125732421875;
        _2053 = _2057;
    }
    float _2059 = _2053;
    int _2061 = _1566 * _2049;
    int _2063 = _2061 + _1871;
    float _2065 = as_type<float>(_1649) * _2043;
    if (_1715)
    {
        float _2067 = _2059 * 0.15915493667125701904296875;
        _2055 = _2067;
    }
    float _2069 = _2055;
    int _2071 = _1941 * _2051;
    int _2073 = _2071 + _1781;
    bool _2075 = !_1600;
    int _2077 = _2075 ? _2063 : (-1);
    float _2079 = trunc(_2065);
    float _2081 = precise::max(_2079, 0.0);
    uint _2083 = uint(_2081);
    int _2085 = _2077 & 3;
    bool _2087 = _2085 != 0;
    int _2089 = _2077 & 3;
    bool _2091 = _2089 != 0;
    bool _2093 = uint(_2073) >= uint(_1566);
    float _2095 = _2069;
    if (_1715)
    {
        float _2097 = _2069 * 6.283185482025146484375;
        float _2099 = sin(_2097);
        _2095 = _2099;
    }
    float _2101 = _2095;
    float _2103 = _2087 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2105 = _2089 != 3;
    bool _2107 = !_2093;
    int _2109 = _2107 ? 0 : (-1);
    bool _2111 = uint(_2089) > 1u;
    bool _2113 = uint(_2089) >= 2u;
    int _2115 = ~_2051;
    int _2117 = _2115 + _2109;
    int _2119 = _2117 + 1;
    float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _2121;
    int _2125 = _2113 ? 0 : 1;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _2129 = _371 + _2127;
    int _2131 = int(_2013) + int(_2083);
    int _2133 = _1566 * _2119;
    int _2135 = _2133 + _1781;
    int _2137 = ~_2125;
    int _2139 = _2137 + 1;
    int _2141 = _2139 + 1;
    float _2143 = 1.0 / _2123;
    int _2145 = _2141;
    bool _2147 = _2113;
    float _2149 = _2103;
    if (_2105)
    {
        int _2151 = ~_2125;
        int _2153 = _2151 + 1;
        _2145 = _2153;
    }
    int _2155 = _2145;
    int _2157 = _2019 * _2131;
    int _2159 = _2157 + _1983;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2163 = _2161 != 0;
    float _2165 = _1679 * _1541;
    if (_1715)
    {
        bool _2167 = _2101 > 0.5;
        _2147 = _2167;
    }
    bool _2169 = _2147;
    float _2171 = -_1679;
    float _2173 = _2171 + 1.0;
    int _2175 = ~as_type<int>(_2103);
    int _2177 = _2175 + 1;
    int _2179 = _2177 + 1;
    int _2181 = _2179;
    if (!_2111)
    {
        int _2183 = ~as_type<int>(_2103);
        int _2185 = _2183 + 1;
        _2181 = _2185;
    }
    int _2187 = _2181;
    if (!_1715)
    {
        _2149 = _181;
    }
    float _2189 = _2149;
    float _2191 = float(uint(_1933));
    float _2193 = _2189;
    float _2195 = _2191;
    if (_1715)
    {
        float _2197 = -_181;
        float _2199 = _2169 ? _2197 : _181;
        _2193 = _2199;
    }
    float _2201 = _2193;
    if (_2163)
    {
        float _2203 = _125 * 3.1415927410125732421875;
        _143 = _2203;
    }
    float _2205 = _143;
    int _2207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2209 = _2207 != 0;
    float _2211 = as_type<float>(_1649) * _2191;
    bool _2213 = uint(_2159) >= uint(_1598);
    float _2215 = _2129 * _2143;
    bool _2217 = !_1600;
    int _2219 = _2217 ? _2135 : (-1);
    if (_2163)
    {
        float _2221 = _2205 * 0.15915493667125701904296875;
        _2195 = _2221;
    }
    float _2223 = _2195;
    bool _2225 = !_2213;
    int _2227 = _2225 ? 0 : (-1);
    float _2229 = trunc(_2211);
    float _2231 = precise::max(_2229, 0.0);
    uint _2233 = uint(_2231);
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2237 = _2235 != 0;
    int _2239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2241 = _2239 != 0;
    int _2243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 33554432;
    bool _2245 = _2243 != 0;
    float _2247 = _2205;
    bool _2249 = _2241;
    if (_2209)
    {
        float _2251 = in.m_49.x;
        _2247 = _2251;
    }
    float _2253 = _2247;
    bool _2255 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _2257 = isnan(_371);
    bool _2259 = _2255 || _2257;
    bool _2261 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _2263 = _2259 || _2261;
    float _2265 = float(_2263);
    float _2267 = _2223;
    if (_2163)
    {
        float _2269 = _2223 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        _2267 = _2271;
    }
    float _2273 = _2267;
    bool _2275 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _2277 = isnan(_371);
    bool _2279 = _2275 || _2277;
    bool _2281 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _2283 = _2279 || _2281;
    float _2285 = float(_2283);
    float _2287 = -_2285;
    float _2289 = _2287 + 1.0;
    int _2291 = ~_1598;
    int _2293 = _2291 + 1;
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _2295;
    int _2299 = ~_2131;
    int _2301 = _2299 + _2227;
    int _2303 = _2301 + 1;
    float _2305 = _2265 * _2289;
    float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _2307;
    float _2311 = fma(_2297, _2215, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    int _2313 = _2077 >> 31;
    int _2315 = _2293 * int(_2233);
    int _2317 = _2315 + _1933;
    float _2319 = fma(_2309, _2215, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _2321 = _1598 * _2303;
    int _2323 = _2321 + _1983;
    int _2325 = _2313 & 3;
    float _2327 = _2311 * _2305;
    float _2329 = _2319 * _2305;
    float _2331 = float(uint(_2317));
    float _2333 = fma(_1945, _2215, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    int _2335 = _2077 + _2325;
    float _2337 = -_2265;
    float _2339 = _2337 + 1.0;
    bool _2341 = !_1867;
    int _2343 = _2341 ? _2323 : (-1);
    float _2345 = as_type<float>(_1649) * _2331;
    bool _2347 = !_2241;
    int _2349 = _2347 ? 0 : 1;
    float _2351 = as_type<float>(_2077);
    float _2353 = _2327;
    float _2355 = _2345;
    if (_2237)
    {
        float _2357 = in.m_49.z;
        _2351 = _2357;
    }
    float _2359 = _2351;
    if (_2163)
    {
        bool _2361 = _2273 > 0.5;
        _2249 = _2361;
    }
    bool _2363 = _2249;
    float _2365 = _2253;
    if (_2209)
    {
        float _2367 = _2253 * 3.1415927410125732421875;
        _2365 = _2367;
    }
    float _2369 = _2365;
    bool _2371 = !_2245;
    int _2373 = _2371 ? 0 : 1;
    float _2375 = trunc(_2345);
    float _2377 = precise::max(_2375, 0.0);
    uint _2379 = uint(_2377);
    int _2381 = _2343 & 3;
    bool _2383 = _2381 != 0;
    float _2385 = fma(_2339, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2327);
    bool _2387 = !_2091;
    int _2389 = _2387 ? 0 : 1;
    float _2391 = _2333 * _2305;
    bool _2393 = uint(_2381) > 1u;
    if (_2209)
    {
        float _2395 = _2369 * 0.15915493667125701904296875;
        _2353 = _2395;
    }
    float _2397 = _2353;
    bool _2399 = !_2383;
    int _2401 = _2399 ? 0 : 1;
    float _2403 = fma(_2339, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2329);
    int _2405 = _2343 & 3;
    bool _2407 = _2405 != 0;
    float _2409 = fma(_2339, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2391);
    int _2411 = _2335 >> 2;
    float _2413 = _2397;
    if (_2209)
    {
        float _2415 = _2397 * 6.283185482025146484375;
        float _2417 = sin(_2415);
        _2413 = _2417;
    }
    float _2419 = _2413;
    int _2421 = _2407 ? 0 : 1;
    float _2423 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[108].z, _2409);
    bool _2425 = _2089 != 3;
    float _2427 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[108].y, _2403);
    int _2429 = ~_2421;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[108].x, _2385);
    int _2437 = _2433;
    if (!_2393)
    {
        int _2439 = ~_2421;
        int _2441 = _2439 + 1;
        _2437 = _2441;
    }
    int _2443 = _2437;
    float _2445 = _2359;
    if (_2237)
    {
        float _2447 = _2359 * 3.1415927410125732421875;
        _2445 = _2447;
    }
    float _2449 = _2445;
    bool _2451 = uint(_2381) >= 2u;
    float _2453 = _2427 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2455 = _2411 << 4;
    int _2457 = _2455 + 800;
    if (_2237)
    {
        float _2459 = _2449 * 0.15915493667125701904296875;
        _2355 = _2459;
    }
    float _2461 = _2355;
    int _2463 = int(_2233) + int(_2379);
    float _2465 = _2435 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2467 = !_2425;
    int _2469 = _2467 ? 0 : (-1);
    uint _2471 = uint(int(uint(_2457) >> uint(2)));
    uint _2473 = uint(int(uint(int(_2471)) >> uint(2)));
    int _2475 = int(_2471) & 3;
    float _2477 = (*spvDescriptorSet0.vp_c9)._m0[int(_2473)][_2475];
    int _2479 = int(_2471) + 1;
    uint _2481 = uint(int(uint(_2479) >> uint(2)));
    int _2483 = _2479 & 3;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[int(_2481)][_2483];
    int _2487 = _2343 >> 31;
    float _2489 = _2461;
    if (_2237)
    {
        float _2491 = _2461 * 6.283185482025146484375;
        float _2493 = sin(_2491);
        _2489 = _2493;
    }
    float _2495 = _2489;
    bool _2497 = _2381 != 3;
    int _2499 = _1949 * _2463;
    int _2501 = _2499 + _1933;
    int _2503 = _2451 ? 0 : 1;
    float _2505 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2507 = _2381 != 3;
    float _2509 = _2453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2511 = _2487 & 3;
    bool _2513 = !_2507;
    int _2515 = _2513 ? 0 : (-1);
    bool _2517 = _2507;
    if (_2209)
    {
        bool _2519 = _2419 > 0.5;
        _2517 = _2519;
    }
    bool _2521 = _2517;
    int _2523 = _2343 + _2511;
    int _2525 = _2457 + 8;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    uint _2529 = uint(int(uint(int(_2527)) >> uint(2)));
    int _2531 = int(_2527) & 3;
    float _2533 = (*spvDescriptorSet0.vp_c9)._m0[int(_2529)][_2531];
    int _2535 = int(_2527) + 1;
    uint _2537 = uint(int(uint(_2535) >> uint(2)));
    int _2539 = _2535 & 3;
    float _2541 = (*spvDescriptorSet0.vp_c9)._m0[int(_2537)][_2539];
    int _2543 = ~_2503;
    int _2545 = _2543 + 1;
    int _2547 = _2545 + 1;
    int _2549 = _2523 >> 2;
    int _2551 = _2547;
    if (_2497)
    {
        int _2553 = ~_2503;
        int _2555 = _2553 + 1;
        _2551 = _2555;
    }
    int _2557 = _2551;
    float _2559 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2561 = _2549 << 4;
    int _2563 = _2561 + 944;
    bool _2565 = uint(_2501) >= uint(_1598);
    float _2567 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2569 = uint(int(uint(_2563) >> uint(2)));
    uint _2571 = uint(int(uint(int(_2569)) >> uint(2)));
    int _2573 = int(_2569) & 3;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[int(_2571)][_2573];
    int _2577 = int(_2569) + 1;
    uint _2579 = uint(int(uint(_2577) >> uint(2)));
    int _2581 = _2577 & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    int _2585 = abs(_2187);
    bool _2587 = !_2565;
    int _2589 = _2587 ? 0 : (-1);
    out.m_68.x = _2505;
    out.m_68.y = _2509;
    out.m_68.z = _2567;
    bool _2591 = _2565;
    if (_2237)
    {
        bool _2593 = _2495 > 0.5;
        _2591 = _2593;
    }
    bool _2595 = _2591;
    float _2597 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2599 = ~_2585;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    int _2605 = abs(_2155);
    float _2607 = -_941;
    float _2609 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2597);
    float _2611 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2613 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _2615 = int(_2613);
    int _2617 = ~_2605;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    int _2623 = abs(_2469);
    int _2625 = _2563 + 8;
    uint _2627 = uint(int(uint(_2625) >> uint(2)));
    uint _2629 = uint(int(uint(int(_2627)) >> uint(2)));
    int _2631 = int(_2627) & 3;
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[int(_2629)][_2631];
    int _2635 = int(_2627) + 1;
    uint _2637 = uint(int(uint(_2635) >> uint(2)));
    int _2639 = _2635 & 3;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[int(_2637)][_2639];
    int _2643 = abs(_2389);
    float _2645 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2647 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2611);
    int _2649 = _2603 * as_type<int>(_2485);
    int _2651 = ~_2643;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    float _2657 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2645);
    int _2659 = abs(_2443);
    float _2661 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2663 = abs(_2401);
    int _2665 = _2655 * as_type<int>(_2477);
    int _2667 = _2665 + _2649;
    int _2669 = ~_2659;
    int _2671 = _2669 + 1;
    int _2673 = _2671 + 1;
    float _2675 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2661);
    int _2677 = ~_2463;
    int _2679 = _2677 + _2589;
    int _2681 = _2679 + 1;
    float _2683 = trunc((*spvDescriptorSet0.vp_c9)._m0[100].z);
    int _2685 = int(_2683);
    int _2687 = ~_2663;
    int _2689 = _2687 + 1;
    int _2691 = _2689 + 1;
    float _2693 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1809);
    int _2695 = abs(_2373);
    int _2697 = _1598 * _2681;
    int _2699 = _2697 + _1933;
    int _2701 = abs(_2557);
    float _2703 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2609);
    int _2705 = _2621 * as_type<int>(_2533);
    int _2707 = _2705 + _2667;
    int _2709 = abs(_2349);
    float _2711 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1899);
    float _2713 = float(uint(_2615));
    float _2715 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2717 = abs(_2515);
    float _2719 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2715);
    int _2721 = ~_2623;
    int _2723 = _2721 + 1;
    int _2725 = _2723 + 1;
    float _2727 = 1.0 / _2713;
    int _2729 = _2673 * as_type<int>(_2583);
    int _2731 = ~_2709;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    float _2737 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2719);
    int _2739 = _2725 * as_type<int>(_2541);
    int _2741 = _2739 + _2707;
    float _2743 = float(uint(_2685));
    int _2745 = _2691 * as_type<int>(_2575);
    int _2747 = _2745 + _2729;
    bool _2749 = !_1867;
    int _2751 = _2749 ? _2699 : (-1);
    int _2753 = _2741 * _2735;
    int _2755 = ~_2685;
    int _2757 = _2755 + 1;
    float _2759 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2737);
    float _2761 = 1.0 / _2743;
    int _2763 = _2219 * _2709;
    int _2765 = _2763 + _2753;
    int _2767 = ~_2701;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    float _2773 = _971 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.gl_Position.x = _1519;
    out.gl_Position.y = _1521;
    out.gl_Position.z = _2759;
    out.gl_Position.w = _1485;
    int _2775 = as_type<int>(_2727) + (-2);
    int _2777 = _2771 * as_type<int>(_2633);
    int _2779 = _2777 + _2747;
    float _2781 = float(uint(_2765));
    float _2783 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2773);
    int _2785 = ~_2717;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = as_type<float>(_2775) * _2781;
    int _2793 = abs(_2615);
    float _2795 = _971 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2797 = abs(_2685);
    int _2799 = _2789 * as_type<int>(_2641);
    int _2801 = _2799 + _2779;
    int _2803 = ~_2695;
    int _2805 = _2803 + 1;
    int _2807 = _2805 + 1;
    float _2809 = trunc(_2791);
    float _2811 = precise::max(_2809, 0.0);
    uint _2813 = uint(_2811);
    float _2815 = float(uint(_2793));
    float _2817 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2783);
    int _2819 = ~_2615;
    int _2821 = _2819 + 1;
    int _2823 = _2801 * _2807;
    float _2825 = _971 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2827 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2795);
    float _2829 = float(uint(_2797));
    float _2831 = 1.0 / _2815;
    float _2833 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2825);
    int _2835 = _2751 * _2695;
    int _2837 = _2835 + _2823;
    int _2839 = abs(_2765);
    float _2841 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2843 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2833);
    int _2845 = as_type<int>(_2761) + (-2);
    float _2847 = _2759 + _1485;
    int _2849 = _2821 * int(_2813);
    int _2851 = _2849 + _2765;
    float _2853 = float(uint(_2837));
    float _2855 = 1.0 / _2829;
    int _2857 = ~_2793;
    int _2859 = _2857 + 1;
    float _2861 = _1562 * _2165;
    float _2863 = float(uint(_2851));
    float _2865 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2827);
    float _2867 = as_type<float>(_2845) * _2853;
    int _2869 = as_type<int>(_2831) + (-2);
    float _2871 = as_type<float>(_2775) * _2863;
    float _2873 = float(uint(_2839));
    float _2875 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2657);
    int _2877 = abs(_2837);
    float _2879 = trunc(_2867);
    float _2881 = precise::max(_2879, 0.0);
    uint _2883 = uint(_2881);
    float _2885 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2647);
    float _2887 = as_type<float>(_2869) * _2873;
    float _2889 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2675);
    float _2891 = _2647;
    float _2893 = _2675;
    if (!_2209)
    {
        _1113 = _181;
    }
    float _2895 = _1113;
    float _2897 = _2847 * 0.5;
    float _2899 = _2895;
    if (_2209)
    {
        float _2901 = -_181;
        float _2903 = _2521 ? _2901 : _181;
        _2899 = _2903;
    }
    float _2905 = _2899;
    float _2907 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2909 = as_type<int>(_2855) + (-2);
    float _2911 = trunc(_2887);
    float _2913 = precise::max(_2911, 0.0);
    uint _2915 = uint(_2913);
    float _2917 = float(uint(_2877));
    float _2919 = fma(_2907, _2907, 1.0);
    if (!_2163)
    {
        _2891 = _177;
    }
    float _2921 = _2891;
    float _2923 = _2907 * _2703;
    float _2925 = _2921;
    if (!_2237)
    {
        _2893 = _177;
    }
    float _2927 = _2893;
    float _2929 = as_type<float>(_2909) * _2917;
    float _2931 = _2927;
    if (_2163)
    {
        float _2933 = -_177;
        float _2935 = _2363 ? _2933 : _177;
        _2925 = _2935;
    }
    float _2937 = _2925;
    float _2939 = rsqrt(_2919);
    if (_2237)
    {
        float _2941 = -_177;
        float _2943 = _2595 ? _2941 : _177;
        _2931 = _2943;
    }
    float _2945 = _2931;
    float _2947 = _2907 * _2693;
    int _2949 = _2757 * int(_2883);
    int _2951 = _2949 + _2837;
    int _2953 = ~_2797;
    int _2955 = _2953 + 1;
    float _2957 = _2907 * _2711;
    out.m_70.x = _2875;
    out.m_70.y = _2885;
    out.m_70.z = _2889;
    int _2959 = ~_2797;
    int _2961 = _2959 + 1;
    float _2963 = trunc(_2929);
    float _2965 = precise::max(_2963, 0.0);
    uint _2967 = uint(_2965);
    int _2969 = _2859 * int(_2915);
    int _2971 = _2969 + _2839;
    int _2973 = _2765 ^ _2615;
    out.m_72.z = _2897;
    out.m_72.w = _1485;
    bool _2975 = _2685 == 0;
    float _2977 = float(uint(_2971));
    float _2979 = trunc(_2871);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    float _2985 = fma(_2841, _2875, _2947);
    float _2987 = fma(_2841, _2885, _2923);
    float _2989 = float(uint(_2951));
    float _2991 = _2907 * _2939;
    float _2993 = as_type<float>(_2869) * _2977;
    float _2995 = fma(_2841, _2889, _2957);
    uint _2997 = uint(int(uint(_2973) >> uint(31)));
    float _2999 = as_type<float>(_2845) * _2989;
    int _3001 = _2955 * int(_2967);
    int _3003 = _3001 + _2877;
    float _3005 = -_2843;
    float _3007 = _2991 * _3005;
    float _3009 = -_2865;
    float _3011 = _2991 * _3009;
    float _3013 = -_2817;
    float _3015 = _2991 * _3013;
    float _3017 = trunc(_2993);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    float _3023 = float(uint(_3003));
    float _3025 = fma(_2939, _2693, _3007);
    float _3027 = fma(_2939, _2711, _3015);
    int _3029 = ~_2615;
    int _3031 = _3029 + 1;
    float _3033 = _2865 + _2987;
    float _3035 = as_type<float>(_2909) * _3023;
    int _3037 = int(_2813) + int(_2983);
    float _3039 = trunc(_2999);
    float _3041 = precise::max(_3039, 0.0);
    uint _3043 = uint(_3041);
    float _3045 = _2817 + _2995;
    int _3047 = ~_2793;
    int _3049 = _3047 + 1;
    float _3051 = fma(_2939, _2703, _3011);
    bool _3053 = _2685 == 0;
    int _3055 = _3031 * _3037;
    int _3057 = _3055 + _2765;
    float _3059 = trunc(_3035);
    float _3061 = precise::max(_3059, 0.0);
    uint _3063 = uint(_3061);
    int _3065 = int(_2915) + int(_3021);
    out.m_74.x = _3025;
    out.m_74.y = _3051;
    out.m_74.z = _3027;
    bool _3067 = uint(_3057) >= uint(_2615);
    float _3069 = _2843 + _2985;
    int _3071 = _3049 * _3065;
    int _3073 = _3071 + _2839;
    bool _3075 = !_3067;
    int _3077 = _3075 ? 0 : (-1);
    int _3079 = int(_2883) + int(_3043);
    out.m_76.x = _3069;
    out.m_76.y = _3033;
    out.m_76.z = _3045;
    int _3081 = ~_2685;
    int _3083 = _3081 + 1;
    int _3085 = ~_3037;
    int _3087 = _3085 + _3077;
    int _3089 = _3087 + 1;
    int _3091 = int(_2967) + int(_3063);
    int _3093 = _2615 * _3089;
    int _3095 = _3093 + _2765;
    bool _3097 = _2615 == 0;
    int _3099 = _3083 * _3079;
    int _3101 = _3099 + _2837;
    bool _3103 = uint(_3073) >= uint(_2793);
    int _3105 = _2961 * _3091;
    int _3107 = _3105 + _2877;
    bool _3109 = !_3097;
    int _3111 = _3109 ? _3095 : (-1);
    float _3113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _3115 = uint(_3101) >= uint(_2685);
    bool _3117 = uint(_3107) >= uint(_2797);
    bool _3119 = !_3115;
    int _3121 = _3119 ? 0 : (-1);
    int _3123 = _2837 ^ _2685;
    float _3125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3127 = ~_3079;
    int _3129 = _3127 + _3121;
    int _3131 = _3129 + 1;
    bool _3133 = !_3103;
    int _3135 = _3133 ? 0 : (-1);
    bool _3137 = !_3117;
    int _3139 = _3137 ? 0 : (-1);
    int _3141 = _2685 * _3131;
    int _3143 = _3141 + _2837;
    float _3145 = float(_3111);
    float _3147 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    uint _3149 = uint(int(uint(_3123) >> uint(31)));
    int _3151 = ~_3135;
    int _3153 = _3065 + _3151;
    int _3155 = _3153 + 1;
    float _3157 = fma(_3147, _3145, _747);
    int _3159 = ~_3139;
    int _3161 = _3091 + _3159;
    int _3163 = _3161 + 1;
    float _3165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _3167 = ~int(_2997);
    int _3169 = _3167 + 1;
    float _3171 = _3125 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    int _3173 = ~int(_3149);
    int _3175 = _3173 + 1;
    float _3177 = _1552 * _2173;
    bool _3179 = !_2975;
    int _3181 = _3179 ? _3143 : (-1);
    int _3183 = _3155 ^ _3169;
    int _3185 = _3163 ^ _3175;
    float _3187 = float(_3181);
    float _3189 = _2937 + 0.5;
    bool _3191 = _2615 == 0;
    int _3193 = ~_3169;
    int _3195 = _3193 + _3183;
    int _3197 = _3195 + 1;
    float _3199 = fma(_3147, _3189, _3157);
    int _3201 = ~_3175;
    int _3203 = _3201 + _3185;
    int _3205 = _3203 + 1;
    float _3207 = fma(_3171, _3187, _783);
    bool _3209 = !_3191;
    int _3211 = _3209 ? _3197 : (-1);
    float _3213 = _3165 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _3215 = !_3053;
    int _3217 = _3215 ? _3205 : (-1);
    float _3219 = _2945 + 0.5;
    float _3221 = float(_3211);
    float _3223 = _3113 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3225 = float(_3217);
    float _3227 = fma(_3171, _3219, _3207);
    float _3229 = -_1584;
    float _3231 = fma(_3229, _2937, _3199);
    float _3233 = -_565;
    float _3235 = fma(_3213, _3221, _3233);
    float _3237 = _2905 + (-0.5);
    float _3239 = -_785;
    float _3241 = fma(_3223, _3225, _3239);
    float _3243 = _2201 + (-0.5);
    float _3245 = -_1588;
    float _3247 = fma(_3245, _2945, _3227);
    float _3249 = -_3213;
    float _3251 = fma(_3249, _3237, _3235);
    float _3253 = -_779;
    float _3255 = _3253 + 1.0;
    float _3257 = -_3223;
    float _3259 = fma(_3257, _3243, _3241);
    float _3261 = _1552 * _2165;
    float _3263 = fma(_1592, _2905, _3251);
    float _3265 = fma(_1552, _2861, _1550);
    float _3267 = fma(_3255, _2201, _3259);
    float _3269 = fma(_1558, _3261, _1546);
    float _3271 = fma(_1560, _3261, _1548);
    out.m_78.x = _3231;
    out.m_78.y = _3263;
    float _3273 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_80.x = _3247;
    out.m_80.y = _3267;
    out.m_82.w = _3273;
    out.m_84.x = _3269;
    out.m_84.y = _3271;
    out.m_84.z = _3265;
    out.m_84.w = _3177;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _361 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3330 = as_type<float>(_119);
        out.gl_Position.z = _3330;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_47.w;
    float _125 = in.m_49.w;
    bool _127 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_123);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_123;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.w = _125;
    float _141 = _139;
    float _143 = _125;
    if (_135)
    {
        float _145 = float(_103);
        _113 = _145;
    }
    float _147 = _113;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_45.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _121 = as_type<int>(_159);
    }
    int _161 = _121;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3405 = as_type<float>(_161);
        out.gl_Position.z = _3405;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_49.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_103);
        float _207 = 1.0 / _205;
        float _209 = _139 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    bool _229 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_211);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -_227;
    float _251 = _249 + 1.0;
    float _253 = 1.0 / _243;
    bool _255 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _257 = isnan(_211);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = _239 * _251;
    float _269 = -_239;
    float _271 = _269 + 1.0;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _275 = _265 * _271;
    float _277 = 1.0 / _247;
    float _279 = -_265;
    float _281 = _279 + 1.0;
    float _283 = _215 * _253;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _211 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_291, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _287 * _277;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _307 = _297 * _275;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = _299 * _275;
    float _315 = fma(_305, _301, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _317 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _319 = fma(_311, _301, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _321 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[143].y, _313);
    float _323 = fma(_315, _267, _317);
    float _325 = fma(_319, _267, _321);
    float _327 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[145].x, _323);
    float _329 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[145].y, _325);
    bool _331 = !_273;
    float _333 = _313;
    int _335 = as_type<int>(_321);
    float _337 = _267;
    int _339 = as_type<int>(_325);
    float _341 = _275;
    float _359;
    if (!_331)
    {
        float _343 = in.m_49.x;
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _347 = _343 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _333 = _353;
        _359 = _357;
        _361 = true;
    }
    else
    {
        float _363 = float(_103);
        float _365 = 1.0 / _363;
        float _367 = _139 * _365;
        _359 = _367;
    }
    _361 = false;
    float _369 = _333;
    float _371 = _359;
    float _373 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _375 = int(_373);
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _379 = _377 != 0;
    float _381 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].y);
    int _383 = int(_381);
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _387 = _369;
    float _389 = _315;
    if (_379)
    {
        float _391 = in.m_49.x;
        float _393 = in.m_49.y;
        float _395 = in.m_49.z;
        _385 = _391;
        _387 = _393;
        _389 = _395;
    }
    float _397 = _385;
    float _399 = _387;
    float _401 = _389;
    float _403 = 0.0;
    if (_379)
    {
        _403 = 1.0;
    }
    float _405 = _403;
    float _407 = 0.0;
    float _409 = _405;
    if (_379)
    {
        _407 = 1.0;
    }
    float _411 = _407;
    float _413 = _411;
    if (_379)
    {
        _335 = 0;
    }
    int _415 = _335;
    float _417 = 0.0;
    float _419 = _401;
    float _421 = _397;
    int _423 = _415;
    float _425 = _399;
    if (_379)
    {
        _417 = _397;
    }
    float _427 = _417;
    float _429 = _427;
    if (_379)
    {
        _337 = _399;
    }
    float _431 = _337;
    float _433 = _431;
    if (_379)
    {
        _339 = as_type<int>(_401);
    }
    int _435 = _339;
    float _437 = 0.0;
    int _439 = _435;
    if (_379)
    {
        _437 = _427;
    }
    float _441 = _437;
    float _443 = _441;
    if (_379)
    {
        _341 = _427;
    }
    float _445 = _341;
    float _447 = _445;
    if (!_379)
    {
        float _449 = in.m_49.x;
        float _451 = in.m_49.y;
        float _453 = in.m_49.z;
        float _455 = _449 * 3.1415927410125732421875;
        float _457 = _455 * 0.15915493667125701904296875;
        float _459 = _451 * 3.1415927410125732421875;
        float _461 = _459 * 0.15915493667125701904296875;
        float _463 = _453 * 3.1415927410125732421875;
        float _465 = _457 * 6.283185482025146484375;
        float _467 = sin(_465);
        float _469 = _463 * 0.15915493667125701904296875;
        float _471 = _461 * 6.283185482025146484375;
        float _473 = sin(_471);
        float _475 = _469 * 6.283185482025146484375;
        float _477 = sin(_475);
        _419 = _453;
        _447 = _467;
        _421 = _449;
        _423 = 1;
        _433 = _473;
        _425 = _451;
        _439 = as_type<int>(_477);
        _413 = 1.2345600128173828125;
        _443 = _453;
        _409 = 7.345489978790283203125;
        _429 = _451;
    }
    float _479 = _419;
    float _481 = _447;
    float _483 = _421;
    int _485 = _423;
    float _487 = _433;
    float _489 = _425;
    int _491 = _439;
    float _493 = _413;
    float _495 = _443;
    float _497 = _409;
    float _499 = _429;
    float _501 = _479 * 2.0;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _505 = _481 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _507 = _483 * 2.0;
    bool _509 = _485 != 1;
    float _511 = -_503;
    float _513 = fma(_505, 2.0, _511);
    float _515 = _487 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _519 = floor(_501);
    float _521 = fma(_515, -2.0, _517);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _525 = floor(_507);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _529 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[93].w, _523);
    float _531 = _489 * 2.0;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1048576;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2097152;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4194304;
    bool _543 = _541 != 0;
    float _545 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[93].z, _527);
    bool _547 = !_509;
    float _549 = _547 ? _487 : _481;
    float _551 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _529);
    bool _553 = !_509;
    float _555 = _553 ? as_type<float>(_491) : _487;
    float _557 = _489 + _483;
    float _559 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _561 = log2(_559);
    bool _563 = _519 > 0.0;
    float _565 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _521);
    float _567 = _557 + (-1.0);
    bool _569 = _519 >= 0.0;
    bool _571 = isnan(_519);
    bool _573 = _569 || _571;
    bool _575 = isnan(0.0);
    bool _577 = _573 || _575;
    bool _579 = _525 > 0.0;
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _583 = _525 >= 0.0;
    bool _585 = isnan(_525);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = floor(_531);
    float _595 = float(_103);
    float _597 = _489 + _479;
    bool _599 = !_539;
    int _601 = _599 ? 0 : 1;
    float _603 = _489 + (-0.5);
    bool _605 = !_535;
    int _607 = _605 ? 0 : 1;
    float _609 = _597 + (-1.0);
    bool _611 = !_543;
    int _613 = _611 ? 0 : 1;
    float _615 = 1.0 / _595;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _627 = _625 != 0;
    int _629 = _577 ? 0 : 1;
    int _631 = ~_629;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    float _637 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _639 = !_619;
    int _641 = _639 ? 0 : 1;
    float _643 = _561 * _139;
    int _645 = _635;
    if (!_563)
    {
        int _647 = ~_629;
        int _649 = _647 + 1;
        _645 = _649;
    }
    int _651 = _645;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _655 = float(_375);
    float _657 = _615 * _139;
    bool _659 = _593 > 0.0;
    float _661 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[98].z, _653);
    bool _663 = _593 >= 0.0;
    bool _665 = isnan(_593);
    bool _667 = _663 || _665;
    bool _669 = isnan(0.0);
    bool _671 = _667 || _669;
    float _673 = 1.0 / _655;
    float _675 = float(_383);
    float _677 = 1.0 / _675;
    int _679 = abs(_641);
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _687 = float(_651);
    float _689 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _545);
    int _691 = _591 ? 0 : 1;
    float _693 = exp2(_643);
    float _695 = _549 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _697 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[98].w, _685);
    float _699 = _555 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _701 = -_681;
    float _703 = fma(_695, 2.0, _701);
    float _705 = float(_679);
    float _707 = fma(_699, -2.0, _683);
    bool _709 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _711 = isnan(1.0);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _717 = _713 || _715;
    float _719 = in.m_56.x;
    float _721 = in.m_56.y;
    float _723 = in.m_56.z;
    int _725 = ~_691;
    int _727 = _725 + 1;
    int _729 = _727 + 1;
    float _731 = _705 * _687;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _735 = 1.0 + _733;
    int _737 = _729;
    if (!_579)
    {
        int _739 = ~_691;
        int _741 = _739 + 1;
        _737 = _741;
    }
    int _743 = _737;
    float _745 = -_139;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[91].x, _513);
    float _749 = -_693;
    float _751 = _749 + 1.0;
    float _753 = 1.0 / _735;
    bool _755 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _763 = _759 || _761;
    float _765 = _673 * _139;
    bool _767 = !_623;
    int _769 = _767 ? 0 : 1;
    float _771 = _677 * _139;
    float _773 = _763 ? _751 : 0.0;
    float _775 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[97].z, _661);
    int _777 = abs(_769);
    float _779 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[97].w, _697);
    float _781 = -_139;
    float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[96].x, _703);
    float _785 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[96].y, _707);
    float _787 = float(_743);
    float _789 = float(_777);
    int _791 = _671 ? 0 : 1;
    if (_717)
    {
        float _793 = _773 * _753;
        _141 = _793;
    }
    float _795 = _141;
    float _797 = _731 * (-2.0);
    float _799 = _789 * _787;
    int _801 = ~_791;
    int _803 = _801 + 1;
    int _805 = _803 + 1;
    float _807 = _483 + (-0.5);
    float _809 = fma(_797, _719, _719);
    bool _811 = !_627;
    int _813 = _811 ? 0 : 1;
    float _815 = fma(_581, _797, _581);
    int _817 = _805;
    if (!_659)
    {
        int _819 = ~_791;
        int _821 = _819 + 1;
        _817 = _821;
    }
    int _823 = _817;
    float _825 = _799 * (-2.0);
    int _827 = abs(_813);
    float _829 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[196].x, _809);
    float _831 = float(_823);
    float _833 = fma(_637, _825, _637);
    float _835 = float(_827);
    float _837 = fma(_825, _721, _721);
    float _839 = fma(_815, _795, _829);
    float _841 = _483 + _479;
    float _843 = in.m_58.x;
    float _845 = in.m_58.y;
    float _847 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].y, _837);
    float _849 = _835 * _831;
    float _851 = _839 * 0.15915493667125701904296875;
    float _853 = _479 + (-0.5);
    float _855 = fma(_833, _795, _847);
    float _857 = _841 + (-1.0);
    float _859 = _849 * (-2.0);
    float _861 = in.m_42.x;
    float _863 = in.m_42.y;
    float _865 = in.m_42.z;
    float _867 = _855 * 0.15915493667125701904296875;
    float _869 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _871 = fma(_859, _723, _723);
    float _873 = in.m_60.x;
    float _875 = in.m_60.y;
    float _877 = in.m_60.z;
    float _879 = _851 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = fma(_869, _859, _869);
    float _885 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[196].z, _871);
    float _887 = fma(_883, _795, _885);
    float _889 = _851 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = _887 * 0.15915493667125701904296875;
    float _895 = _327 * _843;
    float _897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _899 = _329 * _845;
    float _901 = _867 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _907 = _863 * _875;
    float _909 = _867 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _895 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _917 = fma(_861, _873, _907);
    float _919 = _913 * _897;
    float _921 = _905 * _915;
    float _923 = in.m_62.x;
    float _925 = in.m_62.y;
    float _927 = in.m_62.z;
    float _929 = _893 * 6.283185482025146484375;
    float _931 = cos(_929);
    float _933 = _881 * _903;
    float _935 = fma(_865, _877, _917);
    float _937 = _935 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _939 = _893 * 6.283185482025146484375;
    float _941 = sin(_939);
    float _943 = _891 * _911;
    float _945 = _881 * _911;
    float _947 = _891 * _931;
    float _949 = _891 * _903;
    float _951 = _881 * _931;
    float _953 = _911 * _931;
    float _955 = _947 * _921;
    float _957 = _903 * _931;
    float _959 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _961 = _951 * _921;
    float _963 = fma(_941, _943, _933);
    float _965 = -_921;
    float _967 = _941 * _965;
    float _969 = -_945;
    float _971 = fma(_941, _949, _969);
    float _973 = -_949;
    float _975 = fma(_941, _945, _973);
    float _977 = fma(_963, _919, _955);
    float _979 = fma(_953, _919, _967);
    float _981 = fma(_941, _933, _943);
    float _983 = fma(_975, _919, _961);
    float _985 = fma(_971, _959, _977);
    float _987 = fma(_957, _959, _979);
    float _989 = _863 * _925;
    float _991 = fma(_981, _959, _983);
    float _993 = _985 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _995 = _985 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _997 = fma(_861, _923, _989);
    float _999 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[26].x, _993);
    float _1001 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].x, _995);
    float _1003 = fma(_865, _927, _997);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _999);
    float _1007 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    float _1009 = _1003 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1011 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1013 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1015 = in.m_64.x;
    float _1017 = in.m_64.y;
    float _1019 = in.m_64.z;
    float _1021 = _937 + _1011;
    float _1023 = _1009 + _1013;
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1027 = _1021 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1031 = _1023 + _1029;
    float _1033 = _1027 * _1027;
    float _1035 = fma(_1031, _1031, _1033);
    float _1037 = sqrt(_1035);
    float _1039 = _863 * _1017;
    float _1041 = _985 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1043 = fma(_861, _1015, _1039);
    float _1045 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1041);
    float _1047 = fma(_865, _1019, _1043);
    bool _1049 = _1037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1051 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1045);
    float _1053 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1065 = _1063 != 0;
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1069 = _1067 != 0;
    float _1071 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1073 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1075 = isnan(0.5);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1081 = _1077 || _1079;
    float _1083 = _1053 + _1071;
    bool _1085 = !_1061;
    int _1087 = _1085 ? 0 : 1;
    bool _1089 = !_1057;
    int _1091 = _1089 ? 0 : 1;
    bool _1093 = !_1065;
    int _1095 = _1093 ? 0 : 1;
    bool _1097 = !_1069;
    int _1099 = _1097 ? 0 : 1;
    float _1101 = _1015;
    float _1103 = _1019;
    float _1105 = _1043;
    float _1107 = _1037;
    float _1109 = _985;
    float _1111 = _1027;
    float _1113 = _975;
    if (!_1049)
    {
        _1101 = _1023;
    }
    float _1115 = _1101;
    float _1117 = _1115;
    if (!_1049)
    {
        _1103 = _1021;
    }
    float _1119 = _1103;
    float _1121 = _1119;
    if (!_1049)
    {
        _1105 = _1083;
    }
    float _1123 = _1105;
    bool _1125 = !_1049;
    float _1127 = _1123;
    if (!_1125)
    {
        float _1129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1133 = _1037 + _1131;
        float _1135 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1137 = rsqrt(_1035);
        float _1139 = _1133 * _1129;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = _1141 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = _1145 + (-1.0);
        float _1153 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = fma(_1149, _1135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1157 = fma(_1083, _1145, _1153);
        float _1159 = _1137 * _1155;
        float _1161 = fma(_1031, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1163 = fma(_1027, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1127 = _1157;
        _1121 = _1163;
        _1117 = _1161;
        _1107 = _1133;
    }
    float _1165 = _1127;
    float _1167 = _1121;
    float _1169 = _1117;
    float _1171 = _1107;
    float _1173 = _1165;
    float _1175 = _1169;
    float _1177 = _1167;
    float _1179 = _1171;
    if (!_1081)
    {
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1183 = _1053 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1187 = _1009 + _1185;
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1191 = -_1053;
        float _1193 = _1191 + _1165;
        float _1195 = _1183 * _1183;
        float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1199 = _937 + _1197;
        float _1201 = -_937;
        float _1203 = _1201 + _1167;
        float _1205 = fma(_1187, _1187, _1195);
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1209 = fma(_1199, _1199, _1205);
        float _1211 = sqrt(_1209);
        float _1213 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = precise::min(_1211, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1217 = _1215 * _1207;
        float _1219 = -_1009;
        float _1221 = _1219 + _1169;
        float _1223 = _1213 * _1217;
        float _1225 = fma(_1221, _1223, _1009);
        float _1227 = fma(_1193, _1223, _1053);
        float _1229 = fma(_1203, _1223, _937);
        _1173 = _1227;
        _1175 = _1225;
        _1177 = _1229;
        _1109 = _1207;
    }
    float _1231 = _1173;
    float _1233 = _1175;
    float _1235 = _1177;
    float _1237 = _1109;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1241 = _1231 + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1245 = _1233 + _1243;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1249 = _1235 + _1247;
    float _1251 = _1241 * _1241;
    float _1253 = fma(_1245, _1245, _1251);
    float _1255 = fma(_1249, _1249, _1253);
    float _1257 = rsqrt(_1255);
    float _1259 = sqrt(_1255);
    float _1261 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1263 = _1245 * _1261;
    float _1265 = _1249 * _1261;
    float _1267 = _1263 * _1263;
    float _1269 = _1265 * _1265;
    float _1271 = _1267 + _1269;
    float _1273 = sqrt(_1271);
    bool _1275 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = _1273 + _1277;
    float _1281 = _1253;
    float _1283 = _1271;
    float _1285 = _1279;
    float _1287 = _1241;
    float _1289 = _1263;
    float _1291 = _1265;
    float _1293 = _1269;
    if (_1275)
    {
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1281 = _1295;
    }
    float _1297 = _1281;
    if (_1275)
    {
        float _1299 = rsqrt(_1271);
        _1283 = _1299;
    }
    float _1301 = _1283;
    if (_1275)
    {
        float _1303 = _1279 * _1297;
        _1285 = _1303;
    }
    float _1305 = _1285;
    if (_1275)
    {
        float _1307 = _1305 * 0.15915493667125701904296875;
        _1111 = _1307;
    }
    float _1309 = _1111;
    float _1311 = _1237;
    if (_1275)
    {
        float _1313 = _1309 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        _1311 = _1315;
    }
    float _1317 = _1311;
    float _1319 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1321 = precise::max(0.0, _1319);
    float _1323 = _1297;
    float _1325 = _1321;
    if (_1275)
    {
        float _1327 = _1309 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        _1323 = _1329;
    }
    float _1331 = _1323;
    float _1333 = -_1261;
    float _1335 = -_1321;
    float _1337 = fma(_1241, _1333, _1335);
    if (_1275)
    {
        float _1339 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1287 = _1339;
    }
    float _1341 = _1287;
    float _1343 = _1317;
    float _1345 = _1341;
    if (_1275)
    {
        float _1347 = fma(_1317, _1341, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = _1349;
    if (!_1275)
    {
        _1345 = _1337;
    }
    float _1353 = _1345;
    float _1355 = _1353;
    if (_1275)
    {
        float _1357 = _1331 + (-1.0);
        _1325 = _1357;
    }
    float _1359 = _1325;
    float _1361 = _1359;
    if (_1275)
    {
        float _1363 = _1301 * _1349;
        _1179 = _1363;
    }
    float _1365 = _1179;
    if (_1275)
    {
        float _1367 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1367;
    }
    float _1369 = _1351;
    if (_1275)
    {
        float _1371 = _1263 * _1365;
        _1289 = _1371;
    }
    float _1373 = _1289;
    if (!_1275)
    {
        _1361 = _1267;
    }
    float _1375 = _1361;
    float _1377 = _1375;
    if (_1275)
    {
        float _1379 = _1265 * _1365;
        _1291 = _1379;
    }
    float _1381 = _1291;
    if (_1275)
    {
        float _1383 = fma(_1337, _1331, _1369);
        _1355 = _1383;
    }
    float _1385 = _1355;
    if (_1275)
    {
        float _1387 = _1373 * _1373;
        _1377 = _1387;
    }
    float _1389 = _1377;
    float _1391 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1275)
    {
        float _1393 = _1381 * _1381;
        _1293 = _1393;
    }
    float _1395 = _1293;
    float _1397 = fma(_1385, _1385, _1389);
    float _1399 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    float _1401 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1403 = _1397 + _1395;
    float _1405 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1407 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1399);
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1411 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1409);
    float _1413 = precise::clamp(_1411, 0.0, 1.0);
    float _1415 = rsqrt(_1403);
    float _1417 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1419 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1405);
    float _1421 = -_1413;
    float _1423 = _1421 + 1.0;
    float _1425 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1427 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1417);
    float _1429 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1431 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1433 = abs(_1423);
    float _1435 = log2(_1433);
    float _1437 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1427);
    float _1439 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1441 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1443 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1431);
    float _1445 = _1437 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1449 = -_1441;
    float _1451 = fma(_1449, _1401, 1.0);
    float _1453 = _1415 * _1373;
    float _1455 = _1415 * _1385;
    float _1457 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1447);
    float _1459 = _1415 * _1381;
    float _1461 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1463 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1443);
    float _1465 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1457);
    float _1467 = log2(_1451);
    float _1469 = -_1461;
    float _1471 = fma(_1455, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1469);
    float _1473 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1475 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1477 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1479 = -_1459;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1471);
    float _1483 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1485 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1465);
    float _1487 = exp2(_1473);
    float _1489 = fma(_1481, -0.5, 0.5);
    float _1491 = fma(_1481, 0.5, 0.5);
    float _1493 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1483);
    float _1495 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1477);
    float _1497 = _1455 + 1.0;
    float _1499 = fma(_1491, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1501 = 1.0 / _1485;
    float _1503 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1493);
    float _1505 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1495);
    float _1507 = fma(_1491, _1499, -0.212114393711090087890625);
    float _1509 = _1467 * 0.693147182464599609375;
    float _1511 = fma(_1491, _1507, 1.570728778839111328125);
    float _1513 = sqrt(_1489);
    float _1515 = -_1455;
    float _1517 = fma(_1487, _1497, _1515);
    float _1519 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1503);
    float _1521 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1505);
    float _1523 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1525 = fma(_1517, 0.5, 0.5);
    float _1527 = _1519 * _1501;
    float _1529 = _1521 * _1501;
    float _1531 = fma(_1527, 0.5, 0.5);
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = _1513 * 0.636619746685028076171875;
    float _1537 = -_1511;
    float _1539 = fma(_1535, _1537, 1.0);
    float3 _5479 = float3(_1531, _1533, _1523);
    float _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5479, float3(0.0), isnan(_5479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5479, float3(0.0), isnan(_5479)), level(0.0)).x;
    float3 _5490 = float3(_1531, _1533, _1523);
    float4 _1544 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5490, float3(0.0), isnan(_5490)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5490, float3(0.0), isnan(_5490)), level(0.0)).xyzw;
    float _1546 = _1544.x;
    float _1548 = _1544.y;
    float _1550 = _1544.z;
    float _1552 = _1544.w;
    float2 _5507 = float2(_1539, _1525);
    float3 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5507, float2(0.0), isnan(_5507)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5507, float2(0.0), isnan(_5507)), level(0.0)).xyz;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1566 = int(_1564);
    float _1568 = _493 * _495;
    int _1570 = abs(_1087);
    out.m_45.x = 1.0;
    int _1572 = abs(_601);
    float _1574 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1576 = abs(_607);
    out.m_66.x = _1233;
    out.m_66.y = _1231;
    out.m_66.z = _1235;
    float _1578 = trunc(_765);
    int _1580 = int(_1578);
    float _1582 = -_689;
    float _1584 = _1582 + 1.0;
    float _1586 = -_775;
    float _1588 = _1586 + 1.0;
    float _1590 = -_551;
    float _1592 = _1590 + 1.0;
    float _1594 = float(uint(_1566));
    float _1596 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].x);
    int _1598 = int(_1596);
    bool _1600 = _1566 == 0;
    float _1602 = float(uint(_1580));
    float _1604 = 1.0 / _1594;
    int _1606 = ~_1566;
    int _1608 = _1606 + 1;
    float _1610 = float(uint(_1598));
    float _1612 = trunc(_771);
    int _1614 = int(_1612);
    int _1616 = ~_1598;
    int _1618 = _1616 + 1;
    int _1620 = as_type<int>(_1604) + (-2);
    float _1622 = 1.0 / _1610;
    int _1624 = ~_1566;
    int _1626 = _1624 + 1;
    float _1628 = as_type<float>(_1620) * _1602;
    float _1630 = trunc(_1628);
    float _1632 = precise::max(_1630, 0.0);
    uint _1635 = uint(_1632);
    float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1639 = float(_1580);
    int _1641 = _1608 * int(_1635);
    int _1643 = _1641 + _1580;
    float _1645 = exp2(_1574);
    float _1647 = float(uint(_1643));
    int _1649 = as_type<int>(_1622) + (-2);
    float _1651 = float(_1566);
    float _1653 = as_type<float>(_1620) * _1647;
    float _1655 = _497 * _499;
    float _1657 = float(uint(_1614));
    bool _1659 = _1639 >= _1651;
    bool _1661 = isnan(_1639);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(_1651);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    float _1671 = floor(_1655);
    float _1673 = as_type<float>(_1649) * _1657;
    float _1675 = -_1645;
    float _1677 = _1675 + 1.0;
    float _1679 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1681 = trunc(_1653);
    float _1683 = precise::max(_1681, 0.0);
    uint _1685 = uint(_1683);
    float _1687 = trunc(_1673);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = -_1671;
    float _1695 = _1655 + _1693;
    float _1697 = _1695 * _1651;
    int _1699 = int(_1635) + int(_1685);
    float _1701 = trunc(_1669);
    int _1703 = int(_1701);
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1707 = _1705 != 0;
    int _1709 = _1626 * _1699;
    int _1711 = _1709 + _1580;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1715 = _1713 != 0;
    int _1717 = _1618 * int(_1691);
    int _1719 = _1717 + _1614;
    float _1721 = floor(_1568);
    bool _1723 = uint(_1711) >= uint(_1566);
    float _1725 = float(uint(_1719));
    bool _1727 = !_1723;
    int _1729 = _1727 ? 0 : (-1);
    bool _1731 = !_1707;
    int _1733 = _1731 ? 0 : 1;
    float _1735 = trunc(_1697);
    int _1737 = int(_1735);
    float _1739 = as_type<float>(_1649) * _1725;
    int _1741 = ~_1699;
    int _1743 = _1741 + _1729;
    int _1745 = _1743 + 1;
    int _1747 = abs(_1733);
    int _1749 = ~_1703;
    int _1751 = _1749 + 1;
    int _1753 = _1751 + 1;
    int _1755 = _1566 * _1745;
    int _1757 = _1755 + _1580;
    float _1759 = trunc(_1739);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    float _1765 = -_1721;
    float _1767 = _1568 + _1765;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 65536;
    bool _1771 = _1769 != 0;
    bool _1773 = !_1600;
    int _1775 = _1773 ? _1757 : (-1);
    int _1777 = _1566 + (-1);
    int _1779 = _1737 * _1747;
    int _1781 = _1779 + _1580;
    float _1783 = _1651 * _657;
    int _1785 = _1775 * _1753;
    int _1787 = ~_1598;
    int _1789 = _1787 + 1;
    float _1791 = float(_1614);
    int _1793 = _1703 * _1777;
    int _1795 = _1793 + _1785;
    float _1797 = trunc(_1783);
    int _1799 = int(_1797);
    int _1801 = int(_1691) + int(_1763);
    float _1803 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1805 = abs(_1091);
    float _1807 = -_941;
    float _1809 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1803);
    int _1811 = _1789 * _1801;
    int _1813 = _1811 + _1614;
    float _1815 = float(_1598);
    int _1817 = abs(_1095);
    int _1819 = _1795 * _1570;
    bool _1821 = _1791 >= _1815;
    bool _1823 = isnan(_1791);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(_1815);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    bool _1833 = uint(_1813) >= uint(_1598);
    int _1835 = _1799 * _1805;
    int _1837 = _1835 + _1819;
    float _1839 = trunc(_1831);
    int _1841 = int(_1839);
    int _1843 = abs(_1099);
    float _1845 = _1767 * _1815;
    bool _1847 = !_1833;
    int _1849 = _1847 ? 0 : (-1);
    int _1851 = _1781 * _1817;
    int _1853 = _1851 + _1837;
    float _1855 = _1815 * _657;
    int _1857 = ~_1801;
    int _1859 = _1857 + _1849;
    int _1861 = _1859 + 1;
    float _1863 = trunc(_1845);
    int _1865 = int(_1863);
    bool _1867 = _1598 == 0;
    int _1869 = _1737 * _1843;
    int _1871 = _1869 + _1853;
    int _1873 = _1598 + (-1);
    int _1875 = _1598 * _1861;
    int _1877 = _1875 + _1614;
    bool _1879 = !_1771;
    int _1881 = _1879 ? 0 : 1;
    float _1883 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1885 = float(uint(_1871));
    float _1887 = trunc(_1855);
    int _1889 = int(_1887);
    int _1891 = ~_1841;
    int _1893 = _1891 + 1;
    int _1895 = _1893 + 1;
    float _1897 = -_941;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1883);
    bool _1901 = !_1867;
    int _1903 = _1901 ? _1877 : (-1);
    float _1905 = as_type<float>(_1620) * _1885;
    int _1907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8388608;
    bool _1909 = _1907 != 0;
    float _1911 = float(uint(_1781));
    int _1913 = _1903 * _1895;
    int _1915 = abs(_1881);
    float _1917 = trunc(_1905);
    float _1919 = precise::max(_1917, 0.0);
    uint _1921 = uint(_1919);
    int _1923 = _1841 * _1873;
    int _1925 = _1923 + _1913;
    bool _1927 = !_1909;
    int _1929 = _1927 ? 0 : 1;
    int _1931 = _1865 * _1915;
    int _1933 = _1931 + _1614;
    int _1935 = abs(_613);
    int _1937 = _1925 * _1572;
    int _1939 = ~_1566;
    int _1941 = _1939 + 1;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1943;
    int _1947 = ~_1598;
    int _1949 = _1947 + 1;
    int _1951 = _1889 * _1576;
    int _1953 = _1951 + _1937;
    int _1955 = abs(_1929);
    float _1957 = as_type<float>(_1620) * _1911;
    int _1959 = _1941 * int(_1921);
    int _1961 = _1959 + _1871;
    float _1963 = trunc(_1957);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    float _1969 = float(uint(_1961));
    int _1971 = _1933 * _1935;
    int _1973 = _1971 + _1953;
    int _1975 = ~_1598;
    int _1977 = _1975 + 1;
    float _1979 = as_type<float>(_1620) * _1969;
    int _1981 = _1865 * _1955;
    int _1983 = _1981 + _1973;
    int _1985 = ~_1566;
    int _1987 = _1985 + 1;
    float _1989 = trunc(_1979);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = float(uint(_1983));
    int _1997 = _1987 * int(_1967);
    int _1999 = _1997 + _1781;
    float _2001 = as_type<float>(_1649) * _1995;
    float _2003 = float(uint(_1999));
    int _2005 = ~_1566;
    int _2007 = _2005 + 1;
    float _2009 = trunc(_2001);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    float _2015 = as_type<float>(_1620) * _2003;
    int _2017 = ~_1598;
    int _2019 = _2017 + 1;
    int _2021 = int(_1921) + int(_1993);
    float _2023 = trunc(_2015);
    float _2025 = precise::max(_2023, 0.0);
    uint _2027 = uint(_2025);
    int _2029 = _2007 * _2021;
    int _2031 = _2029 + _1871;
    int _2033 = _1977 * int(_2013);
    int _2035 = _2033 + _1983;
    bool _2037 = uint(_2031) >= uint(_1566);
    bool _2039 = !_2037;
    int _2041 = _2039 ? 0 : (-1);
    float _2043 = float(uint(_2035));
    int _2045 = ~_2021;
    int _2047 = _2045 + _2041;
    int _2049 = _2047 + 1;
    int _2051 = int(_1967) + int(_2027);
    float _2053 = as_type<float>(_1967);
    float _2055 = as_type<float>(_1941);
    if (_1715)
    {
        float _2057 = _125 * 3.1415927410125732421875;
        _2053 = _2057;
    }
    float _2059 = _2053;
    int _2061 = _1566 * _2049;
    int _2063 = _2061 + _1871;
    float _2065 = as_type<float>(_1649) * _2043;
    if (_1715)
    {
        float _2067 = _2059 * 0.15915493667125701904296875;
        _2055 = _2067;
    }
    float _2069 = _2055;
    int _2071 = _1941 * _2051;
    int _2073 = _2071 + _1781;
    bool _2075 = !_1600;
    int _2077 = _2075 ? _2063 : (-1);
    float _2079 = trunc(_2065);
    float _2081 = precise::max(_2079, 0.0);
    uint _2083 = uint(_2081);
    int _2085 = _2077 & 3;
    bool _2087 = _2085 != 0;
    int _2089 = _2077 & 3;
    bool _2091 = _2089 != 0;
    bool _2093 = uint(_2073) >= uint(_1566);
    float _2095 = _2069;
    if (_1715)
    {
        float _2097 = _2069 * 6.283185482025146484375;
        float _2099 = sin(_2097);
        _2095 = _2099;
    }
    float _2101 = _2095;
    float _2103 = _2087 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2105 = _2089 != 3;
    bool _2107 = !_2093;
    int _2109 = _2107 ? 0 : (-1);
    bool _2111 = uint(_2089) > 1u;
    bool _2113 = uint(_2089) >= 2u;
    int _2115 = ~_2051;
    int _2117 = _2115 + _2109;
    int _2119 = _2117 + 1;
    float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _2121;
    int _2125 = _2113 ? 0 : 1;
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _2129 = _371 + _2127;
    int _2131 = int(_2013) + int(_2083);
    int _2133 = _1566 * _2119;
    int _2135 = _2133 + _1781;
    int _2137 = ~_2125;
    int _2139 = _2137 + 1;
    int _2141 = _2139 + 1;
    float _2143 = 1.0 / _2123;
    int _2145 = _2141;
    bool _2147 = _2113;
    float _2149 = _2103;
    if (_2105)
    {
        int _2151 = ~_2125;
        int _2153 = _2151 + 1;
        _2145 = _2153;
    }
    int _2155 = _2145;
    int _2157 = _2019 * _2131;
    int _2159 = _2157 + _1983;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2163 = _2161 != 0;
    float _2165 = _1679 * _1541;
    if (_1715)
    {
        bool _2167 = _2101 > 0.5;
        _2147 = _2167;
    }
    bool _2169 = _2147;
    float _2171 = -_1679;
    float _2173 = _2171 + 1.0;
    int _2175 = ~as_type<int>(_2103);
    int _2177 = _2175 + 1;
    int _2179 = _2177 + 1;
    int _2181 = _2179;
    if (!_2111)
    {
        int _2183 = ~as_type<int>(_2103);
        int _2185 = _2183 + 1;
        _2181 = _2185;
    }
    int _2187 = _2181;
    if (!_1715)
    {
        _2149 = _181;
    }
    float _2189 = _2149;
    float _2191 = float(uint(_1933));
    float _2193 = _2189;
    float _2195 = _2191;
    if (_1715)
    {
        float _2197 = -_181;
        float _2199 = _2169 ? _2197 : _181;
        _2193 = _2199;
    }
    float _2201 = _2193;
    if (_2163)
    {
        float _2203 = _125 * 3.1415927410125732421875;
        _143 = _2203;
    }
    float _2205 = _143;
    int _2207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2209 = _2207 != 0;
    float _2211 = as_type<float>(_1649) * _2191;
    bool _2213 = uint(_2159) >= uint(_1598);
    float _2215 = _2129 * _2143;
    bool _2217 = !_1600;
    int _2219 = _2217 ? _2135 : (-1);
    if (_2163)
    {
        float _2221 = _2205 * 0.15915493667125701904296875;
        _2195 = _2221;
    }
    float _2223 = _2195;
    bool _2225 = !_2213;
    int _2227 = _2225 ? 0 : (-1);
    float _2229 = trunc(_2211);
    float _2231 = precise::max(_2229, 0.0);
    uint _2233 = uint(_2231);
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2237 = _2235 != 0;
    int _2239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2241 = _2239 != 0;
    int _2243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 33554432;
    bool _2245 = _2243 != 0;
    float _2247 = _2205;
    bool _2249 = _2241;
    if (_2209)
    {
        float _2251 = in.m_49.x;
        _2247 = _2251;
    }
    float _2253 = _2247;
    bool _2255 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _2257 = isnan(_371);
    bool _2259 = _2255 || _2257;
    bool _2261 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _2263 = _2259 || _2261;
    float _2265 = float(_2263);
    float _2267 = _2223;
    if (_2163)
    {
        float _2269 = _2223 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        _2267 = _2271;
    }
    float _2273 = _2267;
    bool _2275 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _2277 = isnan(_371);
    bool _2279 = _2275 || _2277;
    bool _2281 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _2283 = _2279 || _2281;
    float _2285 = float(_2283);
    float _2287 = -_2285;
    float _2289 = _2287 + 1.0;
    int _2291 = ~_1598;
    int _2293 = _2291 + 1;
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _2295;
    int _2299 = ~_2131;
    int _2301 = _2299 + _2227;
    int _2303 = _2301 + 1;
    float _2305 = _2265 * _2289;
    float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _2307;
    float _2311 = fma(_2297, _2215, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    int _2313 = _2077 >> 31;
    int _2315 = _2293 * int(_2233);
    int _2317 = _2315 + _1933;
    float _2319 = fma(_2309, _2215, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _2321 = _1598 * _2303;
    int _2323 = _2321 + _1983;
    int _2325 = _2313 & 3;
    float _2327 = _2311 * _2305;
    float _2329 = _2319 * _2305;
    float _2331 = float(uint(_2317));
    float _2333 = fma(_1945, _2215, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    int _2335 = _2077 + _2325;
    float _2337 = -_2265;
    float _2339 = _2337 + 1.0;
    bool _2341 = !_1867;
    int _2343 = _2341 ? _2323 : (-1);
    float _2345 = as_type<float>(_1649) * _2331;
    bool _2347 = !_2241;
    int _2349 = _2347 ? 0 : 1;
    float _2351 = as_type<float>(_2077);
    float _2353 = _2327;
    float _2355 = _2345;
    if (_2237)
    {
        float _2357 = in.m_49.z;
        _2351 = _2357;
    }
    float _2359 = _2351;
    if (_2163)
    {
        bool _2361 = _2273 > 0.5;
        _2249 = _2361;
    }
    bool _2363 = _2249;
    float _2365 = _2253;
    if (_2209)
    {
        float _2367 = _2253 * 3.1415927410125732421875;
        _2365 = _2367;
    }
    float _2369 = _2365;
    bool _2371 = !_2245;
    int _2373 = _2371 ? 0 : 1;
    float _2375 = trunc(_2345);
    float _2377 = precise::max(_2375, 0.0);
    uint _2379 = uint(_2377);
    int _2381 = _2343 & 3;
    bool _2383 = _2381 != 0;
    float _2385 = fma(_2339, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2327);
    bool _2387 = !_2091;
    int _2389 = _2387 ? 0 : 1;
    float _2391 = _2333 * _2305;
    bool _2393 = uint(_2381) > 1u;
    if (_2209)
    {
        float _2395 = _2369 * 0.15915493667125701904296875;
        _2353 = _2395;
    }
    float _2397 = _2353;
    bool _2399 = !_2383;
    int _2401 = _2399 ? 0 : 1;
    float _2403 = fma(_2339, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2329);
    int _2405 = _2343 & 3;
    bool _2407 = _2405 != 0;
    float _2409 = fma(_2339, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2391);
    int _2411 = _2335 >> 2;
    float _2413 = _2397;
    if (_2209)
    {
        float _2415 = _2397 * 6.283185482025146484375;
        float _2417 = sin(_2415);
        _2413 = _2417;
    }
    float _2419 = _2413;
    int _2421 = _2407 ? 0 : 1;
    float _2423 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[108].z, _2409);
    bool _2425 = _2089 != 3;
    float _2427 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[108].y, _2403);
    int _2429 = ~_2421;
    int _2431 = _2429 + 1;
    int _2433 = _2431 + 1;
    float _2435 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[108].x, _2385);
    int _2437 = _2433;
    if (!_2393)
    {
        int _2439 = ~_2421;
        int _2441 = _2439 + 1;
        _2437 = _2441;
    }
    int _2443 = _2437;
    float _2445 = _2359;
    if (_2237)
    {
        float _2447 = _2359 * 3.1415927410125732421875;
        _2445 = _2447;
    }
    float _2449 = _2445;
    bool _2451 = uint(_2381) >= 2u;
    float _2453 = _2427 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2455 = _2411 << 4;
    int _2457 = _2455 + 800;
    if (_2237)
    {
        float _2459 = _2449 * 0.15915493667125701904296875;
        _2355 = _2459;
    }
    float _2461 = _2355;
    int _2463 = int(_2233) + int(_2379);
    float _2465 = _2435 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2467 = !_2425;
    int _2469 = _2467 ? 0 : (-1);
    uint _2471 = uint(int(uint(_2457) >> uint(2)));
    uint _2473 = uint(int(uint(int(_2471)) >> uint(2)));
    int _2475 = int(_2471) & 3;
    float _2477 = (*spvDescriptorSet0.vp_c9)._m0[int(_2473)][_2475];
    int _2479 = int(_2471) + 1;
    uint _2481 = uint(int(uint(_2479) >> uint(2)));
    int _2483 = _2479 & 3;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[int(_2481)][_2483];
    int _2487 = _2343 >> 31;
    float _2489 = _2461;
    if (_2237)
    {
        float _2491 = _2461 * 6.283185482025146484375;
        float _2493 = sin(_2491);
        _2489 = _2493;
    }
    float _2495 = _2489;
    bool _2497 = _2381 != 3;
    int _2499 = _1949 * _2463;
    int _2501 = _2499 + _1933;
    int _2503 = _2451 ? 0 : 1;
    float _2505 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2507 = _2381 != 3;
    float _2509 = _2453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2511 = _2487 & 3;
    bool _2513 = !_2507;
    int _2515 = _2513 ? 0 : (-1);
    bool _2517 = _2507;
    if (_2209)
    {
        bool _2519 = _2419 > 0.5;
        _2517 = _2519;
    }
    bool _2521 = _2517;
    int _2523 = _2343 + _2511;
    int _2525 = _2457 + 8;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    uint _2529 = uint(int(uint(int(_2527)) >> uint(2)));
    int _2531 = int(_2527) & 3;
    float _2533 = (*spvDescriptorSet0.vp_c9)._m0[int(_2529)][_2531];
    int _2535 = int(_2527) + 1;
    uint _2537 = uint(int(uint(_2535) >> uint(2)));
    int _2539 = _2535 & 3;
    float _2541 = (*spvDescriptorSet0.vp_c9)._m0[int(_2537)][_2539];
    int _2543 = ~_2503;
    int _2545 = _2543 + 1;
    int _2547 = _2545 + 1;
    int _2549 = _2523 >> 2;
    int _2551 = _2547;
    if (_2497)
    {
        int _2553 = ~_2503;
        int _2555 = _2553 + 1;
        _2551 = _2555;
    }
    int _2557 = _2551;
    float _2559 = _2423 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2561 = _2549 << 4;
    int _2563 = _2561 + 944;
    bool _2565 = uint(_2501) >= uint(_1598);
    float _2567 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _2569 = uint(int(uint(_2563) >> uint(2)));
    uint _2571 = uint(int(uint(int(_2569)) >> uint(2)));
    int _2573 = int(_2569) & 3;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[int(_2571)][_2573];
    int _2577 = int(_2569) + 1;
    uint _2579 = uint(int(uint(_2577) >> uint(2)));
    int _2581 = _2577 & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    int _2585 = abs(_2187);
    bool _2587 = !_2565;
    int _2589 = _2587 ? 0 : (-1);
    out.m_68.x = _2505;
    out.m_68.y = _2509;
    out.m_68.z = _2567;
    bool _2591 = _2565;
    if (_2237)
    {
        bool _2593 = _2495 > 0.5;
        _2591 = _2593;
    }
    bool _2595 = _2591;
    float _2597 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2599 = ~_2585;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    int _2605 = abs(_2155);
    float _2607 = -_941;
    float _2609 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2597);
    float _2611 = _963 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2613 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _2615 = int(_2613);
    int _2617 = ~_2605;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    int _2623 = abs(_2469);
    int _2625 = _2563 + 8;
    uint _2627 = uint(int(uint(_2625) >> uint(2)));
    uint _2629 = uint(int(uint(int(_2627)) >> uint(2)));
    int _2631 = int(_2627) & 3;
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[int(_2629)][_2631];
    int _2635 = int(_2627) + 1;
    uint _2637 = uint(int(uint(_2635) >> uint(2)));
    int _2639 = _2635 & 3;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[int(_2637)][_2639];
    int _2643 = abs(_2389);
    float _2645 = _963 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2647 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2611);
    int _2649 = _2603 * as_type<int>(_2485);
    int _2651 = ~_2643;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    float _2657 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2645);
    int _2659 = abs(_2443);
    float _2661 = _963 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2663 = abs(_2401);
    int _2665 = _2655 * as_type<int>(_2477);
    int _2667 = _2665 + _2649;
    int _2669 = ~_2659;
    int _2671 = _2669 + 1;
    int _2673 = _2671 + 1;
    float _2675 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2661);
    int _2677 = ~_2463;
    int _2679 = _2677 + _2589;
    int _2681 = _2679 + 1;
    float _2683 = trunc((*spvDescriptorSet0.vp_c9)._m0[100].z);
    int _2685 = int(_2683);
    int _2687 = ~_2663;
    int _2689 = _2687 + 1;
    int _2691 = _2689 + 1;
    float _2693 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1809);
    int _2695 = abs(_2373);
    int _2697 = _1598 * _2681;
    int _2699 = _2697 + _1933;
    int _2701 = abs(_2557);
    float _2703 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2609);
    int _2705 = _2621 * as_type<int>(_2533);
    int _2707 = _2705 + _2667;
    int _2709 = abs(_2349);
    float _2711 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1899);
    float _2713 = float(uint(_2615));
    float _2715 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2717 = abs(_2515);
    float _2719 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2715);
    int _2721 = ~_2623;
    int _2723 = _2721 + 1;
    int _2725 = _2723 + 1;
    float _2727 = 1.0 / _2713;
    int _2729 = _2673 * as_type<int>(_2583);
    int _2731 = ~_2709;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    float _2737 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2719);
    int _2739 = _2725 * as_type<int>(_2541);
    int _2741 = _2739 + _2707;
    float _2743 = float(uint(_2685));
    int _2745 = _2691 * as_type<int>(_2575);
    int _2747 = _2745 + _2729;
    bool _2749 = !_1867;
    int _2751 = _2749 ? _2699 : (-1);
    int _2753 = _2741 * _2735;
    int _2755 = ~_2685;
    int _2757 = _2755 + 1;
    float _2759 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2737);
    float _2761 = 1.0 / _2743;
    int _2763 = _2219 * _2709;
    int _2765 = _2763 + _2753;
    int _2767 = ~_2701;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    float _2773 = _971 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.gl_Position.x = _1519;
    out.gl_Position.y = _1521;
    out.gl_Position.z = _2759;
    out.gl_Position.w = _1485;
    int _2775 = as_type<int>(_2727) + (-2);
    int _2777 = _2771 * as_type<int>(_2633);
    int _2779 = _2777 + _2747;
    float _2781 = float(uint(_2765));
    float _2783 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2773);
    int _2785 = ~_2717;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = as_type<float>(_2775) * _2781;
    int _2793 = abs(_2615);
    float _2795 = _971 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2797 = abs(_2685);
    int _2799 = _2789 * as_type<int>(_2641);
    int _2801 = _2799 + _2779;
    int _2803 = ~_2695;
    int _2805 = _2803 + 1;
    int _2807 = _2805 + 1;
    float _2809 = trunc(_2791);
    float _2811 = precise::max(_2809, 0.0);
    uint _2813 = uint(_2811);
    float _2815 = float(uint(_2793));
    float _2817 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2783);
    int _2819 = ~_2615;
    int _2821 = _2819 + 1;
    int _2823 = _2801 * _2807;
    float _2825 = _971 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2827 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2795);
    float _2829 = float(uint(_2797));
    float _2831 = 1.0 / _2815;
    float _2833 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2825);
    int _2835 = _2751 * _2695;
    int _2837 = _2835 + _2823;
    int _2839 = abs(_2765);
    float _2841 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2843 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2833);
    int _2845 = as_type<int>(_2761) + (-2);
    float _2847 = _2759 + _1485;
    int _2849 = _2821 * int(_2813);
    int _2851 = _2849 + _2765;
    float _2853 = float(uint(_2837));
    float _2855 = 1.0 / _2829;
    int _2857 = ~_2793;
    int _2859 = _2857 + 1;
    float _2861 = _1562 * _2165;
    float _2863 = float(uint(_2851));
    float _2865 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2827);
    float _2867 = as_type<float>(_2845) * _2853;
    int _2869 = as_type<int>(_2831) + (-2);
    float _2871 = as_type<float>(_2775) * _2863;
    float _2873 = float(uint(_2839));
    float _2875 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2657);
    int _2877 = abs(_2837);
    float _2879 = trunc(_2867);
    float _2881 = precise::max(_2879, 0.0);
    uint _2883 = uint(_2881);
    float _2885 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2647);
    float _2887 = as_type<float>(_2869) * _2873;
    float _2889 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2675);
    float _2891 = _2647;
    float _2893 = _2675;
    if (!_2209)
    {
        _1113 = _181;
    }
    float _2895 = _1113;
    float _2897 = _2847 * 0.5;
    float _2899 = _2895;
    if (_2209)
    {
        float _2901 = -_181;
        float _2903 = _2521 ? _2901 : _181;
        _2899 = _2903;
    }
    float _2905 = _2899;
    float _2907 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2909 = as_type<int>(_2855) + (-2);
    float _2911 = trunc(_2887);
    float _2913 = precise::max(_2911, 0.0);
    uint _2915 = uint(_2913);
    float _2917 = float(uint(_2877));
    float _2919 = fma(_2907, _2907, 1.0);
    if (!_2163)
    {
        _2891 = _177;
    }
    float _2921 = _2891;
    float _2923 = _2907 * _2703;
    float _2925 = _2921;
    if (!_2237)
    {
        _2893 = _177;
    }
    float _2927 = _2893;
    float _2929 = as_type<float>(_2909) * _2917;
    float _2931 = _2927;
    if (_2163)
    {
        float _2933 = -_177;
        float _2935 = _2363 ? _2933 : _177;
        _2925 = _2935;
    }
    float _2937 = _2925;
    float _2939 = rsqrt(_2919);
    if (_2237)
    {
        float _2941 = -_177;
        float _2943 = _2595 ? _2941 : _177;
        _2931 = _2943;
    }
    float _2945 = _2931;
    float _2947 = _2907 * _2693;
    int _2949 = _2757 * int(_2883);
    int _2951 = _2949 + _2837;
    int _2953 = ~_2797;
    int _2955 = _2953 + 1;
    float _2957 = _2907 * _2711;
    out.m_70.x = _2875;
    out.m_70.y = _2885;
    out.m_70.z = _2889;
    int _2959 = ~_2797;
    int _2961 = _2959 + 1;
    float _2963 = trunc(_2929);
    float _2965 = precise::max(_2963, 0.0);
    uint _2967 = uint(_2965);
    int _2969 = _2859 * int(_2915);
    int _2971 = _2969 + _2839;
    int _2973 = _2765 ^ _2615;
    out.m_72.z = _2897;
    out.m_72.w = _1485;
    bool _2975 = _2685 == 0;
    float _2977 = float(uint(_2971));
    float _2979 = trunc(_2871);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    float _2985 = fma(_2841, _2875, _2947);
    float _2987 = fma(_2841, _2885, _2923);
    float _2989 = float(uint(_2951));
    float _2991 = _2907 * _2939;
    float _2993 = as_type<float>(_2869) * _2977;
    float _2995 = fma(_2841, _2889, _2957);
    uint _2997 = uint(int(uint(_2973) >> uint(31)));
    float _2999 = as_type<float>(_2845) * _2989;
    int _3001 = _2955 * int(_2967);
    int _3003 = _3001 + _2877;
    float _3005 = -_2843;
    float _3007 = _2991 * _3005;
    float _3009 = -_2865;
    float _3011 = _2991 * _3009;
    float _3013 = -_2817;
    float _3015 = _2991 * _3013;
    float _3017 = trunc(_2993);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    float _3023 = float(uint(_3003));
    float _3025 = fma(_2939, _2693, _3007);
    float _3027 = fma(_2939, _2711, _3015);
    int _3029 = ~_2615;
    int _3031 = _3029 + 1;
    float _3033 = _2865 + _2987;
    float _3035 = as_type<float>(_2909) * _3023;
    int _3037 = int(_2813) + int(_2983);
    float _3039 = trunc(_2999);
    float _3041 = precise::max(_3039, 0.0);
    uint _3043 = uint(_3041);
    float _3045 = _2817 + _2995;
    int _3047 = ~_2793;
    int _3049 = _3047 + 1;
    float _3051 = fma(_2939, _2703, _3011);
    bool _3053 = _2685 == 0;
    int _3055 = _3031 * _3037;
    int _3057 = _3055 + _2765;
    float _3059 = trunc(_3035);
    float _3061 = precise::max(_3059, 0.0);
    uint _3063 = uint(_3061);
    int _3065 = int(_2915) + int(_3021);
    out.m_74.x = _3025;
    out.m_74.y = _3051;
    out.m_74.z = _3027;
    bool _3067 = uint(_3057) >= uint(_2615);
    float _3069 = _2843 + _2985;
    int _3071 = _3049 * _3065;
    int _3073 = _3071 + _2839;
    bool _3075 = !_3067;
    int _3077 = _3075 ? 0 : (-1);
    int _3079 = int(_2883) + int(_3043);
    out.m_76.x = _3069;
    out.m_76.y = _3033;
    out.m_76.z = _3045;
    int _3081 = ~_2685;
    int _3083 = _3081 + 1;
    int _3085 = ~_3037;
    int _3087 = _3085 + _3077;
    int _3089 = _3087 + 1;
    int _3091 = int(_2967) + int(_3063);
    int _3093 = _2615 * _3089;
    int _3095 = _3093 + _2765;
    bool _3097 = _2615 == 0;
    int _3099 = _3083 * _3079;
    int _3101 = _3099 + _2837;
    bool _3103 = uint(_3073) >= uint(_2793);
    int _3105 = _2961 * _3091;
    int _3107 = _3105 + _2877;
    bool _3109 = !_3097;
    int _3111 = _3109 ? _3095 : (-1);
    float _3113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _3115 = uint(_3101) >= uint(_2685);
    bool _3117 = uint(_3107) >= uint(_2797);
    bool _3119 = !_3115;
    int _3121 = _3119 ? 0 : (-1);
    int _3123 = _2837 ^ _2685;
    float _3125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3127 = ~_3079;
    int _3129 = _3127 + _3121;
    int _3131 = _3129 + 1;
    bool _3133 = !_3103;
    int _3135 = _3133 ? 0 : (-1);
    bool _3137 = !_3117;
    int _3139 = _3137 ? 0 : (-1);
    int _3141 = _2685 * _3131;
    int _3143 = _3141 + _2837;
    float _3145 = float(_3111);
    float _3147 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    uint _3149 = uint(int(uint(_3123) >> uint(31)));
    int _3151 = ~_3135;
    int _3153 = _3065 + _3151;
    int _3155 = _3153 + 1;
    float _3157 = fma(_3147, _3145, _747);
    int _3159 = ~_3139;
    int _3161 = _3091 + _3159;
    int _3163 = _3161 + 1;
    float _3165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _3167 = ~int(_2997);
    int _3169 = _3167 + 1;
    float _3171 = _3125 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    int _3173 = ~int(_3149);
    int _3175 = _3173 + 1;
    float _3177 = _1552 * _2173;
    bool _3179 = !_2975;
    int _3181 = _3179 ? _3143 : (-1);
    int _3183 = _3155 ^ _3169;
    int _3185 = _3163 ^ _3175;
    float _3187 = float(_3181);
    float _3189 = _2937 + 0.5;
    bool _3191 = _2615 == 0;
    int _3193 = ~_3169;
    int _3195 = _3193 + _3183;
    int _3197 = _3195 + 1;
    float _3199 = fma(_3147, _3189, _3157);
    int _3201 = ~_3175;
    int _3203 = _3201 + _3185;
    int _3205 = _3203 + 1;
    float _3207 = fma(_3171, _3187, _783);
    bool _3209 = !_3191;
    int _3211 = _3209 ? _3197 : (-1);
    float _3213 = _3165 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _3215 = !_3053;
    int _3217 = _3215 ? _3205 : (-1);
    float _3219 = _2945 + 0.5;
    float _3221 = float(_3211);
    float _3223 = _3113 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3225 = float(_3217);
    float _3227 = fma(_3171, _3219, _3207);
    float _3229 = -_1584;
    float _3231 = fma(_3229, _2937, _3199);
    float _3233 = -_565;
    float _3235 = fma(_3213, _3221, _3233);
    float _3237 = _2905 + (-0.5);
    float _3239 = -_785;
    float _3241 = fma(_3223, _3225, _3239);
    float _3243 = _2201 + (-0.5);
    float _3245 = -_1588;
    float _3247 = fma(_3245, _2945, _3227);
    float _3249 = -_3213;
    float _3251 = fma(_3249, _3237, _3235);
    float _3253 = -_779;
    float _3255 = _3253 + 1.0;
    float _3257 = -_3223;
    float _3259 = fma(_3257, _3243, _3241);
    float _3261 = _1552 * _2165;
    float _3263 = fma(_1592, _2905, _3251);
    float _3265 = fma(_1552, _2861, _1550);
    float _3267 = fma(_3255, _2201, _3259);
    float _3269 = fma(_1558, _3261, _1546);
    float _3271 = fma(_1560, _3261, _1548);
    out.m_78.x = _3231;
    out.m_78.y = _3263;
    float _3273 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_80.x = _3247;
    out.m_80.y = _3267;
    out.m_82.w = _3273;
    out.m_84.x = _3269;
    out.m_84.y = _3271;
    out.m_84.z = _3265;
    out.m_84.w = _3177;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

