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
    float4 m_64 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2650 = false;
    bool _301 = false;
    bool _205 = false;
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
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_107)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2954 = as_type<float>(_117);
        out.gl_Position.z = _2954;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_51.w;
    float _123 = float(_103);
    float _125 = -_121;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_121);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    bool _139 = _127 >= _123;
    bool _141 = !_137;
    bool _143 = _139 || _141;
    float _145 = _121;
    float _147 = _127;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3019 = as_type<float>(_153);
        out.gl_Position.z = _3019;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    float _161 = 1.0 / _123;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = _127 * _161;
    float _167 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _171 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _173 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    float _177 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _171);
    float _179 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _173);
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _175);
    float _183 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _177);
    bool _185 = !_163;
    float _203;
    if (!_185)
    {
        float _187 = in.m_55.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        _203 = _165;
    }
    _205 = false;
    float _207 = _203;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -_223;
    float _231 = _229 + 1.0;
    bool _233 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _235 = isnan(_207);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _227;
    float _253 = _243 * _231;
    float _255 = -_243;
    float _257 = _255 + 1.0;
    float _259 = _211 * _251;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = fma(_247, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = fma(_263, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _269 = _265 * _253;
    float _271 = _267 * _253;
    float _273 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_249;
    float _299;
    if (!_281)
    {
        float _283 = in.m_55.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        _299 = _165;
    }
    _301 = false;
    float _303 = _299;
    float _305 = in.m_55.x;
    float _307 = in.m_55.y;
    float _309 = in.m_55.z;
    float _311 = in.m_55.w;
    float _313 = as_type<float>(int(gl_VertexIndex));
    float _315 = in.m_46.x;
    float _317 = in.m_46.y;
    float _319 = in.m_46.z;
    float _321 = in.m_60.x;
    float _323 = in.m_60.y;
    float _325 = _309 * 2.0;
    float _327 = _305 * 2.0;
    int _329 = as_type<int>(_313) & 1;
    bool _331 = _329 != 0;
    int _333 = as_type<int>(_313) & 2;
    bool _335 = _333 != 0;
    float _337 = floor(_325);
    float _339 = _317 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _351 = _349 != 0;
    float _353 = _317 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _355 = _317 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _357 = _279 * _323;
    float _359 = floor(_327);
    float _361 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _363 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].x, _339);
    float _365 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].x, _353);
    float _367 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].x, _355);
    float _369 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _361);
    float _371 = _307 * 2.0;
    float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _375 = log2(_373);
    bool _377 = _337 >= 0.0;
    bool _379 = isnan(_337);
    bool _381 = _377 || _379;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    float _387 = _277 * _321;
    float _389 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    int _391 = _385 ? 0 : 1;
    float _393 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[5].z, _365);
    bool _395 = _337 > 0.0;
    float _397 = _307 + _309;
    bool _399 = _359 >= 0.0;
    bool _401 = isnan(_359);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = floor(_371);
    float _411 = _397 + (-1.0);
    int _413 = _407 ? 0 : 1;
    float _415 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _417 = _359 > 0.0;
    float _419 = _309 + _305;
    float _421 = _307 + _305;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _425 = _375 * _127;
    float _427 = _419 + (-1.0);
    float _429 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _415);
    float _431 = _421 + (-1.0);
    int _433 = ~_413;
    int _435 = _433 + 1;
    int _437 = _435 + 1;
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _441 = exp2(_425);
    int _443 = ~_391;
    int _445 = _443 + 1;
    int _447 = _445 + 1;
    float _449 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _369);
    int _451 = _437;
    int _453 = _447;
    if (!_417)
    {
        int _455 = ~_413;
        int _457 = _455 + 1;
        _451 = _457;
    }
    int _459 = _451;
    float _461 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _463 = in.m_62.x;
    float _465 = in.m_62.y;
    float _467 = in.m_62.z;
    float _469 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_395)
    {
        int _471 = ~_391;
        int _473 = _471 + 1;
        _453 = _473;
    }
    int _475 = _453;
    bool _477 = !_343;
    int _479 = _477 ? 0 : 1;
    float _481 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _429);
    bool _483 = _409 > 0.0;
    bool _485 = _409 >= 0.0;
    bool _487 = isnan(_409);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _497 = 1.0 + _495;
    int _499 = abs(_479);
    float _501 = -_441;
    float _503 = _501 + 1.0;
    bool _505 = !_347;
    int _507 = _505 ? 0 : 1;
    float _509 = 1.0 / _497;
    bool _511 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _513 = isnan(1.0);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _519 = _515 || _517;
    int _521 = abs(_507);
    float _523 = float(_499);
    float _525 = float(_475);
    float _527 = rsqrt(_481);
    bool _529 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _531 = isnan(0.0);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _537 = _533 || _535;
    float _539 = float(_521);
    float _541 = _523 * _525;
    float _543 = _537 ? _503 : 0.0;
    int _545 = _493 ? 0 : 1;
    float _547 = _541 * (-2.0);
    float _549 = float(_459);
    if (_519)
    {
        float _551 = _543 * _509;
        _147 = _551;
    }
    float _553 = _147;
    float _555 = _305 + (-0.5);
    float _557 = fma(_547, _463, _463);
    float _559 = fma(_461, _547, _461);
    bool _561 = !_351;
    int _563 = _561 ? 0 : 1;
    float _565 = _539 * _549;
    float _567 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[196].x, _557);
    float _569 = _527 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _571 = ~_545;
    int _573 = _571 + 1;
    int _575 = _573 + 1;
    float _577 = _527 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    int _579 = _575;
    if (!_483)
    {
        int _581 = ~_545;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    float _587 = _569 * _569;
    float _589 = fma(_559, _553, _567);
    int _591 = abs(_563);
    float _593 = fma(_577, _577, _587);
    float _595 = float(_585);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _597;
    float _601 = float(_591);
    float _603 = _565 * (-2.0);
    float _605 = _527 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _607 = 1.0 / _599;
    float _609 = _589 * 0.15915493667125701904296875;
    float _611 = _601 * _595;
    float _613 = fma(_603, _465, _465);
    float _615 = fma(_423, _603, _423);
    float _617 = fma(_605, _605, _593);
    float _619 = _609 * 6.283185482025146484375;
    float _621 = cos(_619);
    float _623 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[6].z, _367);
    float _625 = _307 + (-0.5);
    float _627 = _611 * (-2.0);
    float _629 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[196].y, _613);
    float _631 = _393 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _633 = fma(_439, _627, _439);
    float _635 = fma(_627, _467, _467);
    float _637 = fma(_615, _553, _629);
    float _639 = _357 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _641 = _389 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _643 = _631 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _645 = _309 + (-0.5);
    float _647 = _637 * 0.15915493667125701904296875;
    float _649 = _623 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[0].x, _643);
    float _653 = rsqrt(_617);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[196].z, _635);
    float _657 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[0].z, _651);
    float _659 = _449 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _661 = fma(_633, _553, _655);
    float _663 = -_631;
    float _665 = _663 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _667 = _657 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _669 = -_641;
    float _671 = _669 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _673 = !_335;
    float _675 = _673 ? (-0.5) : 0.5;
    float _677 = _661 * 0.15915493667125701904296875;
    float _679 = -_667;
    float _681 = _659 + _679;
    float _683 = _647 * 6.283185482025146484375;
    float _685 = sin(_683);
    float _687 = _665 * _665;
    float _689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _675);
    float _691 = abs(_681);
    float _693 = precise::max(_691, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _695 = fma(_671, _671, _687);
    float _697 = _639 * _689;
    float _699 = -_649;
    float _701 = _699 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _647 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = precise::min(_693, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _709 = fma(_701, _701, _695);
    float _711 = _569 * _653;
    float _713 = _609 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = _621 * _685;
    float _719 = _677 * 6.283185482025146484375;
    float _721 = cos(_719);
    bool _723 = !_331;
    float _725 = _723 ? (-0.5) : 0.5;
    bool _727 = _667 >= _659;
    bool _729 = isnan(_667);
    bool _731 = _727 || _729;
    bool _733 = isnan(_659);
    bool _735 = _731 || _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _739 = _707 + _737;
    float _741 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _725);
    float _743 = _677 * 6.283185482025146484375;
    float _745 = sin(_743);
    float _747 = _739 * _607;
    float _749 = _469 * _741;
    float _751 = _605 * _653;
    float _753 = _621 * _705;
    float _755 = _715 * _685;
    float _757 = _715 * _705;
    float _759 = _577 * _653;
    float _761 = _621 * _721;
    float _763 = _715 * _721;
    float _765 = _685 * _721;
    float _767 = _705 * _721;
    float _769 = _761 * _697;
    float _771 = _763 * _697;
    bool _773 = !_735;
    float _775 = _773 ? 1.0 : (-1.0);
    float _777 = sqrt(_709);
    float _779 = fma(_745, _753, _755);
    float _781 = fma(_745, _755, _753);
    float _783 = -_717;
    float _785 = fma(_745, _757, _783);
    float _787 = -_757;
    float _789 = fma(_745, _717, _787);
    float _791 = -_697;
    float _793 = _745 * _791;
    float _795 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _797 = fma(_779, _749, _769);
    float _799 = _775 * _747;
    float _801 = fma(_767, _749, _793);
    float _803 = fma(_785, _749, _771);
    float _805 = fma(_789, _795, _797);
    float _807 = _751 * _751;
    float _809 = fma(_765, _795, _801);
    float _811 = fma(_781, _795, _803);
    float _813 = _805 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _815 = _165 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _817 = _805 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = _805 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].x, _813);
    float _823 = _815 * _799;
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _827 = _631 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].z, _821);
    float _831 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _833 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].z, _825);
    float _835 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[2].x, _827);
    float _837 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _839 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].z, _831);
    float _841 = _833 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _843 = _823 * 0.15915493667125701904296875;
    float _845 = _631 + _837;
    float _847 = abs(_777);
    float _849 = precise::max(0.0, _847);
    float _851 = _641 + _841;
    float _853 = _839 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _855 = _845 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _857 = _845 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _845 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _861 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[2].z, _835);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _855);
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _857);
    float _867 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _859);
    float _869 = _649 + _853;
    float _871 = precise::min(_849, 40.0);
    float _873 = _843 * 6.283185482025146484375;
    float _875 = cos(_873);
    float _877 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _867);
    float _879 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _865);
    float _881 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _863);
    float _883 = _861 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _887 = _879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _889 = _843 * 6.283185482025146484375;
    float _891 = sin(_889);
    float _893 = fma(_871, -0.02500000037252902984619140625, 1.0);
    float _895 = _881 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _897 = -_885;
    float _899 = _897 + _883;
    float _901 = _887 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _903 = _887 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _905 = fma(_893, _899, _885);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[13].x, _901);
    float _909 = _887 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[12].x, _903);
    float _913 = -_875;
    float _915 = _913 + 1.0;
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[13].z, _907);
    float _919 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[14].x, _909);
    float _921 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[12].z, _911);
    float _923 = _711 * _915;
    float _925 = _759 * _891;
    float _927 = _917 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _929 = _711 * _891;
    float _931 = _759 * _915;
    float _933 = fma(_751, _923, _925);
    float _935 = _921 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _937 = -_631;
    float _939 = _937 + _927;
    float _941 = -_929;
    float _943 = fma(_751, _931, _941);
    float _945 = _751 * _891;
    float _947 = -_641;
    float _949 = _947 + _935;
    float _951 = _933 * _939;
    float _953 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[14].z, _919);
    float _955 = fma(_915, _807, _875);
    float _957 = fma(_943, _949, _951);
    float _959 = -_945;
    float _961 = fma(_711, _931, _959);
    float _963 = _953 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _965 = fma(_759, _931, _875);
    float _967 = fma(_751, _931, _929);
    float _969 = _961 * _939;
    float _971 = -_649;
    float _973 = _971 + _963;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _979 = fma(_711, _923, _875);
    float _981 = fma(_965, _949, _969);
    float _983 = fma(_955, _973, _957);
    float _985 = fma(_165, _977, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _987 = fma(_711, _931, _945);
    float _989 = fma(_967, _973, _981);
    float _991 = _979 * _939;
    float _993 = fma(_983, _985, _649);
    float _995 = -_925;
    float _997 = fma(_751, _923, _995);
    float _999 = fma(_989, _985, _641);
    float _1001 = fma(_987, _949, _991);
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _993 + _1003;
    float _1007 = _631 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1011 = _999 + _1009;
    float _1013 = fma(_997, _973, _1001);
    float _1015 = _1005 * _1005;
    float _1017 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1007);
    float _1019 = _631 + _1013;
    float _1021 = fma(_1011, _1011, _1015);
    float _1023 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1017);
    float _1025 = sqrt(_1021);
    bool _1027 = _1025 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _997;
    float _1031 = _1017;
    float _1033 = _1015;
    float _1035 = _631;
    if (!_1027)
    {
        _1029 = _999;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_1027)
    {
        _1031 = _993;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (!_1027)
    {
        _1033 = _1019;
    }
    float _1045 = _1033;
    bool _1047 = !_1027;
    float _1049 = _1045;
    if (!_1047)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1055 = _1025 + _1053;
        float _1057 = _1019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = rsqrt(_1021);
        float _1061 = _1055 * _1051;
        float _1063 = _1061 * 0.15915493667125701904296875;
        float _1065 = _1063 * 6.283185482025146484375;
        float _1067 = cos(_1065);
        float _1069 = _1063 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = _1067 + (-1.0);
        float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = fma(_1071, _1057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1079 = fma(_1019, _1067, _1075);
        float _1081 = _1059 * _1077;
        float _1083 = fma(_1011, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1085 = fma(_1005, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1049 = _1079;
        _1039 = _1083;
        _1043 = _1085;
    }
    float _1087 = _1049;
    float _1089 = _1039;
    float _1091 = _1043;
    float _1093 = -_631;
    float _1095 = _1093 + _1087;
    float _1097 = -_641;
    float _1099 = _1097 + _1089;
    float _1101 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1103 = _631 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1105 = _1095 * _1095;
    float _1107 = -_649;
    float _1109 = _1107 + _1091;
    float _1111 = 1.0 / _1101;
    float _1113 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    float _1115 = fma(_1099, _1099, _1105);
    float _1117 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    float _1119 = fma(_1109, _1109, _1115);
    float _1121 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1123 = sqrt(_1119);
    float _1125 = _1121 + _1101;
    float _1127 = _1125 * _1111;
    float _1129 = _1127 * 0.5;
    bool _1131 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan(0.5);
    bool _1139 = _1135 || _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1141);
    float _1145 = 1.0 / _1143;
    bool _1147 = _1123 > 0.0;
    bool _1149 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.5);
    bool _1157 = _1153 || _1155;
    bool _1159 = !_1147;
    float _1161 = _1089;
    float _1163 = _1087;
    float _1165 = _1091;
    float _1167 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1169 = _1111;
    float _1171 = _1143;
    float _1173 = _1099;
    float _1175 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1177 = _1095;
    if (!_1159)
    {
        float _1179 = _181 * _181;
        float _1181 = rsqrt(_1119);
        float _1183 = fma(_179, _179, _1179);
        float _1185 = fma(_183, _183, _1183);
        float _1187 = sqrt(_1185);
        float _1189 = _1099 * _1181;
        float _1191 = _1095 * _1181;
        float _1193 = _1109 * _1181;
        bool _1195 = _1187 > 0.0;
        bool _1197 = !_1195;
        _1167 = _1181;
        _1171 = _1185;
        _1173 = _1191;
        _1175 = _1187;
        if (!_1197)
        {
            float _1199 = rsqrt(_1185);
            float _1201 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1203 = _181 * _1199;
            float _1205 = _179 * _1199;
            float _1207 = _1191 * _1203;
            float _1209 = _183 * _1199;
            float _1211 = fma(_1189, _1205, _1207);
            float _1213 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1215 = fma(_1193, _1209, _1211);
            float _1217 = _1215 * _1213;
            float _1219 = fma(_179, _1217, _1089);
            float _1221 = fma(_181, _1217, _1087);
            float _1223 = fma(_183, _1217, _1091);
            _1161 = _1219;
            _1163 = _1221;
            _1165 = _1223;
            _1167 = _1205;
            _1169 = _1201;
            _1171 = _1199;
            _1173 = _1211;
            _1175 = _1217;
            _1177 = _1213;
        }
    }
    float _1225 = _1161;
    float _1227 = _1163;
    float _1229 = _1165;
    float _1231 = _1167;
    float _1233 = _1169;
    float _1235 = _1171;
    float _1237 = _1173;
    float _1239 = _1175;
    float _1241 = _1177;
    float _1243 = _1239;
    float _1245 = _1235;
    float _1247 = _1233;
    float _1249 = _1237;
    float _1251 = _1227;
    float _1253 = _1231;
    float _1255 = _1241;
    if (_1139)
    {
        _1243 = 1.0;
    }
    float _1257 = _1243;
    float _1259 = _1257;
    if (_1157)
    {
        _1245 = _1225;
    }
    float _1261 = _1245;
    float _1263 = _1261;
    if (_1157)
    {
        _1247 = _1227;
    }
    float _1265 = _1247;
    float _1267 = _1265;
    if (_1157)
    {
        _1249 = _1229;
    }
    float _1269 = _1249;
    float _1271 = _1269;
    if (!_1157)
    {
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1275 = _631 + _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1279 = _641 + _1277;
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1283 = -_631;
        float _1285 = _1283 + _1227;
        float _1287 = _1275 * _1275;
        float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1291 = _649 + _1289;
        float _1293 = -_641;
        float _1295 = _1293 + _1225;
        float _1297 = -_649;
        float _1299 = _1297 + _1229;
        float _1301 = fma(_1279, _1279, _1287);
        float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1305 = fma(_1291, _1291, _1301);
        float _1307 = sqrt(_1305);
        float _1309 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1311 = precise::min(_1307, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1313 = _1311 * _1303;
        float _1315 = _1309 * _1313;
        float _1317 = fma(_1285, _1315, _631);
        float _1319 = fma(_1295, _1315, _641);
        float _1321 = fma(_1299, _1315, _649);
        _1267 = _1317;
        _1263 = _1319;
        _1271 = _1321;
        _1251 = _1285;
        _1253 = _1281;
    }
    float _1323 = _1267;
    float _1325 = _1263;
    float _1327 = _1271;
    float _1329 = _1251;
    float _1331 = _1253;
    float _1333 = _1329;
    float _1335 = _1331;
    if (_1139)
    {
        _1255 = 1.0;
    }
    float _1337 = _1255;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1341 = _1145 * _1339;
    float _1343 = _1337;
    if (!_1139)
    {
        float _1345 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1347 = _1345 * 0.15915493667125701904296875;
        float _1349 = _1347 * 6.283185482025146484375;
        float _1351 = cos(_1349);
        float _1353 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1355 = _1353 * 0.15915493667125701904296875;
        float _1357 = _1347 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = 1.0 / _1351;
        float _1363 = _1355 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        float _1367 = _1359 * _1361;
        float _1369 = _1355 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = 1.0 / _1373;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1377;
        float _1381 = 1.0 / _1379;
        float _1383 = _1371 * _1375;
        float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1387 = fma(_1341, _1383, _1385);
        float _1389 = _1387 * _1381;
        float _1391 = precise::clamp(_1389, 0.0, 1.0);
        _1035 = _1381;
        _1333 = _1355;
        _1259 = _1391;
    }
    float _1393 = _1035;
    float _1395 = _1333;
    float _1397 = _1259;
    float _1399 = _1393;
    float _1401 = _1395;
    if (!_1139)
    {
        float _1403 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1405 = _1403 * 0.15915493667125701904296875;
        float _1407 = _1405 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        float _1411 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1405 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = 1.0 / _1409;
        float _1421 = _1413 * 6.283185482025146484375;
        float _1423 = cos(_1421);
        float _1425 = _1417 * _1419;
        float _1427 = _1413 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1423 * _1425;
        float _1433 = 1.0 / _1431;
        float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1435;
        float _1439 = 1.0 / _1437;
        float _1441 = _1429 * _1433;
        float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1445 = fma(_1341, _1441, _1443);
        float _1447 = _1445 * _1439;
        float _1449 = precise::clamp(_1447, 0.0, 1.0);
        float _1451 = -_1449;
        float _1453 = _1451 + 1.0;
        _1399 = _1419;
        _1401 = _1431;
        _1343 = _1453;
    }
    float _1455 = _1399;
    float _1457 = _1401;
    float _1459 = _1343;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1463 = _1323 + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1467 = _1325 + _1465;
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1471 = _1327 + _1469;
    float _1473 = _1463 * _1463;
    float _1475 = fma(_1467, _1467, _1473);
    float _1477 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1479 = fma(_1471, _1471, _1475);
    float _1481 = rsqrt(_1479);
    float _1483 = sqrt(_1479);
    float _1485 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1487 = _1467 * _1485;
    float _1489 = _1471 * _1485;
    float _1491 = _1487 * _1487;
    float _1493 = _1489 * _1489;
    float _1495 = _1491 + _1493;
    float _1497 = sqrt(_1495);
    bool _1499 = _1497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1503 = _1497 + _1501;
    float _1505 = _1455;
    float _1507 = _1495;
    float _1509 = _1503;
    float _1511 = _1457;
    float _1513 = _1463;
    if (_1499)
    {
        float _1515 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1505 = _1515;
    }
    float _1517 = _1505;
    if (_1499)
    {
        float _1519 = rsqrt(_1495);
        _1507 = _1519;
    }
    float _1521 = _1507;
    float _1523 = _1521;
    if (_1499)
    {
        float _1525 = _1503 * _1517;
        _1509 = _1525;
    }
    float _1527 = _1509;
    if (_1499)
    {
        float _1529 = _1527 * 0.15915493667125701904296875;
        _1511 = _1529;
    }
    float _1531 = _1511;
    float _1533 = _1471;
    float _1535 = _1531;
    if (_1499)
    {
        float _1537 = _1531 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        _1533 = _1539;
    }
    float _1541 = _1533;
    float _1543 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1545 = precise::max(0.0, _1543);
    float _1547 = _1517;
    float _1549 = _1545;
    if (_1499)
    {
        float _1551 = _1531 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        _1547 = _1553;
    }
    float _1555 = _1547;
    float _1557 = -_1485;
    float _1559 = -_1545;
    float _1561 = fma(_1463, _1557, _1559);
    if (_1499)
    {
        float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1513 = _1563;
    }
    float _1565 = _1513;
    float _1567 = _1565;
    if (!_1499)
    {
        _1535 = _1487;
    }
    float _1569 = _1535;
    float _1571 = _1541;
    float _1573 = _1569;
    if (_1499)
    {
        float _1575 = fma(_1541, _1565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1571 = _1575;
    }
    float _1577 = _1571;
    float _1579 = _1577;
    float _1581 = _1555;
    if (_1499)
    {
        float _1583 = _1555 + (-1.0);
        _1549 = _1583;
    }
    float _1585 = _1549;
    float _1587 = _1585;
    if (_1499)
    {
        float _1589 = _1521 * _1577;
        _1567 = _1589;
    }
    float _1591 = _1567;
    if (!_1499)
    {
        _1579 = _1561;
    }
    float _1593 = _1579;
    float _1595 = _1593;
    if (_1499)
    {
        float _1597 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1597;
    }
    float _1599 = _1335;
    if (_1499)
    {
        float _1601 = _1487 * _1591;
        _1573 = _1601;
    }
    float _1603 = _1573;
    if (!_1499)
    {
        _1587 = _1489;
    }
    float _1605 = _1587;
    float _1607 = _1605;
    if (_1499)
    {
        float _1609 = _1489 * _1591;
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (!_1499)
    {
        _1523 = _1491;
    }
    float _1613 = _1523;
    float _1615 = _1613;
    if (_1499)
    {
        float _1617 = fma(_1561, _1555, _1599);
        _1595 = _1617;
    }
    float _1619 = _1595;
    if (_1499)
    {
        float _1621 = _1603 * _1603;
        _1615 = _1621;
    }
    float _1623 = _1615;
    if (!_1499)
    {
        _1581 = _1493;
    }
    float _1625 = _1581;
    float _1627 = _1625;
    if (_1499)
    {
        float _1629 = _1611 * _1611;
        _1627 = _1629;
    }
    float _1631 = _1627;
    float _1633 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1635 = fma(_1619, _1619, _1623);
    float _1637 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1639 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1633);
    float _1641 = _1635 + _1631;
    float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1645 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1643);
    float _1647 = precise::clamp(_1645, 0.0, 1.0);
    float _1649 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1639);
    float _1651 = rsqrt(_1641);
    float _1653 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1637);
    float _1655 = -_1647;
    float _1657 = _1655 + 1.0;
    float _1659 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1661 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1663 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1665 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1667 = fma(_649, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1669 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1671 = abs(_1657);
    float _1673 = log2(_1671);
    float _1675 = -_1665;
    float _1677 = fma(_1675, _1661, 1.0);
    float _1679 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1681 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1669);
    float _1683 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1685 = _1651 * _1603;
    float _1687 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1679);
    float _1689 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1681);
    float _1691 = _1651 * _1619;
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1695 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1687);
    float _1697 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1699 = _1651 * _1611;
    float _1701 = floor(_1477);
    float _1703 = -_1693;
    float _1705 = fma(_1691, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1703);
    float _1707 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1709 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1711 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1713 = -_1699;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1705);
    float _1717 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1709);
    float _1719 = floor(_1667);
    float _1721 = fma(_1715, -0.5, 0.5);
    float _1723 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1717);
    float _1725 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1723);
    float _1727 = exp2(_1711);
    float _1729 = -_1701;
    float _1731 = _1477 + _1729;
    float _1733 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1735 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1737 = log2(_1677);
    float _1739 = -_1719;
    float _1741 = _1667 + _1739;
    float _1743 = 1.0 / _1725;
    float _1745 = fma(_1715, 0.5, 0.5);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1733);
    float _1749 = fma(_1745, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1751 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1753 = sqrt(_1721);
    float _1755 = fma(_1745, _1749, -0.212114393711090087890625);
    float _1757 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1751);
    float _1759 = _1737 * 0.693147182464599609375;
    float2 _5526 = float2(_1731, _1741);
    float _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5526, float2(0.0), isnan(_5526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5526, float2(0.0), isnan(_5526)), level(0.0)).x;
    float _1763 = fma(_1745, _1755, 1.570728778839111328125);
    float _1765 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1767 = _1757 * _1743;
    float _1769 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1735);
    float _1771 = _1691 + 1.0;
    float _1773 = fma(_1767, 0.5, 0.5);
    float _1775 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1769);
    float _1777 = -_1691;
    float _1779 = fma(_1727, _1771, _1777);
    float _1781 = _1753 * 0.636619746685028076171875;
    float _1783 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1775);
    float _1785 = -_1763;
    float _1787 = fma(_1781, _1785, 1.0);
    float _1789 = _1783 * _1743;
    float _1791 = fma(_1779, 0.5, 0.5);
    float _1793 = fma(_1789, -0.5, 0.5);
    float3 _5588 = float3(_1773, _1793, _1765);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5588, float3(0.0), isnan(_5588)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5588, float3(0.0), isnan(_5588)), level(0.0)).x;
    float3 _5599 = float3(_1773, _1793, _1765);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5599, float3(0.0), isnan(_5599)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5599, float3(0.0), isnan(_5599)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _5615 = float2(_1787, _1791);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5615, float2(0.0), isnan(_5615)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float _1818 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1822 = _1820 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1826 = _1824 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1828 = _305 > 0.5;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1832 = _1830 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1834 = 1.0 / _1822;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1838 = _1836 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1846 = _1844 != 0;
    float _1848 = 1.0 / _1826;
    int _1850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1852 = _1850 != 0;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1860 = _1858 != 0;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1868 = _1866 != 0;
    bool _1870 = _311 > 0.5;
    float _1872 = 1.0 / _1832;
    float _1874 = -_725;
    int _1876 = _1828 ? as_type<int>(_1874) : as_type<int>(_725);
    bool _1878 = _309 > 0.5;
    float _1880 = 1.0 / _1838;
    bool _1882 = _307 > 0.5;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1888;
    float _1892 = 1.0 / _1842;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1894;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1902 = _1890 * _1834;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1908 = _1896 * _1848;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1914 = 1.0 / _1856;
    float _1916 = _1900 * _1872;
    float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1918;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1926 = _1920 * _1880;
    bool _1928 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1930 = isnan(_165);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = 1.0 / _1864;
    float _1942 = _1924 * _1892;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1950 = _1948 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1952;
    bool _1956 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1958 = isnan(_303);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = 1.0 / _1886;
    float _1970 = _1946 * _1914;
    bool _1972 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1974 = isnan(_165);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1980 = _1976 || _1978;
    float _1982 = float(_1980);
    bool _1984 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1986 = isnan(_165);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    bool _1996 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1998 = isnan(_303);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = -_1982;
    float _2010 = _2008 + 1.0;
    float _2012 = 1.0 / _1906;
    float _2014 = _1950 * _1940;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _2020 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2022 = isnan(_165);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2028 = _2024 || _2026;
    float _2030 = float(_2028);
    float _2032 = -_1994;
    float _2034 = _2032 + 1.0;
    float _2036 = -_2006;
    float _2038 = _2036 + 1.0;
    bool _2040 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2042 = isnan(_303);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2048 = _2044 || _2046;
    float _2050 = float(_2048);
    float _2052 = 1.0 / _1912;
    float _2054 = _2018 * _1968;
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2058 = _303 + _2056;
    float _2060 = -_2030;
    float _2062 = _2060 + 1.0;
    float _2064 = _2050 * _2038;
    float _2066 = -_2050;
    float _2068 = _2066 + 1.0;
    float _2070 = fma(_1902, _2058, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2072 = !_1846;
    float _2074 = _2072 ? _725 : as_type<float>(_1876);
    float _2076 = _1954 * _2012;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2078;
    bool _2082 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2084 = isnan(_165);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    float _2094 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2096 = _165 + _2094;
    float _2098 = _2070 * _2064;
    float _2100 = _2074 + 0.5;
    float _2102 = exp2(_1818);
    float _2104 = _2092 * _2062;
    float _2106 = _2080 * _2052;
    bool _2108 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2110 = isnan(_165);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    float _2120 = -_2092;
    float _2122 = _2120 + 1.0;
    float _2124 = fma(_1926, _2096, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _2126 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2128 = isnan(_165);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2134 = _2130 || _2132;
    float _2136 = float(_2134);
    float _2138 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2098);
    float _2140 = _2118 * _2122;
    float _2142 = -_2118;
    float _2144 = _2142 + 1.0;
    bool _2146 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2148 = isnan(_303);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = -_2136;
    float _2160 = _2158 + 1.0;
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2164 = _165 + _2162;
    float _2166 = _1938 * _2144;
    float _2168 = -_1938;
    float _2170 = _2168 + 1.0;
    float _2172 = -_2156;
    float _2174 = _2172 + 1.0;
    float _2176 = fma(_2076, _2164, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2178 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2180 = _2136 * _2170;
    float _2182 = _1966 * _2174;
    float _2184 = -_1966;
    float _2186 = _2184 + 1.0;
    float _2188 = _1982 * _2160;
    bool _2190 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2192 = isnan(_165);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2198 = _2194 || _2196;
    float _2200 = float(_2198);
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2204 = _303 + _2202;
    float _2206 = _2006 * _2186;
    float _2208 = _1994 * _2010;
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2212 = _303 + _2210;
    float _2214 = _2200 * _2034;
    float _2216 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2218 = _165 + _2216;
    float _2220 = -_2200;
    float _2222 = _2220 + 1.0;
    float _2224 = fma(_1916, _2212, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2226 = _2124 * _2214;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2230 = _165 + _2228;
    float _2232 = fma(_1942, _2218, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2234 = fma(_1908, _2204, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2236 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2226);
    float _2238 = fma(_1970, _2230, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2242 = _165 + _2240;
    float _2244 = fma(_2224, _2206, _2138);
    float _2246 = fma(_2232, _2208, _2236);
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2250 = _165 + _2248;
    float _2252 = fma(_2014, _2242, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2254 = fma(_2234, _2182, _2244);
    float _2256 = fma(_2238, _2188, _2246);
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2260 = _165 + _2258;
    float _2262 = fma(_2054, _2250, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2266 = fma(_2252, _2180, _2256);
    float _2268 = fma(_2106, _2260, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2270 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2254);
    float _2272 = -_725;
    int _2274 = _1878 ? as_type<int>(_2272) : as_type<int>(_725);
    float _2276 = fma(_2176, _2166, _2266);
    float _2278 = -_675;
    int _2280 = _1882 ? as_type<int>(_2278) : as_type<int>(_675);
    float _2282 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2286 = fma(_2262, _2140, _2276);
    bool _2288 = !_1852;
    float _2290 = _2288 ? _675 : as_type<float>(_2280);
    float _2292 = _761 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2294 = !_1860;
    float _2296 = _2294 ? _725 : as_type<float>(_2274);
    float _2298 = fma(_2268, _2104, _2286);
    float _2300 = -_675;
    int _2302 = _1870 ? as_type<int>(_2300) : as_type<int>(_675);
    float _2304 = -_2290;
    float _2306 = _2304 + 0.5;
    float _2308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2310 = _2296 + 0.5;
    bool _2312 = !_1868;
    float _2314 = _2312 ? _675 : as_type<float>(_2302);
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2318 = _2178 * _2264;
    float _2320 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2322 = -_2314;
    float _2324 = _2322 + 0.5;
    float _2326 = abs(_1341);
    float _2328 = log2(_2326);
    float _2330 = _2316 * _2284;
    float _2332 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2336 = _761 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2342 = _2320 * _2308;
    float _2344 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2346 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2348 = _761 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2350 = -_745;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2356 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2358 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2298);
    float _2360 = -_745;
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2348);
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2366 = -_745;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    float _2370 = _675 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2372 = exp2(_2356);
    float _2374 = _779 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2376 = _2332 * _2340;
    out.m_64.x = _2364;
    out.m_64.y = _2344;
    out.m_64.z = _2346;
    out.m_64.w = _2282;
    bool _2378 = _1341 <= 8000.0;
    bool _2380 = isnan(_1341);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan(8000.0);
    bool _2386 = _2382 || _2384;
    float _2388 = float(_2386);
    float _2390 = _725 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2392 = -_2102;
    float _2394 = _2392 + 1.0;
    out.m_66.x = _2318;
    out.m_66.y = _2330;
    out.m_66.z = _2342;
    out.m_66.w = _2376;
    float _2396 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2358;
    bool _2398 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2400 = isnan(_1483);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2406 = _2402 || _2404;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2410 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = _789 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2416 = _789 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2418 = _789 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2420 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    float _2422 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2352);
    float _2424 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2374);
    float _2426 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2414);
    float _2428 = _2370 * _2422;
    float _2430 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2432 = fma(_2412, -2.0, 3.0);
    float _2434 = _2412 * _2412;
    float _2436 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2416);
    float _2438 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2430);
    float _2440 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2418);
    float _2442 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2424);
    float _2444 = _779 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2446 = _2434 * _2432;
    float _2448 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2426);
    float _2450 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2438);
    float _2452 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2440);
    float _2454 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2444);
    float _2456 = -_2446;
    float _2458 = _2456 + 1.0;
    float _2460 = in.m_70.x;
    float _2462 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2450);
    float _2464 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2454);
    float _2466 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2446);
    float _2468 = _2370 * _2420;
    float _2470 = _2462 + _1725;
    float _2472 = _779 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2474 = _2388 * _2466;
    float _2476 = fma(_2390, _2442, _2428);
    float _2478 = _2470 * 0.5;
    float _2480 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2436);
    float _2482 = fma(_2390, _2464, _2468);
    float _2484 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2472);
    float _2486 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2488 = _2448 + _2476;
    float _2490 = _2480 + _2482;
    float _2492 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2368);
    float _2494 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2484);
    out.m_72.w = _2408;
    float _2496 = _2370 * _2492;
    out.m_74.z = _2478;
    out.m_74.w = _1725;
    float _2498 = fma(_2390, _2494, _2496);
    out.gl_Position.x = _1757;
    out.gl_Position.y = _1783;
    out.gl_Position.z = _2462;
    out.gl_Position.w = _1725;
    float _2500 = _2452 + _2498;
    out.m_76.x = _2488;
    out.m_76.y = _2490;
    out.m_76.z = _2500;
    float _2502 = _1397 * _1459;
    float _2504 = -_1761;
    float _2506 = _2504 + 1.0;
    float _2508 = _1725;
    float _2510 = _2462;
    float _2512 = _1783;
    float _2514 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2516 = _2502;
    if (!_2406)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2518 = _2508;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2406)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2524 = _2510;
    float _2526 = _2506 * _2486;
    float _2528 = precise::clamp(_2526, 0.0, 1.0);
    float _2530 = _2524;
    float _2532 = _2524;
    if (!_2406)
    {
        _2512 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2534 = _2512;
    float _2536 = -_2528;
    float _2538 = fma(_2536, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2540 = _2534;
    float _2542 = _2534;
    if (!_2406)
    {
        _2514 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2544 = _2514;
    float _2546 = _2538 * _2460;
    float _2548 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2550 = _2546;
    float _2552 = _2544;
    float _2554 = _2544;
    if (!_2406)
    {
        _2516 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2556 = _2516;
    float _2558 = _2546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2560 = _2556;
    float _2562 = _2556;
    if (!_2406)
    {
        _2550 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2564 = _2550;
    out.m_78.x = _2558;
    float _2566 = _2396 * _1795;
    float _2568 = -_2396;
    float _2570 = _2568 + 1.0;
    float _2572 = _1806 * _2566;
    float _2574 = _1816 * _2566;
    float _2576 = _1806 * _2570;
    float _2578 = fma(_1812, _2572, _1800);
    float _2580 = fma(_1814, _2572, _1802);
    float _2582 = fma(_1806, _2574, _1804);
    out.m_80.x = _2578;
    out.m_80.y = _2580;
    out.m_80.z = _2582;
    out.m_80.w = _2576;
    bool _2584 = !_2406;
    float _2586 = _2564;
    float _2588 = _2564;
    if (!_2584)
    {
        bool _2590 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2592 = isnan(_1483);
        bool _2594 = _2590 || _2592;
        bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2598 = _2594 || _2596;
        if (!_2598)
        {
            float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2602 = _1483 + _2600;
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2606 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2604;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2612 = 1.0 / _2606;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2630 = _2602 * _2612;
            float _2632 = precise::clamp(_2630, 0.0, 1.0);
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2638 = fma(_2632, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2640 = fma(_2632, _2636, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2642 = fma(_2632, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2644 = fma(_2632, _2620, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2646 = fma(_2632, _2624, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2648 = fma(_2632, _2628, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2588 = _2642;
            _2542 = _2646;
            _2554 = _2638;
            _2532 = _2644;
            _2522 = _2640;
            _2562 = _2648;
            _2650 = true;
        }
        else
        {
            bool _2652 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2654 = isnan(_1483);
            bool _2656 = _2652 || _2654;
            bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2660 = _2656 || _2658;
            if (!_2660)
            {
                _2552 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2662 = _2552;
            _2554 = _2662;
            if (!_2660)
            {
                _2586 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2664 = _2586;
            _2588 = _2664;
            if (!_2660)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2666 = _2520;
            _2522 = _2666;
            if (!_2660)
            {
                _2530 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2668 = _2530;
            _2532 = _2668;
            if (!_2660)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2670 = _2540;
            _2542 = _2670;
            if (!_2660)
            {
                _2560 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2672 = _2560;
            bool _2674 = !_2660;
            _2562 = _2672;
            if (!_2674)
            {
                bool _2676 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2678 = isnan(_1483);
                bool _2680 = _2676 || _2678;
                bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2684 = _2680 || _2682;
                if (!_2684)
                {
                    float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2688 = _1483 + _2686;
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2692 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2690;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2698 = 1.0 / _2692;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2716 = _2688 * _2698;
                    float _2718 = precise::clamp(_2716, 0.0, 1.0);
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2724 = fma(_2718, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2726 = fma(_2718, _2722, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2728 = fma(_2718, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2730 = fma(_2718, _2706, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2732 = fma(_2718, _2710, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2734 = fma(_2718, _2714, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2588 = _2728;
                    _2542 = _2732;
                    _2554 = _2724;
                    _2532 = _2730;
                    _2522 = _2726;
                    _2562 = _2734;
                    _2650 = true;
                }
                else
                {
                    _2588 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2554 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2532 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2562 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2650 = false;
    float _2736 = _2588;
    float _2738 = _2542;
    float _2740 = _2554;
    float _2742 = _2532;
    float _2744 = _2522;
    float _2746 = _2562;
    float _2748 = _2548 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2750 = fma(_2490, -0.5, 0.5);
    float _2752 = precise::clamp(_2750, 0.0, 1.0);
    float _2754 = -_2736;
    float _2756 = _2754 + _2738;
    float _2758 = -_2740;
    float _2760 = _2758 + _2742;
    out.m_49.x = _2748;
    float _2762 = fma(_2752, _2756, _2736);
    float _2764 = -_2744;
    float _2766 = _2764 + _2746;
    float _2768 = fma(_2752, _2760, _2740);
    float _2770 = _2762 * 0.586610972881317138671875;
    bool _2772 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2774 = fma(_2752, _2766, _2744);
    out.m_82.x = 0.0;
    float _2776 = fma(_2768, 0.298911988735198974609375, _2770);
    bool _2778 = _1397 > 0.0;
    bool _2780 = isnan(_1397);
    bool _2782 = _2778 || _2780;
    bool _2784 = isnan(0.0);
    bool _2786 = _2782 || _2784;
    float _2788 = fma(_2774, 0.114477999508380889892578125, _2776);
    bool _2790 = _1459 <= 0.0;
    bool _2792 = !_2786;
    bool _2794 = _2790 || _2792;
    float _2796 = -_2788;
    float _2798 = _2768 + _2796;
    float _2800 = -_2788;
    float _2802 = _2762 + _2800;
    float _2804 = -_2788;
    float _2806 = _2774 + _2804;
    float _2808 = fma(_2798, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2810 = fma(_2802, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2812 = fma(_2806, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    bool _2814 = !_2772;
    if (!_2814)
    {
        float _2816 = -_1323;
        float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2820 = -_1325;
        float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2824 = -_1327;
        float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2828 = _2818 * _2818;
        float _2830 = fma(_2822, _2822, _2828);
        float _2832 = fma(_2826, _2826, _2830);
        float _2834 = sqrt(_2832);
        float _2836 = rsqrt(_2832);
        float _2838 = -_2834;
        float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2844 = precise::clamp(_2842, 0.0, 1.0);
        float _2846 = _2822 * _2836;
        float _2848 = _2818 * _2836;
        float _2850 = abs(_2844);
        float _2852 = log2(_2850);
        float _2854 = _2826 * _2836;
        float _2856 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2858 = _2490 * _2848;
        float _2860 = -_2848;
        float _2862 = -_2856;
        float _2864 = fma(_2860, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2862);
        float _2866 = fma(_2488, _2846, _2858);
        float _2868 = -_2854;
        float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2864);
        float _2872 = fma(_2500, _2854, _2866);
        float _2874 = precise::clamp(_2872, 0.0, 1.0);
        float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2878 = _2870 + _2876;
        float _2880 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2884 = precise::clamp(_2882, 0.0, 1.0);
        float _2886 = exp2(_2880);
        float _2888 = _2886 * _2884;
        float _2890 = _2874 * _2888;
        float _2892 = _2890 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2894 = _2890 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2896 = _2890 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2892;
        out.m_82.y = _2894;
        out.m_82.z = _2896;
    }
    out.m_84.x = _2808;
    out.m_84.y = _2810;
    out.m_84.z = _2812;
    if (!_2794)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2898 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2898;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2650 = false;
    bool _301 = false;
    bool _205 = false;
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
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_107)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2954 = as_type<float>(_117);
        out.gl_Position.z = _2954;
    }
    if (!_107)
    {
        return out;
    }
    float _121 = in.m_51.w;
    float _123 = float(_103);
    float _125 = -_121;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_121);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    bool _139 = _127 >= _123;
    bool _141 = !_137;
    bool _143 = _139 || _141;
    float _145 = _121;
    float _147 = _127;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3019 = as_type<float>(_153);
        out.gl_Position.z = _3019;
    }
    if (_143)
    {
        return out;
    }
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    float _161 = 1.0 / _123;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = _127 * _161;
    float _167 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _171 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _173 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    float _177 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _171);
    float _179 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _173);
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _175);
    float _183 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _177);
    bool _185 = !_163;
    float _203;
    if (!_185)
    {
        float _187 = in.m_55.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        _203 = _165;
    }
    _205 = false;
    float _207 = _203;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -_223;
    float _231 = _229 + 1.0;
    bool _233 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _235 = isnan(_207);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _227;
    float _253 = _243 * _231;
    float _255 = -_243;
    float _257 = _255 + 1.0;
    float _259 = _211 * _251;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = fma(_247, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = fma(_263, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _269 = _265 * _253;
    float _271 = _267 * _253;
    float _273 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_249;
    float _299;
    if (!_281)
    {
        float _283 = in.m_55.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        _299 = _165;
    }
    _301 = false;
    float _303 = _299;
    float _305 = in.m_55.x;
    float _307 = in.m_55.y;
    float _309 = in.m_55.z;
    float _311 = in.m_55.w;
    float _313 = as_type<float>(int(gl_VertexIndex));
    float _315 = in.m_46.x;
    float _317 = in.m_46.y;
    float _319 = in.m_46.z;
    float _321 = in.m_60.x;
    float _323 = in.m_60.y;
    float _325 = _309 * 2.0;
    float _327 = _305 * 2.0;
    int _329 = as_type<int>(_313) & 1;
    bool _331 = _329 != 0;
    int _333 = as_type<int>(_313) & 2;
    bool _335 = _333 != 0;
    float _337 = floor(_325);
    float _339 = _317 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _351 = _349 != 0;
    float _353 = _317 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _355 = _317 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _357 = _279 * _323;
    float _359 = floor(_327);
    float _361 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _363 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].x, _339);
    float _365 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].x, _353);
    float _367 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].x, _355);
    float _369 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _361);
    float _371 = _307 * 2.0;
    float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _375 = log2(_373);
    bool _377 = _337 >= 0.0;
    bool _379 = isnan(_337);
    bool _381 = _377 || _379;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    float _387 = _277 * _321;
    float _389 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    int _391 = _385 ? 0 : 1;
    float _393 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[5].z, _365);
    bool _395 = _337 > 0.0;
    float _397 = _307 + _309;
    bool _399 = _359 >= 0.0;
    bool _401 = isnan(_359);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = floor(_371);
    float _411 = _397 + (-1.0);
    int _413 = _407 ? 0 : 1;
    float _415 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _417 = _359 > 0.0;
    float _419 = _309 + _305;
    float _421 = _307 + _305;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _425 = _375 * _127;
    float _427 = _419 + (-1.0);
    float _429 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _415);
    float _431 = _421 + (-1.0);
    int _433 = ~_413;
    int _435 = _433 + 1;
    int _437 = _435 + 1;
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _441 = exp2(_425);
    int _443 = ~_391;
    int _445 = _443 + 1;
    int _447 = _445 + 1;
    float _449 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _369);
    int _451 = _437;
    int _453 = _447;
    if (!_417)
    {
        int _455 = ~_413;
        int _457 = _455 + 1;
        _451 = _457;
    }
    int _459 = _451;
    float _461 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _463 = in.m_62.x;
    float _465 = in.m_62.y;
    float _467 = in.m_62.z;
    float _469 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_395)
    {
        int _471 = ~_391;
        int _473 = _471 + 1;
        _453 = _473;
    }
    int _475 = _453;
    bool _477 = !_343;
    int _479 = _477 ? 0 : 1;
    float _481 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _429);
    bool _483 = _409 > 0.0;
    bool _485 = _409 >= 0.0;
    bool _487 = isnan(_409);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _497 = 1.0 + _495;
    int _499 = abs(_479);
    float _501 = -_441;
    float _503 = _501 + 1.0;
    bool _505 = !_347;
    int _507 = _505 ? 0 : 1;
    float _509 = 1.0 / _497;
    bool _511 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _513 = isnan(1.0);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _519 = _515 || _517;
    int _521 = abs(_507);
    float _523 = float(_499);
    float _525 = float(_475);
    float _527 = rsqrt(_481);
    bool _529 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _531 = isnan(0.0);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _537 = _533 || _535;
    float _539 = float(_521);
    float _541 = _523 * _525;
    float _543 = _537 ? _503 : 0.0;
    int _545 = _493 ? 0 : 1;
    float _547 = _541 * (-2.0);
    float _549 = float(_459);
    if (_519)
    {
        float _551 = _543 * _509;
        _147 = _551;
    }
    float _553 = _147;
    float _555 = _305 + (-0.5);
    float _557 = fma(_547, _463, _463);
    float _559 = fma(_461, _547, _461);
    bool _561 = !_351;
    int _563 = _561 ? 0 : 1;
    float _565 = _539 * _549;
    float _567 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[196].x, _557);
    float _569 = _527 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _571 = ~_545;
    int _573 = _571 + 1;
    int _575 = _573 + 1;
    float _577 = _527 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    int _579 = _575;
    if (!_483)
    {
        int _581 = ~_545;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    float _587 = _569 * _569;
    float _589 = fma(_559, _553, _567);
    int _591 = abs(_563);
    float _593 = fma(_577, _577, _587);
    float _595 = float(_585);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _597;
    float _601 = float(_591);
    float _603 = _565 * (-2.0);
    float _605 = _527 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _607 = 1.0 / _599;
    float _609 = _589 * 0.15915493667125701904296875;
    float _611 = _601 * _595;
    float _613 = fma(_603, _465, _465);
    float _615 = fma(_423, _603, _423);
    float _617 = fma(_605, _605, _593);
    float _619 = _609 * 6.283185482025146484375;
    float _621 = cos(_619);
    float _623 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[6].z, _367);
    float _625 = _307 + (-0.5);
    float _627 = _611 * (-2.0);
    float _629 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[196].y, _613);
    float _631 = _393 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _633 = fma(_439, _627, _439);
    float _635 = fma(_627, _467, _467);
    float _637 = fma(_615, _553, _629);
    float _639 = _357 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _641 = _389 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _643 = _631 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _645 = _309 + (-0.5);
    float _647 = _637 * 0.15915493667125701904296875;
    float _649 = _623 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[0].x, _643);
    float _653 = rsqrt(_617);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[196].z, _635);
    float _657 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[0].z, _651);
    float _659 = _449 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _661 = fma(_633, _553, _655);
    float _663 = -_631;
    float _665 = _663 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _667 = _657 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _669 = -_641;
    float _671 = _669 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _673 = !_335;
    float _675 = _673 ? (-0.5) : 0.5;
    float _677 = _661 * 0.15915493667125701904296875;
    float _679 = -_667;
    float _681 = _659 + _679;
    float _683 = _647 * 6.283185482025146484375;
    float _685 = sin(_683);
    float _687 = _665 * _665;
    float _689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _675);
    float _691 = abs(_681);
    float _693 = precise::max(_691, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _695 = fma(_671, _671, _687);
    float _697 = _639 * _689;
    float _699 = -_649;
    float _701 = _699 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _647 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = precise::min(_693, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _709 = fma(_701, _701, _695);
    float _711 = _569 * _653;
    float _713 = _609 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = _621 * _685;
    float _719 = _677 * 6.283185482025146484375;
    float _721 = cos(_719);
    bool _723 = !_331;
    float _725 = _723 ? (-0.5) : 0.5;
    bool _727 = _667 >= _659;
    bool _729 = isnan(_667);
    bool _731 = _727 || _729;
    bool _733 = isnan(_659);
    bool _735 = _731 || _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _739 = _707 + _737;
    float _741 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _725);
    float _743 = _677 * 6.283185482025146484375;
    float _745 = sin(_743);
    float _747 = _739 * _607;
    float _749 = _469 * _741;
    float _751 = _605 * _653;
    float _753 = _621 * _705;
    float _755 = _715 * _685;
    float _757 = _715 * _705;
    float _759 = _577 * _653;
    float _761 = _621 * _721;
    float _763 = _715 * _721;
    float _765 = _685 * _721;
    float _767 = _705 * _721;
    float _769 = _761 * _697;
    float _771 = _763 * _697;
    bool _773 = !_735;
    float _775 = _773 ? 1.0 : (-1.0);
    float _777 = sqrt(_709);
    float _779 = fma(_745, _753, _755);
    float _781 = fma(_745, _755, _753);
    float _783 = -_717;
    float _785 = fma(_745, _757, _783);
    float _787 = -_757;
    float _789 = fma(_745, _717, _787);
    float _791 = -_697;
    float _793 = _745 * _791;
    float _795 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _797 = fma(_779, _749, _769);
    float _799 = _775 * _747;
    float _801 = fma(_767, _749, _793);
    float _803 = fma(_785, _749, _771);
    float _805 = fma(_789, _795, _797);
    float _807 = _751 * _751;
    float _809 = fma(_765, _795, _801);
    float _811 = fma(_781, _795, _803);
    float _813 = _805 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _815 = _165 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _817 = _805 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = _805 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].x, _813);
    float _823 = _815 * _799;
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _827 = _631 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].z, _821);
    float _831 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _833 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].z, _825);
    float _835 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[2].x, _827);
    float _837 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _839 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].z, _831);
    float _841 = _833 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _843 = _823 * 0.15915493667125701904296875;
    float _845 = _631 + _837;
    float _847 = abs(_777);
    float _849 = precise::max(0.0, _847);
    float _851 = _641 + _841;
    float _853 = _839 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _855 = _845 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _857 = _845 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _845 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _861 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[2].z, _835);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _855);
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _857);
    float _867 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _859);
    float _869 = _649 + _853;
    float _871 = precise::min(_849, 40.0);
    float _873 = _843 * 6.283185482025146484375;
    float _875 = cos(_873);
    float _877 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _867);
    float _879 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _865);
    float _881 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _863);
    float _883 = _861 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _887 = _879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _889 = _843 * 6.283185482025146484375;
    float _891 = sin(_889);
    float _893 = fma(_871, -0.02500000037252902984619140625, 1.0);
    float _895 = _881 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _897 = -_885;
    float _899 = _897 + _883;
    float _901 = _887 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _903 = _887 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _905 = fma(_893, _899, _885);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[13].x, _901);
    float _909 = _887 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[12].x, _903);
    float _913 = -_875;
    float _915 = _913 + 1.0;
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[13].z, _907);
    float _919 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[14].x, _909);
    float _921 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[12].z, _911);
    float _923 = _711 * _915;
    float _925 = _759 * _891;
    float _927 = _917 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _929 = _711 * _891;
    float _931 = _759 * _915;
    float _933 = fma(_751, _923, _925);
    float _935 = _921 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _937 = -_631;
    float _939 = _937 + _927;
    float _941 = -_929;
    float _943 = fma(_751, _931, _941);
    float _945 = _751 * _891;
    float _947 = -_641;
    float _949 = _947 + _935;
    float _951 = _933 * _939;
    float _953 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[14].z, _919);
    float _955 = fma(_915, _807, _875);
    float _957 = fma(_943, _949, _951);
    float _959 = -_945;
    float _961 = fma(_711, _931, _959);
    float _963 = _953 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _965 = fma(_759, _931, _875);
    float _967 = fma(_751, _931, _929);
    float _969 = _961 * _939;
    float _971 = -_649;
    float _973 = _971 + _963;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _979 = fma(_711, _923, _875);
    float _981 = fma(_965, _949, _969);
    float _983 = fma(_955, _973, _957);
    float _985 = fma(_165, _977, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _987 = fma(_711, _931, _945);
    float _989 = fma(_967, _973, _981);
    float _991 = _979 * _939;
    float _993 = fma(_983, _985, _649);
    float _995 = -_925;
    float _997 = fma(_751, _923, _995);
    float _999 = fma(_989, _985, _641);
    float _1001 = fma(_987, _949, _991);
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _993 + _1003;
    float _1007 = _631 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1011 = _999 + _1009;
    float _1013 = fma(_997, _973, _1001);
    float _1015 = _1005 * _1005;
    float _1017 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1007);
    float _1019 = _631 + _1013;
    float _1021 = fma(_1011, _1011, _1015);
    float _1023 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1017);
    float _1025 = sqrt(_1021);
    bool _1027 = _1025 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _997;
    float _1031 = _1017;
    float _1033 = _1015;
    float _1035 = _631;
    if (!_1027)
    {
        _1029 = _999;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_1027)
    {
        _1031 = _993;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (!_1027)
    {
        _1033 = _1019;
    }
    float _1045 = _1033;
    bool _1047 = !_1027;
    float _1049 = _1045;
    if (!_1047)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1055 = _1025 + _1053;
        float _1057 = _1019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = rsqrt(_1021);
        float _1061 = _1055 * _1051;
        float _1063 = _1061 * 0.15915493667125701904296875;
        float _1065 = _1063 * 6.283185482025146484375;
        float _1067 = cos(_1065);
        float _1069 = _1063 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = _1067 + (-1.0);
        float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = fma(_1071, _1057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1079 = fma(_1019, _1067, _1075);
        float _1081 = _1059 * _1077;
        float _1083 = fma(_1011, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1085 = fma(_1005, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1049 = _1079;
        _1039 = _1083;
        _1043 = _1085;
    }
    float _1087 = _1049;
    float _1089 = _1039;
    float _1091 = _1043;
    float _1093 = -_631;
    float _1095 = _1093 + _1087;
    float _1097 = -_641;
    float _1099 = _1097 + _1089;
    float _1101 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1103 = _631 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1105 = _1095 * _1095;
    float _1107 = -_649;
    float _1109 = _1107 + _1091;
    float _1111 = 1.0 / _1101;
    float _1113 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    float _1115 = fma(_1099, _1099, _1105);
    float _1117 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    float _1119 = fma(_1109, _1109, _1115);
    float _1121 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1123 = sqrt(_1119);
    float _1125 = _1121 + _1101;
    float _1127 = _1125 * _1111;
    float _1129 = _1127 * 0.5;
    bool _1131 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan(0.5);
    bool _1139 = _1135 || _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1141);
    float _1145 = 1.0 / _1143;
    bool _1147 = _1123 > 0.0;
    bool _1149 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.5);
    bool _1157 = _1153 || _1155;
    bool _1159 = !_1147;
    float _1161 = _1089;
    float _1163 = _1087;
    float _1165 = _1091;
    float _1167 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1169 = _1111;
    float _1171 = _1143;
    float _1173 = _1099;
    float _1175 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1177 = _1095;
    if (!_1159)
    {
        float _1179 = _181 * _181;
        float _1181 = rsqrt(_1119);
        float _1183 = fma(_179, _179, _1179);
        float _1185 = fma(_183, _183, _1183);
        float _1187 = sqrt(_1185);
        float _1189 = _1099 * _1181;
        float _1191 = _1095 * _1181;
        float _1193 = _1109 * _1181;
        bool _1195 = _1187 > 0.0;
        bool _1197 = !_1195;
        _1167 = _1181;
        _1171 = _1185;
        _1173 = _1191;
        _1175 = _1187;
        if (!_1197)
        {
            float _1199 = rsqrt(_1185);
            float _1201 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1203 = _181 * _1199;
            float _1205 = _179 * _1199;
            float _1207 = _1191 * _1203;
            float _1209 = _183 * _1199;
            float _1211 = fma(_1189, _1205, _1207);
            float _1213 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1215 = fma(_1193, _1209, _1211);
            float _1217 = _1215 * _1213;
            float _1219 = fma(_179, _1217, _1089);
            float _1221 = fma(_181, _1217, _1087);
            float _1223 = fma(_183, _1217, _1091);
            _1161 = _1219;
            _1163 = _1221;
            _1165 = _1223;
            _1167 = _1205;
            _1169 = _1201;
            _1171 = _1199;
            _1173 = _1211;
            _1175 = _1217;
            _1177 = _1213;
        }
    }
    float _1225 = _1161;
    float _1227 = _1163;
    float _1229 = _1165;
    float _1231 = _1167;
    float _1233 = _1169;
    float _1235 = _1171;
    float _1237 = _1173;
    float _1239 = _1175;
    float _1241 = _1177;
    float _1243 = _1239;
    float _1245 = _1235;
    float _1247 = _1233;
    float _1249 = _1237;
    float _1251 = _1227;
    float _1253 = _1231;
    float _1255 = _1241;
    if (_1139)
    {
        _1243 = 1.0;
    }
    float _1257 = _1243;
    float _1259 = _1257;
    if (_1157)
    {
        _1245 = _1225;
    }
    float _1261 = _1245;
    float _1263 = _1261;
    if (_1157)
    {
        _1247 = _1227;
    }
    float _1265 = _1247;
    float _1267 = _1265;
    if (_1157)
    {
        _1249 = _1229;
    }
    float _1269 = _1249;
    float _1271 = _1269;
    if (!_1157)
    {
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1275 = _631 + _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1279 = _641 + _1277;
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1283 = -_631;
        float _1285 = _1283 + _1227;
        float _1287 = _1275 * _1275;
        float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1291 = _649 + _1289;
        float _1293 = -_641;
        float _1295 = _1293 + _1225;
        float _1297 = -_649;
        float _1299 = _1297 + _1229;
        float _1301 = fma(_1279, _1279, _1287);
        float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1305 = fma(_1291, _1291, _1301);
        float _1307 = sqrt(_1305);
        float _1309 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1311 = precise::min(_1307, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1313 = _1311 * _1303;
        float _1315 = _1309 * _1313;
        float _1317 = fma(_1285, _1315, _631);
        float _1319 = fma(_1295, _1315, _641);
        float _1321 = fma(_1299, _1315, _649);
        _1267 = _1317;
        _1263 = _1319;
        _1271 = _1321;
        _1251 = _1285;
        _1253 = _1281;
    }
    float _1323 = _1267;
    float _1325 = _1263;
    float _1327 = _1271;
    float _1329 = _1251;
    float _1331 = _1253;
    float _1333 = _1329;
    float _1335 = _1331;
    if (_1139)
    {
        _1255 = 1.0;
    }
    float _1337 = _1255;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1341 = _1145 * _1339;
    float _1343 = _1337;
    if (!_1139)
    {
        float _1345 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1347 = _1345 * 0.15915493667125701904296875;
        float _1349 = _1347 * 6.283185482025146484375;
        float _1351 = cos(_1349);
        float _1353 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1355 = _1353 * 0.15915493667125701904296875;
        float _1357 = _1347 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = 1.0 / _1351;
        float _1363 = _1355 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        float _1367 = _1359 * _1361;
        float _1369 = _1355 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = 1.0 / _1373;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1377;
        float _1381 = 1.0 / _1379;
        float _1383 = _1371 * _1375;
        float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1387 = fma(_1341, _1383, _1385);
        float _1389 = _1387 * _1381;
        float _1391 = precise::clamp(_1389, 0.0, 1.0);
        _1035 = _1381;
        _1333 = _1355;
        _1259 = _1391;
    }
    float _1393 = _1035;
    float _1395 = _1333;
    float _1397 = _1259;
    float _1399 = _1393;
    float _1401 = _1395;
    if (!_1139)
    {
        float _1403 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1405 = _1403 * 0.15915493667125701904296875;
        float _1407 = _1405 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        float _1411 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1405 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = 1.0 / _1409;
        float _1421 = _1413 * 6.283185482025146484375;
        float _1423 = cos(_1421);
        float _1425 = _1417 * _1419;
        float _1427 = _1413 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1423 * _1425;
        float _1433 = 1.0 / _1431;
        float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1435;
        float _1439 = 1.0 / _1437;
        float _1441 = _1429 * _1433;
        float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1445 = fma(_1341, _1441, _1443);
        float _1447 = _1445 * _1439;
        float _1449 = precise::clamp(_1447, 0.0, 1.0);
        float _1451 = -_1449;
        float _1453 = _1451 + 1.0;
        _1399 = _1419;
        _1401 = _1431;
        _1343 = _1453;
    }
    float _1455 = _1399;
    float _1457 = _1401;
    float _1459 = _1343;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1463 = _1323 + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1467 = _1325 + _1465;
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1471 = _1327 + _1469;
    float _1473 = _1463 * _1463;
    float _1475 = fma(_1467, _1467, _1473);
    float _1477 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1479 = fma(_1471, _1471, _1475);
    float _1481 = rsqrt(_1479);
    float _1483 = sqrt(_1479);
    float _1485 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1487 = _1467 * _1485;
    float _1489 = _1471 * _1485;
    float _1491 = _1487 * _1487;
    float _1493 = _1489 * _1489;
    float _1495 = _1491 + _1493;
    float _1497 = sqrt(_1495);
    bool _1499 = _1497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1503 = _1497 + _1501;
    float _1505 = _1455;
    float _1507 = _1495;
    float _1509 = _1503;
    float _1511 = _1457;
    float _1513 = _1463;
    if (_1499)
    {
        float _1515 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1505 = _1515;
    }
    float _1517 = _1505;
    if (_1499)
    {
        float _1519 = rsqrt(_1495);
        _1507 = _1519;
    }
    float _1521 = _1507;
    float _1523 = _1521;
    if (_1499)
    {
        float _1525 = _1503 * _1517;
        _1509 = _1525;
    }
    float _1527 = _1509;
    if (_1499)
    {
        float _1529 = _1527 * 0.15915493667125701904296875;
        _1511 = _1529;
    }
    float _1531 = _1511;
    float _1533 = _1471;
    float _1535 = _1531;
    if (_1499)
    {
        float _1537 = _1531 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        _1533 = _1539;
    }
    float _1541 = _1533;
    float _1543 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1545 = precise::max(0.0, _1543);
    float _1547 = _1517;
    float _1549 = _1545;
    if (_1499)
    {
        float _1551 = _1531 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        _1547 = _1553;
    }
    float _1555 = _1547;
    float _1557 = -_1485;
    float _1559 = -_1545;
    float _1561 = fma(_1463, _1557, _1559);
    if (_1499)
    {
        float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1513 = _1563;
    }
    float _1565 = _1513;
    float _1567 = _1565;
    if (!_1499)
    {
        _1535 = _1487;
    }
    float _1569 = _1535;
    float _1571 = _1541;
    float _1573 = _1569;
    if (_1499)
    {
        float _1575 = fma(_1541, _1565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1571 = _1575;
    }
    float _1577 = _1571;
    float _1579 = _1577;
    float _1581 = _1555;
    if (_1499)
    {
        float _1583 = _1555 + (-1.0);
        _1549 = _1583;
    }
    float _1585 = _1549;
    float _1587 = _1585;
    if (_1499)
    {
        float _1589 = _1521 * _1577;
        _1567 = _1589;
    }
    float _1591 = _1567;
    if (!_1499)
    {
        _1579 = _1561;
    }
    float _1593 = _1579;
    float _1595 = _1593;
    if (_1499)
    {
        float _1597 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1597;
    }
    float _1599 = _1335;
    if (_1499)
    {
        float _1601 = _1487 * _1591;
        _1573 = _1601;
    }
    float _1603 = _1573;
    if (!_1499)
    {
        _1587 = _1489;
    }
    float _1605 = _1587;
    float _1607 = _1605;
    if (_1499)
    {
        float _1609 = _1489 * _1591;
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (!_1499)
    {
        _1523 = _1491;
    }
    float _1613 = _1523;
    float _1615 = _1613;
    if (_1499)
    {
        float _1617 = fma(_1561, _1555, _1599);
        _1595 = _1617;
    }
    float _1619 = _1595;
    if (_1499)
    {
        float _1621 = _1603 * _1603;
        _1615 = _1621;
    }
    float _1623 = _1615;
    if (!_1499)
    {
        _1581 = _1493;
    }
    float _1625 = _1581;
    float _1627 = _1625;
    if (_1499)
    {
        float _1629 = _1611 * _1611;
        _1627 = _1629;
    }
    float _1631 = _1627;
    float _1633 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1635 = fma(_1619, _1619, _1623);
    float _1637 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1639 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1633);
    float _1641 = _1635 + _1631;
    float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1645 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1643);
    float _1647 = precise::clamp(_1645, 0.0, 1.0);
    float _1649 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1639);
    float _1651 = rsqrt(_1641);
    float _1653 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1637);
    float _1655 = -_1647;
    float _1657 = _1655 + 1.0;
    float _1659 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1661 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1663 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1665 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1667 = fma(_649, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1669 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1671 = abs(_1657);
    float _1673 = log2(_1671);
    float _1675 = -_1665;
    float _1677 = fma(_1675, _1661, 1.0);
    float _1679 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1681 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1669);
    float _1683 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1685 = _1651 * _1603;
    float _1687 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1679);
    float _1689 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1681);
    float _1691 = _1651 * _1619;
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1695 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1687);
    float _1697 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1699 = _1651 * _1611;
    float _1701 = floor(_1477);
    float _1703 = -_1693;
    float _1705 = fma(_1691, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1703);
    float _1707 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1709 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1711 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1713 = -_1699;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1705);
    float _1717 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1709);
    float _1719 = floor(_1667);
    float _1721 = fma(_1715, -0.5, 0.5);
    float _1723 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1717);
    float _1725 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1723);
    float _1727 = exp2(_1711);
    float _1729 = -_1701;
    float _1731 = _1477 + _1729;
    float _1733 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1735 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1737 = log2(_1677);
    float _1739 = -_1719;
    float _1741 = _1667 + _1739;
    float _1743 = 1.0 / _1725;
    float _1745 = fma(_1715, 0.5, 0.5);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1733);
    float _1749 = fma(_1745, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1751 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1753 = sqrt(_1721);
    float _1755 = fma(_1745, _1749, -0.212114393711090087890625);
    float _1757 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1751);
    float _1759 = _1737 * 0.693147182464599609375;
    float2 _5526 = float2(_1731, _1741);
    float _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5526, float2(0.0), isnan(_5526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5526, float2(0.0), isnan(_5526)), level(0.0)).x;
    float _1763 = fma(_1745, _1755, 1.570728778839111328125);
    float _1765 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1767 = _1757 * _1743;
    float _1769 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1735);
    float _1771 = _1691 + 1.0;
    float _1773 = fma(_1767, 0.5, 0.5);
    float _1775 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1769);
    float _1777 = -_1691;
    float _1779 = fma(_1727, _1771, _1777);
    float _1781 = _1753 * 0.636619746685028076171875;
    float _1783 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1775);
    float _1785 = -_1763;
    float _1787 = fma(_1781, _1785, 1.0);
    float _1789 = _1783 * _1743;
    float _1791 = fma(_1779, 0.5, 0.5);
    float _1793 = fma(_1789, -0.5, 0.5);
    float3 _5588 = float3(_1773, _1793, _1765);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5588, float3(0.0), isnan(_5588)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5588, float3(0.0), isnan(_5588)), level(0.0)).x;
    float3 _5599 = float3(_1773, _1793, _1765);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5599, float3(0.0), isnan(_5599)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5599, float3(0.0), isnan(_5599)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _5615 = float2(_1787, _1791);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5615, float2(0.0), isnan(_5615)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float _1818 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1822 = _1820 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1826 = _1824 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1828 = _305 > 0.5;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1832 = _1830 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1834 = 1.0 / _1822;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1838 = _1836 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1846 = _1844 != 0;
    float _1848 = 1.0 / _1826;
    int _1850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1852 = _1850 != 0;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1860 = _1858 != 0;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1868 = _1866 != 0;
    bool _1870 = _311 > 0.5;
    float _1872 = 1.0 / _1832;
    float _1874 = -_725;
    int _1876 = _1828 ? as_type<int>(_1874) : as_type<int>(_725);
    bool _1878 = _309 > 0.5;
    float _1880 = 1.0 / _1838;
    bool _1882 = _307 > 0.5;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1888;
    float _1892 = 1.0 / _1842;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1894;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1902 = _1890 * _1834;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1908 = _1896 * _1848;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1914 = 1.0 / _1856;
    float _1916 = _1900 * _1872;
    float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1918;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1926 = _1920 * _1880;
    bool _1928 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1930 = isnan(_165);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = 1.0 / _1864;
    float _1942 = _1924 * _1892;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1950 = _1948 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1952;
    bool _1956 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1958 = isnan(_303);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = 1.0 / _1886;
    float _1970 = _1946 * _1914;
    bool _1972 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1974 = isnan(_165);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1980 = _1976 || _1978;
    float _1982 = float(_1980);
    bool _1984 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1986 = isnan(_165);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    bool _1996 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1998 = isnan(_303);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = -_1982;
    float _2010 = _2008 + 1.0;
    float _2012 = 1.0 / _1906;
    float _2014 = _1950 * _1940;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _2020 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2022 = isnan(_165);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2028 = _2024 || _2026;
    float _2030 = float(_2028);
    float _2032 = -_1994;
    float _2034 = _2032 + 1.0;
    float _2036 = -_2006;
    float _2038 = _2036 + 1.0;
    bool _2040 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2042 = isnan(_303);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2048 = _2044 || _2046;
    float _2050 = float(_2048);
    float _2052 = 1.0 / _1912;
    float _2054 = _2018 * _1968;
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2058 = _303 + _2056;
    float _2060 = -_2030;
    float _2062 = _2060 + 1.0;
    float _2064 = _2050 * _2038;
    float _2066 = -_2050;
    float _2068 = _2066 + 1.0;
    float _2070 = fma(_1902, _2058, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2072 = !_1846;
    float _2074 = _2072 ? _725 : as_type<float>(_1876);
    float _2076 = _1954 * _2012;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2078;
    bool _2082 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2084 = isnan(_165);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    float _2094 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2096 = _165 + _2094;
    float _2098 = _2070 * _2064;
    float _2100 = _2074 + 0.5;
    float _2102 = exp2(_1818);
    float _2104 = _2092 * _2062;
    float _2106 = _2080 * _2052;
    bool _2108 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2110 = isnan(_165);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    float _2120 = -_2092;
    float _2122 = _2120 + 1.0;
    float _2124 = fma(_1926, _2096, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _2126 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2128 = isnan(_165);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2134 = _2130 || _2132;
    float _2136 = float(_2134);
    float _2138 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2098);
    float _2140 = _2118 * _2122;
    float _2142 = -_2118;
    float _2144 = _2142 + 1.0;
    bool _2146 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2148 = isnan(_303);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = -_2136;
    float _2160 = _2158 + 1.0;
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2164 = _165 + _2162;
    float _2166 = _1938 * _2144;
    float _2168 = -_1938;
    float _2170 = _2168 + 1.0;
    float _2172 = -_2156;
    float _2174 = _2172 + 1.0;
    float _2176 = fma(_2076, _2164, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2178 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2180 = _2136 * _2170;
    float _2182 = _1966 * _2174;
    float _2184 = -_1966;
    float _2186 = _2184 + 1.0;
    float _2188 = _1982 * _2160;
    bool _2190 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2192 = isnan(_165);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2198 = _2194 || _2196;
    float _2200 = float(_2198);
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2204 = _303 + _2202;
    float _2206 = _2006 * _2186;
    float _2208 = _1994 * _2010;
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2212 = _303 + _2210;
    float _2214 = _2200 * _2034;
    float _2216 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2218 = _165 + _2216;
    float _2220 = -_2200;
    float _2222 = _2220 + 1.0;
    float _2224 = fma(_1916, _2212, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2226 = _2124 * _2214;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2230 = _165 + _2228;
    float _2232 = fma(_1942, _2218, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2234 = fma(_1908, _2204, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2236 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2226);
    float _2238 = fma(_1970, _2230, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2242 = _165 + _2240;
    float _2244 = fma(_2224, _2206, _2138);
    float _2246 = fma(_2232, _2208, _2236);
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2250 = _165 + _2248;
    float _2252 = fma(_2014, _2242, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2254 = fma(_2234, _2182, _2244);
    float _2256 = fma(_2238, _2188, _2246);
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2260 = _165 + _2258;
    float _2262 = fma(_2054, _2250, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2266 = fma(_2252, _2180, _2256);
    float _2268 = fma(_2106, _2260, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2270 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2254);
    float _2272 = -_725;
    int _2274 = _1878 ? as_type<int>(_2272) : as_type<int>(_725);
    float _2276 = fma(_2176, _2166, _2266);
    float _2278 = -_675;
    int _2280 = _1882 ? as_type<int>(_2278) : as_type<int>(_675);
    float _2282 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2286 = fma(_2262, _2140, _2276);
    bool _2288 = !_1852;
    float _2290 = _2288 ? _675 : as_type<float>(_2280);
    float _2292 = _761 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2294 = !_1860;
    float _2296 = _2294 ? _725 : as_type<float>(_2274);
    float _2298 = fma(_2268, _2104, _2286);
    float _2300 = -_675;
    int _2302 = _1870 ? as_type<int>(_2300) : as_type<int>(_675);
    float _2304 = -_2290;
    float _2306 = _2304 + 0.5;
    float _2308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2310 = _2296 + 0.5;
    bool _2312 = !_1868;
    float _2314 = _2312 ? _675 : as_type<float>(_2302);
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2318 = _2178 * _2264;
    float _2320 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2322 = -_2314;
    float _2324 = _2322 + 0.5;
    float _2326 = abs(_1341);
    float _2328 = log2(_2326);
    float _2330 = _2316 * _2284;
    float _2332 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2336 = _761 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2342 = _2320 * _2308;
    float _2344 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2346 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2348 = _761 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2350 = -_745;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2356 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2358 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2298);
    float _2360 = -_745;
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2348);
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2366 = -_745;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    float _2370 = _675 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2372 = exp2(_2356);
    float _2374 = _779 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2376 = _2332 * _2340;
    out.m_64.x = _2364;
    out.m_64.y = _2344;
    out.m_64.z = _2346;
    out.m_64.w = _2282;
    bool _2378 = _1341 <= 8000.0;
    bool _2380 = isnan(_1341);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan(8000.0);
    bool _2386 = _2382 || _2384;
    float _2388 = float(_2386);
    float _2390 = _725 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2392 = -_2102;
    float _2394 = _2392 + 1.0;
    out.m_66.x = _2318;
    out.m_66.y = _2330;
    out.m_66.z = _2342;
    out.m_66.w = _2376;
    float _2396 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2358;
    bool _2398 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2400 = isnan(_1483);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2406 = _2402 || _2404;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2410 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = _789 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2416 = _789 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2418 = _789 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2420 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    float _2422 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2352);
    float _2424 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2374);
    float _2426 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2414);
    float _2428 = _2370 * _2422;
    float _2430 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2432 = fma(_2412, -2.0, 3.0);
    float _2434 = _2412 * _2412;
    float _2436 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2416);
    float _2438 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2430);
    float _2440 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2418);
    float _2442 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2424);
    float _2444 = _779 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2446 = _2434 * _2432;
    float _2448 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2426);
    float _2450 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2438);
    float _2452 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2440);
    float _2454 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2444);
    float _2456 = -_2446;
    float _2458 = _2456 + 1.0;
    float _2460 = in.m_70.x;
    float _2462 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2450);
    float _2464 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2454);
    float _2466 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2446);
    float _2468 = _2370 * _2420;
    float _2470 = _2462 + _1725;
    float _2472 = _779 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2474 = _2388 * _2466;
    float _2476 = fma(_2390, _2442, _2428);
    float _2478 = _2470 * 0.5;
    float _2480 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2436);
    float _2482 = fma(_2390, _2464, _2468);
    float _2484 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2472);
    float _2486 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2488 = _2448 + _2476;
    float _2490 = _2480 + _2482;
    float _2492 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2368);
    float _2494 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2484);
    out.m_72.w = _2408;
    float _2496 = _2370 * _2492;
    out.m_74.z = _2478;
    out.m_74.w = _1725;
    float _2498 = fma(_2390, _2494, _2496);
    out.gl_Position.x = _1757;
    out.gl_Position.y = _1783;
    out.gl_Position.z = _2462;
    out.gl_Position.w = _1725;
    float _2500 = _2452 + _2498;
    out.m_76.x = _2488;
    out.m_76.y = _2490;
    out.m_76.z = _2500;
    float _2502 = _1397 * _1459;
    float _2504 = -_1761;
    float _2506 = _2504 + 1.0;
    float _2508 = _1725;
    float _2510 = _2462;
    float _2512 = _1783;
    float _2514 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2516 = _2502;
    if (!_2406)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2518 = _2508;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2406)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2524 = _2510;
    float _2526 = _2506 * _2486;
    float _2528 = precise::clamp(_2526, 0.0, 1.0);
    float _2530 = _2524;
    float _2532 = _2524;
    if (!_2406)
    {
        _2512 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2534 = _2512;
    float _2536 = -_2528;
    float _2538 = fma(_2536, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2540 = _2534;
    float _2542 = _2534;
    if (!_2406)
    {
        _2514 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2544 = _2514;
    float _2546 = _2538 * _2460;
    float _2548 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2550 = _2546;
    float _2552 = _2544;
    float _2554 = _2544;
    if (!_2406)
    {
        _2516 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2556 = _2516;
    float _2558 = _2546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2560 = _2556;
    float _2562 = _2556;
    if (!_2406)
    {
        _2550 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2564 = _2550;
    out.m_78.x = _2558;
    float _2566 = _2396 * _1795;
    float _2568 = -_2396;
    float _2570 = _2568 + 1.0;
    float _2572 = _1806 * _2566;
    float _2574 = _1816 * _2566;
    float _2576 = _1806 * _2570;
    float _2578 = fma(_1812, _2572, _1800);
    float _2580 = fma(_1814, _2572, _1802);
    float _2582 = fma(_1806, _2574, _1804);
    out.m_80.x = _2578;
    out.m_80.y = _2580;
    out.m_80.z = _2582;
    out.m_80.w = _2576;
    bool _2584 = !_2406;
    float _2586 = _2564;
    float _2588 = _2564;
    if (!_2584)
    {
        bool _2590 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2592 = isnan(_1483);
        bool _2594 = _2590 || _2592;
        bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2598 = _2594 || _2596;
        if (!_2598)
        {
            float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2602 = _1483 + _2600;
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2606 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2604;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2612 = 1.0 / _2606;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2630 = _2602 * _2612;
            float _2632 = precise::clamp(_2630, 0.0, 1.0);
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2638 = fma(_2632, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2640 = fma(_2632, _2636, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2642 = fma(_2632, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2644 = fma(_2632, _2620, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2646 = fma(_2632, _2624, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2648 = fma(_2632, _2628, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2588 = _2642;
            _2542 = _2646;
            _2554 = _2638;
            _2532 = _2644;
            _2522 = _2640;
            _2562 = _2648;
            _2650 = true;
        }
        else
        {
            bool _2652 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2654 = isnan(_1483);
            bool _2656 = _2652 || _2654;
            bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2660 = _2656 || _2658;
            if (!_2660)
            {
                _2552 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2662 = _2552;
            _2554 = _2662;
            if (!_2660)
            {
                _2586 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2664 = _2586;
            _2588 = _2664;
            if (!_2660)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2666 = _2520;
            _2522 = _2666;
            if (!_2660)
            {
                _2530 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2668 = _2530;
            _2532 = _2668;
            if (!_2660)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2670 = _2540;
            _2542 = _2670;
            if (!_2660)
            {
                _2560 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2672 = _2560;
            bool _2674 = !_2660;
            _2562 = _2672;
            if (!_2674)
            {
                bool _2676 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2678 = isnan(_1483);
                bool _2680 = _2676 || _2678;
                bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2684 = _2680 || _2682;
                if (!_2684)
                {
                    float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2688 = _1483 + _2686;
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2692 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2690;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2698 = 1.0 / _2692;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2716 = _2688 * _2698;
                    float _2718 = precise::clamp(_2716, 0.0, 1.0);
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2724 = fma(_2718, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2726 = fma(_2718, _2722, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2728 = fma(_2718, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2730 = fma(_2718, _2706, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2732 = fma(_2718, _2710, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2734 = fma(_2718, _2714, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2588 = _2728;
                    _2542 = _2732;
                    _2554 = _2724;
                    _2532 = _2730;
                    _2522 = _2726;
                    _2562 = _2734;
                    _2650 = true;
                }
                else
                {
                    _2588 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2554 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2532 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2562 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2650 = false;
    float _2736 = _2588;
    float _2738 = _2542;
    float _2740 = _2554;
    float _2742 = _2532;
    float _2744 = _2522;
    float _2746 = _2562;
    float _2748 = _2548 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2750 = fma(_2490, -0.5, 0.5);
    float _2752 = precise::clamp(_2750, 0.0, 1.0);
    float _2754 = -_2736;
    float _2756 = _2754 + _2738;
    float _2758 = -_2740;
    float _2760 = _2758 + _2742;
    out.m_49.x = _2748;
    float _2762 = fma(_2752, _2756, _2736);
    float _2764 = -_2744;
    float _2766 = _2764 + _2746;
    float _2768 = fma(_2752, _2760, _2740);
    float _2770 = _2762 * 0.586610972881317138671875;
    bool _2772 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2774 = fma(_2752, _2766, _2744);
    out.m_82.x = 0.0;
    float _2776 = fma(_2768, 0.298911988735198974609375, _2770);
    bool _2778 = _1397 > 0.0;
    bool _2780 = isnan(_1397);
    bool _2782 = _2778 || _2780;
    bool _2784 = isnan(0.0);
    bool _2786 = _2782 || _2784;
    float _2788 = fma(_2774, 0.114477999508380889892578125, _2776);
    bool _2790 = _1459 <= 0.0;
    bool _2792 = !_2786;
    bool _2794 = _2790 || _2792;
    float _2796 = -_2788;
    float _2798 = _2768 + _2796;
    float _2800 = -_2788;
    float _2802 = _2762 + _2800;
    float _2804 = -_2788;
    float _2806 = _2774 + _2804;
    float _2808 = fma(_2798, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2810 = fma(_2802, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2812 = fma(_2806, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    bool _2814 = !_2772;
    if (!_2814)
    {
        float _2816 = -_1323;
        float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2820 = -_1325;
        float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2824 = -_1327;
        float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2828 = _2818 * _2818;
        float _2830 = fma(_2822, _2822, _2828);
        float _2832 = fma(_2826, _2826, _2830);
        float _2834 = sqrt(_2832);
        float _2836 = rsqrt(_2832);
        float _2838 = -_2834;
        float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2844 = precise::clamp(_2842, 0.0, 1.0);
        float _2846 = _2822 * _2836;
        float _2848 = _2818 * _2836;
        float _2850 = abs(_2844);
        float _2852 = log2(_2850);
        float _2854 = _2826 * _2836;
        float _2856 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2858 = _2490 * _2848;
        float _2860 = -_2848;
        float _2862 = -_2856;
        float _2864 = fma(_2860, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2862);
        float _2866 = fma(_2488, _2846, _2858);
        float _2868 = -_2854;
        float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2864);
        float _2872 = fma(_2500, _2854, _2866);
        float _2874 = precise::clamp(_2872, 0.0, 1.0);
        float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2878 = _2870 + _2876;
        float _2880 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2884 = precise::clamp(_2882, 0.0, 1.0);
        float _2886 = exp2(_2880);
        float _2888 = _2886 * _2884;
        float _2890 = _2874 * _2888;
        float _2892 = _2890 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2894 = _2890 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2896 = _2890 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2892;
        out.m_82.y = _2894;
        out.m_82.z = _2896;
    }
    out.m_84.x = _2808;
    out.m_84.y = _2810;
    out.m_84.z = _2812;
    if (!_2794)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2898 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2898;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2650 = false;
    bool _301 = false;
    bool _205 = false;
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
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_107)
    {
        float _115 = _111 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2954 = as_type<float>(_117);
        out.gl_Position.z = _2954;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_51.w;
    float _123 = float(_103);
    float _125 = -_121;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_121);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    bool _139 = _127 >= _123;
    bool _141 = !_137;
    bool _143 = _139 || _141;
    float _145 = _121;
    float _147 = _127;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _145;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _151 = _149 * 5.0;
        _119 = as_type<int>(_151);
    }
    int _153 = _119;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3019 = as_type<float>(_153);
        out.gl_Position.z = _3019;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    float _161 = 1.0 / _123;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = _127 * _161;
    float _167 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _171 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _173 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    float _177 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _171);
    float _179 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _173);
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _175);
    float _183 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _177);
    bool _185 = !_163;
    float _203;
    if (!_185)
    {
        float _187 = in.m_55.x;
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        _203 = _165;
    }
    _205 = false;
    float _207 = _203;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -_223;
    float _231 = _229 + 1.0;
    bool _233 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _235 = isnan(_207);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _227;
    float _253 = _243 * _231;
    float _255 = -_243;
    float _257 = _255 + 1.0;
    float _259 = _211 * _251;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = fma(_247, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _267 = fma(_263, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _269 = _265 * _253;
    float _271 = _267 * _253;
    float _273 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_249;
    float _299;
    if (!_281)
    {
        float _283 = in.m_55.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        _299 = _165;
    }
    _301 = false;
    float _303 = _299;
    float _305 = in.m_55.x;
    float _307 = in.m_55.y;
    float _309 = in.m_55.z;
    float _311 = in.m_55.w;
    float _313 = as_type<float>(int(gl_VertexIndex));
    float _315 = in.m_46.x;
    float _317 = in.m_46.y;
    float _319 = in.m_46.z;
    float _321 = in.m_60.x;
    float _323 = in.m_60.y;
    float _325 = _309 * 2.0;
    float _327 = _305 * 2.0;
    int _329 = as_type<int>(_313) & 1;
    bool _331 = _329 != 0;
    int _333 = as_type<int>(_313) & 2;
    bool _335 = _333 != 0;
    float _337 = floor(_325);
    float _339 = _317 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _347 = _345 != 0;
    int _349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _351 = _349 != 0;
    float _353 = _317 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _355 = _317 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _357 = _279 * _323;
    float _359 = floor(_327);
    float _361 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _363 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].x, _339);
    float _365 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].x, _353);
    float _367 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].x, _355);
    float _369 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _361);
    float _371 = _307 * 2.0;
    float _373 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _375 = log2(_373);
    bool _377 = _337 >= 0.0;
    bool _379 = isnan(_337);
    bool _381 = _377 || _379;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    float _387 = _277 * _321;
    float _389 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    int _391 = _385 ? 0 : 1;
    float _393 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[5].z, _365);
    bool _395 = _337 > 0.0;
    float _397 = _307 + _309;
    bool _399 = _359 >= 0.0;
    bool _401 = isnan(_359);
    bool _403 = _399 || _401;
    bool _405 = isnan(0.0);
    bool _407 = _403 || _405;
    float _409 = floor(_371);
    float _411 = _397 + (-1.0);
    int _413 = _407 ? 0 : 1;
    float _415 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _417 = _359 > 0.0;
    float _419 = _309 + _305;
    float _421 = _307 + _305;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _425 = _375 * _127;
    float _427 = _419 + (-1.0);
    float _429 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _415);
    float _431 = _421 + (-1.0);
    int _433 = ~_413;
    int _435 = _433 + 1;
    int _437 = _435 + 1;
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _441 = exp2(_425);
    int _443 = ~_391;
    int _445 = _443 + 1;
    int _447 = _445 + 1;
    float _449 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _369);
    int _451 = _437;
    int _453 = _447;
    if (!_417)
    {
        int _455 = ~_413;
        int _457 = _455 + 1;
        _451 = _457;
    }
    int _459 = _451;
    float _461 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _463 = in.m_62.x;
    float _465 = in.m_62.y;
    float _467 = in.m_62.z;
    float _469 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_395)
    {
        int _471 = ~_391;
        int _473 = _471 + 1;
        _453 = _473;
    }
    int _475 = _453;
    bool _477 = !_343;
    int _479 = _477 ? 0 : 1;
    float _481 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _429);
    bool _483 = _409 > 0.0;
    bool _485 = _409 >= 0.0;
    bool _487 = isnan(_409);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _497 = 1.0 + _495;
    int _499 = abs(_479);
    float _501 = -_441;
    float _503 = _501 + 1.0;
    bool _505 = !_347;
    int _507 = _505 ? 0 : 1;
    float _509 = 1.0 / _497;
    bool _511 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _513 = isnan(1.0);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _519 = _515 || _517;
    int _521 = abs(_507);
    float _523 = float(_499);
    float _525 = float(_475);
    float _527 = rsqrt(_481);
    bool _529 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _531 = isnan(0.0);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _537 = _533 || _535;
    float _539 = float(_521);
    float _541 = _523 * _525;
    float _543 = _537 ? _503 : 0.0;
    int _545 = _493 ? 0 : 1;
    float _547 = _541 * (-2.0);
    float _549 = float(_459);
    if (_519)
    {
        float _551 = _543 * _509;
        _147 = _551;
    }
    float _553 = _147;
    float _555 = _305 + (-0.5);
    float _557 = fma(_547, _463, _463);
    float _559 = fma(_461, _547, _461);
    bool _561 = !_351;
    int _563 = _561 ? 0 : 1;
    float _565 = _539 * _549;
    float _567 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[196].x, _557);
    float _569 = _527 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _571 = ~_545;
    int _573 = _571 + 1;
    int _575 = _573 + 1;
    float _577 = _527 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    int _579 = _575;
    if (!_483)
    {
        int _581 = ~_545;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    float _587 = _569 * _569;
    float _589 = fma(_559, _553, _567);
    int _591 = abs(_563);
    float _593 = fma(_577, _577, _587);
    float _595 = float(_585);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _597;
    float _601 = float(_591);
    float _603 = _565 * (-2.0);
    float _605 = _527 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _607 = 1.0 / _599;
    float _609 = _589 * 0.15915493667125701904296875;
    float _611 = _601 * _595;
    float _613 = fma(_603, _465, _465);
    float _615 = fma(_423, _603, _423);
    float _617 = fma(_605, _605, _593);
    float _619 = _609 * 6.283185482025146484375;
    float _621 = cos(_619);
    float _623 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[6].z, _367);
    float _625 = _307 + (-0.5);
    float _627 = _611 * (-2.0);
    float _629 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[196].y, _613);
    float _631 = _393 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _633 = fma(_439, _627, _439);
    float _635 = fma(_627, _467, _467);
    float _637 = fma(_615, _553, _629);
    float _639 = _357 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _641 = _389 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _643 = _631 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _645 = _309 + (-0.5);
    float _647 = _637 * 0.15915493667125701904296875;
    float _649 = _623 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[0].x, _643);
    float _653 = rsqrt(_617);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[196].z, _635);
    float _657 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[0].z, _651);
    float _659 = _449 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _661 = fma(_633, _553, _655);
    float _663 = -_631;
    float _665 = _663 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _667 = _657 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _669 = -_641;
    float _671 = _669 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _673 = !_335;
    float _675 = _673 ? (-0.5) : 0.5;
    float _677 = _661 * 0.15915493667125701904296875;
    float _679 = -_667;
    float _681 = _659 + _679;
    float _683 = _647 * 6.283185482025146484375;
    float _685 = sin(_683);
    float _687 = _665 * _665;
    float _689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _675);
    float _691 = abs(_681);
    float _693 = precise::max(_691, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _695 = fma(_671, _671, _687);
    float _697 = _639 * _689;
    float _699 = -_649;
    float _701 = _699 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _647 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = precise::min(_693, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _709 = fma(_701, _701, _695);
    float _711 = _569 * _653;
    float _713 = _609 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = _621 * _685;
    float _719 = _677 * 6.283185482025146484375;
    float _721 = cos(_719);
    bool _723 = !_331;
    float _725 = _723 ? (-0.5) : 0.5;
    bool _727 = _667 >= _659;
    bool _729 = isnan(_667);
    bool _731 = _727 || _729;
    bool _733 = isnan(_659);
    bool _735 = _731 || _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _739 = _707 + _737;
    float _741 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _725);
    float _743 = _677 * 6.283185482025146484375;
    float _745 = sin(_743);
    float _747 = _739 * _607;
    float _749 = _469 * _741;
    float _751 = _605 * _653;
    float _753 = _621 * _705;
    float _755 = _715 * _685;
    float _757 = _715 * _705;
    float _759 = _577 * _653;
    float _761 = _621 * _721;
    float _763 = _715 * _721;
    float _765 = _685 * _721;
    float _767 = _705 * _721;
    float _769 = _761 * _697;
    float _771 = _763 * _697;
    bool _773 = !_735;
    float _775 = _773 ? 1.0 : (-1.0);
    float _777 = sqrt(_709);
    float _779 = fma(_745, _753, _755);
    float _781 = fma(_745, _755, _753);
    float _783 = -_717;
    float _785 = fma(_745, _757, _783);
    float _787 = -_757;
    float _789 = fma(_745, _717, _787);
    float _791 = -_697;
    float _793 = _745 * _791;
    float _795 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _797 = fma(_779, _749, _769);
    float _799 = _775 * _747;
    float _801 = fma(_767, _749, _793);
    float _803 = fma(_785, _749, _771);
    float _805 = fma(_789, _795, _797);
    float _807 = _751 * _751;
    float _809 = fma(_765, _795, _801);
    float _811 = fma(_781, _795, _803);
    float _813 = _805 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _815 = _165 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _817 = _805 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _819 = _805 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].x, _813);
    float _823 = _815 * _799;
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].x, _817);
    float _827 = _631 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].z, _821);
    float _831 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _833 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].z, _825);
    float _835 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[2].x, _827);
    float _837 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _839 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].z, _831);
    float _841 = _833 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _843 = _823 * 0.15915493667125701904296875;
    float _845 = _631 + _837;
    float _847 = abs(_777);
    float _849 = precise::max(0.0, _847);
    float _851 = _641 + _841;
    float _853 = _839 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _855 = _845 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _857 = _845 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _845 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _861 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[2].z, _835);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _855);
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _857);
    float _867 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _859);
    float _869 = _649 + _853;
    float _871 = precise::min(_849, 40.0);
    float _873 = _843 * 6.283185482025146484375;
    float _875 = cos(_873);
    float _877 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _867);
    float _879 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _865);
    float _881 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _863);
    float _883 = _861 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _887 = _879 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _889 = _843 * 6.283185482025146484375;
    float _891 = sin(_889);
    float _893 = fma(_871, -0.02500000037252902984619140625, 1.0);
    float _895 = _881 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _897 = -_885;
    float _899 = _897 + _883;
    float _901 = _887 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _903 = _887 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _905 = fma(_893, _899, _885);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[13].x, _901);
    float _909 = _887 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[12].x, _903);
    float _913 = -_875;
    float _915 = _913 + 1.0;
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[13].z, _907);
    float _919 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[14].x, _909);
    float _921 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[12].z, _911);
    float _923 = _711 * _915;
    float _925 = _759 * _891;
    float _927 = _917 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _929 = _711 * _891;
    float _931 = _759 * _915;
    float _933 = fma(_751, _923, _925);
    float _935 = _921 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _937 = -_631;
    float _939 = _937 + _927;
    float _941 = -_929;
    float _943 = fma(_751, _931, _941);
    float _945 = _751 * _891;
    float _947 = -_641;
    float _949 = _947 + _935;
    float _951 = _933 * _939;
    float _953 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[14].z, _919);
    float _955 = fma(_915, _807, _875);
    float _957 = fma(_943, _949, _951);
    float _959 = -_945;
    float _961 = fma(_711, _931, _959);
    float _963 = _953 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _965 = fma(_759, _931, _875);
    float _967 = fma(_751, _931, _929);
    float _969 = _961 * _939;
    float _971 = -_649;
    float _973 = _971 + _963;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _979 = fma(_711, _923, _875);
    float _981 = fma(_965, _949, _969);
    float _983 = fma(_955, _973, _957);
    float _985 = fma(_165, _977, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _987 = fma(_711, _931, _945);
    float _989 = fma(_967, _973, _981);
    float _991 = _979 * _939;
    float _993 = fma(_983, _985, _649);
    float _995 = -_925;
    float _997 = fma(_751, _923, _995);
    float _999 = fma(_989, _985, _641);
    float _1001 = fma(_987, _949, _991);
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _993 + _1003;
    float _1007 = _631 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1011 = _999 + _1009;
    float _1013 = fma(_997, _973, _1001);
    float _1015 = _1005 * _1005;
    float _1017 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1007);
    float _1019 = _631 + _1013;
    float _1021 = fma(_1011, _1011, _1015);
    float _1023 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1017);
    float _1025 = sqrt(_1021);
    bool _1027 = _1025 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _997;
    float _1031 = _1017;
    float _1033 = _1015;
    float _1035 = _631;
    if (!_1027)
    {
        _1029 = _999;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_1027)
    {
        _1031 = _993;
    }
    float _1041 = _1031;
    float _1043 = _1041;
    if (!_1027)
    {
        _1033 = _1019;
    }
    float _1045 = _1033;
    bool _1047 = !_1027;
    float _1049 = _1045;
    if (!_1047)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1055 = _1025 + _1053;
        float _1057 = _1019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = rsqrt(_1021);
        float _1061 = _1055 * _1051;
        float _1063 = _1061 * 0.15915493667125701904296875;
        float _1065 = _1063 * 6.283185482025146484375;
        float _1067 = cos(_1065);
        float _1069 = _1063 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = _1067 + (-1.0);
        float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = fma(_1071, _1057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1079 = fma(_1019, _1067, _1075);
        float _1081 = _1059 * _1077;
        float _1083 = fma(_1011, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1085 = fma(_1005, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1049 = _1079;
        _1039 = _1083;
        _1043 = _1085;
    }
    float _1087 = _1049;
    float _1089 = _1039;
    float _1091 = _1043;
    float _1093 = -_631;
    float _1095 = _1093 + _1087;
    float _1097 = -_641;
    float _1099 = _1097 + _1089;
    float _1101 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1103 = _631 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1105 = _1095 * _1095;
    float _1107 = -_649;
    float _1109 = _1107 + _1091;
    float _1111 = 1.0 / _1101;
    float _1113 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    float _1115 = fma(_1099, _1099, _1105);
    float _1117 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    float _1119 = fma(_1109, _1109, _1115);
    float _1121 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1123 = sqrt(_1119);
    float _1125 = _1121 + _1101;
    float _1127 = _1125 * _1111;
    float _1129 = _1127 * 0.5;
    bool _1131 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan(0.5);
    bool _1139 = _1135 || _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1141);
    float _1145 = 1.0 / _1143;
    bool _1147 = _1123 > 0.0;
    bool _1149 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.5);
    bool _1157 = _1153 || _1155;
    bool _1159 = !_1147;
    float _1161 = _1089;
    float _1163 = _1087;
    float _1165 = _1091;
    float _1167 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1169 = _1111;
    float _1171 = _1143;
    float _1173 = _1099;
    float _1175 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1177 = _1095;
    if (!_1159)
    {
        float _1179 = _181 * _181;
        float _1181 = rsqrt(_1119);
        float _1183 = fma(_179, _179, _1179);
        float _1185 = fma(_183, _183, _1183);
        float _1187 = sqrt(_1185);
        float _1189 = _1099 * _1181;
        float _1191 = _1095 * _1181;
        float _1193 = _1109 * _1181;
        bool _1195 = _1187 > 0.0;
        bool _1197 = !_1195;
        _1167 = _1181;
        _1171 = _1185;
        _1173 = _1191;
        _1175 = _1187;
        if (!_1197)
        {
            float _1199 = rsqrt(_1185);
            float _1201 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1203 = _181 * _1199;
            float _1205 = _179 * _1199;
            float _1207 = _1191 * _1203;
            float _1209 = _183 * _1199;
            float _1211 = fma(_1189, _1205, _1207);
            float _1213 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1215 = fma(_1193, _1209, _1211);
            float _1217 = _1215 * _1213;
            float _1219 = fma(_179, _1217, _1089);
            float _1221 = fma(_181, _1217, _1087);
            float _1223 = fma(_183, _1217, _1091);
            _1161 = _1219;
            _1163 = _1221;
            _1165 = _1223;
            _1167 = _1205;
            _1169 = _1201;
            _1171 = _1199;
            _1173 = _1211;
            _1175 = _1217;
            _1177 = _1213;
        }
    }
    float _1225 = _1161;
    float _1227 = _1163;
    float _1229 = _1165;
    float _1231 = _1167;
    float _1233 = _1169;
    float _1235 = _1171;
    float _1237 = _1173;
    float _1239 = _1175;
    float _1241 = _1177;
    float _1243 = _1239;
    float _1245 = _1235;
    float _1247 = _1233;
    float _1249 = _1237;
    float _1251 = _1227;
    float _1253 = _1231;
    float _1255 = _1241;
    if (_1139)
    {
        _1243 = 1.0;
    }
    float _1257 = _1243;
    float _1259 = _1257;
    if (_1157)
    {
        _1245 = _1225;
    }
    float _1261 = _1245;
    float _1263 = _1261;
    if (_1157)
    {
        _1247 = _1227;
    }
    float _1265 = _1247;
    float _1267 = _1265;
    if (_1157)
    {
        _1249 = _1229;
    }
    float _1269 = _1249;
    float _1271 = _1269;
    if (!_1157)
    {
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1275 = _631 + _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1279 = _641 + _1277;
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1283 = -_631;
        float _1285 = _1283 + _1227;
        float _1287 = _1275 * _1275;
        float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1291 = _649 + _1289;
        float _1293 = -_641;
        float _1295 = _1293 + _1225;
        float _1297 = -_649;
        float _1299 = _1297 + _1229;
        float _1301 = fma(_1279, _1279, _1287);
        float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1305 = fma(_1291, _1291, _1301);
        float _1307 = sqrt(_1305);
        float _1309 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1311 = precise::min(_1307, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1313 = _1311 * _1303;
        float _1315 = _1309 * _1313;
        float _1317 = fma(_1285, _1315, _631);
        float _1319 = fma(_1295, _1315, _641);
        float _1321 = fma(_1299, _1315, _649);
        _1267 = _1317;
        _1263 = _1319;
        _1271 = _1321;
        _1251 = _1285;
        _1253 = _1281;
    }
    float _1323 = _1267;
    float _1325 = _1263;
    float _1327 = _1271;
    float _1329 = _1251;
    float _1331 = _1253;
    float _1333 = _1329;
    float _1335 = _1331;
    if (_1139)
    {
        _1255 = 1.0;
    }
    float _1337 = _1255;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1341 = _1145 * _1339;
    float _1343 = _1337;
    if (!_1139)
    {
        float _1345 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1347 = _1345 * 0.15915493667125701904296875;
        float _1349 = _1347 * 6.283185482025146484375;
        float _1351 = cos(_1349);
        float _1353 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1355 = _1353 * 0.15915493667125701904296875;
        float _1357 = _1347 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = 1.0 / _1351;
        float _1363 = _1355 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        float _1367 = _1359 * _1361;
        float _1369 = _1355 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = 1.0 / _1373;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1377;
        float _1381 = 1.0 / _1379;
        float _1383 = _1371 * _1375;
        float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1387 = fma(_1341, _1383, _1385);
        float _1389 = _1387 * _1381;
        float _1391 = precise::clamp(_1389, 0.0, 1.0);
        _1035 = _1381;
        _1333 = _1355;
        _1259 = _1391;
    }
    float _1393 = _1035;
    float _1395 = _1333;
    float _1397 = _1259;
    float _1399 = _1393;
    float _1401 = _1395;
    if (!_1139)
    {
        float _1403 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1405 = _1403 * 0.15915493667125701904296875;
        float _1407 = _1405 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        float _1411 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1405 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = 1.0 / _1409;
        float _1421 = _1413 * 6.283185482025146484375;
        float _1423 = cos(_1421);
        float _1425 = _1417 * _1419;
        float _1427 = _1413 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1423 * _1425;
        float _1433 = 1.0 / _1431;
        float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1435;
        float _1439 = 1.0 / _1437;
        float _1441 = _1429 * _1433;
        float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1445 = fma(_1341, _1441, _1443);
        float _1447 = _1445 * _1439;
        float _1449 = precise::clamp(_1447, 0.0, 1.0);
        float _1451 = -_1449;
        float _1453 = _1451 + 1.0;
        _1399 = _1419;
        _1401 = _1431;
        _1343 = _1453;
    }
    float _1455 = _1399;
    float _1457 = _1401;
    float _1459 = _1343;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1463 = _1323 + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1467 = _1325 + _1465;
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1471 = _1327 + _1469;
    float _1473 = _1463 * _1463;
    float _1475 = fma(_1467, _1467, _1473);
    float _1477 = fma(_641, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1479 = fma(_1471, _1471, _1475);
    float _1481 = rsqrt(_1479);
    float _1483 = sqrt(_1479);
    float _1485 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1487 = _1467 * _1485;
    float _1489 = _1471 * _1485;
    float _1491 = _1487 * _1487;
    float _1493 = _1489 * _1489;
    float _1495 = _1491 + _1493;
    float _1497 = sqrt(_1495);
    bool _1499 = _1497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1503 = _1497 + _1501;
    float _1505 = _1455;
    float _1507 = _1495;
    float _1509 = _1503;
    float _1511 = _1457;
    float _1513 = _1463;
    if (_1499)
    {
        float _1515 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1505 = _1515;
    }
    float _1517 = _1505;
    if (_1499)
    {
        float _1519 = rsqrt(_1495);
        _1507 = _1519;
    }
    float _1521 = _1507;
    float _1523 = _1521;
    if (_1499)
    {
        float _1525 = _1503 * _1517;
        _1509 = _1525;
    }
    float _1527 = _1509;
    if (_1499)
    {
        float _1529 = _1527 * 0.15915493667125701904296875;
        _1511 = _1529;
    }
    float _1531 = _1511;
    float _1533 = _1471;
    float _1535 = _1531;
    if (_1499)
    {
        float _1537 = _1531 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        _1533 = _1539;
    }
    float _1541 = _1533;
    float _1543 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1545 = precise::max(0.0, _1543);
    float _1547 = _1517;
    float _1549 = _1545;
    if (_1499)
    {
        float _1551 = _1531 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        _1547 = _1553;
    }
    float _1555 = _1547;
    float _1557 = -_1485;
    float _1559 = -_1545;
    float _1561 = fma(_1463, _1557, _1559);
    if (_1499)
    {
        float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1513 = _1563;
    }
    float _1565 = _1513;
    float _1567 = _1565;
    if (!_1499)
    {
        _1535 = _1487;
    }
    float _1569 = _1535;
    float _1571 = _1541;
    float _1573 = _1569;
    if (_1499)
    {
        float _1575 = fma(_1541, _1565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1571 = _1575;
    }
    float _1577 = _1571;
    float _1579 = _1577;
    float _1581 = _1555;
    if (_1499)
    {
        float _1583 = _1555 + (-1.0);
        _1549 = _1583;
    }
    float _1585 = _1549;
    float _1587 = _1585;
    if (_1499)
    {
        float _1589 = _1521 * _1577;
        _1567 = _1589;
    }
    float _1591 = _1567;
    if (!_1499)
    {
        _1579 = _1561;
    }
    float _1593 = _1579;
    float _1595 = _1593;
    if (_1499)
    {
        float _1597 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1597;
    }
    float _1599 = _1335;
    if (_1499)
    {
        float _1601 = _1487 * _1591;
        _1573 = _1601;
    }
    float _1603 = _1573;
    if (!_1499)
    {
        _1587 = _1489;
    }
    float _1605 = _1587;
    float _1607 = _1605;
    if (_1499)
    {
        float _1609 = _1489 * _1591;
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (!_1499)
    {
        _1523 = _1491;
    }
    float _1613 = _1523;
    float _1615 = _1613;
    if (_1499)
    {
        float _1617 = fma(_1561, _1555, _1599);
        _1595 = _1617;
    }
    float _1619 = _1595;
    if (_1499)
    {
        float _1621 = _1603 * _1603;
        _1615 = _1621;
    }
    float _1623 = _1615;
    if (!_1499)
    {
        _1581 = _1493;
    }
    float _1625 = _1581;
    float _1627 = _1625;
    if (_1499)
    {
        float _1629 = _1611 * _1611;
        _1627 = _1629;
    }
    float _1631 = _1627;
    float _1633 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1635 = fma(_1619, _1619, _1623);
    float _1637 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1639 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1633);
    float _1641 = _1635 + _1631;
    float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1645 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1643);
    float _1647 = precise::clamp(_1645, 0.0, 1.0);
    float _1649 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1639);
    float _1651 = rsqrt(_1641);
    float _1653 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1637);
    float _1655 = -_1647;
    float _1657 = _1655 + 1.0;
    float _1659 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1661 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1663 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1653);
    float _1665 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1667 = fma(_649, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1669 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1671 = abs(_1657);
    float _1673 = log2(_1671);
    float _1675 = -_1665;
    float _1677 = fma(_1675, _1661, 1.0);
    float _1679 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1681 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1669);
    float _1683 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1685 = _1651 * _1603;
    float _1687 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1679);
    float _1689 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1681);
    float _1691 = _1651 * _1619;
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1695 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1687);
    float _1697 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1699 = _1651 * _1611;
    float _1701 = floor(_1477);
    float _1703 = -_1693;
    float _1705 = fma(_1691, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1703);
    float _1707 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1709 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1711 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1713 = -_1699;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1705);
    float _1717 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1709);
    float _1719 = floor(_1667);
    float _1721 = fma(_1715, -0.5, 0.5);
    float _1723 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1717);
    float _1725 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1723);
    float _1727 = exp2(_1711);
    float _1729 = -_1701;
    float _1731 = _1477 + _1729;
    float _1733 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1735 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1737 = log2(_1677);
    float _1739 = -_1719;
    float _1741 = _1667 + _1739;
    float _1743 = 1.0 / _1725;
    float _1745 = fma(_1715, 0.5, 0.5);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1733);
    float _1749 = fma(_1745, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1751 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1753 = sqrt(_1721);
    float _1755 = fma(_1745, _1749, -0.212114393711090087890625);
    float _1757 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1751);
    float _1759 = _1737 * 0.693147182464599609375;
    float2 _5526 = float2(_1731, _1741);
    float _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5526, float2(0.0), isnan(_5526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5526, float2(0.0), isnan(_5526)), level(0.0)).x;
    float _1763 = fma(_1745, _1755, 1.570728778839111328125);
    float _1765 = _1759 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1767 = _1757 * _1743;
    float _1769 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1735);
    float _1771 = _1691 + 1.0;
    float _1773 = fma(_1767, 0.5, 0.5);
    float _1775 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1769);
    float _1777 = -_1691;
    float _1779 = fma(_1727, _1771, _1777);
    float _1781 = _1753 * 0.636619746685028076171875;
    float _1783 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1775);
    float _1785 = -_1763;
    float _1787 = fma(_1781, _1785, 1.0);
    float _1789 = _1783 * _1743;
    float _1791 = fma(_1779, 0.5, 0.5);
    float _1793 = fma(_1789, -0.5, 0.5);
    float3 _5588 = float3(_1773, _1793, _1765);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5588, float3(0.0), isnan(_5588)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5588, float3(0.0), isnan(_5588)), level(0.0)).x;
    float3 _5599 = float3(_1773, _1793, _1765);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5599, float3(0.0), isnan(_5599)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5599, float3(0.0), isnan(_5599)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _5615 = float2(_1787, _1791);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5615, float2(0.0), isnan(_5615)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float _1818 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1822 = _1820 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1826 = _1824 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1828 = _305 > 0.5;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1832 = _1830 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1834 = 1.0 / _1822;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1838 = _1836 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1846 = _1844 != 0;
    float _1848 = 1.0 / _1826;
    int _1850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1852 = _1850 != 0;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1860 = _1858 != 0;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1868 = _1866 != 0;
    bool _1870 = _311 > 0.5;
    float _1872 = 1.0 / _1832;
    float _1874 = -_725;
    int _1876 = _1828 ? as_type<int>(_1874) : as_type<int>(_725);
    bool _1878 = _309 > 0.5;
    float _1880 = 1.0 / _1838;
    bool _1882 = _307 > 0.5;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1888;
    float _1892 = 1.0 / _1842;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1894;
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1900 = _1898 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1902 = _1890 * _1834;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1908 = _1896 * _1848;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1912 = _1910 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1914 = 1.0 / _1856;
    float _1916 = _1900 * _1872;
    float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1918;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1926 = _1920 * _1880;
    bool _1928 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1930 = isnan(_165);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = 1.0 / _1864;
    float _1942 = _1924 * _1892;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1950 = _1948 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1952;
    bool _1956 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1958 = isnan(_303);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = 1.0 / _1886;
    float _1970 = _1946 * _1914;
    bool _1972 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1974 = isnan(_165);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1980 = _1976 || _1978;
    float _1982 = float(_1980);
    bool _1984 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1986 = isnan(_165);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    bool _1996 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1998 = isnan(_303);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = -_1982;
    float _2010 = _2008 + 1.0;
    float _2012 = 1.0 / _1906;
    float _2014 = _1950 * _1940;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _2020 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2022 = isnan(_165);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2028 = _2024 || _2026;
    float _2030 = float(_2028);
    float _2032 = -_1994;
    float _2034 = _2032 + 1.0;
    float _2036 = -_2006;
    float _2038 = _2036 + 1.0;
    bool _2040 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2042 = isnan(_303);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2048 = _2044 || _2046;
    float _2050 = float(_2048);
    float _2052 = 1.0 / _1912;
    float _2054 = _2018 * _1968;
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2058 = _303 + _2056;
    float _2060 = -_2030;
    float _2062 = _2060 + 1.0;
    float _2064 = _2050 * _2038;
    float _2066 = -_2050;
    float _2068 = _2066 + 1.0;
    float _2070 = fma(_1902, _2058, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2072 = !_1846;
    float _2074 = _2072 ? _725 : as_type<float>(_1876);
    float _2076 = _1954 * _2012;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2078;
    bool _2082 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2084 = isnan(_165);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    float _2094 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2096 = _165 + _2094;
    float _2098 = _2070 * _2064;
    float _2100 = _2074 + 0.5;
    float _2102 = exp2(_1818);
    float _2104 = _2092 * _2062;
    float _2106 = _2080 * _2052;
    bool _2108 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2110 = isnan(_165);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    float _2120 = -_2092;
    float _2122 = _2120 + 1.0;
    float _2124 = fma(_1926, _2096, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _2126 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2128 = isnan(_165);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2134 = _2130 || _2132;
    float _2136 = float(_2134);
    float _2138 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2098);
    float _2140 = _2118 * _2122;
    float _2142 = -_2118;
    float _2144 = _2142 + 1.0;
    bool _2146 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2148 = isnan(_303);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = -_2136;
    float _2160 = _2158 + 1.0;
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2164 = _165 + _2162;
    float _2166 = _1938 * _2144;
    float _2168 = -_1938;
    float _2170 = _2168 + 1.0;
    float _2172 = -_2156;
    float _2174 = _2172 + 1.0;
    float _2176 = fma(_2076, _2164, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2178 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2180 = _2136 * _2170;
    float _2182 = _1966 * _2174;
    float _2184 = -_1966;
    float _2186 = _2184 + 1.0;
    float _2188 = _1982 * _2160;
    bool _2190 = _165 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2192 = isnan(_165);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2198 = _2194 || _2196;
    float _2200 = float(_2198);
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2204 = _303 + _2202;
    float _2206 = _2006 * _2186;
    float _2208 = _1994 * _2010;
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2212 = _303 + _2210;
    float _2214 = _2200 * _2034;
    float _2216 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2218 = _165 + _2216;
    float _2220 = -_2200;
    float _2222 = _2220 + 1.0;
    float _2224 = fma(_1916, _2212, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2226 = _2124 * _2214;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2230 = _165 + _2228;
    float _2232 = fma(_1942, _2218, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2234 = fma(_1908, _2204, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2236 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2226);
    float _2238 = fma(_1970, _2230, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2242 = _165 + _2240;
    float _2244 = fma(_2224, _2206, _2138);
    float _2246 = fma(_2232, _2208, _2236);
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2250 = _165 + _2248;
    float _2252 = fma(_2014, _2242, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2254 = fma(_2234, _2182, _2244);
    float _2256 = fma(_2238, _2188, _2246);
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2260 = _165 + _2258;
    float _2262 = fma(_2054, _2250, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2266 = fma(_2252, _2180, _2256);
    float _2268 = fma(_2106, _2260, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2270 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2254);
    float _2272 = -_725;
    int _2274 = _1878 ? as_type<int>(_2272) : as_type<int>(_725);
    float _2276 = fma(_2176, _2166, _2266);
    float _2278 = -_675;
    int _2280 = _1882 ? as_type<int>(_2278) : as_type<int>(_675);
    float _2282 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2286 = fma(_2262, _2140, _2276);
    bool _2288 = !_1852;
    float _2290 = _2288 ? _675 : as_type<float>(_2280);
    float _2292 = _761 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2294 = !_1860;
    float _2296 = _2294 ? _725 : as_type<float>(_2274);
    float _2298 = fma(_2268, _2104, _2286);
    float _2300 = -_675;
    int _2302 = _1870 ? as_type<int>(_2300) : as_type<int>(_675);
    float _2304 = -_2290;
    float _2306 = _2304 + 0.5;
    float _2308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2310 = _2296 + 0.5;
    bool _2312 = !_1868;
    float _2314 = _2312 ? _675 : as_type<float>(_2302);
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2318 = _2178 * _2264;
    float _2320 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2322 = -_2314;
    float _2324 = _2322 + 0.5;
    float _2326 = abs(_1341);
    float _2328 = log2(_2326);
    float _2330 = _2316 * _2284;
    float _2332 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2336 = _761 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2342 = _2320 * _2308;
    float _2344 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2346 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2348 = _761 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2350 = -_745;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2356 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2358 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2298);
    float _2360 = -_745;
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2348);
    float _2364 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2366 = -_745;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    float _2370 = _675 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2372 = exp2(_2356);
    float _2374 = _779 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2376 = _2332 * _2340;
    out.m_64.x = _2364;
    out.m_64.y = _2344;
    out.m_64.z = _2346;
    out.m_64.w = _2282;
    bool _2378 = _1341 <= 8000.0;
    bool _2380 = isnan(_1341);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan(8000.0);
    bool _2386 = _2382 || _2384;
    float _2388 = float(_2386);
    float _2390 = _725 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2392 = -_2102;
    float _2394 = _2392 + 1.0;
    out.m_66.x = _2318;
    out.m_66.y = _2330;
    out.m_66.z = _2342;
    out.m_66.w = _2376;
    float _2396 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2358;
    bool _2398 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2400 = isnan(_1483);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2406 = _2402 || _2404;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2410 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = _789 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2416 = _789 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2418 = _789 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2420 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    float _2422 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2352);
    float _2424 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2374);
    float _2426 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2414);
    float _2428 = _2370 * _2422;
    float _2430 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2432 = fma(_2412, -2.0, 3.0);
    float _2434 = _2412 * _2412;
    float _2436 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2416);
    float _2438 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2430);
    float _2440 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2418);
    float _2442 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2424);
    float _2444 = _779 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2446 = _2434 * _2432;
    float _2448 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2426);
    float _2450 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2438);
    float _2452 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2440);
    float _2454 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2444);
    float _2456 = -_2446;
    float _2458 = _2456 + 1.0;
    float _2460 = in.m_70.x;
    float _2462 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2450);
    float _2464 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2454);
    float _2466 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2446);
    float _2468 = _2370 * _2420;
    float _2470 = _2462 + _1725;
    float _2472 = _779 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2474 = _2388 * _2466;
    float _2476 = fma(_2390, _2442, _2428);
    float _2478 = _2470 * 0.5;
    float _2480 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2436);
    float _2482 = fma(_2390, _2464, _2468);
    float _2484 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2472);
    float _2486 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2488 = _2448 + _2476;
    float _2490 = _2480 + _2482;
    float _2492 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2368);
    float _2494 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2484);
    out.m_72.w = _2408;
    float _2496 = _2370 * _2492;
    out.m_74.z = _2478;
    out.m_74.w = _1725;
    float _2498 = fma(_2390, _2494, _2496);
    out.gl_Position.x = _1757;
    out.gl_Position.y = _1783;
    out.gl_Position.z = _2462;
    out.gl_Position.w = _1725;
    float _2500 = _2452 + _2498;
    out.m_76.x = _2488;
    out.m_76.y = _2490;
    out.m_76.z = _2500;
    float _2502 = _1397 * _1459;
    float _2504 = -_1761;
    float _2506 = _2504 + 1.0;
    float _2508 = _1725;
    float _2510 = _2462;
    float _2512 = _1783;
    float _2514 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2516 = _2502;
    if (!_2406)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2518 = _2508;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2406)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2524 = _2510;
    float _2526 = _2506 * _2486;
    float _2528 = precise::clamp(_2526, 0.0, 1.0);
    float _2530 = _2524;
    float _2532 = _2524;
    if (!_2406)
    {
        _2512 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2534 = _2512;
    float _2536 = -_2528;
    float _2538 = fma(_2536, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2540 = _2534;
    float _2542 = _2534;
    if (!_2406)
    {
        _2514 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2544 = _2514;
    float _2546 = _2538 * _2460;
    float _2548 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2550 = _2546;
    float _2552 = _2544;
    float _2554 = _2544;
    if (!_2406)
    {
        _2516 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2556 = _2516;
    float _2558 = _2546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2560 = _2556;
    float _2562 = _2556;
    if (!_2406)
    {
        _2550 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2564 = _2550;
    out.m_78.x = _2558;
    float _2566 = _2396 * _1795;
    float _2568 = -_2396;
    float _2570 = _2568 + 1.0;
    float _2572 = _1806 * _2566;
    float _2574 = _1816 * _2566;
    float _2576 = _1806 * _2570;
    float _2578 = fma(_1812, _2572, _1800);
    float _2580 = fma(_1814, _2572, _1802);
    float _2582 = fma(_1806, _2574, _1804);
    out.m_80.x = _2578;
    out.m_80.y = _2580;
    out.m_80.z = _2582;
    out.m_80.w = _2576;
    bool _2584 = !_2406;
    float _2586 = _2564;
    float _2588 = _2564;
    if (!_2584)
    {
        bool _2590 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2592 = isnan(_1483);
        bool _2594 = _2590 || _2592;
        bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2598 = _2594 || _2596;
        if (!_2598)
        {
            float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2602 = _1483 + _2600;
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2606 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2604;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2612 = 1.0 / _2606;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2630 = _2602 * _2612;
            float _2632 = precise::clamp(_2630, 0.0, 1.0);
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2638 = fma(_2632, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2640 = fma(_2632, _2636, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2642 = fma(_2632, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2644 = fma(_2632, _2620, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2646 = fma(_2632, _2624, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2648 = fma(_2632, _2628, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2588 = _2642;
            _2542 = _2646;
            _2554 = _2638;
            _2532 = _2644;
            _2522 = _2640;
            _2562 = _2648;
            _2650 = true;
        }
        else
        {
            bool _2652 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2654 = isnan(_1483);
            bool _2656 = _2652 || _2654;
            bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2660 = _2656 || _2658;
            if (!_2660)
            {
                _2552 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2662 = _2552;
            _2554 = _2662;
            if (!_2660)
            {
                _2586 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2664 = _2586;
            _2588 = _2664;
            if (!_2660)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2666 = _2520;
            _2522 = _2666;
            if (!_2660)
            {
                _2530 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2668 = _2530;
            _2532 = _2668;
            if (!_2660)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2670 = _2540;
            _2542 = _2670;
            if (!_2660)
            {
                _2560 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2672 = _2560;
            bool _2674 = !_2660;
            _2562 = _2672;
            if (!_2674)
            {
                bool _2676 = _1483 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2678 = isnan(_1483);
                bool _2680 = _2676 || _2678;
                bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2684 = _2680 || _2682;
                if (!_2684)
                {
                    float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2688 = _1483 + _2686;
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2692 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2690;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2698 = 1.0 / _2692;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2716 = _2688 * _2698;
                    float _2718 = precise::clamp(_2716, 0.0, 1.0);
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2724 = fma(_2718, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2726 = fma(_2718, _2722, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2728 = fma(_2718, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2730 = fma(_2718, _2706, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2732 = fma(_2718, _2710, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2734 = fma(_2718, _2714, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2588 = _2728;
                    _2542 = _2732;
                    _2554 = _2724;
                    _2532 = _2730;
                    _2522 = _2726;
                    _2562 = _2734;
                    _2650 = true;
                }
                else
                {
                    _2588 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2554 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2532 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2562 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2650 = false;
    float _2736 = _2588;
    float _2738 = _2542;
    float _2740 = _2554;
    float _2742 = _2532;
    float _2744 = _2522;
    float _2746 = _2562;
    float _2748 = _2548 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2750 = fma(_2490, -0.5, 0.5);
    float _2752 = precise::clamp(_2750, 0.0, 1.0);
    float _2754 = -_2736;
    float _2756 = _2754 + _2738;
    float _2758 = -_2740;
    float _2760 = _2758 + _2742;
    out.m_49.x = _2748;
    float _2762 = fma(_2752, _2756, _2736);
    float _2764 = -_2744;
    float _2766 = _2764 + _2746;
    float _2768 = fma(_2752, _2760, _2740);
    float _2770 = _2762 * 0.586610972881317138671875;
    bool _2772 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2774 = fma(_2752, _2766, _2744);
    out.m_82.x = 0.0;
    float _2776 = fma(_2768, 0.298911988735198974609375, _2770);
    bool _2778 = _1397 > 0.0;
    bool _2780 = isnan(_1397);
    bool _2782 = _2778 || _2780;
    bool _2784 = isnan(0.0);
    bool _2786 = _2782 || _2784;
    float _2788 = fma(_2774, 0.114477999508380889892578125, _2776);
    bool _2790 = _1459 <= 0.0;
    bool _2792 = !_2786;
    bool _2794 = _2790 || _2792;
    float _2796 = -_2788;
    float _2798 = _2768 + _2796;
    float _2800 = -_2788;
    float _2802 = _2762 + _2800;
    float _2804 = -_2788;
    float _2806 = _2774 + _2804;
    float _2808 = fma(_2798, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2810 = fma(_2802, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    float _2812 = fma(_2806, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2788);
    bool _2814 = !_2772;
    if (!_2814)
    {
        float _2816 = -_1323;
        float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2820 = -_1325;
        float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2824 = -_1327;
        float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2828 = _2818 * _2818;
        float _2830 = fma(_2822, _2822, _2828);
        float _2832 = fma(_2826, _2826, _2830);
        float _2834 = sqrt(_2832);
        float _2836 = rsqrt(_2832);
        float _2838 = -_2834;
        float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2844 = precise::clamp(_2842, 0.0, 1.0);
        float _2846 = _2822 * _2836;
        float _2848 = _2818 * _2836;
        float _2850 = abs(_2844);
        float _2852 = log2(_2850);
        float _2854 = _2826 * _2836;
        float _2856 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2858 = _2490 * _2848;
        float _2860 = -_2848;
        float _2862 = -_2856;
        float _2864 = fma(_2860, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2862);
        float _2866 = fma(_2488, _2846, _2858);
        float _2868 = -_2854;
        float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2864);
        float _2872 = fma(_2500, _2854, _2866);
        float _2874 = precise::clamp(_2872, 0.0, 1.0);
        float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2878 = _2870 + _2876;
        float _2880 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2884 = precise::clamp(_2882, 0.0, 1.0);
        float _2886 = exp2(_2880);
        float _2888 = _2886 * _2884;
        float _2890 = _2874 * _2888;
        float _2892 = _2890 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2894 = _2890 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2896 = _2890 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2892;
        out.m_82.y = _2894;
        out.m_82.z = _2896;
    }
    out.m_84.x = _2808;
    out.m_84.y = _2810;
    out.m_84.z = _2812;
    if (!_2794)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2898 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2898;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

