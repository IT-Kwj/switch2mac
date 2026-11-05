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
    float4 m_64 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_74 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
    float4 m_62 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _881 = false;
    bool _525 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_42.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_45.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3054 = as_type<float>(_109);
        out.gl_Position.z = _3054;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_47.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3124 = as_type<float>(_147);
        out.gl_Position.z = _3124;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_52.x;
    float _153 = in.m_52.y;
    float _155 = in.m_52.z;
    float _157 = in.m_54.x;
    float _159 = in.m_54.y;
    float _161 = in.m_54.z;
    float _163 = in.m_56.x;
    float _165 = in.m_56.y;
    float _167 = in.m_56.z;
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    int _175 = as_type<int>(_149) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_149) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _185 = !_177;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_181;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _153 * _159;
    float _195 = _153 * _165;
    float _197 = fma(_151, _157, _193);
    float _199 = _153 * _171;
    float _201 = fma(_151, _163, _195);
    float _203 = fma(_155, _161, _197);
    float _205 = fma(_151, _169, _199);
    float _207 = fma(_155, _167, _201);
    float _209 = fma(_155, _173, _205);
    bool _211 = !_183;
    float _213 = _167;
    float _215 = _207;
    float _217 = _203;
    float _219 = _209;
    float _237;
    if (!_211)
    {
        float _221 = in.m_60.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_93);
        float _243 = 1.0 / _241;
        float _245 = _127 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _247 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _269;
    float _273 = 1.0 / _259;
    float _275 = 1.0 / _255;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _247 + _277;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _267;
    float _285 = _251 * _273;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _247 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _247 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = 1.0 / _271;
    float _301 = _289 * _275;
    bool _303 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _305 = isnan(_247);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    bool _315 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _317 = isnan(_247);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = fma(_297, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = 1.0 / _263;
    float _331 = _293 * _283;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _335 = _247 + _333;
    float _337 = _335 * _299;
    bool _339 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _341 = isnan(_247);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    float _355 = _279 * _329;
    bool _357 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_247);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_313;
    float _371 = _369 + 1.0;
    float _373 = -_349;
    float _375 = _373 + 1.0;
    float _377 = fma(_353, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _379 = -_367;
    float _381 = _379 + 1.0;
    float _383 = _349 * _371;
    float _385 = _367 * _375;
    bool _387 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_247);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = _325 * _381;
    float _401 = -_325;
    float _403 = _401 + 1.0;
    bool _405 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_247);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = _397 * _403;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = fma(_419, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _437 = fma(_423, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = _415 * _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _445;
    float _449 = _377 * _439;
    float _451 = _327 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _457 = fma(_443, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _463 = fma(_447, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _465 = fma(_435, _425, _459);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _471 = fma(_437, _425, _461);
    float _473 = fma(_455, _331, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _475;
    float _479 = fma(_457, _399, _465);
    float _481 = fma(_469, _331, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _483;
    float _487 = fma(_463, _399, _471);
    float _489 = fma(_477, _337, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _491 = fma(_473, _385, _479);
    float _493 = fma(_485, _337, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _495 = fma(_481, _385, _487);
    float _497 = fma(_489, _383, _491);
    float _499 = fma(_493, _383, _495);
    float _501 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].x, _497);
    float _503 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].y, _499);
    bool _505 = !_281;
    float _523;
    if (!_505)
    {
        float _507 = in.m_60.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _511 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _513 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _515 = _513 * _509;
        float _517 = floor(_515);
        float _519 = -_517;
        float _521 = _515 + _519;
        _523 = _521;
        _525 = true;
    }
    else
    {
        float _527 = float(_93);
        float _529 = 1.0 / _527;
        float _531 = _127 * _529;
        _523 = _531;
    }
    _525 = false;
    float _533 = _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _537 = _533 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _541 = _533 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _559 = 1.0 / _545;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _561;
    bool _565 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _567 = isnan(_533);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = 1.0 / _549;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _581 = _533 + _579;
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _585;
    float _589 = 1.0 / _563;
    float _591 = _581 * _559;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _595 = _533 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _599 = _533 + _597;
    float _601 = 1.0 / _557;
    float _603 = _595 * _577;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _605;
    bool _609 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _611 = isnan(_533);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _625;
    float _629 = 1.0 / _553;
    float _631 = _599 * _589;
    float _633 = fma(_607, _591, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _635 = fma(_627, _591, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _641 = fma(_623, _603, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _643;
    float _647 = _537 * _601;
    bool _649 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _651 = isnan(_533);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -_619;
    float _663 = _661 + 1.0;
    float _665 = fma(_645, _591, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _667 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _669 = isnan(_533);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _683 = -_659;
    float _685 = _683 + 1.0;
    float _687 = _659 * _663;
    float _689 = _541 * _629;
    bool _691 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _693 = isnan(_533);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = fma(_681, _603, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _705 = fma(_639, _603, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _707 = _701 * _685;
    float _709 = -_701;
    float _711 = _709 + 1.0;
    bool _713 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _715 = isnan(_533);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = _677 * _711;
    float _727 = -_677;
    float _729 = _727 + 1.0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _731;
    float _735 = _723 * _729;
    float _737 = -_723;
    float _739 = _737 + 1.0;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _741;
    float _745 = fma(_733, _689, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _751 = _575 * _739;
    float _753 = -_575;
    float _755 = _753 + 1.0;
    float _757 = fma(_743, _689, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _759 = fma(_587, _689, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _761 = _665 * _751;
    float _763 = _633 * _751;
    float _765 = _635 * _751;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[107].y, _761);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _777 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[107].x, _763);
    float _779 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[107].z, _765);
    float _781 = fma(_769, _647, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _783 = fma(_703, _735, _771);
    float _785 = fma(_775, _647, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _787 = fma(_641, _735, _777);
    float _789 = fma(_705, _735, _779);
    float _791 = fma(_757, _725, _787);
    float _793 = fma(_745, _725, _783);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _799;
    float _803 = fma(_749, _647, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _805;
    float _809 = fma(_759, _725, _789);
    float _811 = fma(_797, _631, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _813 = fma(_801, _631, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _815 = fma(_807, _631, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _817 = fma(_781, _707, _791);
    float _819 = fma(_785, _707, _793);
    float _821 = fma(_803, _707, _809);
    float _823 = fma(_811, _687, _817);
    float _825 = fma(_813, _687, _819);
    float _827 = fma(_815, _687, _821);
    float _829 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[112].x, _823);
    float _831 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[112].y, _825);
    float _833 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[112].z, _827);
    float _835 = in.m_62.x;
    float _837 = in.m_62.y;
    float _839 = _829 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _841 = _831 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _843 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _847 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _847;
    out.m_64.y = _849;
    out.m_64.z = _851;
    out.m_64.w = _845;
    float _853 = _503 * _837;
    float _855 = _501 * _835;
    bool _857 = !_583;
    float _877;
    float _879;
    if (!_857)
    {
        float _859 = in.m_60.x;
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _863 = float(_93);
        float _865 = _859 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _869 = _867 * _861;
        float _871 = floor(_869);
        float _873 = -_871;
        float _875 = _869 + _873;
        _877 = _875;
        _879 = _863;
        _881 = true;
    }
    else
    {
        float _883 = float(_93);
        float _885 = 1.0 / _883;
        float _887 = _127 * _885;
        _877 = _887;
        _879 = _883;
    }
    _881 = false;
    float _889 = _877;
    float _891 = _879;
    float _893 = in.m_60.z;
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _897 = int(_895);
    float _899 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _901 = in.m_60.x;
    float _903 = in.m_60.y;
    float _905 = _855 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _907 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _909 = log2(_907);
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _917 = 1.0 + _915;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _921 = 1.0 / _917;
    float _923 = _893 * 2.0;
    float _925 = _901 * 2.0;
    float _927 = _903 * 2.0;
    float _929 = floor(_923);
    float _931 = _901 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _933 = _903 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _935 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[78].w, _919);
    float _937 = -_911;
    float _939 = fma(_931, 2.0, _937);
    float _941 = fma(_933, -2.0, _913);
    float _943 = floor(_925);
    float _945 = _903 + _901;
    float _947 = _945 + (-1.0);
    bool _949 = _929 >= 0.0;
    bool _951 = isnan(_929);
    bool _953 = _949 || _951;
    bool _955 = isnan(0.0);
    bool _957 = _953 || _955;
    float _959 = floor(_927);
    float _961 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _963 = float(_897);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _967 = _965 != 0;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _975 = _973 != 0;
    int _977 = _957 ? 0 : 1;
    bool _979 = _943 > 0.0;
    float _981 = 1.0 / _963;
    bool _983 = !_971;
    int _985 = _983 ? 0 : 1;
    bool _987 = _929 > 0.0;
    bool _989 = _943 >= 0.0;
    bool _991 = isnan(_943);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = _909 * _127;
    bool _1001 = _959 > 0.0;
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1005 = int(_1003);
    bool _1007 = _959 >= 0.0;
    bool _1009 = isnan(_959);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan(0.0);
    bool _1015 = _1011 || _1013;
    int _1017 = ~_977;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    bool _1023 = !_967;
    int _1025 = _1023 ? 0 : 1;
    bool _1027 = !_975;
    int _1029 = _1027 ? 0 : 1;
    float _1031 = exp2(_999);
    int _1033 = _1021;
    if (!_987)
    {
        int _1035 = ~_977;
        int _1037 = _1035 + 1;
        _1033 = _1037;
    }
    int _1039 = _1033;
    float _1041 = _981 * _127;
    float _1043 = in.m_66.x;
    float _1045 = in.m_66.y;
    float _1047 = in.m_66.z;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1059 = _1057 != 0;
    float _1061 = float(_1039);
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1065 = _997 ? 0 : 1;
    float _1067 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _935);
    bool _1069 = !_1051;
    int _1071 = _1069 ? 0 : 1;
    float _1073 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1063);
    float _1075 = -_127;
    float _1077 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[76].x, _939);
    bool _1079 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1081 = isnan(1.0);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1087 = _1083 || _1085;
    int _1089 = abs(_1071);
    float _1091 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1073);
    float _1093 = -_1031;
    float _1095 = _1093 + 1.0;
    float _1097 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _941);
    bool _1099 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1089);
    bool _1111 = !_1055;
    int _1113 = _1111 ? 0 : 1;
    float _1115 = float(_1005);
    float _1117 = _1109 * _1061;
    float _1119 = _1107 ? _1095 : 0.0;
    float _1121 = _901 + (-0.5);
    int _1123 = ~_1065;
    int _1125 = _1123 + 1;
    int _1127 = _1125 + 1;
    float _1129 = _1117 * (-2.0);
    int _1131 = _1127;
    if (!_979)
    {
        int _1133 = ~_1065;
        int _1135 = _1133 + 1;
        _1131 = _1135;
    }
    int _1137 = _1131;
    float _1139 = _1115 * _127;
    int _1141 = abs(_1113);
    if (_1087)
    {
        float _1143 = _1119 * _921;
        _129 = _1143;
    }
    float _1145 = _129;
    float _1147 = fma(_1129, _1043, _1043);
    float _1149 = float(_1137);
    float _1151 = float(_1141);
    float _1153 = fma(_961, _1129, _961);
    int _1155 = _1015 ? 0 : 1;
    float _1157 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1147);
    bool _1159 = !_1059;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1151 * _1149;
    int _1165 = ~_1155;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    float _1171 = _903 + _893;
    int _1173 = _1169;
    if (!_1001)
    {
        int _1175 = ~_1155;
        int _1177 = _1175 + 1;
        _1173 = _1177;
    }
    int _1179 = _1173;
    float _1181 = fma(_1153, _1145, _1157);
    int _1183 = abs(_1161);
    float _1185 = _1171 + (-1.0);
    float _1187 = _1163 * (-2.0);
    float _1189 = float(_1179);
    float _1191 = _903 + (-0.5);
    float _1193 = float(_1183);
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1197 = fma(_1187, _1045, _1045);
    float _1199 = _893 + _901;
    float _1201 = _1193 * _1189;
    float _1203 = fma(_1195, _1187, _1195);
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1197);
    float _1207 = _1199 + (-1.0);
    float _1209 = _1201 * (-2.0);
    float _1211 = _1181 * 0.15915493667125701904296875;
    float _1213 = fma(_1203, _1145, _1205);
    float _1215 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1217 = fma(_1209, _1047, _1047);
    float _1219 = _893 + (-0.5);
    float _1221 = _1211 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = fma(_1215, _1209, _1215);
    float _1227 = _1213 * 0.15915493667125701904296875;
    float _1229 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1217);
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1233 = in.m_42.x;
    float _1235 = in.m_42.y;
    float _1237 = in.m_42.z;
    float _1239 = fma(_1225, _1145, _1229);
    float _1241 = _1211 * 6.283185482025146484375;
    float _1243 = cos(_1241);
    float _1245 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1247 = _899 * _1245;
    float _1249 = _905 * _1231;
    float _1251 = _1227 * 6.283185482025146484375;
    float _1253 = sin(_1251);
    float _1255 = _1239 * 0.15915493667125701904296875;
    float _1257 = _1227 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = _171 * _1235;
    float _1263 = _159 * _1235;
    float _1265 = _165 * _1235;
    float _1267 = _1255 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = _1223 * _1253;
    float _1273 = fma(_169, _1233, _1261);
    float _1275 = _1243 * _1253;
    float _1277 = fma(_157, _1233, _1263);
    float _1279 = fma(_163, _1233, _1265);
    float _1281 = fma(_173, _1237, _1273);
    float _1283 = _1255 * 6.283185482025146484375;
    float _1285 = sin(_1283);
    float _1287 = _1243 * _1259;
    float _1289 = fma(_161, _1237, _1277);
    float _1291 = _1281 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1293 = _1289 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1295 = _1269 * _1247;
    float _1297 = _1259 * _1269;
    float _1299 = _1223 * _1259;
    float _1301 = _1253 * _1269;
    float _1303 = _1243 * _1295;
    float _1305 = _1223 * _1295;
    float _1307 = fma(_1285, _1287, _1271);
    float _1309 = -_1247;
    float _1311 = _1285 * _1309;
    float _1313 = fma(_1285, _1271, _1287);
    float _1315 = fma(_1307, _1249, _1303);
    float _1317 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1319 = -_1299;
    float _1321 = fma(_1285, _1275, _1319);
    float _1323 = -_1275;
    float _1325 = fma(_1285, _1299, _1323);
    float _1327 = fma(_1297, _1249, _1311);
    float _1329 = fma(_1321, _1317, _1315);
    float _1331 = fma(_1325, _1249, _1305);
    float _1333 = fma(_1301, _1317, _1327);
    float _1335 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1337 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1339 = fma(_1313, _1317, _1331);
    float _1341 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1343 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1335);
    float _1345 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1337);
    float _1347 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1341);
    float _1349 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1343);
    float _1351 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1345);
    float _1353 = fma(_167, _1237, _1279);
    float _1355 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1347);
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1359 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1361 = _1353 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1363 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1365 = _1291 + _1357;
    float _1367 = _1293 + _1359;
    float _1369 = _1361 + _1363;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1373 = _1365 + _1371;
    float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1377 = _1367 + _1375;
    float _1379 = _1373 * _1373;
    float _1381 = fma(_1377, _1377, _1379);
    float _1383 = sqrt(_1381);
    bool _1385 = _1383 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1387 = _1355;
    float _1389 = _1363;
    float _1391 = _1373;
    float _1393 = _1367;
    if (!_1385)
    {
        _1387 = _1367;
    }
    float _1395 = _1387;
    float _1397 = _1395;
    if (!_1385)
    {
        _213 = _1365;
    }
    float _1399 = _213;
    float _1401 = _1399;
    if (!_1385)
    {
        _1389 = _1369;
    }
    float _1403 = _1389;
    bool _1405 = !_1385;
    float _1407 = _1403;
    if (!_1405)
    {
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1413 = _1383 + _1411;
        float _1415 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = rsqrt(_1381);
        float _1419 = _1413 * _1409;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1421 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1425 + (-1.0);
        float _1433 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1435 = fma(_1429, _1415, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1437 = fma(_1369, _1425, _1433);
        float _1439 = _1417 * _1435;
        float _1441 = fma(_1377, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1443 = fma(_1373, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1407 = _1437;
        _1397 = _1441;
        _1401 = _1443;
    }
    float _1445 = _1407;
    float _1447 = _1397;
    float _1449 = _1401;
    float _1451 = -_1361;
    float _1453 = _1451 + _1445;
    float _1455 = -_1293;
    float _1457 = _1455 + _1447;
    float _1459 = -_1291;
    float _1461 = _1459 + _1449;
    float _1463 = _1453 * _1453;
    bool _1465 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1467 = isnan(0.5);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1473 = _1469 || _1471;
    float _1475 = fma(_1457, _1457, _1463);
    float _1477 = fma(_1461, _1461, _1475);
    float _1479 = sqrt(_1477);
    bool _1481 = _1479 > 0.0;
    float _1483 = _1445;
    float _1485 = _1449;
    float _1487 = _1447;
    if (!_1481)
    {
        _1391 = _1447;
    }
    float _1489 = _1391;
    bool _1491 = !_1481;
    float _1493 = _1489;
    if (!_1491)
    {
        float _1495 = _207 * _207;
        float _1497 = fma(_203, _203, _1495);
        float _1499 = fma(_209, _209, _1497);
        float _1501 = rsqrt(_1477);
        float _1503 = sqrt(_1499);
        float _1505 = _1457 * _1501;
        float _1507 = _1453 * _1501;
        float _1509 = _1461 * _1501;
        bool _1511 = _1503 > 0.0;
        float _1513 = _1503;
        _1393 = _1507;
        if (!_1511)
        {
            _1513 = _1447;
        }
        float _1515 = _1513;
        bool _1517 = !_1511;
        _1493 = _1515;
        if (!_1517)
        {
            float _1519 = rsqrt(_1499);
            float _1521 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1523 = _207 * _1519;
            float _1525 = _203 * _1519;
            float _1527 = _1507 * _1523;
            float _1529 = _209 * _1519;
            float _1531 = fma(_1505, _1525, _1527);
            float _1533 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1535 = fma(_1509, _1529, _1531);
            float _1537 = _1535 * _1533;
            float _1539 = fma(_203, _1537, _1447);
            float _1541 = fma(_207, _1537, _1445);
            float _1543 = fma(_209, _1537, _1449);
            _1493 = _1539;
            _1483 = _1541;
            _1485 = _1543;
        }
    }
    float _1545 = _1493;
    float _1547 = _1483;
    float _1549 = _1485;
    float _1551 = _1393;
    float _1553 = _1549;
    float _1555 = _1551;
    if (_1473)
    {
        _215 = _1545;
    }
    float _1557 = _215;
    float _1559 = _1557;
    if (_1473)
    {
        _1487 = _1547;
    }
    float _1561 = _1487;
    float _1563 = _1561;
    if (_1473)
    {
        _217 = _1549;
    }
    float _1565 = _217;
    float _1567 = _1565;
    if (!_1473)
    {
        float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1571 = _1361 + _1569;
        float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1575 = _1293 + _1573;
        float _1577 = -_1293;
        float _1579 = _1577 + _1545;
        float _1581 = -_1361;
        float _1583 = _1581 + _1547;
        float _1585 = _1571 * _1571;
        float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1589 = _1291 + _1587;
        float _1591 = -_1291;
        float _1593 = _1591 + _1549;
        float _1595 = fma(_1575, _1575, _1585);
        float _1597 = fma(_1589, _1589, _1595);
        float _1599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1601 = sqrt(_1597);
        float _1603 = precise::min(_1601, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1605 = _1603 * _1599;
        float _1607 = fma(_1579, _1605, _1293);
        float _1609 = fma(_1583, _1605, _1361);
        float _1611 = fma(_1593, _1605, _1291);
        _1563 = _1609;
        _1559 = _1607;
        _1567 = _1611;
        _219 = _1601;
        _1553 = _1593;
    }
    float _1613 = _1563;
    float _1615 = _1559;
    float _1617 = _1567;
    float _1619 = _219;
    float _1621 = _1553;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1625 = _1613 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1629 = _1615 + _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1633 = _1617 + _1631;
    float _1635 = _1625 * _1625;
    float _1637 = fma(_1629, _1629, _1635);
    float _1639 = fma(_1633, _1633, _1637);
    float _1641 = rsqrt(_1639);
    float _1643 = sqrt(_1639);
    float _1645 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1647 = _1629 * _1645;
    float _1649 = _1633 * _1645;
    float _1651 = _1647 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 + _1653;
    float _1657 = sqrt(_1655);
    bool _1659 = _1657 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = _1657 + _1661;
    float _1665 = _1641;
    float _1667 = _1663;
    float _1669 = _1619;
    float _1671 = _1625;
    if (_1659)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1673;
    }
    float _1675 = _1665;
    float _1677 = _1675;
    if (_1659)
    {
        float _1679 = _1663 * _1675;
        _1667 = _1679;
    }
    float _1681 = _1667;
    if (_1659)
    {
        float _1683 = rsqrt(_1655);
        _1677 = _1683;
    }
    float _1685 = _1677;
    float _1687 = _1685;
    if (_1659)
    {
        float _1689 = _1681 * 0.15915493667125701904296875;
        _1669 = _1689;
    }
    float _1691 = _1669;
    float _1693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1695 = _1633;
    float _1697 = _1691;
    if (_1659)
    {
        float _1699 = _1691 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        _1695 = _1701;
    }
    float _1703 = _1695;
    float _1705 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1707 = precise::max(0.0, _1693);
    float _1709 = _1621;
    float _1711 = _1707;
    if (_1659)
    {
        float _1713 = _1691 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1709 = _1715;
    }
    float _1717 = _1709;
    float _1719 = -_1645;
    float _1721 = -_1707;
    float _1723 = fma(_1625, _1719, _1721);
    if (_1659)
    {
        float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1725;
    }
    float _1727 = _1671;
    float _1729 = _1703;
    float _1731 = _1727;
    if (_1659)
    {
        float _1733 = fma(_1703, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1729 = _1733;
    }
    float _1735 = _1729;
    float _1737 = _1735;
    if (!_1659)
    {
        _1731 = _1723;
    }
    float _1739 = _1731;
    float _1741 = _1739;
    if (_1659)
    {
        float _1743 = _1685 * _1735;
        _1555 = _1743;
    }
    float _1745 = _1555;
    if (!_1659)
    {
        _1687 = _1647;
    }
    float _1747 = _1687;
    float _1749 = _1747;
    float _1751 = _1717;
    if (_1659)
    {
        float _1753 = _1717 + (-1.0);
        _1711 = _1753;
    }
    float _1755 = _1711;
    float _1757 = _1755;
    if (_1659)
    {
        float _1759 = _1647 * _1745;
        _1749 = _1759;
    }
    float _1761 = _1749;
    if (!_1659)
    {
        _1737 = _1651;
    }
    float _1763 = _1737;
    float _1765 = _1763;
    if (_1659)
    {
        float _1767 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1697 = _1767;
    }
    float _1769 = _1697;
    if (!_1659)
    {
        _1757 = _1649;
    }
    float _1771 = _1757;
    float _1773 = _1771;
    if (_1659)
    {
        float _1775 = _1649 * _1745;
        _1773 = _1775;
    }
    float _1777 = _1773;
    if (_1659)
    {
        float _1779 = _1761 * _1761;
        _1765 = _1779;
    }
    float _1781 = _1765;
    if (_1659)
    {
        float _1783 = fma(_1723, _1717, _1769);
        _1741 = _1783;
    }
    float _1785 = _1741;
    if (!_1659)
    {
        _1751 = _1653;
    }
    float _1787 = _1751;
    float _1789 = _1787;
    if (_1659)
    {
        float _1791 = _1777 * _1777;
        _1789 = _1791;
    }
    float _1793 = _1789;
    float _1795 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1797 = fma(_1785, _1785, _1781);
    float _1799 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1795);
    float _1801 = _1797 + _1793;
    float _1803 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1643, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1799);
    float _1813 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1815 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1803);
    float _1817 = rsqrt(_1801);
    float _1819 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1821 = -_1809;
    float _1823 = _1821 + 1.0;
    float _1825 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1827 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1813);
    float _1829 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1819);
    float _1831 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1815);
    float _1833 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1835 = abs(_1823);
    float _1837 = log2(_1835);
    float _1839 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1829);
    float _1841 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1827);
    float _1843 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1845 = -_1833;
    float _1847 = fma(_1845, _1705, 1.0);
    float _1849 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1851 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1853 = _1817 * _1761;
    float _1855 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1857 = _1817 * _1785;
    float _1859 = _1817 * _1777;
    float _1861 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1863 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1851);
    float _1865 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1867 = log2(_1847);
    float _1869 = -_1861;
    float _1871 = fma(_1857, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1869);
    float _1873 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1875 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1863);
    float _1877 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1865);
    float _1879 = -_1859;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1871);
    float _1883 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1885 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1875);
    float _1887 = exp2(_1873);
    float _1889 = fma(_1881, -0.5, 0.5);
    float _1891 = fma(_1881, 0.5, 0.5);
    float _1893 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1883);
    float _1895 = _1857 + 1.0;
    float _1897 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1877);
    float _1899 = fma(_1891, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1901 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1893);
    float _1903 = 1.0 / _1885;
    float _1905 = _1867 * 0.693147182464599609375;
    float _1907 = fma(_1891, _1899, -0.212114393711090087890625);
    float _1909 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1911 = fma(_1891, _1907, 1.570728778839111328125);
    float _1913 = sqrt(_1889);
    float _1915 = -_1857;
    float _1917 = fma(_1887, _1895, _1915);
    float _1919 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1897);
    float _1921 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1901);
    float _1923 = fma(_1917, 0.5, 0.5);
    float _1925 = _1919 * _1903;
    float _1927 = _1921 * _1903;
    float _1929 = fma(_1925, 0.5, 0.5);
    float _1931 = fma(_1927, -0.5, 0.5);
    float _1933 = _1913 * 0.636619746685028076171875;
    float _1935 = -_1911;
    float _1937 = fma(_1933, _1935, 1.0);
    float3 _5944 = float3(_1929, _1931, _1909);
    float _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5944, float3(0.0), isnan(_5944)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5944, float3(0.0), isnan(_5944)), level(0.0)).x;
    float3 _5955 = float3(_1929, _1931, _1909);
    float4 _1942 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5955, float3(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5955, float3(0.0), isnan(_5955)), level(0.0)).xyzw;
    float _1944 = _1942.x;
    float _1946 = _1942.y;
    float _1948 = _1942.z;
    float _1950 = _1942.w;
    float2 _5972 = float2(_1937, _1923);
    float3 _1954 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5972, float2(0.0), isnan(_5972)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5972, float2(0.0), isnan(_5972)), level(0.0)).xyz;
    float _1956 = _1954.x;
    float _1958 = _1954.y;
    float _1960 = _1954.z;
    float _1962 = float(uint(_1005));
    float _1964 = trunc(_1041);
    int _1966 = int(_1964);
    int _1968 = ~_1005;
    int _1970 = _1968 + 1;
    float _1972 = -_1091;
    float _1974 = _1972 + 1.0;
    int _1976 = abs(_985);
    float _1978 = -_1067;
    float _1980 = _1978 + 1.0;
    int _1982 = abs(_1029);
    bool _1984 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1986 = isnan(_889);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    float _1996 = 1.0 / _1962;
    float _1998 = float(uint(_1966));
    float _2000 = 1.0 / _891;
    int _2002 = ~_1005;
    int _2004 = _2002 + 1;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2006;
    int _2010 = as_type<int>(_1996) + (-2);
    float _2012 = as_type<float>(_2010) * _1998;
    float _2014 = _1139 * _2000;
    float _2016 = trunc(_2012);
    float _2018 = precise::max(_2016, 0.0);
    uint _2021 = uint(_2018);
    float _2023 = trunc(_2014);
    int _2025 = int(_2023);
    int _2027 = _1970 * int(_2021);
    int _2029 = _2027 + _1966;
    float _2031 = float(uint(_2029));
    float _2033 = as_type<float>(_2010) * _2031;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2037 = _2035 != 0;
    float _2039 = trunc(_2033);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    bool _2045 = !_2037;
    float _2047 = _2045 ? 7.345489978790283203125 : 1.0;
    float _2049 = _2047 * _901;
    float _2051 = floor(_2049);
    int _2053 = int(_2021) + int(_2043);
    float _2055 = float(_1966);
    int _2057 = _2004 * _2053;
    int _2059 = _2057 + _1966;
    bool _2061 = _2055 >= _1115;
    bool _2063 = isnan(_2055);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(_1115);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = -_2051;
    float _2075 = _2049 + _2073;
    bool _2077 = uint(_2059) >= uint(_1005);
    float _2079 = trunc(_2071);
    int _2081 = int(_2079);
    bool _2083 = !_2077;
    int _2085 = _2083 ? 0 : (-1);
    bool _2087 = _1005 == 0;
    int _2089 = ~_2053;
    int _2091 = _2089 + _2085;
    int _2093 = _2091 + 1;
    float _2095 = _2075 * _1115;
    int _2097 = _1005 + (-1);
    int _2099 = _1005 * _2093;
    int _2101 = _2099 + _1966;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2105 = _2103 != 0;
    float _2107 = trunc(_2095);
    int _2109 = int(_2107);
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2113 = _2111 != 0;
    int _2115 = ~_2081;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    bool _2121 = !_2087;
    int _2123 = _2121 ? _2101 : (-1);
    bool _2125 = !_2105;
    int _2127 = _2125 ? 0 : 1;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2131 = _2129 != 0;
    int _2133 = _2123 * _2119;
    int _2135 = abs(_2127);
    bool _2137 = !_2131;
    int _2139 = _2137 ? 0 : 1;
    int _2141 = _2081 * _2097;
    int _2143 = _2141 + _2133;
    int _2145 = abs(_1025);
    int _2147 = _2143 * _1976;
    int _2149 = abs(_2139);
    int _2151 = _2109 * _2135;
    int _2153 = _2151 + _1966;
    int _2155 = _2025 * _2145;
    int _2157 = _2155 + _2147;
    int _2159 = ~_1005;
    int _2161 = _2159 + 1;
    int _2163 = _2153 * _1982;
    int _2165 = _2163 + _2157;
    int _2167 = ~_1005;
    int _2169 = _2167 + 1;
    int _2171 = ~_1005;
    int _2173 = _2171 + 1;
    int _2175 = _2109 * _2149;
    int _2177 = _2175 + _2165;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2181 = _2179 != 0;
    float _2183 = float(uint(_2177));
    float _2185 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2185;
    float _2189 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2193 = as_type<float>(_2010) * _2183;
    float _2195 = 1.0 / _2187;
    float _2197 = trunc(_2193);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    float _2203 = 1.0 / _2191;
    int _2205 = _2161 * int(_2201);
    int _2207 = _2205 + _2177;
    float _2209 = float(uint(_2207));
    float _2211 = as_type<float>(_2010) * _2209;
    float _2213 = trunc(_2211);
    float _2215 = precise::max(_2213, 0.0);
    uint _2217 = uint(_2215);
    int _2219 = int(_2201) + int(_2217);
    float _2221 = float(uint(_2153));
    int _2223 = _2169 * _2219;
    int _2225 = _2223 + _2177;
    bool _2227 = uint(_2225) >= uint(_1005);
    bool _2229 = !_2227;
    int _2231 = _2229 ? 0 : (-1);
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2235 = _2233 != 0;
    int _2237 = ~_2219;
    int _2239 = _2237 + _2231;
    int _2241 = _2239 + 1;
    float _2243 = as_type<float>(_2010) * _2221;
    int _2245 = _1005 * _2241;
    int _2247 = _2245 + _2177;
    float _2249 = trunc(_2243);
    float _2251 = precise::max(_2249, 0.0);
    uint _2253 = uint(_2251);
    bool _2255 = !_2087;
    int _2257 = _2255 ? _2247 : (-1);
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _2267 = _2257 >> 31;
    float _2269 = 1.0 / _2261;
    int _2271 = _2257 & 3;
    bool _2273 = _2271 != 0;
    int _2275 = _2267 & 3;
    bool _2277 = uint(_2271) > 1u;
    int _2279 = _2257 + _2275;
    float _2281 = 1.0 / _2265;
    int _2283 = _2279 >> 2;
    int _2285 = _2257 & 3;
    bool _2287 = _2285 != 0;
    int _2289 = _2173 * int(_2253);
    int _2291 = _2289 + _2153;
    int _2293 = _2283 << 4;
    int _2295 = _2293 + 368;
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2299 = _889 + _2297;
    int _2301 = _2287 ? 0 : 1;
    float _2303 = float(uint(_2291));
    int _2305 = _2295 + 8;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
    int _2311 = int(_2307) & 3;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[int(_2309)][_2311];
    int _2315 = int(_2307) + 1;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    int _2319 = _2315 & 3;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[int(_2317)][_2319];
    int _2323 = ~_2301;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    float _2329 = _2299 * _2269;
    int _2331 = _2327;
    if (!_2277)
    {
        int _2333 = ~_2301;
        int _2335 = _2333 + 1;
        _2331 = _2335;
    }
    int _2337 = _2331;
    float _2339 = as_type<float>(_2010) * _2303;
    bool _2341 = uint(_2271) >= 2u;
    uint _2343 = uint(int(uint(_2295) >> uint(2)));
    uint _2345 = uint(int(uint(int(_2343)) >> uint(2)));
    int _2347 = int(_2343) & 3;
    float _2349 = (*spvDescriptorSet0.vp_c9)._m0[int(_2345)][_2347];
    int _2351 = int(_2343) + 1;
    uint _2353 = uint(int(uint(_2351) >> uint(2)));
    int _2355 = _2351 & 3;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[int(_2353)][_2355];
    bool _2359 = _903 > 0.5;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2363 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _2361;
    float _2365 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2367 = _889 + _2365;
    bool _2369 = !_2273;
    int _2371 = _2369 ? 0 : 1;
    float _2373 = trunc(_2339);
    float _2375 = precise::max(_2373, 0.0);
    uint _2377 = uint(_2375);
    bool _2379 = _901 > 0.5;
    float _2381 = _2367 * _2203;
    int _2383 = _2341 ? 0 : 1;
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2387 = _889 + _2385;
    bool _2389 = _2271 != 3;
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2393 = _889 + _2391;
    int _2395 = ~_1005;
    int _2397 = _2395 + 1;
    float _2399 = 1.0 / _2363;
    float _2401 = -_187;
    int _2403 = _2379 ? as_type<int>(_2401) : as_type<int>(_187);
    float _2405 = _2387 * _2195;
    float _2407 = _2393 * _2281;
    float _2409 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2411 = _889 + _2409;
    bool _2413 = !_2113;
    float _2415 = _2413 ? _187 : as_type<float>(_2403);
    int _2417 = abs(_2337);
    int _2419 = abs(_2371);
    bool _2421 = _2271 != 3;
    int _2423 = ~_2417;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    float _2429 = _2411 * _2399;
    int _2431 = ~_2383;
    int _2433 = _2431 + 1;
    int _2435 = _2433 + 1;
    int _2437 = _2435;
    if (_2389)
    {
        int _2439 = ~_2383;
        int _2441 = _2439 + 1;
        _2437 = _2441;
    }
    int _2443 = _2437;
    int _2445 = ~_2419;
    int _2447 = _2445 + 1;
    int _2449 = _2447 + 1;
    int _2451 = abs(_2443);
    int _2453 = int(_2253) + int(_2377);
    int _2455 = ~_2451;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = _2397 * _2453;
    int _2463 = _2461 + _2153;
    int _2465 = _2427 * as_type<int>(_2357);
    bool _2467 = !_2421;
    int _2469 = _2467 ? 0 : (-1);
    bool _2471 = uint(_2463) >= uint(_1005);
    int _2473 = _2449 * as_type<int>(_2349);
    int _2475 = _2473 + _2465;
    float _2477 = -_191;
    int _2479 = _2359 ? as_type<int>(_2477) : as_type<int>(_191);
    int _2481 = abs(_2469);
    int _2483 = _2459 * as_type<int>(_2313);
    int _2485 = _2483 + _2475;
    bool _2487 = !_2471;
    int _2489 = _2487 ? 0 : (-1);
    float _2491 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2493 = int(_2491);
    bool _2495 = !_2181;
    float _2497 = _2495 ? _191 : as_type<float>(_2479);
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2499;
    bool _2503 = !_2235;
    int _2505 = _2503 ? 0 : 1;
    int _2507 = ~_2453;
    int _2509 = _2507 + _2489;
    int _2511 = _2509 + 1;
    int _2513 = ~_2481;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = abs(_2505);
    int _2521 = _1005 * _2511;
    int _2523 = _2521 + _2153;
    int _2525 = _2517 * as_type<int>(_2321);
    int _2527 = _2525 + _2485;
    int _2529 = ~_2519;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    float _2535 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2535;
    float _2539 = float(uint(_2493));
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2547 = _2545 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _2549 = _2527 * _2533;
    float _2551 = 1.0 / _2539;
    float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2555 = _2553 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _2557 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _2559 = isnan(_889);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _2565 = _2561 || _2563;
    float _2567 = float(_2565);
    float _2569 = fma(_2537, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _2571 = !_2087;
    int _2573 = _2571 ? _2523 : (-1);
    float _2575 = fma(_2555, _2381, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2577 = fma(_2543, _2381, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2579 = fma(_2501, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2581 = fma(_2547, _2381, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _2583 = abs(_2493);
    float _2585 = -_2567;
    float _2587 = _2585 + 1.0;
    bool _2589 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2591 = isnan(_889);
    bool _2593 = _2589 || _2591;
    bool _2595 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2597 = _2593 || _2595;
    float _2599 = float(_2597);
    int _2601 = _2573 * _2519;
    int _2603 = _2601 + _2549;
    float _2605 = float(uint(_2583));
    float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2609 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2607;
    bool _2611 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2613 = isnan(_889);
    bool _2615 = _2611 || _2613;
    bool _2617 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2619 = _2615 || _2617;
    float _2621 = float(_2619);
    float _2623 = _2599 * _2587;
    float _2625 = -_2599;
    float _2627 = _2625 + 1.0;
    float _2629 = 1.0 / _2605;
    float _2631 = fma(_2609, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _2633 = as_type<int>(_2551) + (-2);
    float _2635 = _2621 * _2627;
    float _2637 = float(uint(_2603));
    float _2639 = -_2621;
    float _2641 = _2639 + 1.0;
    bool _2643 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2645 = isnan(_889);
    bool _2647 = _2643 || _2645;
    bool _2649 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2651 = _2647 || _2649;
    float _2653 = float(_2651);
    bool _2655 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2657 = isnan(_889);
    bool _2659 = _2655 || _2657;
    bool _2661 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2663 = _2659 || _2661;
    float _2665 = float(_2663);
    float _2667 = as_type<float>(_2633) * _2637;
    int _2669 = ~_2493;
    int _2671 = _2669 + 1;
    float _2673 = _2653 * _2641;
    float _2675 = -_2653;
    float _2677 = _2675 + 1.0;
    int _2679 = abs(_2603);
    float _2681 = trunc(_2667);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    float _2687 = -_2665;
    float _2689 = _2687 + 1.0;
    float _2691 = _2665 * _2677;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2693;
    int _2697 = as_type<int>(_2629) + (-2);
    float _2699 = _1994 * _2689;
    float _2701 = float(uint(_2679));
    float _2703 = fma(_2695, _2329, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2705 = _2579 * _2699;
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2711 = as_type<float>(_2697) * _2701;
    float _2713 = fma(_2008, _2329, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2715 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2717 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2715;
    bool _2719 = _2493 == 0;
    int _2721 = _2671 * int(_2685);
    int _2723 = _2721 + _2603;
    float _2725 = trunc(_2711);
    float _2727 = precise::max(_2725, 0.0);
    uint _2729 = uint(_2727);
    float _2731 = fma(_2717, _2329, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2733 = float(uint(_2723));
    float _2735 = _2569 * _2699;
    float _2737 = _2631 * _2699;
    int _2739 = ~_2583;
    int _2741 = _2739 + 1;
    float _2743 = -_1994;
    float _2745 = _2743 + 1.0;
    float _2747 = as_type<float>(_2633) * _2733;
    float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2751 = _2749 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2753 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2735);
    float _2755 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2705);
    float _2757 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2737);
    float _2759 = fma(_2709, _2407, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2761 = trunc(_2747);
    float _2763 = precise::max(_2761, 0.0);
    uint _2765 = uint(_2763);
    int _2767 = _2741 * int(_2729);
    int _2769 = _2767 + _2679;
    float _2771 = fma(_2577, _2691, _2755);
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2775 = _2773 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2777 = fma(_2575, _2691, _2753);
    float _2779 = fma(_2581, _2691, _2757);
    float _2781 = float(uint(_2769));
    float _2783 = fma(_2751, _2407, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2785 = fma(_2703, _2673, _2777);
    float _2787 = fma(_2775, _2407, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _2789 = as_type<float>(_2697) * _2781;
    float _2791 = fma(_2731, _2673, _2779);
    float _2793 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2795 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _2793;
    int _2797 = int(_2685) + int(_2765);
    float _2799 = trunc(_2789);
    float _2801 = precise::max(_2799, 0.0);
    uint _2803 = uint(_2801);
    int _2805 = ~_2493;
    int _2807 = _2805 + 1;
    float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2811 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _2813;
    float _2817 = fma(_2795, _2429, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _2819 = fma(_2787, _2635, _2791);
    int _2821 = _2807 * _2797;
    int _2823 = _2821 + _2603;
    float _2825 = fma(_2811, _2429, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _2827 = fma(_2815, _2429, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    int _2829 = ~_2583;
    int _2831 = _2829 + 1;
    float _2833 = fma(_2713, _2673, _2771);
    bool _2835 = uint(_2823) >= uint(_2493);
    float _2837 = fma(_2759, _2635, _2785);
    float _2839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2841 = fma(_2783, _2635, _2833);
    bool _2843 = !_2835;
    int _2845 = _2843 ? 0 : (-1);
    float _2847 = fma(_2817, _2623, _2837);
    int _2849 = int(_2729) + int(_2803);
    float _2851 = fma(_2825, _2623, _2841);
    int _2853 = ~_2797;
    int _2855 = _2853 + _2845;
    int _2857 = _2855 + 1;
    float _2859 = fma(_2827, _2623, _2819);
    bool _2861 = _2493 == 0;
    int _2863 = _2831 * _2849;
    int _2865 = _2863 + _2679;
    float _2867 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2869 = _2493 * _2857;
    int _2871 = _2869 + _2603;
    int _2873 = _2603 ^ _2493;
    float _2875 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2847);
    bool _2877 = uint(_2865) >= uint(_2583);
    float _2879 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2851);
    float _2881 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2859);
    uint _2883 = uint(int(uint(_2873) >> uint(31)));
    float _2885 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2887 = !_2877;
    int _2889 = _2887 ? 0 : (-1);
    float _2891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2893 = !_2861;
    int _2895 = _2893 ? _2871 : (-1);
    float _2897 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2867);
    int _2899 = ~_2889;
    int _2901 = _2849 + _2899;
    int _2903 = _2901 + 1;
    float _2905 = _2415 + 0.5;
    int _2907 = ~int(_2883);
    int _2909 = _2907 + 1;
    float _2911 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2897);
    float _2913 = float(_2895);
    float _2915 = exp2(_2885);
    float _2917 = _2839 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2919 = _2903 ^ _2909;
    float _2921 = _2879 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2923 = _2881 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2925 = fma(_2917, _2913, _1077);
    int _2927 = ~_2909;
    int _2929 = _2927 + _2919;
    int _2931 = _2929 + 1;
    float _2933 = _2875 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2935 = _2921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2937 = fma(_2917, _2905, _2925);
    bool _2939 = !_2719;
    int _2941 = _2939 ? _2931 : (-1);
    float _2943 = _2891 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2945 = _2497 + (-0.5);
    float _2947 = _2933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2949 = float(_2941);
    float _2951 = _2923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2953 = -_2915;
    float _2955 = _2953 + 1.0;
    float _2957 = -_1974;
    float _2959 = fma(_2415, _2957, _2937);
    float _2961 = -_1097;
    float _2963 = fma(_2943, _2949, _2961);
    float _2965 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2911);
    float _2967 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2947;
    out.m_68.y = _2935;
    out.m_68.z = _2951;
    float _2969 = -_2943;
    float _2971 = fma(_2969, _2945, _2963);
    float _2973 = _2965 + _1885;
    float _2975 = _2967 * _1939;
    out.gl_Position.x = _1919;
    out.gl_Position.y = _1921;
    out.gl_Position.z = _2965;
    out.gl_Position.w = _1885;
    float _2977 = fma(_2497, _1980, _2971);
    float _2979 = _2973 * 0.5;
    float _2981 = _1960 * _2975;
    float _2983 = -_2967;
    float _2985 = _2983 + 1.0;
    out.m_70.x = _2959;
    out.m_70.y = _2977;
    float _2987 = _1950 * _2975;
    float _2989 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2991 = _1950 * _2985;
    float _2993 = fma(_1950, _2981, _1948);
    float _2995 = fma(_1956, _2987, _1944);
    float _2997 = fma(_1958, _2987, _1946);
    out.m_72.z = _2979;
    out.m_72.w = _1885;
    out.m_45.x = _2989;
    out.m_74.x = _2995;
    out.m_74.y = _2997;
    out.m_74.z = _2993;
    out.m_74.w = _2991;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _881 = false;
    bool _525 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_42.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_45.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3054 = as_type<float>(_109);
        out.gl_Position.z = _3054;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_47.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3124 = as_type<float>(_147);
        out.gl_Position.z = _3124;
    }
    if (_139)
    {
        return out;
    }
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_52.x;
    float _153 = in.m_52.y;
    float _155 = in.m_52.z;
    float _157 = in.m_54.x;
    float _159 = in.m_54.y;
    float _161 = in.m_54.z;
    float _163 = in.m_56.x;
    float _165 = in.m_56.y;
    float _167 = in.m_56.z;
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    int _175 = as_type<int>(_149) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_149) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _185 = !_177;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_181;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _153 * _159;
    float _195 = _153 * _165;
    float _197 = fma(_151, _157, _193);
    float _199 = _153 * _171;
    float _201 = fma(_151, _163, _195);
    float _203 = fma(_155, _161, _197);
    float _205 = fma(_151, _169, _199);
    float _207 = fma(_155, _167, _201);
    float _209 = fma(_155, _173, _205);
    bool _211 = !_183;
    float _213 = _167;
    float _215 = _207;
    float _217 = _203;
    float _219 = _209;
    float _237;
    if (!_211)
    {
        float _221 = in.m_60.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_93);
        float _243 = 1.0 / _241;
        float _245 = _127 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _247 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _269;
    float _273 = 1.0 / _259;
    float _275 = 1.0 / _255;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _247 + _277;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _267;
    float _285 = _251 * _273;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _247 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _247 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = 1.0 / _271;
    float _301 = _289 * _275;
    bool _303 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _305 = isnan(_247);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    bool _315 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _317 = isnan(_247);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = fma(_297, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = 1.0 / _263;
    float _331 = _293 * _283;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _335 = _247 + _333;
    float _337 = _335 * _299;
    bool _339 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _341 = isnan(_247);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    float _355 = _279 * _329;
    bool _357 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_247);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_313;
    float _371 = _369 + 1.0;
    float _373 = -_349;
    float _375 = _373 + 1.0;
    float _377 = fma(_353, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _379 = -_367;
    float _381 = _379 + 1.0;
    float _383 = _349 * _371;
    float _385 = _367 * _375;
    bool _387 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_247);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = _325 * _381;
    float _401 = -_325;
    float _403 = _401 + 1.0;
    bool _405 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_247);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = _397 * _403;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = fma(_419, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _437 = fma(_423, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = _415 * _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _445;
    float _449 = _377 * _439;
    float _451 = _327 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _457 = fma(_443, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _463 = fma(_447, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _465 = fma(_435, _425, _459);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _471 = fma(_437, _425, _461);
    float _473 = fma(_455, _331, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _475;
    float _479 = fma(_457, _399, _465);
    float _481 = fma(_469, _331, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _483;
    float _487 = fma(_463, _399, _471);
    float _489 = fma(_477, _337, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _491 = fma(_473, _385, _479);
    float _493 = fma(_485, _337, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _495 = fma(_481, _385, _487);
    float _497 = fma(_489, _383, _491);
    float _499 = fma(_493, _383, _495);
    float _501 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].x, _497);
    float _503 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].y, _499);
    bool _505 = !_281;
    float _523;
    if (!_505)
    {
        float _507 = in.m_60.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _511 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _513 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _515 = _513 * _509;
        float _517 = floor(_515);
        float _519 = -_517;
        float _521 = _515 + _519;
        _523 = _521;
        _525 = true;
    }
    else
    {
        float _527 = float(_93);
        float _529 = 1.0 / _527;
        float _531 = _127 * _529;
        _523 = _531;
    }
    _525 = false;
    float _533 = _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _537 = _533 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _541 = _533 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _559 = 1.0 / _545;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _561;
    bool _565 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _567 = isnan(_533);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = 1.0 / _549;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _581 = _533 + _579;
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _585;
    float _589 = 1.0 / _563;
    float _591 = _581 * _559;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _595 = _533 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _599 = _533 + _597;
    float _601 = 1.0 / _557;
    float _603 = _595 * _577;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _605;
    bool _609 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _611 = isnan(_533);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _625;
    float _629 = 1.0 / _553;
    float _631 = _599 * _589;
    float _633 = fma(_607, _591, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _635 = fma(_627, _591, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _641 = fma(_623, _603, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _643;
    float _647 = _537 * _601;
    bool _649 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _651 = isnan(_533);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -_619;
    float _663 = _661 + 1.0;
    float _665 = fma(_645, _591, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _667 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _669 = isnan(_533);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _683 = -_659;
    float _685 = _683 + 1.0;
    float _687 = _659 * _663;
    float _689 = _541 * _629;
    bool _691 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _693 = isnan(_533);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = fma(_681, _603, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _705 = fma(_639, _603, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _707 = _701 * _685;
    float _709 = -_701;
    float _711 = _709 + 1.0;
    bool _713 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _715 = isnan(_533);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = _677 * _711;
    float _727 = -_677;
    float _729 = _727 + 1.0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _731;
    float _735 = _723 * _729;
    float _737 = -_723;
    float _739 = _737 + 1.0;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _741;
    float _745 = fma(_733, _689, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _751 = _575 * _739;
    float _753 = -_575;
    float _755 = _753 + 1.0;
    float _757 = fma(_743, _689, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _759 = fma(_587, _689, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _761 = _665 * _751;
    float _763 = _633 * _751;
    float _765 = _635 * _751;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[107].y, _761);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _777 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[107].x, _763);
    float _779 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[107].z, _765);
    float _781 = fma(_769, _647, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _783 = fma(_703, _735, _771);
    float _785 = fma(_775, _647, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _787 = fma(_641, _735, _777);
    float _789 = fma(_705, _735, _779);
    float _791 = fma(_757, _725, _787);
    float _793 = fma(_745, _725, _783);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _799;
    float _803 = fma(_749, _647, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _805;
    float _809 = fma(_759, _725, _789);
    float _811 = fma(_797, _631, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _813 = fma(_801, _631, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _815 = fma(_807, _631, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _817 = fma(_781, _707, _791);
    float _819 = fma(_785, _707, _793);
    float _821 = fma(_803, _707, _809);
    float _823 = fma(_811, _687, _817);
    float _825 = fma(_813, _687, _819);
    float _827 = fma(_815, _687, _821);
    float _829 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[112].x, _823);
    float _831 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[112].y, _825);
    float _833 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[112].z, _827);
    float _835 = in.m_62.x;
    float _837 = in.m_62.y;
    float _839 = _829 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _841 = _831 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _843 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _847 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _847;
    out.m_64.y = _849;
    out.m_64.z = _851;
    out.m_64.w = _845;
    float _853 = _503 * _837;
    float _855 = _501 * _835;
    bool _857 = !_583;
    float _877;
    float _879;
    if (!_857)
    {
        float _859 = in.m_60.x;
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _863 = float(_93);
        float _865 = _859 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _869 = _867 * _861;
        float _871 = floor(_869);
        float _873 = -_871;
        float _875 = _869 + _873;
        _877 = _875;
        _879 = _863;
        _881 = true;
    }
    else
    {
        float _883 = float(_93);
        float _885 = 1.0 / _883;
        float _887 = _127 * _885;
        _877 = _887;
        _879 = _883;
    }
    _881 = false;
    float _889 = _877;
    float _891 = _879;
    float _893 = in.m_60.z;
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _897 = int(_895);
    float _899 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _901 = in.m_60.x;
    float _903 = in.m_60.y;
    float _905 = _855 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _907 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _909 = log2(_907);
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _917 = 1.0 + _915;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _921 = 1.0 / _917;
    float _923 = _893 * 2.0;
    float _925 = _901 * 2.0;
    float _927 = _903 * 2.0;
    float _929 = floor(_923);
    float _931 = _901 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _933 = _903 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _935 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[78].w, _919);
    float _937 = -_911;
    float _939 = fma(_931, 2.0, _937);
    float _941 = fma(_933, -2.0, _913);
    float _943 = floor(_925);
    float _945 = _903 + _901;
    float _947 = _945 + (-1.0);
    bool _949 = _929 >= 0.0;
    bool _951 = isnan(_929);
    bool _953 = _949 || _951;
    bool _955 = isnan(0.0);
    bool _957 = _953 || _955;
    float _959 = floor(_927);
    float _961 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _963 = float(_897);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _967 = _965 != 0;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _975 = _973 != 0;
    int _977 = _957 ? 0 : 1;
    bool _979 = _943 > 0.0;
    float _981 = 1.0 / _963;
    bool _983 = !_971;
    int _985 = _983 ? 0 : 1;
    bool _987 = _929 > 0.0;
    bool _989 = _943 >= 0.0;
    bool _991 = isnan(_943);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = _909 * _127;
    bool _1001 = _959 > 0.0;
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1005 = int(_1003);
    bool _1007 = _959 >= 0.0;
    bool _1009 = isnan(_959);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan(0.0);
    bool _1015 = _1011 || _1013;
    int _1017 = ~_977;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    bool _1023 = !_967;
    int _1025 = _1023 ? 0 : 1;
    bool _1027 = !_975;
    int _1029 = _1027 ? 0 : 1;
    float _1031 = exp2(_999);
    int _1033 = _1021;
    if (!_987)
    {
        int _1035 = ~_977;
        int _1037 = _1035 + 1;
        _1033 = _1037;
    }
    int _1039 = _1033;
    float _1041 = _981 * _127;
    float _1043 = in.m_66.x;
    float _1045 = in.m_66.y;
    float _1047 = in.m_66.z;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1059 = _1057 != 0;
    float _1061 = float(_1039);
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1065 = _997 ? 0 : 1;
    float _1067 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _935);
    bool _1069 = !_1051;
    int _1071 = _1069 ? 0 : 1;
    float _1073 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1063);
    float _1075 = -_127;
    float _1077 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[76].x, _939);
    bool _1079 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1081 = isnan(1.0);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1087 = _1083 || _1085;
    int _1089 = abs(_1071);
    float _1091 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1073);
    float _1093 = -_1031;
    float _1095 = _1093 + 1.0;
    float _1097 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _941);
    bool _1099 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1089);
    bool _1111 = !_1055;
    int _1113 = _1111 ? 0 : 1;
    float _1115 = float(_1005);
    float _1117 = _1109 * _1061;
    float _1119 = _1107 ? _1095 : 0.0;
    float _1121 = _901 + (-0.5);
    int _1123 = ~_1065;
    int _1125 = _1123 + 1;
    int _1127 = _1125 + 1;
    float _1129 = _1117 * (-2.0);
    int _1131 = _1127;
    if (!_979)
    {
        int _1133 = ~_1065;
        int _1135 = _1133 + 1;
        _1131 = _1135;
    }
    int _1137 = _1131;
    float _1139 = _1115 * _127;
    int _1141 = abs(_1113);
    if (_1087)
    {
        float _1143 = _1119 * _921;
        _129 = _1143;
    }
    float _1145 = _129;
    float _1147 = fma(_1129, _1043, _1043);
    float _1149 = float(_1137);
    float _1151 = float(_1141);
    float _1153 = fma(_961, _1129, _961);
    int _1155 = _1015 ? 0 : 1;
    float _1157 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1147);
    bool _1159 = !_1059;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1151 * _1149;
    int _1165 = ~_1155;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    float _1171 = _903 + _893;
    int _1173 = _1169;
    if (!_1001)
    {
        int _1175 = ~_1155;
        int _1177 = _1175 + 1;
        _1173 = _1177;
    }
    int _1179 = _1173;
    float _1181 = fma(_1153, _1145, _1157);
    int _1183 = abs(_1161);
    float _1185 = _1171 + (-1.0);
    float _1187 = _1163 * (-2.0);
    float _1189 = float(_1179);
    float _1191 = _903 + (-0.5);
    float _1193 = float(_1183);
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1197 = fma(_1187, _1045, _1045);
    float _1199 = _893 + _901;
    float _1201 = _1193 * _1189;
    float _1203 = fma(_1195, _1187, _1195);
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1197);
    float _1207 = _1199 + (-1.0);
    float _1209 = _1201 * (-2.0);
    float _1211 = _1181 * 0.15915493667125701904296875;
    float _1213 = fma(_1203, _1145, _1205);
    float _1215 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1217 = fma(_1209, _1047, _1047);
    float _1219 = _893 + (-0.5);
    float _1221 = _1211 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = fma(_1215, _1209, _1215);
    float _1227 = _1213 * 0.15915493667125701904296875;
    float _1229 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1217);
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1233 = in.m_42.x;
    float _1235 = in.m_42.y;
    float _1237 = in.m_42.z;
    float _1239 = fma(_1225, _1145, _1229);
    float _1241 = _1211 * 6.283185482025146484375;
    float _1243 = cos(_1241);
    float _1245 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1247 = _899 * _1245;
    float _1249 = _905 * _1231;
    float _1251 = _1227 * 6.283185482025146484375;
    float _1253 = sin(_1251);
    float _1255 = _1239 * 0.15915493667125701904296875;
    float _1257 = _1227 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = _171 * _1235;
    float _1263 = _159 * _1235;
    float _1265 = _165 * _1235;
    float _1267 = _1255 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = _1223 * _1253;
    float _1273 = fma(_169, _1233, _1261);
    float _1275 = _1243 * _1253;
    float _1277 = fma(_157, _1233, _1263);
    float _1279 = fma(_163, _1233, _1265);
    float _1281 = fma(_173, _1237, _1273);
    float _1283 = _1255 * 6.283185482025146484375;
    float _1285 = sin(_1283);
    float _1287 = _1243 * _1259;
    float _1289 = fma(_161, _1237, _1277);
    float _1291 = _1281 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1293 = _1289 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1295 = _1269 * _1247;
    float _1297 = _1259 * _1269;
    float _1299 = _1223 * _1259;
    float _1301 = _1253 * _1269;
    float _1303 = _1243 * _1295;
    float _1305 = _1223 * _1295;
    float _1307 = fma(_1285, _1287, _1271);
    float _1309 = -_1247;
    float _1311 = _1285 * _1309;
    float _1313 = fma(_1285, _1271, _1287);
    float _1315 = fma(_1307, _1249, _1303);
    float _1317 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1319 = -_1299;
    float _1321 = fma(_1285, _1275, _1319);
    float _1323 = -_1275;
    float _1325 = fma(_1285, _1299, _1323);
    float _1327 = fma(_1297, _1249, _1311);
    float _1329 = fma(_1321, _1317, _1315);
    float _1331 = fma(_1325, _1249, _1305);
    float _1333 = fma(_1301, _1317, _1327);
    float _1335 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1337 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1339 = fma(_1313, _1317, _1331);
    float _1341 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1343 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1335);
    float _1345 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1337);
    float _1347 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1341);
    float _1349 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1343);
    float _1351 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1345);
    float _1353 = fma(_167, _1237, _1279);
    float _1355 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1347);
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1359 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1361 = _1353 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1363 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1365 = _1291 + _1357;
    float _1367 = _1293 + _1359;
    float _1369 = _1361 + _1363;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1373 = _1365 + _1371;
    float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1377 = _1367 + _1375;
    float _1379 = _1373 * _1373;
    float _1381 = fma(_1377, _1377, _1379);
    float _1383 = sqrt(_1381);
    bool _1385 = _1383 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1387 = _1355;
    float _1389 = _1363;
    float _1391 = _1373;
    float _1393 = _1367;
    if (!_1385)
    {
        _1387 = _1367;
    }
    float _1395 = _1387;
    float _1397 = _1395;
    if (!_1385)
    {
        _213 = _1365;
    }
    float _1399 = _213;
    float _1401 = _1399;
    if (!_1385)
    {
        _1389 = _1369;
    }
    float _1403 = _1389;
    bool _1405 = !_1385;
    float _1407 = _1403;
    if (!_1405)
    {
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1413 = _1383 + _1411;
        float _1415 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = rsqrt(_1381);
        float _1419 = _1413 * _1409;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1421 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1425 + (-1.0);
        float _1433 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1435 = fma(_1429, _1415, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1437 = fma(_1369, _1425, _1433);
        float _1439 = _1417 * _1435;
        float _1441 = fma(_1377, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1443 = fma(_1373, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1407 = _1437;
        _1397 = _1441;
        _1401 = _1443;
    }
    float _1445 = _1407;
    float _1447 = _1397;
    float _1449 = _1401;
    float _1451 = -_1361;
    float _1453 = _1451 + _1445;
    float _1455 = -_1293;
    float _1457 = _1455 + _1447;
    float _1459 = -_1291;
    float _1461 = _1459 + _1449;
    float _1463 = _1453 * _1453;
    bool _1465 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1467 = isnan(0.5);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1473 = _1469 || _1471;
    float _1475 = fma(_1457, _1457, _1463);
    float _1477 = fma(_1461, _1461, _1475);
    float _1479 = sqrt(_1477);
    bool _1481 = _1479 > 0.0;
    float _1483 = _1445;
    float _1485 = _1449;
    float _1487 = _1447;
    if (!_1481)
    {
        _1391 = _1447;
    }
    float _1489 = _1391;
    bool _1491 = !_1481;
    float _1493 = _1489;
    if (!_1491)
    {
        float _1495 = _207 * _207;
        float _1497 = fma(_203, _203, _1495);
        float _1499 = fma(_209, _209, _1497);
        float _1501 = rsqrt(_1477);
        float _1503 = sqrt(_1499);
        float _1505 = _1457 * _1501;
        float _1507 = _1453 * _1501;
        float _1509 = _1461 * _1501;
        bool _1511 = _1503 > 0.0;
        float _1513 = _1503;
        _1393 = _1507;
        if (!_1511)
        {
            _1513 = _1447;
        }
        float _1515 = _1513;
        bool _1517 = !_1511;
        _1493 = _1515;
        if (!_1517)
        {
            float _1519 = rsqrt(_1499);
            float _1521 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1523 = _207 * _1519;
            float _1525 = _203 * _1519;
            float _1527 = _1507 * _1523;
            float _1529 = _209 * _1519;
            float _1531 = fma(_1505, _1525, _1527);
            float _1533 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1535 = fma(_1509, _1529, _1531);
            float _1537 = _1535 * _1533;
            float _1539 = fma(_203, _1537, _1447);
            float _1541 = fma(_207, _1537, _1445);
            float _1543 = fma(_209, _1537, _1449);
            _1493 = _1539;
            _1483 = _1541;
            _1485 = _1543;
        }
    }
    float _1545 = _1493;
    float _1547 = _1483;
    float _1549 = _1485;
    float _1551 = _1393;
    float _1553 = _1549;
    float _1555 = _1551;
    if (_1473)
    {
        _215 = _1545;
    }
    float _1557 = _215;
    float _1559 = _1557;
    if (_1473)
    {
        _1487 = _1547;
    }
    float _1561 = _1487;
    float _1563 = _1561;
    if (_1473)
    {
        _217 = _1549;
    }
    float _1565 = _217;
    float _1567 = _1565;
    if (!_1473)
    {
        float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1571 = _1361 + _1569;
        float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1575 = _1293 + _1573;
        float _1577 = -_1293;
        float _1579 = _1577 + _1545;
        float _1581 = -_1361;
        float _1583 = _1581 + _1547;
        float _1585 = _1571 * _1571;
        float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1589 = _1291 + _1587;
        float _1591 = -_1291;
        float _1593 = _1591 + _1549;
        float _1595 = fma(_1575, _1575, _1585);
        float _1597 = fma(_1589, _1589, _1595);
        float _1599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1601 = sqrt(_1597);
        float _1603 = precise::min(_1601, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1605 = _1603 * _1599;
        float _1607 = fma(_1579, _1605, _1293);
        float _1609 = fma(_1583, _1605, _1361);
        float _1611 = fma(_1593, _1605, _1291);
        _1563 = _1609;
        _1559 = _1607;
        _1567 = _1611;
        _219 = _1601;
        _1553 = _1593;
    }
    float _1613 = _1563;
    float _1615 = _1559;
    float _1617 = _1567;
    float _1619 = _219;
    float _1621 = _1553;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1625 = _1613 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1629 = _1615 + _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1633 = _1617 + _1631;
    float _1635 = _1625 * _1625;
    float _1637 = fma(_1629, _1629, _1635);
    float _1639 = fma(_1633, _1633, _1637);
    float _1641 = rsqrt(_1639);
    float _1643 = sqrt(_1639);
    float _1645 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1647 = _1629 * _1645;
    float _1649 = _1633 * _1645;
    float _1651 = _1647 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 + _1653;
    float _1657 = sqrt(_1655);
    bool _1659 = _1657 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = _1657 + _1661;
    float _1665 = _1641;
    float _1667 = _1663;
    float _1669 = _1619;
    float _1671 = _1625;
    if (_1659)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1673;
    }
    float _1675 = _1665;
    float _1677 = _1675;
    if (_1659)
    {
        float _1679 = _1663 * _1675;
        _1667 = _1679;
    }
    float _1681 = _1667;
    if (_1659)
    {
        float _1683 = rsqrt(_1655);
        _1677 = _1683;
    }
    float _1685 = _1677;
    float _1687 = _1685;
    if (_1659)
    {
        float _1689 = _1681 * 0.15915493667125701904296875;
        _1669 = _1689;
    }
    float _1691 = _1669;
    float _1693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1695 = _1633;
    float _1697 = _1691;
    if (_1659)
    {
        float _1699 = _1691 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        _1695 = _1701;
    }
    float _1703 = _1695;
    float _1705 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1707 = precise::max(0.0, _1693);
    float _1709 = _1621;
    float _1711 = _1707;
    if (_1659)
    {
        float _1713 = _1691 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1709 = _1715;
    }
    float _1717 = _1709;
    float _1719 = -_1645;
    float _1721 = -_1707;
    float _1723 = fma(_1625, _1719, _1721);
    if (_1659)
    {
        float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1725;
    }
    float _1727 = _1671;
    float _1729 = _1703;
    float _1731 = _1727;
    if (_1659)
    {
        float _1733 = fma(_1703, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1729 = _1733;
    }
    float _1735 = _1729;
    float _1737 = _1735;
    if (!_1659)
    {
        _1731 = _1723;
    }
    float _1739 = _1731;
    float _1741 = _1739;
    if (_1659)
    {
        float _1743 = _1685 * _1735;
        _1555 = _1743;
    }
    float _1745 = _1555;
    if (!_1659)
    {
        _1687 = _1647;
    }
    float _1747 = _1687;
    float _1749 = _1747;
    float _1751 = _1717;
    if (_1659)
    {
        float _1753 = _1717 + (-1.0);
        _1711 = _1753;
    }
    float _1755 = _1711;
    float _1757 = _1755;
    if (_1659)
    {
        float _1759 = _1647 * _1745;
        _1749 = _1759;
    }
    float _1761 = _1749;
    if (!_1659)
    {
        _1737 = _1651;
    }
    float _1763 = _1737;
    float _1765 = _1763;
    if (_1659)
    {
        float _1767 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1697 = _1767;
    }
    float _1769 = _1697;
    if (!_1659)
    {
        _1757 = _1649;
    }
    float _1771 = _1757;
    float _1773 = _1771;
    if (_1659)
    {
        float _1775 = _1649 * _1745;
        _1773 = _1775;
    }
    float _1777 = _1773;
    if (_1659)
    {
        float _1779 = _1761 * _1761;
        _1765 = _1779;
    }
    float _1781 = _1765;
    if (_1659)
    {
        float _1783 = fma(_1723, _1717, _1769);
        _1741 = _1783;
    }
    float _1785 = _1741;
    if (!_1659)
    {
        _1751 = _1653;
    }
    float _1787 = _1751;
    float _1789 = _1787;
    if (_1659)
    {
        float _1791 = _1777 * _1777;
        _1789 = _1791;
    }
    float _1793 = _1789;
    float _1795 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1797 = fma(_1785, _1785, _1781);
    float _1799 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1795);
    float _1801 = _1797 + _1793;
    float _1803 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1643, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1799);
    float _1813 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1815 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1803);
    float _1817 = rsqrt(_1801);
    float _1819 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1821 = -_1809;
    float _1823 = _1821 + 1.0;
    float _1825 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1827 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1813);
    float _1829 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1819);
    float _1831 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1815);
    float _1833 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1835 = abs(_1823);
    float _1837 = log2(_1835);
    float _1839 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1829);
    float _1841 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1827);
    float _1843 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1845 = -_1833;
    float _1847 = fma(_1845, _1705, 1.0);
    float _1849 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1851 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1853 = _1817 * _1761;
    float _1855 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1857 = _1817 * _1785;
    float _1859 = _1817 * _1777;
    float _1861 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1863 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1851);
    float _1865 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1867 = log2(_1847);
    float _1869 = -_1861;
    float _1871 = fma(_1857, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1869);
    float _1873 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1875 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1863);
    float _1877 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1865);
    float _1879 = -_1859;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1871);
    float _1883 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1885 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1875);
    float _1887 = exp2(_1873);
    float _1889 = fma(_1881, -0.5, 0.5);
    float _1891 = fma(_1881, 0.5, 0.5);
    float _1893 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1883);
    float _1895 = _1857 + 1.0;
    float _1897 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1877);
    float _1899 = fma(_1891, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1901 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1893);
    float _1903 = 1.0 / _1885;
    float _1905 = _1867 * 0.693147182464599609375;
    float _1907 = fma(_1891, _1899, -0.212114393711090087890625);
    float _1909 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1911 = fma(_1891, _1907, 1.570728778839111328125);
    float _1913 = sqrt(_1889);
    float _1915 = -_1857;
    float _1917 = fma(_1887, _1895, _1915);
    float _1919 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1897);
    float _1921 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1901);
    float _1923 = fma(_1917, 0.5, 0.5);
    float _1925 = _1919 * _1903;
    float _1927 = _1921 * _1903;
    float _1929 = fma(_1925, 0.5, 0.5);
    float _1931 = fma(_1927, -0.5, 0.5);
    float _1933 = _1913 * 0.636619746685028076171875;
    float _1935 = -_1911;
    float _1937 = fma(_1933, _1935, 1.0);
    float3 _5944 = float3(_1929, _1931, _1909);
    float _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5944, float3(0.0), isnan(_5944)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5944, float3(0.0), isnan(_5944)), level(0.0)).x;
    float3 _5955 = float3(_1929, _1931, _1909);
    float4 _1942 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5955, float3(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5955, float3(0.0), isnan(_5955)), level(0.0)).xyzw;
    float _1944 = _1942.x;
    float _1946 = _1942.y;
    float _1948 = _1942.z;
    float _1950 = _1942.w;
    float2 _5972 = float2(_1937, _1923);
    float3 _1954 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5972, float2(0.0), isnan(_5972)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5972, float2(0.0), isnan(_5972)), level(0.0)).xyz;
    float _1956 = _1954.x;
    float _1958 = _1954.y;
    float _1960 = _1954.z;
    float _1962 = float(uint(_1005));
    float _1964 = trunc(_1041);
    int _1966 = int(_1964);
    int _1968 = ~_1005;
    int _1970 = _1968 + 1;
    float _1972 = -_1091;
    float _1974 = _1972 + 1.0;
    int _1976 = abs(_985);
    float _1978 = -_1067;
    float _1980 = _1978 + 1.0;
    int _1982 = abs(_1029);
    bool _1984 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1986 = isnan(_889);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    float _1996 = 1.0 / _1962;
    float _1998 = float(uint(_1966));
    float _2000 = 1.0 / _891;
    int _2002 = ~_1005;
    int _2004 = _2002 + 1;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2006;
    int _2010 = as_type<int>(_1996) + (-2);
    float _2012 = as_type<float>(_2010) * _1998;
    float _2014 = _1139 * _2000;
    float _2016 = trunc(_2012);
    float _2018 = precise::max(_2016, 0.0);
    uint _2021 = uint(_2018);
    float _2023 = trunc(_2014);
    int _2025 = int(_2023);
    int _2027 = _1970 * int(_2021);
    int _2029 = _2027 + _1966;
    float _2031 = float(uint(_2029));
    float _2033 = as_type<float>(_2010) * _2031;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2037 = _2035 != 0;
    float _2039 = trunc(_2033);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    bool _2045 = !_2037;
    float _2047 = _2045 ? 7.345489978790283203125 : 1.0;
    float _2049 = _2047 * _901;
    float _2051 = floor(_2049);
    int _2053 = int(_2021) + int(_2043);
    float _2055 = float(_1966);
    int _2057 = _2004 * _2053;
    int _2059 = _2057 + _1966;
    bool _2061 = _2055 >= _1115;
    bool _2063 = isnan(_2055);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(_1115);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = -_2051;
    float _2075 = _2049 + _2073;
    bool _2077 = uint(_2059) >= uint(_1005);
    float _2079 = trunc(_2071);
    int _2081 = int(_2079);
    bool _2083 = !_2077;
    int _2085 = _2083 ? 0 : (-1);
    bool _2087 = _1005 == 0;
    int _2089 = ~_2053;
    int _2091 = _2089 + _2085;
    int _2093 = _2091 + 1;
    float _2095 = _2075 * _1115;
    int _2097 = _1005 + (-1);
    int _2099 = _1005 * _2093;
    int _2101 = _2099 + _1966;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2105 = _2103 != 0;
    float _2107 = trunc(_2095);
    int _2109 = int(_2107);
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2113 = _2111 != 0;
    int _2115 = ~_2081;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    bool _2121 = !_2087;
    int _2123 = _2121 ? _2101 : (-1);
    bool _2125 = !_2105;
    int _2127 = _2125 ? 0 : 1;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2131 = _2129 != 0;
    int _2133 = _2123 * _2119;
    int _2135 = abs(_2127);
    bool _2137 = !_2131;
    int _2139 = _2137 ? 0 : 1;
    int _2141 = _2081 * _2097;
    int _2143 = _2141 + _2133;
    int _2145 = abs(_1025);
    int _2147 = _2143 * _1976;
    int _2149 = abs(_2139);
    int _2151 = _2109 * _2135;
    int _2153 = _2151 + _1966;
    int _2155 = _2025 * _2145;
    int _2157 = _2155 + _2147;
    int _2159 = ~_1005;
    int _2161 = _2159 + 1;
    int _2163 = _2153 * _1982;
    int _2165 = _2163 + _2157;
    int _2167 = ~_1005;
    int _2169 = _2167 + 1;
    int _2171 = ~_1005;
    int _2173 = _2171 + 1;
    int _2175 = _2109 * _2149;
    int _2177 = _2175 + _2165;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2181 = _2179 != 0;
    float _2183 = float(uint(_2177));
    float _2185 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2185;
    float _2189 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2193 = as_type<float>(_2010) * _2183;
    float _2195 = 1.0 / _2187;
    float _2197 = trunc(_2193);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    float _2203 = 1.0 / _2191;
    int _2205 = _2161 * int(_2201);
    int _2207 = _2205 + _2177;
    float _2209 = float(uint(_2207));
    float _2211 = as_type<float>(_2010) * _2209;
    float _2213 = trunc(_2211);
    float _2215 = precise::max(_2213, 0.0);
    uint _2217 = uint(_2215);
    int _2219 = int(_2201) + int(_2217);
    float _2221 = float(uint(_2153));
    int _2223 = _2169 * _2219;
    int _2225 = _2223 + _2177;
    bool _2227 = uint(_2225) >= uint(_1005);
    bool _2229 = !_2227;
    int _2231 = _2229 ? 0 : (-1);
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2235 = _2233 != 0;
    int _2237 = ~_2219;
    int _2239 = _2237 + _2231;
    int _2241 = _2239 + 1;
    float _2243 = as_type<float>(_2010) * _2221;
    int _2245 = _1005 * _2241;
    int _2247 = _2245 + _2177;
    float _2249 = trunc(_2243);
    float _2251 = precise::max(_2249, 0.0);
    uint _2253 = uint(_2251);
    bool _2255 = !_2087;
    int _2257 = _2255 ? _2247 : (-1);
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _2267 = _2257 >> 31;
    float _2269 = 1.0 / _2261;
    int _2271 = _2257 & 3;
    bool _2273 = _2271 != 0;
    int _2275 = _2267 & 3;
    bool _2277 = uint(_2271) > 1u;
    int _2279 = _2257 + _2275;
    float _2281 = 1.0 / _2265;
    int _2283 = _2279 >> 2;
    int _2285 = _2257 & 3;
    bool _2287 = _2285 != 0;
    int _2289 = _2173 * int(_2253);
    int _2291 = _2289 + _2153;
    int _2293 = _2283 << 4;
    int _2295 = _2293 + 368;
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2299 = _889 + _2297;
    int _2301 = _2287 ? 0 : 1;
    float _2303 = float(uint(_2291));
    int _2305 = _2295 + 8;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
    int _2311 = int(_2307) & 3;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[int(_2309)][_2311];
    int _2315 = int(_2307) + 1;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    int _2319 = _2315 & 3;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[int(_2317)][_2319];
    int _2323 = ~_2301;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    float _2329 = _2299 * _2269;
    int _2331 = _2327;
    if (!_2277)
    {
        int _2333 = ~_2301;
        int _2335 = _2333 + 1;
        _2331 = _2335;
    }
    int _2337 = _2331;
    float _2339 = as_type<float>(_2010) * _2303;
    bool _2341 = uint(_2271) >= 2u;
    uint _2343 = uint(int(uint(_2295) >> uint(2)));
    uint _2345 = uint(int(uint(int(_2343)) >> uint(2)));
    int _2347 = int(_2343) & 3;
    float _2349 = (*spvDescriptorSet0.vp_c9)._m0[int(_2345)][_2347];
    int _2351 = int(_2343) + 1;
    uint _2353 = uint(int(uint(_2351) >> uint(2)));
    int _2355 = _2351 & 3;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[int(_2353)][_2355];
    bool _2359 = _903 > 0.5;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2363 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _2361;
    float _2365 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2367 = _889 + _2365;
    bool _2369 = !_2273;
    int _2371 = _2369 ? 0 : 1;
    float _2373 = trunc(_2339);
    float _2375 = precise::max(_2373, 0.0);
    uint _2377 = uint(_2375);
    bool _2379 = _901 > 0.5;
    float _2381 = _2367 * _2203;
    int _2383 = _2341 ? 0 : 1;
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2387 = _889 + _2385;
    bool _2389 = _2271 != 3;
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2393 = _889 + _2391;
    int _2395 = ~_1005;
    int _2397 = _2395 + 1;
    float _2399 = 1.0 / _2363;
    float _2401 = -_187;
    int _2403 = _2379 ? as_type<int>(_2401) : as_type<int>(_187);
    float _2405 = _2387 * _2195;
    float _2407 = _2393 * _2281;
    float _2409 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2411 = _889 + _2409;
    bool _2413 = !_2113;
    float _2415 = _2413 ? _187 : as_type<float>(_2403);
    int _2417 = abs(_2337);
    int _2419 = abs(_2371);
    bool _2421 = _2271 != 3;
    int _2423 = ~_2417;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    float _2429 = _2411 * _2399;
    int _2431 = ~_2383;
    int _2433 = _2431 + 1;
    int _2435 = _2433 + 1;
    int _2437 = _2435;
    if (_2389)
    {
        int _2439 = ~_2383;
        int _2441 = _2439 + 1;
        _2437 = _2441;
    }
    int _2443 = _2437;
    int _2445 = ~_2419;
    int _2447 = _2445 + 1;
    int _2449 = _2447 + 1;
    int _2451 = abs(_2443);
    int _2453 = int(_2253) + int(_2377);
    int _2455 = ~_2451;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = _2397 * _2453;
    int _2463 = _2461 + _2153;
    int _2465 = _2427 * as_type<int>(_2357);
    bool _2467 = !_2421;
    int _2469 = _2467 ? 0 : (-1);
    bool _2471 = uint(_2463) >= uint(_1005);
    int _2473 = _2449 * as_type<int>(_2349);
    int _2475 = _2473 + _2465;
    float _2477 = -_191;
    int _2479 = _2359 ? as_type<int>(_2477) : as_type<int>(_191);
    int _2481 = abs(_2469);
    int _2483 = _2459 * as_type<int>(_2313);
    int _2485 = _2483 + _2475;
    bool _2487 = !_2471;
    int _2489 = _2487 ? 0 : (-1);
    float _2491 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2493 = int(_2491);
    bool _2495 = !_2181;
    float _2497 = _2495 ? _191 : as_type<float>(_2479);
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2499;
    bool _2503 = !_2235;
    int _2505 = _2503 ? 0 : 1;
    int _2507 = ~_2453;
    int _2509 = _2507 + _2489;
    int _2511 = _2509 + 1;
    int _2513 = ~_2481;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = abs(_2505);
    int _2521 = _1005 * _2511;
    int _2523 = _2521 + _2153;
    int _2525 = _2517 * as_type<int>(_2321);
    int _2527 = _2525 + _2485;
    int _2529 = ~_2519;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    float _2535 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2535;
    float _2539 = float(uint(_2493));
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2547 = _2545 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _2549 = _2527 * _2533;
    float _2551 = 1.0 / _2539;
    float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2555 = _2553 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _2557 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _2559 = isnan(_889);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _2565 = _2561 || _2563;
    float _2567 = float(_2565);
    float _2569 = fma(_2537, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _2571 = !_2087;
    int _2573 = _2571 ? _2523 : (-1);
    float _2575 = fma(_2555, _2381, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2577 = fma(_2543, _2381, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2579 = fma(_2501, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2581 = fma(_2547, _2381, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _2583 = abs(_2493);
    float _2585 = -_2567;
    float _2587 = _2585 + 1.0;
    bool _2589 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2591 = isnan(_889);
    bool _2593 = _2589 || _2591;
    bool _2595 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2597 = _2593 || _2595;
    float _2599 = float(_2597);
    int _2601 = _2573 * _2519;
    int _2603 = _2601 + _2549;
    float _2605 = float(uint(_2583));
    float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2609 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2607;
    bool _2611 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2613 = isnan(_889);
    bool _2615 = _2611 || _2613;
    bool _2617 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2619 = _2615 || _2617;
    float _2621 = float(_2619);
    float _2623 = _2599 * _2587;
    float _2625 = -_2599;
    float _2627 = _2625 + 1.0;
    float _2629 = 1.0 / _2605;
    float _2631 = fma(_2609, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _2633 = as_type<int>(_2551) + (-2);
    float _2635 = _2621 * _2627;
    float _2637 = float(uint(_2603));
    float _2639 = -_2621;
    float _2641 = _2639 + 1.0;
    bool _2643 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2645 = isnan(_889);
    bool _2647 = _2643 || _2645;
    bool _2649 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2651 = _2647 || _2649;
    float _2653 = float(_2651);
    bool _2655 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2657 = isnan(_889);
    bool _2659 = _2655 || _2657;
    bool _2661 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2663 = _2659 || _2661;
    float _2665 = float(_2663);
    float _2667 = as_type<float>(_2633) * _2637;
    int _2669 = ~_2493;
    int _2671 = _2669 + 1;
    float _2673 = _2653 * _2641;
    float _2675 = -_2653;
    float _2677 = _2675 + 1.0;
    int _2679 = abs(_2603);
    float _2681 = trunc(_2667);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    float _2687 = -_2665;
    float _2689 = _2687 + 1.0;
    float _2691 = _2665 * _2677;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2693;
    int _2697 = as_type<int>(_2629) + (-2);
    float _2699 = _1994 * _2689;
    float _2701 = float(uint(_2679));
    float _2703 = fma(_2695, _2329, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2705 = _2579 * _2699;
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2711 = as_type<float>(_2697) * _2701;
    float _2713 = fma(_2008, _2329, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2715 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2717 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2715;
    bool _2719 = _2493 == 0;
    int _2721 = _2671 * int(_2685);
    int _2723 = _2721 + _2603;
    float _2725 = trunc(_2711);
    float _2727 = precise::max(_2725, 0.0);
    uint _2729 = uint(_2727);
    float _2731 = fma(_2717, _2329, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2733 = float(uint(_2723));
    float _2735 = _2569 * _2699;
    float _2737 = _2631 * _2699;
    int _2739 = ~_2583;
    int _2741 = _2739 + 1;
    float _2743 = -_1994;
    float _2745 = _2743 + 1.0;
    float _2747 = as_type<float>(_2633) * _2733;
    float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2751 = _2749 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2753 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2735);
    float _2755 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2705);
    float _2757 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2737);
    float _2759 = fma(_2709, _2407, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2761 = trunc(_2747);
    float _2763 = precise::max(_2761, 0.0);
    uint _2765 = uint(_2763);
    int _2767 = _2741 * int(_2729);
    int _2769 = _2767 + _2679;
    float _2771 = fma(_2577, _2691, _2755);
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2775 = _2773 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2777 = fma(_2575, _2691, _2753);
    float _2779 = fma(_2581, _2691, _2757);
    float _2781 = float(uint(_2769));
    float _2783 = fma(_2751, _2407, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2785 = fma(_2703, _2673, _2777);
    float _2787 = fma(_2775, _2407, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _2789 = as_type<float>(_2697) * _2781;
    float _2791 = fma(_2731, _2673, _2779);
    float _2793 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2795 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _2793;
    int _2797 = int(_2685) + int(_2765);
    float _2799 = trunc(_2789);
    float _2801 = precise::max(_2799, 0.0);
    uint _2803 = uint(_2801);
    int _2805 = ~_2493;
    int _2807 = _2805 + 1;
    float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2811 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _2813;
    float _2817 = fma(_2795, _2429, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _2819 = fma(_2787, _2635, _2791);
    int _2821 = _2807 * _2797;
    int _2823 = _2821 + _2603;
    float _2825 = fma(_2811, _2429, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _2827 = fma(_2815, _2429, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    int _2829 = ~_2583;
    int _2831 = _2829 + 1;
    float _2833 = fma(_2713, _2673, _2771);
    bool _2835 = uint(_2823) >= uint(_2493);
    float _2837 = fma(_2759, _2635, _2785);
    float _2839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2841 = fma(_2783, _2635, _2833);
    bool _2843 = !_2835;
    int _2845 = _2843 ? 0 : (-1);
    float _2847 = fma(_2817, _2623, _2837);
    int _2849 = int(_2729) + int(_2803);
    float _2851 = fma(_2825, _2623, _2841);
    int _2853 = ~_2797;
    int _2855 = _2853 + _2845;
    int _2857 = _2855 + 1;
    float _2859 = fma(_2827, _2623, _2819);
    bool _2861 = _2493 == 0;
    int _2863 = _2831 * _2849;
    int _2865 = _2863 + _2679;
    float _2867 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2869 = _2493 * _2857;
    int _2871 = _2869 + _2603;
    int _2873 = _2603 ^ _2493;
    float _2875 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2847);
    bool _2877 = uint(_2865) >= uint(_2583);
    float _2879 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2851);
    float _2881 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2859);
    uint _2883 = uint(int(uint(_2873) >> uint(31)));
    float _2885 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2887 = !_2877;
    int _2889 = _2887 ? 0 : (-1);
    float _2891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2893 = !_2861;
    int _2895 = _2893 ? _2871 : (-1);
    float _2897 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2867);
    int _2899 = ~_2889;
    int _2901 = _2849 + _2899;
    int _2903 = _2901 + 1;
    float _2905 = _2415 + 0.5;
    int _2907 = ~int(_2883);
    int _2909 = _2907 + 1;
    float _2911 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2897);
    float _2913 = float(_2895);
    float _2915 = exp2(_2885);
    float _2917 = _2839 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2919 = _2903 ^ _2909;
    float _2921 = _2879 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2923 = _2881 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2925 = fma(_2917, _2913, _1077);
    int _2927 = ~_2909;
    int _2929 = _2927 + _2919;
    int _2931 = _2929 + 1;
    float _2933 = _2875 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2935 = _2921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2937 = fma(_2917, _2905, _2925);
    bool _2939 = !_2719;
    int _2941 = _2939 ? _2931 : (-1);
    float _2943 = _2891 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2945 = _2497 + (-0.5);
    float _2947 = _2933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2949 = float(_2941);
    float _2951 = _2923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2953 = -_2915;
    float _2955 = _2953 + 1.0;
    float _2957 = -_1974;
    float _2959 = fma(_2415, _2957, _2937);
    float _2961 = -_1097;
    float _2963 = fma(_2943, _2949, _2961);
    float _2965 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2911);
    float _2967 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2947;
    out.m_68.y = _2935;
    out.m_68.z = _2951;
    float _2969 = -_2943;
    float _2971 = fma(_2969, _2945, _2963);
    float _2973 = _2965 + _1885;
    float _2975 = _2967 * _1939;
    out.gl_Position.x = _1919;
    out.gl_Position.y = _1921;
    out.gl_Position.z = _2965;
    out.gl_Position.w = _1885;
    float _2977 = fma(_2497, _1980, _2971);
    float _2979 = _2973 * 0.5;
    float _2981 = _1960 * _2975;
    float _2983 = -_2967;
    float _2985 = _2983 + 1.0;
    out.m_70.x = _2959;
    out.m_70.y = _2977;
    float _2987 = _1950 * _2975;
    float _2989 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2991 = _1950 * _2985;
    float _2993 = fma(_1950, _2981, _1948);
    float _2995 = fma(_1956, _2987, _1944);
    float _2997 = fma(_1958, _2987, _1946);
    out.m_72.z = _2979;
    out.m_72.w = _1885;
    out.m_45.x = _2989;
    out.m_74.x = _2995;
    out.m_74.y = _2997;
    out.m_74.z = _2993;
    out.m_74.w = _2991;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _881 = false;
    bool _525 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_42.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_45.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3054 = as_type<float>(_109);
        out.gl_Position.z = _3054;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_47.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3124 = as_type<float>(_147);
        out.gl_Position.z = _3124;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_52.x;
    float _153 = in.m_52.y;
    float _155 = in.m_52.z;
    float _157 = in.m_54.x;
    float _159 = in.m_54.y;
    float _161 = in.m_54.z;
    float _163 = in.m_56.x;
    float _165 = in.m_56.y;
    float _167 = in.m_56.z;
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    int _175 = as_type<int>(_149) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_149) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _185 = !_177;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_181;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _153 * _159;
    float _195 = _153 * _165;
    float _197 = fma(_151, _157, _193);
    float _199 = _153 * _171;
    float _201 = fma(_151, _163, _195);
    float _203 = fma(_155, _161, _197);
    float _205 = fma(_151, _169, _199);
    float _207 = fma(_155, _167, _201);
    float _209 = fma(_155, _173, _205);
    bool _211 = !_183;
    float _213 = _167;
    float _215 = _207;
    float _217 = _203;
    float _219 = _209;
    float _237;
    if (!_211)
    {
        float _221 = in.m_60.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_93);
        float _243 = 1.0 / _241;
        float _245 = _127 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _247 + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _261;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _269;
    float _273 = 1.0 / _259;
    float _275 = 1.0 / _255;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _247 + _277;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _267;
    float _285 = _251 * _273;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _247 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _247 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = 1.0 / _271;
    float _301 = _289 * _275;
    bool _303 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _305 = isnan(_247);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    bool _315 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _317 = isnan(_247);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = fma(_297, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _329 = 1.0 / _263;
    float _331 = _293 * _283;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _335 = _247 + _333;
    float _337 = _335 * _299;
    bool _339 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _341 = isnan(_247);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _351;
    float _355 = _279 * _329;
    bool _357 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_247);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_313;
    float _371 = _369 + 1.0;
    float _373 = -_349;
    float _375 = _373 + 1.0;
    float _377 = fma(_353, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _379 = -_367;
    float _381 = _379 + 1.0;
    float _383 = _349 * _371;
    float _385 = _367 * _375;
    bool _387 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_247);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = _325 * _381;
    float _401 = -_325;
    float _403 = _401 + 1.0;
    bool _405 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _407 = isnan(_247);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = _397 * _403;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = fma(_419, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _437 = fma(_423, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = _415 * _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _445;
    float _449 = _377 * _439;
    float _451 = _327 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _457 = fma(_443, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _459 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _461 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _463 = fma(_447, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _465 = fma(_435, _425, _459);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _471 = fma(_437, _425, _461);
    float _473 = fma(_455, _331, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _475;
    float _479 = fma(_457, _399, _465);
    float _481 = fma(_469, _331, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _483;
    float _487 = fma(_463, _399, _471);
    float _489 = fma(_477, _337, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _491 = fma(_473, _385, _479);
    float _493 = fma(_485, _337, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _495 = fma(_481, _385, _487);
    float _497 = fma(_489, _383, _491);
    float _499 = fma(_493, _383, _495);
    float _501 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].x, _497);
    float _503 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].y, _499);
    bool _505 = !_281;
    float _523;
    if (!_505)
    {
        float _507 = in.m_60.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _511 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _513 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _515 = _513 * _509;
        float _517 = floor(_515);
        float _519 = -_517;
        float _521 = _515 + _519;
        _523 = _521;
        _525 = true;
    }
    else
    {
        float _527 = float(_93);
        float _529 = 1.0 / _527;
        float _531 = _127 * _529;
        _523 = _531;
    }
    _525 = false;
    float _533 = _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _537 = _533 + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _541 = _533 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _559 = 1.0 / _545;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _561;
    bool _565 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _567 = isnan(_533);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = 1.0 / _549;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _581 = _533 + _579;
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _585;
    float _589 = 1.0 / _563;
    float _591 = _581 * _559;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _595 = _533 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _599 = _533 + _597;
    float _601 = 1.0 / _557;
    float _603 = _595 * _577;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _605;
    bool _609 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _611 = isnan(_533);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _625;
    float _629 = 1.0 / _553;
    float _631 = _599 * _589;
    float _633 = fma(_607, _591, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _635 = fma(_627, _591, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _641 = fma(_623, _603, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _643;
    float _647 = _537 * _601;
    bool _649 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _651 = isnan(_533);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -_619;
    float _663 = _661 + 1.0;
    float _665 = fma(_645, _591, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _667 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _669 = isnan(_533);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _683 = -_659;
    float _685 = _683 + 1.0;
    float _687 = _659 * _663;
    float _689 = _541 * _629;
    bool _691 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _693 = isnan(_533);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = fma(_681, _603, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _705 = fma(_639, _603, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _707 = _701 * _685;
    float _709 = -_701;
    float _711 = _709 + 1.0;
    bool _713 = _533 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _715 = isnan(_533);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = _677 * _711;
    float _727 = -_677;
    float _729 = _727 + 1.0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _731;
    float _735 = _723 * _729;
    float _737 = -_723;
    float _739 = _737 + 1.0;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _741;
    float _745 = fma(_733, _689, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _751 = _575 * _739;
    float _753 = -_575;
    float _755 = _753 + 1.0;
    float _757 = fma(_743, _689, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _759 = fma(_587, _689, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _761 = _665 * _751;
    float _763 = _633 * _751;
    float _765 = _635 * _751;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[107].y, _761);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _777 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[107].x, _763);
    float _779 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[107].z, _765);
    float _781 = fma(_769, _647, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _783 = fma(_703, _735, _771);
    float _785 = fma(_775, _647, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _787 = fma(_641, _735, _777);
    float _789 = fma(_705, _735, _779);
    float _791 = fma(_757, _725, _787);
    float _793 = fma(_745, _725, _783);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _799;
    float _803 = fma(_749, _647, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _805;
    float _809 = fma(_759, _725, _789);
    float _811 = fma(_797, _631, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _813 = fma(_801, _631, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _815 = fma(_807, _631, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _817 = fma(_781, _707, _791);
    float _819 = fma(_785, _707, _793);
    float _821 = fma(_803, _707, _809);
    float _823 = fma(_811, _687, _817);
    float _825 = fma(_813, _687, _819);
    float _827 = fma(_815, _687, _821);
    float _829 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[112].x, _823);
    float _831 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[112].y, _825);
    float _833 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[112].z, _827);
    float _835 = in.m_62.x;
    float _837 = in.m_62.y;
    float _839 = _829 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _841 = _831 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _843 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _847 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _847;
    out.m_64.y = _849;
    out.m_64.z = _851;
    out.m_64.w = _845;
    float _853 = _503 * _837;
    float _855 = _501 * _835;
    bool _857 = !_583;
    float _877;
    float _879;
    if (!_857)
    {
        float _859 = in.m_60.x;
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _863 = float(_93);
        float _865 = _859 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _869 = _867 * _861;
        float _871 = floor(_869);
        float _873 = -_871;
        float _875 = _869 + _873;
        _877 = _875;
        _879 = _863;
        _881 = true;
    }
    else
    {
        float _883 = float(_93);
        float _885 = 1.0 / _883;
        float _887 = _127 * _885;
        _877 = _887;
        _879 = _883;
    }
    _881 = false;
    float _889 = _877;
    float _891 = _879;
    float _893 = in.m_60.z;
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _897 = int(_895);
    float _899 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _901 = in.m_60.x;
    float _903 = in.m_60.y;
    float _905 = _855 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _907 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _909 = log2(_907);
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _917 = 1.0 + _915;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _921 = 1.0 / _917;
    float _923 = _893 * 2.0;
    float _925 = _901 * 2.0;
    float _927 = _903 * 2.0;
    float _929 = floor(_923);
    float _931 = _901 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _933 = _903 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _935 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[78].w, _919);
    float _937 = -_911;
    float _939 = fma(_931, 2.0, _937);
    float _941 = fma(_933, -2.0, _913);
    float _943 = floor(_925);
    float _945 = _903 + _901;
    float _947 = _945 + (-1.0);
    bool _949 = _929 >= 0.0;
    bool _951 = isnan(_929);
    bool _953 = _949 || _951;
    bool _955 = isnan(0.0);
    bool _957 = _953 || _955;
    float _959 = floor(_927);
    float _961 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _963 = float(_897);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _967 = _965 != 0;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _975 = _973 != 0;
    int _977 = _957 ? 0 : 1;
    bool _979 = _943 > 0.0;
    float _981 = 1.0 / _963;
    bool _983 = !_971;
    int _985 = _983 ? 0 : 1;
    bool _987 = _929 > 0.0;
    bool _989 = _943 >= 0.0;
    bool _991 = isnan(_943);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = _909 * _127;
    bool _1001 = _959 > 0.0;
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1005 = int(_1003);
    bool _1007 = _959 >= 0.0;
    bool _1009 = isnan(_959);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan(0.0);
    bool _1015 = _1011 || _1013;
    int _1017 = ~_977;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    bool _1023 = !_967;
    int _1025 = _1023 ? 0 : 1;
    bool _1027 = !_975;
    int _1029 = _1027 ? 0 : 1;
    float _1031 = exp2(_999);
    int _1033 = _1021;
    if (!_987)
    {
        int _1035 = ~_977;
        int _1037 = _1035 + 1;
        _1033 = _1037;
    }
    int _1039 = _1033;
    float _1041 = _981 * _127;
    float _1043 = in.m_66.x;
    float _1045 = in.m_66.y;
    float _1047 = in.m_66.z;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1055 = _1053 != 0;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1059 = _1057 != 0;
    float _1061 = float(_1039);
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1065 = _997 ? 0 : 1;
    float _1067 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _935);
    bool _1069 = !_1051;
    int _1071 = _1069 ? 0 : 1;
    float _1073 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1063);
    float _1075 = -_127;
    float _1077 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[76].x, _939);
    bool _1079 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1081 = isnan(1.0);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1087 = _1083 || _1085;
    int _1089 = abs(_1071);
    float _1091 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1073);
    float _1093 = -_1031;
    float _1095 = _1093 + 1.0;
    float _1097 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _941);
    bool _1099 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1089);
    bool _1111 = !_1055;
    int _1113 = _1111 ? 0 : 1;
    float _1115 = float(_1005);
    float _1117 = _1109 * _1061;
    float _1119 = _1107 ? _1095 : 0.0;
    float _1121 = _901 + (-0.5);
    int _1123 = ~_1065;
    int _1125 = _1123 + 1;
    int _1127 = _1125 + 1;
    float _1129 = _1117 * (-2.0);
    int _1131 = _1127;
    if (!_979)
    {
        int _1133 = ~_1065;
        int _1135 = _1133 + 1;
        _1131 = _1135;
    }
    int _1137 = _1131;
    float _1139 = _1115 * _127;
    int _1141 = abs(_1113);
    if (_1087)
    {
        float _1143 = _1119 * _921;
        _129 = _1143;
    }
    float _1145 = _129;
    float _1147 = fma(_1129, _1043, _1043);
    float _1149 = float(_1137);
    float _1151 = float(_1141);
    float _1153 = fma(_961, _1129, _961);
    int _1155 = _1015 ? 0 : 1;
    float _1157 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1147);
    bool _1159 = !_1059;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1151 * _1149;
    int _1165 = ~_1155;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    float _1171 = _903 + _893;
    int _1173 = _1169;
    if (!_1001)
    {
        int _1175 = ~_1155;
        int _1177 = _1175 + 1;
        _1173 = _1177;
    }
    int _1179 = _1173;
    float _1181 = fma(_1153, _1145, _1157);
    int _1183 = abs(_1161);
    float _1185 = _1171 + (-1.0);
    float _1187 = _1163 * (-2.0);
    float _1189 = float(_1179);
    float _1191 = _903 + (-0.5);
    float _1193 = float(_1183);
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1197 = fma(_1187, _1045, _1045);
    float _1199 = _893 + _901;
    float _1201 = _1193 * _1189;
    float _1203 = fma(_1195, _1187, _1195);
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1197);
    float _1207 = _1199 + (-1.0);
    float _1209 = _1201 * (-2.0);
    float _1211 = _1181 * 0.15915493667125701904296875;
    float _1213 = fma(_1203, _1145, _1205);
    float _1215 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1217 = fma(_1209, _1047, _1047);
    float _1219 = _893 + (-0.5);
    float _1221 = _1211 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = fma(_1215, _1209, _1215);
    float _1227 = _1213 * 0.15915493667125701904296875;
    float _1229 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1217);
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1233 = in.m_42.x;
    float _1235 = in.m_42.y;
    float _1237 = in.m_42.z;
    float _1239 = fma(_1225, _1145, _1229);
    float _1241 = _1211 * 6.283185482025146484375;
    float _1243 = cos(_1241);
    float _1245 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _1247 = _899 * _1245;
    float _1249 = _905 * _1231;
    float _1251 = _1227 * 6.283185482025146484375;
    float _1253 = sin(_1251);
    float _1255 = _1239 * 0.15915493667125701904296875;
    float _1257 = _1227 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = _171 * _1235;
    float _1263 = _159 * _1235;
    float _1265 = _165 * _1235;
    float _1267 = _1255 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    float _1271 = _1223 * _1253;
    float _1273 = fma(_169, _1233, _1261);
    float _1275 = _1243 * _1253;
    float _1277 = fma(_157, _1233, _1263);
    float _1279 = fma(_163, _1233, _1265);
    float _1281 = fma(_173, _1237, _1273);
    float _1283 = _1255 * 6.283185482025146484375;
    float _1285 = sin(_1283);
    float _1287 = _1243 * _1259;
    float _1289 = fma(_161, _1237, _1277);
    float _1291 = _1281 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1293 = _1289 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1295 = _1269 * _1247;
    float _1297 = _1259 * _1269;
    float _1299 = _1223 * _1259;
    float _1301 = _1253 * _1269;
    float _1303 = _1243 * _1295;
    float _1305 = _1223 * _1295;
    float _1307 = fma(_1285, _1287, _1271);
    float _1309 = -_1247;
    float _1311 = _1285 * _1309;
    float _1313 = fma(_1285, _1271, _1287);
    float _1315 = fma(_1307, _1249, _1303);
    float _1317 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1319 = -_1299;
    float _1321 = fma(_1285, _1275, _1319);
    float _1323 = -_1275;
    float _1325 = fma(_1285, _1299, _1323);
    float _1327 = fma(_1297, _1249, _1311);
    float _1329 = fma(_1321, _1317, _1315);
    float _1331 = fma(_1325, _1249, _1305);
    float _1333 = fma(_1301, _1317, _1327);
    float _1335 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1337 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1339 = fma(_1313, _1317, _1331);
    float _1341 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1343 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1335);
    float _1345 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1337);
    float _1347 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1341);
    float _1349 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1343);
    float _1351 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1345);
    float _1353 = fma(_167, _1237, _1279);
    float _1355 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1347);
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1359 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1361 = _1353 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1363 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1365 = _1291 + _1357;
    float _1367 = _1293 + _1359;
    float _1369 = _1361 + _1363;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1373 = _1365 + _1371;
    float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1377 = _1367 + _1375;
    float _1379 = _1373 * _1373;
    float _1381 = fma(_1377, _1377, _1379);
    float _1383 = sqrt(_1381);
    bool _1385 = _1383 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1387 = _1355;
    float _1389 = _1363;
    float _1391 = _1373;
    float _1393 = _1367;
    if (!_1385)
    {
        _1387 = _1367;
    }
    float _1395 = _1387;
    float _1397 = _1395;
    if (!_1385)
    {
        _213 = _1365;
    }
    float _1399 = _213;
    float _1401 = _1399;
    if (!_1385)
    {
        _1389 = _1369;
    }
    float _1403 = _1389;
    bool _1405 = !_1385;
    float _1407 = _1403;
    if (!_1405)
    {
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1413 = _1383 + _1411;
        float _1415 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = rsqrt(_1381);
        float _1419 = _1413 * _1409;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1421 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1425 + (-1.0);
        float _1433 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1435 = fma(_1429, _1415, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1437 = fma(_1369, _1425, _1433);
        float _1439 = _1417 * _1435;
        float _1441 = fma(_1377, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1443 = fma(_1373, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1407 = _1437;
        _1397 = _1441;
        _1401 = _1443;
    }
    float _1445 = _1407;
    float _1447 = _1397;
    float _1449 = _1401;
    float _1451 = -_1361;
    float _1453 = _1451 + _1445;
    float _1455 = -_1293;
    float _1457 = _1455 + _1447;
    float _1459 = -_1291;
    float _1461 = _1459 + _1449;
    float _1463 = _1453 * _1453;
    bool _1465 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1467 = isnan(0.5);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1473 = _1469 || _1471;
    float _1475 = fma(_1457, _1457, _1463);
    float _1477 = fma(_1461, _1461, _1475);
    float _1479 = sqrt(_1477);
    bool _1481 = _1479 > 0.0;
    float _1483 = _1445;
    float _1485 = _1449;
    float _1487 = _1447;
    if (!_1481)
    {
        _1391 = _1447;
    }
    float _1489 = _1391;
    bool _1491 = !_1481;
    float _1493 = _1489;
    if (!_1491)
    {
        float _1495 = _207 * _207;
        float _1497 = fma(_203, _203, _1495);
        float _1499 = fma(_209, _209, _1497);
        float _1501 = rsqrt(_1477);
        float _1503 = sqrt(_1499);
        float _1505 = _1457 * _1501;
        float _1507 = _1453 * _1501;
        float _1509 = _1461 * _1501;
        bool _1511 = _1503 > 0.0;
        float _1513 = _1503;
        _1393 = _1507;
        if (!_1511)
        {
            _1513 = _1447;
        }
        float _1515 = _1513;
        bool _1517 = !_1511;
        _1493 = _1515;
        if (!_1517)
        {
            float _1519 = rsqrt(_1499);
            float _1521 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1523 = _207 * _1519;
            float _1525 = _203 * _1519;
            float _1527 = _1507 * _1523;
            float _1529 = _209 * _1519;
            float _1531 = fma(_1505, _1525, _1527);
            float _1533 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1535 = fma(_1509, _1529, _1531);
            float _1537 = _1535 * _1533;
            float _1539 = fma(_203, _1537, _1447);
            float _1541 = fma(_207, _1537, _1445);
            float _1543 = fma(_209, _1537, _1449);
            _1493 = _1539;
            _1483 = _1541;
            _1485 = _1543;
        }
    }
    float _1545 = _1493;
    float _1547 = _1483;
    float _1549 = _1485;
    float _1551 = _1393;
    float _1553 = _1549;
    float _1555 = _1551;
    if (_1473)
    {
        _215 = _1545;
    }
    float _1557 = _215;
    float _1559 = _1557;
    if (_1473)
    {
        _1487 = _1547;
    }
    float _1561 = _1487;
    float _1563 = _1561;
    if (_1473)
    {
        _217 = _1549;
    }
    float _1565 = _217;
    float _1567 = _1565;
    if (!_1473)
    {
        float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1571 = _1361 + _1569;
        float _1573 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1575 = _1293 + _1573;
        float _1577 = -_1293;
        float _1579 = _1577 + _1545;
        float _1581 = -_1361;
        float _1583 = _1581 + _1547;
        float _1585 = _1571 * _1571;
        float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1589 = _1291 + _1587;
        float _1591 = -_1291;
        float _1593 = _1591 + _1549;
        float _1595 = fma(_1575, _1575, _1585);
        float _1597 = fma(_1589, _1589, _1595);
        float _1599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1601 = sqrt(_1597);
        float _1603 = precise::min(_1601, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1605 = _1603 * _1599;
        float _1607 = fma(_1579, _1605, _1293);
        float _1609 = fma(_1583, _1605, _1361);
        float _1611 = fma(_1593, _1605, _1291);
        _1563 = _1609;
        _1559 = _1607;
        _1567 = _1611;
        _219 = _1601;
        _1553 = _1593;
    }
    float _1613 = _1563;
    float _1615 = _1559;
    float _1617 = _1567;
    float _1619 = _219;
    float _1621 = _1553;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1625 = _1613 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1629 = _1615 + _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1633 = _1617 + _1631;
    float _1635 = _1625 * _1625;
    float _1637 = fma(_1629, _1629, _1635);
    float _1639 = fma(_1633, _1633, _1637);
    float _1641 = rsqrt(_1639);
    float _1643 = sqrt(_1639);
    float _1645 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1647 = _1629 * _1645;
    float _1649 = _1633 * _1645;
    float _1651 = _1647 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 + _1653;
    float _1657 = sqrt(_1655);
    bool _1659 = _1657 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = _1657 + _1661;
    float _1665 = _1641;
    float _1667 = _1663;
    float _1669 = _1619;
    float _1671 = _1625;
    if (_1659)
    {
        float _1673 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1665 = _1673;
    }
    float _1675 = _1665;
    float _1677 = _1675;
    if (_1659)
    {
        float _1679 = _1663 * _1675;
        _1667 = _1679;
    }
    float _1681 = _1667;
    if (_1659)
    {
        float _1683 = rsqrt(_1655);
        _1677 = _1683;
    }
    float _1685 = _1677;
    float _1687 = _1685;
    if (_1659)
    {
        float _1689 = _1681 * 0.15915493667125701904296875;
        _1669 = _1689;
    }
    float _1691 = _1669;
    float _1693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1695 = _1633;
    float _1697 = _1691;
    if (_1659)
    {
        float _1699 = _1691 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        _1695 = _1701;
    }
    float _1703 = _1695;
    float _1705 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1707 = precise::max(0.0, _1693);
    float _1709 = _1621;
    float _1711 = _1707;
    if (_1659)
    {
        float _1713 = _1691 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1709 = _1715;
    }
    float _1717 = _1709;
    float _1719 = -_1645;
    float _1721 = -_1707;
    float _1723 = fma(_1625, _1719, _1721);
    if (_1659)
    {
        float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1671 = _1725;
    }
    float _1727 = _1671;
    float _1729 = _1703;
    float _1731 = _1727;
    if (_1659)
    {
        float _1733 = fma(_1703, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1729 = _1733;
    }
    float _1735 = _1729;
    float _1737 = _1735;
    if (!_1659)
    {
        _1731 = _1723;
    }
    float _1739 = _1731;
    float _1741 = _1739;
    if (_1659)
    {
        float _1743 = _1685 * _1735;
        _1555 = _1743;
    }
    float _1745 = _1555;
    if (!_1659)
    {
        _1687 = _1647;
    }
    float _1747 = _1687;
    float _1749 = _1747;
    float _1751 = _1717;
    if (_1659)
    {
        float _1753 = _1717 + (-1.0);
        _1711 = _1753;
    }
    float _1755 = _1711;
    float _1757 = _1755;
    if (_1659)
    {
        float _1759 = _1647 * _1745;
        _1749 = _1759;
    }
    float _1761 = _1749;
    if (!_1659)
    {
        _1737 = _1651;
    }
    float _1763 = _1737;
    float _1765 = _1763;
    if (_1659)
    {
        float _1767 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1697 = _1767;
    }
    float _1769 = _1697;
    if (!_1659)
    {
        _1757 = _1649;
    }
    float _1771 = _1757;
    float _1773 = _1771;
    if (_1659)
    {
        float _1775 = _1649 * _1745;
        _1773 = _1775;
    }
    float _1777 = _1773;
    if (_1659)
    {
        float _1779 = _1761 * _1761;
        _1765 = _1779;
    }
    float _1781 = _1765;
    if (_1659)
    {
        float _1783 = fma(_1723, _1717, _1769);
        _1741 = _1783;
    }
    float _1785 = _1741;
    if (!_1659)
    {
        _1751 = _1653;
    }
    float _1787 = _1751;
    float _1789 = _1787;
    if (_1659)
    {
        float _1791 = _1777 * _1777;
        _1789 = _1791;
    }
    float _1793 = _1789;
    float _1795 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1797 = fma(_1785, _1785, _1781);
    float _1799 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1795);
    float _1801 = _1797 + _1793;
    float _1803 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1643, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1799);
    float _1813 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1815 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1803);
    float _1817 = rsqrt(_1801);
    float _1819 = _1613 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1821 = -_1809;
    float _1823 = _1821 + 1.0;
    float _1825 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1827 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1813);
    float _1829 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1819);
    float _1831 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1815);
    float _1833 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1835 = abs(_1823);
    float _1837 = log2(_1835);
    float _1839 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1829);
    float _1841 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1827);
    float _1843 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1845 = -_1833;
    float _1847 = fma(_1845, _1705, 1.0);
    float _1849 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1851 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1853 = _1817 * _1761;
    float _1855 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1857 = _1817 * _1785;
    float _1859 = _1817 * _1777;
    float _1861 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1863 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1851);
    float _1865 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1867 = log2(_1847);
    float _1869 = -_1861;
    float _1871 = fma(_1857, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1869);
    float _1873 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1875 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1863);
    float _1877 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1865);
    float _1879 = -_1859;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1871);
    float _1883 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1885 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1875);
    float _1887 = exp2(_1873);
    float _1889 = fma(_1881, -0.5, 0.5);
    float _1891 = fma(_1881, 0.5, 0.5);
    float _1893 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1883);
    float _1895 = _1857 + 1.0;
    float _1897 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1877);
    float _1899 = fma(_1891, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1901 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1893);
    float _1903 = 1.0 / _1885;
    float _1905 = _1867 * 0.693147182464599609375;
    float _1907 = fma(_1891, _1899, -0.212114393711090087890625);
    float _1909 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1911 = fma(_1891, _1907, 1.570728778839111328125);
    float _1913 = sqrt(_1889);
    float _1915 = -_1857;
    float _1917 = fma(_1887, _1895, _1915);
    float _1919 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1897);
    float _1921 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1901);
    float _1923 = fma(_1917, 0.5, 0.5);
    float _1925 = _1919 * _1903;
    float _1927 = _1921 * _1903;
    float _1929 = fma(_1925, 0.5, 0.5);
    float _1931 = fma(_1927, -0.5, 0.5);
    float _1933 = _1913 * 0.636619746685028076171875;
    float _1935 = -_1911;
    float _1937 = fma(_1933, _1935, 1.0);
    float3 _5944 = float3(_1929, _1931, _1909);
    float _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5944, float3(0.0), isnan(_5944)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5944, float3(0.0), isnan(_5944)), level(0.0)).x;
    float3 _5955 = float3(_1929, _1931, _1909);
    float4 _1942 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5955, float3(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5955, float3(0.0), isnan(_5955)), level(0.0)).xyzw;
    float _1944 = _1942.x;
    float _1946 = _1942.y;
    float _1948 = _1942.z;
    float _1950 = _1942.w;
    float2 _5972 = float2(_1937, _1923);
    float3 _1954 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5972, float2(0.0), isnan(_5972)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5972, float2(0.0), isnan(_5972)), level(0.0)).xyz;
    float _1956 = _1954.x;
    float _1958 = _1954.y;
    float _1960 = _1954.z;
    float _1962 = float(uint(_1005));
    float _1964 = trunc(_1041);
    int _1966 = int(_1964);
    int _1968 = ~_1005;
    int _1970 = _1968 + 1;
    float _1972 = -_1091;
    float _1974 = _1972 + 1.0;
    int _1976 = abs(_985);
    float _1978 = -_1067;
    float _1980 = _1978 + 1.0;
    int _1982 = abs(_1029);
    bool _1984 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1986 = isnan(_889);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    float _1996 = 1.0 / _1962;
    float _1998 = float(uint(_1966));
    float _2000 = 1.0 / _891;
    int _2002 = ~_1005;
    int _2004 = _2002 + 1;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2006;
    int _2010 = as_type<int>(_1996) + (-2);
    float _2012 = as_type<float>(_2010) * _1998;
    float _2014 = _1139 * _2000;
    float _2016 = trunc(_2012);
    float _2018 = precise::max(_2016, 0.0);
    uint _2021 = uint(_2018);
    float _2023 = trunc(_2014);
    int _2025 = int(_2023);
    int _2027 = _1970 * int(_2021);
    int _2029 = _2027 + _1966;
    float _2031 = float(uint(_2029));
    float _2033 = as_type<float>(_2010) * _2031;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2037 = _2035 != 0;
    float _2039 = trunc(_2033);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    bool _2045 = !_2037;
    float _2047 = _2045 ? 7.345489978790283203125 : 1.0;
    float _2049 = _2047 * _901;
    float _2051 = floor(_2049);
    int _2053 = int(_2021) + int(_2043);
    float _2055 = float(_1966);
    int _2057 = _2004 * _2053;
    int _2059 = _2057 + _1966;
    bool _2061 = _2055 >= _1115;
    bool _2063 = isnan(_2055);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(_1115);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = -_2051;
    float _2075 = _2049 + _2073;
    bool _2077 = uint(_2059) >= uint(_1005);
    float _2079 = trunc(_2071);
    int _2081 = int(_2079);
    bool _2083 = !_2077;
    int _2085 = _2083 ? 0 : (-1);
    bool _2087 = _1005 == 0;
    int _2089 = ~_2053;
    int _2091 = _2089 + _2085;
    int _2093 = _2091 + 1;
    float _2095 = _2075 * _1115;
    int _2097 = _1005 + (-1);
    int _2099 = _1005 * _2093;
    int _2101 = _2099 + _1966;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2105 = _2103 != 0;
    float _2107 = trunc(_2095);
    int _2109 = int(_2107);
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2113 = _2111 != 0;
    int _2115 = ~_2081;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    bool _2121 = !_2087;
    int _2123 = _2121 ? _2101 : (-1);
    bool _2125 = !_2105;
    int _2127 = _2125 ? 0 : 1;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2131 = _2129 != 0;
    int _2133 = _2123 * _2119;
    int _2135 = abs(_2127);
    bool _2137 = !_2131;
    int _2139 = _2137 ? 0 : 1;
    int _2141 = _2081 * _2097;
    int _2143 = _2141 + _2133;
    int _2145 = abs(_1025);
    int _2147 = _2143 * _1976;
    int _2149 = abs(_2139);
    int _2151 = _2109 * _2135;
    int _2153 = _2151 + _1966;
    int _2155 = _2025 * _2145;
    int _2157 = _2155 + _2147;
    int _2159 = ~_1005;
    int _2161 = _2159 + 1;
    int _2163 = _2153 * _1982;
    int _2165 = _2163 + _2157;
    int _2167 = ~_1005;
    int _2169 = _2167 + 1;
    int _2171 = ~_1005;
    int _2173 = _2171 + 1;
    int _2175 = _2109 * _2149;
    int _2177 = _2175 + _2165;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2181 = _2179 != 0;
    float _2183 = float(uint(_2177));
    float _2185 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2185;
    float _2189 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2193 = as_type<float>(_2010) * _2183;
    float _2195 = 1.0 / _2187;
    float _2197 = trunc(_2193);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    float _2203 = 1.0 / _2191;
    int _2205 = _2161 * int(_2201);
    int _2207 = _2205 + _2177;
    float _2209 = float(uint(_2207));
    float _2211 = as_type<float>(_2010) * _2209;
    float _2213 = trunc(_2211);
    float _2215 = precise::max(_2213, 0.0);
    uint _2217 = uint(_2215);
    int _2219 = int(_2201) + int(_2217);
    float _2221 = float(uint(_2153));
    int _2223 = _2169 * _2219;
    int _2225 = _2223 + _2177;
    bool _2227 = uint(_2225) >= uint(_1005);
    bool _2229 = !_2227;
    int _2231 = _2229 ? 0 : (-1);
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2235 = _2233 != 0;
    int _2237 = ~_2219;
    int _2239 = _2237 + _2231;
    int _2241 = _2239 + 1;
    float _2243 = as_type<float>(_2010) * _2221;
    int _2245 = _1005 * _2241;
    int _2247 = _2245 + _2177;
    float _2249 = trunc(_2243);
    float _2251 = precise::max(_2249, 0.0);
    uint _2253 = uint(_2251);
    bool _2255 = !_2087;
    int _2257 = _2255 ? _2247 : (-1);
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _2267 = _2257 >> 31;
    float _2269 = 1.0 / _2261;
    int _2271 = _2257 & 3;
    bool _2273 = _2271 != 0;
    int _2275 = _2267 & 3;
    bool _2277 = uint(_2271) > 1u;
    int _2279 = _2257 + _2275;
    float _2281 = 1.0 / _2265;
    int _2283 = _2279 >> 2;
    int _2285 = _2257 & 3;
    bool _2287 = _2285 != 0;
    int _2289 = _2173 * int(_2253);
    int _2291 = _2289 + _2153;
    int _2293 = _2283 << 4;
    int _2295 = _2293 + 368;
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2299 = _889 + _2297;
    int _2301 = _2287 ? 0 : 1;
    float _2303 = float(uint(_2291));
    int _2305 = _2295 + 8;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
    int _2311 = int(_2307) & 3;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[int(_2309)][_2311];
    int _2315 = int(_2307) + 1;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    int _2319 = _2315 & 3;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[int(_2317)][_2319];
    int _2323 = ~_2301;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    float _2329 = _2299 * _2269;
    int _2331 = _2327;
    if (!_2277)
    {
        int _2333 = ~_2301;
        int _2335 = _2333 + 1;
        _2331 = _2335;
    }
    int _2337 = _2331;
    float _2339 = as_type<float>(_2010) * _2303;
    bool _2341 = uint(_2271) >= 2u;
    uint _2343 = uint(int(uint(_2295) >> uint(2)));
    uint _2345 = uint(int(uint(int(_2343)) >> uint(2)));
    int _2347 = int(_2343) & 3;
    float _2349 = (*spvDescriptorSet0.vp_c9)._m0[int(_2345)][_2347];
    int _2351 = int(_2343) + 1;
    uint _2353 = uint(int(uint(_2351) >> uint(2)));
    int _2355 = _2351 & 3;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[int(_2353)][_2355];
    bool _2359 = _903 > 0.5;
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2363 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _2361;
    float _2365 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2367 = _889 + _2365;
    bool _2369 = !_2273;
    int _2371 = _2369 ? 0 : 1;
    float _2373 = trunc(_2339);
    float _2375 = precise::max(_2373, 0.0);
    uint _2377 = uint(_2375);
    bool _2379 = _901 > 0.5;
    float _2381 = _2367 * _2203;
    int _2383 = _2341 ? 0 : 1;
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2387 = _889 + _2385;
    bool _2389 = _2271 != 3;
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2393 = _889 + _2391;
    int _2395 = ~_1005;
    int _2397 = _2395 + 1;
    float _2399 = 1.0 / _2363;
    float _2401 = -_187;
    int _2403 = _2379 ? as_type<int>(_2401) : as_type<int>(_187);
    float _2405 = _2387 * _2195;
    float _2407 = _2393 * _2281;
    float _2409 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2411 = _889 + _2409;
    bool _2413 = !_2113;
    float _2415 = _2413 ? _187 : as_type<float>(_2403);
    int _2417 = abs(_2337);
    int _2419 = abs(_2371);
    bool _2421 = _2271 != 3;
    int _2423 = ~_2417;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    float _2429 = _2411 * _2399;
    int _2431 = ~_2383;
    int _2433 = _2431 + 1;
    int _2435 = _2433 + 1;
    int _2437 = _2435;
    if (_2389)
    {
        int _2439 = ~_2383;
        int _2441 = _2439 + 1;
        _2437 = _2441;
    }
    int _2443 = _2437;
    int _2445 = ~_2419;
    int _2447 = _2445 + 1;
    int _2449 = _2447 + 1;
    int _2451 = abs(_2443);
    int _2453 = int(_2253) + int(_2377);
    int _2455 = ~_2451;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = _2397 * _2453;
    int _2463 = _2461 + _2153;
    int _2465 = _2427 * as_type<int>(_2357);
    bool _2467 = !_2421;
    int _2469 = _2467 ? 0 : (-1);
    bool _2471 = uint(_2463) >= uint(_1005);
    int _2473 = _2449 * as_type<int>(_2349);
    int _2475 = _2473 + _2465;
    float _2477 = -_191;
    int _2479 = _2359 ? as_type<int>(_2477) : as_type<int>(_191);
    int _2481 = abs(_2469);
    int _2483 = _2459 * as_type<int>(_2313);
    int _2485 = _2483 + _2475;
    bool _2487 = !_2471;
    int _2489 = _2487 ? 0 : (-1);
    float _2491 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2493 = int(_2491);
    bool _2495 = !_2181;
    float _2497 = _2495 ? _191 : as_type<float>(_2479);
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2499;
    bool _2503 = !_2235;
    int _2505 = _2503 ? 0 : 1;
    int _2507 = ~_2453;
    int _2509 = _2507 + _2489;
    int _2511 = _2509 + 1;
    int _2513 = ~_2481;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = abs(_2505);
    int _2521 = _1005 * _2511;
    int _2523 = _2521 + _2153;
    int _2525 = _2517 * as_type<int>(_2321);
    int _2527 = _2525 + _2485;
    int _2529 = ~_2519;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    float _2535 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2537 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2535;
    float _2539 = float(uint(_2493));
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2547 = _2545 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _2549 = _2527 * _2533;
    float _2551 = 1.0 / _2539;
    float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2555 = _2553 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _2557 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _2559 = isnan(_889);
    bool _2561 = _2557 || _2559;
    bool _2563 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _2565 = _2561 || _2563;
    float _2567 = float(_2565);
    float _2569 = fma(_2537, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _2571 = !_2087;
    int _2573 = _2571 ? _2523 : (-1);
    float _2575 = fma(_2555, _2381, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2577 = fma(_2543, _2381, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2579 = fma(_2501, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2581 = fma(_2547, _2381, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _2583 = abs(_2493);
    float _2585 = -_2567;
    float _2587 = _2585 + 1.0;
    bool _2589 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2591 = isnan(_889);
    bool _2593 = _2589 || _2591;
    bool _2595 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2597 = _2593 || _2595;
    float _2599 = float(_2597);
    int _2601 = _2573 * _2519;
    int _2603 = _2601 + _2549;
    float _2605 = float(uint(_2583));
    float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2609 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2607;
    bool _2611 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2613 = isnan(_889);
    bool _2615 = _2611 || _2613;
    bool _2617 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2619 = _2615 || _2617;
    float _2621 = float(_2619);
    float _2623 = _2599 * _2587;
    float _2625 = -_2599;
    float _2627 = _2625 + 1.0;
    float _2629 = 1.0 / _2605;
    float _2631 = fma(_2609, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _2633 = as_type<int>(_2551) + (-2);
    float _2635 = _2621 * _2627;
    float _2637 = float(uint(_2603));
    float _2639 = -_2621;
    float _2641 = _2639 + 1.0;
    bool _2643 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2645 = isnan(_889);
    bool _2647 = _2643 || _2645;
    bool _2649 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2651 = _2647 || _2649;
    float _2653 = float(_2651);
    bool _2655 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2657 = isnan(_889);
    bool _2659 = _2655 || _2657;
    bool _2661 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2663 = _2659 || _2661;
    float _2665 = float(_2663);
    float _2667 = as_type<float>(_2633) * _2637;
    int _2669 = ~_2493;
    int _2671 = _2669 + 1;
    float _2673 = _2653 * _2641;
    float _2675 = -_2653;
    float _2677 = _2675 + 1.0;
    int _2679 = abs(_2603);
    float _2681 = trunc(_2667);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    float _2687 = -_2665;
    float _2689 = _2687 + 1.0;
    float _2691 = _2665 * _2677;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2695 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2693;
    int _2697 = as_type<int>(_2629) + (-2);
    float _2699 = _1994 * _2689;
    float _2701 = float(uint(_2679));
    float _2703 = fma(_2695, _2329, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2705 = _2579 * _2699;
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2711 = as_type<float>(_2697) * _2701;
    float _2713 = fma(_2008, _2329, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2715 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2717 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2715;
    bool _2719 = _2493 == 0;
    int _2721 = _2671 * int(_2685);
    int _2723 = _2721 + _2603;
    float _2725 = trunc(_2711);
    float _2727 = precise::max(_2725, 0.0);
    uint _2729 = uint(_2727);
    float _2731 = fma(_2717, _2329, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2733 = float(uint(_2723));
    float _2735 = _2569 * _2699;
    float _2737 = _2631 * _2699;
    int _2739 = ~_2583;
    int _2741 = _2739 + 1;
    float _2743 = -_1994;
    float _2745 = _2743 + 1.0;
    float _2747 = as_type<float>(_2633) * _2733;
    float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2751 = _2749 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2753 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2735);
    float _2755 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2705);
    float _2757 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2737);
    float _2759 = fma(_2709, _2407, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2761 = trunc(_2747);
    float _2763 = precise::max(_2761, 0.0);
    uint _2765 = uint(_2763);
    int _2767 = _2741 * int(_2729);
    int _2769 = _2767 + _2679;
    float _2771 = fma(_2577, _2691, _2755);
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2775 = _2773 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2777 = fma(_2575, _2691, _2753);
    float _2779 = fma(_2581, _2691, _2757);
    float _2781 = float(uint(_2769));
    float _2783 = fma(_2751, _2407, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2785 = fma(_2703, _2673, _2777);
    float _2787 = fma(_2775, _2407, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _2789 = as_type<float>(_2697) * _2781;
    float _2791 = fma(_2731, _2673, _2779);
    float _2793 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2795 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _2793;
    int _2797 = int(_2685) + int(_2765);
    float _2799 = trunc(_2789);
    float _2801 = precise::max(_2799, 0.0);
    uint _2803 = uint(_2801);
    int _2805 = ~_2493;
    int _2807 = _2805 + 1;
    float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2811 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _2813;
    float _2817 = fma(_2795, _2429, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _2819 = fma(_2787, _2635, _2791);
    int _2821 = _2807 * _2797;
    int _2823 = _2821 + _2603;
    float _2825 = fma(_2811, _2429, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _2827 = fma(_2815, _2429, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    int _2829 = ~_2583;
    int _2831 = _2829 + 1;
    float _2833 = fma(_2713, _2673, _2771);
    bool _2835 = uint(_2823) >= uint(_2493);
    float _2837 = fma(_2759, _2635, _2785);
    float _2839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2841 = fma(_2783, _2635, _2833);
    bool _2843 = !_2835;
    int _2845 = _2843 ? 0 : (-1);
    float _2847 = fma(_2817, _2623, _2837);
    int _2849 = int(_2729) + int(_2803);
    float _2851 = fma(_2825, _2623, _2841);
    int _2853 = ~_2797;
    int _2855 = _2853 + _2845;
    int _2857 = _2855 + 1;
    float _2859 = fma(_2827, _2623, _2819);
    bool _2861 = _2493 == 0;
    int _2863 = _2831 * _2849;
    int _2865 = _2863 + _2679;
    float _2867 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2869 = _2493 * _2857;
    int _2871 = _2869 + _2603;
    int _2873 = _2603 ^ _2493;
    float _2875 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2847);
    bool _2877 = uint(_2865) >= uint(_2583);
    float _2879 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2851);
    float _2881 = fma(_2567, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2859);
    uint _2883 = uint(int(uint(_2873) >> uint(31)));
    float _2885 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2887 = !_2877;
    int _2889 = _2887 ? 0 : (-1);
    float _2891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2893 = !_2861;
    int _2895 = _2893 ? _2871 : (-1);
    float _2897 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2867);
    int _2899 = ~_2889;
    int _2901 = _2849 + _2899;
    int _2903 = _2901 + 1;
    float _2905 = _2415 + 0.5;
    int _2907 = ~int(_2883);
    int _2909 = _2907 + 1;
    float _2911 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2897);
    float _2913 = float(_2895);
    float _2915 = exp2(_2885);
    float _2917 = _2839 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2919 = _2903 ^ _2909;
    float _2921 = _2879 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2923 = _2881 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2925 = fma(_2917, _2913, _1077);
    int _2927 = ~_2909;
    int _2929 = _2927 + _2919;
    int _2931 = _2929 + 1;
    float _2933 = _2875 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2935 = _2921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2937 = fma(_2917, _2905, _2925);
    bool _2939 = !_2719;
    int _2941 = _2939 ? _2931 : (-1);
    float _2943 = _2891 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2945 = _2497 + (-0.5);
    float _2947 = _2933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2949 = float(_2941);
    float _2951 = _2923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2953 = -_2915;
    float _2955 = _2953 + 1.0;
    float _2957 = -_1974;
    float _2959 = fma(_2415, _2957, _2937);
    float _2961 = -_1097;
    float _2963 = fma(_2943, _2949, _2961);
    float _2965 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2911);
    float _2967 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2947;
    out.m_68.y = _2935;
    out.m_68.z = _2951;
    float _2969 = -_2943;
    float _2971 = fma(_2969, _2945, _2963);
    float _2973 = _2965 + _1885;
    float _2975 = _2967 * _1939;
    out.gl_Position.x = _1919;
    out.gl_Position.y = _1921;
    out.gl_Position.z = _2965;
    out.gl_Position.w = _1885;
    float _2977 = fma(_2497, _1980, _2971);
    float _2979 = _2973 * 0.5;
    float _2981 = _1960 * _2975;
    float _2983 = -_2967;
    float _2985 = _2983 + 1.0;
    out.m_70.x = _2959;
    out.m_70.y = _2977;
    float _2987 = _1950 * _2975;
    float _2989 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2991 = _1950 * _2985;
    float _2993 = fma(_1950, _2981, _1948);
    float _2995 = fma(_1956, _2987, _1944);
    float _2997 = fma(_1958, _2987, _1946);
    out.m_72.z = _2979;
    out.m_72.w = _1885;
    out.m_45.x = _2989;
    out.m_74.x = _2995;
    out.m_74.y = _2997;
    out.m_74.z = _2993;
    out.m_74.w = _2991;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

