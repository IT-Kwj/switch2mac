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
    float4 m_70 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_78 [[user(locn8)]];
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _535 = false;
    bool _337 = false;
    bool _235 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3138 = as_type<float>(_113);
        out.gl_Position.z = _3138;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3207 = as_type<float>(_151);
        out.gl_Position.z = _3207;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = in.m_52.x;
    float _157 = in.m_52.y;
    float _159 = in.m_52.z;
    float _161 = in.m_54.x;
    float _163 = in.m_54.y;
    float _165 = in.m_54.z;
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    int _179 = as_type<int>(_153) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_153) & 2;
    bool _185 = _183 != 0;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _189 = !_181;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_185;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _157 * _163;
    float _199 = _157 * _169;
    float _201 = fma(_155, _161, _197);
    float _203 = _157 * _175;
    float _205 = fma(_155, _167, _199);
    float _207 = fma(_159, _165, _201);
    float _209 = fma(_155, _173, _203);
    float _211 = fma(_159, _171, _205);
    float _213 = fma(_159, _177, _209);
    bool _215 = !_187;
    float _233;
    if (!_215)
    {
        float _217 = in.m_60.x;
        float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _225 = _223 * _219;
        float _227 = floor(_225);
        float _229 = -_227;
        float _231 = _225 + _229;
        _233 = _231;
        _235 = true;
    }
    else
    {
        float _237 = float(_97);
        float _239 = 1.0 / _237;
        float _241 = _131 * _239;
        _233 = _241;
    }
    _235 = false;
    float _243 = _233;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    bool _249 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _251 = isnan(_243);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _261;
    float _265 = -_259;
    float _267 = _265 + 1.0;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _281;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _263;
    float _289 = _279 * _267;
    float _291 = -_279;
    float _293 = _291 + 1.0;
    float _295 = _247 * _287;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _297;
    float _301 = fma(_283, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_299, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = _301 * _289;
    float _307 = _303 * _289;
    float _309 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _305);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _307);
    float _313 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].x, _309);
    float _315 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].y, _311);
    bool _317 = !_285;
    float _335;
    if (!_317)
    {
        float _319 = in.m_60.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        float _339 = float(_97);
        float _341 = 1.0 / _339;
        float _343 = _131 * _341;
        _335 = _343;
    }
    _337 = false;
    float _345 = _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _349 = _345 + _347;
    float _351 = in.m_62.x;
    float _353 = in.m_62.y;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _363 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _365 = isnan(_345);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _379 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _381 = isnan(_345);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = 1.0 / _357;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _393;
    float _397 = -_373;
    float _399 = _397 + 1.0;
    bool _401 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _403 = isnan(_345);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    bool _413 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _415 = 1.0 / _361;
    float _417 = 1.0 / _377;
    float _419 = _395 * _391;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _425 = _389 * _399;
    float _427 = -_389;
    float _429 = _427 + 1.0;
    float _431 = fma(_419, _349, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _433;
    float _437 = _315 * _353;
    float _439 = _411 * _429;
    float _441 = _423 * _415;
    bool _443 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _445 = isnan(_345);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _345 + _455;
    float _459 = _431 * _439;
    float _461 = -_411;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = _345 + _465;
    float _469 = fma(_441, _457, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _471 = _435 * _417;
    float _473 = -_453;
    float _475 = _473 + 1.0;
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[115].x, _459);
    float _479 = fma(_471, _467, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _481 = _373 * _475;
    float _483 = fma(_469, _425, _477);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _487 = _313 * _351;
    float _489 = fma(_479, _481, _483);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[118].x, _489);
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _495 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _503 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _493;
    out.m_64.y = _499;
    out.m_64.z = _503;
    out.m_64.w = _501;
    bool _505 = !_413;
    float _529;
    float _531;
    float _533;
    if (!_505)
    {
        float _507 = in.m_60.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _511 = float(_97);
        float _513 = 1.0 / _511;
        float _515 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _517 = _131 * _513;
        float _519 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _521 = _519 * _509;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _517;
        _531 = _527;
        _533 = _511;
        _535 = true;
    }
    else
    {
        float _537 = float(_97);
        float _539 = 1.0 / _537;
        float _541 = _131 * _539;
        _529 = _541;
        _531 = _541;
        _533 = _537;
    }
    _535 = false;
    float _543 = _529;
    float _545 = _531;
    float _547 = _533;
    float _549 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _551 = int(_549);
    float _553 = in.m_60.x;
    float _555 = in.m_60.y;
    float _557 = in.m_60.z;
    float _559 = in.m_60.w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _563 = _543 + _561;
    float _565 = in.m_42.x;
    float _567 = in.m_42.y;
    float _569 = in.m_42.z;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _573 = _543 + _571;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _577 = int(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _593 = _543 + _591;
    float _595 = 1.0 / _585;
    float _597 = float(_551);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _613 = _543 + _611;
    float _615 = 1.0 / _597;
    bool _617 = _559 > 0.5;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _637 = _635 != 0;
    float _639 = _175 * _567;
    float _641 = float(uint(_577));
    float _643 = _163 * _567;
    float _645 = -_195;
    int _647 = _617 ? as_type<int>(_645) : as_type<int>(_195);
    float _649 = _169 * _567;
    bool _651 = !_633;
    int _653 = _651 ? 0 : 1;
    float _655 = 1.0 / _641;
    bool _657 = _553 > 0.5;
    float _659 = fma(_161, _565, _643);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _663 = _661 != 0;
    float _665 = _615 * _131;
    float _667 = -_191;
    int _669 = _657 ? as_type<int>(_667) : as_type<int>(_191);
    float _671 = fma(_167, _565, _649);
    float _673 = _553 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _675 = !_663;
    float _677 = _675 ? _191 : as_type<float>(_669);
    float _679 = trunc(_665);
    int _681 = int(_679);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _685 = !_629;
    int _687 = _685 ? 0 : 1;
    float _689 = fma(_173, _565, _639);
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _693 = _691 != 0;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _697 = _555 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _701 = _699 != 0;
    float _703 = 1.0 / _589;
    bool _705 = !_625;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_697, -2.0, _695);
    bool _711 = !_693;
    int _713 = _711 ? 0 : 1;
    float _715 = fma(_171, _569, _671);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _719 = _717 != 0;
    float _721 = -_683;
    float _723 = fma(_673, 2.0, _721);
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _727 = _725 != 0;
    float _729 = 1.0 / _601;
    bool _731 = _555 > 0.5;
    float _733 = fma(_177, _569, _689);
    int _735 = as_type<int>(_655) + (-2);
    float _737 = _553 * 2.0;
    float _739 = float(uint(_681));
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _743 = _545 + _741;
    bool _745 = !_701;
    float _747 = _745 ? _195 : as_type<float>(_647);
    float _749 = 1.0 / _581;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = fma(_165, _569, _659);
    float _765 = as_type<float>(_735) * _739;
    float _767 = _743 * _595;
    float _769 = -_195;
    int _771 = _731 ? as_type<int>(_769) : as_type<int>(_195);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _775 = _545 + _773;
    float _777 = 1.0 / _605;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _783 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _709);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _789 = !_637;
    int _791 = _789 ? 0 : 1;
    float _793 = floor(_737);
    float _795 = _775 * _749;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _805 = _799 * _729;
    int _807 = ~_577;
    int _809 = _807 + 1;
    float _811 = 1.0 / _609;
    bool _813 = !_719;
    float _815 = _813 ? _195 : as_type<float>(_771);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _817;
    bool _821 = _557 > 0.5;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _829 = _827 != 0;
    float _831 = _819 * _703;
    float _833 = 1.0 / _621;
    float _835 = -_191;
    int _837 = _821 ? as_type<int>(_835) : as_type<int>(_191);
    float _839 = _825 * _777;
    bool _841 = _793 >= 0.0;
    bool _843 = isnan(_793);
    bool _845 = _841 || _843;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _851;
    float _855 = fma(_805, _563, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _857 = _849 ? 0 : 1;
    float _859 = trunc(_765);
    float _861 = precise::max(_859, 0.0);
    uint _864 = uint(_861);
    float _866 = _803 * _811;
    float _868 = _555 * 2.0;
    bool _870 = _793 > 0.0;
    float _872 = fma(_831, _593, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    int _874 = ~_857;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = fma(_866, _573, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _882 = !_829;
    float _884 = _882 ? 1.2345600128173828125 : 1.0;
    float _886 = 1.0 / _781;
    float _888 = _853 * _833;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _894 = in.m_54.w;
    float _896 = float(_577);
    float _898 = 1.0 / _787;
    int _900 = _809 * int(_864);
    int _902 = _900 + _681;
    int _904 = _878;
    if (!_870)
    {
        int _906 = ~_857;
        int _908 = _906 + 1;
        _904 = _908;
    }
    int _910 = _904;
    float _912 = float(uint(_902));
    float _914 = floor(_868);
    float _916 = _892 * _886;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _918;
    float _922 = _896 * _131;
    float _924 = fma(_916, _613, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _926 = 1.0 / _547;
    int _928 = abs(_713);
    float _930 = _763 + _894;
    int _932 = abs(_653);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _934;
    bool _938 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _940 = isnan(_543);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = _920 * _898;
    float _952 = as_type<float>(_735) * _912;
    bool _954 = _914 >= 0.0;
    bool _956 = isnan(_914);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    float _964 = _555 + _557;
    bool _966 = !_829;
    float _968 = _966 ? _555 : _553;
    float _970 = trunc(_952);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    float _976 = _962 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _978 = _964 + (-1.0);
    bool _980 = _914 > 0.0;
    float _982 = _555 + _553;
    float _984 = _884 * _968;
    int _986 = ~_577;
    int _988 = _986 + 1;
    float _990 = _922 * _926;
    float _992 = _982 + (-1.0);
    int _994 = ~as_type<int>(_976);
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    float _1000 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1002 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1004 = _557 * 2.0;
    float _1006 = trunc(_990);
    int _1008 = int(_1006);
    int _1010 = int(_864) + int(_974);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1014 = _998;
    float _1016 = as_type<float>(_988);
    float _1018 = _976;
    if (!_980)
    {
        int _1020 = ~as_type<int>(_976);
        int _1022 = _1020 + 1;
        _1014 = _1022;
    }
    int _1024 = _1014;
    if (!_829)
    {
        _1016 = _557;
    }
    float _1026 = _1016;
    int _1028 = _988 * _1010;
    int _1030 = _1028 + _681;
    float _1032 = floor(_1004);
    float _1034 = _1026;
    if (_829)
    {
        _1034 = _555;
    }
    float _1036 = _1034;
    float _1038 = 0.0;
    if (!_829)
    {
        _1038 = _557;
    }
    float _1040 = _1038;
    bool _1042 = uint(_1030) >= uint(_577);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1044;
    float _1048 = _1040;
    if (_829)
    {
        _1048 = _555;
    }
    float _1050 = _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1052;
    float _1056 = fma(_1046, _795, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1062 = !_1042;
    int _1064 = _1062 ? 0 : (-1);
    float _1066 = fma(_1054, _795, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1068 = fma(_936, _795, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1074 = floor(_984);
    bool _1076 = _1032 > 0.0;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1082 = _1032 >= 0.0;
    bool _1084 = isnan(_1032);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = fma(_1072, _767, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1094 = float(_681);
    float _1096 = fma(_1060, _767, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1100 = _543 + _1098;
    float _1102 = fma(_1080, _767, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1104 = _1094 >= _896;
    bool _1106 = isnan(_1094);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(_896);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = in.m_56.w;
    float _1118 = fma(_839, _1100, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _1120 = ~_1010;
    int _1122 = _1120 + _1064;
    int _1124 = _1122 + 1;
    float _1126 = trunc(_1114);
    int _1128 = int(_1126);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1132 = _543 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1136 = _543 + _1134;
    float _1138 = -_1074;
    float _1140 = _984 + _1138;
    int _1142 = ~_577;
    int _1144 = _1142 + 1;
    float _1146 = in.m_58.w;
    float _1148 = fma(_950, _1132, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1150 = _1140 * _896;
    int _1152 = _577 * _1124;
    int _1154 = _1152 + _681;
    int _1156 = _1090 ? 0 : 1;
    float _1158 = trunc(_1150);
    int _1160 = int(_1158);
    bool _1162 = _577 == 0;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1166 = fma(_888, _1136, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1168 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1170 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1164);
    int _1172 = ~_1128;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_1162;
    int _1180 = _1178 ? _1154 : (-1);
    float _1182 = _715 + _1116;
    int _1184 = abs(_687);
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1188 = _1180 * _1176;
    int _1190 = _577 + (-1);
    float _1192 = fma(_1168, -2.0, _1186);
    if (!_829)
    {
        _1018 = _555;
    }
    float _1194 = _1018;
    float _1196 = _733 + _1146;
    int _1198 = abs(_707);
    int _1200 = _1128 * _1190;
    int _1202 = _1200 + _1188;
    int _1204 = _1160 * _928;
    int _1206 = _1204 + _681;
    bool _1208 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1210 = isnan(_545);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    int _1220 = _1202 * _1184;
    bool _1222 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1224 = isnan(_545);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = -_1218;
    float _1236 = _1234 + 1.0;
    bool _1238 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1240 = isnan(_545);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    int _1250 = _1008 * _1198;
    int _1252 = _1250 + _1220;
    float _1254 = _1232 * _1236;
    float _1256 = -_1232;
    float _1258 = _1256 + 1.0;
    int _1260 = abs(_791);
    int _1262 = _1206 * _932;
    int _1264 = _1262 + _1252;
    bool _1266 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1268 = isnan(_543);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = _1248 * _1258;
    bool _1280 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1282 = isnan(_543);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    int _1292 = _1160 * _1260;
    int _1294 = _1292 + _1264;
    bool _1296 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1298 = isnan(_543);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = -_1276;
    float _1310 = _1308 + 1.0;
    float _1312 = _1066 * _1278;
    float _1314 = -_1290;
    float _1316 = _1314 + 1.0;
    float _1318 = float(uint(_1294));
    float _1320 = _1056 * _1278;
    float _1322 = _1068 * _1278;
    float _1324 = _1290 * _1310;
    bool _1326 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1328 = isnan(_543);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1306 * _1316;
    float _1340 = -_1306;
    float _1342 = _1340 + 1.0;
    float _1344 = as_type<float>(_735) * _1318;
    bool _1346 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1348 = isnan(_543);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1012);
    bool _1360 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1362 = isnan(_543);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    float _1372 = _1336 * _1342;
    bool _1374 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1376 = isnan(_543);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -_1336;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1358);
    float _1392 = trunc(_1344);
    float _1394 = precise::max(_1392, 0.0);
    uint _1396 = uint(_1394);
    float _1398 = -_1370;
    float _1400 = _1398 + 1.0;
    float _1402 = _1390 * (-0.15915493667125701904296875);
    float _1404 = _1384 * _1388;
    float _1406 = -_1384;
    float _1408 = _1406 + 1.0;
    float _1410 = _1356 * _1400;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1414 = _1402 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = _1370 * _1408;
    float _1420 = -_1356;
    float _1422 = _1420 + 1.0;
    float _1424 = _1194;
    if (_829)
    {
        _1424 = _553;
    }
    float _1426 = _1424;
    float _1428 = _948 * _1422;
    float _1430 = -_948;
    float _1432 = _1430 + 1.0;
    int _1434 = _1144 * int(_1396);
    int _1436 = _1434 + _1294;
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = sin(_1438);
    float _1442 = _855 * _1428;
    int _1444 = ~_1156;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    float _1450 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1412);
    float _1452 = float(uint(_1436));
    float _1454 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1442);
    int _1456 = _1448;
    if (!_1076)
    {
        int _1458 = ~_1156;
        int _1460 = _1458 + 1;
        _1456 = _1460;
    }
    int _1462 = _1456;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1466 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1468 = log2(_1466);
    float _1470 = as_type<float>(_735) * _1452;
    float _1472 = -_1248;
    float _1474 = _1472 + 1.0;
    float _1476 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1478 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1450);
    float _1480 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1320);
    float _1482 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1312);
    float _1484 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1322);
    float _1486 = trunc(_1470);
    float _1488 = precise::max(_1486, 0.0);
    uint _1490 = uint(_1488);
    float _1492 = fma(_1096, _1254, _1480);
    float _1494 = fma(_1092, _1254, _1482);
    float _1496 = _815 * _1440;
    float _1498 = _815 * _1416;
    float _1500 = fma(_1102, _1254, _1484);
    float _1502 = _1468 * _131;
    float _1504 = -_1496;
    float _1506 = fma(_677, _1416, _1504);
    float _1508 = fma(_677, _1440, _1498);
    float _1510 = exp2(_1502);
    float _1512 = fma(_880, _1410, _1454);
    bool _1514 = !_727;
    float _1516 = _1514 ? _191 : as_type<float>(_837);
    float _1518 = -_1464;
    float _1520 = fma(_1476, 2.0, _1518);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1526 = 1.0 + _1524;
    float _1528 = _1516 + 0.5;
    bool _1530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1532 = isnan(1.0);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1538 = _1534 || _1536;
    float _1540 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1522);
    bool _1542 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1550 = _1546 || _1548;
    float _1552 = 1.0 / _1526;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1556 = int(_1396) + int(_1490);
    float _1558 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1540);
    int _1560 = ~_577;
    int _1562 = _1560 + 1;
    float _1564 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1554);
    float _1566 = -_1510;
    float _1568 = _1566 + 1.0;
    float _1570 = -_131;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[76].x, _723);
    float _1574 = -_131;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1520);
    float _1578 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1564);
    int _1580 = _1562 * _1556;
    int _1582 = _1580 + _1294;
    float _1584 = _1550 ? _1568 : 0.0;
    float _1586 = _747 + (-0.5);
    float _1588 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1192);
    float _1590 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1170);
    float _1592 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1576);
    if (_1538)
    {
        float _1594 = _1584 * _1552;
        _135 = _1594;
    }
    float _1596 = _135;
    bool _1598 = !_757;
    int _1600 = _1598 ? 0 : 1;
    float _1602 = -_1586;
    float _1604 = -_1588;
    float _1606 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1604);
    bool _1608 = uint(_1582) >= uint(_577);
    float _1610 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1494);
    bool _1612 = !_753;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1492);
    int _1618 = abs(_1600);
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1622 = !_1608;
    int _1624 = _1622 ? 0 : (-1);
    float _1626 = -_1590;
    float _1628 = _1626 + 1.0;
    int _1630 = abs(_1614);
    float _1632 = fma(_872, _1418, _1512);
    float _1634 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1500);
    int _1636 = ~_1556;
    int _1638 = _1636 + _1624;
    int _1640 = _1638 + 1;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1644 = float(_1462);
    float _1646 = fma(_1118, _1404, _1632);
    float _1648 = float(_1630);
    int _1650 = _577 * _1640;
    int _1652 = _1650 + _1294;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1656 = _1182 + _1654;
    float _1658 = float(_1618);
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1662 = _930 + _1660;
    float _1664 = float(_910);
    float _1666 = _1648 * _1644;
    bool _1668 = !_1162;
    int _1670 = _1668 ? _1652 : (-1);
    float _1672 = in.m_66.x;
    float _1674 = in.m_66.y;
    float _1676 = in.m_66.z;
    float _1678 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1680 = float(uint(_1206));
    float _1682 = _1658 * _1664;
    int _1684 = _1670 >> 31;
    float _1686 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1678);
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1690 = _1196 + _1688;
    float _1692 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1694 = as_type<float>(_735) * _1680;
    int _1696 = _1684 & 3;
    float _1698 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1686);
    float _1700 = _1508 + (-0.5);
    float _1702 = _1506 + 0.5;
    int _1704 = _1670 + _1696;
    float _1706 = trunc(_1694);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    bool _1712 = _1698 >= 0.0;
    float _1714 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1716 = _1704 >> 2;
    float _1718 = -_1692;
    float _1720 = -_783;
    float _1722 = fma(_1718, _1700, _1720);
    float _1724 = _1666 * (-2.0);
    float _1726 = fma(_1714, _1702, _1572);
    int _1728 = _1716 << 4;
    int _1730 = _1728 + 512;
    float _1732 = fma(_1166, _1372, _1646);
    int _1734 = ~_577;
    int _1736 = _1734 + 1;
    float _1738 = fma(_1724, _1672, _1672);
    uint _1740 = uint(int(uint(_1730) >> uint(2)));
    uint _1742 = uint(int(uint(int(_1740)) >> uint(2)));
    int _1744 = int(_1740) & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    int _1748 = int(_1740) + 1;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    int _1752 = _1748 & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    float _1756 = _1682 * (-2.0);
    float _1758 = fma(_1000, _1724, _1000);
    int _1760 = _1670 & 3;
    bool _1762 = _1760 != 0;
    float _1764 = -_1478;
    float _1766 = _1764 + 1.0;
    int _1768 = _1670 & 3;
    bool _1770 = _1768 != 0;
    float _1772 = fma(_1002, _1756, _1002);
    float _1774 = fma(_1756, _1674, _1674);
    int _1776 = _1736 * int(_1710);
    int _1778 = _1776 + _1206;
    int _1780 = _1730 + 8;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    uint _1784 = uint(int(uint(int(_1782)) >> uint(2)));
    int _1786 = int(_1782) & 3;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[int(_1784)][_1786];
    int _1790 = int(_1782) + 1;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    int _1794 = _1790 & 3;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[int(_1792)][_1794];
    int _1798 = _1762 ? 0 : 1;
    float _1800 = -_1558;
    float _1802 = _1800 + 1.0;
    bool _1804 = uint(_1768) > 1u;
    float _1806 = fma(_924, _1338, _1732);
    float _1808 = float(uint(_1778));
    float _1810 = -_1802;
    float _1812 = fma(_1506, _1810, _1726);
    int _1814 = ~_1798;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = -_1766;
    float _1822 = fma(_1516, _1820, _1592);
    bool _1824 = !_1770;
    int _1826 = _1824 ? 0 : 1;
    float _1828 = as_type<float>(_735) * _1808;
    float _1830 = -_1578;
    float _1832 = _1830 + 1.0;
    float _1834 = fma(_747, _1628, _1606);
    float _1836 = trunc(_1828);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    int _1842 = ~_577;
    int _1844 = _1842 + 1;
    float _1846 = fma(_1508, _1832, _1722);
    int _1848 = _1818;
    if (!_1804)
    {
        int _1850 = ~_1798;
        int _1852 = _1850 + 1;
        _1848 = _1852;
    }
    int _1854 = _1848;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1858 = uint(_1768) >= 2u;
    float _1860 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1862 = abs(_1854);
    float _1864 = _1616 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1866 = _1858 ? 0 : 1;
    float _1868 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1870 = _1768 != 3;
    out.m_68.x = _1812;
    out.m_68.y = _1846;
    out.m_68.z = _1822;
    out.m_68.w = _1834;
    int _1872 = abs(_1826);
    float _1874 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1878 = _1876 != 0;
    float _1880 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1882 = int(_1710) + int(_1840);
    float _1884 = _1868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1886 = fma(_1148, _1324, _1806);
    int _1888 = ~_1866;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = _1892;
    if (_1712)
    {
        out.m_45.x = 0.0;
    }
    int _1896 = ~_1862;
    int _1898 = _1896 + 1;
    int _1900 = _1898 + 1;
    int _1902 = _1844 * _1882;
    int _1904 = _1902 + _1206;
    if (_1870)
    {
        int _1906 = ~_1866;
        int _1908 = _1906 + 1;
        _1894 = _1908;
    }
    int _1910 = _1894;
    out.m_70.x = _1874;
    out.m_70.y = _1880;
    out.m_70.z = _1884;
    out.m_70.w = _1856;
    int _1912 = _1900 * as_type<int>(_1754);
    bool _1914 = _1768 != 3;
    float _1916 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1886);
    bool _1918 = !_1878;
    int _1920 = _1918 ? 0 : 1;
    int _1922 = abs(_1910);
    int _1924 = ~_1872;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    out.m_72.x = _1916;
    bool _1930 = !_1914;
    int _1932 = _1930 ? 0 : (-1);
    bool _1934 = uint(_1904) >= uint(_577);
    int _1936 = _1928 * as_type<int>(_1746);
    int _1938 = _1936 + _1912;
    int _1940 = abs(_1920);
    int _1942 = ~_1922;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    int _1948 = abs(_1932);
    bool _1950 = !_1934;
    int _1952 = _1950 ? 0 : (-1);
    int _1954 = _1946 * as_type<int>(_1788);
    int _1956 = _1954 + _1938;
    float _1958 = _1656 * _1656;
    int _1960 = ~_1940;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = ~_1882;
    int _1968 = _1966 + _1952;
    int _1970 = _1968 + 1;
    float _1972 = fma(_1662, _1662, _1958);
    int _1974 = ~_1948;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = _577 * _1970;
    int _1982 = _1980 + _1206;
    int _1984 = _1978 * as_type<int>(_1796);
    int _1986 = _1984 + _1956;
    float _1988 = fma(_1690, _1690, _1972);
    float _1990 = _553 + (-0.5);
    bool _1992 = !_1162;
    int _1994 = _1992 ? _1982 : (-1);
    int _1996 = _1986 * _1964;
    float _1998 = as_type<float>(_1964);
    if (_1712)
    {
        _1998 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2000 = _1998;
    float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1738);
    float _2004 = rsqrt(_1988);
    int _2006 = _1994 * _1940;
    int _2008 = _2006 + _1996;
    float _2010 = _555 + (-0.5);
    bool _2012 = !_761;
    int _2014 = _2012 ? 0 : 1;
    int _2016 = as_type<int>(_2000);
    if (_1712)
    {
        float _2018 = _2000 * 5.0;
        _2016 = as_type<int>(_2018);
    }
    int _2020 = _2016;
    float _2022 = fma(_2010, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1774);
    int _2024 = abs(_2014);
    float _2026 = fma(_1758, _1596, _2002);
    float _2028 = float(_2008);
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6048 = as_type<float>(_2020);
        out.gl_Position.z = _6048;
    }
    float _2030 = float(_2024);
    out.m_74.y = _2028;
    float _2032 = _1656 * _2004;
    float _2034 = _1662 * _2004;
    float _2036 = _1690 * _2004;
    float _2038 = -_2032;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1656);
    float _2042 = _2034;
    if (_1712)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2044 = -_2032;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _2048 = -_2034;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _930);
    float _2052 = float(_1024);
    float _2054 = -_2034;
    float _2056 = fma(_2054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1662);
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2060 = _2046 + _2058;
    float _2062 = -_2036;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1196);
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2068 = _2050 + _2066;
    float _2070 = _2040 * _2040;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2074 = _557 + _553;
    float _2076 = _2030 * _2052;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2080 = _2064 + _2078;
    float _2082 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2072);
    float _2084 = fma(_2056, _2056, _2070);
    float _2086 = _2074 + (-1.0);
    float _2088 = _2076 * (-2.0);
    float _2090 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2082);
    float _2092 = _557 + (-0.5);
    float _2094 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2096 = fma(_2088, _1676, _1676);
    float _2098 = -_2036;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1690);
    bool _2102 = _2090 >= 0.0;
    float _2104 = fma(_2094, _2088, _2094);
    float _2106 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2096);
    float _2108 = fma(_2100, _2100, _2084);
    float _2110 = fma(_1772, _1596, _2022);
    float _2112 = _2026 * 0.15915493667125701904296875;
    float _2114 = fma(_2104, _1596, _2106);
    float _2116 = _2110 * 0.15915493667125701904296875;
    float _2118 = sqrt(_2108);
    float _2120 = _2114 * 0.15915493667125701904296875;
    float _2122 = _2092;
    float _2124 = _2068;
    if (_2102)
    {
        _2122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2126 = _2122;
    int _2128 = as_type<int>(_2126);
    if (_2102)
    {
        out.m_45.x = 0.0;
    }
    float _2130 = _2112 * 6.283185482025146484375;
    float _2132 = sin(_2130);
    if (_2102)
    {
        float _2134 = _2126 * 5.0;
        _2128 = as_type<int>(_2134);
    }
    int _2136 = _2128;
    if (_2102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6237 = as_type<float>(_2136);
        out.gl_Position.z = _6237;
    }
    float _2138 = _2112 * 6.283185482025146484375;
    float _2140 = cos(_2138);
    float _2142 = _2004 * _2118;
    float _2144 = _2116 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = _2116 * 6.283185482025146484375;
    float _2150 = cos(_2148);
    float _2152 = _2120 * 6.283185482025146484375;
    float _2154 = sin(_2152);
    if (_2102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2156 = _2120 * 6.283185482025146484375;
    float _2158 = cos(_2156);
    float _2160 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2164 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _2168 = _2142 * _2160;
    float _2170 = _2132 * _2146;
    float _2172 = _2142 * _2164;
    float _2174 = _2140 * _2146;
    float _2176 = _2162 * _2168;
    float _2178 = _2140 * _2150;
    float _2180 = _2166 * _2172;
    float _2182 = _2132 * _2150;
    float _2184 = fma(_2154, _2178, _2170);
    float _2186 = fma(_2154, _2170, _2178);
    float _2188 = _2158 * _2176;
    float _2190 = _2140 * _2188;
    float _2192 = _2146 * _2158;
    float _2194 = _2150 * _2158;
    float _2196 = _2132 * _2188;
    float _2198 = fma(_2184, _2180, _2190);
    float _2200 = -_2176;
    float _2202 = _2154 * _2200;
    float _2204 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2206 = _2204 * 0.5;
    float _2208 = -_2182;
    float _2210 = fma(_2154, _2174, _2208);
    float _2212 = -_2174;
    float _2214 = fma(_2154, _2182, _2212);
    float _2216 = fma(_2194, _2180, _2202);
    float _2218 = fma(_2210, _2206, _2198);
    float _2220 = fma(_2214, _2180, _2196);
    float _2222 = fma(_2192, _2206, _2216);
    float _2224 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2226 = fma(_2186, _2206, _2220);
    float _2228 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2230 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2232 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2234 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2228);
    float _2236 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2230);
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2232);
    float _2240 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2234);
    float _2242 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2236);
    float _2244 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2246 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2248 = _2242 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2250 = _1196 + _2244;
    float _2252 = _930 + _2246;
    float _2254 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2258 = _2250 + _2256;
    float _2260 = _1182 + _2248;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2264 = _2252 + _2262;
    float _2266 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2254);
    float _2268 = _2258 * _2258;
    float _2270 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2266);
    float _2272 = fma(_2264, _2264, _2268);
    float _2274 = sqrt(_2272);
    bool _2276 = _2274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2278 = _2248;
    float _2280 = _2230;
    float _2282 = _2266;
    if (!_2276)
    {
        _2278 = _2252;
    }
    float _2284 = _2278;
    float _2286 = _2284;
    if (!_2276)
    {
        _2280 = _2250;
    }
    float _2288 = _2280;
    float _2290 = _2288;
    if (!_2276)
    {
        _2282 = _2260;
    }
    float _2292 = _2282;
    bool _2294 = !_2276;
    float _2296 = _2292;
    if (!_2294)
    {
        float _2298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2302 = _2274 + _2300;
        float _2304 = rsqrt(_2272);
        float _2306 = _2302 * _2298;
        float _2308 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2310 = _2306 * 0.15915493667125701904296875;
        float _2312 = _2310 * 6.283185482025146484375;
        float _2314 = cos(_2312);
        float _2316 = _2310 * 6.283185482025146484375;
        float _2318 = sin(_2316);
        float _2320 = _2314 + (-1.0);
        float _2322 = fma(_2318, _2308, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2324 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2326 = _2304 * _2322;
        float _2328 = fma(_2260, _2314, _2324);
        float _2330 = fma(_2264, _2326, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2332 = fma(_2258, _2326, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2296 = _2328;
        _2286 = _2330;
        _2290 = _2332;
    }
    float _2334 = _2296;
    float _2336 = _2286;
    float _2338 = _2290;
    float _2340 = -_1182;
    float _2342 = _2340 + _2334;
    float _2344 = -_930;
    float _2346 = _2344 + _2336;
    float _2348 = -_1196;
    float _2350 = _2348 + _2338;
    float _2352 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2354 = _2342 * _2342;
    float _2356 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2358 = 1.0 / _2352;
    float _2360 = fma(_2346, _2346, _2354);
    bool _2362 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2364 = isnan(0.5);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2370 = _2366 || _2368;
    bool _2372 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2374 = isnan(0.5);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2380 = _2376 || _2378;
    float _2382 = fma(_2350, _2350, _2360);
    float _2384 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2356);
    float _2386 = sqrt(_2382);
    float _2388 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2384);
    float _2390 = _2388 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2392 = _2390 + _2352;
    float _2394 = _2392 * _2358;
    float _2396 = _2394 * 0.5;
    bool _2398 = _2386 > 0.0;
    float _2400 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2402 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2400);
    float _2404 = 1.0 / _2402;
    bool _2406 = !_2398;
    float _2408 = _2336;
    float _2410 = _2334;
    float _2412 = _2338;
    float _2414 = _2386;
    if (!_2406)
    {
        float _2416 = _211 * _211;
        float _2418 = fma(_207, _207, _2416);
        float _2420 = fma(_213, _213, _2418);
        float _2422 = rsqrt(_2382);
        float _2424 = sqrt(_2420);
        float _2426 = _2346 * _2422;
        float _2428 = _2342 * _2422;
        float _2430 = _2350 * _2422;
        bool _2432 = _2424 > 0.0;
        bool _2434 = !_2432;
        _2414 = _2422;
        if (!_2434)
        {
            float _2436 = rsqrt(_2420);
            float _2438 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2440 = _211 * _2436;
            float _2442 = _207 * _2436;
            float _2444 = _213 * _2436;
            float _2446 = _2428 * _2440;
            float _2448 = fma(_2426, _2442, _2446);
            float _2450 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2452 = fma(_2430, _2444, _2448);
            float _2454 = _2452 * _2450;
            float _2456 = fma(_207, _2454, _2336);
            float _2458 = fma(_211, _2454, _2334);
            float _2460 = fma(_213, _2454, _2338);
            _2408 = _2456;
            _2410 = _2458;
            _2412 = _2460;
            _2414 = _2454;
        }
    }
    float _2462 = _2408;
    float _2464 = _2410;
    float _2466 = _2412;
    float _2468 = _2414;
    float _2470 = -_2034;
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2462);
    float _2474 = -_2032;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2464);
    float _2478 = -_2036;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2466);
    float _2482 = _2468;
    float _2484 = _2476;
    float _2486 = _2472;
    float _2488 = _2480;
    float _2490 = _2466;
    float _2492 = _2464;
    if (_2380)
    {
        _2482 = 1.0;
    }
    float _2494 = _2482;
    float _2496 = _2494;
    if (!_2370)
    {
        float _2498 = _2060 * _2060;
        float _2500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2502 = -_1196;
        float _2504 = _2502 + _2466;
        float _2506 = -_1182;
        float _2508 = _2506 + _2464;
        float _2510 = fma(_2068, _2068, _2498);
        float _2512 = fma(_2080, _2080, _2510);
        float _2514 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2516 = sqrt(_2512);
        float _2518 = 1.0 / _2142;
        float _2520 = precise::min(_2516, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2522 = _2520 * _2500;
        float _2524 = _2514 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2526 = -_930;
        float _2528 = _2526 + _2462;
        float _2530 = _2522 * _2518;
        float _2532 = _2524 * _2530;
        float _2534 = _2504 * _2530;
        float _2536 = fma(_2528, _2532, _2050);
        float _2538 = fma(_2508, _2532, _2046);
        float _2540 = fma(_2524, _2534, _2064);
        _2124 = _2532;
        _2484 = _2538;
        _2486 = _2536;
        _2488 = _2540;
        _2490 = _2534;
        _2492 = _2508;
    }
    float _2542 = _2124;
    float _2544 = _2484;
    float _2546 = _2486;
    float _2548 = _2488;
    float _2550 = _2490;
    float _2552 = _2492;
    float _2554 = _2552;
    float _2556 = _2542;
    float _2558 = _2550;
    if (_2380)
    {
        _2554 = 1.0;
    }
    float _2560 = _2554;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2564 = _2404 * _2562;
    float _2566 = _2560;
    if (!_2380)
    {
        float _2568 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2570 = _2568 * 0.15915493667125701904296875;
        float _2572 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2576 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2574;
        float _2578 = _2570 * 6.283185482025146484375;
        float _2580 = cos(_2578);
        float _2582 = _2572 * 0.15915493667125701904296875;
        float _2584 = _2570 * 6.283185482025146484375;
        float _2586 = sin(_2584);
        float _2588 = 1.0 / _2580;
        float _2590 = _2582 * 6.283185482025146484375;
        float _2592 = cos(_2590);
        float _2594 = _2586 * _2588;
        float _2596 = _2582 * 6.283185482025146484375;
        float _2598 = sin(_2596);
        float _2600 = _2592 * _2594;
        float _2602 = 1.0 / _2576;
        float _2604 = 1.0 / _2600;
        float _2606 = _2598 * _2604;
        float _2608 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2610 = fma(_2564, _2606, _2608);
        float _2612 = _2610 * _2602;
        float _2614 = precise::clamp(_2612, 0.0, 1.0);
        _2556 = _2582;
        _2496 = _2614;
    }
    float _2616 = _2556;
    float _2618 = _2496;
    float _2620 = _2616;
    if (!_2380)
    {
        float _2622 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2624 = _2622 * 0.15915493667125701904296875;
        float _2626 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2628 = _2624 * 6.283185482025146484375;
        float _2630 = cos(_2628);
        float _2632 = _2626 * 0.15915493667125701904296875;
        float _2634 = _2624 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        float _2638 = 1.0 / _2630;
        float _2640 = _2632 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        float _2644 = _2636 * _2638;
        float _2646 = _2632 * 6.283185482025146484375;
        float _2648 = sin(_2646);
        float _2650 = _2642 * _2644;
        float _2652 = 1.0 / _2650;
        float _2654 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2656 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2654;
        float _2658 = 1.0 / _2656;
        float _2660 = _2648 * _2652;
        float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2664 = fma(_2564, _2660, _2662);
        float _2666 = _2664 * _2658;
        float _2668 = precise::clamp(_2666, 0.0, 1.0);
        float _2670 = -_2668;
        float _2672 = _2670 + 1.0;
        _2620 = _2652;
        _2566 = _2672;
    }
    float _2674 = _2620;
    float _2676 = _2566;
    float _2678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2680 = _2544 + _2678;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2684 = _2546 + _2682;
    float _2686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2688 = _2548 + _2686;
    float _2690 = _2680 * _2680;
    float _2692 = fma(_2684, _2684, _2690);
    float _2694 = fma(_2688, _2688, _2692);
    float _2696 = rsqrt(_2694);
    float _2698 = sqrt(_2694);
    float _2700 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2702 = _2684 * _2700;
    float _2704 = _2688 * _2700;
    float _2706 = _2702 * _2702;
    float _2708 = _2704 * _2704;
    float _2710 = _2706 + _2708;
    float _2712 = sqrt(_2710);
    bool _2714 = _2712 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2718 = _2712 + _2716;
    float _2720 = _2674;
    float _2722 = _2710;
    float _2724 = _2718;
    float _2726 = _2680;
    float _2728 = _2702;
    if (_2714)
    {
        float _2730 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2720 = _2730;
    }
    float _2732 = _2720;
    if (_2714)
    {
        float _2734 = rsqrt(_2710);
        _2722 = _2734;
    }
    float _2736 = _2722;
    float _2738 = _2736;
    if (_2714)
    {
        float _2740 = _2718 * _2732;
        _2724 = _2740;
    }
    float _2742 = _2724;
    if (_2714)
    {
        float _2744 = _2742 * 0.15915493667125701904296875;
        _2042 = _2744;
    }
    float _2746 = _2042;
    float _2748 = _2688;
    if (_2714)
    {
        float _2750 = _2746 * 6.283185482025146484375;
        float _2752 = sin(_2750);
        _2748 = _2752;
    }
    float _2754 = _2748;
    float _2756 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2758 = precise::max(0.0, _2756);
    float _2760 = _2732;
    float _2762 = _2758;
    if (_2714)
    {
        float _2764 = _2746 * 6.283185482025146484375;
        float _2766 = cos(_2764);
        _2760 = _2766;
    }
    float _2768 = _2760;
    float _2770 = -_2700;
    float _2772 = -_2758;
    float _2774 = fma(_2680, _2770, _2772);
    if (_2714)
    {
        float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2726 = _2776;
    }
    float _2778 = _2726;
    float _2780 = _2754;
    float _2782 = _2778;
    if (_2714)
    {
        float _2784 = fma(_2754, _2778, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2780 = _2784;
    }
    float _2786 = _2780;
    float _2788 = _2786;
    if (!_2714)
    {
        _2782 = _2704;
    }
    float _2790 = _2782;
    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2794 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2792);
    float _2796 = precise::clamp(_2794, 0.0, 1.0);
    float _2798 = _2790;
    if (_2714)
    {
        float _2800 = _2768 + (-1.0);
        _2762 = _2800;
    }
    float _2802 = _2762;
    float _2804 = _2802;
    if (_2714)
    {
        float _2806 = _2736 * _2786;
        _2558 = _2806;
    }
    float _2808 = _2558;
    if (!_2714)
    {
        _2788 = _2774;
    }
    float _2810 = _2788;
    float _2812 = _2810;
    if (_2714)
    {
        float _2814 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2804 = _2814;
    }
    float _2816 = _2804;
    float _2818 = _2816;
    if (_2714)
    {
        float _2820 = _2702 * _2808;
        _2728 = _2820;
    }
    float _2822 = _2728;
    if (!_2714)
    {
        _2738 = _2706;
    }
    float _2824 = _2738;
    float _2826 = _2824;
    if (_2714)
    {
        float _2828 = _2704 * _2808;
        _2798 = _2828;
    }
    float _2830 = _2798;
    if (_2714)
    {
        float _2832 = fma(_2774, _2768, _2816);
        _2812 = _2832;
    }
    float _2834 = _2812;
    if (_2714)
    {
        float _2836 = _2822 * _2822;
        _2826 = _2836;
    }
    float _2838 = _2826;
    if (!_2714)
    {
        _2818 = _2708;
    }
    float _2840 = _2818;
    float _2842 = _2840;
    if (_2714)
    {
        float _2844 = _2830 * _2830;
        _2842 = _2844;
    }
    float _2846 = _2842;
    float _2848 = -_2796;
    float _2850 = _2848 + 1.0;
    float _2852 = fma(_2834, _2834, _2838);
    float _2854 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2856 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2858 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2860 = _2852 + _2846;
    float _2862 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2854);
    float _2864 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2866 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2868 = rsqrt(_2860);
    float _2870 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2862);
    float _2872 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2864);
    float _2874 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2866);
    float _2876 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2856);
    float _2878 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2880 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2872);
    float _2882 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2874);
    float _2884 = abs(_2850);
    float _2886 = log2(_2884);
    float _2888 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2876);
    float _2890 = _2880 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2892 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2894 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2896 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2898 = -_2892;
    float _2900 = fma(_2898, _2858, 1.0);
    float _2902 = _2868 * _2822;
    float _2904 = _2888 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2906 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2896);
    float _2908 = _2868 * _2834;
    float _2910 = _2902 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2912 = _2868 * _2830;
    float _2914 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2906);
    float _2916 = log2(_2900);
    float _2918 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2920 = -_2910;
    float _2922 = fma(_2908, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2920);
    float _2924 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2914);
    float _2926 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2928 = -_2912;
    float _2930 = fma(_2928, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2922);
    float _2932 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2934 = exp2(_2918);
    float _2936 = fma(_2930, -0.5, 0.5);
    float _2938 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2932);
    float _2940 = _2908 + 1.0;
    float _2942 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2938);
    float _2944 = 1.0 / _2924;
    float _2946 = fma(_2930, 0.5, 0.5);
    float _2948 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2926);
    float _2950 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2942);
    float _2952 = _2916 * 0.693147182464599609375;
    float _2954 = fma(_2946, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2956 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2948);
    float _2958 = sqrt(_2936);
    float _2960 = -_2908;
    float _2962 = fma(_2934, _2940, _2960);
    float _2964 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2956);
    float _2966 = fma(_2946, _2954, -0.212114393711090087890625);
    float _2968 = fma(_2962, 0.5, 0.5);
    float _2970 = fma(_2946, _2966, 1.570728778839111328125);
    float _2972 = _2950 * _2944;
    float _2974 = _2964 * _2944;
    float _2976 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2978 = fma(_2972, 0.5, 0.5);
    float _2980 = fma(_2974, -0.5, 0.5);
    float _2982 = _2958 * 0.636619746685028076171875;
    float3 _7556 = float3(_2978, _2980, _2976);
    float _2984 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7556, float3(0.0), isnan(_7556)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7556, float3(0.0), isnan(_7556)), level(0.0)).x;
    float _2986 = -_2970;
    float _2988 = fma(_2982, _2986, 1.0);
    float3 _7572 = float3(_2978, _2980, _2976);
    float4 _2991 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7572, float3(0.0), isnan(_7572)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7572, float3(0.0), isnan(_7572)), level(0.0)).xyzw;
    float _2993 = _2991.x;
    float _2995 = _2991.y;
    float _2997 = _2991.z;
    float _2999 = _2991.w;
    float2 _7589 = float2(_2988, _2968);
    float3 _3003 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7589, float2(0.0), isnan(_7589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7589, float2(0.0), isnan(_7589)), level(0.0)).xyz;
    float _3005 = _3003.x;
    float _3007 = _3003.y;
    float _3009 = _3003.z;
    float _3011 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3013 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3015 = _2618 * _2676;
    bool _3017 = _2618 > 0.0;
    bool _3019 = isnan(_2618);
    bool _3021 = _3017 || _3019;
    bool _3023 = isnan(0.0);
    bool _3025 = _3021 || _3023;
    float _3027 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3011);
    float _3029 = _3015 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3031 = exp2(_3013);
    float _3033 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3027);
    bool _3035 = _2676 <= 0.0;
    bool _3037 = !_3025;
    bool _3039 = _3035 || _3037;
    float _3041 = _3029 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3043 = _2950 + _2924;
    float _3045 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3033);
    float _3047 = _2924 * 0.5;
    float _3049 = _3043 * 0.5;
    float _3051 = -_3031;
    float _3053 = _3051 + 1.0;
    out.m_45.x = _3041;
    float _3055 = _3053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3057 = _3045 + _2924;
    float _3059 = fma(_2964, -0.5, _3047);
    out.gl_Position.x = _2950;
    out.gl_Position.y = _2964;
    out.gl_Position.z = _3045;
    out.gl_Position.w = _2924;
    float _3061 = _3057 * 0.5;
    out.m_76.x = _3049;
    out.m_76.y = _3059;
    out.m_76.z = _3061;
    out.m_76.w = _2924;
    float _3063 = _3055 * _2984;
    float _3065 = -_3055;
    float _3067 = _3065 + 1.0;
    float _3069 = _2999 * _3063;
    float _3071 = _3009 * _3063;
    float _3073 = _2999 * _3067;
    float _3075 = fma(_3005, _3069, _2993);
    float _3077 = fma(_3007, _3069, _2995);
    float _3079 = fma(_2999, _3071, _2997);
    out.m_78.x = _3075;
    out.m_78.y = _3077;
    out.m_78.z = _3079;
    out.m_78.w = _3073;
    if (!_3039)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3081 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3081;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _535 = false;
    bool _337 = false;
    bool _235 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3138 = as_type<float>(_113);
        out.gl_Position.z = _3138;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3207 = as_type<float>(_151);
        out.gl_Position.z = _3207;
    }
    if (_145)
    {
        return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = in.m_52.x;
    float _157 = in.m_52.y;
    float _159 = in.m_52.z;
    float _161 = in.m_54.x;
    float _163 = in.m_54.y;
    float _165 = in.m_54.z;
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    int _179 = as_type<int>(_153) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_153) & 2;
    bool _185 = _183 != 0;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _189 = !_181;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_185;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _157 * _163;
    float _199 = _157 * _169;
    float _201 = fma(_155, _161, _197);
    float _203 = _157 * _175;
    float _205 = fma(_155, _167, _199);
    float _207 = fma(_159, _165, _201);
    float _209 = fma(_155, _173, _203);
    float _211 = fma(_159, _171, _205);
    float _213 = fma(_159, _177, _209);
    bool _215 = !_187;
    float _233;
    if (!_215)
    {
        float _217 = in.m_60.x;
        float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _225 = _223 * _219;
        float _227 = floor(_225);
        float _229 = -_227;
        float _231 = _225 + _229;
        _233 = _231;
        _235 = true;
    }
    else
    {
        float _237 = float(_97);
        float _239 = 1.0 / _237;
        float _241 = _131 * _239;
        _233 = _241;
    }
    _235 = false;
    float _243 = _233;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    bool _249 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _251 = isnan(_243);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _261;
    float _265 = -_259;
    float _267 = _265 + 1.0;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _281;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _263;
    float _289 = _279 * _267;
    float _291 = -_279;
    float _293 = _291 + 1.0;
    float _295 = _247 * _287;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _297;
    float _301 = fma(_283, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_299, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = _301 * _289;
    float _307 = _303 * _289;
    float _309 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _305);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _307);
    float _313 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].x, _309);
    float _315 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].y, _311);
    bool _317 = !_285;
    float _335;
    if (!_317)
    {
        float _319 = in.m_60.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        float _339 = float(_97);
        float _341 = 1.0 / _339;
        float _343 = _131 * _341;
        _335 = _343;
    }
    _337 = false;
    float _345 = _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _349 = _345 + _347;
    float _351 = in.m_62.x;
    float _353 = in.m_62.y;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _363 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _365 = isnan(_345);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _379 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _381 = isnan(_345);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = 1.0 / _357;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _393;
    float _397 = -_373;
    float _399 = _397 + 1.0;
    bool _401 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _403 = isnan(_345);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    bool _413 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _415 = 1.0 / _361;
    float _417 = 1.0 / _377;
    float _419 = _395 * _391;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _425 = _389 * _399;
    float _427 = -_389;
    float _429 = _427 + 1.0;
    float _431 = fma(_419, _349, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _433;
    float _437 = _315 * _353;
    float _439 = _411 * _429;
    float _441 = _423 * _415;
    bool _443 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _445 = isnan(_345);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _345 + _455;
    float _459 = _431 * _439;
    float _461 = -_411;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = _345 + _465;
    float _469 = fma(_441, _457, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _471 = _435 * _417;
    float _473 = -_453;
    float _475 = _473 + 1.0;
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[115].x, _459);
    float _479 = fma(_471, _467, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _481 = _373 * _475;
    float _483 = fma(_469, _425, _477);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _487 = _313 * _351;
    float _489 = fma(_479, _481, _483);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[118].x, _489);
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _495 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _503 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _493;
    out.m_64.y = _499;
    out.m_64.z = _503;
    out.m_64.w = _501;
    bool _505 = !_413;
    float _529;
    float _531;
    float _533;
    if (!_505)
    {
        float _507 = in.m_60.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _511 = float(_97);
        float _513 = 1.0 / _511;
        float _515 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _517 = _131 * _513;
        float _519 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _521 = _519 * _509;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _517;
        _531 = _527;
        _533 = _511;
        _535 = true;
    }
    else
    {
        float _537 = float(_97);
        float _539 = 1.0 / _537;
        float _541 = _131 * _539;
        _529 = _541;
        _531 = _541;
        _533 = _537;
    }
    _535 = false;
    float _543 = _529;
    float _545 = _531;
    float _547 = _533;
    float _549 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _551 = int(_549);
    float _553 = in.m_60.x;
    float _555 = in.m_60.y;
    float _557 = in.m_60.z;
    float _559 = in.m_60.w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _563 = _543 + _561;
    float _565 = in.m_42.x;
    float _567 = in.m_42.y;
    float _569 = in.m_42.z;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _573 = _543 + _571;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _577 = int(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _593 = _543 + _591;
    float _595 = 1.0 / _585;
    float _597 = float(_551);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _613 = _543 + _611;
    float _615 = 1.0 / _597;
    bool _617 = _559 > 0.5;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _637 = _635 != 0;
    float _639 = _175 * _567;
    float _641 = float(uint(_577));
    float _643 = _163 * _567;
    float _645 = -_195;
    int _647 = _617 ? as_type<int>(_645) : as_type<int>(_195);
    float _649 = _169 * _567;
    bool _651 = !_633;
    int _653 = _651 ? 0 : 1;
    float _655 = 1.0 / _641;
    bool _657 = _553 > 0.5;
    float _659 = fma(_161, _565, _643);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _663 = _661 != 0;
    float _665 = _615 * _131;
    float _667 = -_191;
    int _669 = _657 ? as_type<int>(_667) : as_type<int>(_191);
    float _671 = fma(_167, _565, _649);
    float _673 = _553 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _675 = !_663;
    float _677 = _675 ? _191 : as_type<float>(_669);
    float _679 = trunc(_665);
    int _681 = int(_679);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _685 = !_629;
    int _687 = _685 ? 0 : 1;
    float _689 = fma(_173, _565, _639);
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _693 = _691 != 0;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _697 = _555 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _701 = _699 != 0;
    float _703 = 1.0 / _589;
    bool _705 = !_625;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_697, -2.0, _695);
    bool _711 = !_693;
    int _713 = _711 ? 0 : 1;
    float _715 = fma(_171, _569, _671);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _719 = _717 != 0;
    float _721 = -_683;
    float _723 = fma(_673, 2.0, _721);
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _727 = _725 != 0;
    float _729 = 1.0 / _601;
    bool _731 = _555 > 0.5;
    float _733 = fma(_177, _569, _689);
    int _735 = as_type<int>(_655) + (-2);
    float _737 = _553 * 2.0;
    float _739 = float(uint(_681));
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _743 = _545 + _741;
    bool _745 = !_701;
    float _747 = _745 ? _195 : as_type<float>(_647);
    float _749 = 1.0 / _581;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = fma(_165, _569, _659);
    float _765 = as_type<float>(_735) * _739;
    float _767 = _743 * _595;
    float _769 = -_195;
    int _771 = _731 ? as_type<int>(_769) : as_type<int>(_195);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _775 = _545 + _773;
    float _777 = 1.0 / _605;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _783 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _709);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _789 = !_637;
    int _791 = _789 ? 0 : 1;
    float _793 = floor(_737);
    float _795 = _775 * _749;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _805 = _799 * _729;
    int _807 = ~_577;
    int _809 = _807 + 1;
    float _811 = 1.0 / _609;
    bool _813 = !_719;
    float _815 = _813 ? _195 : as_type<float>(_771);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _817;
    bool _821 = _557 > 0.5;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _829 = _827 != 0;
    float _831 = _819 * _703;
    float _833 = 1.0 / _621;
    float _835 = -_191;
    int _837 = _821 ? as_type<int>(_835) : as_type<int>(_191);
    float _839 = _825 * _777;
    bool _841 = _793 >= 0.0;
    bool _843 = isnan(_793);
    bool _845 = _841 || _843;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _851;
    float _855 = fma(_805, _563, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _857 = _849 ? 0 : 1;
    float _859 = trunc(_765);
    float _861 = precise::max(_859, 0.0);
    uint _864 = uint(_861);
    float _866 = _803 * _811;
    float _868 = _555 * 2.0;
    bool _870 = _793 > 0.0;
    float _872 = fma(_831, _593, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    int _874 = ~_857;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = fma(_866, _573, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _882 = !_829;
    float _884 = _882 ? 1.2345600128173828125 : 1.0;
    float _886 = 1.0 / _781;
    float _888 = _853 * _833;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _894 = in.m_54.w;
    float _896 = float(_577);
    float _898 = 1.0 / _787;
    int _900 = _809 * int(_864);
    int _902 = _900 + _681;
    int _904 = _878;
    if (!_870)
    {
        int _906 = ~_857;
        int _908 = _906 + 1;
        _904 = _908;
    }
    int _910 = _904;
    float _912 = float(uint(_902));
    float _914 = floor(_868);
    float _916 = _892 * _886;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _918;
    float _922 = _896 * _131;
    float _924 = fma(_916, _613, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _926 = 1.0 / _547;
    int _928 = abs(_713);
    float _930 = _763 + _894;
    int _932 = abs(_653);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _934;
    bool _938 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _940 = isnan(_543);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = _920 * _898;
    float _952 = as_type<float>(_735) * _912;
    bool _954 = _914 >= 0.0;
    bool _956 = isnan(_914);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    float _964 = _555 + _557;
    bool _966 = !_829;
    float _968 = _966 ? _555 : _553;
    float _970 = trunc(_952);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    float _976 = _962 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _978 = _964 + (-1.0);
    bool _980 = _914 > 0.0;
    float _982 = _555 + _553;
    float _984 = _884 * _968;
    int _986 = ~_577;
    int _988 = _986 + 1;
    float _990 = _922 * _926;
    float _992 = _982 + (-1.0);
    int _994 = ~as_type<int>(_976);
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    float _1000 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1002 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1004 = _557 * 2.0;
    float _1006 = trunc(_990);
    int _1008 = int(_1006);
    int _1010 = int(_864) + int(_974);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1014 = _998;
    float _1016 = as_type<float>(_988);
    float _1018 = _976;
    if (!_980)
    {
        int _1020 = ~as_type<int>(_976);
        int _1022 = _1020 + 1;
        _1014 = _1022;
    }
    int _1024 = _1014;
    if (!_829)
    {
        _1016 = _557;
    }
    float _1026 = _1016;
    int _1028 = _988 * _1010;
    int _1030 = _1028 + _681;
    float _1032 = floor(_1004);
    float _1034 = _1026;
    if (_829)
    {
        _1034 = _555;
    }
    float _1036 = _1034;
    float _1038 = 0.0;
    if (!_829)
    {
        _1038 = _557;
    }
    float _1040 = _1038;
    bool _1042 = uint(_1030) >= uint(_577);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1044;
    float _1048 = _1040;
    if (_829)
    {
        _1048 = _555;
    }
    float _1050 = _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1052;
    float _1056 = fma(_1046, _795, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1062 = !_1042;
    int _1064 = _1062 ? 0 : (-1);
    float _1066 = fma(_1054, _795, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1068 = fma(_936, _795, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1074 = floor(_984);
    bool _1076 = _1032 > 0.0;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1082 = _1032 >= 0.0;
    bool _1084 = isnan(_1032);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = fma(_1072, _767, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1094 = float(_681);
    float _1096 = fma(_1060, _767, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1100 = _543 + _1098;
    float _1102 = fma(_1080, _767, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1104 = _1094 >= _896;
    bool _1106 = isnan(_1094);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(_896);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = in.m_56.w;
    float _1118 = fma(_839, _1100, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _1120 = ~_1010;
    int _1122 = _1120 + _1064;
    int _1124 = _1122 + 1;
    float _1126 = trunc(_1114);
    int _1128 = int(_1126);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1132 = _543 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1136 = _543 + _1134;
    float _1138 = -_1074;
    float _1140 = _984 + _1138;
    int _1142 = ~_577;
    int _1144 = _1142 + 1;
    float _1146 = in.m_58.w;
    float _1148 = fma(_950, _1132, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1150 = _1140 * _896;
    int _1152 = _577 * _1124;
    int _1154 = _1152 + _681;
    int _1156 = _1090 ? 0 : 1;
    float _1158 = trunc(_1150);
    int _1160 = int(_1158);
    bool _1162 = _577 == 0;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1166 = fma(_888, _1136, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1168 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1170 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1164);
    int _1172 = ~_1128;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_1162;
    int _1180 = _1178 ? _1154 : (-1);
    float _1182 = _715 + _1116;
    int _1184 = abs(_687);
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1188 = _1180 * _1176;
    int _1190 = _577 + (-1);
    float _1192 = fma(_1168, -2.0, _1186);
    if (!_829)
    {
        _1018 = _555;
    }
    float _1194 = _1018;
    float _1196 = _733 + _1146;
    int _1198 = abs(_707);
    int _1200 = _1128 * _1190;
    int _1202 = _1200 + _1188;
    int _1204 = _1160 * _928;
    int _1206 = _1204 + _681;
    bool _1208 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1210 = isnan(_545);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    int _1220 = _1202 * _1184;
    bool _1222 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1224 = isnan(_545);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = -_1218;
    float _1236 = _1234 + 1.0;
    bool _1238 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1240 = isnan(_545);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    int _1250 = _1008 * _1198;
    int _1252 = _1250 + _1220;
    float _1254 = _1232 * _1236;
    float _1256 = -_1232;
    float _1258 = _1256 + 1.0;
    int _1260 = abs(_791);
    int _1262 = _1206 * _932;
    int _1264 = _1262 + _1252;
    bool _1266 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1268 = isnan(_543);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = _1248 * _1258;
    bool _1280 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1282 = isnan(_543);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    int _1292 = _1160 * _1260;
    int _1294 = _1292 + _1264;
    bool _1296 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1298 = isnan(_543);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = -_1276;
    float _1310 = _1308 + 1.0;
    float _1312 = _1066 * _1278;
    float _1314 = -_1290;
    float _1316 = _1314 + 1.0;
    float _1318 = float(uint(_1294));
    float _1320 = _1056 * _1278;
    float _1322 = _1068 * _1278;
    float _1324 = _1290 * _1310;
    bool _1326 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1328 = isnan(_543);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1306 * _1316;
    float _1340 = -_1306;
    float _1342 = _1340 + 1.0;
    float _1344 = as_type<float>(_735) * _1318;
    bool _1346 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1348 = isnan(_543);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1012);
    bool _1360 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1362 = isnan(_543);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    float _1372 = _1336 * _1342;
    bool _1374 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1376 = isnan(_543);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -_1336;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1358);
    float _1392 = trunc(_1344);
    float _1394 = precise::max(_1392, 0.0);
    uint _1396 = uint(_1394);
    float _1398 = -_1370;
    float _1400 = _1398 + 1.0;
    float _1402 = _1390 * (-0.15915493667125701904296875);
    float _1404 = _1384 * _1388;
    float _1406 = -_1384;
    float _1408 = _1406 + 1.0;
    float _1410 = _1356 * _1400;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1414 = _1402 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = _1370 * _1408;
    float _1420 = -_1356;
    float _1422 = _1420 + 1.0;
    float _1424 = _1194;
    if (_829)
    {
        _1424 = _553;
    }
    float _1426 = _1424;
    float _1428 = _948 * _1422;
    float _1430 = -_948;
    float _1432 = _1430 + 1.0;
    int _1434 = _1144 * int(_1396);
    int _1436 = _1434 + _1294;
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = sin(_1438);
    float _1442 = _855 * _1428;
    int _1444 = ~_1156;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    float _1450 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1412);
    float _1452 = float(uint(_1436));
    float _1454 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1442);
    int _1456 = _1448;
    if (!_1076)
    {
        int _1458 = ~_1156;
        int _1460 = _1458 + 1;
        _1456 = _1460;
    }
    int _1462 = _1456;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1466 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1468 = log2(_1466);
    float _1470 = as_type<float>(_735) * _1452;
    float _1472 = -_1248;
    float _1474 = _1472 + 1.0;
    float _1476 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1478 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1450);
    float _1480 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1320);
    float _1482 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1312);
    float _1484 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1322);
    float _1486 = trunc(_1470);
    float _1488 = precise::max(_1486, 0.0);
    uint _1490 = uint(_1488);
    float _1492 = fma(_1096, _1254, _1480);
    float _1494 = fma(_1092, _1254, _1482);
    float _1496 = _815 * _1440;
    float _1498 = _815 * _1416;
    float _1500 = fma(_1102, _1254, _1484);
    float _1502 = _1468 * _131;
    float _1504 = -_1496;
    float _1506 = fma(_677, _1416, _1504);
    float _1508 = fma(_677, _1440, _1498);
    float _1510 = exp2(_1502);
    float _1512 = fma(_880, _1410, _1454);
    bool _1514 = !_727;
    float _1516 = _1514 ? _191 : as_type<float>(_837);
    float _1518 = -_1464;
    float _1520 = fma(_1476, 2.0, _1518);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1526 = 1.0 + _1524;
    float _1528 = _1516 + 0.5;
    bool _1530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1532 = isnan(1.0);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1538 = _1534 || _1536;
    float _1540 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1522);
    bool _1542 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1550 = _1546 || _1548;
    float _1552 = 1.0 / _1526;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1556 = int(_1396) + int(_1490);
    float _1558 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1540);
    int _1560 = ~_577;
    int _1562 = _1560 + 1;
    float _1564 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1554);
    float _1566 = -_1510;
    float _1568 = _1566 + 1.0;
    float _1570 = -_131;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[76].x, _723);
    float _1574 = -_131;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1520);
    float _1578 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1564);
    int _1580 = _1562 * _1556;
    int _1582 = _1580 + _1294;
    float _1584 = _1550 ? _1568 : 0.0;
    float _1586 = _747 + (-0.5);
    float _1588 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1192);
    float _1590 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1170);
    float _1592 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1576);
    if (_1538)
    {
        float _1594 = _1584 * _1552;
        _135 = _1594;
    }
    float _1596 = _135;
    bool _1598 = !_757;
    int _1600 = _1598 ? 0 : 1;
    float _1602 = -_1586;
    float _1604 = -_1588;
    float _1606 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1604);
    bool _1608 = uint(_1582) >= uint(_577);
    float _1610 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1494);
    bool _1612 = !_753;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1492);
    int _1618 = abs(_1600);
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1622 = !_1608;
    int _1624 = _1622 ? 0 : (-1);
    float _1626 = -_1590;
    float _1628 = _1626 + 1.0;
    int _1630 = abs(_1614);
    float _1632 = fma(_872, _1418, _1512);
    float _1634 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1500);
    int _1636 = ~_1556;
    int _1638 = _1636 + _1624;
    int _1640 = _1638 + 1;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1644 = float(_1462);
    float _1646 = fma(_1118, _1404, _1632);
    float _1648 = float(_1630);
    int _1650 = _577 * _1640;
    int _1652 = _1650 + _1294;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1656 = _1182 + _1654;
    float _1658 = float(_1618);
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1662 = _930 + _1660;
    float _1664 = float(_910);
    float _1666 = _1648 * _1644;
    bool _1668 = !_1162;
    int _1670 = _1668 ? _1652 : (-1);
    float _1672 = in.m_66.x;
    float _1674 = in.m_66.y;
    float _1676 = in.m_66.z;
    float _1678 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1680 = float(uint(_1206));
    float _1682 = _1658 * _1664;
    int _1684 = _1670 >> 31;
    float _1686 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1678);
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1690 = _1196 + _1688;
    float _1692 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1694 = as_type<float>(_735) * _1680;
    int _1696 = _1684 & 3;
    float _1698 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1686);
    float _1700 = _1508 + (-0.5);
    float _1702 = _1506 + 0.5;
    int _1704 = _1670 + _1696;
    float _1706 = trunc(_1694);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    bool _1712 = _1698 >= 0.0;
    float _1714 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1716 = _1704 >> 2;
    float _1718 = -_1692;
    float _1720 = -_783;
    float _1722 = fma(_1718, _1700, _1720);
    float _1724 = _1666 * (-2.0);
    float _1726 = fma(_1714, _1702, _1572);
    int _1728 = _1716 << 4;
    int _1730 = _1728 + 512;
    float _1732 = fma(_1166, _1372, _1646);
    int _1734 = ~_577;
    int _1736 = _1734 + 1;
    float _1738 = fma(_1724, _1672, _1672);
    uint _1740 = uint(int(uint(_1730) >> uint(2)));
    uint _1742 = uint(int(uint(int(_1740)) >> uint(2)));
    int _1744 = int(_1740) & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    int _1748 = int(_1740) + 1;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    int _1752 = _1748 & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    float _1756 = _1682 * (-2.0);
    float _1758 = fma(_1000, _1724, _1000);
    int _1760 = _1670 & 3;
    bool _1762 = _1760 != 0;
    float _1764 = -_1478;
    float _1766 = _1764 + 1.0;
    int _1768 = _1670 & 3;
    bool _1770 = _1768 != 0;
    float _1772 = fma(_1002, _1756, _1002);
    float _1774 = fma(_1756, _1674, _1674);
    int _1776 = _1736 * int(_1710);
    int _1778 = _1776 + _1206;
    int _1780 = _1730 + 8;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    uint _1784 = uint(int(uint(int(_1782)) >> uint(2)));
    int _1786 = int(_1782) & 3;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[int(_1784)][_1786];
    int _1790 = int(_1782) + 1;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    int _1794 = _1790 & 3;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[int(_1792)][_1794];
    int _1798 = _1762 ? 0 : 1;
    float _1800 = -_1558;
    float _1802 = _1800 + 1.0;
    bool _1804 = uint(_1768) > 1u;
    float _1806 = fma(_924, _1338, _1732);
    float _1808 = float(uint(_1778));
    float _1810 = -_1802;
    float _1812 = fma(_1506, _1810, _1726);
    int _1814 = ~_1798;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = -_1766;
    float _1822 = fma(_1516, _1820, _1592);
    bool _1824 = !_1770;
    int _1826 = _1824 ? 0 : 1;
    float _1828 = as_type<float>(_735) * _1808;
    float _1830 = -_1578;
    float _1832 = _1830 + 1.0;
    float _1834 = fma(_747, _1628, _1606);
    float _1836 = trunc(_1828);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    int _1842 = ~_577;
    int _1844 = _1842 + 1;
    float _1846 = fma(_1508, _1832, _1722);
    int _1848 = _1818;
    if (!_1804)
    {
        int _1850 = ~_1798;
        int _1852 = _1850 + 1;
        _1848 = _1852;
    }
    int _1854 = _1848;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1858 = uint(_1768) >= 2u;
    float _1860 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1862 = abs(_1854);
    float _1864 = _1616 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1866 = _1858 ? 0 : 1;
    float _1868 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1870 = _1768 != 3;
    out.m_68.x = _1812;
    out.m_68.y = _1846;
    out.m_68.z = _1822;
    out.m_68.w = _1834;
    int _1872 = abs(_1826);
    float _1874 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1878 = _1876 != 0;
    float _1880 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1882 = int(_1710) + int(_1840);
    float _1884 = _1868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1886 = fma(_1148, _1324, _1806);
    int _1888 = ~_1866;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = _1892;
    if (_1712)
    {
        out.m_45.x = 0.0;
    }
    int _1896 = ~_1862;
    int _1898 = _1896 + 1;
    int _1900 = _1898 + 1;
    int _1902 = _1844 * _1882;
    int _1904 = _1902 + _1206;
    if (_1870)
    {
        int _1906 = ~_1866;
        int _1908 = _1906 + 1;
        _1894 = _1908;
    }
    int _1910 = _1894;
    out.m_70.x = _1874;
    out.m_70.y = _1880;
    out.m_70.z = _1884;
    out.m_70.w = _1856;
    int _1912 = _1900 * as_type<int>(_1754);
    bool _1914 = _1768 != 3;
    float _1916 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1886);
    bool _1918 = !_1878;
    int _1920 = _1918 ? 0 : 1;
    int _1922 = abs(_1910);
    int _1924 = ~_1872;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    out.m_72.x = _1916;
    bool _1930 = !_1914;
    int _1932 = _1930 ? 0 : (-1);
    bool _1934 = uint(_1904) >= uint(_577);
    int _1936 = _1928 * as_type<int>(_1746);
    int _1938 = _1936 + _1912;
    int _1940 = abs(_1920);
    int _1942 = ~_1922;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    int _1948 = abs(_1932);
    bool _1950 = !_1934;
    int _1952 = _1950 ? 0 : (-1);
    int _1954 = _1946 * as_type<int>(_1788);
    int _1956 = _1954 + _1938;
    float _1958 = _1656 * _1656;
    int _1960 = ~_1940;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = ~_1882;
    int _1968 = _1966 + _1952;
    int _1970 = _1968 + 1;
    float _1972 = fma(_1662, _1662, _1958);
    int _1974 = ~_1948;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = _577 * _1970;
    int _1982 = _1980 + _1206;
    int _1984 = _1978 * as_type<int>(_1796);
    int _1986 = _1984 + _1956;
    float _1988 = fma(_1690, _1690, _1972);
    float _1990 = _553 + (-0.5);
    bool _1992 = !_1162;
    int _1994 = _1992 ? _1982 : (-1);
    int _1996 = _1986 * _1964;
    float _1998 = as_type<float>(_1964);
    if (_1712)
    {
        _1998 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2000 = _1998;
    float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1738);
    float _2004 = rsqrt(_1988);
    int _2006 = _1994 * _1940;
    int _2008 = _2006 + _1996;
    float _2010 = _555 + (-0.5);
    bool _2012 = !_761;
    int _2014 = _2012 ? 0 : 1;
    int _2016 = as_type<int>(_2000);
    if (_1712)
    {
        float _2018 = _2000 * 5.0;
        _2016 = as_type<int>(_2018);
    }
    int _2020 = _2016;
    float _2022 = fma(_2010, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1774);
    int _2024 = abs(_2014);
    float _2026 = fma(_1758, _1596, _2002);
    float _2028 = float(_2008);
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6048 = as_type<float>(_2020);
        out.gl_Position.z = _6048;
    }
    float _2030 = float(_2024);
    out.m_74.y = _2028;
    float _2032 = _1656 * _2004;
    float _2034 = _1662 * _2004;
    float _2036 = _1690 * _2004;
    float _2038 = -_2032;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1656);
    float _2042 = _2034;
    if (_1712)
    {
        return out;
    }
    float _2044 = -_2032;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _2048 = -_2034;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _930);
    float _2052 = float(_1024);
    float _2054 = -_2034;
    float _2056 = fma(_2054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1662);
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2060 = _2046 + _2058;
    float _2062 = -_2036;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1196);
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2068 = _2050 + _2066;
    float _2070 = _2040 * _2040;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2074 = _557 + _553;
    float _2076 = _2030 * _2052;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2080 = _2064 + _2078;
    float _2082 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2072);
    float _2084 = fma(_2056, _2056, _2070);
    float _2086 = _2074 + (-1.0);
    float _2088 = _2076 * (-2.0);
    float _2090 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2082);
    float _2092 = _557 + (-0.5);
    float _2094 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2096 = fma(_2088, _1676, _1676);
    float _2098 = -_2036;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1690);
    bool _2102 = _2090 >= 0.0;
    float _2104 = fma(_2094, _2088, _2094);
    float _2106 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2096);
    float _2108 = fma(_2100, _2100, _2084);
    float _2110 = fma(_1772, _1596, _2022);
    float _2112 = _2026 * 0.15915493667125701904296875;
    float _2114 = fma(_2104, _1596, _2106);
    float _2116 = _2110 * 0.15915493667125701904296875;
    float _2118 = sqrt(_2108);
    float _2120 = _2114 * 0.15915493667125701904296875;
    float _2122 = _2092;
    float _2124 = _2068;
    if (_2102)
    {
        _2122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2126 = _2122;
    int _2128 = as_type<int>(_2126);
    if (_2102)
    {
        out.m_45.x = 0.0;
    }
    float _2130 = _2112 * 6.283185482025146484375;
    float _2132 = sin(_2130);
    if (_2102)
    {
        float _2134 = _2126 * 5.0;
        _2128 = as_type<int>(_2134);
    }
    int _2136 = _2128;
    if (_2102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6237 = as_type<float>(_2136);
        out.gl_Position.z = _6237;
    }
    float _2138 = _2112 * 6.283185482025146484375;
    float _2140 = cos(_2138);
    float _2142 = _2004 * _2118;
    float _2144 = _2116 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = _2116 * 6.283185482025146484375;
    float _2150 = cos(_2148);
    float _2152 = _2120 * 6.283185482025146484375;
    float _2154 = sin(_2152);
    if (_2102)
    {
        return out;
    }
    float _2156 = _2120 * 6.283185482025146484375;
    float _2158 = cos(_2156);
    float _2160 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2164 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _2168 = _2142 * _2160;
    float _2170 = _2132 * _2146;
    float _2172 = _2142 * _2164;
    float _2174 = _2140 * _2146;
    float _2176 = _2162 * _2168;
    float _2178 = _2140 * _2150;
    float _2180 = _2166 * _2172;
    float _2182 = _2132 * _2150;
    float _2184 = fma(_2154, _2178, _2170);
    float _2186 = fma(_2154, _2170, _2178);
    float _2188 = _2158 * _2176;
    float _2190 = _2140 * _2188;
    float _2192 = _2146 * _2158;
    float _2194 = _2150 * _2158;
    float _2196 = _2132 * _2188;
    float _2198 = fma(_2184, _2180, _2190);
    float _2200 = -_2176;
    float _2202 = _2154 * _2200;
    float _2204 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2206 = _2204 * 0.5;
    float _2208 = -_2182;
    float _2210 = fma(_2154, _2174, _2208);
    float _2212 = -_2174;
    float _2214 = fma(_2154, _2182, _2212);
    float _2216 = fma(_2194, _2180, _2202);
    float _2218 = fma(_2210, _2206, _2198);
    float _2220 = fma(_2214, _2180, _2196);
    float _2222 = fma(_2192, _2206, _2216);
    float _2224 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2226 = fma(_2186, _2206, _2220);
    float _2228 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2230 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2232 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2234 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2228);
    float _2236 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2230);
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2232);
    float _2240 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2234);
    float _2242 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2236);
    float _2244 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2246 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2248 = _2242 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2250 = _1196 + _2244;
    float _2252 = _930 + _2246;
    float _2254 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2258 = _2250 + _2256;
    float _2260 = _1182 + _2248;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2264 = _2252 + _2262;
    float _2266 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2254);
    float _2268 = _2258 * _2258;
    float _2270 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2266);
    float _2272 = fma(_2264, _2264, _2268);
    float _2274 = sqrt(_2272);
    bool _2276 = _2274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2278 = _2248;
    float _2280 = _2230;
    float _2282 = _2266;
    if (!_2276)
    {
        _2278 = _2252;
    }
    float _2284 = _2278;
    float _2286 = _2284;
    if (!_2276)
    {
        _2280 = _2250;
    }
    float _2288 = _2280;
    float _2290 = _2288;
    if (!_2276)
    {
        _2282 = _2260;
    }
    float _2292 = _2282;
    bool _2294 = !_2276;
    float _2296 = _2292;
    if (!_2294)
    {
        float _2298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2302 = _2274 + _2300;
        float _2304 = rsqrt(_2272);
        float _2306 = _2302 * _2298;
        float _2308 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2310 = _2306 * 0.15915493667125701904296875;
        float _2312 = _2310 * 6.283185482025146484375;
        float _2314 = cos(_2312);
        float _2316 = _2310 * 6.283185482025146484375;
        float _2318 = sin(_2316);
        float _2320 = _2314 + (-1.0);
        float _2322 = fma(_2318, _2308, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2324 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2326 = _2304 * _2322;
        float _2328 = fma(_2260, _2314, _2324);
        float _2330 = fma(_2264, _2326, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2332 = fma(_2258, _2326, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2296 = _2328;
        _2286 = _2330;
        _2290 = _2332;
    }
    float _2334 = _2296;
    float _2336 = _2286;
    float _2338 = _2290;
    float _2340 = -_1182;
    float _2342 = _2340 + _2334;
    float _2344 = -_930;
    float _2346 = _2344 + _2336;
    float _2348 = -_1196;
    float _2350 = _2348 + _2338;
    float _2352 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2354 = _2342 * _2342;
    float _2356 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2358 = 1.0 / _2352;
    float _2360 = fma(_2346, _2346, _2354);
    bool _2362 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2364 = isnan(0.5);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2370 = _2366 || _2368;
    bool _2372 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2374 = isnan(0.5);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2380 = _2376 || _2378;
    float _2382 = fma(_2350, _2350, _2360);
    float _2384 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2356);
    float _2386 = sqrt(_2382);
    float _2388 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2384);
    float _2390 = _2388 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2392 = _2390 + _2352;
    float _2394 = _2392 * _2358;
    float _2396 = _2394 * 0.5;
    bool _2398 = _2386 > 0.0;
    float _2400 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2402 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2400);
    float _2404 = 1.0 / _2402;
    bool _2406 = !_2398;
    float _2408 = _2336;
    float _2410 = _2334;
    float _2412 = _2338;
    float _2414 = _2386;
    if (!_2406)
    {
        float _2416 = _211 * _211;
        float _2418 = fma(_207, _207, _2416);
        float _2420 = fma(_213, _213, _2418);
        float _2422 = rsqrt(_2382);
        float _2424 = sqrt(_2420);
        float _2426 = _2346 * _2422;
        float _2428 = _2342 * _2422;
        float _2430 = _2350 * _2422;
        bool _2432 = _2424 > 0.0;
        bool _2434 = !_2432;
        _2414 = _2422;
        if (!_2434)
        {
            float _2436 = rsqrt(_2420);
            float _2438 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2440 = _211 * _2436;
            float _2442 = _207 * _2436;
            float _2444 = _213 * _2436;
            float _2446 = _2428 * _2440;
            float _2448 = fma(_2426, _2442, _2446);
            float _2450 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2452 = fma(_2430, _2444, _2448);
            float _2454 = _2452 * _2450;
            float _2456 = fma(_207, _2454, _2336);
            float _2458 = fma(_211, _2454, _2334);
            float _2460 = fma(_213, _2454, _2338);
            _2408 = _2456;
            _2410 = _2458;
            _2412 = _2460;
            _2414 = _2454;
        }
    }
    float _2462 = _2408;
    float _2464 = _2410;
    float _2466 = _2412;
    float _2468 = _2414;
    float _2470 = -_2034;
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2462);
    float _2474 = -_2032;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2464);
    float _2478 = -_2036;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2466);
    float _2482 = _2468;
    float _2484 = _2476;
    float _2486 = _2472;
    float _2488 = _2480;
    float _2490 = _2466;
    float _2492 = _2464;
    if (_2380)
    {
        _2482 = 1.0;
    }
    float _2494 = _2482;
    float _2496 = _2494;
    if (!_2370)
    {
        float _2498 = _2060 * _2060;
        float _2500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2502 = -_1196;
        float _2504 = _2502 + _2466;
        float _2506 = -_1182;
        float _2508 = _2506 + _2464;
        float _2510 = fma(_2068, _2068, _2498);
        float _2512 = fma(_2080, _2080, _2510);
        float _2514 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2516 = sqrt(_2512);
        float _2518 = 1.0 / _2142;
        float _2520 = precise::min(_2516, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2522 = _2520 * _2500;
        float _2524 = _2514 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2526 = -_930;
        float _2528 = _2526 + _2462;
        float _2530 = _2522 * _2518;
        float _2532 = _2524 * _2530;
        float _2534 = _2504 * _2530;
        float _2536 = fma(_2528, _2532, _2050);
        float _2538 = fma(_2508, _2532, _2046);
        float _2540 = fma(_2524, _2534, _2064);
        _2124 = _2532;
        _2484 = _2538;
        _2486 = _2536;
        _2488 = _2540;
        _2490 = _2534;
        _2492 = _2508;
    }
    float _2542 = _2124;
    float _2544 = _2484;
    float _2546 = _2486;
    float _2548 = _2488;
    float _2550 = _2490;
    float _2552 = _2492;
    float _2554 = _2552;
    float _2556 = _2542;
    float _2558 = _2550;
    if (_2380)
    {
        _2554 = 1.0;
    }
    float _2560 = _2554;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2564 = _2404 * _2562;
    float _2566 = _2560;
    if (!_2380)
    {
        float _2568 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2570 = _2568 * 0.15915493667125701904296875;
        float _2572 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2576 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2574;
        float _2578 = _2570 * 6.283185482025146484375;
        float _2580 = cos(_2578);
        float _2582 = _2572 * 0.15915493667125701904296875;
        float _2584 = _2570 * 6.283185482025146484375;
        float _2586 = sin(_2584);
        float _2588 = 1.0 / _2580;
        float _2590 = _2582 * 6.283185482025146484375;
        float _2592 = cos(_2590);
        float _2594 = _2586 * _2588;
        float _2596 = _2582 * 6.283185482025146484375;
        float _2598 = sin(_2596);
        float _2600 = _2592 * _2594;
        float _2602 = 1.0 / _2576;
        float _2604 = 1.0 / _2600;
        float _2606 = _2598 * _2604;
        float _2608 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2610 = fma(_2564, _2606, _2608);
        float _2612 = _2610 * _2602;
        float _2614 = precise::clamp(_2612, 0.0, 1.0);
        _2556 = _2582;
        _2496 = _2614;
    }
    float _2616 = _2556;
    float _2618 = _2496;
    float _2620 = _2616;
    if (!_2380)
    {
        float _2622 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2624 = _2622 * 0.15915493667125701904296875;
        float _2626 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2628 = _2624 * 6.283185482025146484375;
        float _2630 = cos(_2628);
        float _2632 = _2626 * 0.15915493667125701904296875;
        float _2634 = _2624 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        float _2638 = 1.0 / _2630;
        float _2640 = _2632 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        float _2644 = _2636 * _2638;
        float _2646 = _2632 * 6.283185482025146484375;
        float _2648 = sin(_2646);
        float _2650 = _2642 * _2644;
        float _2652 = 1.0 / _2650;
        float _2654 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2656 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2654;
        float _2658 = 1.0 / _2656;
        float _2660 = _2648 * _2652;
        float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2664 = fma(_2564, _2660, _2662);
        float _2666 = _2664 * _2658;
        float _2668 = precise::clamp(_2666, 0.0, 1.0);
        float _2670 = -_2668;
        float _2672 = _2670 + 1.0;
        _2620 = _2652;
        _2566 = _2672;
    }
    float _2674 = _2620;
    float _2676 = _2566;
    float _2678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2680 = _2544 + _2678;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2684 = _2546 + _2682;
    float _2686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2688 = _2548 + _2686;
    float _2690 = _2680 * _2680;
    float _2692 = fma(_2684, _2684, _2690);
    float _2694 = fma(_2688, _2688, _2692);
    float _2696 = rsqrt(_2694);
    float _2698 = sqrt(_2694);
    float _2700 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2702 = _2684 * _2700;
    float _2704 = _2688 * _2700;
    float _2706 = _2702 * _2702;
    float _2708 = _2704 * _2704;
    float _2710 = _2706 + _2708;
    float _2712 = sqrt(_2710);
    bool _2714 = _2712 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2718 = _2712 + _2716;
    float _2720 = _2674;
    float _2722 = _2710;
    float _2724 = _2718;
    float _2726 = _2680;
    float _2728 = _2702;
    if (_2714)
    {
        float _2730 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2720 = _2730;
    }
    float _2732 = _2720;
    if (_2714)
    {
        float _2734 = rsqrt(_2710);
        _2722 = _2734;
    }
    float _2736 = _2722;
    float _2738 = _2736;
    if (_2714)
    {
        float _2740 = _2718 * _2732;
        _2724 = _2740;
    }
    float _2742 = _2724;
    if (_2714)
    {
        float _2744 = _2742 * 0.15915493667125701904296875;
        _2042 = _2744;
    }
    float _2746 = _2042;
    float _2748 = _2688;
    if (_2714)
    {
        float _2750 = _2746 * 6.283185482025146484375;
        float _2752 = sin(_2750);
        _2748 = _2752;
    }
    float _2754 = _2748;
    float _2756 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2758 = precise::max(0.0, _2756);
    float _2760 = _2732;
    float _2762 = _2758;
    if (_2714)
    {
        float _2764 = _2746 * 6.283185482025146484375;
        float _2766 = cos(_2764);
        _2760 = _2766;
    }
    float _2768 = _2760;
    float _2770 = -_2700;
    float _2772 = -_2758;
    float _2774 = fma(_2680, _2770, _2772);
    if (_2714)
    {
        float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2726 = _2776;
    }
    float _2778 = _2726;
    float _2780 = _2754;
    float _2782 = _2778;
    if (_2714)
    {
        float _2784 = fma(_2754, _2778, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2780 = _2784;
    }
    float _2786 = _2780;
    float _2788 = _2786;
    if (!_2714)
    {
        _2782 = _2704;
    }
    float _2790 = _2782;
    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2794 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2792);
    float _2796 = precise::clamp(_2794, 0.0, 1.0);
    float _2798 = _2790;
    if (_2714)
    {
        float _2800 = _2768 + (-1.0);
        _2762 = _2800;
    }
    float _2802 = _2762;
    float _2804 = _2802;
    if (_2714)
    {
        float _2806 = _2736 * _2786;
        _2558 = _2806;
    }
    float _2808 = _2558;
    if (!_2714)
    {
        _2788 = _2774;
    }
    float _2810 = _2788;
    float _2812 = _2810;
    if (_2714)
    {
        float _2814 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2804 = _2814;
    }
    float _2816 = _2804;
    float _2818 = _2816;
    if (_2714)
    {
        float _2820 = _2702 * _2808;
        _2728 = _2820;
    }
    float _2822 = _2728;
    if (!_2714)
    {
        _2738 = _2706;
    }
    float _2824 = _2738;
    float _2826 = _2824;
    if (_2714)
    {
        float _2828 = _2704 * _2808;
        _2798 = _2828;
    }
    float _2830 = _2798;
    if (_2714)
    {
        float _2832 = fma(_2774, _2768, _2816);
        _2812 = _2832;
    }
    float _2834 = _2812;
    if (_2714)
    {
        float _2836 = _2822 * _2822;
        _2826 = _2836;
    }
    float _2838 = _2826;
    if (!_2714)
    {
        _2818 = _2708;
    }
    float _2840 = _2818;
    float _2842 = _2840;
    if (_2714)
    {
        float _2844 = _2830 * _2830;
        _2842 = _2844;
    }
    float _2846 = _2842;
    float _2848 = -_2796;
    float _2850 = _2848 + 1.0;
    float _2852 = fma(_2834, _2834, _2838);
    float _2854 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2856 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2858 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2860 = _2852 + _2846;
    float _2862 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2854);
    float _2864 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2866 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2868 = rsqrt(_2860);
    float _2870 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2862);
    float _2872 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2864);
    float _2874 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2866);
    float _2876 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2856);
    float _2878 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2880 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2872);
    float _2882 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2874);
    float _2884 = abs(_2850);
    float _2886 = log2(_2884);
    float _2888 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2876);
    float _2890 = _2880 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2892 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2894 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2896 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2898 = -_2892;
    float _2900 = fma(_2898, _2858, 1.0);
    float _2902 = _2868 * _2822;
    float _2904 = _2888 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2906 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2896);
    float _2908 = _2868 * _2834;
    float _2910 = _2902 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2912 = _2868 * _2830;
    float _2914 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2906);
    float _2916 = log2(_2900);
    float _2918 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2920 = -_2910;
    float _2922 = fma(_2908, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2920);
    float _2924 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2914);
    float _2926 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2928 = -_2912;
    float _2930 = fma(_2928, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2922);
    float _2932 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2934 = exp2(_2918);
    float _2936 = fma(_2930, -0.5, 0.5);
    float _2938 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2932);
    float _2940 = _2908 + 1.0;
    float _2942 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2938);
    float _2944 = 1.0 / _2924;
    float _2946 = fma(_2930, 0.5, 0.5);
    float _2948 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2926);
    float _2950 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2942);
    float _2952 = _2916 * 0.693147182464599609375;
    float _2954 = fma(_2946, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2956 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2948);
    float _2958 = sqrt(_2936);
    float _2960 = -_2908;
    float _2962 = fma(_2934, _2940, _2960);
    float _2964 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2956);
    float _2966 = fma(_2946, _2954, -0.212114393711090087890625);
    float _2968 = fma(_2962, 0.5, 0.5);
    float _2970 = fma(_2946, _2966, 1.570728778839111328125);
    float _2972 = _2950 * _2944;
    float _2974 = _2964 * _2944;
    float _2976 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2978 = fma(_2972, 0.5, 0.5);
    float _2980 = fma(_2974, -0.5, 0.5);
    float _2982 = _2958 * 0.636619746685028076171875;
    float3 _7556 = float3(_2978, _2980, _2976);
    float _2984 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7556, float3(0.0), isnan(_7556)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7556, float3(0.0), isnan(_7556)), level(0.0)).x;
    float _2986 = -_2970;
    float _2988 = fma(_2982, _2986, 1.0);
    float3 _7572 = float3(_2978, _2980, _2976);
    float4 _2991 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7572, float3(0.0), isnan(_7572)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7572, float3(0.0), isnan(_7572)), level(0.0)).xyzw;
    float _2993 = _2991.x;
    float _2995 = _2991.y;
    float _2997 = _2991.z;
    float _2999 = _2991.w;
    float2 _7589 = float2(_2988, _2968);
    float3 _3003 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7589, float2(0.0), isnan(_7589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7589, float2(0.0), isnan(_7589)), level(0.0)).xyz;
    float _3005 = _3003.x;
    float _3007 = _3003.y;
    float _3009 = _3003.z;
    float _3011 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3013 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3015 = _2618 * _2676;
    bool _3017 = _2618 > 0.0;
    bool _3019 = isnan(_2618);
    bool _3021 = _3017 || _3019;
    bool _3023 = isnan(0.0);
    bool _3025 = _3021 || _3023;
    float _3027 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3011);
    float _3029 = _3015 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3031 = exp2(_3013);
    float _3033 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3027);
    bool _3035 = _2676 <= 0.0;
    bool _3037 = !_3025;
    bool _3039 = _3035 || _3037;
    float _3041 = _3029 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3043 = _2950 + _2924;
    float _3045 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3033);
    float _3047 = _2924 * 0.5;
    float _3049 = _3043 * 0.5;
    float _3051 = -_3031;
    float _3053 = _3051 + 1.0;
    out.m_45.x = _3041;
    float _3055 = _3053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3057 = _3045 + _2924;
    float _3059 = fma(_2964, -0.5, _3047);
    out.gl_Position.x = _2950;
    out.gl_Position.y = _2964;
    out.gl_Position.z = _3045;
    out.gl_Position.w = _2924;
    float _3061 = _3057 * 0.5;
    out.m_76.x = _3049;
    out.m_76.y = _3059;
    out.m_76.z = _3061;
    out.m_76.w = _2924;
    float _3063 = _3055 * _2984;
    float _3065 = -_3055;
    float _3067 = _3065 + 1.0;
    float _3069 = _2999 * _3063;
    float _3071 = _3009 * _3063;
    float _3073 = _2999 * _3067;
    float _3075 = fma(_3005, _3069, _2993);
    float _3077 = fma(_3007, _3069, _2995);
    float _3079 = fma(_2999, _3071, _2997);
    out.m_78.x = _3075;
    out.m_78.y = _3077;
    out.m_78.z = _3079;
    out.m_78.w = _3073;
    if (!_3039)
    {
        return out;
    }
    float _3081 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3081;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _535 = false;
    bool _337 = false;
    bool _235 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3138 = as_type<float>(_113);
        out.gl_Position.z = _3138;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3207 = as_type<float>(_151);
        out.gl_Position.z = _3207;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = in.m_52.x;
    float _157 = in.m_52.y;
    float _159 = in.m_52.z;
    float _161 = in.m_54.x;
    float _163 = in.m_54.y;
    float _165 = in.m_54.z;
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    int _179 = as_type<int>(_153) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_153) & 2;
    bool _185 = _183 != 0;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _189 = !_181;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_185;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _157 * _163;
    float _199 = _157 * _169;
    float _201 = fma(_155, _161, _197);
    float _203 = _157 * _175;
    float _205 = fma(_155, _167, _199);
    float _207 = fma(_159, _165, _201);
    float _209 = fma(_155, _173, _203);
    float _211 = fma(_159, _171, _205);
    float _213 = fma(_159, _177, _209);
    bool _215 = !_187;
    float _233;
    if (!_215)
    {
        float _217 = in.m_60.x;
        float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _225 = _223 * _219;
        float _227 = floor(_225);
        float _229 = -_227;
        float _231 = _225 + _229;
        _233 = _231;
        _235 = true;
    }
    else
    {
        float _237 = float(_97);
        float _239 = 1.0 / _237;
        float _241 = _131 * _239;
        _233 = _241;
    }
    _235 = false;
    float _243 = _233;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    bool _249 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _251 = isnan(_243);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _261;
    float _265 = -_259;
    float _267 = _265 + 1.0;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _281;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _263;
    float _289 = _279 * _267;
    float _291 = -_279;
    float _293 = _291 + 1.0;
    float _295 = _247 * _287;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _297;
    float _301 = fma(_283, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_299, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = _301 * _289;
    float _307 = _303 * _289;
    float _309 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _305);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _307);
    float _313 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].x, _309);
    float _315 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].y, _311);
    bool _317 = !_285;
    float _335;
    if (!_317)
    {
        float _319 = in.m_60.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        float _339 = float(_97);
        float _341 = 1.0 / _339;
        float _343 = _131 * _341;
        _335 = _343;
    }
    _337 = false;
    float _345 = _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _349 = _345 + _347;
    float _351 = in.m_62.x;
    float _353 = in.m_62.y;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _363 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _365 = isnan(_345);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _379 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _381 = isnan(_345);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = 1.0 / _357;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _393;
    float _397 = -_373;
    float _399 = _397 + 1.0;
    bool _401 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _403 = isnan(_345);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    bool _413 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _415 = 1.0 / _361;
    float _417 = 1.0 / _377;
    float _419 = _395 * _391;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _425 = _389 * _399;
    float _427 = -_389;
    float _429 = _427 + 1.0;
    float _431 = fma(_419, _349, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _433;
    float _437 = _315 * _353;
    float _439 = _411 * _429;
    float _441 = _423 * _415;
    bool _443 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _445 = isnan(_345);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _345 + _455;
    float _459 = _431 * _439;
    float _461 = -_411;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = _345 + _465;
    float _469 = fma(_441, _457, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _471 = _435 * _417;
    float _473 = -_453;
    float _475 = _473 + 1.0;
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[115].x, _459);
    float _479 = fma(_471, _467, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _481 = _373 * _475;
    float _483 = fma(_469, _425, _477);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _487 = _313 * _351;
    float _489 = fma(_479, _481, _483);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[118].x, _489);
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _495 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _503 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _493;
    out.m_64.y = _499;
    out.m_64.z = _503;
    out.m_64.w = _501;
    bool _505 = !_413;
    float _529;
    float _531;
    float _533;
    if (!_505)
    {
        float _507 = in.m_60.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _511 = float(_97);
        float _513 = 1.0 / _511;
        float _515 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _517 = _131 * _513;
        float _519 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _521 = _519 * _509;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _517;
        _531 = _527;
        _533 = _511;
        _535 = true;
    }
    else
    {
        float _537 = float(_97);
        float _539 = 1.0 / _537;
        float _541 = _131 * _539;
        _529 = _541;
        _531 = _541;
        _533 = _537;
    }
    _535 = false;
    float _543 = _529;
    float _545 = _531;
    float _547 = _533;
    float _549 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _551 = int(_549);
    float _553 = in.m_60.x;
    float _555 = in.m_60.y;
    float _557 = in.m_60.z;
    float _559 = in.m_60.w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _563 = _543 + _561;
    float _565 = in.m_42.x;
    float _567 = in.m_42.y;
    float _569 = in.m_42.z;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _573 = _543 + _571;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _577 = int(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _593 = _543 + _591;
    float _595 = 1.0 / _585;
    float _597 = float(_551);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _613 = _543 + _611;
    float _615 = 1.0 / _597;
    bool _617 = _559 > 0.5;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _637 = _635 != 0;
    float _639 = _175 * _567;
    float _641 = float(uint(_577));
    float _643 = _163 * _567;
    float _645 = -_195;
    int _647 = _617 ? as_type<int>(_645) : as_type<int>(_195);
    float _649 = _169 * _567;
    bool _651 = !_633;
    int _653 = _651 ? 0 : 1;
    float _655 = 1.0 / _641;
    bool _657 = _553 > 0.5;
    float _659 = fma(_161, _565, _643);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _663 = _661 != 0;
    float _665 = _615 * _131;
    float _667 = -_191;
    int _669 = _657 ? as_type<int>(_667) : as_type<int>(_191);
    float _671 = fma(_167, _565, _649);
    float _673 = _553 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _675 = !_663;
    float _677 = _675 ? _191 : as_type<float>(_669);
    float _679 = trunc(_665);
    int _681 = int(_679);
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _685 = !_629;
    int _687 = _685 ? 0 : 1;
    float _689 = fma(_173, _565, _639);
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _693 = _691 != 0;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _697 = _555 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _701 = _699 != 0;
    float _703 = 1.0 / _589;
    bool _705 = !_625;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_697, -2.0, _695);
    bool _711 = !_693;
    int _713 = _711 ? 0 : 1;
    float _715 = fma(_171, _569, _671);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _719 = _717 != 0;
    float _721 = -_683;
    float _723 = fma(_673, 2.0, _721);
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _727 = _725 != 0;
    float _729 = 1.0 / _601;
    bool _731 = _555 > 0.5;
    float _733 = fma(_177, _569, _689);
    int _735 = as_type<int>(_655) + (-2);
    float _737 = _553 * 2.0;
    float _739 = float(uint(_681));
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _743 = _545 + _741;
    bool _745 = !_701;
    float _747 = _745 ? _195 : as_type<float>(_647);
    float _749 = 1.0 / _581;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = fma(_165, _569, _659);
    float _765 = as_type<float>(_735) * _739;
    float _767 = _743 * _595;
    float _769 = -_195;
    int _771 = _731 ? as_type<int>(_769) : as_type<int>(_195);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _775 = _545 + _773;
    float _777 = 1.0 / _605;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _783 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _709);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _789 = !_637;
    int _791 = _789 ? 0 : 1;
    float _793 = floor(_737);
    float _795 = _775 * _749;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _805 = _799 * _729;
    int _807 = ~_577;
    int _809 = _807 + 1;
    float _811 = 1.0 / _609;
    bool _813 = !_719;
    float _815 = _813 ? _195 : as_type<float>(_771);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _817;
    bool _821 = _557 > 0.5;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _829 = _827 != 0;
    float _831 = _819 * _703;
    float _833 = 1.0 / _621;
    float _835 = -_191;
    int _837 = _821 ? as_type<int>(_835) : as_type<int>(_191);
    float _839 = _825 * _777;
    bool _841 = _793 >= 0.0;
    bool _843 = isnan(_793);
    bool _845 = _841 || _843;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _851;
    float _855 = fma(_805, _563, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _857 = _849 ? 0 : 1;
    float _859 = trunc(_765);
    float _861 = precise::max(_859, 0.0);
    uint _864 = uint(_861);
    float _866 = _803 * _811;
    float _868 = _555 * 2.0;
    bool _870 = _793 > 0.0;
    float _872 = fma(_831, _593, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    int _874 = ~_857;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = fma(_866, _573, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _882 = !_829;
    float _884 = _882 ? 1.2345600128173828125 : 1.0;
    float _886 = 1.0 / _781;
    float _888 = _853 * _833;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _894 = in.m_54.w;
    float _896 = float(_577);
    float _898 = 1.0 / _787;
    int _900 = _809 * int(_864);
    int _902 = _900 + _681;
    int _904 = _878;
    if (!_870)
    {
        int _906 = ~_857;
        int _908 = _906 + 1;
        _904 = _908;
    }
    int _910 = _904;
    float _912 = float(uint(_902));
    float _914 = floor(_868);
    float _916 = _892 * _886;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _918;
    float _922 = _896 * _131;
    float _924 = fma(_916, _613, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _926 = 1.0 / _547;
    int _928 = abs(_713);
    float _930 = _763 + _894;
    int _932 = abs(_653);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _934;
    bool _938 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _940 = isnan(_543);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = _920 * _898;
    float _952 = as_type<float>(_735) * _912;
    bool _954 = _914 >= 0.0;
    bool _956 = isnan(_914);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.0);
    bool _962 = _958 || _960;
    float _964 = _555 + _557;
    bool _966 = !_829;
    float _968 = _966 ? _555 : _553;
    float _970 = trunc(_952);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    float _976 = _962 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _978 = _964 + (-1.0);
    bool _980 = _914 > 0.0;
    float _982 = _555 + _553;
    float _984 = _884 * _968;
    int _986 = ~_577;
    int _988 = _986 + 1;
    float _990 = _922 * _926;
    float _992 = _982 + (-1.0);
    int _994 = ~as_type<int>(_976);
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    float _1000 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1002 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1004 = _557 * 2.0;
    float _1006 = trunc(_990);
    int _1008 = int(_1006);
    int _1010 = int(_864) + int(_974);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1014 = _998;
    float _1016 = as_type<float>(_988);
    float _1018 = _976;
    if (!_980)
    {
        int _1020 = ~as_type<int>(_976);
        int _1022 = _1020 + 1;
        _1014 = _1022;
    }
    int _1024 = _1014;
    if (!_829)
    {
        _1016 = _557;
    }
    float _1026 = _1016;
    int _1028 = _988 * _1010;
    int _1030 = _1028 + _681;
    float _1032 = floor(_1004);
    float _1034 = _1026;
    if (_829)
    {
        _1034 = _555;
    }
    float _1036 = _1034;
    float _1038 = 0.0;
    if (!_829)
    {
        _1038 = _557;
    }
    float _1040 = _1038;
    bool _1042 = uint(_1030) >= uint(_577);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1044;
    float _1048 = _1040;
    if (_829)
    {
        _1048 = _555;
    }
    float _1050 = _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1052;
    float _1056 = fma(_1046, _795, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1062 = !_1042;
    int _1064 = _1062 ? 0 : (-1);
    float _1066 = fma(_1054, _795, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1068 = fma(_936, _795, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1074 = floor(_984);
    bool _1076 = _1032 > 0.0;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1082 = _1032 >= 0.0;
    bool _1084 = isnan(_1032);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = fma(_1072, _767, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1094 = float(_681);
    float _1096 = fma(_1060, _767, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1100 = _543 + _1098;
    float _1102 = fma(_1080, _767, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1104 = _1094 >= _896;
    bool _1106 = isnan(_1094);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(_896);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = in.m_56.w;
    float _1118 = fma(_839, _1100, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _1120 = ~_1010;
    int _1122 = _1120 + _1064;
    int _1124 = _1122 + 1;
    float _1126 = trunc(_1114);
    int _1128 = int(_1126);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1132 = _543 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1136 = _543 + _1134;
    float _1138 = -_1074;
    float _1140 = _984 + _1138;
    int _1142 = ~_577;
    int _1144 = _1142 + 1;
    float _1146 = in.m_58.w;
    float _1148 = fma(_950, _1132, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1150 = _1140 * _896;
    int _1152 = _577 * _1124;
    int _1154 = _1152 + _681;
    int _1156 = _1090 ? 0 : 1;
    float _1158 = trunc(_1150);
    int _1160 = int(_1158);
    bool _1162 = _577 == 0;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1166 = fma(_888, _1136, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1168 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1170 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1164);
    int _1172 = ~_1128;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_1162;
    int _1180 = _1178 ? _1154 : (-1);
    float _1182 = _715 + _1116;
    int _1184 = abs(_687);
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1188 = _1180 * _1176;
    int _1190 = _577 + (-1);
    float _1192 = fma(_1168, -2.0, _1186);
    if (!_829)
    {
        _1018 = _555;
    }
    float _1194 = _1018;
    float _1196 = _733 + _1146;
    int _1198 = abs(_707);
    int _1200 = _1128 * _1190;
    int _1202 = _1200 + _1188;
    int _1204 = _1160 * _928;
    int _1206 = _1204 + _681;
    bool _1208 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1210 = isnan(_545);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    int _1220 = _1202 * _1184;
    bool _1222 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1224 = isnan(_545);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1230 = _1226 || _1228;
    float _1232 = float(_1230);
    float _1234 = -_1218;
    float _1236 = _1234 + 1.0;
    bool _1238 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1240 = isnan(_545);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    int _1250 = _1008 * _1198;
    int _1252 = _1250 + _1220;
    float _1254 = _1232 * _1236;
    float _1256 = -_1232;
    float _1258 = _1256 + 1.0;
    int _1260 = abs(_791);
    int _1262 = _1206 * _932;
    int _1264 = _1262 + _1252;
    bool _1266 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1268 = isnan(_543);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = _1248 * _1258;
    bool _1280 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1282 = isnan(_543);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    int _1292 = _1160 * _1260;
    int _1294 = _1292 + _1264;
    bool _1296 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1298 = isnan(_543);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = -_1276;
    float _1310 = _1308 + 1.0;
    float _1312 = _1066 * _1278;
    float _1314 = -_1290;
    float _1316 = _1314 + 1.0;
    float _1318 = float(uint(_1294));
    float _1320 = _1056 * _1278;
    float _1322 = _1068 * _1278;
    float _1324 = _1290 * _1310;
    bool _1326 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1328 = isnan(_543);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1306 * _1316;
    float _1340 = -_1306;
    float _1342 = _1340 + 1.0;
    float _1344 = as_type<float>(_735) * _1318;
    bool _1346 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1348 = isnan(_543);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1012);
    bool _1360 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1362 = isnan(_543);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    float _1372 = _1336 * _1342;
    bool _1374 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1376 = isnan(_543);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -_1336;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1358);
    float _1392 = trunc(_1344);
    float _1394 = precise::max(_1392, 0.0);
    uint _1396 = uint(_1394);
    float _1398 = -_1370;
    float _1400 = _1398 + 1.0;
    float _1402 = _1390 * (-0.15915493667125701904296875);
    float _1404 = _1384 * _1388;
    float _1406 = -_1384;
    float _1408 = _1406 + 1.0;
    float _1410 = _1356 * _1400;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1414 = _1402 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = _1370 * _1408;
    float _1420 = -_1356;
    float _1422 = _1420 + 1.0;
    float _1424 = _1194;
    if (_829)
    {
        _1424 = _553;
    }
    float _1426 = _1424;
    float _1428 = _948 * _1422;
    float _1430 = -_948;
    float _1432 = _1430 + 1.0;
    int _1434 = _1144 * int(_1396);
    int _1436 = _1434 + _1294;
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = sin(_1438);
    float _1442 = _855 * _1428;
    int _1444 = ~_1156;
    int _1446 = _1444 + 1;
    int _1448 = _1446 + 1;
    float _1450 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1412);
    float _1452 = float(uint(_1436));
    float _1454 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1442);
    int _1456 = _1448;
    if (!_1076)
    {
        int _1458 = ~_1156;
        int _1460 = _1458 + 1;
        _1456 = _1460;
    }
    int _1462 = _1456;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1466 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1468 = log2(_1466);
    float _1470 = as_type<float>(_735) * _1452;
    float _1472 = -_1248;
    float _1474 = _1472 + 1.0;
    float _1476 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1478 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1450);
    float _1480 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1320);
    float _1482 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1312);
    float _1484 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1322);
    float _1486 = trunc(_1470);
    float _1488 = precise::max(_1486, 0.0);
    uint _1490 = uint(_1488);
    float _1492 = fma(_1096, _1254, _1480);
    float _1494 = fma(_1092, _1254, _1482);
    float _1496 = _815 * _1440;
    float _1498 = _815 * _1416;
    float _1500 = fma(_1102, _1254, _1484);
    float _1502 = _1468 * _131;
    float _1504 = -_1496;
    float _1506 = fma(_677, _1416, _1504);
    float _1508 = fma(_677, _1440, _1498);
    float _1510 = exp2(_1502);
    float _1512 = fma(_880, _1410, _1454);
    bool _1514 = !_727;
    float _1516 = _1514 ? _191 : as_type<float>(_837);
    float _1518 = -_1464;
    float _1520 = fma(_1476, 2.0, _1518);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1526 = 1.0 + _1524;
    float _1528 = _1516 + 0.5;
    bool _1530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1532 = isnan(1.0);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1538 = _1534 || _1536;
    float _1540 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1522);
    bool _1542 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1550 = _1546 || _1548;
    float _1552 = 1.0 / _1526;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1556 = int(_1396) + int(_1490);
    float _1558 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1540);
    int _1560 = ~_577;
    int _1562 = _1560 + 1;
    float _1564 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1554);
    float _1566 = -_1510;
    float _1568 = _1566 + 1.0;
    float _1570 = -_131;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[76].x, _723);
    float _1574 = -_131;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1520);
    float _1578 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1564);
    int _1580 = _1562 * _1556;
    int _1582 = _1580 + _1294;
    float _1584 = _1550 ? _1568 : 0.0;
    float _1586 = _747 + (-0.5);
    float _1588 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1192);
    float _1590 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1170);
    float _1592 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1576);
    if (_1538)
    {
        float _1594 = _1584 * _1552;
        _135 = _1594;
    }
    float _1596 = _135;
    bool _1598 = !_757;
    int _1600 = _1598 ? 0 : 1;
    float _1602 = -_1586;
    float _1604 = -_1588;
    float _1606 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1604);
    bool _1608 = uint(_1582) >= uint(_577);
    float _1610 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1494);
    bool _1612 = !_753;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1492);
    int _1618 = abs(_1600);
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1622 = !_1608;
    int _1624 = _1622 ? 0 : (-1);
    float _1626 = -_1590;
    float _1628 = _1626 + 1.0;
    int _1630 = abs(_1614);
    float _1632 = fma(_872, _1418, _1512);
    float _1634 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1500);
    int _1636 = ~_1556;
    int _1638 = _1636 + _1624;
    int _1640 = _1638 + 1;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1644 = float(_1462);
    float _1646 = fma(_1118, _1404, _1632);
    float _1648 = float(_1630);
    int _1650 = _577 * _1640;
    int _1652 = _1650 + _1294;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1656 = _1182 + _1654;
    float _1658 = float(_1618);
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1662 = _930 + _1660;
    float _1664 = float(_910);
    float _1666 = _1648 * _1644;
    bool _1668 = !_1162;
    int _1670 = _1668 ? _1652 : (-1);
    float _1672 = in.m_66.x;
    float _1674 = in.m_66.y;
    float _1676 = in.m_66.z;
    float _1678 = _1656 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1680 = float(uint(_1206));
    float _1682 = _1658 * _1664;
    int _1684 = _1670 >> 31;
    float _1686 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1678);
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1690 = _1196 + _1688;
    float _1692 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1694 = as_type<float>(_735) * _1680;
    int _1696 = _1684 & 3;
    float _1698 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1686);
    float _1700 = _1508 + (-0.5);
    float _1702 = _1506 + 0.5;
    int _1704 = _1670 + _1696;
    float _1706 = trunc(_1694);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    bool _1712 = _1698 >= 0.0;
    float _1714 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1716 = _1704 >> 2;
    float _1718 = -_1692;
    float _1720 = -_783;
    float _1722 = fma(_1718, _1700, _1720);
    float _1724 = _1666 * (-2.0);
    float _1726 = fma(_1714, _1702, _1572);
    int _1728 = _1716 << 4;
    int _1730 = _1728 + 512;
    float _1732 = fma(_1166, _1372, _1646);
    int _1734 = ~_577;
    int _1736 = _1734 + 1;
    float _1738 = fma(_1724, _1672, _1672);
    uint _1740 = uint(int(uint(_1730) >> uint(2)));
    uint _1742 = uint(int(uint(int(_1740)) >> uint(2)));
    int _1744 = int(_1740) & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    int _1748 = int(_1740) + 1;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    int _1752 = _1748 & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    float _1756 = _1682 * (-2.0);
    float _1758 = fma(_1000, _1724, _1000);
    int _1760 = _1670 & 3;
    bool _1762 = _1760 != 0;
    float _1764 = -_1478;
    float _1766 = _1764 + 1.0;
    int _1768 = _1670 & 3;
    bool _1770 = _1768 != 0;
    float _1772 = fma(_1002, _1756, _1002);
    float _1774 = fma(_1756, _1674, _1674);
    int _1776 = _1736 * int(_1710);
    int _1778 = _1776 + _1206;
    int _1780 = _1730 + 8;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    uint _1784 = uint(int(uint(int(_1782)) >> uint(2)));
    int _1786 = int(_1782) & 3;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[int(_1784)][_1786];
    int _1790 = int(_1782) + 1;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    int _1794 = _1790 & 3;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[int(_1792)][_1794];
    int _1798 = _1762 ? 0 : 1;
    float _1800 = -_1558;
    float _1802 = _1800 + 1.0;
    bool _1804 = uint(_1768) > 1u;
    float _1806 = fma(_924, _1338, _1732);
    float _1808 = float(uint(_1778));
    float _1810 = -_1802;
    float _1812 = fma(_1506, _1810, _1726);
    int _1814 = ~_1798;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = -_1766;
    float _1822 = fma(_1516, _1820, _1592);
    bool _1824 = !_1770;
    int _1826 = _1824 ? 0 : 1;
    float _1828 = as_type<float>(_735) * _1808;
    float _1830 = -_1578;
    float _1832 = _1830 + 1.0;
    float _1834 = fma(_747, _1628, _1606);
    float _1836 = trunc(_1828);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    int _1842 = ~_577;
    int _1844 = _1842 + 1;
    float _1846 = fma(_1508, _1832, _1722);
    int _1848 = _1818;
    if (!_1804)
    {
        int _1850 = ~_1798;
        int _1852 = _1850 + 1;
        _1848 = _1852;
    }
    int _1854 = _1848;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1858 = uint(_1768) >= 2u;
    float _1860 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1862 = abs(_1854);
    float _1864 = _1616 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1866 = _1858 ? 0 : 1;
    float _1868 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1870 = _1768 != 3;
    out.m_68.x = _1812;
    out.m_68.y = _1846;
    out.m_68.z = _1822;
    out.m_68.w = _1834;
    int _1872 = abs(_1826);
    float _1874 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1878 = _1876 != 0;
    float _1880 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1882 = int(_1710) + int(_1840);
    float _1884 = _1868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1886 = fma(_1148, _1324, _1806);
    int _1888 = ~_1866;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = _1892;
    if (_1712)
    {
        out.m_45.x = 0.0;
    }
    int _1896 = ~_1862;
    int _1898 = _1896 + 1;
    int _1900 = _1898 + 1;
    int _1902 = _1844 * _1882;
    int _1904 = _1902 + _1206;
    if (_1870)
    {
        int _1906 = ~_1866;
        int _1908 = _1906 + 1;
        _1894 = _1908;
    }
    int _1910 = _1894;
    out.m_70.x = _1874;
    out.m_70.y = _1880;
    out.m_70.z = _1884;
    out.m_70.w = _1856;
    int _1912 = _1900 * as_type<int>(_1754);
    bool _1914 = _1768 != 3;
    float _1916 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1886);
    bool _1918 = !_1878;
    int _1920 = _1918 ? 0 : 1;
    int _1922 = abs(_1910);
    int _1924 = ~_1872;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    out.m_72.x = _1916;
    bool _1930 = !_1914;
    int _1932 = _1930 ? 0 : (-1);
    bool _1934 = uint(_1904) >= uint(_577);
    int _1936 = _1928 * as_type<int>(_1746);
    int _1938 = _1936 + _1912;
    int _1940 = abs(_1920);
    int _1942 = ~_1922;
    int _1944 = _1942 + 1;
    int _1946 = _1944 + 1;
    int _1948 = abs(_1932);
    bool _1950 = !_1934;
    int _1952 = _1950 ? 0 : (-1);
    int _1954 = _1946 * as_type<int>(_1788);
    int _1956 = _1954 + _1938;
    float _1958 = _1656 * _1656;
    int _1960 = ~_1940;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = ~_1882;
    int _1968 = _1966 + _1952;
    int _1970 = _1968 + 1;
    float _1972 = fma(_1662, _1662, _1958);
    int _1974 = ~_1948;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = _577 * _1970;
    int _1982 = _1980 + _1206;
    int _1984 = _1978 * as_type<int>(_1796);
    int _1986 = _1984 + _1956;
    float _1988 = fma(_1690, _1690, _1972);
    float _1990 = _553 + (-0.5);
    bool _1992 = !_1162;
    int _1994 = _1992 ? _1982 : (-1);
    int _1996 = _1986 * _1964;
    float _1998 = as_type<float>(_1964);
    if (_1712)
    {
        _1998 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2000 = _1998;
    float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1738);
    float _2004 = rsqrt(_1988);
    int _2006 = _1994 * _1940;
    int _2008 = _2006 + _1996;
    float _2010 = _555 + (-0.5);
    bool _2012 = !_761;
    int _2014 = _2012 ? 0 : 1;
    int _2016 = as_type<int>(_2000);
    if (_1712)
    {
        float _2018 = _2000 * 5.0;
        _2016 = as_type<int>(_2018);
    }
    int _2020 = _2016;
    float _2022 = fma(_2010, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1774);
    int _2024 = abs(_2014);
    float _2026 = fma(_1758, _1596, _2002);
    float _2028 = float(_2008);
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6048 = as_type<float>(_2020);
        out.gl_Position.z = _6048;
    }
    float _2030 = float(_2024);
    out.m_74.y = _2028;
    float _2032 = _1656 * _2004;
    float _2034 = _1662 * _2004;
    float _2036 = _1690 * _2004;
    float _2038 = -_2032;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1656);
    float _2042 = _2034;
    if (_1712)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2044 = -_2032;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _2048 = -_2034;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _930);
    float _2052 = float(_1024);
    float _2054 = -_2034;
    float _2056 = fma(_2054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1662);
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2060 = _2046 + _2058;
    float _2062 = -_2036;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1196);
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2068 = _2050 + _2066;
    float _2070 = _2040 * _2040;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2074 = _557 + _553;
    float _2076 = _2030 * _2052;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2080 = _2064 + _2078;
    float _2082 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2072);
    float _2084 = fma(_2056, _2056, _2070);
    float _2086 = _2074 + (-1.0);
    float _2088 = _2076 * (-2.0);
    float _2090 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2082);
    float _2092 = _557 + (-0.5);
    float _2094 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2096 = fma(_2088, _1676, _1676);
    float _2098 = -_2036;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1690);
    bool _2102 = _2090 >= 0.0;
    float _2104 = fma(_2094, _2088, _2094);
    float _2106 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2096);
    float _2108 = fma(_2100, _2100, _2084);
    float _2110 = fma(_1772, _1596, _2022);
    float _2112 = _2026 * 0.15915493667125701904296875;
    float _2114 = fma(_2104, _1596, _2106);
    float _2116 = _2110 * 0.15915493667125701904296875;
    float _2118 = sqrt(_2108);
    float _2120 = _2114 * 0.15915493667125701904296875;
    float _2122 = _2092;
    float _2124 = _2068;
    if (_2102)
    {
        _2122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2126 = _2122;
    int _2128 = as_type<int>(_2126);
    if (_2102)
    {
        out.m_45.x = 0.0;
    }
    float _2130 = _2112 * 6.283185482025146484375;
    float _2132 = sin(_2130);
    if (_2102)
    {
        float _2134 = _2126 * 5.0;
        _2128 = as_type<int>(_2134);
    }
    int _2136 = _2128;
    if (_2102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6237 = as_type<float>(_2136);
        out.gl_Position.z = _6237;
    }
    float _2138 = _2112 * 6.283185482025146484375;
    float _2140 = cos(_2138);
    float _2142 = _2004 * _2118;
    float _2144 = _2116 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = _2116 * 6.283185482025146484375;
    float _2150 = cos(_2148);
    float _2152 = _2120 * 6.283185482025146484375;
    float _2154 = sin(_2152);
    if (_2102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2156 = _2120 * 6.283185482025146484375;
    float _2158 = cos(_2156);
    float _2160 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2164 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _2168 = _2142 * _2160;
    float _2170 = _2132 * _2146;
    float _2172 = _2142 * _2164;
    float _2174 = _2140 * _2146;
    float _2176 = _2162 * _2168;
    float _2178 = _2140 * _2150;
    float _2180 = _2166 * _2172;
    float _2182 = _2132 * _2150;
    float _2184 = fma(_2154, _2178, _2170);
    float _2186 = fma(_2154, _2170, _2178);
    float _2188 = _2158 * _2176;
    float _2190 = _2140 * _2188;
    float _2192 = _2146 * _2158;
    float _2194 = _2150 * _2158;
    float _2196 = _2132 * _2188;
    float _2198 = fma(_2184, _2180, _2190);
    float _2200 = -_2176;
    float _2202 = _2154 * _2200;
    float _2204 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2206 = _2204 * 0.5;
    float _2208 = -_2182;
    float _2210 = fma(_2154, _2174, _2208);
    float _2212 = -_2174;
    float _2214 = fma(_2154, _2182, _2212);
    float _2216 = fma(_2194, _2180, _2202);
    float _2218 = fma(_2210, _2206, _2198);
    float _2220 = fma(_2214, _2180, _2196);
    float _2222 = fma(_2192, _2206, _2216);
    float _2224 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2226 = fma(_2186, _2206, _2220);
    float _2228 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2230 = _2218 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2232 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2234 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2228);
    float _2236 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2230);
    float _2238 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2232);
    float _2240 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2234);
    float _2242 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2236);
    float _2244 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2246 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2248 = _2242 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2250 = _1196 + _2244;
    float _2252 = _930 + _2246;
    float _2254 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2258 = _2250 + _2256;
    float _2260 = _1182 + _2248;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2264 = _2252 + _2262;
    float _2266 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2254);
    float _2268 = _2258 * _2258;
    float _2270 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2266);
    float _2272 = fma(_2264, _2264, _2268);
    float _2274 = sqrt(_2272);
    bool _2276 = _2274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2278 = _2248;
    float _2280 = _2230;
    float _2282 = _2266;
    if (!_2276)
    {
        _2278 = _2252;
    }
    float _2284 = _2278;
    float _2286 = _2284;
    if (!_2276)
    {
        _2280 = _2250;
    }
    float _2288 = _2280;
    float _2290 = _2288;
    if (!_2276)
    {
        _2282 = _2260;
    }
    float _2292 = _2282;
    bool _2294 = !_2276;
    float _2296 = _2292;
    if (!_2294)
    {
        float _2298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2302 = _2274 + _2300;
        float _2304 = rsqrt(_2272);
        float _2306 = _2302 * _2298;
        float _2308 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2310 = _2306 * 0.15915493667125701904296875;
        float _2312 = _2310 * 6.283185482025146484375;
        float _2314 = cos(_2312);
        float _2316 = _2310 * 6.283185482025146484375;
        float _2318 = sin(_2316);
        float _2320 = _2314 + (-1.0);
        float _2322 = fma(_2318, _2308, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2324 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2326 = _2304 * _2322;
        float _2328 = fma(_2260, _2314, _2324);
        float _2330 = fma(_2264, _2326, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2332 = fma(_2258, _2326, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2296 = _2328;
        _2286 = _2330;
        _2290 = _2332;
    }
    float _2334 = _2296;
    float _2336 = _2286;
    float _2338 = _2290;
    float _2340 = -_1182;
    float _2342 = _2340 + _2334;
    float _2344 = -_930;
    float _2346 = _2344 + _2336;
    float _2348 = -_1196;
    float _2350 = _2348 + _2338;
    float _2352 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2354 = _2342 * _2342;
    float _2356 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2358 = 1.0 / _2352;
    float _2360 = fma(_2346, _2346, _2354);
    bool _2362 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2364 = isnan(0.5);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2370 = _2366 || _2368;
    bool _2372 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2374 = isnan(0.5);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2380 = _2376 || _2378;
    float _2382 = fma(_2350, _2350, _2360);
    float _2384 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2356);
    float _2386 = sqrt(_2382);
    float _2388 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2384);
    float _2390 = _2388 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2392 = _2390 + _2352;
    float _2394 = _2392 * _2358;
    float _2396 = _2394 * 0.5;
    bool _2398 = _2386 > 0.0;
    float _2400 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2402 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2400);
    float _2404 = 1.0 / _2402;
    bool _2406 = !_2398;
    float _2408 = _2336;
    float _2410 = _2334;
    float _2412 = _2338;
    float _2414 = _2386;
    if (!_2406)
    {
        float _2416 = _211 * _211;
        float _2418 = fma(_207, _207, _2416);
        float _2420 = fma(_213, _213, _2418);
        float _2422 = rsqrt(_2382);
        float _2424 = sqrt(_2420);
        float _2426 = _2346 * _2422;
        float _2428 = _2342 * _2422;
        float _2430 = _2350 * _2422;
        bool _2432 = _2424 > 0.0;
        bool _2434 = !_2432;
        _2414 = _2422;
        if (!_2434)
        {
            float _2436 = rsqrt(_2420);
            float _2438 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2440 = _211 * _2436;
            float _2442 = _207 * _2436;
            float _2444 = _213 * _2436;
            float _2446 = _2428 * _2440;
            float _2448 = fma(_2426, _2442, _2446);
            float _2450 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2452 = fma(_2430, _2444, _2448);
            float _2454 = _2452 * _2450;
            float _2456 = fma(_207, _2454, _2336);
            float _2458 = fma(_211, _2454, _2334);
            float _2460 = fma(_213, _2454, _2338);
            _2408 = _2456;
            _2410 = _2458;
            _2412 = _2460;
            _2414 = _2454;
        }
    }
    float _2462 = _2408;
    float _2464 = _2410;
    float _2466 = _2412;
    float _2468 = _2414;
    float _2470 = -_2034;
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2462);
    float _2474 = -_2032;
    float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2464);
    float _2478 = -_2036;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2466);
    float _2482 = _2468;
    float _2484 = _2476;
    float _2486 = _2472;
    float _2488 = _2480;
    float _2490 = _2466;
    float _2492 = _2464;
    if (_2380)
    {
        _2482 = 1.0;
    }
    float _2494 = _2482;
    float _2496 = _2494;
    if (!_2370)
    {
        float _2498 = _2060 * _2060;
        float _2500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2502 = -_1196;
        float _2504 = _2502 + _2466;
        float _2506 = -_1182;
        float _2508 = _2506 + _2464;
        float _2510 = fma(_2068, _2068, _2498);
        float _2512 = fma(_2080, _2080, _2510);
        float _2514 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2516 = sqrt(_2512);
        float _2518 = 1.0 / _2142;
        float _2520 = precise::min(_2516, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2522 = _2520 * _2500;
        float _2524 = _2514 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2526 = -_930;
        float _2528 = _2526 + _2462;
        float _2530 = _2522 * _2518;
        float _2532 = _2524 * _2530;
        float _2534 = _2504 * _2530;
        float _2536 = fma(_2528, _2532, _2050);
        float _2538 = fma(_2508, _2532, _2046);
        float _2540 = fma(_2524, _2534, _2064);
        _2124 = _2532;
        _2484 = _2538;
        _2486 = _2536;
        _2488 = _2540;
        _2490 = _2534;
        _2492 = _2508;
    }
    float _2542 = _2124;
    float _2544 = _2484;
    float _2546 = _2486;
    float _2548 = _2488;
    float _2550 = _2490;
    float _2552 = _2492;
    float _2554 = _2552;
    float _2556 = _2542;
    float _2558 = _2550;
    if (_2380)
    {
        _2554 = 1.0;
    }
    float _2560 = _2554;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2564 = _2404 * _2562;
    float _2566 = _2560;
    if (!_2380)
    {
        float _2568 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2570 = _2568 * 0.15915493667125701904296875;
        float _2572 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2576 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2574;
        float _2578 = _2570 * 6.283185482025146484375;
        float _2580 = cos(_2578);
        float _2582 = _2572 * 0.15915493667125701904296875;
        float _2584 = _2570 * 6.283185482025146484375;
        float _2586 = sin(_2584);
        float _2588 = 1.0 / _2580;
        float _2590 = _2582 * 6.283185482025146484375;
        float _2592 = cos(_2590);
        float _2594 = _2586 * _2588;
        float _2596 = _2582 * 6.283185482025146484375;
        float _2598 = sin(_2596);
        float _2600 = _2592 * _2594;
        float _2602 = 1.0 / _2576;
        float _2604 = 1.0 / _2600;
        float _2606 = _2598 * _2604;
        float _2608 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2610 = fma(_2564, _2606, _2608);
        float _2612 = _2610 * _2602;
        float _2614 = precise::clamp(_2612, 0.0, 1.0);
        _2556 = _2582;
        _2496 = _2614;
    }
    float _2616 = _2556;
    float _2618 = _2496;
    float _2620 = _2616;
    if (!_2380)
    {
        float _2622 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2624 = _2622 * 0.15915493667125701904296875;
        float _2626 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2628 = _2624 * 6.283185482025146484375;
        float _2630 = cos(_2628);
        float _2632 = _2626 * 0.15915493667125701904296875;
        float _2634 = _2624 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        float _2638 = 1.0 / _2630;
        float _2640 = _2632 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        float _2644 = _2636 * _2638;
        float _2646 = _2632 * 6.283185482025146484375;
        float _2648 = sin(_2646);
        float _2650 = _2642 * _2644;
        float _2652 = 1.0 / _2650;
        float _2654 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2656 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2654;
        float _2658 = 1.0 / _2656;
        float _2660 = _2648 * _2652;
        float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2664 = fma(_2564, _2660, _2662);
        float _2666 = _2664 * _2658;
        float _2668 = precise::clamp(_2666, 0.0, 1.0);
        float _2670 = -_2668;
        float _2672 = _2670 + 1.0;
        _2620 = _2652;
        _2566 = _2672;
    }
    float _2674 = _2620;
    float _2676 = _2566;
    float _2678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2680 = _2544 + _2678;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2684 = _2546 + _2682;
    float _2686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2688 = _2548 + _2686;
    float _2690 = _2680 * _2680;
    float _2692 = fma(_2684, _2684, _2690);
    float _2694 = fma(_2688, _2688, _2692);
    float _2696 = rsqrt(_2694);
    float _2698 = sqrt(_2694);
    float _2700 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2702 = _2684 * _2700;
    float _2704 = _2688 * _2700;
    float _2706 = _2702 * _2702;
    float _2708 = _2704 * _2704;
    float _2710 = _2706 + _2708;
    float _2712 = sqrt(_2710);
    bool _2714 = _2712 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2718 = _2712 + _2716;
    float _2720 = _2674;
    float _2722 = _2710;
    float _2724 = _2718;
    float _2726 = _2680;
    float _2728 = _2702;
    if (_2714)
    {
        float _2730 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2720 = _2730;
    }
    float _2732 = _2720;
    if (_2714)
    {
        float _2734 = rsqrt(_2710);
        _2722 = _2734;
    }
    float _2736 = _2722;
    float _2738 = _2736;
    if (_2714)
    {
        float _2740 = _2718 * _2732;
        _2724 = _2740;
    }
    float _2742 = _2724;
    if (_2714)
    {
        float _2744 = _2742 * 0.15915493667125701904296875;
        _2042 = _2744;
    }
    float _2746 = _2042;
    float _2748 = _2688;
    if (_2714)
    {
        float _2750 = _2746 * 6.283185482025146484375;
        float _2752 = sin(_2750);
        _2748 = _2752;
    }
    float _2754 = _2748;
    float _2756 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2758 = precise::max(0.0, _2756);
    float _2760 = _2732;
    float _2762 = _2758;
    if (_2714)
    {
        float _2764 = _2746 * 6.283185482025146484375;
        float _2766 = cos(_2764);
        _2760 = _2766;
    }
    float _2768 = _2760;
    float _2770 = -_2700;
    float _2772 = -_2758;
    float _2774 = fma(_2680, _2770, _2772);
    if (_2714)
    {
        float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2726 = _2776;
    }
    float _2778 = _2726;
    float _2780 = _2754;
    float _2782 = _2778;
    if (_2714)
    {
        float _2784 = fma(_2754, _2778, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2780 = _2784;
    }
    float _2786 = _2780;
    float _2788 = _2786;
    if (!_2714)
    {
        _2782 = _2704;
    }
    float _2790 = _2782;
    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2794 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2792);
    float _2796 = precise::clamp(_2794, 0.0, 1.0);
    float _2798 = _2790;
    if (_2714)
    {
        float _2800 = _2768 + (-1.0);
        _2762 = _2800;
    }
    float _2802 = _2762;
    float _2804 = _2802;
    if (_2714)
    {
        float _2806 = _2736 * _2786;
        _2558 = _2806;
    }
    float _2808 = _2558;
    if (!_2714)
    {
        _2788 = _2774;
    }
    float _2810 = _2788;
    float _2812 = _2810;
    if (_2714)
    {
        float _2814 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2804 = _2814;
    }
    float _2816 = _2804;
    float _2818 = _2816;
    if (_2714)
    {
        float _2820 = _2702 * _2808;
        _2728 = _2820;
    }
    float _2822 = _2728;
    if (!_2714)
    {
        _2738 = _2706;
    }
    float _2824 = _2738;
    float _2826 = _2824;
    if (_2714)
    {
        float _2828 = _2704 * _2808;
        _2798 = _2828;
    }
    float _2830 = _2798;
    if (_2714)
    {
        float _2832 = fma(_2774, _2768, _2816);
        _2812 = _2832;
    }
    float _2834 = _2812;
    if (_2714)
    {
        float _2836 = _2822 * _2822;
        _2826 = _2836;
    }
    float _2838 = _2826;
    if (!_2714)
    {
        _2818 = _2708;
    }
    float _2840 = _2818;
    float _2842 = _2840;
    if (_2714)
    {
        float _2844 = _2830 * _2830;
        _2842 = _2844;
    }
    float _2846 = _2842;
    float _2848 = -_2796;
    float _2850 = _2848 + 1.0;
    float _2852 = fma(_2834, _2834, _2838);
    float _2854 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2856 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2858 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2860 = _2852 + _2846;
    float _2862 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2854);
    float _2864 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2866 = _2544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2868 = rsqrt(_2860);
    float _2870 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2862);
    float _2872 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2864);
    float _2874 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2866);
    float _2876 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2856);
    float _2878 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2880 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2872);
    float _2882 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2874);
    float _2884 = abs(_2850);
    float _2886 = log2(_2884);
    float _2888 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2876);
    float _2890 = _2880 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2892 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2894 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2896 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2898 = -_2892;
    float _2900 = fma(_2898, _2858, 1.0);
    float _2902 = _2868 * _2822;
    float _2904 = _2888 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2906 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2896);
    float _2908 = _2868 * _2834;
    float _2910 = _2902 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2912 = _2868 * _2830;
    float _2914 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2906);
    float _2916 = log2(_2900);
    float _2918 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2920 = -_2910;
    float _2922 = fma(_2908, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2920);
    float _2924 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2914);
    float _2926 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2928 = -_2912;
    float _2930 = fma(_2928, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2922);
    float _2932 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2934 = exp2(_2918);
    float _2936 = fma(_2930, -0.5, 0.5);
    float _2938 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2932);
    float _2940 = _2908 + 1.0;
    float _2942 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2938);
    float _2944 = 1.0 / _2924;
    float _2946 = fma(_2930, 0.5, 0.5);
    float _2948 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2926);
    float _2950 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2942);
    float _2952 = _2916 * 0.693147182464599609375;
    float _2954 = fma(_2946, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2956 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2948);
    float _2958 = sqrt(_2936);
    float _2960 = -_2908;
    float _2962 = fma(_2934, _2940, _2960);
    float _2964 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2956);
    float _2966 = fma(_2946, _2954, -0.212114393711090087890625);
    float _2968 = fma(_2962, 0.5, 0.5);
    float _2970 = fma(_2946, _2966, 1.570728778839111328125);
    float _2972 = _2950 * _2944;
    float _2974 = _2964 * _2944;
    float _2976 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2978 = fma(_2972, 0.5, 0.5);
    float _2980 = fma(_2974, -0.5, 0.5);
    float _2982 = _2958 * 0.636619746685028076171875;
    float3 _7556 = float3(_2978, _2980, _2976);
    float _2984 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7556, float3(0.0), isnan(_7556)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7556, float3(0.0), isnan(_7556)), level(0.0)).x;
    float _2986 = -_2970;
    float _2988 = fma(_2982, _2986, 1.0);
    float3 _7572 = float3(_2978, _2980, _2976);
    float4 _2991 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7572, float3(0.0), isnan(_7572)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7572, float3(0.0), isnan(_7572)), level(0.0)).xyzw;
    float _2993 = _2991.x;
    float _2995 = _2991.y;
    float _2997 = _2991.z;
    float _2999 = _2991.w;
    float2 _7589 = float2(_2988, _2968);
    float3 _3003 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7589, float2(0.0), isnan(_7589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7589, float2(0.0), isnan(_7589)), level(0.0)).xyz;
    float _3005 = _3003.x;
    float _3007 = _3003.y;
    float _3009 = _3003.z;
    float _3011 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3013 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3015 = _2618 * _2676;
    bool _3017 = _2618 > 0.0;
    bool _3019 = isnan(_2618);
    bool _3021 = _3017 || _3019;
    bool _3023 = isnan(0.0);
    bool _3025 = _3021 || _3023;
    float _3027 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3011);
    float _3029 = _3015 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3031 = exp2(_3013);
    float _3033 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3027);
    bool _3035 = _2676 <= 0.0;
    bool _3037 = !_3025;
    bool _3039 = _3035 || _3037;
    float _3041 = _3029 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3043 = _2950 + _2924;
    float _3045 = fma(_2904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3033);
    float _3047 = _2924 * 0.5;
    float _3049 = _3043 * 0.5;
    float _3051 = -_3031;
    float _3053 = _3051 + 1.0;
    out.m_45.x = _3041;
    float _3055 = _3053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3057 = _3045 + _2924;
    float _3059 = fma(_2964, -0.5, _3047);
    out.gl_Position.x = _2950;
    out.gl_Position.y = _2964;
    out.gl_Position.z = _3045;
    out.gl_Position.w = _2924;
    float _3061 = _3057 * 0.5;
    out.m_76.x = _3049;
    out.m_76.y = _3059;
    out.m_76.z = _3061;
    out.m_76.w = _2924;
    float _3063 = _3055 * _2984;
    float _3065 = -_3055;
    float _3067 = _3065 + 1.0;
    float _3069 = _2999 * _3063;
    float _3071 = _3009 * _3063;
    float _3073 = _2999 * _3067;
    float _3075 = fma(_3005, _3069, _2993);
    float _3077 = fma(_3007, _3069, _2995);
    float _3079 = fma(_2999, _3071, _2997);
    out.m_78.x = _3075;
    out.m_78.y = _3077;
    out.m_78.z = _3079;
    out.m_78.w = _3073;
    if (!_3039)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3081 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3081;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

